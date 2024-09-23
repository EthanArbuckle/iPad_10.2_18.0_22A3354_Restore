@implementation HUSetupAccessoryOBWelcomeController

- (HUSetupAccessoryOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 item:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HUHomeAccessoryTileView *v14;
  HUHomeAccessoryTileView *v15;
  HUSetupAccessoryOBWelcomeController *v16;
  objc_super v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [HUHomeAccessoryTileView alloc];
  v15 = -[HUHomeAccessoryTileView initWithFrame:item:iconOnlyTile:](v14, "initWithFrame:item:iconOnlyTile:", v10, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  v18.receiver = self;
  v18.super_class = (Class)HUSetupAccessoryOBWelcomeController;
  v16 = -[HUCenterFillOBWelcomeController initWithTitle:detailText:icon:contentView:](&v18, sel_initWithTitle_detailText_icon_contentView_, v13, v12, v11, v15);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_homeAccessoryTileView, v15);
    -[HUCenterFillOBWelcomeController setContentInsets:](v16, "setContentInsets:", 0.0, 24.0, 0.0, 24.0);
  }

  return v16;
}

- (HUSetupAccessoryOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentView:(id)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithTitle_detailText_icon_item_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSetupAccessoryOBWelcomeController.m"), 33, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUSetupAccessoryOBWelcomeController initWithTitle:detailText:icon:contentView:]",
    v9);

  return 0;
}

- (HFServiceLikeItem)item
{
  void *v2;
  void *v3;

  -[HUSetupAccessoryOBWelcomeController homeAccessoryTileView](self, "homeAccessoryTileView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFServiceLikeItem *)v3;
}

- (double)_contentAspectRatio
{
  void *v2;
  double v3;
  double v4;

  -[HUSetupAccessoryOBWelcomeController homeAccessoryTileView](self, "homeAccessoryTileView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aspectRatio");
  v4 = v3;

  return v4;
}

- (HUHomeAccessoryTileView)homeAccessoryTileView
{
  return self->_homeAccessoryTileView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAccessoryTileView, 0);
}

@end
