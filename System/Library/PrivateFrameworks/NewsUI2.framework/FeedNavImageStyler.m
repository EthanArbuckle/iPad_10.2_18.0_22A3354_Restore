@implementation FeedNavImageStyler

- (UIFont)tagTitleFont
{
  return (UIFont *)objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_weight_, 14.0, *MEMORY[0x1E0DC1448]);
}

- (id)tagColorFor:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  sub_1D6E26978();
  v3 = (void *)objc_opt_self();
  swift_retain();
  v4 = (void *)sub_1D6E26948();
  v5 = objc_msgSend(v3, sel_nu_safeColorForIdentifier_, v4);
  swift_release();
  swift_bridgeObjectRelease();

  return v5;
}

- (double)cornerRadius
{
  return 3.0;
}

- (double)padding
{
  return 5.0;
}

@end
