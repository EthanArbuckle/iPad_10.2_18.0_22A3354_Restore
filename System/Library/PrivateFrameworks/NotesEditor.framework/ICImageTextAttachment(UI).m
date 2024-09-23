@implementation ICImageTextAttachment(UI)

- (uint64_t)attachmentViewClassForTextContainer:()UI
{
  return objc_opt_class();
}

- (double)attachmentSizeForTextContainer:()UI
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  objc_msgSend(a1, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intrinsicContentSize");
  objc_msgSend(a1, "attachmentSizeForImageInTextContainer:intrinsicImageSize:", v4);
  v7 = v6;

  return v7;
}

@end
