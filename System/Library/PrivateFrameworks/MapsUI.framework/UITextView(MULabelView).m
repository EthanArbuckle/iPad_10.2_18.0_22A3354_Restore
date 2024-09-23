@implementation UITextView(MULabelView)

- (uint64_t)numberOfLines
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "textContainer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "maximumNumberOfLines");

  return v2;
}

- (void)setNumberOfLines:()MULabelView
{
  id v4;

  objc_msgSend(a1, "textContainer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumNumberOfLines:", a3);

}

- (uint64_t)lineBreakMode
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "textContainer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "lineBreakMode");

  return v2;
}

- (void)setLineBreakMode:()MULabelView
{
  id v4;

  objc_msgSend(a1, "textContainer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineBreakMode:", a3);

}

- (float)_hyphenationFactor
{
  return 0.0;
}

- (uint64_t)allowsDefaultTighteningForTruncation
{
  return 0;
}

@end
