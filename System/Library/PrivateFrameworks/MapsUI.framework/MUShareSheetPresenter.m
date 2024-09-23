@implementation MUShareSheetPresenter

- (MUShareSheetPresenter)initWithPlaceItem:(id)a3 presentationOptions:(id)a4
{
  id v7;
  id v8;
  MUShareSheetPresenter *v9;
  MUShareSheetPresenter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MUShareSheetPresenter;
  v9 = -[MUShareSheetPresenter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_placeItem, a3);
    objc_storeStrong((id *)&v10->_presentationOptions, a4);
  }

  return v10;
}

- (void)present
{
  void *v3;
  char v4;
  void *v5;
  MUActivityViewController *v6;
  MUActivityViewController *activityViewController;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  MUPlaceItemShareItemSource *v12;
  _MKPlaceItem *placeItem;
  void *v14;
  MUPlaceItemShareItemSource *v15;
  MUActivityViewController *v16;
  MUActivityViewController *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  MUPresentationOptions *presentationOptions;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  -[MUShareSheetPresenter delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MUShareSheetPresenter delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shareSheetPresenterRequestsOverridenActivityViewController:", self);
    v6 = (MUActivityViewController *)objc_claimAutoreleasedReturnValue();
    activityViewController = self->_activityViewController;
    self->_activityViewController = v6;

  }
  if (!self->_activityViewController)
  {
    -[MUShareSheetPresenter delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[MUShareSheetPresenter delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "footerActivitiesForShareSheetPresenter:", self);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
    v12 = [MUPlaceItemShareItemSource alloc];
    placeItem = self->_placeItem;
    v14 = (void *)objc_msgSend(v11, "copy");
    v15 = -[MUPlaceItemShareItemSource initWithPlaceItem:applicationActivities:](v12, "initWithPlaceItem:applicationActivities:", placeItem, v14);

    v16 = -[MUActivityViewController initWithShareItem:]([MUActivityViewController alloc], "initWithShareItem:", v15);
    v17 = self->_activityViewController;
    self->_activityViewController = v16;

  }
  -[MUPresentationOptions presentingViewController](self->_presentationOptions, "presentingViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v29 = v18;
    objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "userInterfaceIdiom");

    if ((v20 & 0xFFFFFFFD) == 1)
    {
      objc_msgSend(v29, "_popoverController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {

        v22 = 2;
      }
      else if (objc_msgSend(v29, "_isInPopoverPresentation"))
      {
        v22 = 2;
      }
      else
      {
        v22 = 7;
      }
      -[MUActivityViewController setModalPresentationStyle:](self->_activityViewController, "setModalPresentationStyle:", v22);
    }
    -[MUActivityViewController popoverPresentationController](self->_activityViewController, "popoverPresentationController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPresentationOptions barButtonItem](self->_presentationOptions, "barButtonItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    presentationOptions = self->_presentationOptions;
    if (v24)
    {
      -[MUPresentationOptions barButtonItem](presentationOptions, "barButtonItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setBarButtonItem:", v26);
    }
    else
    {
      -[MUPresentationOptions sourceView](presentationOptions, "sourceView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
      {
LABEL_21:
        objc_msgSend(v23, "setPermittedArrowDirections:", 15);
        objc_msgSend(v29, "presentViewController:animated:completion:", self->_activityViewController, 1, 0);

        v18 = v29;
        goto LABEL_22;
      }
      -[MUPresentationOptions sourceView](self->_presentationOptions, "sourceView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setSourceView:", v28);

      -[MUPresentationOptions sourceView](self->_presentationOptions, "sourceView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bounds");
      objc_msgSend(v23, "setSourceRect:");
    }

    goto LABEL_21;
  }
LABEL_22:

}

- (void)mapkitActivityViewController:(id)a3 preCompletedActivityOfType:(id)a4 completed:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a5;
  v7 = a4;
  -[MUShareSheetPresenter delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shareSheetPresenter:preCompletedActivityOfType:completed:", self, v7, v5);

}

- (void)mapkitActivityViewController:(id)a3 postCompletedActivityOfType:(id)a4 completed:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a5;
  v7 = a4;
  -[MUShareSheetPresenter delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shareSheetPresenter:postCompletedActivityOfType:completed:", self, v7, v5);

}

- (MUPresentationOptions)presentationOptions
{
  return self->_presentationOptions;
}

- (_MKPlaceItem)placeItem
{
  return self->_placeItem;
}

- (MUShareSheetPresenterDelegate)delegate
{
  return (MUShareSheetPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeItem, 0);
  objc_storeStrong((id *)&self->_presentationOptions, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
}

@end
