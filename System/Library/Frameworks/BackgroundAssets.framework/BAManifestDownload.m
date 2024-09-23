@implementation BAManifestDownload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BAManifestDownload)init
{

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BAManifestDownload;
  return -[BAURLDownload copyWithZone:](&v4, sel_copyWithZone_, a3);
}

@end
