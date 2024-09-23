@implementation LPVerticalTextStackView

- (LPVerticalTextStackView)initWithHost:(id)a3
{

  return 0;
}

- (LPVerticalTextStackView)initWithHost:(id)a3 style:(id)a4
{
  id v6;
  id v7;
  LPVerticalTextStackView *v8;
  NSMutableArray *v9;
  NSMutableArray *items;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  LPVerticalTextStackView *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)LPVerticalTextStackView;
  v8 = -[LPComponentView initWithHost:](&v17, sel_initWithHost_, v6);
  if (v8)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    items = v8->_items;
    v8->_items = v9;

    objc_storeStrong((id *)&v8->_style, a4);
    if (+[LPSettings showDebugIndicators](LPSettings, "showDebugIndicators"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "purpleColor");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = objc_msgSend(v11, "CGColor");
      -[LPVerticalTextStackView layer](v8, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBorderColor:", v12);

      -[LPVerticalTextStackView layer](v8, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setBorderWidth:", 0.5);

    }
    v15 = v8;
  }

  return v8;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
  }
}

- (void)addArrangedSubview:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasEverBuilt)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Trying to update a text stack after it has been laid out."));
  -[NSMutableArray addObject:](self->_items, "addObject:", v4);
  -[LPVerticalTextStackView addSubview:](self, "addSubview:", v4);

}

- (void)layoutComponentView
{
  double v3;
  double v4;

  -[LPVerticalTextStackView bounds](self, "bounds");
  -[LPVerticalTextStackView _layoutTextStackForSize:applyingLayout:](self, "_layoutTextStackForSize:applyingLayout:", 1, v3 - (self->_contentInset.left + self->_contentInset.right), v4 - (self->_contentInset.top + self->_contentInset.bottom));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  UIEdgeInsets *p_contentInset;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  p_contentInset = &self->_contentInset;
  -[LPVerticalTextStackView _layoutTextStackForSize:applyingLayout:](self, "_layoutTextStackForSize:applyingLayout:", 0, a3.width - (self->_contentInset.left + self->_contentInset.right), a3.height - (self->_contentInset.top + self->_contentInset.bottom));
  v6 = ceil(v4) - (-p_contentInset->right - p_contentInset->left);
  v7 = ceil(v5) - (-p_contentInset->bottom - p_contentInset->top);
  result.height = v7;
  result.width = v6;
  return result;
}

- (int64_t)computedNumberOfLines
{
  NSMutableArray *v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_items;
  v3 = 0;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v3 += objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "computedNumberOfLines", (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return v3;
}

- (CGSize)_layoutTextStackForSize:(CGSize)a3 applyingLayout:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  CGFloat width;
  void *v8;
  unsigned int v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *items;
  NSMutableArray *v14;
  void *v15;
  void (**v16)(void);
  NSMutableArray *v17;
  NSMutableArray *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _QWORD v23[5];
  BOOL v24;
  _QWORD v25[4];
  void (**v26)(void);
  uint64_t *v27;
  void *v28;
  CGFloat v29;
  double v30;
  BOOL v31;
  _QWORD aBlock[10];
  uint64_t v33;
  double *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[7];
  _QWORD v40[8];
  BOOL v41;
  CGSize result;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  v8 = malloc_type_calloc(-[NSMutableArray count](self->_items, "count"), 0x10uLL, 0x1000040451B5BE8uLL);
  v9 = -[LPVerticalTextStackViewStyle maximumNumberOfLines](self->_style, "maximumNumberOfLines");
  v10 = v9 != 0;
  v11 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v33 = 0;
    v34 = (double *)&v33;
    v35 = 0x2020000000;
    v36 = 0;
    v12 = -[LPVerticalTextStackViewStyle maximumNumberOfLines](self->_style, "maximumNumberOfLines");
    v36 = (void *)(v12 - -[NSMutableArray count](self->_items, "count"));
    items = self->_items;
    v40[0] = v11;
    v40[1] = 3221225472;
    v40[2] = __66__LPVerticalTextStackView__layoutTextStackForSize_applyingLayout___block_invoke;
    v40[3] = &unk_1E44A8CF0;
    v40[4] = &v33;
    *(CGFloat *)&v40[5] = width;
    *(double *)&v40[6] = height;
    v40[7] = v8;
    v41 = v4;
    -[NSMutableArray enumerateObjectsUsingBlock:](items, "enumerateObjectsUsingBlock:", v40);
    _Block_object_dispose(&v33, 8);
  }
  else
  {
    v14 = self->_items;
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __66__LPVerticalTextStackView__layoutTextStackForSize_applyingLayout___block_invoke_2;
    v39[3] = &__block_descriptor_56_e49_v32__0__LPComponentView_LPTextStyleable__8Q16_B24l;
    v39[4] = v8;
    *(CGFloat *)&v39[5] = width;
    *(double *)&v39[6] = height;
    -[NSMutableArray enumerateObjectsUsingBlock:](v14, "enumerateObjectsUsingBlock:", v39);
  }
  v15 = malloc_type_calloc(-[NSMutableArray count](self->_items, "count"), 0x20uLL, 0x1000040E0EAB150uLL);
  v33 = 0;
  v34 = (double *)&v33;
  v35 = 0x3010000000;
  v37 = 0;
  v38 = 0;
  v36 = &unk_1A0D74BC9;
  aBlock[0] = v11;
  aBlock[1] = 3221225472;
  aBlock[2] = __66__LPVerticalTextStackView__layoutTextStackForSize_applyingLayout___block_invoke_3;
  aBlock[3] = &unk_1E44A8D60;
  aBlock[5] = &v33;
  aBlock[6] = v15;
  *(CGFloat *)&aBlock[7] = width;
  *(double *)&aBlock[8] = height;
  aBlock[9] = v8;
  aBlock[4] = self;
  v16 = (void (**)(void))_Block_copy(aBlock);
  v16[2]();
  if (v34[5] > height)
  {
    v17 = self->_items;
    v25[0] = v11;
    v25[1] = 3221225472;
    v25[2] = __66__LPVerticalTextStackView__layoutTextStackForSize_applyingLayout___block_invoke_5;
    v25[3] = &unk_1E44A8D88;
    v28 = v8;
    v29 = width;
    v30 = height;
    v31 = v4;
    v26 = v16;
    v27 = &v33;
    -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](v17, "enumerateObjectsWithOptions:usingBlock:", 2, v25);

  }
  if (v4)
  {
    v18 = self->_items;
    v23[0] = v11;
    v23[1] = 3221225472;
    v23[2] = __66__LPVerticalTextStackView__layoutTextStackForSize_applyingLayout___block_invoke_6;
    v23[3] = &__block_descriptor_41_e49_v32__0__LPComponentView_LPTextStyleable__8Q16_B24l;
    v24 = v10;
    v23[4] = v15;
    -[NSMutableArray enumerateObjectsUsingBlock:](v18, "enumerateObjectsUsingBlock:", v23);
  }
  free(v8);
  free(v15);
  v19 = v34[4];
  v20 = v34[5];

  _Block_object_dispose(&v33, 8);
  v21 = v19;
  v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

void __66__LPVerticalTextStackView__layoutTextStackForSize_applyingLayout___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double *v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v19 = a2;
  objc_msgSend(v19, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = objc_msgSend(v19, "overrideMaximumNumberOfLines");
  objc_msgSend(v19, "setOverrideMaximumNumberOfLines:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 1);
  objc_msgSend(v19, "sizeThatFits:", *(double *)(a1 + 40), 1.79769313e308);
  v14 = (double *)(*(_QWORD *)(a1 + 56) + 16 * a3);
  *v14 = v15;
  v14[1] = v16;
  objc_msgSend(v19, "setFrame:", 0.0, 0.0, v15, v16);
  v17 = objc_msgSend(v19, "computedNumberOfLines");
  objc_msgSend(v19, "setFrame:", v6, v8, v10, v12);
  if (!*(_BYTE *)(a1 + 64))
    objc_msgSend(v19, "setOverrideMaximumNumberOfLines:", v13);
  if (v17 <= 1)
    v18 = 1;
  else
    v18 = v17;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24)
                                                              - v18
                                                              + 1;

}

void __66__LPVerticalTextStackView__layoutTextStackForSize_applyingLayout___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  objc_msgSend(v5, "sizeThatFits:", *(double *)(a1 + 40), 1.79769313e308);
  v7 = (_QWORD *)(v6 + 16 * a3);
  *v7 = v8;
  v7[1] = v9;

}

void __66__LPVerticalTextStackView__layoutTextStackForSize_applyingLayout___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  _QWORD v13[8];
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double *v21;
  uint64_t v22;
  uint64_t v23;

  v20 = 0;
  v21 = (double *)&v20;
  v22 = 0x2020000000;
  v23 = 0;
  v3 = *(_QWORD *)(a1 + 32);
  v23 = *(_QWORD *)(v3 + 440);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v4 = *(void **)(v3 + 424);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__LPVerticalTextStackView__layoutTextStackForSize_applyingLayout___block_invoke_4;
  v13[3] = &unk_1E44A8D38;
  v13[4] = v3;
  v13[5] = &v20;
  v5 = *(_QWORD *)(a1 + 48);
  v14 = *(_OWORD *)(a1 + 56);
  v15 = *(_QWORD *)(a1 + 72);
  v13[6] = &v16;
  v13[7] = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v13);
  v6 = v17[3];
  v7 = v21[3];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastLineDescent");
  v10 = v9;
  if (v9 == 0.0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "lastLineDescent");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "value");
  }
  v11 = v7 + v9 - *(double *)(*(_QWORD *)(a1 + 32) + 440);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v12 + 32) = v6;
  *(double *)(v12 + 40) = v11;
  if (v10 == 0.0)

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
}

void __66__LPVerticalTextStackView__layoutTextStackForSize_applyingLayout___block_invoke_4(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double *v15;
  double v16;
  double v17;
  id v18;

  v5 = a2;
  v18 = v5;
  if (a3)
  {
    objc_msgSend(v5, "firstLineLeading");
    v7 = v6;
  }
  else
  {
    objc_msgSend(*(id *)(a1[4] + 472), "firstLineLeading");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v7 = v9;

  }
  if (v7 != 0.0)
  {
    v10 = *(double *)(*(_QWORD *)(a1[5] + 8) + 24);
    objc_msgSend(v18, "ascender");
    *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = floor(v7 + v10 - v11);
  }
  v12 = a1[7] + 32 * a3;
  v13 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v14 = a1[8];
  *(_QWORD *)v12 = *(_QWORD *)(a1[4] + 448);
  *(_QWORD *)(v12 + 8) = v13;
  *(_QWORD *)(v12 + 16) = v14;
  *(_QWORD *)(v12 + 24) = 0;
  v15 = (double *)(a1[10] + 16 * a3);
  v16 = *v15;
  *(double *)(v12 + 24) = v15[1];
  *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = fmax(*(double *)(*(_QWORD *)(a1[6] + 8) + 24), v16);
  *(CGFloat *)(*(_QWORD *)(a1[5] + 8) + 24) = CGRectGetMaxY(*(CGRect *)v12);
  if (objc_msgSend(*(id *)(a1[4] + 472), "shouldAlignToBaselines"))
  {
    objc_msgSend(v18, "descender");
    *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = v17 + *(double *)(*(_QWORD *)(a1[5] + 8) + 24);
  }

}

void __66__LPVerticalTextStackView__layoutTextStackForSize_applyingLayout___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v7 = objc_msgSend(v12, "overrideMaximumNumberOfLines");
  objc_msgSend(v12, "setOverrideMaximumNumberOfLines:", 1);
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v12, "sizeThatFits:", *(double *)(a1 + 56), 1.79769313e308);
  v9 = (_QWORD *)(v8 + 16 * a3);
  *v9 = v10;
  v9[1] = v11;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (!*(_BYTE *)(a1 + 72))
    objc_msgSend(v12, "setOverrideMaximumNumberOfLines:", v7);
  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) <= *(double *)(a1 + 64))
    *a4 = 1;

}

void __66__LPVerticalTextStackView__layoutTextStackForSize_applyingLayout___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (!*(_BYTE *)(a1 + 40))
    objc_msgSend(v5, "setOverrideMaximumNumberOfLines:", 0);
  objc_msgSend(v5, "setFrame:", *(double *)(*(_QWORD *)(a1 + 32) + 32 * a3), *(double *)(*(_QWORD *)(a1 + 32) + 32 * a3 + 8), *(double *)(*(_QWORD *)(a1 + 32) + 32 * a3 + 16), *(double *)(*(_QWORD *)(a1 + 32) + 32 * a3 + 24));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
