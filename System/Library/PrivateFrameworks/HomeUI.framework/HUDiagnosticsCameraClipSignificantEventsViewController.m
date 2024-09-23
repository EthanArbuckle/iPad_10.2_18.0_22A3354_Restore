@implementation HUDiagnosticsCameraClipSignificantEventsViewController

- (HUDiagnosticsCameraClipSignificantEventsViewController)initWithCameraClip:(id)a3
{
  id v5;
  HUDiagnosticsCameraClipSignificantEventsViewController *v6;
  HUDiagnosticsCameraClipSignificantEventsViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUDiagnosticsCameraClipSignificantEventsViewController;
  v6 = -[HUDiagnosticsCameraClipSignificantEventsViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cameraClip, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUDiagnosticsCameraClipSignificantEventsViewController;
  -[HUDiagnosticsCameraClipSignificantEventsViewController viewDidLoad](&v7, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDiagnosticsCameraClipSignificantEventsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[HUDiagnosticsCameraClipSignificantEventsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDiagnosticsCameraClipSignificantEventsViewController eventTableView](self, "eventTableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

}

- (UITableView)eventTableView
{
  UITableView *eventTableView;
  id v4;
  void *v5;
  UITableView *v6;
  void *v7;
  UITableView *v8;

  eventTableView = self->_eventTableView;
  if (!eventTableView)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEAA58]);
    -[HUDiagnosticsCameraClipSignificantEventsViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = (UITableView *)objc_msgSend(v4, "initWithFrame:");

    -[UITableView setDataSource:](v6, "setDataSource:", self);
    -[UITableView setDelegate:](v6, "setDelegate:", self);
    -[UITableView setSemanticContentAttribute:](v6, "setSemanticContentAttribute:", 3);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[UITableView registerClass:forCellReuseIdentifier:](v6, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("HUCameraSignificantEventsBrowserCellIdentifier"));
    -[UITableView setShowsHorizontalScrollIndicator:](v6, "setShowsHorizontalScrollIndicator:", 0);
    v8 = self->_eventTableView;
    self->_eventTableView = v6;

    eventTableView = self->_eventTableView;
  }
  return eventTableView;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[HUDiagnosticsCameraClipSignificantEventsViewController cameraClip](self, "cameraClip", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "significantEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("HUCameraSignificantEventsBrowserCellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHideIcon:", 1);
  -[HUDiagnosticsCameraClipSignificantEventsViewController cameraClip](self, "cameraClip");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_sortedSignificantEvents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "row");

  objc_msgSend(v9, "objectAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitleText:", v12);

  return v7;
}

- (HMCameraClip)cameraClip
{
  return self->_cameraClip;
}

- (void)setCameraClip:(id)a3
{
  objc_storeStrong((id *)&self->_cameraClip, a3);
}

- (void)setEventTableView:(id)a3
{
  objc_storeStrong((id *)&self->_eventTableView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTableView, 0);
  objc_storeStrong((id *)&self->_cameraClip, 0);
}

@end
