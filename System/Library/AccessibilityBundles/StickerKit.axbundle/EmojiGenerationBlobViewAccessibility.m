@implementation EmojiGenerationBlobViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("StickerKit.EmojiGenerationBlobView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("StickerKit.EmojiGenerationBlobView"), CFSTR("queryInfo"), "Optional<EmojiQueryInfo>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("StickerKit.EmojiQueryInfo"), CFSTR("searchString"), "String");

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[EmojiGenerationBlobViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("queryInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeSwiftValueForKey:", CFSTR("searchString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
