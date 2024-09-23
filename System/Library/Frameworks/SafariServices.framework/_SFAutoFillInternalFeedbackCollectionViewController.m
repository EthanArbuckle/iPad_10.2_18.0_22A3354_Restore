@implementation _SFAutoFillInternalFeedbackCollectionViewController

- (_SFAutoFillInternalFeedbackCollectionViewController)initWithDiagnosticsData:(id)a3 reportHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _SFAutoFillInternalFeedbackCollectionViewController *v9;
  uint64_t v10;
  WBSAutoFillInternalFeedbackController *feedbackController;
  uint64_t v12;
  id reportHandler;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _SFAutoFillInternalFeedbackCollectionViewController *v24;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  -[_SFAutoFillInternalFeedbackCollectionViewController _createCollectionViewLayout](self, "_createCollectionViewLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)_SFAutoFillInternalFeedbackCollectionViewController;
  v9 = -[_SFAutoFillInternalFeedbackCollectionViewController initWithCollectionViewLayout:](&v26, sel_initWithCollectionViewLayout_, v8);

  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8A780]), "initWithDiagnosticsData:", v6);
    feedbackController = v9->_feedbackController;
    v9->_feedbackController = (WBSAutoFillInternalFeedbackController *)v10;

    v12 = MEMORY[0x1A8598C40](v7);
    reportHandler = v9->_reportHandler;
    v9->_reportHandler = (id)v12;

    v14 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(MEMORY[0x1E0D8A780], "titleText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v15);

    objc_msgSend(v14, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(MEMORY[0x1E0DC37E8], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4B60], *MEMORY[0x1E0DC4B98]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v16);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v14);
    -[_SFAutoFillInternalFeedbackCollectionViewController navigationItem](v9, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLeftBarButtonItem:", v17);

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 24, v9, sel__dismiss_);
    -[_SFAutoFillInternalFeedbackCollectionViewController navigationItem](v9, "navigationItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setRightBarButtonItem:", v19);

    -[_SFAutoFillInternalFeedbackCollectionViewController collectionView](v9, "collectionView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDelegate:", v9);

    -[_SFAutoFillInternalFeedbackCollectionViewController collectionView](v9, "collectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDataSource:", v9);

    -[_SFAutoFillInternalFeedbackCollectionViewController collectionView](v9, "collectionView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setSelfSizingInvalidation:", 2);

    v24 = v9;
  }

  return v9;
}

- (void)_dismiss:(id)a3
{
  -[_SFAutoFillInternalFeedbackCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)_createCollectionViewLayout
{
  id v3;
  _QWORD v5[5];

  v3 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82___SFAutoFillInternalFeedbackCollectionViewController__createCollectionViewLayout__block_invoke;
  v5[3] = &unk_1E4AC0DC0;
  v5[4] = self;
  return (id)objc_msgSend(v3, "initWithSectionProvider:", v5);
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)_SFAutoFillInternalFeedbackCollectionViewController;
  -[_SFAutoFillInternalFeedbackCollectionViewController viewDidLoad](&v20, sel_viewDidLoad);
  -[_SFAutoFillInternalFeedbackCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = *MEMORY[0x1E0DC48A0];
  +[_SFCollectionViewListTextSupplementaryView reuseIdentifier](_SFCollectionViewListTextSupplementaryView, "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v4, v5, v6);

  -[_SFAutoFillInternalFeedbackCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v9 = *MEMORY[0x1E0DC48A8];
  +[_SFCollectionViewListTextSupplementaryView reuseIdentifier](_SFCollectionViewListTextSupplementaryView, "reuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v8, v9, v10);

  -[_SFAutoFillInternalFeedbackCollectionViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  +[_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell reuseIdentifier](_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell, "reuseIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerClass:forCellWithReuseIdentifier:", v12, v13);

  -[_SFAutoFillInternalFeedbackCollectionViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_class();
  +[_SFButtonCollectionViewListCell reuseIdentifier](_SFButtonCollectionViewListCell, "reuseIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerClass:forCellWithReuseIdentifier:", v15, v16);

  -[_SFAutoFillInternalFeedbackCollectionViewController collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_class();
  +[_SFCheckableItemCollectionViewListCell reuseIdentifier](_SFCheckableItemCollectionViewListCell, "reuseIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "registerClass:forCellWithReuseIdentifier:", v18, v19);

}

- (WBSAutoFillInternalFeedbackDiagnosticsData)diagnosticsData
{
  return (WBSAutoFillInternalFeedbackDiagnosticsData *)-[WBSAutoFillInternalFeedbackController diagnosticsData](self->_feedbackController, "diagnosticsData");
}

- (void)_updateContinueInTapToRadarButton
{
  void *v3;
  void *v4;
  id v5;

  -[_SFAutoFillInternalFeedbackCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellForItemAtIndexPath:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setEnabled:", -[WBSAutoFillInternalFeedbackController canContinueInTapToRadar](self->_feedbackController, "canContinueInTapToRadar"));
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;

  v6 = a3;
  v7 = 7;
  switch(a4)
  {
    case 0:
      break;
    case 1:
      -[WBSAutoFillInternalFeedbackController detailTypesForSelectedFeedbackCategory](self->_feedbackController, "detailTypesForSelectedFeedbackCategory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 2 * objc_msgSend(v8, "count");

      break;
    case 2:
      if (-[WBSAutoFillInternalFeedbackController isRegression](self->_feedbackController, "isRegression"))v7 = 2;
      else
        v7 = 1;
      break;
    case 3:
      v7 = 2;
      break;
    case 4:
      v7 = 1;
      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v6 = a3;
  v7 = a4;
  switch(objc_msgSend(v7, "section"))
  {
    case 0:
      +[_SFCheckableItemCollectionViewListCell reuseIdentifier](_SFCheckableItemCollectionViewListCell, "reuseIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v7, "row") + 1;
      objc_msgSend(MEMORY[0x1E0D8A780], "titleForFeedbackCategory:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v11);

      v12 = -[WBSAutoFillInternalFeedbackController selectedFeedbackCategory](self->_feedbackController, "selectedFeedbackCategory");
      goto LABEL_14;
    case 1:
      -[WBSAutoFillInternalFeedbackController detailTypesForSelectedFeedbackCategory](self->_feedbackController, "detailTypesForSelectedFeedbackCategory");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v7, "row");
      if (v16 >= 0)
        v17 = v16;
      else
        v17 = v16 + 1;
      objc_msgSend(v15, "objectAtIndex:", v17 >> 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v7, "row") & 1) != 0)
      {
        +[_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell reuseIdentifier](_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell, "reuseIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v27, v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "setDelegate:", self);
        -[WBSAutoFillInternalFeedbackController responseForDetailType:](self->_feedbackController, "responseForDetailType:", v18);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setText:", v28);

        objc_msgSend(MEMORY[0x1E0D8A780], "placeholderForFeedbackDetailType:", v18);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setPlaceholder:", v29);

      }
      else
      {
        +[_SFCheckableItemCollectionViewListCell reuseIdentifier](_SFCheckableItemCollectionViewListCell, "reuseIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v19, v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D8A780], "titleForFeedbackDetailType:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setText:", v20);

        objc_msgSend(v9, "setChecked:", 0);
      }

      goto LABEL_19;
    case 2:
      v21 = objc_msgSend(v7, "row");
      if (v21 == 1)
      {
        +[_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell reuseIdentifier](_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell, "reuseIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v30, v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "setDelegate:", self);
        -[WBSAutoFillInternalFeedbackController knownWorkingBuild](self->_feedbackController, "knownWorkingBuild");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setText:", v31);

        objc_msgSend(MEMORY[0x1E0D8A780], "knownWorkingBuildPlaceholderText");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setPlaceholder:", v32);

      }
      else
      {
        if (v21)
        {
LABEL_13:
          +[_SFCheckableItemCollectionViewListCell reuseIdentifier](_SFCheckableItemCollectionViewListCell, "reuseIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v25, v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = objc_msgSend(v7, "row");
          objc_msgSend(MEMORY[0x1E0D8A780], "titleForAttachmentsType:", v10);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setText:", v26);

          v12 = -[WBSAutoFillInternalFeedbackController selectedAttachmentsType](self->_feedbackController, "selectedAttachmentsType");
LABEL_14:
          v24 = v12 == v10;
        }
        else
        {
          +[_SFCheckableItemCollectionViewListCell reuseIdentifier](_SFCheckableItemCollectionViewListCell, "reuseIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v22, v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0D8A780], "isRegressionOptionText");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setText:", v23);

          v24 = -[WBSAutoFillInternalFeedbackController isRegression](self->_feedbackController, "isRegression");
        }
        objc_msgSend(v9, "setChecked:", v24);
      }
LABEL_19:

      return v9;
    case 3:
      goto LABEL_13;
    case 4:
      +[_SFButtonCollectionViewListCell reuseIdentifier](_SFButtonCollectionViewListCell, "reuseIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v13, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setDelegate:", self);
      _WBSLocalizedString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTitle:", v14);

      objc_msgSend(v9, "setEnabled:", -[WBSAutoFillInternalFeedbackController canContinueInTapToRadar](self->_feedbackController, "canContinueInTapToRadar"));
      goto LABEL_19;
    default:
      v9 = 0;
      goto LABEL_19;
  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC48A8]);
  v12 = objc_msgSend(v10, "section");
  if (v11)
  {
    if (v12 == 3)
    {
      +[_SFCollectionViewListTextSupplementaryView reuseIdentifier](_SFCollectionViewListTextSupplementaryView, "reuseIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, v18, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      _WBSLocalizedString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedUppercaseString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setText:", v19);

      goto LABEL_10;
    }
    if (!v12)
    {
      +[_SFCollectionViewListTextSupplementaryView reuseIdentifier](_SFCollectionViewListTextSupplementaryView, "reuseIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, v13, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D8A780], "informativeText");
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v17 = (void *)v15;
      objc_msgSend(v14, "setText:", v15);
LABEL_10:

      goto LABEL_11;
    }
  }
  else if (v12 == 3)
  {
    +[_SFCollectionViewListTextSupplementaryView reuseIdentifier](_SFCollectionViewListTextSupplementaryView, "reuseIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, v16, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[WBSAutoFillInternalFeedbackController attachmentDetailsText](self->_feedbackController, "attachmentDetailsText");
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "section");
  switch(v7)
  {
    case 3:
      goto LABEL_10;
    case 2:
      v11 = objc_msgSend(v6, "row");
      if (v11 == 1)
        break;
      if (!v11)
      {
        objc_msgSend(v18, "cellForItemAtIndexPath:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSAutoFillInternalFeedbackController setRegression:](self->_feedbackController, "setRegression:", objc_msgSend(v12, "isChecked") ^ 1);
        objc_msgSend(v12, "setChecked:", -[WBSAutoFillInternalFeedbackController isRegression](self->_feedbackController, "isRegression"));
        -[_SFAutoFillInternalFeedbackCollectionViewController collectionView](self, "collectionView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "reloadData");
        goto LABEL_14;
      }
LABEL_10:
      v14 = objc_msgSend(v6, "row");
      if (v14 == -[WBSAutoFillInternalFeedbackController selectedAttachmentsType](self->_feedbackController, "selectedAttachmentsType"))break;
      v15 = -[WBSAutoFillInternalFeedbackController selectedAttachmentsType](self->_feedbackController, "selectedAttachmentsType");
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v15, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "cellForItemAtIndexPath:", v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setChecked:", 0);
      objc_msgSend(v18, "cellForItemAtIndexPath:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setChecked:", 1);
      -[WBSAutoFillInternalFeedbackController setSelectedAttachmentsType:](self->_feedbackController, "setSelectedAttachmentsType:", v14);
LABEL_14:

      break;
    case 0:
      v8 = objc_msgSend(v6, "row") + 1;
      if (v8 != -[WBSAutoFillInternalFeedbackController selectedFeedbackCategory](self->_feedbackController, "selectedFeedbackCategory"))
      {
        v9 = -[WBSAutoFillInternalFeedbackController selectedFeedbackCategory](self->_feedbackController, "selectedFeedbackCategory");
        if (v9)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v9 - 1, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = 0;
        }
        objc_msgSend(v18, "cellForItemAtIndexPath:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "setChecked:", 0);
        objc_msgSend(v18, "cellForItemAtIndexPath:", v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setChecked:", 1);
        -[WBSAutoFillInternalFeedbackController setSelectedFeedbackCategory:](self->_feedbackController, "setSelectedFeedbackCategory:", v8);
        -[_SFAutoFillInternalFeedbackCollectionViewController collectionView](self, "collectionView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "reloadData");

        -[_SFAutoFillInternalFeedbackCollectionViewController _updateContinueInTapToRadarButton](self, "_updateContinueInTapToRadarButton");
        goto LABEL_14;
      }
      break;
  }

}

- (void)collectionViewListCellButtonPressed:(id)a3
{
  void (**reportHandler)(id, id);
  id v5;

  -[_SFAutoFillInternalFeedbackCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  reportHandler = (void (**)(id, id))self->_reportHandler;
  -[WBSAutoFillInternalFeedbackController continueInTapToRadarURL](self->_feedbackController, "continueInTapToRadarURL");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  reportHandler[2](reportHandler, v5);

}

- (void)textFieldCellTextDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  WBSAutoFillInternalFeedbackController *feedbackController;
  void *v11;
  id v12;

  v12 = a3;
  -[_SFAutoFillInternalFeedbackCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForCell:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "section") == 2)
  {
    objc_msgSend(v12, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSAutoFillInternalFeedbackController setKnownWorkingBuild:](self->_feedbackController, "setKnownWorkingBuild:", v6);
  }
  else
  {
    -[WBSAutoFillInternalFeedbackController detailTypesForSelectedFeedbackCategory](self->_feedbackController, "detailTypesForSelectedFeedbackCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "row");
    if (v8 >= 0)
      v9 = v8;
    else
      v9 = v8 + 1;
    objc_msgSend(v7, "objectAtIndex:", v9 >> 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    feedbackController = self->_feedbackController;
    objc_msgSend(v12, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSAutoFillInternalFeedbackController setResponse:forDetailType:](feedbackController, "setResponse:forDetailType:", v11, v6);

    -[_SFAutoFillInternalFeedbackCollectionViewController _updateContinueInTapToRadarButton](self, "_updateContinueInTapToRadarButton");
  }

}

- (id)reportHandler
{
  return self->_reportHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reportHandler, 0);
  objc_storeStrong((id *)&self->_feedbackController, 0);
}

@end
