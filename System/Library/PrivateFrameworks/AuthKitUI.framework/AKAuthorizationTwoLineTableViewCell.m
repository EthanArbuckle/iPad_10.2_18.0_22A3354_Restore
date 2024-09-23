@implementation AKAuthorizationTwoLineTableViewCell

- (AKAuthorizationTwoLineTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  AKAuthorizationTwoLineTableViewCell *v4;
  AKAuthorizationTwoLineTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKAuthorizationTwoLineTableViewCell;
  v4 = -[AKAuthorizationTwoLineTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, 3, a4);
  v5 = v4;
  if (v4)
    -[AKAuthorizationTwoLineTableViewCell _setup](v4, "_setup");
  return v5;
}

- (void)_setup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationTwoLineTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[AKAuthorizationTwoLineTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 1);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "ak_dynamicFontWithStyle:traits:", *MEMORY[0x1E0CEB538], 0x8000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationTwoLineTableViewCell detailTextLabel](self, "detailTextLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationTwoLineTableViewCell detailTextLabel](self, "detailTextLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v7);

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationTwoLineTableViewCell;
  -[AKAuthorizationTwoLineTableViewCell setSelected:animated:](&v4, sel_setSelected_animated_, a3, a4);
}

@end
