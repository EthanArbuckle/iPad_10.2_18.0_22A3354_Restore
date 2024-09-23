@implementation CKGroupAcknowledgmentVotingViewController

- (CKGroupAcknowledgmentVotingViewController)initWithMessagePartChatItem:(id)a3
{
  id v4;
  CKGroupAcknowledgmentVotingViewController *v5;
  CKGroupAcknowledgmentVotingViewController *v6;

  v4 = a3;
  v5 = -[CKGroupAcknowledgmentVotingViewController init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[CKGroupAcknowledgmentVotingViewController setChatItem:](v5, "setChatItem:", v4);
    -[CKGroupAcknowledgmentVotingViewController _setupTallies](v6, "_setupTallies");
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", 0);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", 0);
  -[CKAcknowledgmentVotingViewAnimator setDelegate:](self->_animator, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CKGroupAcknowledgmentVotingViewController;
  -[CKGroupAcknowledgmentVotingViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CKGroupAcknowledgmentVotingLayout *v7;
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
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _QWORD v35[6];
  _QWORD v36[5];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _QWORD v43[5];
  id v44;
  objc_super v45;

  v45.receiver = self;
  v45.super_class = (Class)CKGroupAcknowledgmentVotingViewController;
  -[CKGroupAcknowledgmentVotingViewController viewDidLoad](&v45, sel_viewDidLoad);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "theme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageAcknowledgmentPickerBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKGroupAcknowledgmentVotingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = objc_alloc_init(CKGroupAcknowledgmentVotingLayout);
  -[CKGroupAcknowledgmentVotingViewController setLayout:](self, "setLayout:", v7);

  v8 = objc_alloc(MEMORY[0x1E0CEA410]);
  -[CKGroupAcknowledgmentVotingViewController layout](self, "layout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithFrame:collectionViewLayout:", v9, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CKGroupAcknowledgmentVotingViewController setCollectionView:](self, "setCollectionView:", v10);

  -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAutoresizingMask:", 18);

  -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", self);

  -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDataSource:", self);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "theme");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "messageAcknowledgmentPickerBackgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundColor:", v16);

  -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setShowsVerticalScrollIndicator:", 0);

  -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setShowsHorizontalScrollIndicator:", 1);

  -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAccessibilityIdentifier:", CFSTR("GroupAcknowledgementPollingBar"));

  if (CKMainScreenScale_once_15 != -1)
    dispatch_once(&CKMainScreenScale_once_15, &__block_literal_global_364);
  v21 = *(double *)&CKMainScreenScale_sMainScreenScale_15;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_15 == 0.0)
    v21 = 1.0;
  v22 = round(v21 * 12.5) / v21;
  -[CKGroupAcknowledgmentVotingViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCornerRadius:", v22);

  -[CKGroupAcknowledgmentVotingViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setClipsToBounds:", 1);

  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel_tapGestureRecognized_);
  -[CKGroupAcknowledgmentVotingViewController setTapGestureRecognizer:](self, "setTapGestureRecognizer:", v26);

  -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKGroupAcknowledgmentVotingViewController tapGestureRecognizer](self, "tapGestureRecognizer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addGestureRecognizer:", v28);

  -[CKGroupAcknowledgmentVotingViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSubview:", v30);

  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__14;
  v43[4] = __Block_byref_object_dispose__14;
  v44 = 0;
  v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__14;
  v41 = __Block_byref_object_dispose__14;
  v42 = 0;
  v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CKGroupAcknowledgmentVotingViewController tallies](self, "tallies");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __56__CKGroupAcknowledgmentVotingViewController_viewDidLoad__block_invoke;
  v36[3] = &unk_1E274DC40;
  v36[4] = v43;
  objc_msgSend(v31, "enumerateObjectsUsingBlock:", v36);

  -[CKGroupAcknowledgmentVotingViewController chatItem](self, "chatItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "acknowledgments");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v32;
  v35[1] = 3221225472;
  v35[2] = __56__CKGroupAcknowledgmentVotingViewController_viewDidLoad__block_invoke_2;
  v35[3] = &unk_1E274DC90;
  v35[4] = v43;
  v35[5] = &v37;
  objc_msgSend(v34, "enumerateObjectsWithOptions:usingBlock:", 2, v35);

  -[CKGroupAcknowledgmentVotingViewController setSortedAnimatorModelItems:](self, "setSortedAnimatorModelItems:", v38[5]);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(v43, 8);
}

void __56__CKGroupAcknowledgmentVotingViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _CKAcknowledgmentAnimatorModelItem *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a2;
  objc_msgSend(v5, "contacts");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(_CKAcknowledgmentAnimatorModelItem);
  objc_msgSend(v10, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CKAcknowledgmentAnimatorModelItem setEntity:](v6, "setEntity:", v7);

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CKAcknowledgmentAnimatorModelItem setIndexPath:](v6, "setIndexPath:", v8);

  v9 = objc_msgSend(v5, "type");
  -[_CKAcknowledgmentAnimatorModelItem setAcknowledgmentType:](v6, "setAcknowledgmentType:", v9);
  -[_CKAcknowledgmentAnimatorModelItem setAckVoteCount:](v6, "setAckVoteCount:", objc_msgSend(v10, "count"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v6);

}

void __56__CKGroupAcknowledgmentVotingViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v3 = a2;
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__CKGroupAcknowledgmentVotingViewController_viewDidLoad__block_invoke_3;
  v10[3] = &unk_1E274DC68;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = v7;
  v13 = &v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  if (*((_BYTE *)v15 + 24))
  {
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v9);

  }
  _Block_object_dispose(&v14, 8);

}

void __56__CKGroupAcknowledgmentVotingViewController_viewDidLoad__block_invoke_3(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultIMHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", a1[4]);

  if (v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", v9);
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

}

- (UIButton)collapseButton
{
  UIButton *collapseButton;
  UIButton *v4;
  UIButton *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  collapseButton = self->_collapseButton;
  if (!collapseButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_collapseButton;
    self->_collapseButton = v4;

    objc_msgSend(MEMORY[0x1E0CEA638], "ckTemplateImageNamed:", CFSTR("Polling-Collapse-CancelX"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](self->_collapseButton, "setImage:forState:", v6, 0);
    -[UIButton addTarget:action:forEvents:](self->_collapseButton, "addTarget:action:forEvents:", self, sel__handleCollapseButton_, 64);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "theme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageAcknowledgment:acknowledgmentImageColor:", 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton imageView](self->_collapseButton, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTintColor:", v9);

    -[CKGroupAcknowledgmentVotingViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", self->_collapseButton);

    -[UIButton setHidden:](self->_collapseButton, "setHidden:", 1);
    collapseButton = self->_collapseButton;
  }
  return collapseButton;
}

- (_CKAcknowledgmentVoteCountView)currentlyExpandedVoteCountView
{
  _CKAcknowledgmentVoteCountView *currentlyExpandedVoteCountView;
  _CKAcknowledgmentVoteCountView *v4;
  _CKAcknowledgmentVoteCountView *v5;
  _CKAcknowledgmentVoteCountView *v6;
  void *v7;

  currentlyExpandedVoteCountView = self->_currentlyExpandedVoteCountView;
  if (!currentlyExpandedVoteCountView)
  {
    v4 = [_CKAcknowledgmentVoteCountView alloc];
    v5 = -[_CKAcknowledgmentVoteCountView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_currentlyExpandedVoteCountView;
    self->_currentlyExpandedVoteCountView = v5;

    -[CKGroupAcknowledgmentVotingViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_currentlyExpandedVoteCountView);

    -[_CKAcknowledgmentVoteCountView setHidden:](self->_currentlyExpandedVoteCountView, "setHidden:", 1);
    currentlyExpandedVoteCountView = self->_currentlyExpandedVoteCountView;
  }
  return currentlyExpandedVoteCountView;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double x;
  double y;
  double width;
  double height;
  void *v8;
  void *v9;
  objc_super v10;
  CGRect v11;
  CGRect v12;

  v10.receiver = self;
  v10.super_class = (Class)CKGroupAcknowledgmentVotingViewController;
  -[CKGroupAcknowledgmentVotingViewController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  -[CKGroupAcknowledgmentVotingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v12 = CGRectInset(v11, 44.0, 0.0);
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrame:", x, y, width, height);

  -[CKGroupAcknowledgmentVotingViewController layout](self, "layout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidateLayout");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKGroupAcknowledgmentVotingViewController;
  -[CKGroupAcknowledgmentVotingViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  CKAcknowledgmentVotingViewAnimator *v4;
  void *v5;
  void *v6;
  CKAcknowledgmentVotingViewAnimator *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CKGroupAcknowledgmentVotingViewController;
  -[CKGroupAcknowledgmentVotingViewController viewDidAppear:](&v18, sel_viewDidAppear_, a3);
  v4 = [CKAcknowledgmentVotingViewAnimator alloc];
  -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKGroupAcknowledgmentVotingViewController sortedAnimatorModelItems](self, "sortedAnimatorModelItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CKAcknowledgmentVotingViewAnimator initWithCollectionView:animatorModelItems:acknowledgmentTypes:](v4, "initWithCollectionView:animatorModelItems:acknowledgmentTypes:", v5, v6, 0);
  -[CKGroupAcknowledgmentVotingViewController setAnimator:](self, "setAnimator:", v7);

  -[CKGroupAcknowledgmentVotingViewController animator](self, "animator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "animationContainerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInteractionEnabled:", 0);

  -[CKGroupAcknowledgmentVotingViewController animator](self, "animator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  -[CKGroupAcknowledgmentVotingViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKGroupAcknowledgmentVotingViewController animator](self, "animator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "animationContainerView");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v13);

  -[CKGroupAcknowledgmentVotingViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v13) = objc_opt_isKindOfClass();

  if ((v13 & 1) != 0)
    v16 = 0.1;
  else
    v16 = 0.2;
  -[CKGroupAcknowledgmentVotingViewController animator](self, "animator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "startAnimationWithDelay:", v16);

}

- (void)acknowledgmentVotingViewAnimatorDidFinishAnimation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  _QWORD block[5];

  -[CKGroupAcknowledgmentVotingViewController animator](self, "animator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "animationContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 1);

  -[CKGroupAcknowledgmentVotingViewController animator](self, "animator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  -[CKGroupAcknowledgmentVotingViewController setAnimator:](self, "setAnimator:", 0);
  -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 0);

  -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentSize");
  v11 = v10;

  -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;

  if (v11 >= v14)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__CKGroupAcknowledgmentVotingViewController_acknowledgmentVotingViewAnimatorDidFinishAnimation___block_invoke;
    block[3] = &unk_1E274A208;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __96__CKGroupAcknowledgmentVotingViewController_acknowledgmentVotingViewAnimatorDidFinishAnimation___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "flashScrollIndicators");

}

- (void)_setupTallies
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t j;
  void *v16;
  void *v17;
  _CKAcknowledgmentTally *v18;
  void *v19;
  void *v20;
  _CKAcknowledgmentTally *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[CKGroupAcknowledgmentVotingViewController chatItem](self, "chatItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "acknowledgments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10, "associatedMessageType", v22));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v11);
        }
        objc_msgSend(v10, "sender");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v12, "addObject:", v13);
        }
        else if (_IMWillLog())
        {
          v22 = v10;
          _IMAlwaysLog();
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (j = 2000; j != 2006; ++j)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", j, v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = [_CKAcknowledgmentTally alloc];
      objc_msgSend(v17, "reverseObjectEnumerator");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "allObjects");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[_CKAcknowledgmentTally initWithType:senders:](v18, "initWithType:senders:", j, v20);
      objc_msgSend(v14, "addObject:", v21);

    }
  }
  -[CKGroupAcknowledgmentVotingViewController setTallies:](self, "setTallies:", v14);

}

- (void)_layoutCollapseButton
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  void *v22;
  void *v23;
  double Width;
  double v25;
  void *v26;
  id v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  -[CKGroupAcknowledgmentVotingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKGroupAcknowledgmentVotingViewController collapseButton](self, "collapseButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;

  v28.origin.x = v5;
  v28.origin.y = v7;
  v28.size.width = v9;
  v28.size.height = v11;
  v17 = CGRectGetWidth(v28) + -14.0;
  v29.origin.x = v14;
  v29.origin.y = v16;
  v29.size.width = 44.0;
  v29.size.height = 44.0;
  v18 = v17 - CGRectGetWidth(v29);
  v30.origin.x = v5;
  v30.origin.y = v7;
  v30.size.width = v9;
  v30.size.height = v11;
  v19 = CGRectGetHeight(v30) * 0.5;
  v31.origin.x = v18;
  v31.origin.y = v16;
  v31.size.width = 44.0;
  v31.size.height = 44.0;
  v20 = v19 - CGRectGetHeight(v31) * 0.5;
  -[CKGroupAcknowledgmentVotingViewController collapseButton](self, "collapseButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v18, v20, 44.0, 44.0);

  -[CKGroupAcknowledgmentVotingViewController collapseButton](self, "collapseButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "imageView");
  v27 = (id)objc_claimAutoreleasedReturnValue();

  -[CKGroupAcknowledgmentVotingViewController collapseButton](self, "collapseButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  Width = CGRectGetWidth(v32);
  objc_msgSend(v27, "bounds");
  v25 = Width - CGRectGetWidth(v33);

  -[CKGroupAcknowledgmentVotingViewController collapseButton](self, "collapseButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setImageEdgeInsets:", 0.0, v25 * 0.5, 0.0, 0.0);

}

- (void)_layoutCurrentlyExpandedVoteCountView
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  id v21;
  CGRect v22;
  CGRect v23;

  -[CKGroupAcknowledgmentVotingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKGroupAcknowledgmentVotingViewController currentlyExpandedVoteCountView](self, "currentlyExpandedVoteCountView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v22.origin.x = v5;
  v22.origin.y = v7;
  v22.size.width = v9;
  v22.size.height = v11;
  v19 = CGRectGetHeight(v22) * 0.5;
  v23.origin.x = 14.0;
  v23.origin.y = v14;
  v23.size.width = v16;
  v23.size.height = v18;
  v20 = v19 - CGRectGetHeight(v23) * 0.5;
  -[CKGroupAcknowledgmentVotingViewController currentlyExpandedVoteCountView](self, "currentlyExpandedVoteCountView");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", 14.0, v20, v16, v18);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  int64_t v4;

  -[CKGroupAcknowledgmentVotingViewController tallies](self, "tallies", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[CKGroupAcknowledgmentVotingViewController tallies](self, "tallies", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "contacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v5 = a4;
  -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  +[CKAvatarCollectionViewCell reuseIdentifier](CKAvatarCollectionViewCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", v7, v8);

  -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAvatarCollectionViewCell reuseIdentifier](CKAvatarCollectionViewCell, "reuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKGroupAcknowledgmentVotingViewController tallies](self, "tallies");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v5, "section"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "contacts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v5, "item");

  objc_msgSend(v14, "objectAtIndex:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "configureWithEntity:", v16);
  return v11;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  void *v19;

  v8 = a4;
  v9 = a5;
  +[CKAvatarContactNameCollectionReusableView supplementaryViewKind](CKAvatarContactNameCollectionReusableView, "supplementaryViewKind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToString:", v10);

  if (v11)
  {
    -[CKGroupAcknowledgmentVotingViewController _contactNameSupplementaryViewAtIndexPath:](self, "_contactNameSupplementaryViewAtIndexPath:", v9);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CKAcknowledgmentIconCollectionReusableView supplementaryViewKind](CKAcknowledgmentIconCollectionReusableView, "supplementaryViewKind");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v8, "isEqualToString:", v13);

    if (v14)
    {
      -[CKGroupAcknowledgmentVotingViewController _ackIconSupplementaryViewAtIndexPath:](self, "_ackIconSupplementaryViewAtIndexPath:", v9);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[CKAcknowledgmentVoteCountCollectionReusableView supplementaryViewKind](CKAcknowledgmentVoteCountCollectionReusableView, "supplementaryViewKind");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v8, "isEqualToString:", v15);

      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKGroupAcknowledgmentVotingViewController.m"), 372, CFSTR("Trying to use a non-supported supplementaryView"));

        v17 = 0;
        goto LABEL_8;
      }
      -[CKGroupAcknowledgmentVotingViewController _voteCountSupplementaryViewAtIndexPath:](self, "_voteCountSupplementaryViewAtIndexPath:", v9);
      v12 = objc_claimAutoreleasedReturnValue();
    }
  }
  v17 = (void *)v12;
LABEL_8:

  return v17;
}

- (id)_contactNameSupplementaryViewAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v4 = a3;
  -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  +[CKAvatarContactNameCollectionReusableView supplementaryViewKind](CKAvatarContactNameCollectionReusableView, "supplementaryViewKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAvatarContactNameCollectionReusableView reuseIdentifier](CKAvatarContactNameCollectionReusableView, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v6, v7, v8);

  -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAvatarContactNameCollectionReusableView supplementaryViewKind](CKAvatarContactNameCollectionReusableView, "supplementaryViewKind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAvatarContactNameCollectionReusableView reuseIdentifier](CKAvatarContactNameCollectionReusableView, "reuseIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, v11, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setShouldDisplayTitle:", 1);
  -[CKGroupAcknowledgmentVotingViewController tallies](self, "tallies");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v4, "section"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "contacts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v4, "item");

  objc_msgSend(v15, "objectAtIndex:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "configureWithEntity:", v17);
  return v12;
}

- (id)_ackIconSupplementaryViewAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  +[CKAcknowledgmentIconCollectionReusableView supplementaryViewKind](CKAcknowledgmentIconCollectionReusableView, "supplementaryViewKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAcknowledgmentIconCollectionReusableView reuseIdentifier](CKAcknowledgmentIconCollectionReusableView, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v6, v7, v8);

  -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAcknowledgmentIconCollectionReusableView supplementaryViewKind](CKAcknowledgmentIconCollectionReusableView, "supplementaryViewKind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAcknowledgmentIconCollectionReusableView reuseIdentifier](CKAcknowledgmentIconCollectionReusableView, "reuseIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, v11, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKGroupAcknowledgmentVotingViewController tallies](self, "tallies");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "section");

  objc_msgSend(v13, "objectAtIndex:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "configureWithAcknowledgmentTally:", v15);
  return v12;
}

- (id)_voteCountSupplementaryViewAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  +[CKAcknowledgmentVoteCountCollectionReusableView supplementaryViewKind](CKAcknowledgmentVoteCountCollectionReusableView, "supplementaryViewKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAcknowledgmentVoteCountCollectionReusableView reuseIdentifier](CKAcknowledgmentVoteCountCollectionReusableView, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v6, v7, v8);

  -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAcknowledgmentVoteCountCollectionReusableView supplementaryViewKind](CKAcknowledgmentVoteCountCollectionReusableView, "supplementaryViewKind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAcknowledgmentVoteCountCollectionReusableView reuseIdentifier](CKAcknowledgmentVoteCountCollectionReusableView, "reuseIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v10, v11, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKGroupAcknowledgmentVotingViewController tallies](self, "tallies");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "section");

  objc_msgSend(v13, "objectAtIndex:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "configureWithAcknowledgmentTally:", v15);
  return v12;
}

- (void)_collapseCollectionView
{
  id v3;

  -[CKGroupAcknowledgmentVotingViewController layout](self, "layout");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CKGroupAcknowledgmentVotingViewController _animateToLayout:aroundSection:](self, "_animateToLayout:aroundSection:", 1, objc_msgSend(v3, "expandedSection"));

}

- (void)_expandCollectionViewExpandedViewAroundSection:(int64_t)a3
{
  -[CKGroupAcknowledgmentVotingViewController _animateToLayout:aroundSection:](self, "_animateToLayout:aroundSection:", 0, a3);
}

- (void)_animateToLayout:(unint64_t)a3 aroundSection:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  _QWORD v31[6];

  -[CKGroupAcknowledgmentVotingViewController layout](self, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "layoutMode");

  if (v8 != a3)
  {
    -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_stopScrollingAndZoomingAnimations");

    -[CKGroupAcknowledgmentVotingViewController layout](self, "layout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preapareForLayoutAnimationAroundSection:", a4);

    -[CKGroupAcknowledgmentVotingViewController layout](self, "layout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "layoutMode");

    v13 = v12 != 1;
    if (v12 == 1)
    {
      -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "contentOffset");
      v17 = v16;
      v19 = v18;
      -[CKGroupAcknowledgmentVotingViewController layout](self, "layout");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setPreviousCollapsedContentOffset:", v17, v19);

      -[CKGroupAcknowledgmentVotingViewController collapseButton](self, "collapseButton");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setHidden:", 0);

      -[CKGroupAcknowledgmentVotingViewController collapseButton](self, "collapseButton");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setAlpha:", 0.0);

      -[CKGroupAcknowledgmentVotingViewController _layoutCollapseButton](self, "_layoutCollapseButton");
      -[CKGroupAcknowledgmentVotingViewController currentlyExpandedVoteCountView](self, "currentlyExpandedVoteCountView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKGroupAcknowledgmentVotingViewController tallies](self, "tallies");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndex:", a4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "configureWithAcknowledgmentTally:", v25);

      -[CKGroupAcknowledgmentVotingViewController currentlyExpandedVoteCountView](self, "currentlyExpandedVoteCountView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setHidden:", 0);

      -[CKGroupAcknowledgmentVotingViewController currentlyExpandedVoteCountView](self, "currentlyExpandedVoteCountView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setAlpha:", 0.0);

      -[CKGroupAcknowledgmentVotingViewController _layoutCurrentlyExpandedVoteCountView](self, "_layoutCurrentlyExpandedVoteCountView");
    }
    else
    {
      -[CKGroupAcknowledgmentVotingViewController layout](self, "layout");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_setupAnimatedCollapsedLayout");

    }
    -[CKGroupAcknowledgmentVotingViewController layout](self, "layout");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "invalidateLayout");

    -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layoutIfNeeded");

    v30[4] = self;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __76__CKGroupAcknowledgmentVotingViewController__animateToLayout_aroundSection___block_invoke;
    v31[3] = &unk_1E274C9C0;
    v31[4] = self;
    v31[5] = v13;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __76__CKGroupAcknowledgmentVotingViewController__animateToLayout_aroundSection___block_invoke_4;
    v30[3] = &unk_1E274A1B8;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v31, v30, 0.8, 0.0, 3.0, 400.0, 60.0, 6.0);
  }
}

void __76__CKGroupAcknowledgmentVotingViewController__animateToLayout_aroundSection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  _QWORD v11[5];

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLayoutMode:", v2);

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__CKGroupAcknowledgmentVotingViewController__animateToLayout_aroundSection___block_invoke_2;
  v11[3] = &unk_1E274A208;
  v11[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "performBatchUpdates:completion:", v11, &__block_literal_global_34);

  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "collapseButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "setAlpha:", 0.0);

    objc_msgSend(*(id *)(a1 + 32), "currentlyExpandedVoteCountView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 0.0;
  }
  else
  {
    objc_msgSend(v6, "setAlpha:", 1.0);

    objc_msgSend(*(id *)(a1 + 32), "currentlyExpandedVoteCountView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 1.0;
  }
  objc_msgSend(v8, "setAlpha:", v10);

}

void __76__CKGroupAcknowledgmentVotingViewController__animateToLayout_aroundSection___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCollectionViewLayout:animated:", v2, 0);

}

void __76__CKGroupAcknowledgmentVotingViewController__animateToLayout_aroundSection___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cleanupAnimationCache");

  objc_msgSend(*(id *)(a1 + 32), "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutMode");

  objc_msgSend(*(id *)(a1 + 32), "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == 1)
  {
    objc_msgSend(v5, "previousCollapsedContentOffset");
    v8 = v7;
    v10 = v9;
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentOffset:", v8, v10);

    objc_msgSend(*(id *)(a1 + 32), "layout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidateLayout");

    objc_msgSend(*(id *)(a1 + 32), "collapseButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 1);

    objc_msgSend(*(id *)(a1 + 32), "currentlyExpandedVoteCountView");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHidden:", 1);
  }
  else
  {
    v14 = objc_msgSend(v5, "layoutMode");

    if (v14)
      return;
    v15 = *MEMORY[0x1E0C9D538];
    v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setContentOffset:", v15, v16);

    objc_msgSend(*(id *)(a1 + 32), "layout");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "invalidateLayout");
  }

}

- (void)tapGestureRecognized:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  CGPoint v18;
  CGRect v19;

  v17 = a3;
  v4 = objc_msgSend(v17, "state") == 3;
  v5 = v17;
  if (v4)
  {
    objc_msgSend(v17, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "locationInView:", v6);
    v8 = v7;
    v10 = v9;

    -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "indexPathForItemAtPoint:", v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKGroupAcknowledgmentVotingViewController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cellForItemAtIndexPath:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "frame");
    v18.x = v8;
    v18.y = v10;
    if (CGRectContainsPoint(v19, v18))
    {
      -[CKGroupAcknowledgmentVotingViewController layout](self, "layout");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "layoutMode");

      if (v16 == 1)
        -[CKGroupAcknowledgmentVotingViewController _expandCollectionViewExpandedViewAroundSection:](self, "_expandCollectionViewExpandedViewAroundSection:", objc_msgSend(v12, "section"));
    }

    v5 = v17;
  }

}

- (id)hitTest:(CGPoint)a3 withGestureRecognizer:(id)a4
{
  id v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  CGPoint v22;
  CGRect v23;

  v5 = a4;
  -[CKGroupAcknowledgmentVotingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CKGroupAcknowledgmentVotingViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v15);
  v17 = v16;
  v19 = v18;

  v23.origin.x = v8;
  v23.origin.y = v10;
  v23.size.width = v12;
  v23.size.height = v14;
  v22.x = v17;
  v22.y = v19;
  if (CGRectContainsPoint(v23, v22))
  {
    -[CKGroupAcknowledgmentVotingViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (NSArray)tallies
{
  return self->_tallies;
}

- (void)setTallies:(id)a3
{
  objc_storeStrong((id *)&self->_tallies, a3);
}

- (CKAggregateAcknowledgmentChatItem)chatItem
{
  return self->_chatItem;
}

- (void)setChatItem:(id)a3
{
  objc_storeStrong((id *)&self->_chatItem, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (CKGroupAcknowledgmentVotingLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (CKAcknowledgmentVotingViewAnimator)animator
{
  return self->_animator;
}

- (void)setAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_animator, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (void)setCollapseButton:(id)a3
{
  objc_storeStrong((id *)&self->_collapseButton, a3);
}

- (void)setCurrentlyExpandedVoteCountView:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyExpandedVoteCountView, a3);
}

- (NSArray)sortedAnimatorModelItems
{
  return self->_sortedAnimatorModelItems;
}

- (void)setSortedAnimatorModelItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedAnimatorModelItems, 0);
  objc_storeStrong((id *)&self->_currentlyExpandedVoteCountView, 0);
  objc_storeStrong((id *)&self->_collapseButton, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_chatItem, 0);
  objc_storeStrong((id *)&self->_tallies, 0);
}

@end
