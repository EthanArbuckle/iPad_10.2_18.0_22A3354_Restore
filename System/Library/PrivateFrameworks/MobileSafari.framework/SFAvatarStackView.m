@implementation SFAvatarStackView

- (NSArray)shareParticipants
{
  return self->_shareParticipants;
}

- (void)_setIndexes:(id)a3 ofParticipantIdentifiers:(id)a4 transitioning:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  SFAvatarStackView *v23;
  BOOL v24;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)MEMORY[0x1E0DC3F10];
  v20[0] = MEMORY[0x1E0C809B0];
  if (v7)
    v14 = 0.0;
  else
    v14 = 0.25;
  v20[1] = 3221225472;
  v20[2] = __83__SFAvatarStackView__setIndexes_ofParticipantIdentifiers_transitioning_completion___block_invoke;
  v20[3] = &unk_1E21E2D98;
  v21 = v11;
  v22 = v10;
  v23 = self;
  v24 = v7;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __83__SFAvatarStackView__setIndexes_ofParticipantIdentifiers_transitioning_completion___block_invoke_3;
  v18[3] = &unk_1E21E2608;
  v19 = v12;
  v15 = v12;
  v16 = v10;
  v17 = v11;
  objc_msgSend(v13, "sf_animate:usingDefaultMotionWithDelay:options:animations:completion:", 1, 98, v20, v18, v14);

}

uint64_t __83__SFAvatarStackView__setIndexes_ofParticipantIdentifiers_transitioning_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

uint64_t __83__SFAvatarStackView__setIndexes_ofParticipantIdentifiers_transitioning_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];
  char v5;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__SFAvatarStackView__setIndexes_ofParticipantIdentifiers_transitioning_completion___block_invoke_2;
  v4[3] = &unk_1E21E2D70;
  v4[4] = *(_QWORD *)(a1 + 48);
  v5 = *(_BYTE *)(a1 + 56);
  return objc_msgSend(v2, "enumerateObjectsAtIndexes:options:usingBlock:", v1, 0, v4);
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFAvatarStackView;
  -[SFAvatarStackView layoutSubviews](&v4, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, -[NSArray count](self->_visibleParticipantIdentifiers, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAvatarStackView _layOutIndexes:ofParticipantIdentifiers:targetWidth:](self, "_layOutIndexes:ofParticipantIdentifiers:targetWidth:", v3, self->_visibleParticipantIdentifiers, 0);
  -[SFAvatarStackView _setIndexes:ofParticipantIdentifiers:transitioning:completion:](self, "_setIndexes:ofParticipantIdentifiers:transitioning:completion:", v3, self->_visibleParticipantIdentifiers, 0, 0);

}

- (void)_layOutIndexes:(id)a3 ofParticipantIdentifiers:(id)a4 targetWidth:(id)a5
{
  id v8;
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double Width;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  _QWORD v27[13];
  CGRect v28;

  v25 = a4;
  v8 = a5;
  v9 = a3;
  -[SFAvatarStackView bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[SFAvatarStackView _widthForParticipantCount:](self, "_widthForParticipantCount:", objc_msgSend(v25, "count"));
  v19 = v18;
  if (v8)
  {
    objc_msgSend(v8, "doubleValue");
  }
  else
  {
    v28.origin.x = v11;
    v28.origin.y = v13;
    v28.size.width = v15;
    v28.size.height = v17;
    Width = CGRectGetWidth(v28);
  }
  -[SFAvatarStackView _contentRectForContentWidth:viewWith:](self, "_contentRectForContentWidth:viewWith:", v19, Width, v25);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __73__SFAvatarStackView__layOutIndexes_ofParticipantIdentifiers_targetWidth___block_invoke;
  v27[3] = &unk_1E21E2D48;
  v27[4] = self;
  v27[5] = v21;
  v27[6] = v22;
  v27[7] = v23;
  v27[8] = v24;
  *(CGFloat *)&v27[9] = v11;
  *(CGFloat *)&v27[10] = v13;
  *(CGFloat *)&v27[11] = v15;
  *(CGFloat *)&v27[12] = v17;
  objc_msgSend(v26, "enumerateObjectsAtIndexes:options:usingBlock:", v9, 0, v27);

}

- (CGRect)_contentRectForContentWidth:(double)a3 viewWith:(double)a4
{
  int64_t alignment;
  double v8;
  _BOOL4 v9;
  double avatarDiameter;
  double v11;
  double v12;
  CGRect result;

  alignment = self->_alignment;
  if (alignment == 1)
  {
    v9 = -[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
    v8 = a4 - a3;
    if (!v9)
      v8 = 0.0;
  }
  else
  {
    v8 = (a4 - a3) * 0.5;
    if (alignment)
      v8 = 0.0;
  }
  avatarDiameter = self->_avatarDiameter;
  v11 = 0.0;
  v12 = a3;
  result.size.height = avatarDiameter;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v8;
  return result;
}

- (CGSize)sizeForParticipantCount:(int64_t)a3
{
  double v4;
  double avatarDiameter;
  CGSize result;

  if (a3 >= 3)
    a3 = 3;
  -[SFAvatarStackView _widthForParticipantCount:](self, "_widthForParticipantCount:", a3);
  avatarDiameter = self->_avatarDiameter;
  result.height = avatarDiameter;
  result.width = v4;
  return result;
}

- (double)_widthForParticipantCount:(int64_t)a3
{
  int64_t v3;

  if (a3 <= 1)
    v3 = 1;
  else
    v3 = a3;
  return self->_spacing * (double)(v3 - 1) + (double)a3 * self->_avatarDiameter;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[SFAvatarStackView sizeForParticipantCount:](self, "sizeForParticipantCount:", -[NSArray count](self->_visibleParticipantIdentifiers, "count"));
  result.height = v3;
  result.width = v2;
  return result;
}

- (SFAvatarStackView)initWithFrame:(CGRect)a3
{
  SFAvatarStackView *v3;
  SFAvatarStackView *v4;
  uint64_t v5;
  NSMutableDictionary *avatarViewControllersByParticipantIdentifier;
  uint64_t v7;
  NSMutableDictionary *contactsByParticipantIdentifer;
  NSArray *visibleParticipantIdentifiers;
  SFAvatarStackView *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFAvatarStackView;
  v3 = -[SFAvatarStackView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFAvatarStackView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v4->_alignment = 1;
    v4->_avatarDiameter = 22.0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    avatarViewControllersByParticipantIdentifier = v4->_avatarViewControllersByParticipantIdentifier;
    v4->_avatarViewControllersByParticipantIdentifier = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    contactsByParticipantIdentifer = v4->_contactsByParticipantIdentifer;
    v4->_contactsByParticipantIdentifer = (NSMutableDictionary *)v7;

    v4->_spacing = -6.0;
    visibleParticipantIdentifiers = v4->_visibleParticipantIdentifiers;
    v4->_visibleParticipantIdentifiers = (NSArray *)MEMORY[0x1E0C9AA60];

    v10 = v4;
  }

  return v4;
}

- (void)setAvatarDiameter:(double)a3
{
  if (self->_avatarDiameter != a3)
  {
    self->_avatarDiameter = a3;
    -[SFAvatarStackView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[SFAvatarStackView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateVisibleParticipants
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSMutableDictionary *contactsByParticipantIdentifer;
  void *v11;
  void *v12;
  NSArray *shareParticipants;
  id v14;
  NSArray *v15;
  NSArray *v16;
  NSUInteger v17;
  NSArray *v18;
  NSArray *v19;
  NSArray *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, void *, void *);
  void *v26;
  SFAvatarStackView *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary removeAllObjects](self->_contactsByParticipantIdentifer, "removeAllObjects");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v3 = self->_shareParticipants;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v8, "safari_contact");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        contactsByParticipantIdentifer = self->_contactsByParticipantIdentifer;
        objc_msgSend(v8, "safari_shareParticipantIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](contactsByParticipantIdentifer, "setObject:forKeyedSubscript:", v9, v11);

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0C97200], "comparatorForNameSortOrder:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  shareParticipants = self->_shareParticipants;
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __47__SFAvatarStackView__updateVisibleParticipants__block_invoke;
  v26 = &unk_1E21E2C90;
  v27 = self;
  v14 = v12;
  v28 = v14;
  -[NSArray sortedArrayUsingComparator:](shareParticipants, "sortedArrayUsingComparator:", &v23);
  v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v16 = self->_shareParticipants;
  self->_shareParticipants = v15;

  v17 = -[NSArray count](self->_shareParticipants, "count", v23, v24, v25, v26, v27);
  v18 = self->_shareParticipants;
  if (v17 <= 3)
  {
    v19 = v18;
  }
  else
  {
    -[NSArray subarrayWithRange:](v18, "subarrayWithRange:", 0, 2);
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  -[NSArray safari_mapObjectsUsingBlock:](v20, "safari_mapObjectsUsingBlock:", &__block_literal_global_2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObjectsFromArray:", v22);

  if (v17 >= 4)
    objc_msgSend(v21, "addObject:", CFSTR("overflow"));
  -[SFAvatarStackView _setVisibleParticipantIdentifiers:](self, "_setVisibleParticipantIdentifiers:", v21);

}

- (void)_setVisibleParticipantIdentifiers:(id)a3
{
  id v5;
  NSArray *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSArray *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  NSArray *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  NSArray *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id location[2];

  v5 = a3;
  objc_initWeak(location, self);
  v6 = self->_visibleParticipantIdentifiers;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_visibleParticipantIdentifiers, a3);
    -[SFAvatarStackView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[SFAvatarStackView setNeedsLayout](self, "setNeedsLayout");
    objc_msgSend(v5, "differenceFromArray:withOptions:", v6, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled")
      && (-[SFAvatarStackView window](self, "window"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          v8))
    {
      objc_msgSend(v7, "safari_insertionIndexes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "safari_removalIndexes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0DC3F10];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __55__SFAvatarStackView__setVisibleParticipantIdentifiers___block_invoke;
      v27[3] = &unk_1E21E22F8;
      v27[4] = self;
      v12 = v9;
      v28 = v12;
      v13 = v5;
      v29 = v13;
      objc_msgSend(v11, "performWithoutAnimation:", v27);
      v14 = (void *)MEMORY[0x1E0DC3F10];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __55__SFAvatarStackView__setVisibleParticipantIdentifiers___block_invoke_2;
      v22[3] = &unk_1E21E2CF8;
      objc_copyWeak(&v26, location);
      v23 = v13;
      v15 = v10;
      v24 = v15;
      v16 = v6;
      v25 = v16;
      objc_msgSend(v14, "_animateUsingDefaultTimingWithOptions:animations:completion:", 2, v22, 0);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __55__SFAvatarStackView__setVisibleParticipantIdentifiers___block_invoke_3;
      v18[3] = &unk_1E21E2D20;
      objc_copyWeak(&v21, location);
      v17 = v15;
      v19 = v17;
      v20 = v16;
      -[SFAvatarStackView _setIndexes:ofParticipantIdentifiers:transitioning:completion:](self, "_setIndexes:ofParticipantIdentifiers:transitioning:completion:", v17, v20, 1, v18);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&v26);

    }
    else
    {
      objc_msgSend(v7, "safari_removalIndexes");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[SFAvatarStackView _removeViewsForIndexes:ofParticipantIdentifiers:](self, "_removeViewsForIndexes:ofParticipantIdentifiers:", v12, v6);
    }

  }
  objc_destroyWeak(location);

}

- (void)setShareParticipants:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *shareParticipants;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  shareParticipants = self->_shareParticipants;
  self->_shareParticipants = v5;

  v7 = objc_msgSend(v4, "count");
  if (v7 >= 4)
  {
    v8 = v7 - 2;
    overflowCountFormatter();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 < 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringFromNumber:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAvatarStackView _overflowLabel](self, "_overflowLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", v12);

    }
    else
    {
      objc_msgSend(v9, "plusSign");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAvatarStackView _overflowLabel](self, "_overflowLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setText:", v11);
    }

  }
  -[SFAvatarStackView _updateVisibleParticipants](self, "_updateVisibleParticipants");
}

- (void)setSpacing:(double)a3
{
  if (self->_spacing != a3)
  {
    self->_spacing = a3;
    -[SFAvatarStackView setNeedsLayout](self, "setNeedsLayout");
  }
}

uint64_t __47__SFAvatarStackView__updateVisibleParticipants__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
  v6 = a3;
  objc_msgSend(a2, "safari_shareParticipantIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
  objc_msgSend(v6, "safari_shareParticipantIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return v12;
}

uint64_t __47__SFAvatarStackView__updateVisibleParticipants__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_shareParticipantIdentifier");
}

uint64_t __55__SFAvatarStackView__setVisibleParticipantIdentifiers___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_layOutIndexes:ofParticipantIdentifiers:targetWidth:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
  return objc_msgSend(*(id *)(a1 + 32), "_setIndexes:ofParticipantIdentifiers:transitioning:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, 0);
}

void __55__SFAvatarStackView__setVisibleParticipantIdentifiers___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_widthForParticipantCount:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v3 = *(_QWORD *)(a1 + 40);
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_layOutIndexes:ofParticipantIdentifiers:targetWidth:", v3, v2, v4);

    objc_msgSend(WeakRetained, "layoutIfNeeded");
  }

}

void __55__SFAvatarStackView__setVisibleParticipantIdentifiers___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_removeViewsForIndexes:ofParticipantIdentifiers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

void __73__SFAvatarStackView__layOutIndexes_ofParticipantIdentifiers_targetWidth___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  double v5;
  double v6;
  CGFloat v7;
  CGFloat Height;
  void *v9;
  id v10;
  double v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_viewForParticipantIdentifier:", a2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v12);
  objc_msgSend(v12, "_setCornerRadius:", *(double *)(*(_QWORD *)(a1 + 32) + 464) * 0.5);
  v5 = (double)a3;
  v6 = *(double *)(*(_QWORD *)(a1 + 32) + 464) + *(double *)(*(_QWORD *)(a1 + 32) + 480);
  v7 = CGRectGetMinX(*(CGRect *)(a1 + 40)) + (double)a3 * v6;
  Height = CGRectGetHeight(*(CGRect *)(a1 + 72));
  objc_msgSend(v12, "ss_setUntransformedFrame:", _SFFlipRectInCoordinateSpace(objc_msgSend(*(id *)(a1 + 32), "_sf_usesLeftToRightLayout") ^ 1u, v7, (Height - *(double *)(*(_QWORD *)(a1 + 32) + 464)) * 0.5, *(CGFloat *)(*(_QWORD *)(a1 + 32) + 464), *(CGFloat *)(*(_QWORD *)(a1 + 32) + 464), *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64)));
  objc_msgSend(v12, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setZPosition:", -v5);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", 0.0, 0.0, *(double *)(*(_QWORD *)(a1 + 32) + 464), *(double *)(*(_QWORD *)(a1 + 32) + 464));
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "setShadowPath:", objc_msgSend(v10, "CGPath"));

  objc_msgSend(v9, "setShadowOffset:", 0.0, 1.0);
  LODWORD(v11) = 1042536202;
  objc_msgSend(v9, "setShadowOpacity:", v11);
  objc_msgSend(v9, "setShadowRadius:", 3.0);
  objc_msgSend(v12, "layoutIfNeeded");

}

void __83__SFAvatarStackView__setIndexes_ofParticipantIdentifiers_transitioning_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  objc_msgSend(*(id *)(a1 + 32), "_viewForParticipantIdentifier:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v5 = 1.0;
  objc_msgSend(v3, "setAlpha:", v5);
  v6 = 0.5;
  if (!*(_BYTE *)(a1 + 40))
    v6 = 1.0;
  CGAffineTransformMakeScale(&v8, v6, v6);
  v7 = v8;
  objc_msgSend(v4, "setTransform:", &v7);

}

- (id)_viewForParticipantIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (WBSIsEqual())
  {
    -[SFAvatarStackView _overflowView](self, "_overflowView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SFAvatarStackView _avatarViewControllerForParticipantIdentifier:](self, "_avatarViewControllerForParticipantIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_avatarViewControllerForParticipantIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_avatarViewControllersByParticipantIdentifier, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D8A0E8], "sharedContactStoreManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contactStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C97480], "settingsWithContactStore:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97470]), "initWithSettings:", v10);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_contactsByParticipantIdentifer, "objectForKeyedSubscript:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
    {
      v15[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setContacts:", v13);

    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_avatarViewControllersByParticipantIdentifier, "setObject:forKeyedSubscript:", v7, v4);

  }
  return v7;
}

- (void)_removeViewsForIndexes:(id)a3 ofParticipantIdentifiers:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__SFAvatarStackView__removeViewsForIndexes_ofParticipantIdentifiers___block_invoke;
  v4[3] = &unk_1E21E2DC0;
  v4[4] = self;
  objc_msgSend(a4, "enumerateObjectsAtIndexes:options:usingBlock:", a3, 0, v4);
}

void __69__SFAvatarStackView__removeViewsForIndexes_ofParticipantIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "containsObject:") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_viewForParticipantIdentifier:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setObject:forKeyedSubscript:", 0, v4);
  }

}

- (id)_overflowView
{
  UIView *overflowView;

  overflowView = self->_overflowView;
  if (!overflowView)
  {
    -[SFAvatarStackView _loadOverflowView](self, "_loadOverflowView");
    overflowView = self->_overflowView;
  }
  return overflowView;
}

- (id)_overflowLabel
{
  UILabel *overflowLabel;

  overflowLabel = self->_overflowLabel;
  if (!overflowLabel)
  {
    -[SFAvatarStackView _loadOverflowView](self, "_loadOverflowView");
    overflowLabel = self->_overflowLabel;
  }
  return overflowLabel;
}

- (void)_loadOverflowView
{
  UIView *v3;
  UIView *overflowView;
  void *v5;
  UILabel *v6;
  UILabel *overflowLabel;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  overflowView = self->_overflowView;
  self->_overflowView = v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_overflowView, "setBackgroundColor:", v5);

  v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  overflowLabel = self->_overflowLabel;
  self->_overflowLabel = v6;

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_overflowLabel, "setTextColor:", v8);

  -[UILabel setTextAlignment:](self->_overflowLabel, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 10.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_overflowLabel, "setFont:", v9);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_overflowLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_overflowView, "addSubview:", self->_overflowLabel);
  v10 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "safari_constraintsMatchingFrameOfView:withFrameOfView:directionalInsets:", self->_overflowLabel, self->_overflowView, 0.0, 2.0, 0.0, 2.0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activateConstraints:", v11);

}

+ (id)randomContactIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0D8A0E8], "sharedContactStoreManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultContainerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsInContainerWithIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "unifiedContactsMatchingPredicate:keysToFetch:error:", v4, MEMORY[0x1E0C9AA60], 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    v7 = objc_msgSend(v6, "count");
    if (v7 >= (arc4random() & 3) + 1)
      v8 = (arc4random() & 3) + 1;
    else
      v8 = objc_msgSend(v6, "count");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;
    while (objc_msgSend(v10, "count") < v8)
    {
      v11 = arc4random();
      v12 = v11 % objc_msgSend(v6, "count");
      objc_msgSend(v6, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v14);

      objc_msgSend(v6, "removeObjectAtIndex:", v12);
      v10 = v9;
    }

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (double)avatarDiameter
{
  return self->_avatarDiameter;
}

- (double)spacing
{
  return self->_spacing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareParticipants, 0);
  objc_storeStrong((id *)&self->_visibleParticipantIdentifiers, 0);
  objc_storeStrong((id *)&self->_overflowLabel, 0);
  objc_storeStrong((id *)&self->_overflowView, 0);
  objc_storeStrong((id *)&self->_contactsByParticipantIdentifer, 0);
  objc_storeStrong((id *)&self->_avatarViewControllersByParticipantIdentifier, 0);
}

@end
