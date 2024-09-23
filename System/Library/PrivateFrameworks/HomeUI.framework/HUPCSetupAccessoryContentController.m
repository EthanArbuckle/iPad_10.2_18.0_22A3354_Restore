@implementation HUPCSetupAccessoryContentController

- (HUPCSetupAccessoryContentController)initWithTitle:(id)a3 detailText:(id)a4 item:(id)a5
{
  id v8;
  id v9;
  id v10;
  HUHomeAccessoryTileView *v11;
  HUHomeAccessoryTileView *v12;
  HUPCSetupAccessoryContentController *v13;
  objc_super v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [HUHomeAccessoryTileView alloc];
  v12 = -[HUHomeAccessoryTileView initWithFrame:item:iconOnlyTile:](v11, "initWithFrame:item:iconOnlyTile:", v8, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  v15.receiver = self;
  v15.super_class = (Class)HUPCSetupAccessoryContentController;
  v13 = -[HUPCCenterFillContentController initWithTitle:detailText:contentView:](&v15, sel_initWithTitle_detailText_contentView_, v10, v9, v12);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_homeAccessoryTileView, v12);
    -[HUPCCenterFillContentController setContentInsets:](v13, "setContentInsets:", 0.0, 24.0, 0.0, 24.0);
  }

  return v13;
}

- (HFServiceLikeItem)item
{
  void *v2;
  void *v3;

  -[HUPCSetupAccessoryContentController homeAccessoryTileView](self, "homeAccessoryTileView");
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

  -[HUPCSetupAccessoryContentController homeAccessoryTileView](self, "homeAccessoryTileView");
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
