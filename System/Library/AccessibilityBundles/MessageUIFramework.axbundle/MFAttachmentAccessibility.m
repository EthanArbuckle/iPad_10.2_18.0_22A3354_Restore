@implementation MFAttachmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFAttachment");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFAttachment"), CFSTR("markupStringForDisplayWithData: allowAttachmentElement:"), "@", "B", 0);
}

- (id)markupStringForDisplayWithData:(id)a3 allowAttachmentElement:(BOOL)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MFAttachmentAccessibility;
  -[MFAttachmentAccessibility markupStringForDisplayWithData:allowAttachmentElement:](&v11, sel_markupStringForDisplayWithData_allowAttachmentElement_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfString:", CFSTR("<object "));
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v5;
    v8 = v6;
    v9 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v9, "insertString:atIndex:", CFSTR(" role='button' "), v7 + v8);

    v4 = v9;
  }
  return v4;
}

@end
