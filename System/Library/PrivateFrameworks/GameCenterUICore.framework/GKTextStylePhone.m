@implementation GKTextStylePhone

+ (double)standardFontSize
{
  return 13.0;
}

- (id)header1
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

  objc_msgSend(v4, "setFontName:rebaseSelector:", CFSTR("GKMagicLightSystemFont"), a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 30.0);
  return v4;
}

- (id)header2
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

  objc_msgSend(v4, "setFontName:rebaseSelector:", CFSTR("GKMagicLightSystemFont"), a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 23.0);
  return v4;
}

- (id)header4
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

  objc_msgSend(v4, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 14.0);
  return v4;
}

- (id)smallInfo
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "standardTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  objc_msgSend(v4, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 12.0);
  return v4;
}

- (id)sectionCaptionSmall
{
  id v3;

  v3 = -[GKTextStyle copy](self, "copy");
  objc_msgSend(v3, "setFontName:rebaseSelector:", CFSTR("GKMagicSystemFont"), a2);
  objc_msgSend(v3, "setFontSize:rebaseSelector:", a2, 9.0);
  return v3;
}

- (id)cellActionItem
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[GKTextStyle copy](self, "copy");
  -[GKTextStyle palette](self, "palette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emphasizedTextOnDarkBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  objc_msgSend(v4, "setFontSize:rebaseSelector:", a2, 18.0);
  objc_msgSend(v4, "setTextAlignment:", 1);
  return v4;
}

@end
