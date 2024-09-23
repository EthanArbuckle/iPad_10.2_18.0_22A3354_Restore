@implementation CKEffectSelectionViewController

- (void)viewDidLoad
{
  CKFullScreenEffectManager *v3;
  void *v4;
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
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id (*v28)(id *, void *, void *);
  void *v29;
  id v30;
  id location;
  objc_super v32;
  const __CFString *v33;
  _QWORD v34[5];

  v34[4] = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)CKEffectSelectionViewController;
  -[CKEffectSelectionViewController viewDidLoad](&v32, sel_viewDidLoad);
  v3 = objc_alloc_init(CKFullScreenEffectManager);
  -[CKEffectSelectionViewController setFsem:](self, "setFsem:", v3);
  v34[0] = CFSTR("com.apple.MobileSMS.expressivesend.invisibleink");
  v34[1] = CFSTR("com.apple.MobileSMS.expressivesend.gentle");
  v34[2] = CFSTR("com.apple.MobileSMS.expressivesend.loud");
  v34[3] = CFSTR("com.apple.MobileSMS.expressivesend.impact");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectSelectionViewController setSendEffects:](self, "setSendEffects:", v4);

  v5 = objc_alloc_init(MEMORY[0x1E0CEA450]);
  objc_msgSend(v5, "setMinimumInteritemSpacing:", 0.0);
  objc_msgSend(v5, "setMinimumLineSpacing:", 0.0);
  objc_msgSend(v5, "setScrollDirection:", 1);
  objc_msgSend(v5, "setSectionInset:", 0.0, 8.0, 15.0, 8.0);
  v6 = objc_alloc(MEMORY[0x1E0CEA410]);
  v7 = (void *)objc_msgSend(v6, "initWithFrame:collectionViewLayout:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CKEffectSelectionViewController setCollectionView:](self, "setCollectionView:", v7);

  -[CKEffectSelectionViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[CKEffectSelectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v10);

  -[CKEffectSelectionViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CKEffectSelectionViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("kEffectSelectionCellReuseIdentifier"));

  -[CKEffectSelectionViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShowsHorizontalScrollIndicator:", 1);

  -[CKEffectSelectionViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSelectionFollowsFocus:", 1);

  -[CKEffectSelectionViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectSelectionViewController collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v16);

  -[CKEffectSelectionViewController collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectSelectionViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "__ck_makeEdgesEqualTo:", v18);

  location = 0;
  objc_initWeak(&location, self);
  v19 = objc_alloc(MEMORY[0x1E0CEA440]);
  -[CKEffectSelectionViewController collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __46__CKEffectSelectionViewController_viewDidLoad__block_invoke;
  v29 = &unk_1E2750800;
  objc_copyWeak(&v30, &location);
  v21 = (void *)objc_msgSend(v19, "initWithCollectionView:cellProvider:", v20, &v26);
  -[CKEffectSelectionViewController setDataSource:](self, "setDataSource:", v21, v26, v27, v28, v29);

  v22 = objc_alloc_init(MEMORY[0x1E0CEA210]);
  v33 = CFSTR("MainSectionIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appendSectionsWithIdentifiers:", v23);

  +[CKEffectSelectionViewController orderedEffectIdentifiers](CKEffectSelectionViewController, "orderedEffectIdentifiers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v24, CFSTR("MainSectionIdentifier"));

  -[CKEffectSelectionViewController dataSource](self, "dataSource");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "applySnapshot:animatingDifferences:", v22, 0);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

}

id __46__CKEffectSelectionViewController_viewDidLoad__block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(a2, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kEffectSelectionCellReuseIdentifier"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "effectImageForIndexPath:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v8);

  v9 = objc_loadWeakRetained(a1);
  objc_msgSend(v9, "effectTitleForIndexPath:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTitle:", v10);
  v11 = objc_loadWeakRetained(a1);
  objc_msgSend(v6, "configureForEffectIsDark:", objc_msgSend(v11, "labelUsesDarkVibrancy"));

  objc_msgSend(v6, "setNeedsLayout");
  objc_msgSend(v6, "layoutIfNeeded");
  return v6;
}

- (BOOL)becomeFirstResponder
{
  void *v2;
  char v3;

  -[CKEffectSelectionViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
}

- (double)maxCellHeight
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t i;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;

  if (*(double *)&maxCellHeight_maxHeight == 0.0)
  {
    -[CKEffectSelectionViewController dataSource](self, "dataSource", *(double *)&maxCellHeight_maxHeight);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectSelectionViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "numberOfSectionsInCollectionView:", v4);

    if (v5)
    {
      v6 = 0;
      do
      {
        for (i = 0; ; ++i)
        {
          -[CKEffectSelectionViewController dataSource](self, "dataSource");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKEffectSelectionViewController collectionView](self, "collectionView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v8, "collectionView:numberOfItemsInSection:", v9, v6);

          if (i >= v10)
            break;
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", i, v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKEffectSelectionViewController collectionView](self, "collectionView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kEffectSelectionCellReuseIdentifier"), v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          -[CKEffectSelectionViewController effectTitleForIndexPath:](self, "effectTitleForIndexPath:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setTitle:", v14);

          objc_msgSend(v13, "contentView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "layoutIfNeeded");

          objc_msgSend(v13, "contentView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "frame");
          v18 = v17;

          v19 = maxCellHeight_maxHeight;
          if (v18 >= *(double *)&maxCellHeight_maxHeight)
            *(double *)&v19 = v18;
          maxCellHeight_maxHeight = v19;

        }
        ++v6;
        -[CKEffectSelectionViewController dataSource](self, "dataSource");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKEffectSelectionViewController collectionView](self, "collectionView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "numberOfSectionsInCollectionView:", v21);

      }
      while (v6 < v22);
    }
  }
  return *(double *)&maxCellHeight_maxHeight;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  double v19;
  double v20;

  v5 = a4;
  -[CKEffectSelectionViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifierForIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEffectSelectionViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "effectSelectionViewController:didSelectEffectWithIdentifier:", self, v7);

  -[CKEffectSelectionViewController fsem](self, "fsem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "effectForIdentifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && objc_msgSend(v10, "effectIsDark"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "theme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fsmPickerPrimaryColorDarkEffect");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectSelectionViewController setLabelColor:](self, "setLabelColor:", v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEffectSelectionViewController setLabelColor:](self, "setLabelColor:", v11);
  }

  v19 = 0.0;
  v20 = 0.0;
  objc_msgSend(v10, "backgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getHue:saturation:brightness:alpha:", 0, 0, &v20, &v19);

  v15 = v19 > 0.5 && v20 < 0.5;
  -[CKEffectSelectionViewController setLabelUsesDarkVibrancy:](self, "setLabelUsesDarkVibrancy:", v15, v19);
  -[CKEffectSelectionViewController collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "visibleCells");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__CKEffectSelectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
  v18[3] = &unk_1E275A468;
  v18[4] = self;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v18);

}

void __75__CKEffectSelectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "configureForEffectIsDark:", objc_msgSend(v2, "labelUsesDarkVibrancy"));

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[CKEffectSelectionViewController maxCellHeight](self, "maxCellHeight", a3, a4, a5);
  v6 = v5;
  v7 = 88.0;
  result.height = v6;
  result.width = v7;
  return result;
}

- (id)effectTitleForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;

  v4 = a3;
  -[CKEffectSelectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIdentifierForIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEffectSelectionViewController fsem](self, "fsem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "effectIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if (v9)
  {
    -[CKEffectSelectionViewController fsem](self, "fsem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedDisplayNameForEffectWithIdentifier:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[CKImpactEffectManager effectIdentifiers](CKImpactEffectManager, "effectIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v6);

    if (v13)
    {
      +[CKImpactEffectManager localizedEffectNameForEffectWithIdentifier:](CKImpactEffectManager, "localizedEffectNameForEffectWithIdentifier:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)effectImageForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CKEffectSelectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIdentifierForIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)selectedEffectIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CKEffectSelectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEffectSelectionViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifierForIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)setSelectedEffectIdentifier:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  CGRect v17;

  v4 = a3;
  -[CKEffectSelectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v6 = CGRectEqualToRect(v17, *MEMORY[0x1E0C9D648]);

  if (v6)
  {
    -[CKEffectSelectionViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

    -[CKEffectSelectionViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutIfNeeded");

  }
  -[CKEffectSelectionViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathForItemIdentifier:", v4);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[CKEffectSelectionViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectItemAtIndexPath:animated:scrollPosition:", v16, 0, 0);

  -[CKEffectSelectionViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectSelectionViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "collectionView:didSelectItemAtIndexPath:", v13, v16);

  -[CKEffectSelectionViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cellForItemAtIndexPath:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "becomeFirstResponder");
}

+ (id)orderedEffectIdentifiers
{
  if (orderedEffectIdentifiers_onceToken != -1)
    dispatch_once(&orderedEffectIdentifiers_onceToken, &__block_literal_global_260);
  return (id)orderedEffectIdentifiers_effectIdentifiers;
}

void __59__CKEffectSelectionViewController_orderedEffectIdentifiers__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[13];

  v2[12] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.messages.effect.CKHeartEffect");
  v2[1] = CFSTR("com.apple.messages.effect.CKHappyBirthdayEffect");
  v2[2] = CFSTR("com.apple.MobileSMS.expressivesend.invisibleink");
  v2[3] = CFSTR("com.apple.messages.effect.CKConfettiEffect");
  v2[4] = CFSTR("com.apple.MobileSMS.expressivesend.impact");
  v2[5] = CFSTR("com.apple.messages.effect.CKLasersEffect");
  v2[6] = CFSTR("com.apple.MobileSMS.expressivesend.loud");
  v2[7] = CFSTR("com.apple.messages.effect.CKSparklesEffect");
  v2[8] = CFSTR("com.apple.messages.effect.CKEchoEffect");
  v2[9] = CFSTR("com.apple.messages.effect.CKSpotlightEffect");
  v2[10] = CFSTR("com.apple.messages.effect.CKFireworksEffect");
  v2[11] = CFSTR("com.apple.MobileSMS.expressivesend.gentle");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)orderedEffectIdentifiers_effectIdentifiers;
  orderedEffectIdentifiers_effectIdentifiers = v0;

}

- (CKEffectSelectionViewControllerDelegate)delegate
{
  return (CKEffectSelectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (CKFullScreenEffectManager)fsem
{
  return self->_fsem;
}

- (void)setFsem:(id)a3
{
  objc_storeStrong((id *)&self->_fsem, a3);
}

- (NSArray)sendEffects
{
  return self->_sendEffects;
}

- (void)setSendEffects:(id)a3
{
  objc_storeStrong((id *)&self->_sendEffects, a3);
}

- (UIColor)labelColor
{
  return self->_labelColor;
}

- (void)setLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_labelColor, a3);
}

- (BOOL)labelUsesDarkVibrancy
{
  return self->_labelUsesDarkVibrancy;
}

- (void)setLabelUsesDarkVibrancy:(BOOL)a3
{
  self->_labelUsesDarkVibrancy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelColor, 0);
  objc_storeStrong((id *)&self->_sendEffects, 0);
  objc_storeStrong((id *)&self->_fsem, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
