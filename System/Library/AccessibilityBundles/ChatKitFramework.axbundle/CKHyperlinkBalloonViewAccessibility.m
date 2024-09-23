@implementation CKHyperlinkBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKHyperlinkBalloonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKHyperlinkBalloonView"), CFSTR("textView:shouldInteractWithURL:inRange:"), "B", "@", "@", "{_NSRange=QQ}", 0);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  char v12;
  BOOL v13;
  objc_super v15;

  length = a5.length;
  location = a5.location;
  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_opt_new();
  v12 = objc_msgSend(v11, "isClarityBoardEnabled");

  if ((v12 & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CKHyperlinkBalloonViewAccessibility;
    v13 = -[CKHyperlinkBalloonViewAccessibility textView:shouldInteractWithURL:inRange:](&v15, sel_textView_shouldInteractWithURL_inRange_, v9, v10, location, length);
  }

  return v13;
}

@end
