@implementation CMIStyleEngineDownscaledTextureSource

- (CMIStyleEngineDownscaledTextureSource)initWithSourceTexture:(id)a3 filter:(unint64_t)a4
{
  id v6;
  CMIStyleEngineDownscaledTextureSource *v7;
  CMIStyleEngineDownscaledTextureSource *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CMIStyleEngineDownscaledTextureSource;
  v7 = -[CMIStyleEngineDownscaledTextureSource init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_filter = a4;
    objc_storeWeak((id *)&v7->_sourceTexture, v6);
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[CMIStyleEngineDownscaledTextureSource sourceTexture](self, "sourceTexture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithSourceTexture:filter:", v5, -[CMIStyleEngineDownscaledTextureSource filter](self, "filter"));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  CMIStyleEngineDownscaledTextureSource *v4;
  CMIStyleEngineDownscaledTextureSource *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = (CMIStyleEngineDownscaledTextureSource *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[CMIStyleEngineDownscaledTextureSource filter](self, "filter");
      if (v6 == -[CMIStyleEngineDownscaledTextureSource filter](v5, "filter"))
      {
        -[CMIStyleEngineDownscaledTextureSource sourceTexture](self, "sourceTexture");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CMIStyleEngineDownscaledTextureSource sourceTexture](v5, "sourceTexture");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = cmisep_texturesAreIdentical(v7, v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  char v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[CMIStyleEngineDownscaledTextureSource filter](self, "filter");
  -[CMIStyleEngineDownscaledTextureSource sourceTexture](self, "sourceTexture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "iosurface");
  -[CMIStyleEngineDownscaledTextureSource sourceTexture](self, "sourceTexture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    v8 = objc_msgSend(v6, "iosurface");
  else
    v8 = objc_msgSend(v6, "hash");
  v9 = v8;

  return v9 ^ (0xABCDEF9876543210 << v3);
}

- (MTLTexture)sourceTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_sourceTexture);
}

- (unint64_t)filter
{
  return self->_filter;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceTexture);
}

@end
