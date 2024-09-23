@implementation CRKComposedStackView

- (CRKComposedStackView)initWithFrame:(CGRect)a3
{
  CRKComposedStackView *v3;
  NSMutableArray *v4;
  NSMutableArray *keylines;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRKComposedStackView;
  v3 = -[CRKComposedView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    keylines = v3->_keylines;
    v3->_keylines = v4;

  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRKComposedStackView;
  -[CRKComposedStackView layoutSubviews](&v3, sel_layoutSubviews);
  -[CRKComposedStackView _updateLayout](self, "_updateLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CRKComposedView cardSectionSubviews](self, "cardSectionSubviews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "sizeThatFits:", width, height);
        v9 = v9 + v11;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }

  if (height >= v9)
    v12 = v9;
  else
    v12 = height;
  v13 = width;
  result.height = v12;
  result.width = v13;
  return result;
}

- (void)_updateLayout
{
  CGFloat Width;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[8];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CGFloat v15;
  uint64_t v16;
  _QWORD v17[4];
  CGRect v18;

  -[CRKComposedStackView bounds](self, "bounds");
  Width = CGRectGetWidth(v18);
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x4010000000;
  v13 = 0;
  v14 = 0;
  v12 = "";
  v15 = Width;
  v16 = 0x3FF0000000000000;
  if (-[NSMutableArray count](self->_keylines, "count"))
  {
    -[NSMutableArray firstObject](self->_keylines, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sizeThatFits:", v10[6], v10[7]);
    v6 = v5;

    *((_QWORD *)v10 + 7) = v6;
  }
  -[CRKComposedView cardSectionSubviews](self, "cardSectionSubviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__CRKComposedStackView__updateLayout__block_invoke;
  v8[3] = &unk_24DA4CFE8;
  v8[4] = self;
  v8[5] = v17;
  *(CGFloat *)&v8[7] = Width;
  v8[6] = &v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(v17, 8);
}

void __37__CRKComposedStackView__updateLayout__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  void *v7;
  id v8;
  CGRect v9;

  v8 = a2;
  v5 = 0.0;
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_255046AC8))
  {
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    objc_msgSend(v8, "sizeThatFits:", CGRectGetWidth(v9), 1.79769313e308);
    v5 = v6;
  }
  objc_msgSend(v8, "setFrame:", 0.0, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(double *)(a1 + 56), v5);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56));
  objc_msgSend(v7, "setHidden:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "count") - 1 == a3);

}

- (void)triggerLayoutAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57__CRKComposedStackView_triggerLayoutAnimated_completion___block_invoke;
  v12[3] = &unk_24DA4D010;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v9 = MEMORY[0x219A28084](v12);
  v10 = (void *)v9;
  if (v4)
  {
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __57__CRKComposedStackView_triggerLayoutAnimated_completion___block_invoke_2;
    v11[3] = &unk_24DA4CCA0;
    v11[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v11, v8, 0.5, 0.0, 1.0, 0.5);
  }
  else
  {
    (*(void (**)(uint64_t))(v9 + 16))(v9);
  }

}

uint64_t __57__CRKComposedStackView_triggerLayoutAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateLayout");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __57__CRKComposedStackView_triggerLayoutAnimated_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLayout");
}

- (void)setCardSectionSubviews:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *keylines;
  id v7;
  void *v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  objc_super v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  -[CRKComposedView cardSectionSubviews](self, "cardSectionSubviews");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != v4)
  {
    keylines = self->_keylines;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __47__CRKComposedStackView_setCardSectionSubviews___block_invoke;
    v12[3] = &unk_24DA4D038;
    v12[4] = self;
    v7 = v4;
    v13 = v7;
    v14 = v5;
    -[NSMutableArray sortedArrayUsingComparator:](keylines, "sortedArrayUsingComparator:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSMutableArray *)objc_msgSend(v8, "mutableCopy");
    v10 = self->_keylines;
    self->_keylines = v9;

    v11.receiver = self;
    v11.super_class = (Class)CRKComposedStackView;
    -[CRKComposedView setCardSectionSubviews:](&v11, sel_setCardSectionSubviews_, v7);

  }
}

uint64_t __47__CRKComposedStackView_setCardSectionSubviews___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 432);
  v6 = a3;
  v7 = objc_msgSend(v5, "indexOfObject:", a2);
  v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "indexOfObject:", v6);

  v9 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "indexOfObject:", v10);

  v12 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "indexOfObject:", v13);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "compare:", v16);

  return v17;
}

- (void)addCardSectionSubview:(id)a3 withKeyline:(int64_t)a4
{
  id v6;
  void *v7;
  _BOOL8 v8;
  CRKKeyline *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKComposedStackView;
  -[CRKComposedView addCardSectionSubview:withKeyline:](&v10, sel_addCardSectionSubview_withKeyline_, v6, a4);
  if (v6)
  {
    objc_msgSend(v6, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceStyle") == 2;

    v9 = -[CRKKeyline initWithType:direction:visualEffectStyle:]([CRKKeyline alloc], "initWithType:direction:visualEffectStyle:", a4, self->_direction - 3 < 0xFFFFFFFFFFFFFFFELL, v8);
    -[NSMutableArray addObject:](self->_keylines, "addObject:", v9);
    -[CRKComposedStackView addSubview:](self, "addSubview:", v9);
    -[CRKComposedStackView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)cardSectionSubviewWantsToBeRemovedFromHierarchy:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  if (v4)
  {
    -[CRKComposedView cardSectionSubviews](self, "cardSectionSubviews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "indexOfObject:", v4);

    -[NSMutableArray objectAtIndex:](self->_keylines, "objectAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObject:](self->_keylines, "removeObject:", v7);
    objc_msgSend(v7, "removeFromSuperview");
    -[CRKComposedStackView setNeedsLayout](self, "setNeedsLayout");

  }
  v8.receiver = self;
  v8.super_class = (Class)CRKComposedStackView;
  -[CRKComposedView cardSectionSubviewWantsToBeRemovedFromHierarchy:](&v8, sel_cardSectionSubviewWantsToBeRemovedFromHierarchy_, v4);

}

- (UIEdgeInsets)templatedContentMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 16.0;
  v4 = 0.0;
  v5 = 16.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(unint64_t)a3
{
  self->_direction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keylines, 0);
}

@end
