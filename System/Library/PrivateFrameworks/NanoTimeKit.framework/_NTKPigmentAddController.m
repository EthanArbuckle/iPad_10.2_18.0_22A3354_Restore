@implementation _NTKPigmentAddController

- (_NTKPigmentAddController)initWithFace:(id)a3 faceView:(id)a4 slot:(id)a5 willExitHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _NTKPigmentAddController *v15;
  _NTKPigmentAddController *v16;
  uint64_t v17;
  NSString *slot;
  void *v19;
  id willExitHandler;
  uint64_t v21;
  NTKPigmentEditOptionArray *addedPigments;
  uint64_t v23;
  NTKPigmentEditOptionArray *removedPigments;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)_NTKPigmentAddController;
  v15 = -[_NTKPigmentAddController initWithNibName:bundle:](&v29, sel_initWithNibName_bundle_, 0, 0);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_face, a3);
    objc_storeStrong((id *)&v16->_faceView, a4);
    v17 = objc_msgSend(v13, "copy");
    slot = v16->_slot;
    v16->_slot = (NSString *)v17;

    v19 = _Block_copy(v14);
    willExitHandler = v16->_willExitHandler;
    v16->_willExitHandler = v19;

    +[NTKPigmentEditOptionArray arrayWithEquality:](NTKPigmentEditOptionArray, "arrayWithEquality:", 1);
    v21 = objc_claimAutoreleasedReturnValue();
    addedPigments = v16->_addedPigments;
    v16->_addedPigments = (NTKPigmentEditOptionArray *)v21;

    +[NTKPigmentEditOptionArray arrayWithEquality:](NTKPigmentEditOptionArray, "arrayWithEquality:", 1);
    v23 = objc_claimAutoreleasedReturnValue();
    removedPigments = v16->_removedPigments;
    v16->_removedPigments = (NTKPigmentEditOptionArray *)v23;

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, v16, sel__donePressed);
    -[_NTKPigmentAddController navigationItem](v16, "navigationItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setRightBarButtonItem:", v25);

    -[_NTKPigmentAddController _setupPigments](v16, "_setupPigments");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v16, sel__handleOptionsChangedNotification, CFSTR("NTKColorEditOptionsChangedNotificationName"), v16->_face);

  }
  else
  {
    (*((void (**)(id, _QWORD))v14 + 2))(v14, 0);
  }

  return v16;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  UICollectionView *v9;
  UICollectionView *collectionView;
  UICollectionView *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  UICollectionView *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)_NTKPigmentAddController;
  -[_NTKPigmentAddController viewDidLoad](&v22, sel_viewDidLoad);
  -[NTKFace device](self->_face, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_LayoutConstants_onceToken != -1)
    dispatch_once(&_LayoutConstants_onceToken, &__block_literal_global_338);
  v4 = *(double *)&_LayoutConstants__constants_3;

  BPSBackgroundColor();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NTKPigmentAddController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[_NTKPigmentAddController _collectionViewLayout](self, "_collectionViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0DC35B8]);
  v9 = (UICollectionView *)objc_msgSend(v8, "initWithFrame:collectionViewLayout:", v7, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  collectionView = self->_collectionView;
  self->_collectionView = v9;

  v11 = self->_collectionView;
  v12 = objc_opt_class();
  v13 = *MEMORY[0x1E0DC48A8];
  +[_NTKPigmentAddHeaderView reuseIdentifier](_NTKPigmentAddHeaderView, "reuseIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v11, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v12, v13, v14);

  v15 = self->_collectionView;
  v16 = objc_opt_class();
  +[_NTKPigmentAddCell reuseIdentifier](_NTKPigmentAddCell, "reuseIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v15, "registerClass:forCellWithReuseIdentifier:", v16, v17);

  -[UICollectionView setAlwaysBounceVertical:](self->_collectionView, "setAlwaysBounceVertical:", 1);
  -[UICollectionView setAllowsMultipleSelection:](self->_collectionView, "setAllowsMultipleSelection:", 1);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", v4, 0.0, 0.0, 0.0);
  -[_NTKPigmentAddController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", self->_collectionView);

  NTKCCustomizationLocalizedString(CFSTR("PIGMENT_EDIT_TITLE"), (uint64_t)CFSTR("Face Colors"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NTKPigmentAddController setTitle:](self, "setTitle:", v20);

  -[_NTKPigmentAddController navigationItem](self, "navigationItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_setLargeTitleTwoLineMode:", 1);

}

- (void)viewDidLayoutSubviews
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_NTKPigmentAddController;
  -[_NTKPigmentAddController viewDidLayoutSubviews](&v12, sel_viewDidLayoutSubviews);
  -[_NTKPigmentAddController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UICollectionView setFrame:](self->_collectionView, "setFrame:", v5, v7, v9, v11);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_NTKPigmentAddController;
  -[_NTKPigmentAddController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[UICollectionView reloadData](self->_collectionView, "reloadData");
  -[_NTKPigmentAddController _updateSelections](self, "_updateSelections");
}

- (void)_updateSelections
{
  unint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  if (-[NSArray count](self->_sections, "count"))
  {
    v3 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "items");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v5, "count"))
      {
        v6 = 0;
        do
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if ((-[NTKPigmentEditOptionArray containsPigment:](self->_availablePigments, "containsPigment:", v7)
             || -[NTKPigmentEditOptionArray containsPigment:](self->_addedPigments, "containsPigment:", v7))
            && !-[NTKPigmentEditOptionArray containsPigment:](self->_removedPigments, "containsPigment:", v7))
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v6, v3);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](self->_collectionView, "selectItemAtIndexPath:animated:scrollPosition:", v8, 0, 0);

          }
          ++v6;
        }
        while (v6 < objc_msgSend(v5, "count"));
      }

      ++v3;
    }
    while (v3 < -[NSArray count](self->_sections, "count"));
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_NTKPigmentAddController;
  -[_NTKPigmentAddController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[UICollectionView becomeFirstResponder](self->_collectionView, "becomeFirstResponder");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_NTKPigmentAddController;
  -[_NTKPigmentAddController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[UICollectionView resignFirstResponder](self->_collectionView, "resignFirstResponder");
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return -[NSArray count](self->_sections, "count", a3);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  NTKFace *face;
  id v7;
  id v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  face = self->_face;
  v7 = a4;
  v8 = a3;
  -[NTKFace device](face, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (_LayoutConstants_onceToken != -1)
    dispatch_once(&_LayoutConstants_onceToken, &__block_literal_global_338);
  v10 = *(double *)&_LayoutConstants__constants_0_2;
  +[_NTKPigmentAddCell reuseIdentifier](_NTKPigmentAddCell, "reuseIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setDevice:", v9);
  -[_NTKPigmentAddController _pigmentForIndexPath:](self, "_pigmentForIndexPath:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKFaceView swatchImageForColorOption:size:](self->_faceView, "swatchImageForColorOption:size:", v13, v10, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:", v14);
  -[NTKFaceView swatchPrimaryColorForColorOption:](self->_faceView, "swatchPrimaryColorForColorOption:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPrimaryColor:", v15);
  objc_msgSend(v12, "setPigmentEditOption:", v13);

  return v12;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[_NTKPigmentAddHeaderView reuseIdentifier](_NTKPigmentAddHeaderView, "reuseIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v8, "section");
  -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setName:", v15);

  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  unint64_t v5;
  id v6;

  -[_NTKPigmentAddController _pigmentForIndexPath:](self, "_pigmentForIndexPath:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[NTKPigmentEditOptionArray indexOfPigment:](self->_removedPigments, "indexOfPigment:");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    -[NTKPigmentEditOptionArray addPigment:](self->_addedPigments, "addPigment:", v6);
  else
    -[NTKPigmentEditOptionArray removePigmentAtIndex:](self->_removedPigments, "removePigmentAtIndex:", v5);

}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  unint64_t v5;
  id v6;

  -[_NTKPigmentAddController _pigmentForIndexPath:](self, "_pigmentForIndexPath:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[NTKPigmentEditOptionArray indexOfPigment:](self->_addedPigments, "indexOfPigment:");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    -[NTKPigmentEditOptionArray addPigment:](self->_removedPigments, "addPigment:", v6);
  else
    -[NTKPigmentEditOptionArray removePigmentAtIndex:](self->_addedPigments, "removePigmentAtIndex:", v5);

}

- (id)_collectionViewLayout
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  -[NTKFace device](self->_face, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_LayoutConstants_onceToken != -1)
    dispatch_once(&_LayoutConstants_onceToken, &__block_literal_global_338);
  v3 = *(double *)&_LayoutConstants__constants_0_2;
  v4 = *(double *)&_LayoutConstants__constants_2;
  v5 = *(double *)&_LayoutConstants__constants_4;
  v6 = *(double *)&_LayoutConstants__constants_5;
  v7 = *(double *)&_LayoutConstants__constants_6;

  v8 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeWithWidthDimension:heightDimension:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeWithWidthDimension:heightDimension:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0DC3350];
  v32[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "horizontalGroupWithLayoutSize:subitems:", v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setInterItemSpacing:", v20);

  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setOrthogonalScrollingBehavior:", 1);
  objc_msgSend(v21, "setContentInsets:", 0.0, v4, 0.0, v4);
  v22 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 20.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sizeWithWidthDimension:heightDimension:", v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:absoluteOffset:", v25, *MEMORY[0x1E0DC48A8], 1, 0.0, -v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBoundarySupplementaryItems:", v27);

  v28 = (void *)objc_opt_new();
  objc_msgSend(v28, "setScrollDirection:", 0);
  objc_msgSend(v28, "setInterSectionSpacing:", v6);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35D0]), "initWithSection:configuration:", v21, v28);

  return v29;
}

- (void)_setupPigments
{
  NTKPigmentEditOptionArray *v3;
  NTKPigmentEditOptionArray *availablePigments;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSArray *sections;
  NSArray *v25;
  NSArray *v26;
  _NTKPigmentAddController *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  +[NTKPigmentEditOptionArray arrayWithEquality:](NTKPigmentEditOptionArray, "arrayWithEquality:", 1);
  v3 = (NTKPigmentEditOptionArray *)objc_claimAutoreleasedReturnValue();
  availablePigments = self->_availablePigments;
  self->_availablePigments = v3;

  -[NTKFace pigmentOptionProvider](self->_face, "pigmentOptionProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = self;
  objc_msgSend(v5, "availableColorsForSlot:", self->_slot);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (NSArray *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v15, "isAddable"))
        {
          objc_msgSend(v15, "collectionName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v16, "isEqualToString:", v11) & 1) == 0)
          {
            if (objc_msgSend(v12, "count"))
            {
              v17 = (void *)objc_opt_new();
              objc_msgSend(v17, "setName:", v10);
              objc_msgSend(v17, "setItems:", v12);
              -[NSArray addObject:](v26, "addObject:", v17);

            }
            v18 = v16;

            objc_msgSend(v15, "localizedCollectionName");
            v19 = objc_claimAutoreleasedReturnValue();

            +[NTKPigmentEditOptionArray arrayWithEquality:](NTKPigmentEditOptionArray, "arrayWithEquality:", 1);
            v20 = objc_claimAutoreleasedReturnValue();

            v21 = (void *)v19;
            v11 = v18;
            v12 = (void *)v20;
            v10 = v21;
          }
          objc_msgSend(v12, "addPigment:", v15);
          if (objc_msgSend(v15, "isVisible"))
            -[NTKPigmentEditOptionArray addPigment:](v27->_availablePigments, "addPigment:", v15);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
  }

  if (objc_msgSend(v12, "count"))
  {
    v22 = v10;
    v23 = (void *)objc_opt_new();
    objc_msgSend(v23, "setName:", v22);
    objc_msgSend(v23, "setItems:", v12);
    -[NSArray addObject:](v26, "addObject:", v23);

    v10 = v22;
  }
  sections = v27->_sections;
  v27->_sections = v26;
  v25 = v26;

}

- (id)_pigmentForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  v6 = objc_msgSend(v4, "item");

  -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_dismissWithChanges:(BOOL)a3
{
  -[_NTKPigmentAddController _callWillExitHandlerWithChanges:](self, "_callWillExitHandlerWithChanges:", a3);
  -[_NTKPigmentAddController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_103);
}

- (void)_callWillExitHandlerWithChanges:(BOOL)a3
{
  void (**willExitHandler)(id, BOOL);
  id v5;

  willExitHandler = (void (**)(id, BOOL))self->_willExitHandler;
  if (willExitHandler)
  {
    willExitHandler[2](willExitHandler, a3);
    v5 = self->_willExitHandler;
    self->_willExitHandler = 0;

  }
}

- (void)_donePressed
{
  void *v3;
  NTKPigmentEditOptionArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NTKPigmentEditOptionArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[NTKPigmentEditOptionArray count](self->_addedPigments, "count")
    || -[NTKPigmentEditOptionArray count](self->_removedPigments, "count"))
  {
    +[NTKPigmentEditOptionStore sharedInstance](NTKPigmentEditOptionStore, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v4 = self->_addedPigments;
    v5 = -[NTKPigmentEditOptionArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "setOption:visible:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8++), 1);
        }
        while (v6 != v8);
        v6 = -[NTKPigmentEditOptionArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v6);
    }

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = self->_removedPigments;
    v10 = -[NTKPigmentEditOptionArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v3, "setOption:visible:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++), 0, (_QWORD)v15);
        }
        while (v11 != v13);
        v11 = -[NTKPigmentEditOptionArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v11);
    }

    v14 = 1;
  }
  else
  {
    v14 = 0;
  }
  -[_NTKPigmentAddController _dismissWithChanges:](self, "_dismissWithChanges:", v14, (_QWORD)v15);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[_NTKPigmentAddController _callWillExitHandlerWithChanges:](self, "_callWillExitHandlerWithChanges:", 0);
}

- (void)_handleOptionsChangedNotification
{
  -[_NTKPigmentAddController _setupPigments](self, "_setupPigments");
  -[UICollectionView reloadData](self->_collectionView, "reloadData");
  -[_NTKPigmentAddController _updateSelections](self, "_updateSelections");
}

- (id)collectionView
{
  return self->_collectionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedPigments, 0);
  objc_storeStrong((id *)&self->_addedPigments, 0);
  objc_storeStrong((id *)&self->_availablePigments, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong(&self->_willExitHandler, 0);
  objc_storeStrong((id *)&self->_slot, 0);
  objc_storeStrong((id *)&self->_faceView, 0);
  objc_storeStrong((id *)&self->_face, 0);
}

@end
