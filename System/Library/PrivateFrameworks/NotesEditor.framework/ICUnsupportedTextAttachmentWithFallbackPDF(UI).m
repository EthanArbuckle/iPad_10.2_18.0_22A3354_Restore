@implementation ICUnsupportedTextAttachmentWithFallbackPDF(UI)

- (id)attachmentSizeForTextContainer:()UI
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&off_1F0490C60;
  return objc_msgSendSuper2(&v2, sel_attachmentSizeForTextContainer_);
}

- (uint64_t)effectiveAttachmentViewSizeForTextContainer:()UI
{
  void *v2;
  int v3;
  void *v4;

  objc_msgSend(a1, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferredViewSize");

  if (v3 != 1)
  {
    objc_msgSend(a1, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "hasFallbackPDF"))
      LOWORD(v3) = 1;

  }
  return (__int16)v3;
}

- (id)attachmentViewClassForTextContainer:()UI
{
  objc_msgSend(a1, "effectiveAttachmentViewSizeForTextContainer:");
  return (id)objc_opt_class();
}

@end
