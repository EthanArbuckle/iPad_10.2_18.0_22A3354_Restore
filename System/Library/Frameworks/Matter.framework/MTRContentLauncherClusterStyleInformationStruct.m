@implementation MTRContentLauncherClusterStyleInformationStruct

- (MTRContentLauncherClusterStyleInformationStruct)init
{
  MTRContentLauncherClusterStyleInformationStruct *v2;
  MTRContentLauncherClusterStyleInformationStruct *v3;
  NSString *imageURL;
  NSString *color;
  MTRContentLauncherClusterDimensionStruct *size;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRContentLauncherClusterStyleInformationStruct;
  v2 = -[MTRContentLauncherClusterStyleInformationStruct init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    imageURL = v2->_imageURL;
    v2->_imageURL = 0;

    color = v3->_color;
    v3->_color = 0;

    size = v3->_size;
    v3->_size = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRContentLauncherClusterStyleInformationStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;

  v4 = objc_alloc_init(MTRContentLauncherClusterStyleInformationStruct);
  objc_msgSend_imageURL(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setImageURL_(v4, v8, (uint64_t)v7);

  objc_msgSend_color(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setColor_(v4, v12, (uint64_t)v11);

  objc_msgSend_size(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSize_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: imageURL:%@; color:%@; size:%@; >"),
    v5,
    self->_imageURL,
    self->_color,
    self->_size);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(NSString *)imageURL
{
  objc_setProperty_nonatomic_copy(self, a2, imageURL, 8);
}

- (NSString)color
{
  return self->_color;
}

- (void)setColor:(NSString *)color
{
  objc_setProperty_nonatomic_copy(self, a2, color, 16);
}

- (MTRContentLauncherClusterDimensionStruct)size
{
  return self->_size;
}

- (void)setSize:(MTRContentLauncherClusterDimensionStruct *)size
{
  objc_setProperty_nonatomic_copy(self, a2, size, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
}

@end
