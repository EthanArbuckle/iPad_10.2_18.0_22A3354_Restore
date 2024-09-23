@implementation NTKCFaceDetailViewController

- (NTKCFaceDetailViewController)initWithLibraryFace:(id)a3
{
  return -[NTKCFaceDetailViewController initWithFace:inGallery:externalAssets:](self, "initWithFace:inGallery:externalAssets:", a3, 0, 0);
}

- (NTKCFaceDetailViewController)initWithCandidateFace:(id)a3 externalAssets:(id)a4
{
  return -[NTKCFaceDetailViewController initWithFace:inGallery:externalAssets:](self, "initWithFace:inGallery:externalAssets:", a3, 1, a4);
}

- (NTKCFaceDetailViewController)initWithFace:(id)a3 inGallery:(BOOL)a4 externalAssets:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NTKCFaceDetailViewController *v10;
  NTKCFaceDetailViewController *v11;
  void *v12;
  NTKCompanionFaceViewController *v13;
  double v14;
  double *v15;
  void *v16;
  void *v17;
  void *v18;
  _BYTE v20[32];
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  _BYTE v25[16];
  double v26;
  uint64_t v27;
  objc_super v28;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v28.receiver = self;
  v28.super_class = (Class)NTKCFaceDetailViewController;
  v10 = -[NTKCFaceDetailViewController initWithNibName:bundle:](&v28, sel_initWithNibName_bundle_, 0, 0);
  v11 = v10;
  if (v10)
  {
    -[NTKCFaceDetailViewController setInGallery:](v10, "setInGallery:", v6);
    if (v11->_inGallery)
    {
      v12 = (void *)objc_msgSend(v8, "copyFromGalleryFace");
      -[NTKCFaceDetailViewController setFace:](v11, "setFace:", v12);

    }
    else
    {
      -[NTKCFaceDetailViewController setFace:](v11, "setFace:", v8);
    }
    v13 = -[NTKCompanionFaceViewController initWithFace:forEditing:]([NTKCompanionFaceViewController alloc], "initWithFace:forEditing:", v11->_face, 1);
    -[NTKCFaceDetailViewController setFaceVC:](v11, "setFaceVC:", v13);

    -[NTKCFaceDetailViewController setExternalAssets:](v11, "setExternalAssets:", v9);
    -[NTKCFaceDetailViewController _loadLibrary](v11, "_loadLibrary");
    if (v11->_inGallery)
    {
      if (NTKCScreenStyle() == -1)
      {
        _LayoutConstants_15((uint64_t)v25);
        v14 = v26;
        v15 = (double *)&v27;
      }
      else
      {
        _LayoutConstants_15((uint64_t)&v23);
        v14 = v23;
        v15 = (double *)&v24;
      }
    }
    else
    {
      _LayoutConstants_15((uint64_t)v20);
      v14 = v21;
      v15 = (double *)&v22;
    }
    -[NTKCFaceDetailViewController setHeaderFaceSize:](v11, "setHeaderFaceSize:", v14, *v15);
    -[NTKFaceViewController faceView](v11->_faceVC, "faceView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFace selectedOptionsForCustomEditModes](v11->_face, "selectedOptionsForCustomEditModes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "prepareSwatchImagesForSelectedOptions:", v17);

    -[NTKCFaceDetailViewController navigationItem](v11, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLargeTitleDisplayMode:", 2);

  }
  return v11;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  -[NTKCFaceDetailViewController setFace:](self, "setFace:", 0);
  -[NTKCFaceDetailViewController setLibrary:](self, "setLibrary:", 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, 0, 0);
  v4.receiver = self;
  v4.super_class = (Class)NTKCFaceDetailViewController;
  -[NTKCFaceDetailViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NTKCFaceContainerView *v12;
  void *v13;
  void *v14;
  void *v15;
  UILabel *faceName;
  uint64_t v17;
  double v18;
  double *v19;
  void *v20;
  void *v21;
  UILabel *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NTKCFaceDetailDescriptionSectionController *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  uint64_t v35;
  NSMutableArray *dynamicEditOptionSections;
  NSMutableArray *v37;
  NSMutableArray *v38;
  BOOL v39;
  uint64_t v40;
  NSMutableArray *editOptionSections;
  NSMutableArray *v42;
  NTKCFaceDetailComplicationSectionController *v43;
  NTKFace *face;
  void *v45;
  NTKCFaceDetailComplicationSectionController *v46;
  NTKFace *v47;
  NTKCFaceDetailActionSectionController *v48;
  NSMutableArray *currentSections;
  void *v50;
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[5];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  objc_super v65;
  _BYTE v66[128];
  _QWORD v67[3];

  v67[1] = *MEMORY[0x1E0C80C00];
  v65.receiver = self;
  v65.super_class = (Class)NTKCFaceDetailViewController;
  -[NTKCFaceDetailViewController viewDidLoad](&v65, sel_viewDidLoad);
  BPSBackgroundColor();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCFaceDetailViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v6 = (void *)objc_msgSend(v5, "initWithFrame:style:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[NTKCFaceDetailViewController setTableView:](self, "setTableView:", v6);

  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  BPSBackgroundColor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v7);

  -[UITableView setIndicatorStyle:](self->_tableView, "setIndicatorStyle:", 2);
  -[UITableView setSeparatorStyle:](self->_tableView, "setSeparatorStyle:", 0);
  -[UITableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", 0.0, NTKCScreenEdgeMargin(), 0.0, 0.0);
  -[UITableView setSectionHeaderTopPadding:](self->_tableView, "setSectionHeaderTopPadding:", 0.0);
  +[NTKCFaceDetailSectionController registerForTableView:](NTKCFaceDetailSectionController, "registerForTableView:", self->_tableView);
  -[NTKCFaceDetailViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_tableView);

  v9 = (void *)objc_opt_new();
  -[NTKCFaceDetailViewController setHeaderView:](self, "setHeaderView:", v9);

  BPSBackgroundColor();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NTKCDetailHeaderView setBackgroundColor:](self->_headerView, "setBackgroundColor:", v10);

  -[NTKCFaceDetailViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", self->_headerView);

  v12 = -[NTKCFaceContainerView initWithFaceSize:style:]([NTKCFaceContainerView alloc], "initWithFaceSize:style:", 2, self->_headerFaceSize.width, self->_headerFaceSize.height);
  -[NTKCFaceDetailViewController setFaceContainer:](self, "setFaceContainer:", v12);

  -[NTKCompanionFaceViewController view](self->_faceVC, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCFaceContainerView setFaceView:](self->_faceContainer, "setFaceView:", v13);

  -[_NTKCDetailHeaderView addSubview:](self->_headerView, "addSubview:", self->_faceContainer);
  v14 = (void *)objc_opt_new();
  -[NTKCFaceDetailViewController setFaceName:](self, "setFaceName:", v14);

  BPSTextColor();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_faceName, "setTextColor:", v15);

  faceName = self->_faceName;
  if (self->_inGallery)
  {
    -[UILabel setNumberOfLines:](faceName, "setNumberOfLines:", 3);
    v17 = NTKCScreenStyle();
    v18 = 24.0;
    if (v17 == -1)
      v18 = 20.0;
    v19 = (double *)MEMORY[0x1E0DC1420];
  }
  else
  {
    -[UILabel setAdjustsFontSizeToFitWidth:](faceName, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](self->_faceName, "setMinimumScaleFactor:", 0.5);
    v18 = 17.0;
    v19 = (double *)MEMORY[0x1E0DC1448];
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", v18, *v19);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_faceName, "setFont:", v50);
  if (self->_inGallery)
  {
    -[_NTKCDetailHeaderView addSubview:](self->_headerView, "addSubview:", self->_faceName);
    v20 = (void *)objc_opt_new();
    -[NTKCFaceDetailViewController setAddButton:](self, "setAddButton:", v20);

    -[UIButton addTarget:action:forControlEvents:](self->_addButton, "addTarget:action:forControlEvents:", self, sel__addTapped, 64);
    -[UIButton sizeToFit](self->_addButton, "sizeToFit");
    -[_NTKCDetailHeaderView addSubview:](self->_headerView, "addSubview:", self->_addButton);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    -[NTKCFaceDetailViewController setAddSpinner:](self, "setAddSpinner:", v21);

    -[_NTKCDetailHeaderView addSubview:](self->_headerView, "addSubview:", self->_addSpinner);
    -[NTKCFaceDetailViewController _updateAddButton](self, "_updateAddButton");
  }
  else
  {
    v22 = self->_faceName;
    -[NTKCFaceDetailViewController navigationItem](self, "navigationItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTitleView:", v22);

  }
  v24 = (void *)objc_opt_new();
  -[NTKCFaceDetailViewController setHeaderSeparator:](self, "setHeaderSeparator:", v24);

  -[UIView setHidden:](self->_headerSeparator, "setHidden:", 1);
  -[_NTKCDetailHeaderView addSubview:](self->_headerView, "addSubview:", self->_headerSeparator);
  if (self->_inGallery)
  {
    v67[0] = self->_addButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NTKCDetailHeaderView setInteractableSubviews:](self->_headerView, "setInteractableSubviews:", v25);

  }
  v26 = (void *)objc_opt_new();
  -[NTKCFaceDetailViewController setCurrentSections:](self, "setCurrentSections:", v26);

  if (+[NTKCFaceDetailDescriptionSectionController hasDescriptionSectionForFace:inGallery:orExternal:](NTKCFaceDetailDescriptionSectionController, "hasDescriptionSectionForFace:inGallery:orExternal:", self->_face, self->_inGallery, self->_externalAssets != 0))
  {
    v27 = -[NTKCFaceDetailDescriptionSectionController initWithTableViewController:face:inGallery:external:]([NTKCFaceDetailDescriptionSectionController alloc], "initWithTableViewController:face:inGallery:external:", self, self->_face, self->_inGallery, self->_externalAssets != 0);
    -[NTKCFaceDetailViewController setDescriptionSection:](self, "setDescriptionSection:", v27);

    -[NTKCFaceDetailDescriptionSectionController setDelegate:](self->_descriptionSection, "setDelegate:", self);
    -[NTKCFaceDetailSectionController setSection:](self->_descriptionSection, "setSection:", -[NSMutableArray count](self->_currentSections, "count"));
    -[NSMutableArray addObject:](self->_currentSections, "addObject:", self->_descriptionSection);
  }
  v28 = (void *)objc_opt_new();
  -[NTKCFaceDetailViewController setEditOptionSections:](self, "setEditOptionSections:", v28);

  if (-[NTKFace isEditable](self->_face, "isEditable"))
  {
    -[NTKFace editOptionsForCustomEditModes](self->_face, "editOptionsForCustomEditModes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v62 != v31)
            objc_enumerationMutation(v29);
          v33 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          -[NTKCFaceDetailViewController _sectionForEditOptionCollection:](self, "_sectionForEditOptionCollection:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            -[NSMutableArray addObject:](self->_editOptionSections, "addObject:", v34);
            v35 = objc_msgSend(v33, "mode");
            if (v35 == -[NTKFace dynamicEditMode](self->_face, "dynamicEditMode"))
            {
              dynamicEditOptionSections = self->_dynamicEditOptionSections;
              if (!dynamicEditOptionSections)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v37 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
                v38 = self->_dynamicEditOptionSections;
                self->_dynamicEditOptionSections = v37;

                dynamicEditOptionSections = self->_dynamicEditOptionSections;
              }
              -[NSMutableArray addObject:](dynamicEditOptionSections, "addObject:", v34);
            }
          }

        }
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
      }
      while (v30);
    }

  }
  v39 = -[NTKFace shouldColorEditModeBeAtTop](self->_face, "shouldColorEditModeBeAtTop");
  v40 = MEMORY[0x1E0C809B0];
  if (v39)
  {
    v55 = 0;
    v56 = &v55;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__16;
    v59 = __Block_byref_object_dispose__16;
    v60 = 0;
    editOptionSections = self->_editOptionSections;
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __43__NTKCFaceDetailViewController_viewDidLoad__block_invoke;
    v54[3] = &unk_1E6BD20E8;
    v54[4] = &v55;
    -[NSMutableArray enumerateObjectsUsingBlock:](editOptionSections, "enumerateObjectsUsingBlock:", v54);
    if (v56[5])
    {
      -[NSMutableArray removeObject:](self->_editOptionSections, "removeObject:");
      -[NSMutableArray insertObject:atIndex:](self->_editOptionSections, "insertObject:atIndex:", v56[5], 0);
    }
    _Block_object_dispose(&v55, 8);

  }
  v42 = self->_editOptionSections;
  v53[0] = v40;
  v53[1] = 3221225472;
  v53[2] = __43__NTKCFaceDetailViewController_viewDidLoad__block_invoke_2;
  v53[3] = &unk_1E6BD2110;
  v53[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](v42, "enumerateObjectsUsingBlock:", v53);
  if (+[NTKCFaceDetailComplicationSectionController hasComplicationsForFace:](NTKCFaceDetailComplicationSectionController, "hasComplicationsForFace:", self->_face))
  {
    v43 = [NTKCFaceDetailComplicationSectionController alloc];
    face = self->_face;
    -[NTKFaceViewController faceView](self->_faceVC, "faceView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[NTKCFaceDetailComplicationSectionController initWithTableViewController:face:faceView:inGallery:](v43, "initWithTableViewController:face:faceView:inGallery:", self, face, v45, self->_inGallery);

    -[NTKCFaceDetailComplicationSectionController setDelegate:](v46, "setDelegate:", self);
    -[NTKCFaceDetailSectionController setSection:](v46, "setSection:", -[NSMutableArray count](self->_currentSections, "count"));
    -[NSMutableArray addObject:](self->_currentSections, "addObject:", v46);

  }
  v47 = self->_face;
  v52[0] = v40;
  v52[1] = 3221225472;
  v52[2] = __43__NTKCFaceDetailViewController_viewDidLoad__block_invoke_3;
  v52[3] = &unk_1E6BD2138;
  v52[4] = self;
  -[NTKFace enumerateComplicationSlotsWithBlock:](v47, "enumerateComplicationSlotsWithBlock:", v52);
  if (self->_otherSection)
  {
    -[NTKCFaceDetailSectionController setSection:](self->_otherSection, "setSection:", -[NSMutableArray count](self->_currentSections, "count"));
    -[NSMutableArray addObject:](self->_currentSections, "addObject:", self->_otherSection);
  }
  if (!self->_inGallery)
  {
    v48 = -[NTKCFaceDetailSectionController initWithTableViewController:face:inGallery:]([NTKCFaceDetailActionSectionController alloc], "initWithTableViewController:face:inGallery:", self, self->_face, self->_inGallery);
    -[NTKCFaceDetailActionSectionController setDelegate:](v48, "setDelegate:", self);
    -[NTKCFaceDetailSectionController setSection:](v48, "setSection:", -[NSMutableArray count](self->_currentSections, "count"));
    -[NSMutableArray addObject:](self->_currentSections, "addObject:", v48);

  }
  currentSections = self->_currentSections;
  v51[0] = v40;
  v51[1] = 3221225472;
  v51[2] = __43__NTKCFaceDetailViewController_viewDidLoad__block_invoke_4;
  v51[3] = &unk_1E6BD2160;
  v51[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](currentSections, "enumerateObjectsUsingBlock:", v51);
  if (self->_descriptionSection && -[NSMutableArray count](self->_currentSections, "count") == 1)
    -[NTKCFaceDetailDescriptionSectionController setExpanded:](self->_descriptionSection, "setExpanded:", 1);
  -[NTKCFaceDetailViewController _updateShareButton](self, "_updateShareButton");
  -[NTKCFaceDetailViewController _faceDidChange](self, "_faceDidChange");

}

void __43__NTKCFaceDetailViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "collection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "collectionType");

  if (v8 == 1)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __43__NTKCFaceDetailViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1040);
  v4 = a2;
  objc_msgSend(v4, "setSection:", objc_msgSend(v3, "count"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "addObject:", v4);

}

void __43__NTKCFaceDetailViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  v3 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "monogramSlotForDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqualToString:", v5);

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_ensureOtherSection");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "addMonogramRowForSlot:", v7);
  }

}

void __43__NTKCFaceDetailViewController_viewDidLoad__block_invoke_4(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v5, "setHasSpacerRow:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "count") - 1 > a3);
  }

}

- (void)_faceDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *editOptionSections;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v22;
  double v23;
  double v24;
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
  double MaxY;
  uint64_t v41;
  void *v42;
  _QWORD v43[5];
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  if (-[NTKCFaceDetailViewController isViewLoaded](self, "isViewLoaded")
    && !self->_isSuppressingFaceDidChange)
  {
    v3 = (void *)MEMORY[0x1E0CB3498];
    -[NTKFace name](self->_face, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "NTKHyphenatableString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](self->_faceName, "setAttributedText:", v5);

    -[UILabel sizeToFit](self->_faceName, "sizeToFit");
    -[NTKFace name](self->_face, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackButtonTitle:", v6);

    editOptionSections = self->_editOptionSections;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __46__NTKCFaceDetailViewController__faceDidChange__block_invoke;
    v43[3] = &unk_1E6BD2110;
    v43[4] = self;
    -[NSMutableArray enumerateObjectsUsingBlock:](editOptionSections, "enumerateObjectsUsingBlock:", v43);
    -[NSMutableArray enumerateObjectsUsingBlock:](self->_currentSections, "enumerateObjectsUsingBlock:", &__block_literal_global_48);
    if (self->_editOptionToMakeFullyVisible)
    {
      -[UITableView indexPathForCell:](self->_tableView, "indexPathForCell:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView rectForRowAtIndexPath:](self->_tableView, "rectForRowAtIndexPath:", v9);
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      -[UITableView rectForHeaderInSection:](self->_tableView, "rectForHeaderInSection:", objc_msgSend(v9, "section"));
      x = v44.origin.x;
      y = v44.origin.y;
      width = v44.size.width;
      height = v44.size.height;
      v22 = v13 - CGRectGetHeight(v44);
      v45.origin.x = x;
      v45.origin.y = y;
      v45.size.width = width;
      v45.size.height = height;
      v23 = v17 + CGRectGetHeight(v45);
      -[UITableView bounds](self->_tableView, "bounds");
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v31 = v30;
      -[UITableView contentInset](self->_tableView, "contentInset");
      v33 = v25 + v32;
      v35 = v27 + v34;
      v37 = v29 - (v32 + v36);
      v39 = v31 - (v34 + v38);
      v46.origin.x = v33;
      v46.origin.y = v35;
      v46.size.width = v37;
      v46.size.height = v39;
      v49.origin.x = v11;
      v49.origin.y = v22;
      v49.size.width = v15;
      v49.size.height = v23;
      if (!CGRectContainsRect(v46, v49))
      {
        v47.origin.x = v11;
        v47.origin.y = v22;
        v47.size.width = v15;
        v47.size.height = v23;
        MaxY = CGRectGetMaxY(v47);
        v48.origin.x = v33;
        v48.origin.y = v35;
        v48.size.width = v37;
        v48.size.height = v39;
        if (MaxY <= CGRectGetMaxY(v48))
          v41 = 1;
        else
          v41 = 3;
        -[UITableView scrollToRowAtIndexPath:atScrollPosition:animated:](self->_tableView, "scrollToRowAtIndexPath:atScrollPosition:animated:", v9, v41, 1);
      }
      -[NTKCFaceDetailViewController setEditOptionToMakeFullyVisible:](self, "setEditOptionToMakeFullyVisible:", 0);

    }
    -[NTKCFaceDetailViewController view](self, "view");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setNeedsLayout");

  }
}

void __46__NTKCFaceDetailViewController__faceDidChange__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  objc_msgSend(a2, "collection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "collectionType") == 5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_addOrRemoveDynamicSectionsWithCollection:", v6);
    *a4 = 1;
  }

}

uint64_t __46__NTKCFaceDetailViewController__faceDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "faceDidChange");
}

- (void)_faceChangedOptionsForEditMode:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NTKCFaceDetailViewController *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NTKFace *face;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  UITableView *tableView;
  void *v32;
  UITableView *v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  id obj;
  uint64_t v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  -[NTKFace editOptionsForCustomEditModes](self->_face, "editOptionsForCustomEditModes");
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v45;
    v34 = *(_QWORD *)v45;
    v35 = a3;
    do
    {
      v7 = 0;
      v36 = v5;
      do
      {
        if (*(_QWORD *)v45 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v7);
        if (objc_msgSend(v8, "mode") == a3)
        {
          v38 = v7;
          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          v9 = self;
          v10 = self->_editOptionSections;
          v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v41;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v41 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
                objc_msgSend(v15, "collection");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v16, "mode");
                v18 = objc_msgSend(v8, "mode");

                if (v17 == v18)
                {
                  objc_msgSend(v15, "collection");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "slot");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "slot");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v20 == v21)
                  {
                    -[NTKFace selectedOptionsForCustomEditModes](v9->_face, "selectedOptionsForCustomEditModes");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v23 = (void *)objc_msgSend(v22, "mutableCopy");

                    objc_msgSend(v8, "slot");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v24)
                    {
                      face = v9->_face;
                      v26 = objc_msgSend(v8, "mode");
                      objc_msgSend(v8, "slot");
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NTKFace selectedOptionForCustomEditMode:slot:](face, "selectedOptionForCustomEditMode:slot:", v26, v27);
                      v28 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "mode"));
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v23, "setObject:forKeyedSubscript:", v28, v29);

                      v9 = self;
                    }
                    if (objc_msgSend(v15, "collectionChanged:withSelectedOptions:", v8, v23))
                    {
                      v30 = -[NSMutableArray indexOfObject:](v9->_currentSections, "indexOfObject:", v15);
                      tableView = self->_tableView;
                      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v30);
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      v33 = tableView;
                      v9 = self;
                      -[UITableView reloadSections:withRowAnimation:](v33, "reloadSections:withRowAnimation:", v32, 5);

                    }
                  }
                }
              }
              v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
            }
            while (v12);
          }

          v6 = v34;
          a3 = v35;
          v5 = v36;
          v7 = v38;
        }
        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v5);
  }

}

- (void)_faceDidChangeResourceDirectory
{
  if (-[NTKCFaceDetailViewController isViewLoaded](self, "isViewLoaded"))
    -[NSMutableArray enumerateObjectsUsingBlock:](self->_currentSections, "enumerateObjectsUsingBlock:", &__block_literal_global_29_0);
}

uint64_t __63__NTKCFaceDetailViewController__faceDidChangeResourceDirectory__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "faceDidChangeResourceDirectory");
}

- (id)_sectionForEditOptionCollection:(id)a3
{
  id v4;
  NTKCFaceDetailKaleidoscopeContentSectionController *v5;
  NTKCFaceDetailPigmentSectionController *v6;
  NTKFace *face;
  _BOOL8 inGallery;
  void *v9;
  NTKCFaceDetailPigmentSectionController *v10;
  uint64_t v11;
  NTKCFaceDetailPhotosSectionController *v12;
  NTKFace *v13;
  _BOOL8 v14;
  void *v15;
  NTKCFaceDetailPhotosSectionController *v16;
  NTKCFaceDetailKaleidoscopeContentSectionController *v17;
  NTKCFaceDetailKaleidoscopeStyleSectionController *v19;
  NTKFace *v20;
  _BOOL8 v21;
  void *v22;
  NTKCFaceDetailKaleidoscopeStyleSectionController *v23;
  NTKCFaceDetailKaleidoscopeContentSectionController *v24;
  NTKFace *v25;
  _BOOL8 v26;
  void *v27;
  NTKCFaceDetailKaleidoscopeContentSectionController *v28;
  NSArray *externalAssets;
  NTKCFaceDetailKaleidoscopeContentSectionController *kaleidoscopeContentSection;
  void *v31;
  NTKCFaceDetailEditOptionSectionController *v32;
  NTKFace *v33;
  _BOOL8 v34;
  void *v35;

  v4 = a3;
  if (objc_msgSend(v4, "collectionType") != 3)
  {
    if (+[NTKCFaceDetailPigmentSectionController hasSectionForFace:forEditMode:](NTKCFaceDetailPigmentSectionController, "hasSectionForFace:forEditMode:", self->_face, objc_msgSend(v4, "mode")))
    {
      v6 = [NTKCFaceDetailPigmentSectionController alloc];
      face = self->_face;
      inGallery = self->_inGallery;
      -[NTKFaceViewController faceView](self->_faceVC, "faceView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NTKCFaceDetailPigmentSectionController initWithTableViewController:face:inGallery:editOptionCollection:faceView:](v6, "initWithTableViewController:face:inGallery:editOptionCollection:faceView:", self, face, inGallery, v4, v9);
      -[NTKCFaceDetailViewController setPigmentSection:](self, "setPigmentSection:", v10);

      v11 = 1096;
      -[NTKCFaceDetailEditOptionSectionController setDelegate:](self->_pigmentSection, "setDelegate:", self);
      -[NTKCFaceDetailPigmentSectionController setParentViewController:](self->_pigmentSection, "setParentViewController:", self);
    }
    else
    {
      if (+[NTKCFaceDetailPhotosSectionController hasPhotosSectionForFace:forEditMode:](NTKCFaceDetailPhotosSectionController, "hasPhotosSectionForFace:forEditMode:", self->_face, objc_msgSend(v4, "mode")))
      {
        v12 = [NTKCFaceDetailPhotosSectionController alloc];
        v13 = self->_face;
        v14 = self->_inGallery;
        -[NTKFaceViewController faceView](self->_faceVC, "faceView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[NTKCFaceDetailPhotosSectionController initWithTableViewController:face:inGallery:editOptionCollection:faceView:externalAssets:](v12, "initWithTableViewController:face:inGallery:editOptionCollection:faceView:externalAssets:", self, v13, v14, v4, v15, self->_externalAssets);
        -[NTKCFaceDetailViewController setPhotosSection:](self, "setPhotosSection:", v16);

        v11 = 1064;
        -[NTKCFaceDetailPhotosSectionController setParentViewController:](self->_photosSection, "setParentViewController:", self);
      }
      else
      {
        if (+[NTKCFaceDetailKaleidoscopeContentSectionController hasSectionForFace:forEditMode:](NTKCFaceDetailKaleidoscopeContentSectionController, "hasSectionForFace:forEditMode:", self->_face, objc_msgSend(v4, "mode")))
        {
          if (!+[NTKCFaceDetailKaleidoscopeContentSectionController supressesSectionForExternalAssets:](NTKCFaceDetailKaleidoscopeContentSectionController, "supressesSectionForExternalAssets:", self->_externalAssets))
          {
            v24 = [NTKCFaceDetailKaleidoscopeContentSectionController alloc];
            v25 = self->_face;
            v26 = self->_inGallery;
            -[NTKFaceViewController faceView](self->_faceVC, "faceView");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = -[NTKCFaceDetailKaleidoscopeContentSectionController initWithTableViewController:face:inGallery:editOptionCollection:faceView:](v24, "initWithTableViewController:face:inGallery:editOptionCollection:faceView:", self, v25, v26, v4, v27);
            -[NTKCFaceDetailViewController setKaleidoscopeContentSection:](self, "setKaleidoscopeContentSection:", v28);

            -[NTKCFaceDetailKaleidoscopeContentSectionController setParentViewController:](self->_kaleidoscopeContentSection, "setParentViewController:", self);
            -[NTKCFaceDetailKaleidoscopeContentSectionController setDelegate:](self->_kaleidoscopeContentSection, "setDelegate:", self);
            externalAssets = self->_externalAssets;
            if (externalAssets)
            {
              kaleidoscopeContentSection = self->_kaleidoscopeContentSection;
              -[NSArray firstObject](externalAssets, "firstObject");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[NTKCFaceDetailKaleidoscopeContentSectionController setExternalAsset:](kaleidoscopeContentSection, "setExternalAsset:", v31);

            }
          }
          v17 = self->_kaleidoscopeContentSection;
          goto LABEL_9;
        }
        if (!+[NTKCFaceDetailKaleidoscopeStyleSectionController hasSectionForFace:forEditMode:](NTKCFaceDetailKaleidoscopeStyleSectionController, "hasSectionForFace:forEditMode:", self->_face, objc_msgSend(v4, "mode")))
        {
          v32 = [NTKCFaceDetailEditOptionSectionController alloc];
          v33 = self->_face;
          v34 = self->_inGallery;
          -[NTKFaceViewController faceView](self->_faceVC, "faceView");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = -[NTKCFaceDetailEditOptionSectionController initWithTableViewController:face:inGallery:editOptionCollection:faceView:](v32, "initWithTableViewController:face:inGallery:editOptionCollection:faceView:", self, v33, v34, v4, v35);

          -[NTKCFaceDetailKaleidoscopeContentSectionController setDelegate:](v5, "setDelegate:", self);
          goto LABEL_10;
        }
        v19 = [NTKCFaceDetailKaleidoscopeStyleSectionController alloc];
        v20 = self->_face;
        v21 = self->_inGallery;
        -[NTKFaceViewController faceView](self->_faceVC, "faceView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[NTKCFaceDetailEditOptionHorizontalSectionController initWithTableViewController:face:inGallery:editOptionCollection:faceView:](v19, "initWithTableViewController:face:inGallery:editOptionCollection:faceView:", self, v20, v21, v4, v22);
        -[NTKCFaceDetailViewController setKaleidoscopeStyleSection:](self, "setKaleidoscopeStyleSection:", v23);

        v11 = 1080;
      }
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v11), "setDelegate:", self);
    }
    v17 = *(NTKCFaceDetailKaleidoscopeContentSectionController **)((char *)&self->super.super.super.isa + v11);
LABEL_9:
    v5 = v17;
    goto LABEL_10;
  }
  -[NTKCFaceDetailViewController _ensureOtherSection](self, "_ensureOtherSection");
  -[NTKCFaceDetailOtherSectionController addShowSecondsRow:](self->_otherSection, "addShowSecondsRow:", v4);
  v5 = 0;
LABEL_10:

  return v5;
}

- (void)_ensureOtherSection
{
  NTKCFaceDetailOtherSectionController *v3;

  if (!self->_otherSection)
  {
    v3 = -[NTKCFaceDetailSectionController initWithTableViewController:face:inGallery:]([NTKCFaceDetailOtherSectionController alloc], "initWithTableViewController:face:inGallery:", self, self->_face, self->_inGallery);
    -[NTKCFaceDetailViewController setOtherSection:](self, "setOtherSection:", v3);

    -[NTKCFaceDetailOtherSectionController setDelegate:](self->_otherSection, "setDelegate:", self);
  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  CGFloat v10;
  int IsRTL;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  double *v52;
  double v53;
  double MinX;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  CGFloat v73;
  CGFloat v74;
  double MaxX;
  double v76;
  double MinY;
  double v78;
  double v79;
  double v80;
  CGFloat v81;
  double v82;
  CGFloat v83;
  double v84;
  double v85;
  double Height;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double intrinsicHeaderHeight;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  uint64_t v101;
  CGFloat v102;
  double v103;
  double v104;
  double v105;
  CGFloat v106;
  double v107;
  double v108;
  double v109;
  double v110;
  CGFloat v111;
  double Width;
  CGFloat rect;
  _OWORD v114[3];
  __int128 v115;
  __int128 v116;
  double v117;
  objc_super v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;

  v118.receiver = self;
  v118.super_class = (Class)NTKCFaceDetailViewController;
  -[NTKCFaceDetailViewController viewDidLayoutSubviews](&v118, sel_viewDidLayoutSubviews);
  -[NTKCFaceDetailViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  rect = v8;
  v10 = v9;

  IsRTL = CLKLayoutIsRTL();
  v117 = 0.0;
  v115 = 0u;
  v116 = 0u;
  memset(v114, 0, sizeof(v114));
  -[_NTKCDetailHeaderView frame](self->_headerView, "frame", _LayoutConstants_15((uint64_t)v114));
  -[UITableView contentInset](self->_tableView, "contentInset");
  v13 = v12;
  -[UITableView contentOffset](self->_tableView, "contentOffset");
  v15 = v13 + v14;
  -[UITableView _systemContentInset](self->_tableView, "_systemContentInset");
  v17 = v15 + v16;
  v18 = v15 + v16 < 0.0 && self->_intrinsicHeaderHeight != 0.0;
  -[NTKCFaceContainerView frame](self->_faceContainer, "frame");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[NTKCFaceDetailViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "safeAreaInsets");
  v110 = v28;

  v108 = v10;
  v109 = v5;
  v119.origin.x = v5;
  v29 = v7;
  v119.origin.y = v7;
  v119.size.width = rect;
  v119.size.height = v10;
  Width = CGRectGetWidth(v119);
  v106 = v24;
  if (v18)
  {
    v30 = self->_intrinsicHeaderHeight - v17;
  }
  else
  {
    v31 = *(double *)&v115;
    v120.origin.x = v20;
    v120.origin.y = v22;
    v120.size.width = v24;
    v120.size.height = v26;
    v30 = v31 + v31 + CGRectGetHeight(v120);
  }
  v32 = v110;
  v33 = v20;
  v34 = v29;
  -[_NTKCDetailHeaderView setFrame:](self->_headerView, "setFrame:", 0.0, v110, Width, v30);
  if (self->_intrinsicHeaderHeight == 0.0)
  {
    v121.origin.x = 0.0;
    v121.origin.y = v110;
    v121.size.width = Width;
    v121.size.height = v30;
    self->_intrinsicHeaderHeight = CGRectGetHeight(v121);
  }
  v111 = v30;
  if (v18)
  {
    -[NTKCFaceContainerView center](self->_faceContainer, "center");
    v36 = v35;
    MEMORY[0x1BCCA72B8](-[_NTKCDetailHeaderView bounds](self->_headerView, "bounds"));
    -[NTKCFaceContainerView setCenter:](self->_faceContainer, "setCenter:", v36);
    -[NTKCFaceContainerView frame](self->_faceContainer, "frame");
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v45 = rect;
  }
  else
  {
    if (self->_inGallery)
    {
      v45 = rect;
      if (IsRTL)
      {
        v122.size.height = v108;
        v122.origin.x = v109;
        v122.origin.y = v29;
        v122.size.width = rect;
        CGRectGetWidth(v122);
        v123.origin.x = v33;
        v123.origin.y = v22;
        v123.size.width = v106;
        v123.size.height = v26;
        CGRectGetWidth(v123);
      }
      v46 = NTKCScreenEdgeMargin();
    }
    else
    {
      -[_NTKCDetailHeaderView bounds](self->_headerView, "bounds");
      v101 = 0;
      UIRectCenteredXInRectScale();
      v45 = rect;
    }
    -[_NTKCDetailHeaderView bounds](self->_headerView, "bounds", v46, v101);
    UIRectCenteredYInRectScale();
    v38 = v47;
    v40 = v48;
    v42 = v49;
    v44 = v50;
    -[NTKCFaceContainerView setFrame:](self->_faceContainer, "setFrame:", 0);
  }
  if (self->_inGallery)
  {
    v51 = NTKCScreenStyle();
    v52 = (double *)&v115 + 1;
    if (v51 == -1)
      v52 = (double *)&v116;
    v53 = *v52;
    v105 = v34;
    if (IsRTL)
    {
      v124.origin.x = v38;
      v124.origin.y = v40;
      v124.size.width = v42;
      v124.size.height = v44;
      MinX = CGRectGetMinX(v124);
    }
    else
    {
      v125.size.height = v108;
      v125.origin.x = v109;
      v125.origin.y = v34;
      v125.size.width = v45;
      v55 = CGRectGetWidth(v125);
      v126.origin.x = v38;
      v126.origin.y = v40;
      v126.size.width = v42;
      v126.size.height = v44;
      MinX = v55 - CGRectGetMaxX(v126);
    }
    v56 = MinX - v53 - NTKCScreenEdgeMargin();
    -[UILabel sizeThatFits:](self->_faceName, "sizeThatFits:", v56, 1.79769313e308);
    v104 = v57;
    -[UILabel frame](self->_faceName, "frame");
    if (IsRTL)
    {
      v61 = v58;
      v62 = v59;
      v127.origin.x = v38;
      v127.origin.y = v40;
      v127.size.width = v42;
      v102 = v60;
      v127.size.height = v44;
      v103 = v38;
      v63 = CGRectGetMinX(v127) - v53;
      v128.origin.x = v61;
      v128.origin.y = v62;
      v128.size.width = v56;
      v128.size.height = v102;
      v64 = v63 - CGRectGetWidth(v128);
      v38 = v103;
    }
    else
    {
      v129.origin.x = v38;
      v129.origin.y = v40;
      v129.size.width = v42;
      v129.size.height = v44;
      v64 = v53 + CGRectGetMaxX(v129);
    }
    v130.origin.x = v38;
    v130.origin.y = v40;
    v130.size.width = v42;
    v130.size.height = v44;
    v65 = CGRectGetMinY(v130) + *((double *)&v116 + 1);
    -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_faceName, "_firstLineBaselineOffsetFromBoundsTop");
    v67 = v65 - v66;
    -[UILabel setFrame:](self->_faceName, "setFrame:", v64, v67, v56, v104);
    -[UIButton frame](self->_addButton, "frame");
    v107 = v70;
    v72 = v71;
    if (IsRTL)
    {
      v73 = v68;
      v74 = v69;
      v131.origin.x = v64;
      v131.origin.y = v67;
      v131.size.width = v56;
      v131.size.height = v104;
      MaxX = CGRectGetMaxX(v131);
      v132.origin.x = v73;
      v132.origin.y = v74;
      v132.size.width = v107;
      v132.size.height = v72;
      v76 = MaxX - CGRectGetWidth(v132);
    }
    else
    {
      v133.origin.x = v64;
      v133.origin.y = v67;
      v133.size.width = v56;
      v133.size.height = v104;
      v76 = CGRectGetMinX(v133);
    }
    v45 = rect;
    v134.origin.x = v64;
    v134.origin.y = v67;
    v134.size.width = v56;
    v134.size.height = v104;
    MinY = CGRectGetMinY(v134);
    -[UILabel _lastLineBaseline](self->_faceName, "_lastLineBaseline");
    v79 = MinY + v78 + v117;
    -[UIButton setFrame:](self->_addButton, "setFrame:", v76, v79, v107, v72);
    -[UIActivityIndicatorView frame](self->_addSpinner, "frame");
    -[UIActivityIndicatorView setFrame:](self->_addSpinner, "setFrame:", v76, v79);
    v34 = v105;
    v32 = v110;
  }
  -[UIView frame](self->_headerSeparator, "frame");
  v81 = v80;
  v83 = v82;
  v85 = v84;
  v135.origin.x = 0.0;
  v135.origin.y = v32;
  v135.size.height = v111;
  v135.size.width = Width;
  Height = CGRectGetHeight(v135);
  v136.origin.x = 0.0;
  v136.origin.y = v81;
  v136.size.width = v83;
  v136.size.height = v85;
  v87 = Height - CGRectGetHeight(v136);
  v137.origin.x = v109;
  v137.origin.y = v34;
  v137.size.width = v45;
  v137.size.height = v108;
  -[UIView setFrame:](self->_headerSeparator, "setFrame:", 0.0, v87, CGRectGetWidth(v137), v85);
  -[UITableView setFrame:](self->_tableView, "setFrame:", v109, v34, v45, v108);
  -[UITableView contentOffset](self->_tableView, "contentOffset");
  v89 = v88;
  v91 = v90;
  intrinsicHeaderHeight = self->_intrinsicHeaderHeight;
  -[UITableView contentInset](self->_tableView, "contentInset");
  if (v93 != intrinsicHeaderHeight)
  {
    v94 = intrinsicHeaderHeight - v93;
    -[UITableView setContentInset:](self->_tableView, "setContentInset:", intrinsicHeaderHeight);
    -[UITableView setContentOffset:](self->_tableView, "setContentOffset:", v89, v91 - v94);
  }
  -[UITableView verticalScrollIndicatorInsets](self->_tableView, "verticalScrollIndicatorInsets");
  v96 = v95;
  v98 = v97;
  v100 = v99;
  v138.origin.x = 0.0;
  v138.origin.y = v32;
  v138.size.width = Width;
  v138.size.height = v111;
  -[UITableView setVerticalScrollIndicatorInsets:](self->_tableView, "setVerticalScrollIndicatorInsets:", CGRectGetHeight(v138), v96, v98, v100);
}

- (void)viewWillAppear:(BOOL)a3
{
  void (**selectionFinishedHandler)(void);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKCFaceDetailViewController;
  -[NTKCFaceDetailViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  selectionFinishedHandler = (void (**)(void))self->_selectionFinishedHandler;
  if (selectionFinishedHandler)
    selectionFinishedHandler[2]();
}

- (void)viewDidAppear:(BOOL)a3
{
  __CFString **v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKCFaceDetailViewController;
  -[NTKCFaceDetailViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  if (self->_inGallery)
    v4 = kNTKCCAnalyticsFaceDetailsGallery;
  else
    v4 = kNTKCCAnalyticsFaceDetailsLibrary;
  NTKCCAnalyticsIncrement(*v4);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKCFaceDetailViewController;
  -[NTKCFaceDetailViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[NTKCFaceDetailViewController _dismissModalViewControllerPresentedByThisViewControllerAnimated:](self, "_dismissModalViewControllerPresentedByThisViewControllerAnimated:", 0);
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  objc_super v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[NTKCFaceDetailViewController setModalViewControllerPresentedByThisViewController:](self, "setModalViewControllerPresentedByThisViewController:", v9);
  v10.receiver = self;
  v10.super_class = (Class)NTKCFaceDetailViewController;
  -[NTKCFaceDetailViewController presentViewController:animated:completion:](&v10, sel_presentViewController_animated_completion_, v9, v5, v8);

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a3;
  v6 = a4;
  -[NTKCFaceDetailViewController setModalViewControllerPresentedByThisViewController:](self, "setModalViewControllerPresentedByThisViewController:", 0);
  v7.receiver = self;
  v7.super_class = (Class)NTKCFaceDetailViewController;
  -[NTKCFaceDetailViewController dismissViewControllerAnimated:completion:](&v7, sel_dismissViewControllerAnimated_completion_, v4, v6);

}

- (void)_dismissModalViewControllerPresentedByThisViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  -[NTKCFaceDetailViewController presentedViewController](self, "presentedViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[NTKCFaceDetailViewController presentedViewController](self, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailViewController modalViewControllerPresentedByThisViewController](self, "modalViewControllerPresentedByThisViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v8)
      -[NTKCFaceDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v3, 0);
  }
}

- (void)setFace:(id)a3
{
  NTKFace *v5;
  NTKFace *face;
  NTKFace *v7;

  v5 = (NTKFace *)a3;
  face = self->_face;
  if (face != v5)
  {
    v7 = v5;
    -[NTKFace removeObserver:](face, "removeObserver:", self);
    objc_storeStrong((id *)&self->_face, a3);
    -[NTKFace addObserver:](self->_face, "addObserver:", self);
    v5 = v7;
  }

}

- (void)setLibrary:(id)a3
{
  NTKFaceCollection *v5;
  NTKFaceCollection *library;
  NTKFaceCollection *v7;

  v5 = (NTKFaceCollection *)a3;
  library = self->_library;
  if (library != v5)
  {
    v7 = v5;
    -[NTKFaceCollection removeObserver:](library, "removeObserver:", self);
    objc_storeStrong((id *)&self->_library, a3);
    -[NTKFaceCollection addObserver:](self->_library, "addObserver:", self);
    -[NTKCFaceDetailViewController _updateAddButton](self, "_updateAddButton");
    v5 = v7;
  }

}

- (void)_loadLibrary
{
  void *v3;
  void *v4;
  id v5;

  +[NTKCompanionFaceCollectionsManager sharedInstance](NTKCompanionFaceCollectionsManager, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKFace device](self->_face, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharedFaceCollectionForDevice:forCollectionIdentifier:", v3, CFSTR("LibraryFaces"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCFaceDetailViewController setLibrary:](self, "setLibrary:", v4);

}

- (void)_setComplication:(id)a3 forSlot:(id)a4
{
  NTKFace *face;
  id v7;
  id v8;
  void *v9;
  id v10;

  face = self->_face;
  v7 = a4;
  v8 = a3;
  -[NTKFace complicationForSlot:](face, "complicationForSlot:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKFace setComplication:forSlot:](self->_face, "setComplication:forSlot:", v8, v7);
  -[NTKFaceViewController faceView](self->_faceVC, "faceView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applyTransitionFraction:fromComplication:toComplication:slot:", v10, v8, v7, 1.0);

  objc_msgSend(v9, "cleanupAfterEditing");
  -[NTKCFaceDetailViewController _setFaceHasBeenEdited](self, "_setFaceHasBeenEdited");
  -[NTKCFaceDetailViewController _updateAddButton](self, "_updateAddButton");

}

- (void)_reloadEditOptionSectionsDependentOnNTKEditModeComplications
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[NTKCFaceDetailViewController editOptionSections](self, "editOptionSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v8, "collection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "mode");

        -[NTKFaceViewController faceView](self->_faceVC, "faceView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_opt_class();
        -[NTKFace device](self->_face, "device");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "swatchForEditModeDependsOnOptions:forDevice:", v10, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        v17 = v15;
        if (v16)
        {
          v18 = v16;
          v19 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v22 != v19)
                objc_enumerationMutation(v15);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "integerValue") == 1)
              {

                objc_msgSend(v8, "cell");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  objc_msgSend(v17, "reloadVisibleCells");
                goto LABEL_17;
              }
            }
            v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v18)
              continue;
            break;
          }
          v17 = v15;
        }
LABEL_17:

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v5);
  }

}

- (void)_setEditOption:(id)a3 forMode:(int64_t)a4 slot:(id)a5
{
  -[NTKCFaceDetailViewController _setEditOption:forMode:slot:transiently:](self, "_setEditOption:forMode:slot:transiently:", a3, a4, a5, 0);
}

- (void)_setEditOption:(id)a3 forMode:(int64_t)a4 slot:(id)a5 transiently:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a6;
  v13 = a3;
  v10 = a5;
  -[NTKFace selectedOptionForCustomEditMode:slot:](self->_face, "selectedOptionForCustomEditMode:slot:", a4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 10 && !v6 || (objc_msgSend(v13, "isEqual:", v11) & 1) == 0)
  {
    if (v6)
    {
      -[NTKFaceViewController faceView](self->_faceVC, "faceView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setOption:forCustomEditMode:slot:", v13, a4, v10);

    }
    else
    {
      -[NTKFace selectOption:forCustomEditMode:slot:](self->_face, "selectOption:forCustomEditMode:slot:", v13, a4, v10);
      -[NTKCFaceDetailViewController _setFaceHasBeenEdited](self, "_setFaceHasBeenEdited");
    }
  }

}

- (BOOL)_isEditOptionFullyVisible:(id)a3
{
  NTKCFaceDetailViewController *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v3 = self;
  -[UITableView indexPathForCell:](self->_tableView, "indexPathForCell:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView rectForRowAtIndexPath:](v3->_tableView, "rectForRowAtIndexPath:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UITableView rectForHeaderInSection:](v3->_tableView, "rectForHeaderInSection:", objc_msgSend(v4, "section"));
  x = v34.origin.x;
  y = v34.origin.y;
  width = v34.size.width;
  height = v34.size.height;
  v17 = v8 - CGRectGetHeight(v34);
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v18 = v12 + CGRectGetHeight(v35);
  -[UITableView bounds](v3->_tableView, "bounds");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[UITableView contentInset](v3->_tableView, "contentInset");
  v28 = v22 + v27;
  v31 = v24 - (v29 + v30);
  v36.size.height = v26 - (v27 + v32);
  v36.origin.x = v20 + v29;
  v36.origin.y = v28;
  v36.size.width = v31;
  v37.origin.x = v6;
  v37.origin.y = v17;
  v37.size.width = v10;
  v37.size.height = v18;
  LOBYTE(v3) = CGRectContainsRect(v36, v37);

  return (char)v3;
}

- (void)_setFaceHasBeenEdited
{
  __CFString **v3;
  NTKFace *face;
  void *v5;
  __CFString *v6;

  if (!self->_faceHasBeenEdited)
  {
    self->_faceHasBeenEdited = 1;
    if (self->_inGallery)
      v3 = kNTKCCAnalyticsEditFaceGallery;
    else
      v3 = kNTKCCAnalyticsEditFaceLibrary;
    v6 = *v3;
    NTKCCAnalyticsIncrement(v6);
    face = self->_face;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFace setLastEditedDate:](face, "setLastEditedDate:", v5);

    -[NTKFace incrementNumberOfCompanionEdits](self->_face, "incrementNumberOfCompanionEdits");
    -[NTKFace setEditedState:](self->_face, "setEditedState:", 2);

  }
}

- (void)_updateAddButton
{
  id v3;

  if (self->_face)
  {
    if (self->_addButton)
    {
      -[NTKCFaceDetailViewController reasonFaceCanNotBeAddedToLibrary](self, "reasonFaceCanNotBeAddedToLibrary");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      -[UIButton setDisabled:forReason:](self->_addButton, "setDisabled:forReason:", objc_msgSend(v3, "length") != 0, v3);

    }
  }
}

- (NSString)reasonFaceCanNotBeAddedToLibrary
{
  NTKFace *face;
  NTKFaceCollection *library;
  char v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v11;

  face = self->_face;
  library = self->_library;
  v11 = 0;
  v5 = NTKCanAddWatchFace(face, library, &v11);
  v6 = v11;
  v7 = v6;
  v8 = 0;
  if ((v5 & 1) == 0)
  {
    -[NTKCFaceDetailViewController _errorMessageForErrorCode:](self, "_errorMessageForErrorCode:", objc_msgSend(v6, "code"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[NTKFace faceStyle](self->_face, "faceStyle") == 22
    && !-[NTKCFaceDetailPhotosSectionController canAddFace](self->_photosSection, "canAddFace"))
  {
    NTKClockFaceLocalizedString(CFSTR("ACTION_ADD_DISABLED_NO_CUSTOM_PHOTOS"), CFSTR("You must choose photos."));
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }

  return (NSString *)v8;
}

- (id)_errorMessageForErrorCode:(int64_t)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  NTKFace *face;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, void *, _BYTE *);
  void *v27;
  NTKCFaceDetailViewController *v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  switch(a3)
  {
    case 1:
    case 11:
      v4 = CFSTR("ACTION_ADD_DISABLED_NOT_SUPPORTED_DEVICE");
      v5 = CFSTR("wrong device");
      goto LABEL_15;
    case 2:
      v31 = 0;
      v32 = &v31;
      v33 = 0x2020000000;
      v34 = 0;
      v6 = (void *)objc_opt_new();
      -[NTKFace device](self->_face, "device");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "nrDeviceVersion");

      if (HIWORD(v8) <= 4u)
      {
        NTKNewToGloryComplicationTypes();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addIndexes:", v9);

      }
      -[NTKFace device](self->_face, "device");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "nrDeviceVersion");

      if (!(v11 >> 18))
      {
        NTKNewToFortuneComplicationTypes();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addIndexes:", v12);

      }
      face = self->_face;
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __58__NTKCFaceDetailViewController__errorMessageForErrorCode___block_invoke;
      v27 = &unk_1E6BD1360;
      v28 = self;
      v14 = v6;
      v29 = v14;
      v30 = &v31;
      -[NTKFace enumerateComplicationSlotsWithBlock:](face, "enumerateComplicationSlotsWithBlock:", &v24);
      if (v32[3])
      {
        NTKClockFaceLocalizedString(CFSTR("ACTION_ADD_DISABLED_GIZMO_VERSION_NOT_SUPPORTED_FOR_COMPLICATION"), CFSTR("gizmo version not supported for complication"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0CB3940];
        NTKComplicationTypeLocalizedLabelText(v32[3]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringWithFormat:", v15, v17, v24, v25, v26, v27, v28);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v18 = 0;
      }

      _Block_object_dispose(&v31, 8);
      return v18;
    case 3:
      v4 = CFSTR("ACTION_ADD_DISABLED_NO_DEVICE");
      v5 = CFSTR("no device");
      goto LABEL_15;
    case 5:
      v19 = (void *)MEMORY[0x1E0CB3940];
      NTKClockFaceLocalizedFormat(CFSTR("ACTION_ADD_DISABLED_FACE_LIMIT"), CFSTR("too many faces"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKFace device](self->_face, "device");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = NTKFaceLibraryMaxFaceCountForDevice(v21);
      goto LABEL_13;
    case 6:
      NTKClockFaceLocalizedString(CFSTR("ACTION_ADD_DISABLED_SINGULAR_FACE"), CFSTR("singular"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB3940];
      -[NTKFace name](self->_face, "name");
      v22 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v22;
LABEL_13:
      objc_msgSend(v19, "localizedStringWithFormat:", v20, v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      return v18;
    case 8:
      v4 = CFSTR("ACTION_ADD_DISABLED_NOT_SUPPORTED");
      v5 = CFSTR("not supported");
      goto LABEL_15;
    default:
      v4 = CFSTR("ACTION_ADD_DISABLED_CANNOT_ADD_FACE_ON_DEVICE");
      v5 = CFSTR("Sorry, this watch face is not available on this device.");
LABEL_15:
      NTKClockFaceLocalizedString(v4, v5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      return v18;
  }
}

uint64_t __58__NTKCFaceDetailViewController__errorMessageForErrorCode___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t result;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "face");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "complicationForSlot:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "complicationType");
  result = objc_msgSend(*(id *)(a1 + 40), "containsIndex:", v9);
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;
    *a3 = 1;
  }
  return result;
}

- (BOOL)_hasRemovedSystemApp
{
  NTKFace *face;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  face = self->_face;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__NTKCFaceDetailViewController__hasRemovedSystemApp__block_invoke;
  v5[3] = &unk_1E6BCFCE8;
  v5[4] = self;
  v5[5] = &v6;
  -[NTKFace enumerateComplicationSlotsWithBlock:](face, "enumerateComplicationSlotsWithBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __52__NTKCFaceDetailViewController__hasRemovedSystemApp__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "face");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "complicationForSlot:", v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "appBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.stocks.watchapp"));

    if (v9)
      v10 = 9;
    else
      v10 = 0;
  }
  else
  {
    v10 = objc_msgSend(v12, "complicationType");
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = +[NTKCompanion1stPartyApp complicationType:mapsToRemovedSystemAppOnDevice:](NTKCompanion1stPartyApp, "complicationType:mapsToRemovedSystemAppOnDevice:", v10, v11);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a3 = 1;

}

- (void)_addTapped
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (-[UIButton disabled](self->_addButton, "disabled"))
  {
    -[UIButton disabledReason](self->_addButton, "disabledReason");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      v3 = (void *)MEMORY[0x1E0DC3450];
      NTKClockFaceLocalizedString(CFSTR("ACTION_ADD_DISABLED_TITLE"), CFSTR("title"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v9, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = (void *)MEMORY[0x1E0DC3448];
      NTKClockFaceLocalizedString(CFSTR("ACTION_ADD_DISABLED_OK"), CFSTR("OK"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addAction:", v8);

      -[NTKCFaceDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
    }

  }
  else if (!-[NTKCFaceDetailViewController _hasRemovedSystemApp](self, "_hasRemovedSystemApp"))
  {
    -[NTKCFaceDetailViewController _addFace](self, "_addFace");
  }
}

- (void)_addFace
{
  NTKCFaceDetailPhotosSectionController *photosSection;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  NTKCFaceContainerView *faceContainer;
  void *v25;
  id v26;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  CGFloat v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  _QWORD v84[4];
  id v85;
  NTKCFaceDetailViewController *v86;
  id v87;
  _QWORD v88[5];
  _QWORD v89[4];
  _QWORD v90[2];
  _QWORD v91[5];
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;

  v91[3] = *MEMORY[0x1E0C80C00];
  if (-[NTKCFaceDetailPhotosSectionController hasChanges](self->_photosSection, "hasChanges"))
  {
    -[UIActivityIndicatorView startAnimating](self->_addSpinner, "startAnimating");
    -[UIButton setHidden:](self->_addButton, "setHidden:", 1);
    photosSection = self->_photosSection;
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __40__NTKCFaceDetailViewController__addFace__block_invoke;
    v88[3] = &unk_1E6BCD5F0;
    v88[4] = self;
    -[NTKCFaceDetailPhotosSectionController saveChangesWithCompletion:](photosSection, "saveChangesWithCompletion:", v88);
  }
  else
  {
    if (-[UIButton isHidden](self->_addButton, "isHidden"))
    {
      -[UIActivityIndicatorView stopAnimating](self->_addSpinner, "stopAnimating");
      -[UIButton setHidden:](self->_addButton, "setHidden:", 0);
    }
    v4 = (void *)-[NTKFace copy](self->_face, "copy");
    v5 = v4;
    if (self->_externalAssets)
      v6 = 8;
    else
      v6 = 6;
    objc_msgSend(v4, "setOrigin:", v6);
    if (objc_msgSend(v5, "editedState") == 2)
    {
      objc_msgSend(v5, "lastEditedDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setCreationDate:", v7);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setCreationDate:", v8);

      objc_msgSend(v5, "setEditedState:", 1);
    }
    -[NTKFaceCollection appendFace:suppressingCallbackToObserver:](self->_library, "appendFace:suppressingCallbackToObserver:", v5, 0);
    -[NTKFaceCollection setSelectedFace:suppressingCallbackToObserver:](self->_library, "setSelectedFace:suppressingCallbackToObserver:", v5, 0);
    NTKCCAnalyticsIncrement(kNTKCCAnalyticsAddFace[0]);
    -[UIButton setUserInteractionEnabled:](self->_addButton, "setUserInteractionEnabled:", 0);
    -[UIButton setSelected:](self->_addButton, "setSelected:", 1);
    -[NTKCFaceDetailViewController tabBarController](self, "tabBarController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[NTKCFaceDetailViewController tabBarController](self, "tabBarController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tabBar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "bounds");
      objc_msgSend(v11, "convertRect:toView:", 0);
      x = v92.origin.x;
      y = v92.origin.y;
      width = v92.size.width;
      height = v92.size.height;
      CGRectGetWidth(v92);
      objc_msgSend(v11, "items");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "count");
      UICeilToViewScale();
      v18 = v17;

      if (CLKLayoutIsRTL())
      {
        v93.origin.x = x;
        v93.origin.y = y;
        v93.size.width = width;
        v93.size.height = height;
        v18 = CGRectGetWidth(v93) - v18;
      }
      v94.origin.x = x;
      v94.origin.y = y;
      v94.size.width = width;
      v94.size.height = height;
      CGRectGetHeight(v94);
      UIFloorToViewScale();
      v20 = v19;
      v95.origin.x = x;
      v95.origin.y = y;
      v95.size.width = width;
      v95.size.height = height;
      v82 = v18 + CGRectGetMinX(v95);
      v96.origin.x = x;
      v96.origin.y = y;
      v96.size.width = width;
      v96.size.height = height;
      v81 = v20 + CGRectGetMinY(v96);
      v83 = v11;
      -[NTKCFaceContainerView snapshotViewAfterScreenUpdates:](self->_faceContainer, "snapshotViewAfterScreenUpdates:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKCFaceDetailViewController view](self, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "window");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addSubview:", v21);

      faceContainer = self->_faceContainer;
      -[NTKCFaceContainerView bounds](faceContainer, "bounds");
      -[NTKCFaceContainerView convertRect:toView:](faceContainer, "convertRect:toView:", 0);
      objc_msgSend(v21, "setFrame:");
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      v25 = (void *)MEMORY[0x1E0CD28B0];
      v84[0] = MEMORY[0x1E0C809B0];
      v84[1] = 3221225472;
      v84[2] = __40__NTKCFaceDetailViewController__addFace__block_invoke_2;
      v84[3] = &unk_1E6BCDCB8;
      v85 = v21;
      v86 = self;
      v87 = v5;
      v26 = v21;
      objc_msgSend(v25, "setCompletionBlock:", v84);
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setDuration:", 1.08);
      objc_msgSend(v27, "setFillMode:", *MEMORY[0x1E0CD2B60]);
      objc_msgSend(v27, "setRemovedOnCompletion:", 0);
      objc_msgSend(v27, "setKeyTimes:", &unk_1E6CA9A90);
      objc_msgSend(v26, "bounds");
      v28 = v97.origin.x;
      v29 = v97.origin.y;
      v30 = v97.size.width;
      v31 = v97.size.height;
      v32 = CGRectGetWidth(v97) * 0.1 * 0.5;
      v98.origin.x = v28;
      v98.origin.y = v29;
      v98.size.width = v30;
      v98.size.height = v31;
      v33 = CGRectGetHeight(v98) * 0.1 * 0.5;
      v34 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(v26, "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "position");
      objc_msgSend(v34, "valueWithCGPoint:");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v91[0] = v36;
      v37 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(v26, "center");
      v39 = v32 + v38;
      objc_msgSend(v26, "center");
      objc_msgSend(v37, "valueWithCGPoint:", v39, v40 - v33);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v91[1] = v41;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v82, v81);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v91[2] = v42;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 3);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setValues:", v43);

      LODWORD(v44) = 1053944709;
      LODWORD(v45) = 0;
      LODWORD(v46) = 0.75;
      LODWORD(v47) = 1.0;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v44, v45, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v90[0] = v48;
      LODWORD(v49) = 1058474557;
      LODWORD(v50) = 0.25;
      LODWORD(v51) = 0;
      LODWORD(v52) = 1.0;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v50, v51, v49, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v90[1] = v53;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 2);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setTimingFunctions:", v54);

      objc_msgSend(v26, "layer");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "addAnimation:forKey:", v27, 0);

      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setDuration:", 1.08);
      objc_msgSend(v27, "fillMode");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setFillMode:", v57);

      objc_msgSend(v56, "setRemovedOnCompletion:", 0);
      objc_msgSend(v27, "keyTimes");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setKeyTimes:", v58);

      objc_msgSend(v56, "setValues:", &unk_1E6CA9AA8);
      objc_msgSend(v27, "timingFunctions");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setTimingFunctions:", v59);

      objc_msgSend(v26, "layer");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "addAnimation:forKey:", v56, 0);

      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.rotation"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setDuration:", 1.08);
      objc_msgSend(v27, "fillMode");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setFillMode:", v62);

      objc_msgSend(v61, "setRemovedOnCompletion:", 0);
      objc_msgSend(v61, "setKeyTimes:", &unk_1E6CA9AC0);
      objc_msgSend(v61, "setValues:", &unk_1E6CA9AD8);
      v63 = *MEMORY[0x1E0CD3058];
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v89[0] = v64;
      LODWORD(v65) = 1063004406;
      LODWORD(v66) = 1059648963;
      LODWORD(v67) = 0;
      LODWORD(v68) = 1.0;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v65, v67, v66, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v89[1] = v69;
      LODWORD(v70) = 1049247089;
      LODWORD(v71) = 1062501089;
      LODWORD(v72) = 0;
      LODWORD(v73) = 1.0;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v70, v72, v71, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v89[2] = v74;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v63);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v89[3] = v75;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 4);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setTimingFunctions:", v76);

      objc_msgSend(v26, "layer");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "addAnimation:forKey:", v61, 0);

      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setDuration:", 1.08);
      objc_msgSend(v27, "fillMode");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setFillMode:", v79);

      objc_msgSend(v78, "setRemovedOnCompletion:", 0);
      objc_msgSend(v78, "setKeyTimes:", &unk_1E6CA9AF0);
      objc_msgSend(v78, "setValues:", &unk_1E6CA9B08);
      objc_msgSend(v26, "layer");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "addAnimation:forKey:", v78, 0);

      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
    else
    {
      -[NTKCFaceDetailViewController _addFaceEndedForFace:](self, "_addFaceEndedForFace:", v5);
    }

  }
}

uint64_t __40__NTKCFaceDetailViewController__addFace__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addFace");
}

uint64_t __40__NTKCFaceDetailViewController__addFace__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "_addFaceEndedForFace:", *(_QWORD *)(a1 + 48));
}

- (void)_addFaceEndedForFace:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB37D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("NTKCFaceDetailViewControllerDidAddFace"), v4);

}

- (_NTKCDetailHeaderView)headerView
{
  return self->_headerView;
}

- (BOOL)_isEditable
{
  _BOOL4 v3;

  v3 = -[NTKFace isEditable](self->_face, "isEditable");
  if (v3)
    LOBYTE(v3) = !self->_shared;
  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSMutableArray count](self->_currentSections, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[NSMutableArray objectAtIndexedSubscript:](self->_currentSections, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfRows");

  return v5;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  NSMutableArray *currentSections;
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;

  currentSections = self->_currentSections;
  v5 = a4;
  -[NSMutableArray objectAtIndexedSubscript:](currentSections, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "heightForRow:", v7);
  v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v4;
  double v5;
  double v6;

  -[NSMutableArray objectAtIndexedSubscript:](self->_currentSections, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "heightForHeaderView");
  v6 = v5;

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  NSMutableArray *currentSections;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  currentSections = self->_currentSections;
  v5 = a4;
  -[NSMutableArray objectAtIndexedSubscript:](currentSections, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "cellForRow:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[NSMutableArray objectAtIndexedSubscript:](self->_currentSections, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a4;
  objc_msgSend(a3, "cellForRowAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NTKCFaceDetailViewController _cellIsHiddenBehindHeader:](self, "_cellIsHiddenBehindHeader:", v7);

  if (v8)
  {
    v9 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_currentSections, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "canSelectRow:", objc_msgSend(v6, "row")))
      v11 = v6;
    else
      v11 = 0;
    v9 = v11;

  }
  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[NSMutableArray objectAtIndexedSubscript:](self->_currentSections, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "didSelectRow:", v7);
}

- (BOOL)_cellIsHiddenBehindHeader:(id)a3
{
  UITableView *tableView;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double MaxY;
  CGRect v24;
  CGRect v25;

  tableView = self->_tableView;
  objc_msgSend(a3, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[NTKCFaceDetailViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView convertRect:toView:](tableView, "convertRect:toView:", v13, v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v24.origin.x = v15;
  v24.origin.y = v17;
  v24.size.width = v19;
  v24.size.height = v21;
  MaxY = CGRectGetMaxY(v24);
  -[_NTKCDetailHeaderView frame](self->_headerView, "frame");
  return MaxY <= CGRectGetMaxY(v25);
}

- (id)_pruneRemovedOrRestrictedComplications:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  __CFString *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NTKFace device](self->_face, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKComplicationProvider providerForDevice:](NTKComplicationProvider, "providerForDevice:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "disabledComplicationTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v8 = (id)objc_msgSend(v4, "mutableCopy");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = v4;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v14, "complicationType"))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = v14;
              objc_msgSend(v15, "appBundleIdentifier");
              v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

              if (v16 == CFSTR("com.apple.stocks.watchapp") && objc_msgSend(v7, "containsIndex:", 9))
                objc_msgSend(v8, "removeObject:", v15);

            }
            else if (objc_msgSend(v7, "containsIndex:", objc_msgSend(v14, "complicationType")))
            {
              objc_msgSend(v8, "removeObject:", v14);
            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

    v4 = v18;
  }
  else
  {
    v8 = v4;
  }

  return v8;
}

- (id)_pruneComplicationsNotAvailableOnGizmo:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NTKFace device](self->_face, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "nrDeviceVersion");

  v22 = (id)objc_msgSend(v4, "mutableCopy");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    v11 = HIWORD(v6);
    v12 = v6 >> 18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "complicationType");
        if (v11 <= 4)
        {
          v16 = v15;
          NTKNewToGloryComplicationTypes();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "containsIndex:", v16);

          if (v18)
            objc_msgSend(v22, "removeObject:", v14);
          if (!v12)
          {
            NTKNewToFortuneComplicationTypes();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "containsIndex:", v16);

            if (v20)
              objc_msgSend(v22, "removeObject:", v14);
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

  return v22;
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  CGRect v11;

  -[UITableView contentInset](self->_tableView, "contentInset", a3);
  v5 = v4;
  -[UITableView contentOffset](self->_tableView, "contentOffset");
  v7 = v5 + v6;
  -[UITableView _systemContentInset](self->_tableView, "_systemContentInset");
  v9 = v7 + v8;
  if (self->_intrinsicHeaderHeight != 0.0 && v9 < 0.0
    || (-[_NTKCDetailHeaderView bounds](self->_headerView, "bounds"), CGRectGetHeight(v11) > self->_intrinsicHeaderHeight))
  {
    -[NTKCFaceDetailViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNeedsLayout");

  }
  -[UIView setHidden:](self->_headerSeparator, "setHidden:", v9 <= 0.0);
}

- (void)face:(id)a3 didChangeOptionsForEditMode:(int64_t)a4
{
  -[NTKCFaceDetailViewController _faceChangedOptionsForEditMode:](self, "_faceChangedOptionsForEditMode:", a4);
}

- (void)descriptionSection:(id)a3 didExpand:(BOOL)a4
{
  -[UITableView beginUpdates](self->_tableView, "beginUpdates", a3, a4);
  -[UITableView endUpdates](self->_tableView, "endUpdates");
}

- (void)editOptionSection:(id)a3 didModifyEditOption:(id)a4 transiently:(BOOL)a5 canceled:(BOOL)a6
{
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  self->_isSuppressingFaceDidChange = a5;
  v8 = a4;
  objc_msgSend(a3, "collection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v11, "mode");
  objc_msgSend(v11, "slot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCFaceDetailViewController _setEditOption:forMode:slot:transiently:](self, "_setEditOption:forMode:slot:transiently:", v8, v9, v10, self->_isSuppressingFaceDidChange);

}

- (void)editOptionSection:(id)a3 didSelectOptionAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "cellForRow:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NTKCFaceDetailViewController _isEditOptionFullyVisible:](self, "_isEditOptionFullyVisible:", v6))
    -[NTKCFaceDetailViewController setEditOptionToMakeFullyVisible:](self, "setEditOptionToMakeFullyVisible:", v6);
  objc_msgSend(v11, "collection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "collectionType") == 5)
    -[NTKCFaceDetailViewController _addOrRemoveDynamicSectionsWithCollection:](self, "_addOrRemoveDynamicSectionsWithCollection:", v7);
  objc_msgSend(v11, "optionAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "mode");
  objc_msgSend(v7, "slot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCFaceDetailViewController _setEditOption:forMode:slot:](self, "_setEditOption:forMode:slot:", v8, v9, v10);

}

- (void)_addOrRemoveDynamicSectionsWithCollection:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  NSMutableArray *v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *currentSections;
  void *v13;
  uint64_t v14;
  NSMutableArray *v15;
  void *v16;
  uint64_t v17;

  v4 = -[NTKFace numberOfDynamicSections](self->_face, "numberOfDynamicSections", a3);
  v5 = -[NSMutableArray count](self->_dynamicEditOptionSections, "count");
  v6 = v5;
  if (v4 <= v5)
  {
    if (v4 >= v5)
      goto LABEL_13;
    do
    {
      currentSections = self->_currentSections;
      -[NSMutableArray objectAtIndexedSubscript:](self->_dynamicEditOptionSections, "objectAtIndexedSubscript:", --v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[NSMutableArray indexOfObject:](currentSections, "indexOfObject:", v13);

      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[NSMutableArray removeLastObject](self->_dynamicEditOptionSections, "removeLastObject");
        -[NSMutableArray removeObjectAtIndex:](self->_currentSections, "removeObjectAtIndex:", v14);
      }
    }
    while (v6 > v4);
  }
  else
  {
    do
    {
      v7 = -[NTKFace newDynamicEditOptionCollectionForSection:](self->_face, "newDynamicEditOptionCollectionForSection:", v6);
      -[NTKCFaceDetailViewController _sectionForEditOptionCollection:](self, "_sectionForEditOptionCollection:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = self->_currentSections;
        -[NSMutableArray objectAtIndexedSubscript:](self->_dynamicEditOptionSections, "objectAtIndexedSubscript:", v6 - 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[NSMutableArray indexOfObject:](v9, "indexOfObject:", v10);

        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[NSMutableArray addObject:](self->_dynamicEditOptionSections, "addObject:", v8);
          -[NSMutableArray insertObject:atIndex:](self->_currentSections, "insertObject:atIndex:", v8, v11 + 1);
        }
      }

      ++v6;
    }
    while (v4 != v6);
  }
  v15 = self->_currentSections;
  -[NSMutableArray lastObject](self->_dynamicEditOptionSections, "lastObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[NSMutableArray indexOfObject:](v15, "indexOfObject:", v16);

  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    -[NTKCFaceDetailViewController _applySectionIndexKeysToCurrentSectionsFromIndex:](self, "_applySectionIndexKeysToCurrentSectionsFromIndex:", v17 + 1);
LABEL_13:
  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)_applySectionIndexKeysToCurrentSectionsFromIndex:(unint64_t)a3
{
  uint64_t v5;
  id v6;

  v5 = -[NSMutableArray count](self->_currentSections, "count");
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", a3, v5 - a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray enumerateObjectsAtIndexes:options:usingBlock:](self->_currentSections, "enumerateObjectsAtIndexes:options:usingBlock:", v6, 0, &__block_literal_global_130_0);

}

uint64_t __81__NTKCFaceDetailViewController__applySectionIndexKeysToCurrentSectionsFromIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSection:");
}

- (void)photoSectionDidUpdate:(id)a3
{
  -[NTKCFaceDetailViewController _updateAddButton](self, "_updateAddButton", a3);
  -[NTKCFaceDetailViewController _updateShareButton](self, "_updateShareButton");
}

- (id)complicationSection:(id)a3 allowedComplicationsForSlot:(id)a4
{
  void *v5;
  void *v6;

  -[NTKFace allowedComplicationsForSlot:](self->_face, "allowedComplicationsForSlot:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_inGallery)
  {
    -[NTKCFaceDetailViewController _pruneRemovedOrRestrictedComplications:](self, "_pruneRemovedOrRestrictedComplications:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NTKCFaceDetailViewController _pruneComplicationsNotAvailableOnGizmo:](self, "_pruneComplicationsNotAvailableOnGizmo:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)complicationSection:(id)a3 didChangeToComplication:(id)a4 forSlot:(id)a5
{
  -[NTKCFaceDetailViewController _setComplication:forSlot:](self, "_setComplication:forSlot:", a4, a5);
}

- (void)complicationSection:(id)a3 wantsToPresentPickerForSlot:(id)a4 selectedComplication:(id)a5
{
  id v7;
  id v8;
  NTKCFaceDetailComplicationPickerViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  NTKCFaceDetailComplicationPickerViewController *v13;

  v7 = a5;
  v8 = a4;
  v9 = [NTKCFaceDetailComplicationPickerViewController alloc];
  -[NTKCFaceDetailViewController face](self, "face");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NTKCFaceDetailComplicationPickerViewController initWithFace:slot:selectedComplication:](v9, "initWithFace:slot:selectedComplication:", v10, v8, v7);

  -[NTKCFaceDetailComplicationPickerViewController setDelegate:](v13, "setDelegate:", self);
  -[NTKCFaceDetailViewController navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NTKCFaceDetailViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pushViewController:animated:", v13, 1);

  }
  else
  {
    -[NTKCFaceDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
  }

}

- (void)faceDetailComplicationPickerViewController:(id)a3 didSelectComplication:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v6 = a4;
  objc_msgSend(a3, "slot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCFaceDetailViewController _setComplication:forSlot:](self, "_setComplication:forSlot:", v6, v7);

  -[NTKCFaceDetailViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NTKCFaceDetailViewController navigationController](self, "navigationController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v10, "popToViewController:animated:", self, 1);

  }
  else
  {
    -[NTKCFaceDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_132);
  }
}

- (void)otherSection:(id)a3 didToggleMonogram:(id)a4 forSlot:(id)a5
{
  -[NTKCFaceDetailViewController _setComplication:forSlot:](self, "_setComplication:forSlot:", a4, a5);
}

- (void)otherSectionDidSelectMonogramEdit:(id)a3
{
  NTKCNavigationController *v4;
  id v5;

  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setShowsDoneButton:", 1);
  v4 = -[NTKCNavigationController initWithRootViewController:]([NTKCNavigationController alloc], "initWithRootViewController:", v5);
  -[NTKCFaceDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)otherSection:(id)a3 didChangeShowSeconds:(id)a4 forMode:(int64_t)a5
{
  -[NTKCFaceDetailViewController _setEditOption:forMode:slot:](self, "_setEditOption:forMode:slot:", a4, a5, 0);
}

- (void)actionSectionDidSelect:(id)a3
{
  void *v4;

  -[NTKCFaceDetailViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryDetail:didSelectFace:", self, self->_face);

  NTKCCAnalyticsIncrement(kNTKCCAnalyticsSelectFace[0]);
}

- (void)actionSectionDidDelete:(id)a3
{
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[5];

  -[NTKCFaceDetailViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "libraryDetail:canRemoveFace:", self, self->_face);

  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0DC3450];
    NTKCCustomizationLocalizedString(CFSTR("REMOVE_FACE_TITLE"), (uint64_t)CFSTR("title"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NTKCCustomizationLocalizedString(CFSTR("REMOVE_FACE_MESSAGE"), (uint64_t)CFSTR("message"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0DC3448];
    NTKCCustomizationLocalizedString(CFSTR("REMOVE_FACE_CANCEL"), (uint64_t)CFSTR("Cancel"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v15);

    v16 = (void *)MEMORY[0x1E0DC3448];
    NTKCCustomizationLocalizedString(CFSTR("REMOVE_FACE_OK"), (uint64_t)CFSTR("OK"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __55__NTKCFaceDetailViewController_actionSectionDidDelete___block_invoke;
    v20[3] = &unk_1E6BCE388;
    v20[4] = self;
    objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 0, v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v19);

    -[NTKCFaceDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
  }
}

void __55__NTKCFaceDetailViewController_actionSectionDidDelete___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryDetail:didRemoveFace:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976));

  NTKCCAnalyticsIncrement(kNTKCCAnalyticsRemoveFace[0]);
}

- (void)_updateShareButton
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (!self->_externalAssets)
  {
    v12 = (id)objc_opt_new();
    if (!self->_shareNavButton)
    {
      v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.up"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v3, "initWithImage:style:target:action:", v4, 0, self, sel__didTapShareButton);
      -[NTKCFaceDetailViewController setShareNavButton:](self, "setShareNavButton:", v5);

    }
    -[NTKCFaceDetailViewController shareNavButton](self, "shareNavButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v6);

    -[UIBarButtonItem setEnabled:](self->_shareNavButton, "setEnabled:", -[NTKCFaceDetailViewController _isShareButtonEnabled](self, "_isShareButtonEnabled"));
    if (-[NTKCFaceDetailViewController _shouldDisplayShowDebugItem](self, "_shouldDisplayShowDebugItem"))
    {
      if (!self->_debugNavButton)
      {
        v7 = objc_alloc(MEMORY[0x1E0DC34F0]);
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ant"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v7, "initWithImage:style:target:action:", v8, 0, self, sel__didTapShowDebug);
        -[NTKCFaceDetailViewController setDebugNavButton:](self, "setDebugNavButton:", v9);

      }
      -[NTKCFaceDetailViewController debugNavButton](self, "debugNavButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v10);

    }
    -[NTKCFaceDetailViewController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRightBarButtonItems:", v12);

  }
}

- (BOOL)_shouldDisplayShowDebugItem
{
  void *v3;
  void *v4;
  char v5;

  if (!CLKInternalBuild())
    return 0;
  -[NTKCFaceDetailViewController _faceBundleForFace:](self, "_faceBundleForFace:", self->_face);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "companionShouldDisplayDebugMenuForFace:", self->_face);
  else
    v5 = 0;

  return v5;
}

- (id)_faceBundleForFace:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFace device](self->_face, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "faceBundleForBundleIdentifier:onDevice:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_isShareButtonEnabled
{
  return -[NTKFace faceStyle](self->_face, "faceStyle") != 22 || NTKPhotosFaceHasPhotos(self->_face);
}

- (void)_didTapShareButton
{
  uint64_t v3;
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NTKCFaceDetailPhotosSectionController *photosSection;
  _QWORD v10[5];
  void (**v11)(_QWORD);
  _QWORD aBlock[5];

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__NTKCFaceDetailViewController__didTapShareButton__block_invoke;
  aBlock[3] = &unk_1E6BCD5F0;
  aBlock[4] = self;
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (-[NTKCFaceDetailPhotosSectionController hasChanges](self->_photosSection, "hasChanges"))
  {
    -[NTKCFaceDetailViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserInteractionEnabled:", 0);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v6, "startAnimating");
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v6);
    -[NTKCFaceDetailViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItem:", v7);

    -[UIButton setDisabled:forReason:](self->_addButton, "setDisabled:forReason:", 1, 0);
    photosSection = self->_photosSection;
    v10[0] = v3;
    v10[1] = 3221225472;
    v10[2] = __50__NTKCFaceDetailViewController__didTapShareButton__block_invoke_2;
    v10[3] = &unk_1E6BD00B0;
    v10[4] = self;
    v11 = v4;
    -[NTKCFaceDetailPhotosSectionController saveChangesWithCompletion:](photosSection, "saveChangesWithCompletion:", v10);

  }
  else
  {
    v4[2](v4);
  }

}

void __50__NTKCFaceDetailViewController__didTapShareButton__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[NTKGreenfieldCompanionShareController sharedController](NTKGreenfieldCompanionShareController, "sharedController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "face");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shareWatchFace:fromViewController:", v2, *(_QWORD *)(a1 + 32));

}

void __50__NTKCFaceDetailViewController__didTapShareButton__block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[140];
  objc_msgSend(v2, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  objc_msgSend(*(id *)(a1 + 32), "_updateAddButton");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_didTapShowDebug
{
  void *v3;
  void *v4;
  id v5;

  -[NTKCFaceDetailViewController _faceBundleForFace:](self, "_faceBundleForFace:", self->_face);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v3, "viewControllerForCompanionDebugMenuWithFace:", self->_face);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      -[NTKCFaceDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

    v3 = v5;
  }

}

- (NTKFace)face
{
  return self->_face;
}

- (NTKCFaceDetailViewControllerDelegate)delegate
{
  return (NTKCFaceDetailViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shared
{
  return self->_shared;
}

- (void)setShared:(BOOL)a3
{
  self->_shared = a3;
}

- (NTKCFaceContainerView)faceContainer
{
  return self->_faceContainer;
}

- (void)setFaceContainer:(id)a3
{
  objc_storeStrong((id *)&self->_faceContainer, a3);
}

- (NTKFaceCollection)library
{
  return self->_library;
}

- (CGSize)headerFaceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_headerFaceSize.width;
  height = self->_headerFaceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setHeaderFaceSize:(CGSize)a3
{
  self->_headerFaceSize = a3;
}

- (double)intrinsicHeaderHeight
{
  return self->_intrinsicHeaderHeight;
}

- (void)setIntrinsicHeaderHeight:(double)a3
{
  self->_intrinsicHeaderHeight = a3;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (UIView)headerSeparator
{
  return self->_headerSeparator;
}

- (void)setHeaderSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_headerSeparator, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSMutableArray)currentSections
{
  return self->_currentSections;
}

- (void)setCurrentSections:(id)a3
{
  objc_storeStrong((id *)&self->_currentSections, a3);
}

- (NTKCFaceDetailDescriptionSectionController)descriptionSection
{
  return self->_descriptionSection;
}

- (void)setDescriptionSection:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionSection, a3);
}

- (NSMutableArray)dynamicEditOptionSections
{
  return self->_dynamicEditOptionSections;
}

- (void)setDynamicEditOptionSections:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicEditOptionSections, a3);
}

- (NTKCFaceDetailPhotosSectionController)photosSection
{
  return self->_photosSection;
}

- (void)setPhotosSection:(id)a3
{
  objc_storeStrong((id *)&self->_photosSection, a3);
}

- (NTKCFaceDetailKaleidoscopeContentSectionController)kaleidoscopeContentSection
{
  return self->_kaleidoscopeContentSection;
}

- (void)setKaleidoscopeContentSection:(id)a3
{
  objc_storeStrong((id *)&self->_kaleidoscopeContentSection, a3);
}

- (NTKCFaceDetailKaleidoscopeStyleSectionController)kaleidoscopeStyleSection
{
  return self->_kaleidoscopeStyleSection;
}

- (void)setKaleidoscopeStyleSection:(id)a3
{
  objc_storeStrong((id *)&self->_kaleidoscopeStyleSection, a3);
}

- (NTKCFaceDetailOtherSectionController)otherSection
{
  return self->_otherSection;
}

- (void)setOtherSection:(id)a3
{
  objc_storeStrong((id *)&self->_otherSection, a3);
}

- (NTKCFaceDetailPigmentSectionController)pigmentSection
{
  return self->_pigmentSection;
}

- (void)setPigmentSection:(id)a3
{
  objc_storeStrong((id *)&self->_pigmentSection, a3);
}

- (id)selectionFinishedHandler
{
  return self->_selectionFinishedHandler;
}

- (void)setSelectionFinishedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1104);
}

- (UITableViewCell)editOptionToMakeFullyVisible
{
  return self->_editOptionToMakeFullyVisible;
}

- (void)setEditOptionToMakeFullyVisible:(id)a3
{
  objc_storeStrong((id *)&self->_editOptionToMakeFullyVisible, a3);
}

- (BOOL)faceHasBeenEdited
{
  return self->_faceHasBeenEdited;
}

- (UIBarButtonItem)shareNavButton
{
  return self->_shareNavButton;
}

- (void)setShareNavButton:(id)a3
{
  objc_storeStrong((id *)&self->_shareNavButton, a3);
}

- (UIBarButtonItem)debugNavButton
{
  return self->_debugNavButton;
}

- (void)setDebugNavButton:(id)a3
{
  objc_storeStrong((id *)&self->_debugNavButton, a3);
}

- (NTKGreenfieldCompanionShareController)shareController
{
  return self->_shareController;
}

- (void)setShareController:(id)a3
{
  objc_storeStrong((id *)&self->_shareController, a3);
}

- (UIViewController)modalViewControllerPresentedByThisViewController
{
  return self->_modalViewControllerPresentedByThisViewController;
}

- (void)setModalViewControllerPresentedByThisViewController:(id)a3
{
  objc_storeStrong((id *)&self->_modalViewControllerPresentedByThisViewController, a3);
}

- (NTKCompanionFaceViewController)faceVC
{
  return self->_faceVC;
}

- (void)setFaceVC:(id)a3
{
  objc_storeStrong((id *)&self->_faceVC, a3);
}

- (BOOL)inGallery
{
  return self->_inGallery;
}

- (void)setInGallery:(BOOL)a3
{
  self->_inGallery = a3;
}

- (NSArray)externalAssets
{
  return self->_externalAssets;
}

- (void)setExternalAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1160);
}

- (UIButton)addButton
{
  return self->_addButton;
}

- (void)setAddButton:(id)a3
{
  objc_storeStrong((id *)&self->_addButton, a3);
}

- (UIActivityIndicatorView)addSpinner
{
  return self->_addSpinner;
}

- (void)setAddSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_addSpinner, a3);
}

- (UILabel)faceName
{
  return self->_faceName;
}

- (void)setFaceName:(id)a3
{
  objc_storeStrong((id *)&self->_faceName, a3);
}

- (NSMutableArray)editOptionSections
{
  return self->_editOptionSections;
}

- (void)setEditOptionSections:(id)a3
{
  objc_storeStrong((id *)&self->_editOptionSections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editOptionSections, 0);
  objc_storeStrong((id *)&self->_faceName, 0);
  objc_storeStrong((id *)&self->_addSpinner, 0);
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_externalAssets, 0);
  objc_storeStrong((id *)&self->_faceVC, 0);
  objc_storeStrong((id *)&self->_modalViewControllerPresentedByThisViewController, 0);
  objc_storeStrong((id *)&self->_shareController, 0);
  objc_storeStrong((id *)&self->_debugNavButton, 0);
  objc_storeStrong((id *)&self->_shareNavButton, 0);
  objc_storeStrong((id *)&self->_editOptionToMakeFullyVisible, 0);
  objc_storeStrong(&self->_selectionFinishedHandler, 0);
  objc_storeStrong((id *)&self->_pigmentSection, 0);
  objc_storeStrong((id *)&self->_otherSection, 0);
  objc_storeStrong((id *)&self->_kaleidoscopeStyleSection, 0);
  objc_storeStrong((id *)&self->_kaleidoscopeContentSection, 0);
  objc_storeStrong((id *)&self->_photosSection, 0);
  objc_storeStrong((id *)&self->_dynamicEditOptionSections, 0);
  objc_storeStrong((id *)&self->_descriptionSection, 0);
  objc_storeStrong((id *)&self->_currentSections, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_headerSeparator, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_faceContainer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_face, 0);
}

@end
