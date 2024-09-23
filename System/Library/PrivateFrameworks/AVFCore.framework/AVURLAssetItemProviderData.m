@implementation AVURLAssetItemProviderData

- (AVURLAssetItemProviderData)initWithURL:(id)a3 assetInitializationOptions:(id)a4
{
  AVURLAssetItemProviderData *v6;
  AVURLAssetItemProviderData *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVURLAssetItemProviderData;
  v6 = -[AVURLAssetItemProviderData init](&v9, sel_init);
  v7 = v6;
  if (a3 && v6)
  {
    v6->_securityScopedURLWrapper = (NSSecurityScopedURLWrapper *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3910]), "initWithURL:readonly:", a3, 1);
    v7->_assetInitializationOptions = (NSDictionary *)objc_msgSend(a4, "copy");
  }
  else
  {

    return 0;
  }
  return v7;
}

+ (id)itemProviderDataWithURL:(id)a3 assetInitializationOptions:(id)a4
{
  return -[AVURLAssetItemProviderData initWithURL:assetInitializationOptions:]([AVURLAssetItemProviderData alloc], "initWithURL:assetInitializationOptions:", a3, a4);
}

- (AVURLAssetItemProviderData)initWithCoder:(id)a3
{
  AVURLAssetItemProviderData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVURLAssetItemProviderData;
  v4 = -[AVURLAssetItemProviderData init](&v6, sel_init);
  if (v4)
  {
    v4->_securityScopedURLWrapper = (NSSecurityScopedURLWrapper *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AVURLAssetItemProviderURLWrapperKey"));
    v4->_assetInitializationOptions = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[AVURLAsset _initializationOptionsClasses](AVURLAsset, "_initializationOptionsClasses"), CFSTR("AVURLAssetItemProviderAssetInitializationOptionsKey"));
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVURLAssetItemProviderData;
  -[AVURLAssetItemProviderData dealloc](&v3, sel_dealloc);
}

- (NSURL)securityScopedURL
{
  return (NSURL *)-[NSSecurityScopedURLWrapper url](self->_securityScopedURLWrapper, "url");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_securityScopedURLWrapper, CFSTR("AVURLAssetItemProviderURLWrapperKey"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_assetInitializationOptions, CFSTR("AVURLAssetItemProviderAssetInitializationOptionsKey"));
}

- (NSDictionary)assetInitializationOptions
{
  return self->_assetInitializationOptions;
}

@end
