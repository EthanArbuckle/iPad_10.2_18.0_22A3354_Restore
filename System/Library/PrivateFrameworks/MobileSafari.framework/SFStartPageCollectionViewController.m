@implementation SFStartPageCollectionViewController

- (void)_updateCustomTopBackdrops
{
  void *v3;
  UIVisualEffectView *statusBarBackdrop;
  double v5;
  id *p_navigationBarBackdrop;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double Width;
  void *v15;
  int v16;
  double v17;
  UIVisualEffectView *navigationBarBackdrop;
  double v19;
  double v20;
  id v21;
  CGRect v22;

  -[SFStartPageCollectionViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v3;
  if (!self->_statusBarBackdrop)
  {
    statusBarBackdrop = 0;
    goto LABEL_5;
  }
  if (objc_msgSend(v3, "isNavigationBarHidden"))
  {
    statusBarBackdrop = self->_statusBarBackdrop;
LABEL_5:
    v5 = 0.0;
    -[UIVisualEffectView setAlpha:](statusBarBackdrop, "setAlpha:", 0.0);
    p_navigationBarBackdrop = (id *)&self->_navigationBarBackdrop;
    goto LABEL_12;
  }
  objc_msgSend(v21, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeAreaInsets");
  v9 = v8;

  -[SFStartPageCollectionViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safeAreaInsets");
  v12 = v11;

  -[SFStartPageCollectionViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  Width = CGRectGetWidth(v22);

  v5 = 0.0;
  -[UIVisualEffectView setFrame:](self->_statusBarBackdrop, "setFrame:", 0.0, 0.0, Width, v9);
  -[UIVisualEffectView setFrame:](self->_navigationBarBackdrop, "setFrame:", 0.0, v9, Width, v12 - v9);
  p_navigationBarBackdrop = (id *)&self->_navigationBarSeparator;
  -[UIView setFrame:](self->_navigationBarSeparator, "setFrame:", 0.0, v12, Width, _SFOnePixel());
  -[SFStartPageCollectionViewController navigationItem](self, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "sf_isEmpty");

  if (v16)
  {
    -[SFStartPageCollectionViewController scrollDistance](self, "scrollDistance");
    -[UIVisualEffectView setAlpha:](self->_statusBarBackdrop, "setAlpha:", _SFClampPercent(v17, v12 - v9, v12 - v9 + 16.0));
    navigationBarBackdrop = self->_navigationBarBackdrop;
    v19 = 0.0;
  }
  else
  {
    v5 = 1.0;
    if (!self->_wantsWallpaperHiddenForCurrentBackgroundStyle)
    {
      -[SFStartPageCollectionViewController scrollDistance](self, "scrollDistance");
      v5 = _SFClampPercent(v20, 0.0, 16.0);
    }
    -[UIVisualEffectView setAlpha:](self->_statusBarBackdrop, "setAlpha:", v5);
    navigationBarBackdrop = self->_navigationBarBackdrop;
    v19 = v5;
  }
  -[UIVisualEffectView setAlpha:](navigationBarBackdrop, "setAlpha:", v19);
LABEL_12:
  objc_msgSend(*p_navigationBarBackdrop, "setAlpha:", v5);

}

- (NSDirectionalEdgeInsets)_sectionContentInsets
{
  void *v3;
  double v4;
  double v5;
  double v6;
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
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect v28;
  NSDirectionalEdgeInsets result;

  -[SFStartPageCollectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "directionalLayoutMargins");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SFStartPageVisualStyleProviding sectionContentInsetsWithViewLayoutMargins:](self->_visualStyleProvider, "sectionContentInsetsWithViewLayoutMargins:", v5, v7, v9, v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[SFStartPageCollectionViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v21 = CGRectGetWidth(v27) - v19 - v15;

  if (v21 < 200.0)
  {
    -[SFStartPageCollectionViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v21 = CGRectGetWidth(v28) + -16.0 + -16.0;

    v19 = 16.0;
    v15 = 16.0;
  }
  if (((int)v21 & 0x80000001) == 1)
    v23 = v19 + 1.0;
  else
    v23 = v19;
  v24 = v13;
  v25 = v15;
  v26 = v17;
  result.trailing = v23;
  result.bottom = v26;
  result.leading = v25;
  result.top = v24;
  return result;
}

- (double)scrollDistance
{
  double v3;
  double v4;
  double v5;

  -[UICollectionView contentOffset](self->_collectionView, "contentOffset");
  v4 = v3;
  -[UICollectionView adjustedContentInset](self->_collectionView, "adjustedContentInset");
  return v4 + v5;
}

id __56__SFStartPageCollectionViewController__setUpDataSource___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_reuseIdentifierForCellWithIdentifier:indexPath:", v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_configureCell:forIdentifier:indexPath:", v12, v7, v8);
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(WeakRetained, "sections");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v8, "section");

  objc_msgSend(v14, "objectAtIndexedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@Content"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityIdentifier:", v18);

  return v12;
}

- (id)_reuseIdentifierForCellWithIdentifier:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[SFStartPageCollectionViewController sections](self, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "section");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFStartPageCollectionViewController _reuseIdentifierForCellWithIdentifier:section:](self, "_reuseIdentifierForCellWithIdentifier:section:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_applyCurrentSnapshotAnimatingDifferences:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  UICollectionViewDiffableDataSource *collectionDataSource;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  id obj;
  _QWORD aBlock[5];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  char v56;
  _QWORD v57[4];
  id v58;
  id v59;
  SFStartPageCollectionViewController *v60;
  id v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v3 = a3;
  v64 = *MEMORY[0x1E0C80C00];
  -[SFStartPageCollectionViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UICollectionViewDiffableDataSource snapshot](self->_collectionDataSource, "snapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sectionIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    -[UICollectionViewDiffableDataSource snapshot](self->_collectionDataSource, "snapshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageCollectionViewController _currentSnapshot](self, "_currentSnapshot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sectionIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    v14 = objc_msgSend(v11, "isEqual:", v10);
    v15 = v14 ^ 1;
    v16 = MEMORY[0x1E0C809B0];
    if ((v14 & 1) == 0)
    {
      v17 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v10, "sectionIdentifiers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setWithArray:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "sectionIdentifiers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __81__SFStartPageCollectionViewController__applyCurrentSnapshotAnimatingDifferences___block_invoke;
      v57[3] = &unk_1E21E64B0;
      v58 = v19;
      v59 = v10;
      v60 = self;
      v61 = v11;
      v21 = v19;
      objc_msgSend(v20, "enumerateObjectsUsingBlock:", v57);

      v16 = MEMORY[0x1E0C809B0];
    }
    v44 = v10;
    collectionDataSource = self->_collectionDataSource;
    v23 = v9 == 0;
    v55[0] = v16;
    v55[1] = 3221225472;
    v55[2] = __81__SFStartPageCollectionViewController__applyCurrentSnapshotAnimatingDifferences___block_invoke_3;
    v55[3] = &unk_1E21E2B38;
    v55[4] = self;
    v56 = v15;
    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:completion:](collectionDataSource, "applySnapshot:animatingDifferences:completion:", v11, v3, v55);
    if (self->_hasAppliedInitialSnapshot && v23 == (v13 == 0)
      || (-[SFStartPageCollectionViewController updateBackgroundStyle](self, "updateBackgroundStyle"),
          self->_hasAppliedInitialSnapshot))
    {
      v43 = v11;
      v42 = v3;
      v24 = *MEMORY[0x1E0DC48A8];
      -[UICollectionView indexPathsForVisibleSupplementaryElementsOfKind:](self->_collectionView, "indexPathsForVisibleSupplementaryElementsOfKind:", *MEMORY[0x1E0DC48A8]);
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v52 != v27)
              objc_enumerationMutation(obj);
            v29 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            -[UICollectionView supplementaryViewForElementKind:atIndexPath:](self->_collectionView, "supplementaryViewForElementKind:atIndexPath:", v24, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[UICollectionViewDiffableDataSource sectionIdentifierForIndex:](self->_collectionDataSource, "sectionIdentifierForIndex:", objc_msgSend(v29, "section"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (v31)
                -[SFStartPageCollectionViewController _configureHeader:forSection:atIndexPath:](self, "_configureHeader:forSection:atIndexPath:", v30, v31, v29);

            }
          }
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
        }
        while (v26);
      }
      -[UICollectionView indexPathsForVisibleItems](self->_collectionView, "indexPathsForVisibleItems");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v48;
        do
        {
          for (j = 0; j != v34; ++j)
          {
            if (*(_QWORD *)v48 != v35)
              objc_enumerationMutation(v32);
            v37 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
            -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_collectionDataSource, "itemIdentifierForIndexPath:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (v38)
            {
              -[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v37);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFStartPageCollectionViewController _configureCell:forIdentifier:indexPath:](self, "_configureCell:forIdentifier:indexPath:", v39, v38, v37);

            }
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
        }
        while (v34);
      }
      v11 = v43;
      v10 = v44;
      if (objc_msgSend(obj, "count") || objc_msgSend(v32, "count"))
      {
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __81__SFStartPageCollectionViewController__applyCurrentSnapshotAnimatingDifferences___block_invoke_4;
        aBlock[3] = &unk_1E21E2050;
        aBlock[4] = self;
        v40 = _Block_copy(aBlock);
        v41 = v40;
        if (v42)
          (*((void (**)(void *))v40 + 2))(v40);
        else
          objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v40);

      }
    }
    else
    {
      self->_hasAppliedInitialSnapshot = 1;
    }

  }
}

- (void)_configureCell:(id)a3 forIdentifier:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;

  v26 = a3;
  v8 = a4;
  v9 = a5;
  -[SFStartPageCollectionViewController sections](self, "sections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "section");

  objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "itemType");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v26, "setBackdropCaptureView:", self->_cellBackdropCaptureView);
  switch(v13)
  {
    case 0:
      objc_msgSend(v12, "contentBanner");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      switch(objc_msgSend(v14, "contentVariant"))
      {
        case 0:
        case 1:
          v25 = v26;
          objc_msgSend(v12, "contentBanner");
          v15 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "configureUsingBanner:", v15);

          goto LABEL_9;
        case 2:
          v15 = v8;
          if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024PrivacyReportEnabled")
            && _SFDeviceIsPad()
            && (objc_msgSend(v15, "isPrivateBrowsingEnabled") & 1) == 0)
          {
            goto LABEL_6;
          }
          v16 = v26;
          objc_msgSend(v16, "setNumberOfTrackers:", objc_msgSend(v15, "numberOfTrackers"));
          objc_msgSend(v16, "setPrivateBrowsingEnabled:", objc_msgSend(v15, "isPrivateBrowsingEnabled"));
          objc_msgSend(v12, "contentBanner");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "configureUsingBanner:", v17);
          goto LABEL_8;
        case 3:
        case 4:
        case 5:
        case 6:
          objc_msgSend(v12, "contentBanner");
          v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
          objc_msgSend(v26, "configureUsingBanner:", v15);
          goto LABEL_9;
        default:
          goto LABEL_10;
      }
    case 1:
      v16 = v26;
      objc_msgSend(v12, "actions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "makeUIAction");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAction:", v17);
LABEL_8:

LABEL_9:
LABEL_10:

      -[SFStartPageCollectionViewController _updateInteractionEnabledForView:](self, "_updateInteractionEnabledForView:", v26);
      break;
    case 2:
      v18 = v26;
      objc_msgSend(v18, "setVisualEffectGroupName:", CFSTR("start-page-cell"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "supplementaryAction");
        v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[SFStartPageVisualStyleProviding backgroundEffectForSupplementaryActions](self->_visualStyleProvider, "backgroundEffectForSupplementaryActions");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "makeUIAction");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "configureUsingAction:backgroundEffect:", v21, v20);

        -[SFStartPageVisualStyleProviding tintColorForSupplementaryActions](self->_visualStyleProvider, "tintColorForSupplementaryActions");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setTintColor:", v22);

      }
      else
      {
        objc_msgSend(v12, "siteIconConfigurationProvider");
        v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id, id))v19)[2](v19, v18, v8);
      }

      goto LABEL_20;
    case 3:
      v23 = v26;
      objc_msgSend(v12, "siteCardConfigurationProvider");
      v24 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 4:
      v23 = v26;
      objc_msgSend(v12, "attributedRichLinkConfigurationProvider");
      v24 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 5:
      v23 = v26;
      objc_msgSend(v12, "siteRowConfigurationProvider");
      v24 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 6:
      v23 = v26;
      objc_msgSend(v12, "squareRichLinkConfigurationProvider");
      v24 = objc_claimAutoreleasedReturnValue();
LABEL_17:
      v18 = (id)v24;
      (*(void (**)(uint64_t, id, id))(v24 + 16))(v24, v23, v8);

LABEL_20:
      break;
    default:
      break;
  }

}

- (id)sections
{
  void *v2;
  void *v3;

  -[UICollectionViewDiffableDataSource snapshot](self->_collectionDataSource, "snapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateInteractionEnabledForView:(id)a3
{
  UICollectionView *collectionView;
  uint64_t v5;
  _BOOL4 v6;
  id v7;

  collectionView = self->_collectionView;
  v7 = a3;
  if (-[UICollectionView hasActiveDrag](collectionView, "hasActiveDrag"))
  {
    objc_msgSend(v7, "setUserInteractionEnabled:", 0);
    v5 = 2;
  }
  else
  {
    v6 = -[UICollectionView hasActiveDrop](self->_collectionView, "hasActiveDrop");
    objc_msgSend(v7, "setUserInteractionEnabled:", !v6);
    if (v6)
      v5 = 2;
    else
      v5 = 0;
  }
  objc_msgSend(v7, "setTintAdjustmentMode:", v5);

}

- (void)reloadDataAnimatingDifferences:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  int v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  v3 = a3;
  v5 = -[SFStartPageCollectionViewController _appearState](self, "_appearState");
  if (!self->_isPresentingContextMenu
    && (v6 = v5,
        -[SFStartPageCollectionViewController viewIfLoaded](self, "viewIfLoaded"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "window"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8)
    && v6)
  {
    v9 = v6 == 2 && v3;
    -[SFStartPageCollectionViewController _applyCurrentSnapshotAnimatingDifferences:](self, "_applyCurrentSnapshotAnimatingDifferences:", v9);
  }
  else
  {
    self->_hasDeferredUpdates = 1;
  }
}

- (id)_currentSnapshot
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "sectionsForStartPageCollectionViewController:", self);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x1E0C9AA60];
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  if (!objc_msgSend(WeakRetained, "customizationControlPolicyForStartPageCollectionViewController:", self))
  {
    -[SFStartPageCollectionViewController _customizationSection](self, "_customizationSection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObject:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v9;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  objc_msgSend(v10, "appendSectionsWithIdentifiers:", v7);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v16, "effectiveItemIdentifiersWithMaximumCount:", -[SFStartPageCollectionViewController _itemLimitForSection:](self, "_itemLimitForSection:", v16, (_QWORD)v19));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v10, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v17, v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  return v10;
}

- (unint64_t)_itemLimitForSection:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  unint64_t v7;

  v4 = a3;
  if (objc_msgSend(v4, "itemType"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v6 = objc_msgSend(WeakRetained, "startPageCollectionViewController:isSectionExpanded:", self, v4);

    if ((v6 & 1) != 0)
      v7 = -1;
    else
      v7 = -[SFStartPageCollectionViewController _collapsedCapacityForSection:](self, "_collapsedCapacityForSection:", v4);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

id __79__SFStartPageCollectionViewController__configureHeader_forSection_atIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasPrefix:", *MEMORY[0x1E0D8AE38]);

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_toggleExpandedActionForSectionIdentifier:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v3;
  }

  return v8;
}

- (id)_toggleExpandedActionForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  -[SFStartPageCollectionViewController _sectionForIdentifier:](self, "_sectionForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SFStartPageCollectionViewController _collapsedCapacityForSection:](self, "_collapsedCapacityForSection:", v5);
  if (objc_msgSend(v5, "effectiveItemIdentifiersCount") > v6
    || objc_msgSend(v5, "maximumNumberOfPages")
    && (v7 = objc_msgSend(v5, "effectiveItemIdentifiersCount"),
        v7 > -[SFStartPageCollectionViewController _numberOfItemsPerPageInSection:](self, "_numberOfItemsPerPageInSection:", v5)))
  {
    -[UICollectionViewDiffableDataSource snapshot](self->_collectionDataSource, "snapshot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "numberOfItemsInSection:", v5);

    objc_initWeak(&location, self);
    v10 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), *MEMORY[0x1E0D8AE38], v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __81__SFStartPageCollectionViewController__toggleExpandedActionForSectionIdentifier___block_invoke;
    v14[3] = &unk_1E21E35E0;
    objc_copyWeak(&v16, &location);
    v15 = v4;
    objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", &stru_1E21FE780, 0, v11, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setState:", v9 > v6);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_sectionForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[SFStartPageCollectionViewController sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__SFStartPageCollectionViewController__sectionForIdentifier___block_invoke;
  v9[3] = &unk_1E21E63E8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "safari_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_customizationSection
{
  WBSStartPageSection *cachedCustomizationSection;
  void *v4;
  void *v5;
  void *v6;
  WBSStartPageSection *v7;
  WBSStartPageSection *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  cachedCustomizationSection = self->_cachedCustomizationSection;
  if (!cachedCustomizationSection)
  {
    objc_initWeak(&location, self);
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0D8A740];
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __60__SFStartPageCollectionViewController__customizationSection__block_invoke;
    v13 = &unk_1E21E2AE8;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v4, 0, 0, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8ACC0], "footerSectionWithIdentifier:action:", CFSTR("com.apple.mobilesafari.framework-customization-section"), v6, v10, v11, v12, v13);
    v7 = (WBSStartPageSection *)objc_claimAutoreleasedReturnValue();
    v8 = self->_cachedCustomizationSection;
    self->_cachedCustomizationSection = v7;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    cachedCustomizationSection = self->_cachedCustomizationSection;
  }
  return cachedCustomizationSection;
}

- (void)scrollViewDidScroll:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "startPageCollectionViewControllerDidScroll:", self);

  -[SFStartPageCollectionViewController _updateCustomTopBackdrops](self, "_updateCustomTopBackdrops");
}

- (BOOL)wantsWallpaperHiddenForCurrentBackgroundStyle
{
  return self->_wantsWallpaperHiddenForCurrentBackgroundStyle;
}

- (void)_configureHeader:(id)a3 forSection:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  SFStartPageVisualStyleProviding *visualStyleProvider;
  id v12;
  _QWORD v13[5];
  id v14;

  v7 = a4;
  v8 = a3;
  v9 = 0.0;
  if ((objc_msgSend(v7, "usesLargeTitle") & 1) == 0 && (objc_msgSend(v7, "showsTopSeparator") & 1) == 0)
  {
    -[SFStartPageVisualStyleProviding sectionHeaderBottomGapForSectionItemType:](self->_visualStyleProvider, "sectionHeaderBottomGapForSectionItemType:", objc_msgSend(v7, "itemType"));
    v9 = v10;
  }
  objc_msgSend(v8, "setBottomGap:", v9);
  visualStyleProvider = self->_visualStyleProvider;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__SFStartPageCollectionViewController__configureHeader_forSection_atIndexPath___block_invoke;
  v13[3] = &unk_1E21E6460;
  v13[4] = self;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v8, "configureUsingSection:visualStyleProvider:resolvingActionsUsingBlock:", v12, visualStyleProvider, v13);

}

- (int64_t)_collapsedCapacityForSection:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;

  v4 = a3;
  v5 = -[SFStartPageCollectionViewController _numberOfColumnsInSection:](self, "_numberOfColumnsInSection:", v4);
  -[SFStartPageCollectionViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "horizontalSizeClass");

  v8 = objc_msgSend(v4, "maximumNumberOfPages");
  v9 = v8;
  if (v7 == 1)
  {
    v10 = objc_msgSend(v4, "numberOfRowsVisibleWhenCollapsedInCompactWidth") * v5;
    if (!v9)
      goto LABEL_9;
  }
  else
  {
    if (!v8
      || !-[SFStartPageCollectionViewController _supportsPaginatedSectionLayouts](self, "_supportsPaginatedSectionLayouts"))
    {
      v10 = objc_msgSend(v4, "numberOfRowsVisibleWhenCollapsed") * v5;
      goto LABEL_9;
    }
    v10 = objc_msgSend(v4, "numberOfRowsVisibleWhenCollapsed") * v5;
  }
  v10 *= objc_msgSend(v4, "maximumNumberOfPages");
LABEL_9:

  return v10;
}

- (double)_effectiveLayoutWidth
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[SFStartPageCollectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;

  return self->_lastLayoutWidth - v5 - v7;
}

void __81__SFStartPageCollectionViewController__applyCurrentSnapshotAnimatingDifferences___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!objc_msgSend(v5, "itemType"))
  {
    objc_msgSend(v5, "contentBanner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "contentVariant");
    objc_msgSend(*(id *)(a1 + 32), "contentBanner");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "contentVariant");

    if (v7 == v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "itemIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11)
      {
        objc_msgSend(*(id *)(a1 + 32), "itemIdentifiers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 992), "cellForItemAtIndexPath:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "reuseIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16
          || (objc_msgSend(*(id *)(a1 + 40), "_reuseIdentifierForCellWithIdentifier:section:", v13, *(_QWORD *)(a1 + 32)), v17 = (void *)objc_claimAutoreleasedReturnValue(), v18 = objc_msgSend(v16, "isEqualToString:", v17), v17, (v18 & 1) == 0))
        {
          v19 = *(void **)(a1 + 48);
          v21[0] = *(_QWORD *)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "reloadSectionsWithIdentifiers:", v20);

        }
      }
    }
  }

}

- (void)viewLayoutMarginsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFStartPageCollectionViewController;
  -[SFStartPageCollectionViewController viewLayoutMarginsDidChange](&v4, sel_viewLayoutMarginsDidChange);
  -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateLayout");

}

uint64_t __61__SFStartPageCollectionViewController__sectionForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __56__SFStartPageCollectionViewController__setUpDataSource___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_collectionView:supplementaryViewWithKind:forIndexPath:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(WeakRetained, "sections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v7, "section");

  objc_msgSend(v13, "objectAtIndexedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@Header"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityIdentifier:", v17);

  return v11;
}

- (id)_collectionView:(id)a3 supplementaryViewWithKind:(id)a4 forIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SFStartPageCollectionViewController sections](self, "sections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v10, "section"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC48A8]))
  {
    +[SFStartPageSectionHeader reuseIdentifier](SFStartPageSectionHeader, "reuseIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, v13, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[SFStartPageCollectionViewController _configureHeader:forSection:atIndexPath:](self, "_configureHeader:forSection:atIndexPath:", v14, v12, v10);
    -[SFStartPageCollectionViewController _updateInteractionEnabledForView:](self, "_updateInteractionEnabledForView:", v14);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)updateBackgroundStyle
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  char v14;
  id WeakRetained;
  id v16;

  -[SFStartPageCollectionViewController traitCollection](self, "traitCollection");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v16, "sf_usesVibrantAppearance");
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UICollectionViewDiffableDataSource snapshot](self->_collectionDataSource, "snapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_colorNamed:", CFSTR("StartPageEmptyContentBackground"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v5;
  v9 = v4 ^ 1;

  v3 = v10;
LABEL_7:
  if (objc_msgSend(v16, "sf_usesVibrantAppearance"))
  {
    objc_msgSend(v16, "sf_backgroundBlurEffect");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;

  }
  else
  {
    v12 = 0;
  }
  -[_UIVisualEffectBackdropView setRenderMode:](self->_cellBackdropCaptureView, "setRenderMode:", v12);
  -[UICollectionView backgroundColor](self->_collectionView, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = WBSIsEqual();

  if ((v14 & 1) == 0)
  {
    -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v3);
    self->_wantsWallpaperHiddenForCurrentBackgroundStyle = v9;
    -[SFStartPageCollectionViewController _updateCustomTopBackdrops](self, "_updateCustomTopBackdrops");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "startPageCollectionViewControllerDidChangeBackgroundStyle:", self);

  }
}

id __64__SFStartPageCollectionViewController__makeCollectionViewLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_layoutForSectionAtIndex:inEnvironment:", a2, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __64__SFStartPageCollectionViewController__makeCollectionViewLayout__block_invoke_cold_1(v9);
    v10 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 100.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sizeWithWidthDimension:heightDimension:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0DC3350];
    v19[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "horizontalGroupWithLayoutSize:subitems:", v13, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)_layoutForSectionAtIndex:(int64_t)a3 inEnvironment:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  SFStartPageCollectionViewController *v10;
  void *v12;

  v6 = a4;
  -[SFStartPageCollectionViewController sections](self, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v8, "itemType"))
  {
    case 0:
      objc_msgSend(v8, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length") || objc_msgSend(v8, "showsTopSeparator"))
      {
        -[SFStartPageCollectionViewController _bannerSectionLayoutForEnvironment:includingHeader:](self, "_bannerSectionLayoutForEnvironment:includingHeader:", v6, 1);
        self = (SFStartPageCollectionViewController *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v8, "actions");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFStartPageCollectionViewController _bannerSectionLayoutForEnvironment:includingHeader:](self, "_bannerSectionLayoutForEnvironment:includingHeader:", v6, objc_msgSend(v12, "count") != 0);
        self = (SFStartPageCollectionViewController *)objc_claimAutoreleasedReturnValue();

      }
      break;
    case 1:
      -[SFStartPageCollectionViewController _bannerSectionLayoutForEnvironment:includingHeader:](self, "_bannerSectionLayoutForEnvironment:includingHeader:", v6, 0);
      v10 = (SFStartPageCollectionViewController *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 2:
      -[SFStartPageCollectionViewController _siteIconSectionLayoutForEnvironment:](self, "_siteIconSectionLayoutForEnvironment:", v6);
      v10 = (SFStartPageCollectionViewController *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 3:
      -[SFStartPageCollectionViewController _siteCardSectionLayoutForEnvironment:numberOfItems:](self, "_siteCardSectionLayoutForEnvironment:numberOfItems:", v6, objc_msgSend(v8, "effectiveItemIdentifiersCount"));
      v10 = (SFStartPageCollectionViewController *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 4:
      -[SFStartPageCollectionViewController _attributedRichLinkSectionLayoutForEnvironment:maximumNumberOfPages:numberOfItems:](self, "_attributedRichLinkSectionLayoutForEnvironment:maximumNumberOfPages:numberOfItems:", v6, objc_msgSend(v8, "maximumNumberOfPages"), objc_msgSend(v8, "effectiveItemIdentifiersCount"));
      v10 = (SFStartPageCollectionViewController *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 5:
      -[SFStartPageCollectionViewController _siteRowSectionLayoutForEnvironment:](self, "_siteRowSectionLayoutForEnvironment:", v6);
      v10 = (SFStartPageCollectionViewController *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 6:
      -[SFStartPageCollectionViewController _squareRichLinkSectionLayoutForEnvironment:numberOfItems:](self, "_squareRichLinkSectionLayoutForEnvironment:numberOfItems:", v6, objc_msgSend(v8, "effectiveItemIdentifiersCount"));
      v10 = (SFStartPageCollectionViewController *)objc_claimAutoreleasedReturnValue();
LABEL_11:
      self = v10;
      break;
    default:
      break;
  }

  return self;
}

- ($4E34F1DA1F1A31EFC59C0F9E582921FC)_siteIconLayoutForEnvironment:(SEL)a3 sectionInsets:(id)a4
{
  double trailing;
  double leading;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  SFStartPageVisualStyleProviding *visualStyleProvider;
  void *v18;
  int64_t v19;
  double v20;
  double v21;
  $4E34F1DA1F1A31EFC59C0F9E582921FC *result;

  trailing = a5.trailing;
  leading = a5.leading;
  v9 = a4;
  objc_msgSend(v9, "container");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "effectiveContentSize");
  v12 = v11;
  v14 = v13 - leading - trailing;

  -[SFStartPageVisualStyleProviding siteIconSizeForContainerSize:](self->_visualStyleProvider, "siteIconSizeForContainerSize:", v14, v12);
  v16 = v15;
  visualStyleProvider = self->_visualStyleProvider;
  objc_msgSend(v9, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[SFStartPageVisualStyleProviding numberOfColumnsForSectionItemType:sectionWidth:traitCollection:](visualStyleProvider, "numberOfColumnsForSectionItemType:sectionWidth:traitCollection:", 2, v18, v14);
  -[SFStartPageVisualStyleProviding rowSpacingForSectionItemType:containerSize:](self->_visualStyleProvider, "rowSpacingForSectionItemType:containerSize:", 2, v14, v12);
  v21 = v20;
  retstr->var0 = v16;
  retstr->var1 = v19;
  retstr->var2 = _SFFloorFloatToPixels((v14 - v16 * (double)v19) / (double)(v19 - 1));
  retstr->var3 = v21;
  return result;
}

- (id)_siteIconSectionLayoutForEnvironment:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SFStartPageCollectionViewController _sectionContentInsets](self, "_sectionContentInsets");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SFStartPageCollectionViewController _siteIconLayoutForEnvironment:sectionInsets:](self, "_siteIconLayoutForEnvironment:sectionInsets:", v4, v5);

  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "uniformAcrossSiblingsWithEstimate:", 100.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeWithWidthDimension:heightDimension:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 100.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sizeWithWidthDimension:heightDimension:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3350], "horizontalGroupWithLayoutSize:subitem:count:", v21, v17, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024ReadingListEnabled"))
  {
    -[SFStartPageCollectionViewController _applyStylingToLayoutGroup:withSectionItemType:defaultInterItemSpacing:](self, "_applyStylingToLayoutGroup:withSectionItemType:defaultInterItemSpacing:", v22, 2, 0.0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setInterItemSpacing:", v23);

  }
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (self->_displaysSectionHeaders)
  {
    headerSupplementaryItemLayout();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBoundarySupplementaryItems:", v27);

  }
  else
  {
    objc_msgSend(v24, "setBoundarySupplementaryItems:", MEMORY[0x1E0C9AA60]);
  }
  objc_msgSend(v25, "setContentInsets:", v6, v8, v10, v12);
  objc_msgSend(v25, "setInterGroupSpacing:", 0.0);

  return v25;
}

- (id)_bannerSectionLayoutForEnvironment:(id)a3 includingHeader:(BOOL)a4
{
  void *v6;
  void *v7;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  int v40;
  double v41;
  double v42;
  void *v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0DC3370];
  v7 = (void *)MEMORY[0x1E0DC3340];
  v8 = a3;
  objc_msgSend(v7, "fractionalWidthDimension:", 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 78.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeWithWidthDimension:heightDimension:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 78.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeWithWidthDimension:heightDimension:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0DC3350];
  v45[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "horizontalGroupWithLayoutSize:subitems:", v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (a4)
  {
    headerSupplementaryItemLayout();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBoundarySupplementaryItems:", v23);

  }
  else
  {
    objc_msgSend(v20, "setBoundarySupplementaryItems:", MEMORY[0x1E0C9AA60]);
  }
  -[SFStartPageCollectionViewController _sectionContentInsets](self, "_sectionContentInsets");
  objc_msgSend(v21, "setContentInsets:");
  objc_msgSend(v8, "container");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "effectiveContentSize");
  v26 = v25;
  v28 = v27;
  objc_msgSend(v21, "contentInsets");
  v31 = v26 - v29 - v30;

  -[SFStartPageVisualStyleProviding rowSpacingForSectionItemType:containerSize:](self->_visualStyleProvider, "rowSpacingForSectionItemType:containerSize:", 0, v31, v28);
  objc_msgSend(v21, "setInterGroupSpacing:");
  -[SFStartPageCollectionViewController _sectionContentInsets](self, "_sectionContentInsets");
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v40 = objc_msgSend(MEMORY[0x1E0D89BE8], "is2024PrivacyReportEnabled");
  v41 = v37 + 8.0;
  if (v40)
    v42 = v33 + 8.0;
  else
    v42 = v33;
  if (!v40)
    v41 = v37;
  objc_msgSend(v21, "setContentInsets:", v42, v35, v41, v39);

  return v21;
}

- (void)setHidesEmptyNavigationBar:(BOOL)a3
{
  if (self->_hidesEmptyNavigationBar != a3)
  {
    self->_hidesEmptyNavigationBar = a3;
    -[SFStartPageCollectionViewController reloadNavigationItemAnimated:](self, "reloadNavigationItemAnimated:", 0);
  }
}

- (void)viewDidLoad
{
  void *v3;
  SFStartPageBackgroundUIVisualEffectBackdropView *v4;
  _UIVisualEffectBackdropView *v5;
  _UIVisualEffectBackdropView *cellBackdropCaptureView;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  UICollectionView *v17;
  UICollectionView *collectionView;
  UICollectionView *v19;
  uint64_t v20;
  void *v21;
  UICollectionView *v22;
  uint64_t v23;
  void *v24;
  UICollectionView *v25;
  uint64_t v26;
  void *v27;
  UICollectionView *v28;
  uint64_t v29;
  void *v30;
  UICollectionView *v31;
  uint64_t v32;
  void *v33;
  UICollectionView *v34;
  uint64_t v35;
  void *v36;
  UICollectionView *v37;
  uint64_t v38;
  void *v39;
  UICollectionView *v40;
  uint64_t v41;
  void *v42;
  UICollectionView *v43;
  uint64_t v44;
  void *v45;
  UICollectionView *v46;
  uint64_t v47;
  void *v48;
  UICollectionView *v49;
  uint64_t v50;
  void *v51;
  UICollectionView *v52;
  uint64_t v53;
  void *v54;
  UICollectionView *v55;
  uint64_t v56;
  void *v57;
  UICollectionView *v58;
  uint64_t v59;
  void *v60;
  NSMapTable *v61;
  NSMapTable *contextMenuToItemIdentifierMap;
  UITapGestureRecognizer *v63;
  UITapGestureRecognizer *tapToDismissGestureRecognizer;
  id WeakRetained;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  UIVisualEffectView *v76;
  UIVisualEffectView *statusBarBackdrop;
  UIVisualEffectView *v78;
  UIVisualEffectView *navigationBarBackdrop;
  UIView *v80;
  UIView *navigationBarSeparator;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  _QWORD v87[4];
  id v88;
  id location;
  objc_super v90;
  uint64_t v91;
  _QWORD v92[2];
  uint64_t v93;
  _QWORD v94[2];

  v94[1] = *MEMORY[0x1E0C80C00];
  v90.receiver = self;
  v90.super_class = (Class)SFStartPageCollectionViewController;
  -[SFStartPageCollectionViewController viewDidLoad](&v90, sel_viewDidLoad);
  -[SFStartPageCollectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [SFStartPageBackgroundUIVisualEffectBackdropView alloc];
  objc_msgSend(v3, "bounds");
  v5 = -[SFStartPageBackgroundUIVisualEffectBackdropView initWithFrame:](v4, "initWithFrame:");
  cellBackdropCaptureView = self->_cellBackdropCaptureView;
  self->_cellBackdropCaptureView = v5;

  -[_UIVisualEffectBackdropView setAutoresizingMask:](self->_cellBackdropCaptureView, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", self->_cellBackdropCaptureView);
  v7 = objc_alloc(MEMORY[0x1E0DC35B8]);
  objc_msgSend(v3, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[SFStartPageCollectionViewController _makeCollectionViewLayout](self, "_makeCollectionViewLayout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (UICollectionView *)objc_msgSend(v7, "initWithFrame:collectionViewLayout:", v16, v9, v11, v13, v15);
  collectionView = self->_collectionView;
  self->_collectionView = v17;

  -[UICollectionView setAccessibilityIdentifier:](self->_collectionView, "setAccessibilityIdentifier:", CFSTR("StartPageCollectionView"));
  -[UICollectionView setAlwaysBounceVertical:](self->_collectionView, "setAlwaysBounceVertical:", 1);
  -[UICollectionView setAutoresizingMask:](self->_collectionView, "setAutoresizingMask:", 18);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setKeyboardDismissMode:](self->_collectionView, "setKeyboardDismissMode:", 2);
  -[UICollectionView setDragInteractionEnabled:](self->_collectionView, "setDragInteractionEnabled:", 1);
  -[UICollectionView setDragDelegate:](self->_collectionView, "setDragDelegate:", self);
  -[UICollectionView setDropDelegate:](self->_collectionView, "setDropDelegate:", self);
  v19 = self->_collectionView;
  v20 = objc_opt_class();
  +[SFBannerCell reuseIdentifier](SFBannerCell, "reuseIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v19, "registerClass:forCellWithReuseIdentifier:", v20, v21);

  v22 = self->_collectionView;
  v23 = objc_opt_class();
  +[SFPrivateRelayPromptBannerCell reuseIdentifier](SFPrivateRelayPromptBannerCell, "reuseIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v22, "registerClass:forCellWithReuseIdentifier:", v23, v24);

  v25 = self->_collectionView;
  v26 = objc_opt_class();
  +[SFAttributedRichLinkCell reuseIdentifier](SFAttributedRichLinkCell, "reuseIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v25, "registerClass:forCellWithReuseIdentifier:", v26, v27);

  v28 = self->_collectionView;
  v29 = objc_opt_class();
  +[SFInteractiveBannerCell reuseIdentifier](SFInteractiveBannerCell, "reuseIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v28, "registerClass:forCellWithReuseIdentifier:", v29, v30);

  v31 = self->_collectionView;
  v32 = objc_opt_class();
  +[SFPrivacyReportBannerCell reuseIdentifier](SFPrivacyReportBannerCell, "reuseIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v31, "registerClass:forCellWithReuseIdentifier:", v32, v33);

  v34 = self->_collectionView;
  v35 = objc_opt_class();
  +[SFPrivateBrowsingExplanationModuleCell reuseIdentifier](SFPrivateBrowsingExplanationModuleCell, "reuseIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v34, "registerClass:forCellWithReuseIdentifier:", v35, v36);

  v37 = self->_collectionView;
  v38 = objc_opt_class();
  +[SFStartPageFooterCell reuseIdentifier](SFStartPageFooterCell, "reuseIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v37, "registerClass:forCellWithReuseIdentifier:", v38, v39);

  v40 = self->_collectionView;
  v41 = objc_opt_class();
  +[SFSquareRichLinkCell reuseIdentifier](SFSquareRichLinkCell, "reuseIdentifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v40, "registerClass:forCellWithReuseIdentifier:", v41, v42);

  objc_msgSend(MEMORY[0x1E0D89BE8], "is2024ReadingListEnabled");
  v43 = self->_collectionView;
  v44 = objc_opt_class();
  +[SFSiteCardCell reuseIdentifier](SFSiteCardCell, "reuseIdentifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v43, "registerClass:forCellWithReuseIdentifier:", v44, v45);

  v46 = self->_collectionView;
  v47 = objc_opt_class();
  +[SFSiteIconCell reuseIdentifier](SFSiteIconCell, "reuseIdentifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v46, "registerClass:forCellWithReuseIdentifier:", v47, v48);

  v49 = self->_collectionView;
  v50 = objc_opt_class();
  +[SFSiteRowCell reuseIdentifier](SFSiteRowCell, "reuseIdentifier");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v49, "registerClass:forCellWithReuseIdentifier:", v50, v51);

  v52 = self->_collectionView;
  v53 = objc_opt_class();
  +[SFStartPageSectionHeader reuseIdentifier](SFStartPageSectionHeader, "reuseIdentifier");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v52, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v53, *MEMORY[0x1E0DC48A8], v54);

  if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024PrivacyReportEnabled"))
  {
    v55 = self->_collectionView;
    v56 = objc_opt_class();
    +[SFPrivacyRedesignBannerCell reuseIdentifier](SFPrivacyRedesignBannerCell, "reuseIdentifier");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v55, "registerClass:forCellWithReuseIdentifier:", v56, v57);

  }
  v58 = self->_collectionView;
  v59 = objc_opt_class();
  +[SFBannerMessageAndButtonsCell reuseIdentifier](SFBannerMessageAndButtonsCell, "reuseIdentifier");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v58, "registerClass:forCellWithReuseIdentifier:", v59, v60);

  -[SFStartPageCollectionViewController _setUpDataSource:](self, "_setUpDataSource:", self->_collectionView);
  -[SFStartPageCollectionViewController setContentScrollView:forEdge:](self, "setContentScrollView:forEdge:", self->_collectionView, 15);
  objc_msgSend(v3, "addSubview:", self->_collectionView);
  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v61 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  contextMenuToItemIdentifierMap = self->_contextMenuToItemIdentifierMap;
  self->_contextMenuToItemIdentifierMap = v61;

  v63 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__receivedTapToDismissGesture);
  tapToDismissGestureRecognizer = self->_tapToDismissGestureRecognizer;
  self->_tapToDismissGestureRecognizer = v63;

  -[UITapGestureRecognizer setCancelsTouchesInView:](self->_tapToDismissGestureRecognizer, "setCancelsTouchesInView:", 0);
  -[UITapGestureRecognizer setDelegate:](self->_tapToDismissGestureRecognizer, "setDelegate:", self);
  -[UICollectionView addGestureRecognizer:](self->_collectionView, "addGestureRecognizer:", self->_tapToDismissGestureRecognizer);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v66 = objc_msgSend(WeakRetained, "startPageCollectionViewControllerShouldInstallCustomBackdrops:", self);
  else
    v66 = 0;

  v93 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "sf_alternateLabelColor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v94[0] = v67;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, &v93, 1);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFStartPageCollectionViewController navigationItem](self, "navigationItem");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  v71 = v70;
  if (v66)
    objc_msgSend(v70, "configureWithTransparentBackground");
  else
    objc_msgSend(v70, "configureWithDefaultBackground");
  objc_msgSend(v71, "setLargeTitleTextAttributes:", v68);
  objc_msgSend(v69, "setStandardAppearance:", v71);

  v72 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(v72, "configureWithTransparentBackground");
  objc_msgSend(v72, "setTitleTextAttributes:", v68);
  objc_msgSend(v72, "setLargeTitleTextAttributes:", v68);
  objc_msgSend(v69, "setScrollEdgeAppearance:", v72);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "addObserver:selector:name:object:", self, sel_keyboardDidChangeFrame_, *MEMORY[0x1E0DC4FE8], 0);
  objc_msgSend(v73, "addObserver:selector:name:object:", self, sel_keyboardDidChangeFrame_, *MEMORY[0x1E0DC4E60], 0);
  objc_msgSend(v73, "addObserver:selector:name:object:", self, sel_keyboardDidChangeFrame_, *MEMORY[0x1E0DC4FE0], 0);
  if (v66)
  {
    v74 = (void *)objc_opt_new();
    objc_msgSend(v74, "backgroundEffect");
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    v76 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v75);
    statusBarBackdrop = self->_statusBarBackdrop;
    self->_statusBarBackdrop = v76;

    -[UIVisualEffectView _setGroupName:](self->_statusBarBackdrop, "_setGroupName:", CFSTR("com.apple.mobilesafari.CustomStartPageTopBackdrop"));
    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_statusBarBackdrop, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v3, "addSubview:", self->_statusBarBackdrop);
    v78 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v75);
    navigationBarBackdrop = self->_navigationBarBackdrop;
    self->_navigationBarBackdrop = v78;

    -[UIVisualEffectView _setGroupName:](self->_navigationBarBackdrop, "_setGroupName:", CFSTR("com.apple.mobilesafari.CustomStartPageTopBackdrop"));
    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_navigationBarBackdrop, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v3, "addSubview:", self->_navigationBarBackdrop);
    v80 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    navigationBarSeparator = self->_navigationBarSeparator;
    self->_navigationBarSeparator = v80;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_navigationBarSeparator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_barHairlineShadowColor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_navigationBarSeparator, "setBackgroundColor:", v82);

    objc_msgSend(v3, "addSubview:", self->_navigationBarSeparator);
  }
  v92[0] = objc_opt_class();
  v92[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 2);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (id)-[SFStartPageCollectionViewController registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v83, self, sel_updateBackgroundStyle);

  objc_initWeak(&location, self);
  v91 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v91, 1);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = MEMORY[0x1E0C809B0];
  v87[1] = 3221225472;
  v87[2] = __50__SFStartPageCollectionViewController_viewDidLoad__block_invoke;
  v87[3] = &unk_1E21E4650;
  objc_copyWeak(&v88, &location);
  v86 = (id)-[SFStartPageCollectionViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v85, v87);

  objc_destroyWeak(&v88);
  objc_destroyWeak(&location);

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setDataSource:(id)a3
{
  SFStartPageCollectionDataSource *WeakRetained;
  SFStartPageCollectionDataSource *v5;
  SFStartPageCollectionDataSource *strongDataSource;
  SFStartPageCollectionDataSource *obj;

  obj = (SFStartPageCollectionDataSource *)a3;
  WeakRetained = (SFStartPageCollectionDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    strongDataSource = self->_strongDataSource;
    if (strongDataSource != obj)
    {
      self->_strongDataSource = 0;

    }
    objc_storeWeak((id *)&self->_dataSource, obj);
    v5 = obj;
    if (self->_collectionDataSource)
    {
      -[SFStartPageCollectionViewController reloadDataAnimatingDifferences:](self, "reloadDataAnimatingDifferences:", 0);
      -[SFStartPageCollectionViewController reloadNavigationItemAnimated:](self, "reloadNavigationItemAnimated:", 0);
      v5 = obj;
    }
  }

}

- (SFStartPageCollectionViewController)initWithVisualStyleProvider:(id)a3
{
  id v5;
  SFStartPageCollectionViewController *v6;
  SFStartPageCollectionViewController *v7;
  SFStartPageCollectionViewController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFStartPageCollectionViewController;
  v6 = -[SFStartPageCollectionViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    v6->_displaysSectionHeaders = 1;
    v6->_hidesEmptyNavigationBar = 1;
    objc_storeStrong((id *)&v6->_visualStyleProvider, a3);
    v8 = v7;
  }

  return v7;
}

- (id)_makeCollectionViewLayout
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc_init(MEMORY[0x1E0DC35D8]);
  -[SFStartPageVisualStyleProviding defaultRowSpacing](self->_visualStyleProvider, "defaultRowSpacing");
  objc_msgSend(v3, "setInterSectionSpacing:");
  v4 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__SFStartPageCollectionViewController__makeCollectionViewLayout__block_invoke;
  v7[3] = &unk_1E21E64D8;
  objc_copyWeak(&v8, &location);
  v5 = (void *)objc_msgSend(v4, "initWithSectionProvider:configuration:", v7, v3);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
  return v5;
}

void __81__SFStartPageCollectionViewController__applyCurrentSnapshotAnimatingDifferences___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v7 = a2;
  if (!objc_msgSend(v7, "itemType") && objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7))
  {
    objc_msgSend(*(id *)(a1 + 40), "sectionIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __81__SFStartPageCollectionViewController__applyCurrentSnapshotAnimatingDifferences___block_invoke_2;
    v8[3] = &unk_1E21E6488;
    v4 = v7;
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(void **)(a1 + 56);
    v9 = v4;
    v10 = v5;
    v11 = v6;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);

  }
}

- (void)viewDidLayoutSubviews
{
  int64_t v3;
  CGFloat Width;
  double v5;
  void *v6;
  int v7;
  void *v8;
  objc_super v9;
  CGRect v10;

  v9.receiver = self;
  v9.super_class = (Class)SFStartPageCollectionViewController;
  -[SFStartPageCollectionViewController viewDidLayoutSubviews](&v9, sel_viewDidLayoutSubviews);
  v3 = -[SFStartPageCollectionViewController interfaceOrientation](self, "interfaceOrientation");
  -[UICollectionView bounds](self->_collectionView, "bounds");
  Width = CGRectGetWidth(v10);
  if (Width != 0.0)
  {
    v5 = Width;
    if (Width == self->_lastLayoutWidth)
    {
      if (!self->_shouldIgnoreLastLayoutSize)
        return;
    }
    else if (!self->_shouldIgnoreLastLayoutSize && v3 == self->_lastLayoutOrientation)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("DebugStartPageAllowsAnimatedReloadOnResize"));

      self->_lastLayoutWidth = v5;
      self->_lastLayoutOrientation = v3;
      self->_shouldIgnoreLastLayoutSize = 0;
      if (!v7)
      {
LABEL_11:
        -[SFStartPageCollectionViewController reloadDataAnimatingDifferences:](self, "reloadDataAnimatingDifferences:", 0);
        return;
      }
LABEL_9:
      if ((objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled") & 1) != 0)
      {
        -[SFStartPageCollectionViewController traitCollection](self, "traitCollection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFStartPageCollectionViewController reloadDataAnimatingDifferences:](self, "reloadDataAnimatingDifferences:", objc_msgSend(v8, "_presentationSemanticContext") != 3);

        return;
      }
      goto LABEL_11;
    }
    self->_lastLayoutWidth = Width;
    self->_lastLayoutOrientation = v3;
    self->_shouldIgnoreLastLayoutSize = 0;
    goto LABEL_9;
  }
}

- (void)_setUpDataSource:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  UICollectionViewDiffableDataSource *v7;
  UICollectionViewDiffableDataSource *collectionDataSource;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0DC35E8]);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__SFStartPageCollectionViewController__setUpDataSource___block_invoke;
  v11[3] = &unk_1E21E6410;
  objc_copyWeak(&v12, &location);
  v7 = (UICollectionViewDiffableDataSource *)objc_msgSend(v5, "initWithCollectionView:cellProvider:", v4, v11);
  collectionDataSource = self->_collectionDataSource;
  self->_collectionDataSource = v7;

  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __56__SFStartPageCollectionViewController__setUpDataSource___block_invoke_2;
  v9[3] = &unk_1E21E6438;
  objc_copyWeak(&v10, &location);
  -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](self->_collectionDataSource, "setSupplementaryViewProvider:", v9);
  -[SFStartPageCollectionViewController reloadDataAnimatingDifferences:](self, "reloadDataAnimatingDifferences:", 0);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)reloadNavigationItemAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  _QWORD v7[5];

  v3 = a3;
  -[SFStartPageCollectionViewController parentViewController](self, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SFStartPageCollectionViewController _updateNavigationItemAnimated:](self, "_updateNavigationItemAnimated:", v3);
    if (v3)
    {
      v6 = *MEMORY[0x1E0DC51A0];
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __68__SFStartPageCollectionViewController_reloadNavigationItemAnimated___block_invoke;
      v7[3] = &unk_1E21E2050;
      v7[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v7, v6);
    }
    else
    {
      -[SFStartPageCollectionViewController _updateCustomTopBackdrops](self, "_updateCustomTopBackdrops");
    }
    -[SFStartPageCollectionViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  }
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFStartPageCollectionViewController;
  -[SFStartPageCollectionViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[SFStartPageCollectionViewController _updateCustomTopBackdrops](self, "_updateCustomTopBackdrops");
}

- (void)updateCollectionViewContentInset
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id WeakRetained;
  double v15;
  double v16;
  double keyboardBottomInset;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int v24;
  double v25;
  double v26;
  double v27;
  id v28;

  -[SFStartPageCollectionViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v28 = (id)objc_claimAutoreleasedReturnValue();

  -[SFStartPageCollectionViewController scrollDistance](self, "scrollDistance");
  v5 = v4;
  -[SFStartPageVisualStyleProviding collectionViewContentInsetsWithNavigationBarPosition:](self->_visualStyleProvider, "collectionViewContentInsetsWithNavigationBarPosition:", objc_msgSend(v28, "barPosition"));
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "startPageCollectionViewControllerTopPadding:", self);
  v16 = v15;

  if (v16 != -1.0)
    v7 = v16;
  keyboardBottomInset = self->_keyboardBottomInset;
  -[UICollectionView safeAreaInsets](self->_collectionView, "safeAreaInsets");
  v19 = fmax(keyboardBottomInset - v18, 0.0);
  if (self->_keyboardBottomInset <= v11)
    v20 = v11;
  else
    v20 = v19;
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", v7, v9, v20, v13);
  v22 = *MEMORY[0x1E0DC49E8];
  v21 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v23 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v24 = -[SFStartPageCollectionViewController _isInPopoverPresentation](self, "_isInPopoverPresentation");
  v25 = 7.0;
  v26 = fmax(7.0, v19);
  if (v24)
    v27 = v26;
  else
    v27 = v19;
  if (!v24)
    v25 = v22;
  -[UICollectionView setVerticalScrollIndicatorInsets:](self->_collectionView, "setVerticalScrollIndicatorInsets:", v25, v21, v27, v23);
  if (v5 < 1.0)
    -[SFStartPageCollectionViewController scrollToTop](self, "scrollToTop");

}

- (void)scrollToTop
{
  void *v3;
  void *v4;
  SFStartPageCollectionViewController *v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;

  -[SFStartPageCollectionViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (SFStartPageCollectionViewController *)objc_claimAutoreleasedReturnValue();
  if (v5 != self)
  {

LABEL_3:
    -[UICollectionView adjustedContentInset](self->_collectionView, "adjustedContentInset");
    -[UICollectionView setContentOffset:animated:](self->_collectionView, "setContentOffset:animated:", 0, 0.0, -v6);
    return;
  }
  -[SFStartPageCollectionViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
    goto LABEL_3;
  -[SFStartPageCollectionViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v13 = v12;

  -[SFStartPageCollectionViewController navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "navigationBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v17 = -(v13 + v16);

  -[UICollectionView setContentOffset:](self->_collectionView, "setContentOffset:", 0.0, v17);
  -[UICollectionView setContentOffset:](self->_collectionView, "setContentOffset:", 0.0, v17);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SFStartPageCollectionViewController;
  -[SFStartPageCollectionViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  -[SFStartPageCollectionViewController _updateNavigationItemAnimated:](self, "_updateNavigationItemAnimated:", v3);
}

- (void)_updateNavigationItemAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  SFStartPageCollectionViewController *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "startPageCollectionViewControllerWillUpdateNavigationBar:", self);

  -[SFStartPageCollectionViewController navigationController](self, "navigationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topViewController");
  v6 = (SFStartPageCollectionViewController *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    -[SFStartPageCollectionViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (self->_hidesEmptyNavigationBar)
      v9 = objc_msgSend(v7, "sf_isEmpty");
    else
      v9 = 0;
    objc_msgSend(v10, "setNavigationBarHidden:animated:", v9, v3);

  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFStartPageCollectionViewController;
  -[SFStartPageCollectionViewController viewIsAppearing:](&v4, sel_viewIsAppearing_, a3);
  -[SFStartPageCollectionViewController navigationBarPositionDidChange](self, "navigationBarPositionDidChange");
  objc_msgSend(MEMORY[0x1E0DC3AD8], "visiblePeripheralFrame");
  -[SFStartPageCollectionViewController updateKeyboardBottomInsetFromKeyboardFrame:](self, "updateKeyboardBottomInsetFromKeyboardFrame:");
}

- (void)updateKeyboardBottomInsetFromKeyboardFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  BOOL IsEmpty;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double MaxY;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  IsEmpty = CGRectIsEmpty(a3);
  v9 = 0.0;
  if (!IsEmpty)
  {
    -[UICollectionView convertRect:fromView:](self->_collectionView, "convertRect:fromView:", 0, x, y, width, height);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[UICollectionView bounds](self->_collectionView, "bounds");
    MaxY = CGRectGetMaxY(v19);
    v20.origin.x = v11;
    v20.origin.y = v13;
    v20.size.width = v15;
    v20.size.height = v17;
    v9 = MaxY - CGRectGetMinY(v20);
  }
  if (v9 != self->_keyboardBottomInset)
  {
    self->_keyboardBottomInset = v9;
    -[SFStartPageCollectionViewController updateCollectionViewContentInset](self, "updateCollectionViewContentInset");
  }
}

uint64_t __83__SFStartPageCollectionViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyCurrentSnapshotAnimatingDifferences:", 0);
}

- (void)reloadSection:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[2];

  v4 = a4;
  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[SFStartPageCollectionViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[SFStartPageCollectionViewController traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_presentationSemanticContext");

    v9 = v8 != 3 && v4;
    -[UICollectionViewDiffableDataSource snapshot](self->_collectionDataSource, "snapshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageCollectionViewController _currentSnapshot](self, "_currentSnapshot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "indexOfSectionIdentifier:", v6);
    v13 = objc_msgSend(v11, "indexOfSectionIdentifier:", v6);
    v14 = v13;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_21:

        goto LABEL_22;
      }
      objc_msgSend(v10, "sectionIdentifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v14 > v16)
      {
        -[SFStartPageCollectionViewController reloadDataAnimatingDifferences:](self, "reloadDataAnimatingDifferences:", v9);
        goto LABEL_21;
      }
      objc_msgSend(v11, "sectionIdentifiers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "sectionIdentifiers");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");

      if (v14 == v26)
      {
        v32[0] = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "appendSectionsWithIdentifiers:", v27);
      }
      else
      {
        v31 = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sectionIdentifiers");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectAtIndexedSubscript:", v14);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "insertSectionsWithIdentifiers:beforeSectionWithIdentifier:", v27, v29);

      }
      objc_msgSend(v11, "itemIdentifiersInSectionWithIdentifier:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v19, v18);
    }
    else
    {
      objc_msgSend(v10, "sectionIdentifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v20 = objc_alloc_init(MEMORY[0x1E0DC3390]);
        objc_msgSend(v11, "itemIdentifiersInSectionWithIdentifier:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "appendItems:", v21);

        -[UICollectionViewDiffableDataSource applySnapshot:toSection:animatingDifferences:](self->_collectionDataSource, "applySnapshot:toSection:animatingDifferences:", v20, v18, v9);
        if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024PrivacyReportEnabled"))
        {
          objc_msgSend(v6, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0D8A678]);

          if (v23)
            -[SFStartPageCollectionViewController reloadDataAnimatingDifferences:](self, "reloadDataAnimatingDifferences:", v9);
        }

        goto LABEL_20;
      }
      v30 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "deleteSectionsWithIdentifiers:", v19);
    }

    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_collectionDataSource, "applySnapshot:animatingDifferences:", v10, v9);
LABEL_20:

    goto LABEL_21;
  }
LABEL_22:

}

uint64_t __83__SFStartPageCollectionViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __83__SFStartPageCollectionViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke_2;
  v2[3] = &unk_1E21E2050;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  void (**v6)(_QWORD);
  id WeakRetained;
  int v8;
  _QWORD aBlock[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFStartPageCollectionViewController;
  -[SFStartPageCollectionViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v10, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  if (a3)
  {
    if (self->_hasDeferredUpdates)
    {
      self->_hasDeferredUpdates = 0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __83__SFStartPageCollectionViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke;
      aBlock[3] = &unk_1E21E2050;
      aBlock[4] = self;
      v6 = (void (**)(_QWORD))_Block_copy(aBlock);
      if (self->_hasMadeFirstCommit
        && (WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
            v8 = objc_msgSend(WeakRetained, "startPageCollectionViewControllerShouldDeferLoadingContentUntilKeyboardAnimatesIn:", self), WeakRetained, !v8))
      {
        v6[2](v6);
      }
      else
      {
        objc_msgSend((id)*MEMORY[0x1E0DC4730], "_performBlockAfterCATransactionCommits:", v6);
      }

    }
    self->_hasMadeFirstCommit = 1;
  }
}

void __50__SFStartPageCollectionViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[124], "collectionViewLayout");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "invalidateLayout");

    WeakRetained = v3;
  }

}

- (void)ignorePreviousLayoutSize
{
  self->_shouldIgnoreLastLayoutSize = 1;
}

- (void)setStrongDataSource:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_strongDataSource, a3);
  v5 = a3;
  -[SFStartPageCollectionViewController setDataSource:](self, "setDataSource:", v5);

}

- (UIScrollView)scrollView
{
  return (UIScrollView *)self->_collectionView;
}

- (void)setDisplaysSectionHeaders:(BOOL)a3
{
  id v3;

  if (self->_displaysSectionHeaders != a3)
  {
    self->_displaysSectionHeaders = a3;
    -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateLayout");

  }
}

- (void)configureModelWithIdentifier:(id)a3 usingBlock:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))a4;
  -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_collectionDataSource, "indexPathForItemIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[SFStartPageCollectionViewController sections](self, "sections");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)(objc_msgSend(v9, "itemType") - 2) <= 4)
        v10[2](v10, v7);

    }
  }

}

- (void)presentViewController:(id)a3 fromItemWithIdentifier:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  SFStartPageCollectionViewController *v20;
  id v21;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0D89D00];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __84__SFStartPageCollectionViewController_presentViewController_fromItemWithIdentifier___block_invoke;
  v19 = &unk_1E21E2258;
  v20 = self;
  v10 = v6;
  v21 = v10;
  objc_msgSend(v9, "setHandler:", &v16);
  -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_collectionDataSource, "indexPathForItemIdentifier:", v8, v16, v17, v18, v19, v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v10, "setModalPresentationStyle:", 7);
      objc_msgSend(v10, "popoverPresentationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSourceView:", v12);
    }
    else
    {
      -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "layoutAttributesForItemAtIndexPath:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v10, "setModalPresentationStyle:", 7);
        objc_msgSend(v10, "popoverPresentationController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setSourceView:", self->_collectionView);
        objc_msgSend(v13, "frame");
        objc_msgSend(v15, "setSourceRect:");

      }
    }

  }
}

uint64_t __84__SFStartPageCollectionViewController_presentViewController_fromItemWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (BOOL)isTrackingDropSession
{
  return self->_hasActiveDrag || -[UICollectionView hasActiveDrop](self->_collectionView, "hasActiveDrop");
}

- (void)_receivedTapToDismissGesture
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "startPageCollectionViewControllerDidCompleteDismissGesture:", self);

}

- (void)keyboardDidChangeFrame:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    objc_msgSend(v6, "CGRectValue");
    -[SFStartPageCollectionViewController updateKeyboardBottomInsetFromKeyboardFrame:](self, "updateKeyboardBottomInsetFromKeyboardFrame:");
    v5 = v6;
  }

}

uint64_t __68__SFStartPageCollectionViewController_reloadNavigationItemAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCustomTopBackdrops");
}

- (BOOL)_shouldShowContextMenuForCellAtIndexPath:(id)a3 fromPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  char v8;

  y = a4.y;
  x = a4.x;
  -[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "convertPoint:fromView:", self->_collectionView, x, y);
    v8 = objc_msgSend(v7, "shouldShowContextMenuFromPoint:");
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  id WeakRetained;

  y = a5.y;
  x = a5.x;
  v8 = a4;
  if (-[SFStartPageCollectionViewController _shouldShowContextMenuForCellAtIndexPath:fromPoint:](self, "_shouldShowContextMenuForCellAtIndexPath:fromPoint:", v8, x, y))
  {
    -[SFStartPageCollectionViewController sections](self, "sections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_collectionDataSource, "itemIdentifierForIndexPath:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(v10, "contextMenuProvider");
      v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      ((void (**)(_QWORD, void *, id))v13)[2](v13, v11, WeakRetained);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        -[NSMapTable setObject:forKey:](self->_contextMenuToItemIdentifierMap, "setObject:forKey:", v11, v12);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v16[5];
  id v17;

  v8 = a4;
  v9 = a5;
  -[SFStartPageCollectionViewController collectionView:willEndContextMenuInteractionWithConfiguration:animator:](self, "collectionView:willEndContextMenuInteractionWithConfiguration:animator:", a3, v8, v9);
  objc_msgSend(v9, "previewViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "setPreferredCommitStyle:", 1);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __112__SFStartPageCollectionViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
    v16[3] = &unk_1E21E2258;
    v16[4] = self;
    v17 = v10;
    objc_msgSend(v9, "addAnimations:", v16);

  }
  else
  {
    -[NSMapTable objectForKey:](self->_contextMenuToItemIdentifierMap, "objectForKey:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_collectionDataSource, "indexPathForItemIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[SFStartPageCollectionViewController sections](self, "sections");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v12, "section"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "contextMenuCommitHandler");
      v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, void *, id))v15)[2](v15, v8, v11, v9);

    }
  }

}

void __112__SFStartPageCollectionViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushViewController:animated:", *(_QWORD *)(a1 + 40), 1);

}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  -[NSMapTable objectForKey:](self->_contextMenuToItemIdentifierMap, "objectForKey:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_collectionDataSource, "indexPathForItemIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "cellForItemAtIndexPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "contextMenuPreviewView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;

  v6 = a3;
  v7 = a4;
  -[NSMapTable objectForKey:](self->_contextMenuToItemIdentifierMap, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_collectionDataSource, "indexPathForItemIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[SFStartPageCollectionViewController sections](self, "sections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v9, "section"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "contextMenuDismissHandler");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *))v12)[2](v12, v7, v8);

  }
  -[SFStartPageCollectionViewController collectionView:previewForHighlightingContextMenuWithConfiguration:](self, "collectionView:previewForHighlightingContextMenuWithConfiguration:", v6, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  self->_isPresentingContextMenu = 1;
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __110__SFStartPageCollectionViewController_collectionView_willEndContextMenuInteractionWithConfiguration_animator___block_invoke;
  v5[3] = &unk_1E21E2050;
  v5[4] = self;
  objc_msgSend(a5, "addAnimations:", v5, a4);
}

_BYTE *__110__SFStartPageCollectionViewController_collectionView_willEndContextMenuInteractionWithConfiguration_animator___block_invoke(uint64_t a1)
{
  _BYTE *result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1004) = 0;
  result = *(_BYTE **)(a1 + 32);
  if (result[1002])
  {
    result = (_BYTE *)objc_msgSend(result, "reloadDataAnimatingDifferences:", 1);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1002) = 0;
  }
  return result;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unint64_t v11;

  v5 = a4;
  -[SFStartPageCollectionViewController sections](self, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "section");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "itemType"))
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_msgSend(v8, "contentBanner");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "contentVariant");

    if (v11 <= 6)
      v9 = (6u >> v11) & 1;
    else
      LOBYTE(v9) = 1;
  }

  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void (**v15)(_QWORD);
  id v16;

  v16 = a3;
  v6 = a4;
  -[SFStartPageCollectionViewController sections](self, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_collectionDataSource, "itemIdentifierForIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = objc_msgSend(v8, "itemType");
  if ((unint64_t)(v11 - 3) < 4)
    goto LABEL_2;
  if (v11 != 2)
  {
    if (v11)
      goto LABEL_10;
    objc_msgSend(v16, "deselectItemAtIndexPath:animated:", v6, 1);
    objc_msgSend(v8, "contentBanner");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "action");
    v15 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

    if (v15)
      v15[2](v15);
LABEL_9:

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "supplementaryAction");
    v15 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "performAction");
    goto LABEL_9;
  }
LABEL_2:
  v12 = -[SFStartPageCollectionViewController _gridLocationForIndexPath:inSection:](self, "_gridLocationForIndexPath:inSection:", v6, v8);
  objc_msgSend(WeakRetained, "startPageCollectionViewController:didSelectItemWithIdentifier:atGridLocation:", self, v9, v12, v13);
LABEL_10:

}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_gridLocationForIndexPath:(id)a3 inSection:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  SFStartPageVisualStyleProviding *visualStyleProvider;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  int64_t v20;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v6 = a4;
  v7 = a3;
  -[SFStartPageCollectionViewController _effectiveLayoutWidth](self, "_effectiveLayoutWidth");
  v9 = v8;
  -[SFStartPageCollectionViewController _sectionContentInsets](self, "_sectionContentInsets");
  v12 = v9 - v10 - v11;
  visualStyleProvider = self->_visualStyleProvider;
  v14 = objc_msgSend(v6, "itemType");

  -[SFStartPageCollectionViewController traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SFStartPageVisualStyleProviding numberOfColumnsForSectionItemType:sectionWidth:traitCollection:](visualStyleProvider, "numberOfColumnsForSectionItemType:sectionWidth:traitCollection:", v14, v15, v12);

  v17 = objc_msgSend(v7, "item") / v16;
  v18 = objc_msgSend(v7, "item");

  v19 = v18 % v16;
  v20 = v17;
  result.var1 = v20;
  result.var0 = v19;
  return result;
}

- (id)_reuseIdentifierForCellWithIdentifier:(id)a3 section:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  __objc2_class **v8;
  __objc2_class *v9;

  v5 = a4;
  switch(objc_msgSend(v5, "itemType"))
  {
    case 0:
      objc_msgSend(v5, "contentBanner");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "contentVariant");
      v8 = off_1E21E02E8;
      switch(v7)
      {
        case 0:
          break;
        case 1:
          v8 = off_1E21E03E8;
          break;
        case 2:
          if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024PrivacyReportEnabled")
            && _SFDeviceIsPad()
            && !objc_msgSend(v6, "isPrivateBrowsingEnabled"))
          {
            v8 = off_1E21E0448;
          }
          else
          {
            v8 = off_1E21E0450;
          }
          break;
        case 3:
          v8 = off_1E21E0468;
          break;
        case 4:
        case 5:
          v8 = off_1E21E0460;
          break;
        case 6:
          v8 = off_1E21E02F0;
          break;
        default:

          goto LABEL_10;
      }
      -[__objc2_class reuseIdentifier](*v8, "reuseIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 1:
LABEL_10:
      v9 = SFStartPageFooterCell;
      goto LABEL_11;
    case 2:
      v9 = SFSiteIconCell;
      goto LABEL_11;
    case 3:
      v9 = SFSiteCardCell;
      goto LABEL_11;
    case 4:
      v9 = SFAttributedRichLinkCell;
      goto LABEL_11;
    case 5:
      v9 = SFSiteRowCell;
      goto LABEL_11;
    case 6:
      v9 = SFSquareRichLinkCell;
LABEL_11:
      -[__objc2_class reuseIdentifier](v9, "reuseIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return v4;
}

void __81__SFStartPageCollectionViewController__applyCurrentSnapshotAnimatingDifferences___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1104));
  v3 = WeakRetained;
  if (*(_BYTE *)(a1 + 40))
  {
    v5 = WeakRetained;
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "startPageCollectionViewControllerDidUpdateContent:", *(_QWORD *)(a1 + 32));
      v3 = v5;
    }
  }

}

void __81__SFStartPageCollectionViewController__applyCurrentSnapshotAnimatingDifferences___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 984);
  objc_msgSend(v1, "snapshot");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "applySnapshot:animatingDifferences:", v2, 1);

}

- (void)cancelGestures
{
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "_cancelGestureRecognizersForView:", self->_collectionView);
}

void __60__SFStartPageCollectionViewController__customizationSection__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 138);
    objc_msgSend(v2, "beginCustomizationForStartPageCollectionViewController:", v3);

    WeakRetained = v3;
  }

}

- (int64_t)_numberOfColumnsInSection:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  SFStartPageVisualStyleProviding *visualStyleProvider;
  uint64_t v11;
  void *v12;
  int64_t v13;

  v4 = a3;
  -[SFStartPageCollectionViewController _effectiveLayoutWidth](self, "_effectiveLayoutWidth");
  v6 = v5;
  -[SFStartPageCollectionViewController _sectionContentInsets](self, "_sectionContentInsets");
  v9 = v6 - v7 - v8;
  visualStyleProvider = self->_visualStyleProvider;
  v11 = objc_msgSend(v4, "itemType");

  -[SFStartPageCollectionViewController traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SFStartPageVisualStyleProviding numberOfColumnsForSectionItemType:sectionWidth:traitCollection:](visualStyleProvider, "numberOfColumnsForSectionItemType:sectionWidth:traitCollection:", v11, v12, v9);

  return v13;
}

- (int64_t)_numberOfItemsPerPageInSection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;

  v4 = a3;
  -[SFStartPageCollectionViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "horizontalSizeClass") == 1)
    v6 = objc_msgSend(v4, "numberOfRowsVisibleWhenCollapsedInCompactWidth");
  else
    v6 = objc_msgSend(v4, "numberOfRowsVisibleWhenCollapsed");
  v7 = v6;

  v8 = -[SFStartPageCollectionViewController _numberOfColumnsInSection:](self, "_numberOfColumnsInSection:", v4) * v7;
  return v8;
}

void __81__SFStartPageCollectionViewController__toggleExpandedActionForSectionIdentifier___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 138);
    if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024CloudTabsEnabled")
      && (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0D8A648]) & 1) != 0
      || objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled")
      && objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0D8A698]))
    {
      objc_msgSend(v3, "startPageCollectionViewController:shouldExpandSectionWithIdentifier:", v6, *(_QWORD *)(a1 + 32));
    }
    else
    {
      objc_msgSend(v6, "_sectionForIdentifier:", *(_QWORD *)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_loadWeakRetained(v6 + 136);
      objc_msgSend(v5, "startPageCollectionViewController:toggleSectionExpanded:", v6, v4);

      objc_msgSend(v6, "reloadDataAnimatingDifferences:", 1);
    }

    WeakRetained = v6;
  }

}

- (void)_applyStylingToLayoutGroup:(id)a3 withSectionItemType:(int64_t)a4 defaultInterItemSpacing:(double)a5
{
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[SFStartPageVisualStyleProviding interItemSpacingForSectionItemType:](self->_visualStyleProvider, "interItemSpacingForSectionItemType:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v10, "setInterItemSpacing:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInterItemSpacing:", v9);

  }
}

- (id)_siteCardSectionLayoutForEnvironment:(id)a3 numberOfItems:(int64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  SFStartPageVisualStyleProviding *visualStyleProvider;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  SFStartPageVisualStyleProviding *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SFStartPageCollectionViewController _sectionContentInsets](self, "_sectionContentInsets");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "container");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "effectiveContentSize");
  v17 = v16;
  v19 = v18 - v10 - v14;

  v53 = v6;
  visualStyleProvider = self->_visualStyleProvider;
  objc_msgSend(v6, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[SFStartPageVisualStyleProviding numberOfColumnsForSectionItemType:sectionWidth:traitCollection:](visualStyleProvider, "numberOfColumnsForSectionItemType:sectionWidth:traitCollection:", 3, v21, v19);

  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 112.0);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0 / (double)v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sizeWithWidthDimension:heightDimension:", v25, v23);
  v26 = objc_claimAutoreleasedReturnValue();

  v52 = (void *)v26;
  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v26);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = -[SFStartPageCollectionViewController _supportsPaginatedSectionLayouts](self, "_supportsPaginatedSectionLayouts");
  v29 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v23;
  objc_msgSend(v29, "sizeWithWidthDimension:heightDimension:", v30, v23);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = (void *)v27;
  objc_msgSend(MEMORY[0x1E0DC3350], "horizontalGroupWithLayoutSize:repeatingSubitem:count:", v32, v27, v22);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    -[SFStartPageCollectionViewController _applyStylingToLayoutGroup:withSectionItemType:defaultInterItemSpacing:](self, "_applyStylingToLayoutGroup:withSectionItemType:defaultInterItemSpacing:", v33, 3, 0.0);
    v34 = self->_visualStyleProvider;
    -[SFStartPageCollectionViewController traitCollection](self, "traitCollection");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[SFStartPageVisualStyleProviding numberOfRowsForSection:traitCollectionIsHorizontalCompact:](v34, "numberOfRowsForSection:traitCollectionIsHorizontalCompact:", 3, objc_msgSend(v35, "horizontalSizeClass") == 1);

    if (v36 < 2)
    {
      v38 = 1;
    }
    else
    {
      v37 = v36 - 1;
      v38 = 1;
      v39 = v22;
      do
      {
        if (v39 < a4)
          ++v38;
        v39 += v22;
        --v37;
      }
      while (v37);
    }
    v41 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 0.9);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v31;
    objc_msgSend(v41, "sizeWithWidthDimension:heightDimension:", v42, v31);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3350], "verticalGroupWithLayoutSize:repeatingSubitem:count:", v43, v33, v38);
    v44 = objc_claimAutoreleasedReturnValue();

    v33 = (void *)v44;
  }
  else
  {
    v40 = v31;
  }

  -[SFStartPageCollectionViewController _siteIconLayoutForEnvironment:sectionInsets:](self, "_siteIconLayoutForEnvironment:sectionInsets:", v53, v8, v10, v12, v14);
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024ReadingListEnabled"))
  {
    -[SFStartPageCollectionViewController _applyStylingToLayoutGroup:withSectionItemType:defaultInterItemSpacing:](self, "_applyStylingToLayoutGroup:withSectionItemType:defaultInterItemSpacing:", v33, 3, 0.0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3378], "flexibleSpacing:", 0.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setInterItemSpacing:", v45);

  }
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v33);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (self->_displaysSectionHeaders)
  {
    headerSupplementaryItemLayout();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v48;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setBoundarySupplementaryItems:", v49);

  }
  else
  {
    objc_msgSend(v46, "setBoundarySupplementaryItems:", MEMORY[0x1E0C9AA60]);
  }
  objc_msgSend(v47, "setContentInsets:", v8, v10, v12, v14);
  -[SFStartPageVisualStyleProviding rowSpacingForSectionItemType:containerSize:](self->_visualStyleProvider, "rowSpacingForSectionItemType:containerSize:", 3, v19, v17);
  objc_msgSend(v47, "setInterGroupSpacing:");
  if (-[SFStartPageCollectionViewController _supportsPaginatedSectionLayouts](self, "_supportsPaginatedSectionLayouts"))
    objc_msgSend(v47, "setOrthogonalScrollingBehavior:", 4);

  return v47;
}

- (id)_attributedRichLinkSectionLayoutForEnvironment:(id)a3 maximumNumberOfPages:(int64_t)a4 numberOfItems:(int64_t)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  SFStartPageVisualStyleProviding *visualStyleProvider;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int64_t v34;
  void *v35;
  void *v36;
  void *v37;
  SFStartPageVisualStyleProviding *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  int64_t v49;
  void *v50;
  _QWORD v51[2];

  v49 = a5;
  v51[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[SFStartPageCollectionViewController _sectionContentInsets](self, "_sectionContentInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "container");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "effectiveContentSize");
  v18 = v17;
  v20 = v19 - v11 - v15;

  visualStyleProvider = self->_visualStyleProvider;
  objc_msgSend(v7, "traitCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[SFStartPageVisualStyleProviding numberOfColumnsForSectionItemType:sectionWidth:traitCollection:](visualStyleProvider, "numberOfColumnsForSectionItemType:sectionWidth:traitCollection:", 4, v22, v20);

  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 150.0);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0 / (double)v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sizeWithWidthDimension:heightDimension:", v26, v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFStartPageCollectionViewController _siteIconLayoutForEnvironment:sectionInsets:](self, "_siteIconLayoutForEnvironment:sectionInsets:", v7, v9, v11, v13, v15);

  v29 = -[SFStartPageCollectionViewController _supportsPaginatedSectionLayouts](self, "_supportsPaginatedSectionLayouts");
  v30 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)v24;
  objc_msgSend(v30, "sizeWithWidthDimension:heightDimension:", v31, v24);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3350], "horizontalGroupWithLayoutSize:repeatingSubitem:count:", v32, v28, v23);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = a4;
  if (a4 >= 2 && v29)
  {
    -[SFStartPageCollectionViewController _applyStylingToLayoutGroup:withSectionItemType:defaultInterItemSpacing:](self, "_applyStylingToLayoutGroup:withSectionItemType:defaultInterItemSpacing:", v33, 4, 0.0);
    v35 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 0.9);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "sizeWithWidthDimension:heightDimension:", v36, v50);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23 >= v49)
    {
      v40 = 1;
    }
    else
    {
      v38 = self->_visualStyleProvider;
      -[SFStartPageCollectionViewController traitCollection](self, "traitCollection");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = -[SFStartPageVisualStyleProviding numberOfRowsForSection:traitCollectionIsHorizontalCompact:](v38, "numberOfRowsForSection:traitCollectionIsHorizontalCompact:", 4, objc_msgSend(v39, "horizontalSizeClass") == 1);

    }
    objc_msgSend(MEMORY[0x1E0DC3350], "verticalGroupWithLayoutSize:repeatingSubitem:count:", v37, v33, v40, v49);
    v41 = objc_claimAutoreleasedReturnValue();

    v33 = (void *)v41;
  }

  if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled"))
  {
    -[SFStartPageCollectionViewController _applyStylingToLayoutGroup:withSectionItemType:defaultInterItemSpacing:](self, "_applyStylingToLayoutGroup:withSectionItemType:defaultInterItemSpacing:", v33, 4, 0.0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", 0.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setInterItemSpacing:", v42);

  }
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v33, v49);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (self->_displaysSectionHeaders)
  {
    headerSupplementaryItemLayout();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setBoundarySupplementaryItems:", v46);

  }
  else
  {
    objc_msgSend(v43, "setBoundarySupplementaryItems:", MEMORY[0x1E0C9AA60]);
  }
  -[SFStartPageVisualStyleProviding rowSpacingForSectionItemType:containerSize:](self->_visualStyleProvider, "rowSpacingForSectionItemType:containerSize:", 4, v20, v18);
  objc_msgSend(v44, "setInterGroupSpacing:");
  objc_msgSend(v44, "setContentInsets:", v9, v11, v13, v15);
  v47 = -[SFStartPageCollectionViewController _supportsPaginatedSectionLayouts](self, "_supportsPaginatedSectionLayouts");
  if (v34 >= 2 && v47 && objc_msgSend(MEMORY[0x1E0D89BE8], "is2024SuggestionsEnabled"))
    objc_msgSend(v44, "setOrthogonalScrollingBehavior:", 4);

  return v44;
}

- (id)_squareRichLinkSectionLayoutForEnvironment:(id)a3 numberOfItems:(int64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  SFStartPageVisualStyleProviding *visualStyleProvider;
  void *v21;
  int64_t v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SFStartPageCollectionViewController _sectionContentInsets](self, "_sectionContentInsets");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "container");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "effectiveContentSize");
  v17 = v16;
  v19 = v18 - v10 - v14;

  visualStyleProvider = self->_visualStyleProvider;
  objc_msgSend(v6, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[SFStartPageVisualStyleProviding numberOfColumnsForSectionItemType:sectionWidth:traitCollection:](visualStyleProvider, "numberOfColumnsForSectionItemType:sectionWidth:traitCollection:", 6, v21, v19);
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 200.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0DC3370];
  v25 = 1.0;
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0 / (double)v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sizeWithWidthDimension:heightDimension:", v26, v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFStartPageCollectionViewController traitCollection](self, "traitCollection");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "horizontalSizeClass");

  if (v30 == 1)
  {
    v31 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sizeWithWidthDimension:heightDimension:", v32, v23);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3350], "horizontalGroupWithLayoutSize:repeatingSubitem:count:", v33, v28, v22);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageCollectionViewController _applyStylingToLayoutGroup:withSectionItemType:defaultInterItemSpacing:](self, "_applyStylingToLayoutGroup:withSectionItemType:defaultInterItemSpacing:", v34, 6, 0.0);
    v35 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 0.9);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "sizeWithWidthDimension:heightDimension:", v36, v23);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22 >= a4)
      v38 = 1;
    else
      v38 = -[SFStartPageVisualStyleProviding numberOfRowsForSection:traitCollectionIsHorizontalCompact:](self->_visualStyleProvider, "numberOfRowsForSection:traitCollectionIsHorizontalCompact:", 6, 1);
    objc_msgSend(MEMORY[0x1E0DC3350], "verticalGroupWithLayoutSize:repeatingSubitem:count:", v37, v34, v38);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((_SFDeviceIsPad() & 1) == 0)
    {
      -[SFStartPageCollectionViewController view](self, "view");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v39, "_sf_hasLandscapeAspectRatio"))
        v25 = 0.9;
      else
        v25 = 1.0;

    }
    v40 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", v25);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "sizeWithWidthDimension:heightDimension:", v41, v23);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3350], "horizontalGroupWithLayoutSize:repeatingSubitem:count:", v33, v28, v22);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[SFStartPageCollectionViewController _applyStylingToLayoutGroup:withSectionItemType:defaultInterItemSpacing:](self, "_applyStylingToLayoutGroup:withSectionItemType:defaultInterItemSpacing:", v42, 6, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (self->_displaysSectionHeaders)
  {
    headerSupplementaryItemLayout();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setBoundarySupplementaryItems:", v46);

  }
  else
  {
    objc_msgSend(v43, "setBoundarySupplementaryItems:", MEMORY[0x1E0C9AA60]);
  }
  objc_msgSend(v44, "setContentInsets:", v8, v10, v12, v14);
  -[SFStartPageVisualStyleProviding rowSpacingForSectionItemType:containerSize:](self->_visualStyleProvider, "rowSpacingForSectionItemType:containerSize:", 4, v19, v17);
  objc_msgSend(v44, "setInterGroupSpacing:");
  if (-[SFStartPageCollectionViewController _supportsPaginatedSectionLayouts](self, "_supportsPaginatedSectionLayouts"))
    objc_msgSend(v44, "setOrthogonalScrollingBehavior:", 4);

  return v44;
}

- (id)_siteRowSectionLayoutForEnvironment:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  SFStartPageVisualStyleProviding *visualStyleProvider;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0DC3370];
  v5 = (void *)MEMORY[0x1E0DC3340];
  v6 = a3;
  objc_msgSend(v5, "fractionalWidthDimension:", 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 40.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeWithWidthDimension:heightDimension:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFStartPageCollectionViewController _sectionContentInsets](self, "_sectionContentInsets");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v6, "container");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "effectiveContentSize");
  v21 = v20;
  v23 = v22 - v14 - v18;

  visualStyleProvider = self->_visualStyleProvider;
  objc_msgSend(v6, "traitCollection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[SFStartPageVisualStyleProviding numberOfColumnsForSectionItemType:sectionWidth:traitCollection:](visualStyleProvider, "numberOfColumnsForSectionItemType:sectionWidth:traitCollection:", 5, v25, v23);

  -[SFStartPageCollectionViewController _siteIconLayoutForEnvironment:sectionInsets:](self, "_siteIconLayoutForEnvironment:sectionInsets:", v6, v12, v14, v16, v18, 0, 0);
  v27 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 40.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sizeWithWidthDimension:heightDimension:", v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3350], "horizontalGroupWithLayoutSize:subitem:count:", v30, v10, v26);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFStartPageVisualStyleProviding interItemSpacingForSectionItemType:](self->_visualStyleProvider, "interItemSpacingForSectionItemType:", 5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    objc_msgSend(v31, "setInterItemSpacing:", v32);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", 0.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setInterItemSpacing:", v33);

  }
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v31);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (self->_displaysSectionHeaders)
  {
    headerSupplementaryItemLayout();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setBoundarySupplementaryItems:", v37);

  }
  else
  {
    objc_msgSend(v34, "setBoundarySupplementaryItems:", MEMORY[0x1E0C9AA60]);
  }
  objc_msgSend(v35, "setContentInsets:", v12, v14, v16, v18);
  -[SFStartPageVisualStyleProviding rowSpacingForSectionItemType:containerSize:](self->_visualStyleProvider, "rowSpacingForSectionItemType:containerSize:", 5, v23, v21);
  objc_msgSend(v35, "setInterGroupSpacing:");

  return v35;
}

- (BOOL)_supportsPaginatedSectionLayouts
{
  void *v2;
  int v3;

  -[SFStartPageCollectionViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "horizontalSizeClass") == 1)
    LOBYTE(v3) = 1;
  else
    v3 = _SFDeviceIsPad() ^ 1;

  return v3;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t);
  void *v20;
  SFStartPageCollectionViewController *v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "locationInView:", a3);
  if (-[SFStartPageCollectionViewController _shouldShowContextMenuForCellAtIndexPath:fromPoint:](self, "_shouldShowContextMenuForCellAtIndexPath:fromPoint:", v9))
  {
    -[SFStartPageCollectionViewController sections](self, "sections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v9, "section"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_collectionDataSource, "itemIdentifierForIndexPath:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend(v11, "dragItemProvider");
      v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, id))v14)[2](v14, v12, v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __95__SFStartPageCollectionViewController_collectionView_itemsForBeginningDragSession_atIndexPath___block_invoke;
      v20 = &unk_1E21E6500;
      v21 = self;
      v22 = v9;
      objc_msgSend(v15, "setPreviewProvider:", &v17);
      if (v15)
      {
        self->_hasActiveDrag = 1;
        v23[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1, v17, v18, v19, v20, v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = (void *)MEMORY[0x1E0C9AA60];
      }

    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

id __95__SFStartPageCollectionViewController_collectionView_itemsForBeginningDragSession_atIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_previewForCellAtIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_dragPreviewParametersForSourceView:atIndexPath:", v2, *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3760]), "initWithView:parameters:", v2, v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SFStartPageCollectionViewController _previewForCellAtIndexPath:](self, "_previewForCellAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SFStartPageCollectionViewController _dragPreviewParametersForSourceView:atIndexPath:](self, "_dragPreviewParametersForSourceView:atIndexPath:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_previewForCellAtIndexPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  -[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "contextMenuPreviewView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (id)_dragPreviewParametersForSourceView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0DC3768];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v10);

  -[SFStartPageCollectionViewController sections](self, "sections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "section");

  objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "itemType");
  if ((unint64_t)(v14 - 3) >= 2 && v14 == 2)
    +[_SFSiteIcon cornerRadius](_SFSiteIcon, "cornerRadius");
  v15 = (void *)MEMORY[0x1E0DC3508];
  objc_msgSend(v6, "bounds");
  objc_msgSend(v15, "bezierPathWithRoundedRect:cornerRadius:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVisiblePath:", v16);

  return v9;
}

- (BOOL)_canDrop
{
  void *v2;
  char v3;

  -[SFStartPageCollectionViewController sections](self, "sections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safari_containsObjectPassingTest:", &__block_literal_global_51);

  return v3;
}

BOOL __47__SFStartPageCollectionViewController__canDrop__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "dropHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0D89B98];
  v6 = a4;
  objc_msgSend(v5, "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didStartDragWithDragContentType:", 5);

  -[UICollectionView window](self->_collectionView, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocalContext:", v8);

  -[SFStartPageCollectionViewController _updateInteractionEnabled](self, "_updateInteractionEnabled");
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  _QWORD block[5];

  self->_hasActiveDrag = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__SFStartPageCollectionViewController_collectionView_dragSessionDidEnd___block_invoke;
  block[3] = &unk_1E21E2050;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __72__SFStartPageCollectionViewController_collectionView_dragSessionDidEnd___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateInteractionEnabled");
}

- (void)_updateInteractionEnabled
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[UICollectionView visibleSupplementaryViewsOfKind:](self->_collectionView, "visibleSupplementaryViewsOfKind:", *MEMORY[0x1E0DC48A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        -[SFStartPageCollectionViewController _updateInteractionEnabledForView:](self, "_updateInteractionEnabledForView:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[SFStartPageCollectionViewController sections](self, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__SFStartPageCollectionViewController__updateInteractionEnabled__block_invoke;
  v9[3] = &unk_1E21E6568;
  v9[4] = self;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

}

void __64__SFStartPageCollectionViewController__updateInteractionEnabled__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (!objc_msgSend(v7, "itemType") || objc_msgSend(v7, "itemType") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "cellForItemAtIndexPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_updateInteractionEnabledForView:", v6);

  }
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  return 3;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t (**v21)(_QWORD, _QWORD, _QWORD);
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__8;
  v39 = __Block_byref_object_dispose__8;
  v40 = 0;
  objc_msgSend(v9, "locationInView:", v8);
  v12 = v11;
  v14 = v13;
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __100__SFStartPageCollectionViewController_collectionView_dropSessionDidUpdate_withDestinationIndexPath___block_invoke;
  v30 = &unk_1E21E6590;
  v32 = &v35;
  v15 = v8;
  v31 = v15;
  v33 = v12;
  v34 = v14;
  objc_msgSend(v15, "performUsingPresentationValues:", &v27);
  v16 = (id)v36[5];

  v17 = objc_msgSend(v16, "section", v27, v28, v29, v30);
  -[SFStartPageCollectionViewController sections](self, "sections");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v16 && v17 < objc_msgSend(v18, "count"))
  {
    objc_msgSend(v19, "objectAtIndexedSubscript:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dropOperationProvider");
    v21 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v22 = ((uint64_t (**)(_QWORD, uint64_t, id))v21)[2](v21, objc_msgSend(v16, "item"), v9);

    v23 = objc_alloc(MEMORY[0x1E0DC3608]);
    if ((v22 & 0xFFFFFFFFFFFFFFFELL) == 2)
      v24 = 1;
    else
      v24 = 2;
    v25 = (void *)objc_msgSend(v23, "initWithDropOperation:intent:", v22, v24);

  }
  else
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3608]), "initWithDropOperation:", 0);
  }

  _Block_object_dispose(&v35, 8);
  return v25;
}

void __100__SFStartPageCollectionViewController_collectionView_dropSessionDidUpdate_withDestinationIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "indexPathForItemAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;

  v10 = a4;
  -[SFStartPageCollectionViewController sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "destinationIndexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dropHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "dropHandler");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v9)[2](v9, v10);

  }
}

- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__SFStartPageCollectionViewController_collectionView_dropSessionDidExit___block_invoke;
  block[3] = &unk_1E21E2050;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __73__SFStartPageCollectionViewController_collectionView_dropSessionDidExit___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateInteractionEnabled");
}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__SFStartPageCollectionViewController_collectionView_dropSessionDidEnd___block_invoke;
  block[3] = &unk_1E21E2050;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __72__SFStartPageCollectionViewController_collectionView_dropSessionDidEnd___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateInteractionEnabled");
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  return 3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  UICollectionView *collectionView;
  void *v11;

  v6 = a4;
  v7 = v6;
  if (self->_tapToDismissGestureRecognizer == a3)
  {
    objc_msgSend(v6, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      collectionView = self->_collectionView;
      objc_msgSend(v7, "locationInView:", collectionView);
      -[UICollectionView indexPathForItemAtPoint:](collectionView, "indexPathForItemAtPoint:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v11 == 0;

    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (SFStartPageCollectionDataSource)dataSource
{
  return (SFStartPageCollectionDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (SFStartPageCollectionDataSource)strongDataSource
{
  return self->_strongDataSource;
}

- (SFStartPageCollectionDelegate)delegate
{
  return (SFStartPageCollectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)displaysSectionHeaders
{
  return self->_displaysSectionHeaders;
}

- (BOOL)hidesEmptyNavigationBar
{
  return self->_hidesEmptyNavigationBar;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_strongDataSource, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_contextMenuToItemIdentifierMap, 0);
  objc_storeStrong((id *)&self->_visualStyleProvider, 0);
  objc_storeStrong((id *)&self->_tapToDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_statusBarBackdrop, 0);
  objc_storeStrong((id *)&self->_navigationBarSeparator, 0);
  objc_storeStrong((id *)&self->_navigationBarBackdrop, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionDataSource, 0);
  objc_storeStrong((id *)&self->_cellBackdropCaptureView, 0);
  objc_storeStrong((id *)&self->_cachedCustomizationSection, 0);
}

void __64__SFStartPageCollectionViewController__makeCollectionViewLayout__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18B7B2000, log, OS_LOG_TYPE_FAULT, "Attempted to provide a start page section layout using a nil collection view controller", v1, 2u);
}

@end
