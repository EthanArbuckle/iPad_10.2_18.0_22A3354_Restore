@implementation CKServerChangeToken(HMB)

- (id)hmbDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "data");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "base64EncodedStringWithOptions:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
