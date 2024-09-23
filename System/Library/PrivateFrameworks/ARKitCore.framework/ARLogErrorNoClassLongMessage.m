@implementation ARLogErrorNoClassLongMessage

void __ARLogErrorNoClassLongMessage_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ARLogErrorNoClassLongMessage_newLineCharacterSet;
  ARLogErrorNoClassLongMessage_newLineCharacterSet = v0;

}

@end
