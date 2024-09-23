@implementation ARUISpriteTexture

- (MTLTexture)texture
{
  return self->_texture;
}

- (ARUISpriteTexture)initWithImage:(id)a3
{
  id v4;
  ARUISpriteTexture *v5;
  double v6;
  float v7;
  double v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  MTLTexture *texture;
  NSObject *v15;
  id v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ARUISpriteTexture;
  v5 = -[ARUISpriteTexture init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "size");
    v7 = v6;
    v5->_height = v7;
    objc_msgSend(v4, "size");
    *(float *)&v8 = v8;
    v5->_width = *(float *)&v8;
    v9 = MTLCreateSystemDefaultDevice();
    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDDB48]), "initWithDevice:", v9);
      v11 = objc_retainAutorelease(v4);
      v17 = 0;
      v12 = objc_msgSend(v10, "newTextureWithCGImage:options:error:", objc_msgSend(v11, "CGImage"), 0, &v17);
      v13 = v17;
      texture = v5->_texture;
      v5->_texture = (MTLTexture *)v12;

      if (v13)
      {
        arui_rings_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          -[ARUISpriteTexture initWithImage:].cold.1((uint64_t)v11, v13, v15);

      }
    }

  }
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  double v4;
  double v5;
  unint64_t v6;

  +[ARUIHashBuilder builder](ARUIHashBuilder, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = self->_height;
  objc_msgSend(v3, "appendFloat:", v4);
  *(float *)&v5 = self->_width;
  objc_msgSend(v3, "appendFloat:", v5);
  objc_msgSend(v3, "appendObject:", self->_texture);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  ARUISpriteTexture *v4;
  ARUISpriteTexture *v5;
  ARUISpriteTexture *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  float width;
  float v11;
  float height;
  float v13;
  MTLTexture *texture;
  MTLTexture *v15;

  v4 = (ARUISpriteTexture *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v4 == self)
    {
      LOBYTE(v8) = 1;
    }
    else
    {
      v5 = v4;
      v6 = v5;
      if (self->_texture)
      {
        v7 = 0;
      }
      else
      {
        -[ARUISpriteTexture texture](v5, "texture");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v9 == 0;

      }
      width = self->_width;
      -[ARUISpriteTexture width](v6, "width");
      if (ARUIFloatEqual(width, v11))
      {
        height = self->_height;
        -[ARUISpriteTexture height](v6, "height");
        v8 = ARUIFloatEqual(height, v13);
        if (v8 && !v7)
        {
          texture = self->_texture;
          -[ARUISpriteTexture texture](v6, "texture");
          v15 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v8) = texture == v15;

        }
      }
      else
      {
        LOBYTE(v8) = 0;
      }

    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (float)height
{
  return self->_height;
}

- (float)width
{
  return self->_width;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_texture, 0);
}

- (void)initWithImage:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_fault_impl(&dword_212DE7000, a3, OS_LOG_TYPE_FAULT, "Failed to load texture from image: %@, error: %@", (uint8_t *)&v6, 0x16u);

}

@end
