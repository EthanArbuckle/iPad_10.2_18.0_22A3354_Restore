@implementation ISGraphicSymbolResource

+ (id)graphicSymbolResourceWithRecipe:(id)a3 url:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  ISGraphicSymbolResource *v12;
  void *v13;
  ISGraphicSymbolResource *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[ISGraphicSymbolDescriptor descriptorFromGraphicSymbolRecipe:](ISGraphicSymbolDescriptor, "descriptorFromGraphicSymbolRecipe:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D3A7E8]);
    objc_msgSend(v7, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithSymbolName:bundleURL:", v9, v6);

    -[NSObject imageForDescriptor:](v10, "imageForDescriptor:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = [ISGraphicSymbolResource alloc];
      objc_msgSend(v7, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[ISGraphicSymbolResource initWithGraphicSymbolDescriptor:symbolName:url:](v12, "initWithGraphicSymbolDescriptor:symbolName:url:", v7, v13, v6);

    }
    else
    {
      _ISDefaultLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412546;
        v19 = v16;
        v20 = 2112;
        v21 = v6;

      }
      v14 = 0;
    }

  }
  else
  {
    _ISDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[ISGraphicSymbolResource graphicSymbolResourceWithRecipe:url:].cold.1((uint64_t)v5, (uint64_t)v6, v10);
    v14 = 0;
  }

  return v14;
}

+ (id)graphicSymbolResourceWithConfiguration:(id)a3 symbolName:(id)a4 url:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  ISGraphicSymbolResource *v16;
  void *v17;
  ISGraphicSymbolResource *v18;
  NSObject *v19;
  void *v20;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[ISGraphicSymbolDescriptor descriptorFromGraphicIconConfiguration:](ISGraphicSymbolDescriptor, "descriptorFromGraphicIconConfiguration:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setName:", v8);
    v12 = objc_alloc(MEMORY[0x1E0D3A7E8]);
    objc_msgSend(v11, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithSymbolName:bundleURL:", v13, v9);

    -[NSObject imageForDescriptor:](v14, "imageForDescriptor:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = [ISGraphicSymbolResource alloc];
      objc_msgSend(v11, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[ISGraphicSymbolResource initWithGraphicSymbolDescriptor:symbolName:url:](v16, "initWithGraphicSymbolDescriptor:symbolName:url:", v11, v17, v9);

    }
    else
    {
      _ISDefaultLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v11, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412802;
        v23 = v20;
        v24 = 2112;
        v25 = v9;
        v26 = 2112;
        v27 = v7;

      }
      v18 = 0;
    }

  }
  else
  {
    _ISDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v22 = 138412802;
      v23 = v7;
      v24 = 2112;
      v25 = v8;
      v26 = 2112;
      v27 = v9;
      _os_log_error_impl(&dword_1AA928000, v14, OS_LOG_TYPE_ERROR, "Failed to read config %@ - %@ - %@.", (uint8_t *)&v22, 0x20u);
    }
    v18 = 0;
  }

  return v18;
}

+ (id)defaultResource
{
  void *v2;
  ISGraphicSymbolResource *v3;
  void *v4;
  void *v5;
  ISGraphicSymbolResource *v6;

  +[ISGraphicSymbolDescriptor descriptorFromGraphicSymbolRecipe:](ISGraphicSymbolDescriptor, "descriptorFromGraphicSymbolRecipe:", MEMORY[0x1E0C9AA70]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [ISGraphicSymbolResource alloc];
  objc_msgSend(v2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ISGraphicSymbolResource initWithGraphicSymbolDescriptor:symbolName:url:](v3, "initWithGraphicSymbolDescriptor:symbolName:url:", v2, v4, v5);

  return v6;
}

- (ISGraphicSymbolResource)initWithGraphicSymbolDescriptor:(id)a3 symbolName:(id)a4 url:(id)a5
{
  id v8;
  id v9;
  id v10;
  ISGraphicSymbolResource *v11;
  uint64_t v12;
  IFGraphicSymbolDescriptor *descriptor;
  uint64_t v14;
  NSString *symbolName;
  uint64_t v16;
  NSURL *url;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ISGraphicSymbolResource;
  v11 = -[ISGraphicSymbolResource init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    descriptor = v11->_descriptor;
    v11->_descriptor = (IFGraphicSymbolDescriptor *)v12;

    v14 = objc_msgSend(v9, "copy");
    symbolName = v11->_symbolName;
    v11->_symbolName = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    url = v11->_url;
    v11->_url = (NSURL *)v16;

  }
  return v11;
}

- (id)imageForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v21;
  void *v22;
  uint64_t v23;

  height = a3.height;
  width = a3.width;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc(MEMORY[0x1E0D3A7E8]);
  -[ISGraphicSymbolResource symbolName](self, "symbolName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISGraphicSymbolResource url](self, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithSymbolName:bundleURL:", v9, v10);

  if (!v11)
  {
    _ISDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      -[ISGraphicSymbolResource symbolName](self, "symbolName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v17;

    }
    goto LABEL_9;
  }
  -[ISGraphicSymbolResource descriptor](self, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSize:", width, height);

  -[ISGraphicSymbolResource descriptor](self, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setScale:", a4);

  -[ISGraphicSymbolResource descriptor](self, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageForGraphicSymbolDescriptor:", v14);
  v15 = objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    _ISDefaultLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      -[ISGraphicSymbolResource symbolName](self, "symbolName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v19;

    }
LABEL_9:
    v16 = 0;
    goto LABEL_10;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7C0]), "initWithCGImage:scale:", -[NSObject CGImage](v15, "CGImage"), a4);
LABEL_10:

  return v16;
}

- (void)updateDescriptorWithImageDescriptor:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "appearance");
  -[ISGraphicSymbolResource descriptor](self, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAppearance:", v5);

  v7 = objc_msgSend(v4, "contrast");
  -[ISGraphicSymbolResource descriptor](self, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContrast:", v7);

  v9 = objc_msgSend(v4, "vibrancy");
  -[ISGraphicSymbolResource descriptor](self, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setVibrancy:", v9);

  v11 = objc_msgSend(v4, "layoutDirection");
  -[ISGraphicSymbolResource descriptor](self, "descriptor");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLayoutDirection:", v11);

}

- (IFGraphicSymbolDescriptor)descriptor
{
  return (IFGraphicSymbolDescriptor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDescriptor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)symbolName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSymbolName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

+ (void)graphicSymbolResourceWithRecipe:(os_log_t)log url:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1AA928000, log, OS_LOG_TYPE_ERROR, "Failed to read recipe %@ - %@.", (uint8_t *)&v3, 0x16u);
}

@end
