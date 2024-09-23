@implementation NSLayoutConstraint(GKAdditions)

+ (id)_gkConstraintWithItem:()GKAdditions attribute:relatedBy:toItem:attribute:multiplier:leading:fontTextStyle:
{
  void *v16;
  id v17;
  void *v18;
  void *v19;

  v16 = (void *)MEMORY[0x1E0CB3718];
  v17 = a10;
  objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a5, a6, a7, a8, a9, 1.0, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKConstraintUpdateController sharedController](GKConstraintUpdateController, "sharedController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "registerConstraint:leading:forFontTextStyle:", v18, v17, a2);

  return v18;
}

+ (uint64_t)_gkConstraintForView:()GKAdditions equalsAttribute:ofView:
{
  return objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, a4, 0, a5, a4, 1.0, 0.0);
}

+ (uint64_t)_gkConstraintForView:()GKAdditions centeredYInView:
{
  return objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 10, 0, a4, 10, 1.0, 0.0);
}

+ (uint64_t)_gkConstraintForView:()GKAdditions centeredXInView:
{
  return objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 9, 0, a4, 9, 1.0, 0.0);
}

+ (id)_gkConstraintsForView:()GKAdditions centeredXInView:enforceMargin:
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB3718];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 9, 0, v8, 9, 1.0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 1, 1, v8, 1, 1.0, a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 2, -1, v8, 2, 1.0, -a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v10;
  v15[1] = v11;
  v15[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (uint64_t)_gkConstraintForView:()GKAdditions withConstantWidth:
{
  return objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a4, 7, 0, 0, 0, 0.0, a1);
}

+ (uint64_t)_gkConstraintForView:()GKAdditions withConstantHeight:
{
  return objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a4, 8, 0, 0, 0, 0.0, a1);
}

+ (uint64_t)_gkConstraintForView:()GKAdditions baselineAlignedUnderView:offsetBy:
{
  return objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a4, 11, 0, a5, 11, 1.0, a1);
}

+ (uint64_t)_gkConstraintForView:()GKAdditions withWidthDerivedFromView:insetBy:
{
  return objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a4, 7, 0, a5, 7, 1.0, -a1);
}

+ (uint64_t)_gkConstraintForView:()GKAdditions withHeightDerivedFromView:insetBy:
{
  return objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a4, 8, 0, a5, 8, 1.0, -a1);
}

+ (id)_gkConstraintsForView:()GKAdditions withinView:insets:
{
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v13 = (void *)MEMORY[0x1E0CB3718];
  v14 = a8;
  v15 = a7;
  objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 1, 0, v15, 1, 1.0, a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 2, 0, v15, 2, 1.0, -a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 3, 0, v15, 3, 1.0, a1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 4, 0, v15, 4, 1.0, -a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v18;
  v22[1] = v16;
  v22[2] = v19;
  v22[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (uint64_t)_gkInstallEdgeConstraintsForView:()GKAdditions containedWithinParentView:
{
  return objc_msgSend(a1, "_gkInstallEdgeConstraintsForView:containedWithinParentView:margin:", 0.0);
}

+ (void)_gkInstallEdgeConstraintsForView:()GKAdditions containedWithinParentView:margin:
{
  id v7;
  id v8;
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
  id v20;

  v7 = a5;
  v8 = a4;
  objc_msgSend(v8, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  objc_msgSend(v8, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  objc_msgSend(v8, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, a1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  objc_msgSend(v8, "bottomAnchor");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v18, a1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

}

+ (void)_gkInstallEdgeConstraintsForView:()GKAdditions containedWithinParentView:edgeInsets:
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v13 = a8;
  v14 = a7;
  objc_msgSend(v14, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, a2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  objc_msgSend(v14, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActive:", 1);

  objc_msgSend(v14, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, a1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  objc_msgSend(v14, "bottomAnchor");
  v26 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v24, a3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

}

+ (void)_gkInstallEdgeConstraintsForLayoutGuide:()GKAdditions containedWithinParentView:
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
  void *v17;
  id v18;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  objc_msgSend(v6, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  objc_msgSend(v6, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  objc_msgSend(v6, "bottomAnchor");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

}

+ (id)_gkConstraintsForViews:()GKAdditions alignedByAttribute:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      v13 = v10;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12), a4, 0, v13, a4, 1.0, 0.0, (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v15);

        }
        v10 = v14;

        ++v12;
        v13 = v10;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);

  }
  return v6;
}

+ (uint64_t)_gkConstraintsForViews:()GKAdditions contiguouslyLaidOutVertically:overlap:withinView:insets:
{
  return objc_msgSend(a1, "_gkConstraintsForViews:contiguouslyLaidOutVertically:overlap:withinView:insets:applyOrthogonalConstraints:", a3, a4, a5, 1);
}

+ (id)_gkConstraintsForViews:()GKAdditions contiguouslyLaidOutVertically:overlap:withinView:insets:applyOrthogonalConstraints:
{
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  char v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  double v47;
  char v48;
  _QWORD v49[5];
  id v50;

  v19 = a8;
  v20 = a10;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__10;
  v49[4] = __Block_byref_object_dispose__10;
  v50 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v19, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v19, "objectAtIndex:", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = a11;
    objc_msgSend(v19, "lastObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a9)
      v23 = 3;
    else
      v23 = 1;
    if (a9)
      v24 = 4;
    else
      v24 = 2;
    if (a9)
      v25 = 1;
    else
      v25 = 3;
    if (a9)
      v26 = 2;
    else
      v26 = 4;
    if (a9)
      v27 = a2;
    else
      v27 = a3;
    if (a9)
      v28 = a4;
    else
      v28 = a5;
    if (!a9)
    {
      a3 = a2;
      a5 = a4;
    }
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v36, v23, 0, v20, v23, 1.0, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v29);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v22, v24, 0, v20, v24, 1.0, -v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v30);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __141__NSLayoutConstraint_GKAdditions___gkConstraintsForViews_contiguouslyLaidOutVertically_overlap_withinView_insets_applyOrthogonalConstraints___block_invoke;
    v37[3] = &unk_1E59C8218;
    v40 = v49;
    v41 = v23;
    v42 = v24;
    v43 = a1;
    v31 = v21;
    v48 = v35;
    v38 = v31;
    v44 = v25;
    v39 = v20;
    v45 = a3;
    v46 = v26;
    v47 = a5;
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", v37);
    v32 = v39;
    v33 = v31;

  }
  _Block_object_dispose(v49, 8);

  return v21;
}

@end
