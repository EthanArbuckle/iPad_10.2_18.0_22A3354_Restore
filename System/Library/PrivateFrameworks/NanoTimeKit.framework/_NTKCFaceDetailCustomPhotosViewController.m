@implementation _NTKCFaceDetailCustomPhotosViewController

- (_NTKCFaceDetailCustomPhotosViewController)initWithPhotosEditor:(id)a3 forFace:(id)a4 inGallery:(BOOL)a5 faceView:(id)a6 externalImagesSet:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  _NTKCFaceDetailCustomPhotosViewController *v16;
  _NTKCFaceDetailCustomPhotosViewController *v17;
  uint64_t v18;
  UIBarButtonItem *saveButton;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  UIBarButtonItem *selectButton;
  uint64_t v25;
  UIBarButtonItem *doneButton;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  UIBarButtonItem *selectAllButton;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  UIBarButtonItem *deselectAllButton;
  uint64_t v37;
  UIBarButtonItem *deleteButton;
  void *v39;
  uint64_t v40;
  UIBarButtonItem *spinnerButton;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  UIBarButtonItem *addButton;
  void *v47;
  void *v48;
  uint64_t v49;
  NSArray *defaultToolBarItems;
  void *v51;
  void *v52;
  uint64_t v53;
  NSArray *editingToolBarItems;
  uint64_t v55;
  NSMutableIndexSet *selectedIndexes;
  objc_super v58;
  _QWORD v59[3];
  _QWORD v60[4];

  v7 = a7;
  v9 = a5;
  v60[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void *)objc_opt_new();
  v58.receiver = self;
  v58.super_class = (Class)_NTKCFaceDetailCustomPhotosViewController;
  v16 = -[_NTKCFaceDetailCustomPhotosViewController initWithCollectionViewLayout:](&v58, sel_initWithCollectionViewLayout_, v15);
  v17 = v16;
  if (v16)
  {
    -[_NTKCFaceDetailCustomPhotosViewController setEditor:](v16, "setEditor:", v12);
    -[_NTKCFaceDetailCustomPhotosViewController setFace:](v17, "setFace:", v13);
    -[_NTKCFaceDetailCustomPhotosViewController setInGallery:](v17, "setInGallery:", v9);
    -[_NTKCFaceDetailCustomPhotosViewController setFaceView:](v17, "setFaceView:", v14);
    -[_NTKCFaceDetailCustomPhotosViewController setExternalImagesSet:](v17, "setExternalImagesSet:", v7);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, v17, sel__savePressed);
    saveButton = v17->_saveButton;
    v17->_saveButton = (UIBarButtonItem *)v18;

    v20 = objc_alloc(MEMORY[0x1E0DC34F0]);
    NTKCCustomizationLocalizedString(CFSTR("PHOTOS_SELECT"), (uint64_t)CFSTR("Select"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v20, "initWithTitle:style:target:action:", v22, 0, v17, sel__selectPressed);
    selectButton = v17->_selectButton;
    v17->_selectButton = (UIBarButtonItem *)v23;

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, v17, sel__donePressed);
    doneButton = v17->_doneButton;
    v17->_doneButton = (UIBarButtonItem *)v25;

    v27 = objc_alloc(MEMORY[0x1E0DC34F0]);
    NTKCCustomizationLocalizedString(CFSTR("PHOTOS_SELECT_ALL"), (uint64_t)CFSTR("Select All"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v27, "initWithTitle:style:target:action:", v29, 0, v17, sel__selectAllPressed);
    selectAllButton = v17->_selectAllButton;
    v17->_selectAllButton = (UIBarButtonItem *)v30;

    v32 = objc_alloc(MEMORY[0x1E0DC34F0]);
    NTKCCustomizationLocalizedString(CFSTR("PHOTOS_DESELECT_ALL"), (uint64_t)CFSTR("Deselect All"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v32, "initWithTitle:style:target:action:", v34, 0, v17, sel__selectAllPressed);
    deselectAllButton = v17->_deselectAllButton;
    v17->_deselectAllButton = (UIBarButtonItem *)v35;

    v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 16, v17, sel__deletePressed);
    deleteButton = v17->_deleteButton;
    v17->_deleteButton = (UIBarButtonItem *)v37;

    -[UIBarButtonItem setEnabled:](v17->_deleteButton, "setEnabled:", 0);
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 101);
    objc_msgSend(v39, "startAnimating");
    v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v39);
    spinnerButton = v17->_spinnerButton;
    v17->_spinnerButton = (UIBarButtonItem *)v40;

    if (!v17->_externalImagesSet)
    {
      v42 = objc_alloc(MEMORY[0x1E0DC34F0]);
      NTKCCustomizationLocalizedString(CFSTR("PHOTOS_ADD"), (uint64_t)CFSTR("Add Photos…"), v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v42, "initWithTitle:style:target:action:", v44, 0, v17, sel__addPressed);
      addButton = v17->_addButton;
      v17->_addButton = (UIBarButtonItem *)v45;

      v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
      v60[0] = v47;
      v60[1] = v17->_addButton;
      v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
      v60[2] = v48;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 3);
      v49 = objc_claimAutoreleasedReturnValue();
      defaultToolBarItems = v17->_defaultToolBarItems;
      v17->_defaultToolBarItems = (NSArray *)v49;

    }
    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v59[0] = v51;
    v59[1] = v17->_deleteButton;
    v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v59[2] = v52;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 3);
    v53 = objc_claimAutoreleasedReturnValue();
    editingToolBarItems = v17->_editingToolBarItems;
    v17->_editingToolBarItems = (NSArray *)v53;

    v55 = objc_opt_new();
    selectedIndexes = v17->_selectedIndexes;
    v17->_selectedIndexes = (NSMutableIndexSet *)v55;

  }
  return v17;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_NTKCFaceDetailCustomPhotosViewController;
  -[_NTKCFaceDetailCustomPhotosViewController viewDidLoad](&v12, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NTKCFaceDetailCustomPhotosViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NTKCFaceDetailCustomPhotosViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[_NTKCFaceDetailCustomPhotosViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  +[NTKCPhotoListCell reuseIdentifier](NTKCPhotoListCell, "reuseIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forCellWithReuseIdentifier:", v8, v9);

  -[_NTKCFaceDetailCustomPhotosViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlwaysBounceVertical:", 1);

  -[_NTKCFaceDetailCustomPhotosViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAllowsSelectionDuringEditing:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_NTKCFaceDetailCustomPhotosViewController;
  -[_NTKCFaceDetailCustomPhotosViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[_NTKCFaceDetailCustomPhotosViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarHidden:", 0);

  -[_NTKCFaceDetailCustomPhotosViewController _updateButtons](self, "_updateButtons");
  -[_NTKCFaceDetailCustomPhotosViewController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_NTKCFaceDetailCustomPhotosViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_NTKCFaceDetailCustomPhotosViewController;
  -[_NTKCFaceDetailCustomPhotosViewController setEditing:animated:](&v7, sel_setEditing_animated_, a3, a4);
  -[_NTKCFaceDetailCustomPhotosViewController _updateButtons](self, "_updateButtons");
  -[NSMutableIndexSet removeAllIndexes](self->_selectedIndexes, "removeAllIndexes");
  -[_NTKCFaceDetailCustomPhotosViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleCells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_153);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[NTKCompanionCustomPhotosEditor photosCount](self->_editor, "photosCount", a3, a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NTKCompanionCustomPhotosEditor *editor;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t v17;

  v5 = a4;
  -[_NTKCFaceDetailCustomPhotosViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKCPhotoListCell reuseIdentifier](NTKCPhotoListCell, "reuseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "item");
  editor = self->_editor;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83___NTKCFaceDetailCustomPhotosViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  v15[3] = &unk_1E6BD9340;
  v15[4] = self;
  v11 = v8;
  v16 = v11;
  v17 = v9;
  -[NTKCompanionCustomPhotosEditor imageAndCropForPhotoAtIndex:completion:](editor, "imageAndCropForPhotoAtIndex:completion:", v9, v15);
  objc_msgSend(v11, "setPhoto:", 0);
  objc_msgSend(v11, "setCrop:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v11, "setSelected:", -[NSMutableIndexSet containsIndex:](self->_selectedIndexes, "containsIndex:", v9));
  v12 = v16;
  v13 = v11;

  return v13;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSMutableIndexSet *selectedIndexes;
  void *v12;
  void *v13;
  NTKCFaceDetailPhotoCropViewController *v14;
  uint64_t v15;
  NTKCompanionCustomPhotosEditor *editor;
  void *v17;
  NTKCFaceDetailPhotoCropViewController *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "item");
  if (-[_NTKCFaceDetailCustomPhotosViewController isEditing](self, "isEditing"))
  {
    objc_msgSend(v6, "cellForItemAtIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSelected:", objc_msgSend(v9, "isSelected") ^ 1);
    v10 = objc_msgSend(v9, "isSelected");
    selectedIndexes = self->_selectedIndexes;
    if (v10)
      -[NSMutableIndexSet addIndex:](selectedIndexes, "addIndex:", v8);
    else
      -[NSMutableIndexSet removeIndex:](selectedIndexes, "removeIndex:", v8);
    -[_NTKCFaceDetailCustomPhotosViewController _updateButtonsForSelectionChanged](self, "_updateButtonsForSelectionChanged");

  }
  else
  {
    -[NTKFaceView timeView](self->_faceView, "timeView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "style");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v14 = [NTKCFaceDetailPhotoCropViewController alloc];
    v15 = objc_msgSend(v7, "item");
    editor = self->_editor;
    -[_NTKCFaceDetailCustomPhotosViewController face](self, "face");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __88___NTKCFaceDetailCustomPhotosViewController_collectionView_shouldSelectItemAtIndexPath___block_invoke;
    v23 = &unk_1E6BCD7F0;
    objc_copyWeak(&v24, &location);
    v18 = -[NTKCFaceDetailPhotoCropViewController initWithIndex:inPhotosEditor:forFace:timeStyle:completionHandler:](v14, "initWithIndex:inPhotosEditor:forFace:timeStyle:completionHandler:", v15, editor, v17, v13, &v20);

    -[_NTKCFaceDetailCustomPhotosViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0, v20, v21, v22, v23);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
  return 0;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  NTKCompanionCustomPhotosEditor *editor;
  id v7;
  uint64_t v8;
  uint64_t v9;

  editor = self->_editor;
  v7 = a5;
  v8 = objc_msgSend(a4, "item");
  v9 = objc_msgSend(v7, "item");

  -[NTKCompanionCustomPhotosEditor movePhotoAtIndex:toIndex:](editor, "movePhotoAtIndex:toIndex:", v8, v9);
}

- (void)_updateButtons
{
  void *v3;
  void *v4;
  UIBarButtonItem *doneButton;
  void *v6;
  int *v7;
  UIBarButtonItem *saveButton;
  void *v9;
  UIBarButtonItem *selectButton;

  if (-[_NTKCFaceDetailCustomPhotosViewController isEditing](self, "isEditing"))
  {
    -[_NTKCFaceDetailCustomPhotosViewController _currentSelectAllButton](self, "_currentSelectAllButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NTKCFaceDetailCustomPhotosViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLeftBarButtonItem:", v3);

    doneButton = self->_doneButton;
    -[_NTKCFaceDetailCustomPhotosViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:", doneButton);
    v7 = &OBJC_IVAR____NTKCFaceDetailCustomPhotosViewController__editingToolBarItems;
  }
  else
  {
    saveButton = self->_saveButton;
    -[_NTKCFaceDetailCustomPhotosViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLeftBarButtonItem:", saveButton);

    selectButton = self->_selectButton;
    -[_NTKCFaceDetailCustomPhotosViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:", selectButton);
    v7 = &OBJC_IVAR____NTKCFaceDetailCustomPhotosViewController__defaultToolBarItems;
  }

  -[_NTKCFaceDetailCustomPhotosViewController setToolbarItems:](self, "setToolbarItems:", *(Class *)((char *)&self->super.super.super.super.isa + *v7));
  -[UIBarButtonItem setEnabled:](self->_addButton, "setEnabled:", (unint64_t)-[NTKCompanionCustomPhotosEditor photosCount](self->_editor, "photosCount") < 0x18);
  -[UIBarButtonItem setEnabled:](self->_selectButton, "setEnabled:", -[NTKCompanionCustomPhotosEditor photosCount](self->_editor, "photosCount") > 0);
  -[_NTKCFaceDetailCustomPhotosViewController _updateTitle](self, "_updateTitle");
  -[_NTKCFaceDetailCustomPhotosViewController _updateButtonsForSelectionChanged](self, "_updateButtonsForSelectionChanged");
}

- (void)_updateButtonsForSelectionChanged
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  BOOL v10;

  if (-[_NTKCFaceDetailCustomPhotosViewController isEditing](self, "isEditing"))
  {
    -[_NTKCFaceDetailCustomPhotosViewController _currentSelectAllButton](self, "_currentSelectAllButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NTKCFaceDetailCustomPhotosViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLeftBarButtonItem:", v3);

    v5 = -[NSMutableIndexSet count](self->_selectedIndexes, "count");
    v6 = v5 != 0;
    if (!self->_inGallery)
    {
      v7 = v5;
      v8 = -[NSMutableIndexSet count](self->_selectedIndexes, "count", v6);
      v9 = -[NTKCompanionCustomPhotosEditor photosCount](self->_editor, "photosCount");
      if (v7)
        v10 = v8 == v9;
      else
        v10 = 1;
      v6 = !v10;
    }
    -[UIBarButtonItem setEnabled:](self->_deleteButton, "setEnabled:", v6);
  }
}

- (id)_currentSelectAllButton
{
  _BOOL4 v3;
  int *v4;

  v3 = -[_NTKCFaceDetailCustomPhotosViewController _allPhotosSelected](self, "_allPhotosSelected");
  v4 = &OBJC_IVAR____NTKCFaceDetailCustomPhotosViewController__selectAllButton;
  if (v3)
    v4 = &OBJC_IVAR____NTKCFaceDetailCustomPhotosViewController__deselectAllButton;
  return *(id *)((char *)&self->super.super.super.super.isa + *v4);
}

- (void)_updateTitle
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (-[_NTKCFaceDetailCustomPhotosViewController isEditing](self, "isEditing"))
  {
    if (!-[NSMutableIndexSet count](self->_selectedIndexes, "count"))
    {
      NTKCCustomizationLocalizedString(CFSTR("PHOTOS_TITLE_SELECT_ITEMS"), (uint64_t)CFSTR("Select Item"), v4);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    NTKCCustomizationLocalizedFormat(CFSTR("PHOTOS_NUMBER_SELECTED"), (uint64_t)CFSTR("# Photos Selected"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = -[NSMutableIndexSet count](self->_selectedIndexes, "count");
  }
  else
  {
    NTKCCustomizationLocalizedFormat(CFSTR("PHOTOS_NUMBER"), (uint64_t)CFSTR("# Photos"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = -[NTKCompanionCustomPhotosEditor photosCount](self->_editor, "photosCount");
  }
  objc_msgSend(v6, "localizedStringWithFormat:", v5, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
  -[_NTKCFaceDetailCustomPhotosViewController setTitle:](self, "setTitle:", v8);

}

- (void)_savePressed
{
  uint64_t v3;
  void *v4;
  void (**v5)(_QWORD);
  void *v6;
  UIBarButtonItem *spinnerButton;
  void *v8;
  UIBarButtonItem *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  _QWORD aBlock[4];
  id v18;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57___NTKCFaceDetailCustomPhotosViewController__savePressed__block_invoke;
  aBlock[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v18, &location);
  v4 = _Block_copy(aBlock);
  v11 = v3;
  v12 = 3221225472;
  v13 = __57___NTKCFaceDetailCustomPhotosViewController__savePressed__block_invoke_2;
  v14 = &unk_1E6BD9368;
  objc_copyWeak(&v16, &location);
  v5 = v4;
  v15 = v5;
  v6 = _Block_copy(&v11);
  if (self->_inGallery)
  {
    spinnerButton = self->_spinnerButton;
    -[_NTKCFaceDetailCustomPhotosViewController navigationItem](self, "navigationItem", v11, v12, v13, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLeftBarButtonItem:", spinnerButton);

    -[NTKCompanionCustomPhotosEditor generateGalleryPreviewResourceDirectoryWithCompletion:](self->_editor, "generateGalleryPreviewResourceDirectoryWithCompletion:", v6);
  }
  else if (-[NTKCompanionResourceDirectoryEditor state](self->_editor, "state", v11, v12, v13, v14) == 2)
  {
    v9 = self->_spinnerButton;
    -[_NTKCFaceDetailCustomPhotosViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLeftBarButtonItem:", v9);

    -[NTKCompanionCustomPhotosEditor finalizeWithCompletion:](self->_editor, "finalizeWithCompletion:", v6);
  }
  else
  {
    v5[2](v5);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_selectPressed
{
  -[_NTKCFaceDetailCustomPhotosViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);
}

- (void)_donePressed
{
  -[_NTKCFaceDetailCustomPhotosViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
}

- (void)_selectAllPressed
{
  _BOOL4 v3;
  BOOL v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  BOOL v8;

  v3 = -[_NTKCFaceDetailCustomPhotosViewController _allPhotosSelected](self, "_allPhotosSelected");
  if (v3)
    -[NSMutableIndexSet removeAllIndexes](self->_selectedIndexes, "removeAllIndexes");
  else
    -[_NTKCFaceDetailCustomPhotosViewController _selectAllPhotos](self, "_selectAllPhotos");
  v4 = !v3;
  -[_NTKCFaceDetailCustomPhotosViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleCells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62___NTKCFaceDetailCustomPhotosViewController__selectAllPressed__block_invoke;
  v7[3] = &__block_descriptor_33_e34_v32__0__NTKCPhotoListCell_8Q16_B24l;
  v8 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

  -[_NTKCFaceDetailCustomPhotosViewController _updateButtonsForSelectionChanged](self, "_updateButtonsForSelectionChanged");
}

- (void)_addPressed
{
  int64_t v3;
  _QWORD v4[5];

  v3 = -[NTKCompanionCustomPhotosEditor photosCount](self->_editor, "photosCount");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56___NTKCFaceDetailCustomPhotosViewController__addPressed__block_invoke;
  v4[3] = &unk_1E6BD8280;
  v4[4] = self;
  +[NTKCPhotosAddController presentPhotosAddControllerFromViewController:selectionLimit:withCompletion:](NTKCPhotosAddController, "presentPhotosAddControllerFromViewController:selectionLimit:withCompletion:", self, 24 - v3, v4);
}

- (void)_deletePressed
{
  void *v3;
  NSMutableIndexSet *selectedIndexes;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _NTKCFaceDetailCustomPhotosViewController *v24;
  _QWORD v25[5];

  if (self->_deleteConfirmed)
  {
    self->_deleteConfirmed = 0;
    v3 = (void *)objc_opt_new();
    selectedIndexes = self->_selectedIndexes;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __59___NTKCFaceDetailCustomPhotosViewController__deletePressed__block_invoke_2;
    v22[3] = &unk_1E6BD3CB0;
    v23 = v3;
    v24 = self;
    v21 = v3;
    -[NSMutableIndexSet enumerateIndexesWithOptions:usingBlock:](selectedIndexes, "enumerateIndexesWithOptions:usingBlock:", 2, v22);
    -[NSMutableIndexSet removeAllIndexes](self->_selectedIndexes, "removeAllIndexes");
    -[_NTKCFaceDetailCustomPhotosViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deleteItemsAtIndexPaths:", v21);

    -[_NTKCFaceDetailCustomPhotosViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  }
  else
  {
    v6 = -[NSMutableIndexSet count](self->_selectedIndexes, "count");
    v7 = CFSTR("_PLURAL");
    if (v6 == 1)
      v7 = CFSTR("_SINGULAR");
    v8 = v7;
    objc_msgSend(CFSTR("PHOTOS_DELETE_CONFIRMATION"), "stringByAppendingString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NTKCCustomizationLocalizedString(v9, (uint64_t)CFSTR("Delete Confirmation"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("PHOTOS_DELETE_BUTTON"), "stringByAppendingString:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    NTKCCustomizationLocalizedString(v13, (uint64_t)CFSTR("Delete Photos"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __59___NTKCFaceDetailCustomPhotosViewController__deletePressed__block_invoke;
    v25[3] = &unk_1E6BCE388;
    v25[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v15, 2, v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v16);

    v17 = (void *)MEMORY[0x1E0DC3448];
    NTKCCustomizationLocalizedString(CFSTR("PHOTOS_CANCEL_BUTTON"), (uint64_t)CFSTR("Cancel"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 1, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v20);

    -[_NTKCFaceDetailCustomPhotosViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
  }
}

- (BOOL)_allPhotosSelected
{
  return -[NSMutableIndexSet containsIndexesInRange:](self->_selectedIndexes, "containsIndexesInRange:", 0, -[NTKCompanionCustomPhotosEditor photosCount](self->_editor, "photosCount"));
}

- (void)_selectAllPhotos
{
  -[NSMutableIndexSet addIndexesInRange:](self->_selectedIndexes, "addIndexesInRange:", 0, -[NTKCompanionCustomPhotosEditor photosCount](self->_editor, "photosCount"));
}

- (NTKCompanionCustomPhotosEditor)editor
{
  return self->_editor;
}

- (void)setEditor:(id)a3
{
  objc_storeStrong((id *)&self->_editor, a3);
}

- (NTKFace)face
{
  return self->_face;
}

- (void)setFace:(id)a3
{
  objc_storeStrong((id *)&self->_face, a3);
}

- (NTKCFaceDetailCustomPhotosViewControllerDelegate)delegate
{
  return (NTKCFaceDetailCustomPhotosViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)inGallery
{
  return self->_inGallery;
}

- (void)setInGallery:(BOOL)a3
{
  self->_inGallery = a3;
}

- (NTKBasePhotosFaceView)faceView
{
  return self->_faceView;
}

- (void)setFaceView:(id)a3
{
  objc_storeStrong((id *)&self->_faceView, a3);
}

- (BOOL)externalImagesSet
{
  return self->_externalImagesSet;
}

- (void)setExternalImagesSet:(BOOL)a3
{
  self->_externalImagesSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_editor, 0);
  objc_storeStrong((id *)&self->_selectedIndexes, 0);
  objc_storeStrong((id *)&self->_editingToolBarItems, 0);
  objc_storeStrong((id *)&self->_defaultToolBarItems, 0);
  objc_storeStrong((id *)&self->_spinnerButton, 0);
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_deselectAllButton, 0);
  objc_storeStrong((id *)&self->_selectAllButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_selectButton, 0);
  objc_storeStrong((id *)&self->_saveButton, 0);
}

@end
