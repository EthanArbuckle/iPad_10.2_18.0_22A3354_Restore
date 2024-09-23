@implementation AVTRendererViewTransitionTechnique

- (AVTRendererViewTransitionTechnique)initWithSceneRenderer:(id)a3
{
  id v4;
  AVTRendererViewTransitionTechnique *v5;
  void *v6;
  os_unfair_lock_s *v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  SCNTechnique *technique;
  void *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)AVTRendererViewTransitionTechnique;
  v5 = -[AVTRendererViewTransitionTechnique init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorPixelFormat");
    +[AVTMetalHelper helperForDevice:]((uint64_t)AVTMetalHelper, v6);
    v7 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    +[AVTResourceLocator sharedResourceLocator]();
    v8 = (id *)objc_claimAutoreleasedReturnValue();
    -[AVTResourceLocator urlForFrameworkResourceAtPath:isDirectory:](v8, (uint64_t)CFSTR("ViewTransitionTechniqueGeneric.json"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v9, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v10, 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("passes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ScenePass"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v4, "antialiasingMode");
    if (v14 == 1)
      v15 = 2;
    else
      v15 = 1;
    if (v14 == 2)
      v16 = 4;
    else
      v16 = v15;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("samples"));

    objc_msgSend(MEMORY[0x1E0CD5A30], "techniqueWithDictionary:", v11);
    v18 = objc_claimAutoreleasedReturnValue();
    technique = v5->_technique;
    v5->_technique = (SCNTechnique *)v18;

    -[AVTMetalHelper library](v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCNTechnique setLibrary:](v5->_technique, "setLibrary:", v20);

  }
  return v5;
}

- (SCNTechnique)technique
{
  return self->_technique;
}

- (float)framebufferTextureOpacity
{
  return self->_framebufferTextureOpacity;
}

- (void)setFramebufferTextureOpacity:(float)a3
{
  id v4;

  if (self->_framebufferTextureOpacity != a3)
  {
    self->_framebufferTextureOpacity = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SCNTechnique setObject:forKeyedSubscript:](self->_technique, "setObject:forKeyedSubscript:", v4, CFSTR("opacity_symbol"));

  }
}

- (MTLTexture)snapshotTexture
{
  return self->_snapshotTexture;
}

- (void)setSnapshotTexture:(id)a3
{
  MTLTexture *v5;
  id v6;
  MTLTexture *v7;

  v5 = (MTLTexture *)a3;
  if (self->_snapshotTexture != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_snapshotTexture, a3);
    v6 = objc_alloc_init(MEMORY[0x1E0CD59C8]);
    objc_msgSend(v6, "setContents:", self->_snapshotTexture);
    -[SCNTechnique setObject:forKeyedSubscript:](self->_technique, "setObject:forKeyedSubscript:", v6, CFSTR("snapshot_symbol"));

    v5 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_technique, 0);
  objc_storeStrong((id *)&self->_snapshotTexture, 0);
}

@end
