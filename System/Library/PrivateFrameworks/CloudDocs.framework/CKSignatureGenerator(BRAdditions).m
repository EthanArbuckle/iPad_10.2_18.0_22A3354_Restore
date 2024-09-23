@implementation CKSignatureGenerator(BRAdditions)

+ (id)br_signatureWithFileDescriptor:()BRAdditions boundaryKey:error:
{
  if (a4)
    objc_msgSend(MEMORY[0x1E0C95138], "signatureWithFileDescriptor:boundaryKey:error:");
  else
    objc_msgSend(MEMORY[0x1E0C95138], "signatureWithFileDescriptor:error:", a3, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
