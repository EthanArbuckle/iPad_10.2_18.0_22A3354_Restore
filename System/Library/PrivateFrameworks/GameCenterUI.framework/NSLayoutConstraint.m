@implementation NSLayoutConstraint

void __141__NSLayoutConstraint_GKAdditions___gkConstraintsForViews_contiguouslyLaidOutVertically_overlap_withinView_insets_applyOrthogonalConstraints___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, *(_QWORD *)(a1 + 56), 0, v4, *(_QWORD *)(a1 + 64), 1.0, -*(double *)(a1 + 72));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  }
  if (*(_BYTE *)(a1 + 112))
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, *(_QWORD *)(a1 + 80), 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), 1.0, *(double *)(a1 + 88));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, *(_QWORD *)(a1 + 96), 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 96), 1.0, -*(double *)(a1 + 104));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __102__NSLayoutConstraint_GKBaselineLayout___gkBaselineConstraintsForViewsFontsLeadings_superview_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "doubleValue");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    }
    else
    {
      v5 = v11;
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v7 = *(_QWORD *)(v6 + 40);
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 12, 0, v7, 11, 1.0, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        {
          +[GKConstraintUpdateController sharedController](GKConstraintUpdateController, "sharedController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "registerConstraint:leading:forFontTextStyle:", v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

        }
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      }
      v10 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
  }

}

void __102__NSLayoutConstraint_GKBaselineLayout___gkBaselineConstraintsForViewsFontsLeadings_superview_options___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0CB3718];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 1, 0, v5, 1, 1.0, 0.0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(a1 + 32), 2, 0, v5, 2, 1.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

@end
