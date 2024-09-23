@implementation GKTextStyleFocus

- (id)bannerTitle
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emphasizedTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  objc_msgSend(v4, "setTextAlignment:", 4);
  objc_msgSend(v4, "setLineBreakMode:", 4);
  objc_msgSend(v4, "setFontName:rebaseSelector:", CFSTR("GKMagicBoldSystemFont"), a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 18.0);
  return v4;
}

@end
