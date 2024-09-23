@implementation CNStaticIdentityBadgeView

- (CNStaticIdentityBadgeView)init
{
  CNStaticIdentityBadgeView *v2;
  id v3;
  void *v4;
  void *v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CNStaticIdentityBadgeView *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CNStaticIdentityBadgeView;
  v2 = -[CNStaticIdentityBadgeView init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3890]);
    +[CNStaticIdentityBadgeView sealLockImage](CNStaticIdentityBadgeView, "sealLockImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithImage:", v4);

    LODWORD(v6) = 1111752704;
    objc_msgSend(v5, "setContentCompressionResistancePriority:forAxis:", 1, v6);
    objc_msgSend(v5, "setContentMode:", 1);
    v7 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    CNContactsUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("STATIC_IDENTITY_BADGE_TEXT"), &stru_1E20507A8, CFSTR("Localized-NARWHAL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v9);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v10);

    +[CNUIColorRepository contactCardStaticIdentityBadgeGlyphColor](CNUIColorRepository, "contactCardStaticIdentityBadgeGlyphColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v11);

    -[CNStaticIdentityBadgeView addArrangedSubview:](v2, "addArrangedSubview:", v5);
    -[CNStaticIdentityBadgeView addArrangedSubview:](v2, "addArrangedSubview:", v7);
    -[CNStaticIdentityBadgeView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNStaticIdentityBadgeView setAxis:](v2, "setAxis:", 0);
    -[CNStaticIdentityBadgeView setAlignment:](v2, "setAlignment:", 5);
    -[CNStaticIdentityBadgeView setDistribution:](v2, "setDistribution:", 2);
    -[CNStaticIdentityBadgeView setSpacing:](v2, "setSpacing:", 0.0);
    v12 = v2;

  }
  return v2;
}

+ (id)sealLockImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0DC3888];
  +[CNUIColorRepository contactCardStaticIdentityBadgeGlyphColor](CNUIColorRepository, "contactCardStaticIdentityBadgeGlyphColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationWithPaletteColors:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("checkmark.circle.fill"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
