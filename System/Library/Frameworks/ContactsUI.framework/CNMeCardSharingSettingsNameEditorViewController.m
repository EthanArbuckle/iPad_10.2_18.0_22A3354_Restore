@implementation CNMeCardSharingSettingsNameEditorViewController

- (CNMeCardSharingSettingsNameEditorViewController)initWithTextFields:(id)a3
{
  id v4;
  CNMeCardSharingSettingsNameEditorViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CNMeCardSharingSettingsNameEditorViewController *v10;

  v4 = a3;
  v5 = -[CNMeCardSharingSettingsNameEditorViewController init](self, "init");
  if (v5)
  {
    CNContactsUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SHARING_NAME_CELL_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingSettingsNameEditorViewController setTitle:](v5, "setTitle:", v7);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, v5, sel_doneTapped);
    -[CNMeCardSharingSettingsNameEditorViewController navigationItem](v5, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightBarButtonItem:", v8);

    -[CNMeCardSharingSettingsNameEditorViewController setTextFields:](v5, "setTextFields:", v4);
    v10 = v5;

  }
  return v5;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNMeCardSharingSettingsNameEditorViewController;
  -[CNMeCardSharingSettingsNameEditorViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[CNMeCardSharingSettingsNameEditorViewController setUpCollectionView](self, "setUpCollectionView");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNMeCardSharingSettingsNameEditorViewController;
  -[CNMeCardSharingSettingsNameEditorViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[CNMeCardSharingSettingsNameEditorViewController textFields](self, "textFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "becomeFirstResponder");
}

- (void)setUpCollectionView
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", 2);
  objc_msgSend(MEMORY[0x1E0DC35D0], "layoutWithListConfiguration:", v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DC35B8]);
  -[CNMeCardSharingSettingsNameEditorViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v6 = (void *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3);

  objc_msgSend(v6, "setAutoresizingMask:", 18);
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setDataSource:", self);
  objc_msgSend(v6, "setAllowsSelection:", 0);
  v7 = objc_opt_class();
  +[CNMeCardSharingSettingsNameEditingCell cellIdentifier](CNMeCardSharingSettingsNameEditingCell, "cellIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", v7, v8);

  -[CNMeCardSharingSettingsNameEditorViewController setCollectionView:](self, "setCollectionView:", v6);
  -[CNMeCardSharingSettingsNameEditorViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingSettingsNameEditorViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

}

- (void)doneTapped
{
  -[CNMeCardSharingSettingsNameEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[CNMeCardSharingSettingsNameEditorViewController textFields](self, "textFields", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  +[CNMeCardSharingSettingsNameEditingCell cellIdentifier](CNMeCardSharingSettingsNameEditingCell, "cellIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNMeCardSharingSettingsNameEditorViewController textFields](self, "textFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "row");

  objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextField:", v12);

  return v9;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (NSArray)textFields
{
  return self->_textFields;
}

- (void)setTextFields:(id)a3
{
  objc_storeStrong((id *)&self->_textFields, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFields, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
