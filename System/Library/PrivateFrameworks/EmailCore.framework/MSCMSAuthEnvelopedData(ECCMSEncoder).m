@implementation MSCMSAuthEnvelopedData(ECCMSEncoder)

- (uint64_t)type
{
  return objc_msgSend(MEMORY[0x1E0D4D7B8], "OIDWithString:error:", *MEMORY[0x1E0D4D6C8], 0);
}

@end
