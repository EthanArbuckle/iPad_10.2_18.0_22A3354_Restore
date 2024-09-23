@implementation AttributionWeeAppNSTextAttachmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NSTextAttachment");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setImage:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AttributionWeeAppNSTextAttachmentAccessibility;
  -[AttributionWeeAppNSTextAttachmentAccessibility setImage:](&v5, sel_setImage_, v4);
  if (AXCaptureImageAttachmentSetYahooLogo)
    objc_msgSend(v4, "setAccessibilityLabel:", CFSTR("Yahoo!"));

}

@end
