@implementation NSData(SignedPlists)

- (uint64_t)fp_writeToURL:()SignedPlists withSignature:options:error:
{
  return objc_msgSend(a1, "writeToURL:options:error:", a3, a5, a6);
}

+ (uint64_t)fp_dataWithContentsOfURL:()SignedPlists enforceSignatureCheck:shouldUpdateXattr:error:
{
  return objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 1, a6);
}

@end
