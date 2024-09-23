@implementation UILabel(NUCrossFadeViewAnimatable)

- (void)nu_crossFadeViewSetValue:()NUCrossFadeViewAnimatable
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = a1;
    v5 = v8;
LABEL_6:
    objc_msgSend(v4, "setAttributedText:", v5);
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(a1, "setText:", 0);
    v4 = a1;
    v5 = 0;
    goto LABEL_6;
  }
  objc_msgSend(a1, "setText:", v8);
LABEL_7:
  objc_msgSend(a1, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

  objc_msgSend(a1, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

}

- (uint64_t)nu_crossFadeViewClearVisibleState
{
  objc_msgSend(a1, "setText:", 0);
  return objc_msgSend(a1, "setAttributedText:", 0);
}

@end
