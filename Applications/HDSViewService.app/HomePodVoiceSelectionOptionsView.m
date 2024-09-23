@implementation HomePodVoiceSelectionOptionsView

- (HomePodVoiceSelectionOptionsView)init
{
  HomePodVoiceSelectionOptionsView *v2;
  HomePodVoiceSelectionOptionsView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HomePodVoiceSelectionOptionsView;
  v2 = -[HomePodVoiceSelectionOptionsView init](&v5, "init");
  v3 = v2;
  if (v2)
    -[HomePodVoiceSelectionOptionsView _setupVoicesTableView](v2, "_setupVoicesTableView");
  return v3;
}

- (void)_setupVoicesTableView
{
  UITableView *v3;
  UITableView *voicesTableView;
  UITableViewDiffableDataSource *v5;
  UITableViewDiffableDataSource *tableViewDataSource;
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
  _QWORD v22[4];

  v3 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  voicesTableView = self->_voicesTableView;
  self->_voicesTableView = v3;

  v5 = (UITableViewDiffableDataSource *)objc_claimAutoreleasedReturnValue(-[HomePodVoiceSelectionOptionsView _diffableTableDataSource](self, "_diffableTableDataSource"));
  tableViewDataSource = self->_tableViewDataSource;
  self->_tableViewDataSource = v5;

  -[UITableViewDiffableDataSource setDefaultRowAnimation:](self->_tableViewDataSource, "setDefaultRowAnimation:", 0);
  -[UITableView setDelegate:](self->_voicesTableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_voicesTableView, "setDataSource:", self->_tableViewDataSource);
  -[UITableView setShowsHorizontalScrollIndicator:](self->_voicesTableView, "setShowsHorizontalScrollIndicator:", 0);
  -[UITableView setShowsVerticalScrollIndicator:](self->_voicesTableView, "setShowsVerticalScrollIndicator:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  -[UITableView setBackgroundColor:](self->_voicesTableView, "setBackgroundColor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView layer](self->_voicesTableView, "layer"));
  objc_msgSend(v8, "setCornerRadius:", 8.0);

  -[UITableView registerClass:forCellReuseIdentifier:](self->_voicesTableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(UITableViewCell), CFSTR("VoiceCell"));
  -[HomePodVoiceSelectionOptionsView addSubview:](self, "addSubview:", self->_voicesTableView);
  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_voicesTableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_voicesTableView, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[HomePodVoiceSelectionOptionsView topAnchor](self, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v22[0] = v19;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leftAnchor](self->_voicesTableView, "leftAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomePodVoiceSelectionOptionsView leftAnchor](self, "leftAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v22[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView rightAnchor](self->_voicesTableView, "rightAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomePodVoiceSelectionOptionsView rightAnchor](self, "rightAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  v22[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_voicesTableView, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HomePodVoiceSelectionOptionsView bottomAnchor](self, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
  v22[3] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

}

- (id)_diffableTableDataSource
{
  id v3;
  UITableView *voicesTableView;
  id v5;
  _QWORD v7[5];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc((Class)UITableViewDiffableDataSource);
  voicesTableView = self->_voicesTableView;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003F04;
  v7[3] = &unk_1000C14F0;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  v5 = objc_msgSend(v3, "initWithTableView:cellProvider:", voicesTableView, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

- (id)_tableCellForVoiceViewModel:(id)a3 indexPath:(id)a4
{
  UITableView *voicesTableView;
  id v7;
  void *v8;
  CGColor *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  voicesTableView = self->_voicesTableView;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView dequeueReusableCellWithIdentifier:forIndexPath:](voicesTableView, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("VoiceCell"), a4));
  v9 = (CGColor *)objc_msgSend(v7, "associatedCGColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", v9));
  CGColorRelease(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration cellConfiguration](UIListContentConfiguration, "cellConfiguration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedDisplayName"));
  objc_msgSend(v11, "setText:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageProperties"));
  objc_msgSend(v13, "setTintColor:", v10);

  objc_msgSend(v8, "setContentConfiguration:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
  objc_msgSend(v8, "setBackgroundColor:", v14);

  LODWORD(v14) = objc_msgSend(v7, "isCurrentSiriVoice");
  if ((_DWORD)v14)
    v15 = 3;
  else
    v15 = 0;
  objc_msgSend(v8, "setAccessoryType:", v15);
  objc_msgSend(v8, "setSemanticContentAttribute:", -[UITableView semanticContentAttribute](self->_voicesTableView, "semanticContentAttribute"));

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v5 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[HomePodVoiceSelectionOptionsView voiceSelectionEventHandler](self, "voiceSelectionEventHandler"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUICVoiceSelectionViewModel voices](self->_viewModel, "voices"));
  v7 = objc_msgSend(v5, "row");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));
  objc_msgSend(v9, "voiceSelectionView:receivedRequestToSelectVoice:", self, v8);

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 45.0;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (void)voiceSelectionViewModelDidChange
{
  void *v3;
  SUICVoiceSelectionViewModel *v4;
  SUICVoiceSelectionViewModel *viewModel;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomePodVoiceSelectionOptionsView voiceSelectionViewModelProvider](self, "voiceSelectionViewModelProvider"));
  v4 = (SUICVoiceSelectionViewModel *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "voiceSelectionViewModel"));
  viewModel = self->_viewModel;
  self->_viewModel = v4;

  -[HomePodVoiceSelectionOptionsView _createAndApplySnapshotForViewModel:](self, "_createAndApplySnapshotForViewModel:", self->_viewModel);
}

- (void)_createAndApplySnapshotForViewModel:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HomePodVoiceSelectionOptionsView *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  void *v23;
  _BYTE v24[128];
  const __CFString *v25;

  v16 = self;
  v3 = a3;
  v4 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  v25 = CFSTR("Voice");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  objc_msgSend(v4, "appendSectionsWithIdentifiers:", v5);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v17 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "voices"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedDisplayName", v16));
        v23 = v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
        objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v13, CFSTR("Voice"));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedDisplayName"));
        v22 = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
        objc_msgSend(v4, "reloadItemsWithIdentifiers:", v15);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v8);
  }

  -[UITableViewDiffableDataSource applySnapshot:animatingDifferences:](v16->_tableViewDataSource, "applySnapshot:animatingDifferences:", v4, 1);
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HomePodVoiceSelectionOptionsView;
  -[HomePodVoiceSelectionOptionsView setSemanticContentAttribute:](&v5, "setSemanticContentAttribute:");
  -[UITableView setSemanticContentAttribute:](self->_voicesTableView, "setSemanticContentAttribute:", a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  width = a3.width;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUICVoiceSelectionViewModel voices](self->_viewModel, "voices", a3.width, a3.height));
  v5 = (float)((float)(unint64_t)objc_msgSend(v4, "count") * 45.0);

  v6 = width;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (SUICVoiceSelectionViewModelProviding)voiceSelectionViewModelProvider
{
  return (SUICVoiceSelectionViewModelProviding *)objc_loadWeakRetained((id *)&self->_voiceSelectionViewModelProvider);
}

- (void)setVoiceSelectionViewModelProvider:(id)a3
{
  objc_storeWeak((id *)&self->_voiceSelectionViewModelProvider, a3);
}

- (SUICVoiceSelectionEventHandling)voiceSelectionEventHandler
{
  return (SUICVoiceSelectionEventHandling *)objc_loadWeakRetained((id *)&self->_voiceSelectionEventHandler);
}

- (void)setVoiceSelectionEventHandler:(id)a3
{
  objc_storeWeak((id *)&self->_voiceSelectionEventHandler, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_voiceSelectionEventHandler);
  objc_destroyWeak((id *)&self->_voiceSelectionViewModelProvider);
  objc_storeStrong((id *)&self->_tableViewDataSource, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_voicesTableView, 0);
}

@end
