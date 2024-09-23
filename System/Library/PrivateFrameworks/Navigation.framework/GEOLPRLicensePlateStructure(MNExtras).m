@implementation GEOLPRLicensePlateStructure(MNExtras)

- (id)supportedAlphabeticCharacterSet
{
  int v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_msgSend(a1, "hasSupportedPlateAlphabetLetters");
  v3 = (void *)MEMORY[0x1E0CB3500];
  if (v2)
  {
    objc_msgSend(a1, "supportedPlateAlphabetLetters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "characterSetWithCharactersInString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)supportedNumericCharacterSet
{
  int v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_msgSend(a1, "hasSupportedPlateNumerics");
  v3 = (void *)MEMORY[0x1E0CB3500];
  if (v2)
  {
    objc_msgSend(a1, "supportedPlateNumerics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "characterSetWithCharactersInString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end
