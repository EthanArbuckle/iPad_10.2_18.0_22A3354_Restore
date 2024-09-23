@implementation CADEmulatedURL

- (CADEmulatedURL)initWithOriginalURL:(id)a3
{
  void *v4;
  CADEmulatedURL *v5;
  objc_super v7;

  objc_msgSend(a3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)CADEmulatedURL;
  v5 = -[CADEmulatedURL initWithString:relativeToURL:](&v7, sel_initWithString_relativeToURL_, v4, 0);

  return v5;
}

- (BOOL)startAccessingSecurityScopedResource
{
  return 1;
}

@end
