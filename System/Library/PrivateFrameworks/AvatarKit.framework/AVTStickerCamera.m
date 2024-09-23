@implementation AVTStickerCamera

+ (id)stickerCameraCache
{
  if (stickerCameraCache_onceToken != -1)
    dispatch_once(&stickerCameraCache_onceToken, &__block_literal_global_6);
  return (id)stickerCameraCache_kCache;
}

void __38__AVTStickerCamera_stickerCameraCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)stickerCameraCache_kCache;
  stickerCameraCache_kCache = (uint64_t)v0;

}

+ (id)cameraFromDictionary:(id)a3 assetsPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  AVTStickerCamera *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v22;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectForKey:", CFSTR("scene"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingPathComponent:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v11, "standardizedURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@.%@"), v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "stickerCameraCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v14);
  v16 = (AVTStickerCamera *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CD5A10], "avt_nodeNamed:forSceneAtURL:options:error:", v9, v11, 0, &v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v22;
    v19 = v18;
    if (!v17 || v18)
    {
      avt_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        +[AVTStickerCamera cameraFromDictionary:assetsPath:].cold.1((uint64_t)v10, v19, v20);

      v16 = 0;
    }
    else
    {
      v16 = -[AVTStickerCamera initWithCameraNode:]([AVTStickerCamera alloc], "initWithCameraNode:", v17);
      objc_msgSend(v15, "setObject:forKey:", v16, v14);
      v19 = v17;
    }

  }
  return v16;
}

- (AVTStickerCamera)initWithCameraNode:(id)a3
{
  id v5;
  AVTStickerCamera *v6;
  AVTStickerCamera *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTStickerCamera;
  v6 = -[AVTStickerCamera init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_node, a3);

  return v7;
}

- (id)buildNode
{
  void *v2;
  void *v3;

  -[AVTStickerCamera node](self, "node");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "enumerateHierarchyUsingBlock:", &__block_literal_global_25);
  return v3;
}

void __29__AVTStickerCamera_buildNode__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "camera");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v2, "setCamera:", v3);

}

- (SCNNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
  objc_storeStrong((id *)&self->_node, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_node, 0);
}

+ (void)cameraFromDictionary:(NSObject *)a3 assetsPath:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1DD1FA000, a3, OS_LOG_TYPE_ERROR, "Error: could not load sticker camera scene at %@ with error: %@", (uint8_t *)&v6, 0x16u);

}

@end
