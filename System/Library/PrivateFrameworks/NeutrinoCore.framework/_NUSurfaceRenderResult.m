@implementation _NUSurfaceRenderResult

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_NUImageRenderResult region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSurfaceRenderResult image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUSurfaceRenderResult image](self, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "validRegion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUImageRenderResult geometry](self, "geometry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> region=%@, image=%@ (%@), geometry=%@"), v4, self, v5, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NUSurfaceImage)image
{
  return (NUSurfaceImage *)objc_getProperty(self, a2, 32, 1);
}

- (void)setImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
