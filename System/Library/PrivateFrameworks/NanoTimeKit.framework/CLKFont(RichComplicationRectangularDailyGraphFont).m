@implementation CLKFont(RichComplicationRectangularDailyGraphFont)

+ (id)alternatePunctuationRoundedSemiBoldSystemFontOfSize:()RichComplicationRectangularDailyGraphFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (alternatePunctuationRoundedSemiBoldSystemFontOfSize__onceToken != -1)
    dispatch_once(&alternatePunctuationRoundedSemiBoldSystemFontOfSize__onceToken, &__block_literal_global_13);
  v2 = (void *)alternatePunctuationRoundedSemiBoldSystemFontOfSize__cache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C944D0], "fontWithDescriptor:size:", alternatePunctuationRoundedSemiBoldSystemFontOfSize__baseDescriptor, a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)alternatePunctuationRoundedSemiBoldSystemFontOfSize__cache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, v6);

  }
  return v4;
}

@end
