@implementation MLLocalizedSeasonDisplayStringForSeasonNumber

void __MLLocalizedSeasonDisplayStringForSeasonNumber_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Season %d"), &stru_1E5B66908, CFSTR("MLLocalizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v3, *(unsigned int *)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)MLLocalizedSeasonDisplayStringForSeasonNumber_zeroSeasonString;
  MLLocalizedSeasonDisplayStringForSeasonNumber_zeroSeasonString = v4;

}

@end
