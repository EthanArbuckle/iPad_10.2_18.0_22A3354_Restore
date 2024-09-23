@implementation NSCharacterSet(LanguageIdentificationAdditions)

+ (id)vietnameseCharacterSet
{
  if (vietnameseCharacterSet___onceToken != -1)
    dispatch_once(&vietnameseCharacterSet___onceToken, &__block_literal_global_41);
  return (id)vietnameseCharacterSet___vietnameseCharset;
}

@end
