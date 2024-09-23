@implementation NPTrimNonLetters

void ___NPTrimNonLetters_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_NPTrimNonLetters_nonLetterCharacterSet;
  _NPTrimNonLetters_nonLetterCharacterSet = v0;

}

@end
