@implementation SFStartPageBlurredCellBackgroundEffectView

- (SFStartPageBlurredCellBackgroundEffectView)init
{
  void *v3;
  SFStartPageBlurredCellBackgroundEffectView *v4;
  void *v5;
  id v6;
  SFStartPageBlurredCellBackgroundEffectView *v7;
  objc_super v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3510], "_sf_defaultStartPageBackgroundEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)SFStartPageBlurredCellBackgroundEffectView;
  v4 = -[SFStartPageBlurredCellBackgroundEffectView initWithEffect:](&v9, sel_initWithEffect_, v3);

  if (v4)
  {
    -[SFStartPageBlurredCellBackgroundEffectView _setGroupName:](v4, "_setGroupName:", CFSTR("start-page-cell"));
    v10[0] = objc_opt_class();
    v10[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)-[SFStartPageBlurredCellBackgroundEffectView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v5, sel_sf_configureAsStartPageBackground);

    -[UIVisualEffectView sf_configureAsStartPageBackground](v4, "sf_configureAsStartPageBackground");
    v7 = v4;
  }

  return v4;
}

@end
