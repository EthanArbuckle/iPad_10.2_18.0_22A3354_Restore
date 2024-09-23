@implementation NSLayoutConstraint(NSLayoutConstraint_AVKitAdditions)

+ (id)avkit_constraintsFromEdgesOfItem:()NSLayoutConstraint_AVKitAdditions toEdgesOfItem:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  objc_msgSend(v6, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  objc_msgSend(v6, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v12;
  objc_msgSend(v6, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)avkit_constraintsFromEdgesOfItem:()NSLayoutConstraint_AVKitAdditions toLeadingAnchor:topAnchor:trailingAnchor:bottomAnchor:priority:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  objc_msgSend(v17, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v19 = a1;
  objc_msgSend(v18, "avkit_constraintEqualToAnchor:priority:", v16, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v32[0] = v20;
  objc_msgSend(v17, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v22 = a1;
  objc_msgSend(v21, "avkit_constraintEqualToAnchor:priority:", v15, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v32[1] = v23;
  objc_msgSend(v17, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v25 = a1;
  objc_msgSend(v24, "avkit_constraintEqualToAnchor:priority:", v14, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v32[2] = v26;
  objc_msgSend(v17, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v28 = a1;
  objc_msgSend(v27, "avkit_constraintEqualToAnchor:priority:", v13, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v32[3] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

+ (id)avkit_constraintsFromLeadingAndTrailingEdgesOfItem:()NSLayoutConstraint_AVKitAdditions toEdgesOfItem:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  objc_msgSend(v6, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)avkit_constraintsFromTopAndBottomEdgesOfItem:()NSLayoutConstraint_AVKitAdditions toEdgesOfItem:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  objc_msgSend(v6, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
