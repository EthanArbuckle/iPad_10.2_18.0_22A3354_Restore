@implementation CKServerChangeToken(IC)

- (id)ic_loggingDescription
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("<ServerChangeToken %@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
