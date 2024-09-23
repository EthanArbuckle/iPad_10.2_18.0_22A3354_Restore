@implementation PUPhotoCommentEntryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUPhotoCommentEntryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoCommentEntryView"), CFSTR("textView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoCommentEntryView"), CFSTR("placeholderLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoCommentEntryView"), CFSTR("postButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UILabel"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoCommentEntryView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);

}

- (PUPhotoCommentEntryViewAccessibility)initWithFrame:(CGRect)a3
{
  PUPhotoCommentEntryViewAccessibility *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUPhotoCommentEntryViewAccessibility;
  v3 = -[PUPhotoCommentEntryViewAccessibility initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_opt_class();
  -[PUPhotoCommentEntryViewAccessibility safeValueForKey:](v3, "safeValueForKey:", CFSTR("placeholderLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotoCommentEntryViewAccessibility safeValueForKey:](v3, "safeValueForKey:", CFSTR("textView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("AddCommentTextView"));

  -[PUPhotoCommentEntryViewAccessibility safeValueForKey:](v3, "safeValueForKey:", CFSTR("textView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityLabel:", v6);

  -[PUPhotoCommentEntryViewAccessibility safeValueForKey:](v3, "safeValueForKey:", CFSTR("placeholderLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsAccessibilityElement:", 0);

  return v3;
}

@end
