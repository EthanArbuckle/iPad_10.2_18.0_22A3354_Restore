@implementation CKAvatarPickerViewController

- (CKAvatarPickerViewController)initWithConversation:(id)a3
{
  id v4;
  CKAvatarPickerViewController *v5;
  CKAvatarPickerViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  v5 = -[CKAvatarPickerViewController init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[CKAvatarPickerViewController setConversation:](v5, "setConversation:", v4);
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarPickerViewController setVisibleTitleViews:](v6, "setVisibleTitleViews:", v7);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarPickerViewController conversation](v6, "conversation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v6, sel__handleConversationRecipientsDidChange_, CFSTR("CKConversationParticipantsDidChangeNotification"), v9);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarPickerViewController conversation](v6, "conversation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v6, sel__handleConversationRecipientsDidChange_, CFSTR("CKConversationJoinStateDidChangeNotification"), v11);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0D352F0];
    -[CKAvatarPickerViewController conversation](v6, "conversation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "chat");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel__handleGroupNameChange_, v13, v15);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v6, sel__handleAddressBookChange_, *MEMORY[0x1E0D373C0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v6, sel__handleAddressBookChange_, *MEMORY[0x1E0D373D0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v6, sel__chatPropertiesChanged_, *MEMORY[0x1E0D35440], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v6, sel__handleConversationIsFilteredChange_, *MEMORY[0x1E0D35320], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v6, sel__chatItemsDidChange_, *MEMORY[0x1E0D35328], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v6, sel_nicknameStoreDidChange_, *MEMORY[0x1E0D355F8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v6, sel__handleKeyTransparencyStatusChangedNotification_, *MEMORY[0x1E0D353E8], 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", 0);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKAvatarPickerViewController;
  -[CKAvatarPickerViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  CKAvatarPickerLayout *v3;
  void *v4;
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
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v3 = -[CKAvatarPickerLayout initWithLayoutMode:]([CKAvatarPickerLayout alloc], "initWithLayoutMode:", -[CKAvatarPickerViewController _preferredAvatarLayoutMode](self, "_preferredAvatarLayoutMode"));
  -[CKAvatarPickerViewController setLayout:](self, "setLayout:", v3);

  -[CKAvatarPickerViewController layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  v5 = objc_alloc(MEMORY[0x1E0CEA410]);
  -[CKAvatarPickerViewController layout](self, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v6, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CKAvatarPickerViewController setCollectionView:](self, "setCollectionView:", v7);

  -[CKAvatarPickerViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setScrollEnabled:", 0);

  -[CKAvatarPickerViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAutoresizingMask:", 18);

  -[CKAvatarPickerViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDataSource:", self);

  -[CKAvatarPickerViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", self);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAvatarPickerViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v12);

  -[CKAvatarPickerViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShowsHorizontalScrollIndicator:", 0);

  -[CKAvatarPickerViewController collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setShowsVerticalScrollIndicator:", 0);

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scale");
  v18 = v17;
  -[CKAvatarPickerViewController collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setRasterizationScale:", v18);

  -[CKAvatarPickerViewController collectionView](self, "collectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setShouldRasterize:", 1);

  -[CKAvatarPickerViewController collectionView](self, "collectionView");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[CKAvatarPickerViewController setView:](self, "setView:", v23);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKAvatarPickerViewController;
  -[CKAvatarPickerViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CKAvatarPickerViewController performAnimationForPhotoUpdate](self, "performAnimationForPhotoUpdate");
}

- (void)updateContentsForConversation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CKAvatarPickerViewController conversation](self, "conversation");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4 != v7)
  {
    -[CKAvatarPickerViewController setConversation:](self, "setConversation:", v7);
    -[CKAvatarPickerViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

    v5 = v7;
  }

}

- (void)setStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_style != a3)
  {
    self->_style = a3;
    -[CKAvatarPickerViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShouldRasterize:", 0);

    -[CKAvatarPickerViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

    -[CKAvatarPickerViewController collectionView](self, "collectionView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShouldRasterize:", 1);

  }
}

- (void)setAvatarPickerActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[CKAvatarPickerViewController titleView](self, "titleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKAvatarPickerViewController titleView](self, "titleView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAvatarPickerActive:", v3);

  }
}

- (void)setIndicatorType:(int64_t)a3
{
  void *v5;
  id v6;

  self->_indicatorType = a3;
  -[CKAvatarPickerViewController titleView](self, "titleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKAvatarPickerViewController titleView](self, "titleView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStatusIndicatorType:", a3);

  }
}

- (void)setTitleView:(id)a3
{
  CKAvatarTitleCollectionReusableView *v5;
  void *v6;
  CKAvatarTitleCollectionReusableView *v7;

  v5 = (CKAvatarTitleCollectionReusableView *)a3;
  if (self->_titleView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_titleView, a3);
    -[CKAvatarPickerViewController titleView](self, "titleView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStatusIndicatorType:", self->_indicatorType);

    v5 = v7;
  }

}

- (void)setLocationLabel:(id)a3
{
  UILabel *v5;
  void *v6;
  void *v7;
  UILabel *v8;

  v5 = (UILabel *)a3;
  if (self->_locationLabel != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_locationLabel, a3);
    -[CKAvatarPickerViewController layout](self, "layout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateLayoutAndCache");

    -[CKAvatarPickerViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadData");

    v5 = v8;
  }

}

- (BOOL)hasTitle
{
  void *v2;
  BOOL v3;

  -[CKAvatarPickerViewController titleView](self, "titleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CGRect)titleViewFrame
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
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
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect result;

  -[CKAvatarPickerViewController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBusinessConversation");

  -[CKAvatarPickerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAvatarPickerViewController layout](self, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleSupplementaryAttr");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  if ((v4 & 1) != 0)
  {
    -[CKAvatarPickerViewController collectionView](self, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "convertRect:toView:", v16, v9, v11, v13, v15);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
  }
  else
  {
    -[CKAvatarPickerViewController groupAvatarViewController](self, "groupAvatarViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "convertRect:toView:", v25, v9, v11, v13, v15);
    v18 = v26;
    v20 = v27;
    v22 = v28;
    v24 = v29;

  }
  v30 = v18;
  v31 = v20;
  v32 = v22;
  v33 = v24;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (void)_animateInTitleView
{
  NSMapTable *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  CATransform3D v16;
  CATransform3D v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CKAvatarPickerViewController visibleTitleViews](self, "visibleTitleViews");
  v2 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  NSAllMapTableValues(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v8, "layer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        titleViewAlphaAnimation(1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addAnimation:forKey:", v10, CFSTR("message-in-opacity-animation"));

        objc_msgSend(v8, "layer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v12) = 1.0;
        objc_msgSend(v11, "setOpacity:", v12);

        objc_msgSend(v8, "layer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        titleViewScaleAnimation(1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addAnimation:forKey:", v14, CFSTR("message-in-scale-animation"));

        CATransform3DMakeScale(&v17, 1.0, 1.0, 1.0);
        objc_msgSend(v8, "layer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v17;
        objc_msgSend(v15, "setTransform:", &v16);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

}

- (void)_animateOutTitleView
{
  NSMapTable *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  CATransform3D v16;
  CATransform3D v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CKAvatarPickerViewController visibleTitleViews](self, "visibleTitleViews");
  v2 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  NSAllMapTableValues(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v8, "layer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        titleViewAlphaAnimation(0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addAnimation:forKey:", v10, CFSTR("message-out-opacity-animation"));

        objc_msgSend(v8, "layer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v12) = 0;
        objc_msgSend(v11, "setOpacity:", v12);

        objc_msgSend(v8, "layer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        titleViewScaleAnimation(0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addAnimation:forKey:", v14, CFSTR("message-out-scale-animation"));

        CATransform3DMakeScale(&v17, 0.5, 0.5, 1.0);
        objc_msgSend(v8, "layer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v17;
        objc_msgSend(v15, "setTransform:", &v16);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

}

- (void)_setTitle:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[CKAvatarPickerViewController titleView](self, "titleView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:animated:", v6, v4);

}

- (BOOL)chatIsReportedAsSpam
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[CKAvatarPickerViewController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForChatProperty:", *MEMORY[0x1E0D359E0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (int)chatWasDetectedAsSMSSpam
{
  void *v2;
  int v3;

  -[CKAvatarPickerViewController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wasDetectedAsSMSSpam");

  return v3;
}

- (void)_chatPropertiesChanged:(id)a3
{
  id v3;

  -[CKAvatarPickerViewController collectionView](self, "collectionView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)updateGroupAvatarView
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  if (self->_groupAvatarViewController)
  {
    -[CKAvatarPickerViewController _groupAvatarViewControllerRequiredContactKeys](self, "_groupAvatarViewControllerRequiredContactKeys");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(MEMORY[0x1E0C974E8], "maxContactAvatars");
    -[CKAvatarPickerViewController conversation](self, "conversation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", v6, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNGroupAvatarViewController groupIdentityDidUpdate:](self->_groupAvatarViewController, "groupIdentityDidUpdate:", v5);
  }
}

- (void)_handleConversationIsFilteredChange:(id)a3
{
  id v3;

  -[CKAvatarPickerViewController collectionView](self, "collectionView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (unint64_t)_preferredAvatarLayoutMode
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[CKAvatarPickerViewController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isBusinessConversation"))
  {
    -[CKAvatarPickerViewController conversation](self, "conversation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isAppleConversation"))
    {

      v5 = 1;
    }
    else
    {
      -[CKAvatarPickerViewController conversation](self, "conversation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "businessHandle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "brandWideLogoImageData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        v5 = 2;
      else
        v5 = 1;
    }
  }
  else
  {
    v5 = 3;
  }

  return v5;
}

- (void)performAnimationForPhotoUpdate
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "Trying to perform animation when view isn't in view hierarchy", v1, 2u);
}

void __62__CKAvatarPickerViewController_performAnimationForPhotoUpdate__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a2 == 1)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v17 = 138412290;
        v18 = v10;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Peekaboo animation played for handle IDs: %@", (uint8_t *)&v17, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0D358A8], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "conversation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recipientStrings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "markTransitionAsObservedForHandleID:isAutoUpdate:", v14, 0);

  }
  else if (a2)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = *(_QWORD *)(a1 + 32);
        v17 = 138412290;
        v18 = v16;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "No animation played for handle IDs: %@", (uint8_t *)&v17, 0xCu);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v4 = *(_QWORD *)(a1 + 32);
        v17 = 138412290;
        v18 = v4;
        _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Coin flip animation played for handle IDs: %@", (uint8_t *)&v17, 0xCu);
      }

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1000), "sharedProfileStateOracle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1000), "sharedProfileStateOracle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v7, "updateContactAndNicknamesForAutoUpdateWithError:", 0);

    }
  }
}

- (void)_handleConversationRecipientsDidChange:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v4 = -[CKAvatarPickerViewController _preferredAvatarLayoutMode](self, "_preferredAvatarLayoutMode", a3);
  -[CKAvatarPickerViewController layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutMode:", v4);

  -[CKAvatarPickerViewController layout](self, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateLayoutAndCache");

  -[CKAvatarPickerViewController sendUpdatedRecentParticipantsToContacts](self, "sendUpdatedRecentParticipantsToContacts");
  -[CKAvatarPickerViewController collectionView](self, "collectionView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

}

- (void)_chatItemsDidChange:(id)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;

  v18 = a3;
  v4 = -[CKAvatarTitleCollectionReusableView avatarTitleAccessoryImageType](self->_titleView, "avatarTitleAccessoryImageType");
  if (v4 != -[CKAvatarPickerViewController avatarTitleAccessoryImageType](self, "avatarTitleAccessoryImageType"))
  {
    -[CKAvatarPickerViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadData");

  }
  -[CKAvatarPickerViewController conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isGroupConversation");

  if (v7)
  {
    objc_msgSend(v18, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(v8, "valueForKey:", *MEMORY[0x1E0D35330]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "count"))
    {
LABEL_14:

      goto LABEL_15;
    }
    -[CKAvatarPickerViewController conversation](self, "conversation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "chat");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "chatItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_opt_class();
    if ((objc_msgSend(v15, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
    {
      LOBYTE(v16) = 0;
      if (!v14)
        goto LABEL_13;
    }
    else
    {
      v17 = (void *)objc_opt_class();
      v16 = objc_msgSend(v17, "isSubclassOfClass:", objc_opt_class()) ^ 1;
      if (!v14)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    if ((v16 & 1) == 0 && (objc_msgSend(v14, "isFromMe") & 1) == 0)
      -[CKAvatarPickerViewController sendUpdatedRecentParticipantsToContacts](self, "sendUpdatedRecentParticipantsToContacts");
    goto LABEL_13;
  }
LABEL_16:

}

- (void)sendUpdatedRecentParticipantsToContacts
{
  void *v3;
  void *v4;
  id v5;

  -[CKAvatarPickerViewController conversation](self, "conversation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CKAvatarPickerViewController _groupAvatarViewControllerRequiredContactKeys](self, "_groupAvatarViewControllerRequiredContactKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsUpdatedContactOrderForVisualIdentity");
  objc_msgSend(v5, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", v3, objc_msgSend(MEMORY[0x1E0C97468], "maxContactAvatars"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupAvatarViewController groupIdentityDidUpdate:](self->_groupAvatarViewController, "groupIdentityDidUpdate:", v4);

}

- (void)_handleGroupNameChange:(id)a3
{
  id v3;

  -[CKAvatarPickerViewController collectionView](self, "collectionView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)_handleAddressBookChange:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  v4 = -[CKAvatarPickerViewController _preferredAvatarLayoutMode](self, "_preferredAvatarLayoutMode", a3);
  v5 = v4;
  if (v4 < 3)
    goto LABEL_2;
  if (v4 == 3)
  {
    -[CKAvatarPickerViewController titleView](self, "titleView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarPickerViewController avatarDisplayName](self, "avatarDisplayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if ((v12 & 1) == 0)
    {
LABEL_2:
      -[CKAvatarPickerViewController layout](self, "layout");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLayoutMode:", v5);

      -[CKAvatarPickerViewController layout](self, "layout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "invalidateLayoutAndCache");

      -[CKAvatarPickerViewController collectionView](self, "collectionView");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "reloadData");

    }
  }
}

- (void)_handleKeyTransparencyStatusChangedNotification:(id)a3
{
  id v3;

  -[CKAvatarPickerViewController collectionView](self, "collectionView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (BOOL)avatarPickerLayoutShouldShowTitle:(id)a3
{
  return 1;
}

- (double)avatarPickerLayoutTitleViewHeight
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[CKAvatarPickerViewController titleView](self, "titleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0.0;
  -[CKAvatarPickerViewController titleView](self, "titleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAvatarPickerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "sizeThatFits:", v6, v7);
  v9 = v8;

  return v9;
}

- (id)presentingViewControllerForAvatarView:(id)a3
{
  return 0;
}

- (id)avatarView:(id)a3 orderedPropertiesForProperties:(id)a4 category:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v26;
  uint64_t v27;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v7 = a4;
  if (objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E0C97420]))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v26 = v7;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v31;
      v12 = *MEMORY[0x1E0C966A8];
      v27 = *MEMORY[0x1E0C967C0];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v14, "key", v26);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v12);

          if (v16)
          {
            objc_msgSend(v14, "value");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v14, "key");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqualToString:", v27);

            if (v19)
            {
              objc_msgSend(v14, "value");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "stringValue");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v17 = 0;
            }
          }
          IMStripFormattingFromAddress();
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "preferredHandle");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          IMStripFormattingFromAddress();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = MEMORY[0x193FF417C](v21, v23);

          if (v24)
            objc_msgSend(v8, "insertObject:atIndex:", v14, 0);
          else
            objc_msgSend(v8, "addObject:", v14);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v10);
    }

    v7 = v26;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int64_t v9;
  int64_t result;

  -[CKAvatarPickerViewController layout](self, "layout", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "layoutMode");

  switch(v6)
  {
    case 0:
    case 2:
      -[CKAvatarPickerViewController conversation](self, "conversation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "recipients");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      result = v9;
      break;
    case 1:
    case 3:
      result = 1;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a4;
  v8 = a5;
  +[CKAvatarTitleCollectionReusableView supplementaryViewKind](CKAvatarTitleCollectionReusableView, "supplementaryViewKind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  if (v10)
  {
    -[CKAvatarPickerViewController _titleSupplementaryViewAtIndexPath:](self, "_titleSupplementaryViewAtIndexPath:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[_CKAvatarCutoutSupplementaryView supplementaryViewKind](_CKAvatarCutoutSupplementaryView, "supplementaryViewKind");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v7, "isEqualToString:", v12);

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** %s: Unexpected supplementary element kind %@"), "-[CKAvatarPickerViewController collectionView:viewForSupplementaryElementOfKind:atIndexPath:]", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "raise");

      v14 = 0;
      goto LABEL_7;
    }
    -[CKAvatarPickerViewController _cutoutSupplementaryViewAtIndexPath:](self, "_cutoutSupplementaryViewAtIndexPath:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v11;
LABEL_7:

  return v14;
}

- (id)_titleSupplementaryViewAtIndexPath:(id)a3
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
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v4 = a3;
  +[CKAvatarTitleCollectionReusableView reuseIdentifier](CKAvatarTitleCollectionReusableView, "reuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAvatarTitleCollectionReusableView supplementaryViewKind](CKAvatarTitleCollectionReusableView, "supplementaryViewKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAvatarPickerViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), v6, v5);

  -[CKAvatarPickerViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v6, v5, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setDelegate:", self);
  -[CKAvatarPickerViewController setTitleView:](self, "setTitleView:", v9);
  -[CKAvatarPickerViewController locationLabel](self, "locationLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocationLabel:", v10);

  -[CKAvatarPickerViewController visibleTitleViews](self, "visibleTitleViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v9, v4);

  -[CKAvatarPickerViewController avatarDisplayName](self, "avatarDisplayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configureWithTitle:", v12);

  objc_msgSend(v9, "setStyle:", -[CKAvatarPickerViewController style](self, "style"));
  objc_msgSend(v9, "setAvatarTitleAccessoryImageType:", -[CKAvatarPickerViewController avatarTitleAccessoryImageType](self, "avatarTitleAccessoryImageType"));
  objc_msgSend(v9, "setStatusIndicatorType:", -[CKAvatarPickerViewController indicatorType](self, "indicatorType"));
  -[CKAvatarPickerViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setChevronHidden:", objc_msgSend(v13, "hideChevron"));

  -[CKAvatarPickerViewController titleView](self, "titleView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAvatarPickerActive:", objc_msgSend(v14, "isAvatarPickerActive"));

  -[CKAvatarPickerViewController conversation](self, "conversation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWantsOpaqueChevron:", objc_msgSend(v15, "hasVerifiedBusiness"));

  -[CKAvatarPickerViewController conversation](self, "conversation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "chat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isStewieChat");

  if (v18)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "theme");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "conversationListEmergencyColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "titleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTextColor:", v21);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "avatarNameEmergencyFont");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "titleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFont:", v24);

  }
  -[CKAvatarPickerViewController conversation](self, "conversation");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "chat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isStewieSharingChat");

  if (v28)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "theme");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "conversationListEmergencyColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "titleLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTextColor:", v31);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "avatarNameEmergencyFont");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "titleLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFont:", v34);

  }
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel_tappedAvatarPickerViewController);
  objc_msgSend(v9, "titleLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addGestureRecognizer:", v36);

  objc_msgSend(v9, "titleLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setUserInteractionEnabled:", 1);

  objc_msgSend(v9, "titleLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "_setTouchInsets:", -20.0, -20.0, -20.0, -20.0);

  return v9;
}

- (id)avatarDisplayName
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;

  -[CKAvatarPickerViewController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasDisplayName");
  -[CKAvatarPickerViewController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
    objc_msgSend(v5, "displayName");
  else
    objc_msgSend(v5, "displayNameForMediaObjects:subject:shouldListParticipants:", 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CKAvatarPickerViewController chatIsReportedAsSpam](self, "chatIsReportedAsSpam"))
  {
    -[CKAvatarPickerViewController conversation](self, "conversation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "chat");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isFiltered"))
    {

      goto LABEL_12;
    }
    if (!-[CKAvatarPickerViewController chatWasDetectedAsSMSSpam](self, "chatWasDetectedAsSMSSpam"))
    {
LABEL_16:

      return v7;
    }
    v10 = +[CKConversation isSMSSpamFilteringEnabled](CKConversation, "isSMSSpamFilteringEnabled");

    if (!v10)
    {
LABEL_12:
      v11 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("MAYBE_JUNK"), &stru_1E276D870, CFSTR("ChatKit"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v13, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "userInterfaceLayoutDirection");

      if (v15 == 1)
        v16 = CFSTR("\u200F");
      else
        v16 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v16, "stringByAppendingString:", v9);
      v8 = v7;
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
  }
  else if (-[CKAvatarPickerViewController chatWasDetectedAsSMSSpam](self, "chatWasDetectedAsSMSSpam")
         && !+[CKConversation isSMSSpamFilteringEnabled](CKConversation, "isSMSSpamFilteringEnabled"))
  {
    goto LABEL_12;
  }
  return v7;
}

- (id)_cutoutSupplementaryViewAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  +[_CKAvatarCutoutSupplementaryView reuseIdentifier](_CKAvatarCutoutSupplementaryView, "reuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CKAvatarCutoutSupplementaryView supplementaryViewKind](_CKAvatarCutoutSupplementaryView, "supplementaryViewKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAvatarPickerViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), v6, v5);

  -[CKAvatarPickerViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v6, v5, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v6 = a3;
  v7 = a4;
  -[CKAvatarPickerViewController layout](self, "layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "layoutMode");

  if (v9 < 2)
  {
    -[CKAvatarPickerViewController _configureCollectionView:avatarCellForItemAtIndexPath:](self, "_configureCollectionView:avatarCellForItemAtIndexPath:", v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v9 == 3)
  {
    -[CKAvatarPickerViewController _configureCollectionView:groupIdentityCellForItemAtIndexPath:](self, "_configureCollectionView:groupIdentityCellForItemAtIndexPath:", v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v9 == 2)
  {
    -[CKAvatarPickerViewController _configureCollectionView:bannerViewCellForItemAtIndexPath:](self, "_configureCollectionView:bannerViewCellForItemAtIndexPath:", v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v11 = (void *)v10;
    goto LABEL_8;
  }
  v11 = 0;
LABEL_8:
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (CKMainScreenScale_once_61 != -1)
    dispatch_once(&CKMainScreenScale_once_61, &__block_literal_global_154);
  if (*(double *)&CKMainScreenScale_sMainScreenScale_61 == 0.0)
    v20 = 1.0;
  else
    v20 = *(double *)&CKMainScreenScale_sMainScreenScale_61;
  objc_msgSend(v11, "setFrame:", round(v13 * v20) / v20, round(v15 * v20) / v20, round(v17 * v20) / v20, round(v19 * v20) / v20);

  return v11;
}

- (id)_configureCollectionView:(id)a3 bannerViewCellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class();
  +[CKBannerCollectionViewCell reuseIdentifier](CKBannerCollectionViewCell, "reuseIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forCellWithReuseIdentifier:", v8, v9);

  +[CKBannerCollectionViewCell reuseIdentifier](CKBannerCollectionViewCell, "reuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKAvatarPickerViewController conversation](self, "conversation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "recipients");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v6, "item");

  objc_msgSend(v13, "objectAtIndexedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "configureWithEntity:", v15);
  return v11;
}

- (id)_configureCollectionView:(id)a3 avatarCellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  CKEntity *v17;
  CKEntity *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class();
  +[CKAvatarCollectionViewCell reuseIdentifier](CKAvatarCollectionViewCell, "reuseIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forCellWithReuseIdentifier:", v8, v9);

  +[CKAvatarCollectionViewCell reuseIdentifier](CKAvatarCollectionViewCell, "reuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKAvatarPickerViewController conversation](self, "conversation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "recipients");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v6, "item");

  objc_msgSend(v13, "objectAtIndexedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "defaultIMHandle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v16, "isApple");

  if ((_DWORD)v13)
  {
    -[CKAvatarPickerViewController cachedAppleEntity](self, "cachedAppleEntity");
    v17 = (CKEntity *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v18 = [CKEntity alloc];
      objc_msgSend(v15, "defaultIMHandle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[CKEntity initWithIMHandle:](v18, "initWithIMHandle:", v19);

      -[CKEntity setEnlargedContactImage:](v17, "setEnlargedContactImage:", 1);
      -[CKAvatarPickerViewController setCachedAppleEntity:](self, "setCachedAppleEntity:", v17);
    }
    objc_msgSend(v11, "configureWithEntity:", v17);

  }
  else
  {
    objc_msgSend(v11, "configureWithEntity:", v15);
  }
  objc_msgSend(v11, "avatarView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDelegate:", self);
  objc_msgSend(v20, "setShowsContactOnTap:", 0);
  objc_msgSend(v20, "setForcePressView:", v20);
  objc_msgSend(v20, "setUserInteractionEnabled:", 1);
  -[CKAvatarPickerViewController conversation](self, "conversation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "shouldHaveRoundRectAvatar");

  objc_msgSend(v20, "setStyle:", v22);
  return v11;
}

- (id)_groupAvatarViewControllerRequiredContactKeys
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C974E8], "descriptorForRequiredKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_configureCollectionView:(id)a3 groupIdentityCellForItemAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CNGroupAvatarViewController *groupAvatarViewController;
  int v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  CNGroupAvatarViewController *v23;
  CNGroupAvatarViewController *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  id v29;
  id v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v30 = a4;
  -[CKAvatarPickerViewController conversation](self, "conversation");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAvatarPickerViewController _groupAvatarViewControllerRequiredContactKeys](self, "_groupAvatarViewControllerRequiredContactKeys");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", v31, objc_msgSend(MEMORY[0x1E0C974E8], "maxContactAvatars"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAvatarPickerViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  +[CKGroupCollectionViewCell reuseIdentifier](CKGroupCollectionViewCell, "reuseIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forCellWithReuseIdentifier:", v8, v9);

  -[CKAvatarPickerViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKGroupCollectionViewCell reuseIdentifier](CKGroupCollectionViewCell, "reuseIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v30);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  groupAvatarViewController = self->_groupAvatarViewController;
  v14 = IMOSLoggingEnabled();
  if (groupAvatarViewController)
  {
    if (v14)
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "GroupAvatarViewController is not nil. We should just update the identity.", buf, 2u);
      }

    }
  }
  else
  {
    if (v14)
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "GroupAvatarViewController is nil. Creating a new one.", buf, 2u);
      }

    }
    v23 = (CNGroupAvatarViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0C974E8]), "initWithGroup:", v6, v29);
    v24 = self->_groupAvatarViewController;
    self->_groupAvatarViewController = v23;

  }
  if (v12)
  {
    -[CNGroupAvatarViewController view](self->_groupAvatarViewController, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAvatarView:", v16);

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v12, "recursiveDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "superview");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "recursiveDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "subviews");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v34 = v18;
        v35 = 2112;
        v36 = v20;
        v37 = 2112;
        v38 = v21;
        _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Setting content view for groupCollectionViewCell:%@ ; superview:%@ ; subviews:%@",
          buf,
          0x20u);

      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "groupCollectionViewCell is nil.", buf, 2u);
    }

  }
  if (groupAvatarViewController)
    -[CNGroupAvatarViewController groupIdentityDidUpdate:](self->_groupAvatarViewController, "groupIdentityDidUpdate:", v6);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v12, "subviews");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v27;
      _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "Returning cell subview = %@", buf, 0xCu);

    }
  }

  return v12;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char isKindOfClass;

  v5 = a4;
  -[CKAvatarPickerViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else if (-[CKConversation isBusinessConversation](self->_conversation, "isBusinessConversation"))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  void *v5;
  uint64_t v6;

  -[CKAvatarPickerViewController layout](self, "layout", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "layoutMode");

  if (v6 == 3)
    -[CKAvatarPickerViewController beganTouchingAvatarView](self, "beganTouchingAvatarView");
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  void *v5;
  uint64_t v6;

  -[CKAvatarPickerViewController layout](self, "layout", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "layoutMode");

  if (v6 == 3)
    -[CKAvatarPickerViewController endedTouchingAvatarView](self, "endedTouchingAvatarView");
}

- (BOOL)avatarWantsTapAtPoint:(CGPoint)a3 fromView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGPoint v16;
  CGRect v17;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[CKAvatarPickerViewController groupAvatarViewController](self, "groupAvatarViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKAvatarPickerViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertPoint:toView:", v10, x, y);
  v12 = v11;
  v14 = v13;

  objc_msgSend(v9, "frame");
  v16.x = v12;
  v16.y = v14;
  LOBYTE(v10) = CGRectContainsPoint(v17, v16);

  return (char)v10;
}

- (BOOL)shouldBeginTouchingAvatarView
{
  void *v3;
  void *v4;
  char v5;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;

  -[CKAvatarPickerViewController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isStewieChat");

  if ((v5 & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isTranscriptSharingEnabled");

  if (v8)
  {
    -[CKAvatarPickerViewController conversation](self, "conversation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "chat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isStewieSharingChat");

    if ((v11 & 1) != 0)
      return 0;
  }
  if (IMIsOscarEnabled()
    && (+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        -[CKAvatarPickerViewController conversation](self, "conversation"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v12, "primaryFilterModeForConversation:", v13),
        v13,
        v12,
        v14 == 9))
  {
    return 0;
  }
  else
  {
    return 1;
  }
}

- (void)beganTouchingAvatarView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  CKAvatarPickerViewController *v9;

  if (-[CKAvatarPickerViewController shouldBeginTouchingAvatarView](self, "shouldBeginTouchingAvatarView"))
  {
    -[CKAvatarPickerViewController collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cellForItemAtIndexPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void *)MEMORY[0x1E0CEABB0];
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __55__CKAvatarPickerViewController_beganTouchingAvatarView__block_invoke;
      v7[3] = &unk_1E274A108;
      v8 = v5;
      v9 = self;
      objc_msgSend(v6, "animateWithDuration:animations:", v7, 0.3);

    }
  }
}

void __55__CKAvatarPickerViewController_beganTouchingAvatarView__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "avatarView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.3);

  objc_msgSend(*(id *)(a1 + 40), "titleView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.3);

}

- (void)endedTouchingAvatarView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  CKAvatarPickerViewController *v9;

  -[CKAvatarPickerViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellForItemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0CEABB0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__CKAvatarPickerViewController_endedTouchingAvatarView__block_invoke;
    v7[3] = &unk_1E274A108;
    v8 = v5;
    v9 = self;
    objc_msgSend(v6, "animateWithDuration:animations:", v7, 0.3);

  }
}

void __55__CKAvatarPickerViewController_endedTouchingAvatarView__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "avatarView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 40), "titleView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

- (void)tappedAvatarPickerViewController
{
  void *v3;

  -[CKAvatarPickerViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tappedAvatarPickerViewController");

  -[CKAvatarPickerViewController endedTouchingAvatarView](self, "endedTouchingAvatarView");
}

- (int64_t)avatarTitleAccessoryImageType
{
  void *v3;
  char v4;
  void *v6;
  char v7;
  void *v8;
  int v9;

  -[CKAvatarPickerViewController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasVerifiedBusiness");

  if ((v4 & 1) != 0)
    return 1;
  -[CKAvatarPickerViewController conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isStewieConversation");

  if ((v7 & 1) != 0)
    return 4;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isKeyTransparencyEnabled");

  if (v9 && IMIsEnrolledInContactKeyVerification())
    return -[CKAvatarPickerViewController _KTAvatarTitleAccessoryImageType](self, "_KTAvatarTitleAccessoryImageType");
  else
    return 0;
}

- (int64_t)_KTAvatarTitleAccessoryImageType
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v10;

  -[CKAvatarPickerViewController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendingService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsCapability:", *MEMORY[0x1E0D38E20]);

  if (!v5)
    return 0;
  -[CKAvatarPickerViewController conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v8 = objc_msgSend(v7, "keyTransparencyStatusForAffectedHandles:", &v10);

  if (v8 > 0xE)
    return 2;
  else
    return qword_18E7CB3A0[v8];
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (CKAvatarTitleCollectionReusableView)titleView
{
  return self->_titleView;
}

- (int64_t)indicatorType
{
  return self->_indicatorType;
}

- (CKAvatarPickerViewControllerDelegate)delegate
{
  return (CKAvatarPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNGroupAvatarViewController)groupAvatarViewController
{
  return self->_groupAvatarViewController;
}

- (void)setGroupAvatarViewController:(id)a3
{
  objc_storeStrong((id *)&self->_groupAvatarViewController, a3);
}

- (CKAvatarPickerLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (CNContactStore)suggestionsEnabledContactStore
{
  return self->_suggestionsEnabledContactStore;
}

- (void)setSuggestionsEnabledContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsEnabledContactStore, a3);
}

- (NSMapTable)visibleTitleViews
{
  return self->_visibleTitleViews;
}

- (void)setVisibleTitleViews:(id)a3
{
  objc_storeStrong((id *)&self->_visibleTitleViews, a3);
}

- (CKEntity)cachedAppleEntity
{
  return self->_cachedAppleEntity;
}

- (void)setCachedAppleEntity:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAppleEntity, a3);
}

- (UILabel)locationLabel
{
  return self->_locationLabel;
}

- (NSObject)sharedProfileStateOracle
{
  return self->_sharedProfileStateOracle;
}

- (void)setSharedProfileStateOracle:(id)a3
{
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_cachedAppleEntity, 0);
  objc_storeStrong((id *)&self->_visibleTitleViews, 0);
  objc_storeStrong((id *)&self->_suggestionsEnabledContactStore, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_groupAvatarViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
