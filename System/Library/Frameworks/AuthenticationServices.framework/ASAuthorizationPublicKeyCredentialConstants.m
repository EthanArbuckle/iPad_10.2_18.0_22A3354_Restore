@implementation ASAuthorizationPublicKeyCredentialConstants

+ (int64_t)publicAttachmentFromInternal:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE0B1D8]) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE0B1D0]);
    v4 = 1;
  }

  return v4;
}

@end
