@implementation CRCameraReaderOutputIDCard

- (UIImage)imageValue
{
  void *v2;
  void *v3;

  -[CRCameraReaderOutput objectInternal](self, "objectInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (NSArray)vertices
{
  void *v2;
  void *v3;

  -[CRCameraReaderOutput objectInternal](self, "objectInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vertices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)targetVertices
{
  void *v2;
  void *v3;

  -[CRCameraReaderOutput objectInternal](self, "objectInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetVertices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)capturePath
{
  void *v2;
  void *v3;

  -[CRCameraReaderOutput objectInternal](self, "objectInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "capturePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

@end
