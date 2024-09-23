@implementation HUPendingAccessoriesGridViewController

- (HUPendingAccessoriesGridViewController)initWithUser:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  HUPendingAccessoriesGridViewController *v13;
  objc_super v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0D31810]);
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __60__HUPendingAccessoriesGridViewController_initWithUser_home___block_invoke;
  v18[3] = &unk_1E6F50358;
  v19 = v6;
  v10 = v6;
  v11 = (void *)objc_msgSend(v8, "initWithDelegate:itemProvidersCreator:", self, v18);
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __60__HUPendingAccessoriesGridViewController_initWithUser_home___block_invoke_2;
  v16[3] = &unk_1E6F4C518;
  v17 = v7;
  v12 = v7;
  objc_msgSend(v11, "setHomeCreator:", v16);
  v15.receiver = self;
  v15.super_class = (Class)HUPendingAccessoriesGridViewController;
  v13 = -[HUServiceGridViewController initWithItemManager:](&v15, sel_initWithItemManager_, v11);

  return v13;
}

id __60__HUPendingAccessoriesGridViewController_initWithUser_home___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0D310A0];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithHome:user:", v4, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31098]), "initWithHome:user:", v4, *(_QWORD *)(a1 + 32));

  v9[0] = v5;
  v9[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __60__HUPendingAccessoriesGridViewController_initWithUser_home___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUPendingAccessoriesGridViewController;
  -[HUServiceGridViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[HUPendingAccessoriesGridViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setShouldDeriveVisibleBoundsFromContainingScrollView:", 1);

  -[HUPendingAccessoriesGridViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollEnabled:", 0);

  -[HUPendingAccessoriesGridViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClipsToBounds:", 1);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPendingAccessoriesGridViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPendingAccessoriesGridViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (id)layoutOptionsForSection:(int64_t)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUPendingAccessoriesGridViewController;
  -[HUServiceGridViewController layoutOptionsForSection:](&v6, sel_layoutOptionsForSection_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceCellOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowDescription:", 0);

  return v3;
}

@end
