@implementation MFMimePart(SMIMEDecodingPrivate)

- (uint64_t)_setSMIMEError:()SMIMEDecodingPrivate
{
  return _MFSetValueInDictionary();
}

- (uint64_t)_setSigners:()SMIMEDecodingPrivate
{
  return _MFSetValueInDictionary();
}

- (BOOL)_needsSignatureVerification:()SMIMEDecodingPrivate
{
  uint64_t v5;
  uint64_t v6;

  v5 = (int)*MEMORY[0x1E0D461E0];
  v6 = objc_msgSend(*(id *)(a1 + v5), "objectForKey:", CFSTR("x-apple-smime-error"));
  *a3 = v6;
  return !v6 && objc_msgSend(*(id *)(a1 + v5), "objectForKey:", CFSTR("x-apple-smime-signers")) == 0;
}

@end
