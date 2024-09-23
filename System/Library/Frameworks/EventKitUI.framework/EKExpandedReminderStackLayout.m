@implementation EKExpandedReminderStackLayout

- (EKExpandedReminderStackLayout)initWithDelegate:(id)a3
{
  EKExpandedReminderStackLayoutDelegate **p_delegate;
  id v5;
  id v6;
  void *v7;
  EKExpandedReminderStackLayout *v8;
  objc_super v10;
  _QWORD aBlock[4];
  char v12;

  p_delegate = &self->_delegate;
  v5 = a3;
  v6 = objc_storeWeak((id *)p_delegate, v5);
  LOBYTE(p_delegate) = objc_msgSend(v5, "expandedReminderStackShouldDoCompactLayout");

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__EKExpandedReminderStackLayout_initWithDelegate___block_invoke;
  aBlock[3] = &__block_descriptor_33_e71___NSCollectionLayoutSection_24__0q8___NSCollectionLayoutEnvironment__16l;
  v12 = (char)p_delegate;
  v7 = _Block_copy(aBlock);
  v10.receiver = self;
  v10.super_class = (Class)EKExpandedReminderStackLayout;
  v8 = -[EKExpandedReminderStackLayout initWithSectionProvider:](&v10, sel_initWithSectionProvider_, v7);

  return v8;
}

id __50__EKExpandedReminderStackLayout_initWithDelegate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  double v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EKExpandedReminderStackCell exampleCell](EKExpandedReminderStackCell, "exampleCell");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKExpandedReminderStackLayout itemFittingSizeForCell:withLayoutEnvironment:](EKExpandedReminderStackLayout, "itemFittingSizeForCell:withLayoutEnvironment:");
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v6;
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC3350];
  v26 = (void *)v8;
  v31[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "verticalGroupWithLayoutSize:subitems:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInterGroupSpacing:", 8.0);
  if (*(_BYTE *)(a1 + 32))
  {
    objc_msgSend(v4, "container");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentSize");
    v15 = v14;
    v17 = v16;

    +[EKExpandedReminderDateView exampleHeader](EKExpandedReminderDateView, "exampleHeader");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKExpandedReminderStackLayout itemFittingSizeForCell:withLayoutEnvironment:](EKExpandedReminderStackLayout, "itemFittingSizeForCell:withLayoutEnvironment:", v18, v4);
    objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v21, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v22, *MEMORY[0x1E0DC48A8], 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBoundarySupplementaryItems:", v24);

    objc_msgSend(v23, "setContentInsets:", v17 * -0.07, 0.0, 0.0, 0.0);
    objc_msgSend(v12, "setContentInsets:", v17 * 0.035, v15 * 0.106, 0.0, v15 * 0.106);

  }
  else
  {
    objc_msgSend(v12, "setContentInsets:", 16.0, 13.0, 16.0, 13.0);
  }

  return v12;
}

+ (CGSize)itemFittingSizeForCell:(id)a3 withLayoutEnvironment:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v5 = a3;
  objc_msgSend(a4, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentSize");
  v8 = v7;

  LODWORD(v9) = 1148846080;
  LODWORD(v10) = 1112014848;
  objc_msgSend(v5, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v8, 3.40282347e38, v9, v10);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

+ (double)verticalCellPaddingForPopover
{
  return 8.0;
}

+ (double)verticalCollectionViewPaddingForPopover
{
  return 16.0;
}

- (void)prepareCellAnimationWithLayoutAttributes:(id)a3 indexPath:(id)a4
{
  EKExpandedReminderStackLayoutDelegate **p_delegate;
  id v6;
  id WeakRetained;
  uint64_t v8;
  id v9;

  p_delegate = &self->_delegate;
  v6 = a4;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "stackedReminderViewFrame");
  objc_msgSend(v9, "setFrame:");

  v8 = objc_msgSend(v6, "row");
  objc_msgSend(v9, "setZIndex:", -v8);

}

- (void)prepareHeaderAnimationWithLayoutAttributes:(id)a3
{
  id v3;
  CGAffineTransform v4;
  CGAffineTransform v5;

  v3 = a3;
  CGAffineTransformMakeScale(&v5, 0.7, 0.7);
  v4 = v5;
  objc_msgSend(v3, "setTransform:", &v4);
  objc_msgSend(v3, "setAlpha:", 0.0);

}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKExpandedReminderStackLayout;
  v4 = a3;
  -[EKExpandedReminderStackLayout initialLayoutAttributesForAppearingItemAtIndexPath:](&v7, sel_initialLayoutAttributesForAppearingItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKExpandedReminderStackLayout prepareCellAnimationWithLayoutAttributes:indexPath:](self, "prepareCellAnimationWithLayoutAttributes:indexPath:", v5, v4, v7.receiver, v7.super_class);

  return v5;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKExpandedReminderStackLayout;
  v4 = a3;
  -[EKExpandedReminderStackLayout finalLayoutAttributesForDisappearingItemAtIndexPath:](&v7, sel_finalLayoutAttributesForDisappearingItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKExpandedReminderStackLayout prepareCellAnimationWithLayoutAttributes:indexPath:](self, "prepareCellAnimationWithLayoutAttributes:indexPath:", v5, v4, v7.receiver, v7.super_class);

  return v5;
}

- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKExpandedReminderStackLayout;
  -[EKExpandedReminderStackLayout initialLayoutAttributesForAppearingSupplementaryElementOfKind:atIndexPath:](&v7, sel_initialLayoutAttributesForAppearingSupplementaryElementOfKind_atIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKExpandedReminderStackLayout prepareHeaderAnimationWithLayoutAttributes:](self, "prepareHeaderAnimationWithLayoutAttributes:", v5);
  return v5;
}

- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKExpandedReminderStackLayout;
  -[EKExpandedReminderStackLayout finalLayoutAttributesForDisappearingSupplementaryElementOfKind:atIndexPath:](&v7, sel_finalLayoutAttributesForDisappearingSupplementaryElementOfKind_atIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKExpandedReminderStackLayout prepareHeaderAnimationWithLayoutAttributes:](self, "prepareHeaderAnimationWithLayoutAttributes:", v5);
  return v5;
}

- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5
{
  id v7;
  id v8;
  char v9;
  void *v10;
  char v11;
  id v12;
  id v13;
  void *v14;
  _QWORD aBlock[4];
  id v17;
  id v18;
  char v19;
  char v20;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  v9 = objc_opt_isKindOfClass() & 1;
  -[EKExpandedReminderStackLayout delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "viewControllerIsDisappearing");

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__EKExpandedReminderStackLayout__animationForReusableView_toLayoutAttributes_type___block_invoke;
  aBlock[3] = &unk_1E601B698;
  v19 = v11;
  v20 = v9;
  v17 = v7;
  v18 = v8;
  v12 = v8;
  v13 = v7;
  v14 = _Block_copy(aBlock);

  return v14;
}

void __83__EKExpandedReminderStackLayout__animationForReusableView_toLayoutAttributes_type___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  char v16;

  v3 = a2;
  if (*(_BYTE *)(a1 + 48) || !*(_BYTE *)(a1 + 49))
  {
    objc_msgSend(MEMORY[0x1E0DC3F38], "expandingStackedRemindersSpringAnimator");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3F38], "expandingLayoutAttributesStackedRemindersSpringAnimator");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__EKExpandedReminderStackLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_2;
  v13[3] = &unk_1E6019510;
  v16 = *(_BYTE *)(a1 + 49);
  v14 = *(id *)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v5, "addAnimations:", v13);
  v8 = v6;
  v9 = 3221225472;
  v10 = __83__EKExpandedReminderStackLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_3;
  v11 = &unk_1E601B670;
  v12 = v3;
  v7 = v3;
  objc_msgSend(v5, "addCompletion:", &v8);
  objc_msgSend(v5, "startAnimation", v8, v9, v10, v11);

}

uint64_t __83__EKExpandedReminderStackLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  void *v5;
  _OWORD v6[3];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v3, "frame");
    return objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  }
  else
  {
    if (v3)
    {
      objc_msgSend(v3, "transform");
    }
    else
    {
      v8 = 0u;
      v9 = 0u;
      v7 = 0u;
    }
    v5 = *(void **)(a1 + 32);
    v6[0] = v7;
    v6[1] = v8;
    v6[2] = v9;
    objc_msgSend(v5, "setTransform:", v6);
    objc_msgSend(*(id *)(a1 + 40), "alpha");
    return objc_msgSend(*(id *)(a1 + 32), "setAlpha:");
  }
}

uint64_t __83__EKExpandedReminderStackLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (EKExpandedReminderStackLayoutDelegate)delegate
{
  return (EKExpandedReminderStackLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
