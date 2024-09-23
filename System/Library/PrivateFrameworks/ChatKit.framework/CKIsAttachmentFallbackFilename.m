@implementation CKIsAttachmentFallbackFilename

void __CKIsAttachmentFallbackFilename_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CKIsAttachmentFallbackFilename_asciiDigits;
  CKIsAttachmentFallbackFilename_asciiDigits = v0;

}

@end
