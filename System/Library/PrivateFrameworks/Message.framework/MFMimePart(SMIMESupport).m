@implementation MFMimePart(SMIMESupport)

- (BOOL)isSigned
{
  void *v2;
  _BOOL8 v3;
  void *v4;

  objc_msgSend(a1, "_objectInOtherIvarsForKey:", CFSTR("x-is-signed"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "BOOLValue") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "_objectInOtherIvarsForKey:", CFSTR("x-apple-smime-signers"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4 != 0;

  }
  return v3;
}

- (uint64_t)isEncrypted
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_objectInOtherIvarsForKey:", CFSTR("x-is-encrypted"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)signatureInfo
{
  return objc_msgSend(a1, "_objectInOtherIvarsForKey:", CFSTR("x-apple-smime-signature-info"));
}

- (uint64_t)SMIMEError
{
  return objc_msgSend(a1, "_objectInOtherIvarsForKey:", CFSTR("x-apple-smime-error"));
}

- (uint64_t)copySigners
{
  objc_msgSend(a1, "_objectInOtherIvarsForKey:", CFSTR("x-apple-smime-signers"));
  return objc_claimAutoreleasedReturnValue();
}

@end
