@implementation PUPhotoPostCommentTextEntryCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUPhotoPostCommentTextEntryCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoPostCommentTextEntryCell"), CFSTR("textEntryView"), "@", 0);
}

- (id)accessibilityElements
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[PUPhotoPostCommentTextEntryCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textEntryView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("PUPhotoCommentEntryView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "safeValueForKey:", CFSTR("textView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("postButton"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityContainer:", self);
    objc_msgSend(v6, "setAccessibilityContainer:", self);
    objc_msgSend(v3, "axSafelyAddObject:", v5);
    objc_msgSend(v3, "axSafelyAddObject:", v6);

  }
  return v3;
}

@end
