@implementation UIFontDescriptor(NewsFeed)

+ (id)ts_fontSystemFontGradeTraitKey
{
  return (id)*MEMORY[0x1E0DC1410];
}

+ (id)ts_fontSystemFontDesignTraitKey
{
  return (id)*MEMORY[0x1E0DC1408];
}

+ (id)ts_fontLegibilityWeightAttributeName
{
  return (id)*MEMORY[0x1E0CA8368];
}

@end
