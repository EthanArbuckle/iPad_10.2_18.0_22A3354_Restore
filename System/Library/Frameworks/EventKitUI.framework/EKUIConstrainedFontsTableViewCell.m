@implementation EKUIConstrainedFontsTableViewCell

- (EKUIConstrainedFontsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EKUIConstrainedFontsTableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)EKUIConstrainedFontsTableViewCell;
  v5 = -[EKUITableViewCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v5)
  {
    +[EKUIConstrainedFontUtilities constrainedBodyTextLabelFont](EKUIConstrainedFontUtilities, "constrainedBodyTextLabelFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIConstrainedFontsTableViewCell textLabel](v5, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v6);

    v8 = v6;
    if (a3 == 3)
    {
      +[EKUIConstrainedFontUtilities constrainedCaption1TextLabelFont](EKUIConstrainedFontUtilities, "constrainedCaption1TextLabelFont");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[EKUIConstrainedFontsTableViewCell detailTextLabel](v5, "detailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v8);

    if (a3 == 3)
  }
  return v5;
}

@end
