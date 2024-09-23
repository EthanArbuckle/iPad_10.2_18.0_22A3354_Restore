@implementation CRCameraReaderOutputExpirationDate

- (NSNumber)yearValue
{
  void *v2;
  void *v3;

  -[CRCameraReaderOutput objectInternal](self, "objectInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "yearValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)monthValue
{
  void *v2;
  void *v3;

  -[CRCameraReaderOutput objectInternal](self, "objectInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "monthValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)dayValue
{
  void *v2;
  void *v3;

  -[CRCameraReaderOutput objectInternal](self, "objectInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dayValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

@end
