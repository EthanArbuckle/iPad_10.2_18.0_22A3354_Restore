@implementation ARUISpriteParticleRenderState

- (ARUISpriteParticleRenderState)initWithDevice:(id)a3 library:(id)a4
{
  id v6;
  id v7;
  ARUISpriteParticleRenderState *v8;
  ARUISpriteParticleRenderState *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ARUISpriteParticleRenderState;
  v8 = -[ARUISpriteParticleRenderState init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ARUISpriteParticleRenderState renderPipelineDescriptorFromLibrary:](v8, "renderPipelineDescriptorFromLibrary:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v6, "newRenderPipelineStateWithDescriptor:error:", v10, 0);
    -[ARUISpriteParticleRenderState setRenderPipelineState:](v9, "setRenderPipelineState:", v11);

  }
  return v9;
}

- (void)setRenderPipelineState:(id)a3
{
  objc_storeStrong((id *)&self->_renderPipelineState, a3);
}

- (MTLRenderPipelineState)renderPipelineState
{
  return self->_renderPipelineState;
}

- (id)renderPipelineDescriptorFromLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("vertex_sprite_particle_shader"));
  objc_msgSend(v5, "setVertexFunction:", v6);

  v7 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("fragment_sprite_particle_shader"));
  objc_msgSend(v5, "setFragmentFunction:", v7);

  objc_msgSend(v5, "colorAttachments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPixelFormat:", 80);

  objc_msgSend(v5, "configureForSourceOverBlending");
  -[ARUISpriteParticleRenderState name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLabel:", v10);

  return v5;
}

- (ARUISpriteParticleRenderState)initWithPipelineLibrary:(id)a3
{
  id v4;
  ARUISpriteParticleRenderState *v5;
  ARUISpriteParticleRenderState *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ARUISpriteParticleRenderState;
  v5 = -[ARUISpriteParticleRenderState init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[ARUISpriteParticleRenderState name](v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v4, "newRenderPipelineStateWithName:options:reflection:error:", v7, 0, 0, 0);

    -[ARUISpriteParticleRenderState setRenderPipelineState:](v6, "setRenderPipelineState:", v8);
  }

  return v6;
}

- (id)name
{
  return CFSTR("ARUISpriteParticleRenderState");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderPipelineState, 0);
}

@end
