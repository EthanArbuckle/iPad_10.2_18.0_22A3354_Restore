@implementation CNLabeledBadge

- (CNLabeledBadge)initWithFrame:(CGRect)a3
{
  CNLabeledBadge *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  CNLabeledBadge *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNLabeledBadge;
  v3 = -[CNLabeledBadge initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[CNUIFontRepository contactCardRecentBadgeFont](CNUIFontRepository, "contactCardRecentBadgeFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLabeledBadge setFont:](v3, "setFont:", v4);

    +[CNUIColorRepository contactCardRecentBadgeTextDynamicColor](CNUIColorRepository, "contactCardRecentBadgeTextDynamicColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLabeledBadge setTextColor:](v3, "setTextColor:", v5);

    -[CNLabeledBadge setAdjustsFontForContentSizeCategory:](v3, "setAdjustsFontForContentSizeCategory:", 1);
    -[CNLabeledBadge setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = objc_alloc_init(MEMORY[0x1E0CA80F0]);
    objc_msgSend(v6, "setStyle:", 1);
    +[CNUIColorRepository contactCardLabeledBadgeBackgroundDynamicColor](CNUIColorRepository, "contactCardLabeledBadgeBackgroundDynamicColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setColor:", v7);

    objc_msgSend(v6, "setScale:", 1);
    -[CNLabeledBadge _setTextEncapsulation:](v3, "_setTextEncapsulation:", v6);
    v8 = v3;

  }
  return v3;
}

+ (id)labeledBadgeWithText:(id)a3
{
  id v3;
  CNLabeledBadge *v4;

  v3 = a3;
  v4 = objc_alloc_init(CNLabeledBadge);
  -[CNLabeledBadge setText:](v4, "setText:", v3);

  return v4;
}

@end
