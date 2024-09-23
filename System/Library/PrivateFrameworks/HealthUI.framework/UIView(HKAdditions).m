@implementation UIView(HKAdditions)

- (uint64_t)hk_alignConstraintsWithView:()HKAdditions
{
  id v4;
  void *v5;
  void *v6;
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

  v4 = a3;
  objc_msgSend(a1, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  objc_msgSend(a1, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  objc_msgSend(a1, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  objc_msgSend(a1, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (id)hk_addEqualsConstraintWithItem:()HKAdditions attribute:relatedTo:constant:
{
  uint64_t v7;
  void *v8;

  if (a6)
    v7 = a5;
  else
    v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a4, a5, 0, a6, v7, 1.0, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addConstraint:", v8);
  return v8;
}

- (id)hk_addEqualsConstraintWithItem:()HKAdditions attribute:relatedTo:attribute:constant:
{
  uint64_t v8;
  void *v9;

  if (a6)
    v8 = a7;
  else
    v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a4, a5, 0, a6, v8, 1.0, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addConstraint:", v9);
  return v9;
}

- (id)hk_addConstraintsWithFormat:()HKAdditions options:metrics:views:
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addConstraints:", v2);
  return v2;
}

- (uint64_t)hk_addConstraintsWithFormat:()HKAdditions options:views:
{
  return objc_msgSend(a1, "hk_addConstraintsWithFormat:options:metrics:views:", a3, a4, 0, a5);
}

- (BOOL)hk_isLeftToRight
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "semanticContentAttribute");
  return objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", v1) == 0;
}

- (uint64_t)hk_trailingTextAlignmentAtOrBelowSizeCategory:()HKAdditions
{
  if (HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory(a3))
    return 4;
  if (objc_msgSend(a1, "hk_isLeftToRight"))
    return 2;
  return 0;
}

- (void)hk_constrainToView:()HKAdditions fromEdge:toEdge:constant:
{
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, a5, 0, a4, a6, 1.0, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3718];
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activateConstraints:", v9);

  objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (void)hk_constrainToSuperviewAlongEdges:()HKAdditions constant:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_21;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v10)
    goto LABEL_18;
  v11 = v10;
  v12 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v23 != v12)
        objc_enumerationMutation(v9);
      v14 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "integerValue");
      v15 = v14;
      if ((v14 & 0xFFFFFFFFFFFFFFFDLL) == 1)
      {
        v16 = (void *)MEMORY[0x1E0CB3718];
        v17 = 1.0;
        v18 = a1;
        v19 = v7;
LABEL_15:
        objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, v15, 0, v19, v15, v17, a2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v21);

        continue;
      }
      if (v14 == 4 || v14 == 2)
      {
        v16 = (void *)MEMORY[0x1E0CB3718];
        v17 = 1.0;
        v18 = v7;
        v19 = a1;
        goto LABEL_15;
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v11);
LABEL_18:
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v8);
    objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }

LABEL_21:
}

- (uint64_t)hk_alignConstraintsWithGuide:()HKAdditions
{
  id v4;
  void *v5;
  void *v6;
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

  v4 = a3;
  objc_msgSend(a1, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  objc_msgSend(a1, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  objc_msgSend(a1, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  objc_msgSend(a1, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (uint64_t)hk_alignVerticalConstraintsWithView:()HKAdditions margin:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a1, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  objc_msgSend(a1, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (uint64_t)hk_alignHorizontalConstraintsWithView:()HKAdditions margin:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a1, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  objc_msgSend(a1, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (uint64_t)hk_alignCenterConstraintsWithView:()HKAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerXAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  objc_msgSend(a1, "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (uint64_t)hk_alignConstraintsWithViewController:()HKAdditions
{
  id v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  objc_msgSend(a1, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  objc_msgSend(a1, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  objc_msgSend(a1, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safeAreaLayoutGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  objc_msgSend(a1, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "safeAreaLayoutGuide");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (void)hk_alignConstraintsWithLeadingAnchor:()HKAdditions trailingAnchor:insets:
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

- (void)hk_alignConstraintsWithTopAnchor:()HKAdditions bottomAnchor:insets:
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

- (uint64_t)hk_alignConstraintsWithView:()HKAdditions insets:
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
  objc_msgSend(a1, "hk_alignConstraintsWithTopAnchor:bottomAnchor:insets:", v13, v14, a2, a3, a4, a5);

  objc_msgSend(v12, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "hk_alignConstraintsWithLeadingAnchor:trailingAnchor:insets:", v15, v16, a2, a3, a4, a5);
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (uint64_t)hk_alignHorizontalConstraintsWithView:()HKAdditions insets:
{
  id v12;
  void *v13;
  void *v14;

  v12 = a7;
  objc_msgSend(v12, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "hk_alignConstraintsWithLeadingAnchor:trailingAnchor:insets:", v13, v14, a2, a3, a4, a5);
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (uint64_t)hk_alignVerticalConstraintsWithView:()HKAdditions insets:
{
  id v12;
  void *v13;
  void *v14;

  v12 = a7;
  objc_msgSend(v12, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "hk_alignConstraintsWithTopAnchor:bottomAnchor:insets:", v13, v14, a2, a3, a4, a5);
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (uint64_t)hk_alignHorizontalConstraintsWithGuide:()HKAdditions insets:
{
  id v12;
  void *v13;
  void *v14;

  v12 = a7;
  objc_msgSend(v12, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "hk_alignConstraintsWithLeadingAnchor:trailingAnchor:insets:", v13, v14, a2, a3, a4, a5);
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (uint64_t)hk_alignVerticalConstraintsWithGuide:()HKAdditions insets:
{
  id v12;
  void *v13;
  void *v14;

  v12 = a7;
  objc_msgSend(v12, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "hk_alignConstraintsWithTopAnchor:bottomAnchor:insets:", v13, v14, a2, a3, a4, a5);
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (void)hk_constraintAspectRatioFromSize:()HKAdditions
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, 8, 0, a1, 7, a3 / a2, 0.0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addConstraint:", v4);

}

- (void)hk_maskCorners:()HKAdditions radius:
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

- (uint64_t)hk_maskAllCornersWithRadius:()HKAdditions
{
  return objc_msgSend(a1, "hk_maskCorners:radius:", -1);
}

- (double)hk_layoutHeightFittingWidth:()HKAdditions
{
  double v5;

  LODWORD(a4) = 1148846080;
  LODWORD(a5) = 1112014848;
  objc_msgSend(a1, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a2, 0.0, a4, a5);
  return v5;
}

@end
