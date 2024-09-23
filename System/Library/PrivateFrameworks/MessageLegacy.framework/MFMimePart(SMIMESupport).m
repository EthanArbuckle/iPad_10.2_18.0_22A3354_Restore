@implementation MFMimePart(SMIMESupport)

- (id)SMIMEError
{
  return (id)objc_msgSend(*(id *)(a1 + (int)*MEMORY[0x1E0D461E0]), "objectForKey:", CFSTR("x-apple-smime-error"));
}

- (uint64_t)copySigners
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + (int)*MEMORY[0x1E0D461E0]), "objectForKey:", CFSTR("x-apple-smime-signers")), "copy");
}

@end
