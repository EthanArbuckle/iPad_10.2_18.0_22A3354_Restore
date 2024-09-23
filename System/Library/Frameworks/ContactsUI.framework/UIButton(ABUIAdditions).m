@implementation UIButton(ABUIAdditions)

- (id)ab_text
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "titleLabel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)setAb_text:()ABUIAdditions
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (id)ab_textAttributes
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "titleLabel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ab_textAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)setAb_textAttributes:()ABUIAdditions
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAb_textAttributes:", v4);

}

@end
