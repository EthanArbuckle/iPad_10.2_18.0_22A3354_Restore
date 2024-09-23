@implementation MSStructuredPageViewController

- (MSStructuredPageViewController)init
{
  MSStructuredPageViewController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MSStructuredPageViewController;
  v2 = -[SUStructuredPageGroupedViewController init](&v4, sel_init);
  if (v2)
    -[SUStructuredPageViewController setDataSourceClass:](v2, "setDataSourceClass:", objc_opt_class());
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MSStructuredPageViewController _stopPreviewPlayback](self, "_stopPreviewPlayback");

  v3.receiver = self;
  v3.super_class = (Class)MSStructuredPageViewController;
  -[SUStructuredPageGroupedViewController dealloc](&v3, sel_dealloc);
}

- (void)applicationDidEnterBackground
{
  objc_super v3;

  -[MSStructuredPageViewController _setPreviewStatus:forIndexPath:animated:](self, "_setPreviewStatus:forIndexPath:animated:", 0, 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)MSStructuredPageViewController;
  -[SUViewController applicationDidEnterBackground](&v3, sel_applicationDidEnterBackground);
}

- (BOOL)canDisplaySectionGroup:(id)a3
{
  return objc_msgSend(a3, "style") == 1 && objc_msgSend((id)objc_msgSend(a3, "sections"), "count") == 2;
}

- (BOOL)canSelectRowAtIndexPath:(id)a3
{
  void *v5;
  objc_super v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "itemAtIndexPath:", a3);
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "defaultStoreOffer"), "offerMedia"), "URL")
    && (objc_msgSend((id)objc_msgSend(v5, "contentRating"), "isRestricted") & 1) == 0
    && (-[SUTableDataSource canShowPreviewForItem:](-[SUTableViewController dataSource](self, "dataSource"), "canShowPreviewForItem:", v5) & 1) != 0)
  {
    return 1;
  }
  v7.receiver = self;
  v7.super_class = (Class)MSStructuredPageViewController;
  return -[SUStructuredPageViewController canSelectRowAtIndexPath:](&v7, sel_canSelectRowAtIndexPath_, a3);
}

- (BOOL)handleSelectionForIndexPath:(id)a3 tapCount:(int64_t)a4
{
  void *v7;
  void *v8;
  objc_super v10;

  v7 = (void *)objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "itemAtIndexPath:", a3);
  if (a4 == 1
    && (v8 = v7, objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "defaultStoreOffer"), "offerMedia"), "URL"))
    && -[SUTableDataSource canShowPreviewForItem:](-[SUTableViewController dataSource](self, "dataSource"), "canShowPreviewForItem:", v8))
  {
    return (objc_msgSend((id)objc_msgSend(v8, "contentRating"), "isRestricted") & 1) == 0
        && -[MSStructuredPageViewController _handlePreviewForIndexPath:](self, "_handlePreviewForIndexPath:", a3);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MSStructuredPageViewController;
    return -[SUStructuredPageViewController handleSelectionForIndexPath:tapCount:](&v10, sel_handleSelectionForIndexPath_tapCount_, a3, a4);
  }
}

- (BOOL)purchaseItemAtIndexPath:(id)a3
{
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MSStructuredPageViewController;
  v5 = -[SUStructuredPageGroupedViewController purchaseItemAtIndexPath:](&v9, sel_purchaseItemAtIndexPath_);
  if (v5)
  {
    v6 = objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "itemAtIndexPath:", a3);
    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8D40]), "initWithItem:", v6);
      objc_msgSend(MEMORY[0x24BEC8D48], "sendDownloadPingRequestsForMediaPlayerItem:", v7);

    }
  }
  return v5;
}

- (void)reloadWithStorePage:(id)a3 forURL:(id)a4
{
  objc_super v7;

  -[MSStructuredPageViewController _setPreviewStatus:forIndexPath:animated:](self, "_setPreviewStatus:forIndexPath:animated:", 0, 0, 0);
  v7.receiver = self;
  v7.super_class = (Class)MSStructuredPageViewController;
  -[SUStructuredPageViewController reloadWithStorePage:forURL:](&v7, sel_reloadWithStorePage_forURL_, a3, a4);
}

- (id)setDisplayedSectionGroup:(id)a3
{
  int v5;
  SUSegmentedControl *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;

  v5 = -[SUSegmentedControl isDescendantOfView:](self->_inlineSegmentedControl, "isDescendantOfView:", -[UITableView tableHeaderView](-[SUTableViewController tableView](self, "tableView"), "tableHeaderView"));

  self->_inlineSegmentedControl = 0;
  if (a3)
  {
    v6 = (SUSegmentedControl *)objc_alloc_init(MEMORY[0x24BEC8DB0]);
    self->_inlineSegmentedControl = v6;
    -[SUSegmentedControl setClientInterface:](v6, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
    -[SUSegmentedControl setItems:](self->_inlineSegmentedControl, "setItems:", objc_msgSend((id)objc_msgSend(a3, "sections"), "valueForKey:", CFSTR("segmentedControlItem")));
    -[SUSegmentedControl setTintColor:](self->_inlineSegmentedControl, "setTintColor:", objc_msgSend(a3, "tintColor"));
    -[SUSegmentedControl setTintStyle:](self->_inlineSegmentedControl, "setTintStyle:", objc_msgSend(a3, "tintStyle"));
    -[SUSegmentedControl sizeToFit](self->_inlineSegmentedControl, "sizeToFit");
    -[SUSegmentedControl frame](self->_inlineSegmentedControl, "frame");
    v8 = v7;
    v9 = *MEMORY[0x24BDBF090];
    v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v11 = v7 + 10.0 + 11.0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "applicationFrame");
    v13 = v12;
    -[SUSegmentedControl setFrame:](self->_inlineSegmentedControl, "setFrame:", 10.0, 11.0, v12 + -10.0 + -10.0, v8);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v9, v10, v13, v11);
    objc_msgSend(v14, "addSubview:", self->_inlineSegmentedControl);
    -[UITableView setTableHeaderView:](-[SUTableViewController tableView](self, "tableView"), "setTableHeaderView:", v14);

  }
  else if (v5)
  {
    -[UITableView setTableHeaderView:](-[SUTableViewController tableView](self, "tableView"), "setTableHeaderView:", 0);
  }
  return self->_inlineSegmentedControl;
}

- (void)setSkLoading:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MSStructuredPageViewController;
  -[SUStructuredPageGroupedViewController setSkLoading:](&v5, sel_setSkLoading_);
  if (v3)
    -[MSStructuredPageViewController _setPreviewStatus:forIndexPath:animated:](self, "_setPreviewStatus:forIndexPath:animated:", 0, 0, 0);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  SUPlayerStatus *previewStatus;
  objc_super v10;

  if (self->_previewIndexPath && objc_msgSend(a5, "isEqual:"))
  {
    previewStatus = self->_previewStatus;
LABEL_6:
    objc_msgSend(a4, "setPreviewStatus:", previewStatus);
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    previewStatus = 0;
    goto LABEL_6;
  }
LABEL_7:
  v10.receiver = self;
  v10.super_class = (Class)MSStructuredPageViewController;
  -[SUTableViewController tableView:willDisplayCell:forRowAtIndexPath:](&v10, sel_tableView_willDisplayCell_forRowAtIndexPath_, a3, a4, a5);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[MSStructuredPageViewController _stopPreviewPlayback](self, "_stopPreviewPlayback");
  -[MSStructuredPageViewController _setPreviewStatus:forIndexPath:animated:](self, "_setPreviewStatus:forIndexPath:animated:", 0, 0, 0);
  v5.receiver = self;
  v5.super_class = (Class)MSStructuredPageViewController;
  -[SUItemTableViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)_playerStatusChangeNotification:(id)a3
{
  NSIndexPath *previewIndexPath;
  MSStructuredPageViewController *v5;
  uint64_t v6;
  uint64_t v7;

  if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "object"), "playerStatus"), "playerState") & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    -[MSStructuredPageViewController _stopPreviewPlayback](self, "_stopPreviewPlayback");
    previewIndexPath = self->_previewIndexPath;
    v5 = self;
    v6 = 0;
    v7 = 1;
  }
  else
  {
    v6 = -[SUAudioPlayer playerStatus](self->_previewPlayer, "playerStatus");
    previewIndexPath = self->_previewIndexPath;
    v5 = self;
    v7 = 0;
  }
  -[MSStructuredPageViewController _setPreviewStatus:forIndexPath:animated:](v5, "_setPreviewStatus:forIndexPath:animated:", v6, previewIndexPath, v7);
}

- (BOOL)_handleInlinePreviewForIndexPath:(id)a3
{
  UITableView *v5;
  NSIndexPath *previewIndexPath;
  char v7;
  uint64_t v8;
  void *v9;

  v5 = -[SUTableViewController tableView](self, "tableView");
  previewIndexPath = self->_previewIndexPath;
  if (!previewIndexPath
    || (v7 = -[NSIndexPath isEqual:](previewIndexPath, "isEqual:", a3),
        -[MSStructuredPageViewController _setPreviewStatus:forIndexPath:animated:](self, "_setPreviewStatus:forIndexPath:animated:", 0, self->_previewIndexPath, 1), -[MSStructuredPageViewController _stopPreviewPlayback](self, "_stopPreviewPlayback"), (v7 & 1) == 0))
  {
    v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "itemAtIndexPath:", a3), "defaultStoreOffer"), "offerMedia"), "URL");
    if (v8)
    {
      self->_previewPlayer = (SUAudioPlayer *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8CD0]), "initWithURL:", v8);
      v9 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__playerStatusChangeNotification_, *MEMORY[0x24BEC8E48], self->_previewPlayer);
      -[MSStructuredPageViewController _setPreviewStatus:forIndexPath:animated:](self, "_setPreviewStatus:forIndexPath:animated:", -[SUAudioPlayer playerStatus](self->_previewPlayer, "playerStatus"), a3, 1);
      -[SUAudioPlayer play](self->_previewPlayer, "play");
    }

    self->_previewIndexPath = (NSIndexPath *)a3;
  }
  -[UITableView deselectRowAtIndexPath:animated:](v5, "deselectRowAtIndexPath:animated:", a3, 1);
  return 1;
}

- (BOOL)_handleMediaPreviewForIndexPath:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8D40]), "initWithItem:", objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "itemAtIndexPath:", a3));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8D48]), "initWithMediaPlayerItem:", v4);
  objc_msgSend(v5, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
  -[MSStructuredPageViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

  return 1;
}

- (BOOL)_handlePreviewForIndexPath:(id)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[SUTableDataSource structuredPage](-[SUTableViewController dataSource](self, "dataSource"), "structuredPage"), "itemList"), "itemAtIndexPath:", a3), "itemType");
  if ((unint64_t)(v5 - 1001) > 8 || ((1 << (v5 + 23)) & 0x147) == 0)
    return -[MSStructuredPageViewController _handleInlinePreviewForIndexPath:](self, "_handleInlinePreviewForIndexPath:", a3);
  else
    return -[MSStructuredPageViewController _handleMediaPreviewForIndexPath:](self, "_handleMediaPreviewForIndexPath:", a3);
}

- (void)_setPreviewStatus:(id)a3 forIndexPath:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  SUPlayerStatus *previewStatus;
  NSIndexPath *previewIndexPath;
  NSIndexPath *v11;
  NSIndexPath *v12;

  v5 = a5;
  previewStatus = self->_previewStatus;
  if (previewStatus != a3)
  {

    self->_previewStatus = (SUPlayerStatus *)a3;
  }
  previewIndexPath = self->_previewIndexPath;
  if (a4 && previewIndexPath)
  {
    if ((-[NSIndexPath isEqual:](previewIndexPath, "isEqual:", a4) & 1) != 0)
    {
LABEL_11:
      -[UITableViewCell setPreviewStatus:animated:](-[UITableView cellForRowAtIndexPath:](-[SUTableViewController tableView](self, "tableView"), "cellForRowAtIndexPath:", self->_previewIndexPath), "setPreviewStatus:animated:", a3, v5);
      goto LABEL_12;
    }
    previewIndexPath = self->_previewIndexPath;
  }
  if (previewIndexPath)
  {
    -[UITableViewCell setPreviewStatus:animated:](-[UITableView cellForRowAtIndexPath:](-[SUTableViewController tableView](self, "tableView"), "cellForRowAtIndexPath:", self->_previewIndexPath), "setPreviewStatus:animated:", 0, v5);
    v11 = self->_previewIndexPath;
  }
  else
  {
    v11 = 0;
  }

  v12 = (NSIndexPath *)objc_msgSend(a4, "copy");
  self->_previewIndexPath = v12;
  if (v12)
    goto LABEL_11;
LABEL_12:
  if (!self->_previewStatus)
  {

    self->_previewIndexPath = 0;
  }
}

- (void)_stopPreviewPlayback
{
  void *v3;

  if (self->_previewPlayer)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC8E48], 0);
    -[SUAudioPlayer stop](self->_previewPlayer, "stop");

    self->_previewPlayer = 0;
  }
}

@end
