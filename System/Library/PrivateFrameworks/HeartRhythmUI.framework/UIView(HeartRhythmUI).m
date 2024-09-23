@implementation UIView(HeartRhythmUI)

- (void)hrui_alignConstraintsWithLeadingAnchor:()HeartRhythmUI trailingAnchor:insets:
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v12 = a8;
  v13 = a7;
  objc_msgSend(a1, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v13, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setActive:", 1);
  objc_msgSend(a1, "trailingAnchor");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v12, -a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setActive:", 1);
}

- (void)hrui_alignConstraintsWithTopAnchor:()HeartRhythmUI bottomAnchor:insets:
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v11 = a7;
  v12 = a6;
  objc_msgSend(a1, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v12, a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setActive:", 1);
  objc_msgSend(a1, "bottomAnchor");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v11, -a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setActive:", 1);
}

- (uint64_t)hrui_alignConstraintsWithView:()HeartRhythmUI insets:
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v12 = a7;
  objc_msgSend(v12, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hrui_alignConstraintsWithTopAnchor:bottomAnchor:insets:", v13, v14, a2, a3, a4, a5);

  objc_msgSend(v12, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "hrui_alignConstraintsWithLeadingAnchor:trailingAnchor:insets:", v15, v16, a2, a3, a4, a5);
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (uint64_t)hrui_alignHorizontalConstraintsWithView:()HeartRhythmUI insets:
{
  id v12;
  void *v13;
  void *v14;

  v12 = a7;
  objc_msgSend(v12, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "hrui_alignConstraintsWithLeadingAnchor:trailingAnchor:insets:", v13, v14, a2, a3, a4, a5);
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (uint64_t)hrui_alignVerticalConstraintsWithView:()HeartRhythmUI insets:
{
  id v12;
  void *v13;
  void *v14;

  v12 = a7;
  objc_msgSend(v12, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "hrui_alignConstraintsWithTopAnchor:bottomAnchor:insets:", v13, v14, a2, a3, a4, a5);
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (uint64_t)hrui_alignHorizontalConstraintsWithGuide:()HeartRhythmUI insets:
{
  id v12;
  void *v13;
  void *v14;

  v12 = a7;
  objc_msgSend(v12, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "hrui_alignConstraintsWithLeadingAnchor:trailingAnchor:insets:", v13, v14, a2, a3, a4, a5);
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (uint64_t)hrui_alignVerticalConstraintsWithGuide:()HeartRhythmUI insets:
{
  id v12;
  void *v13;
  void *v14;

  v12 = a7;
  objc_msgSend(v12, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "hrui_alignConstraintsWithTopAnchor:bottomAnchor:insets:", v13, v14, a2, a3, a4, a5);
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (void)hrui_constraintAspectRatioFromSize:()HeartRhythmUI
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 8, 0, a1, 7, a3 / a2, 0.0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addConstraint:", v4);

}

- (void)hrui_maskCorners:()HeartRhythmUI radius:
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4 & 0xF;
  objc_msgSend(a1, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", a2);

  objc_msgSend(a1, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMaskedCorners:", v6);

  objc_msgSend(a1, "layer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMasksToBounds:", 1);

}

- (uint64_t)hrui_maskAllCornersWithRadius:()HeartRhythmUI
{
  return objc_msgSend(a1, "hrui_maskCorners:radius:", -1);
}

@end
