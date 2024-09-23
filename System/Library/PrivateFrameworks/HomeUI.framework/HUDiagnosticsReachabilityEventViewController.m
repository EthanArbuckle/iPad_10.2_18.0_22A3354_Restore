@implementation HUDiagnosticsReachabilityEventViewController

- (HUDiagnosticsReachabilityEventViewController)initWithReachabilityEvent:(id)a3 cameraProfile:(id)a4
{
  id v7;
  id v8;
  HUDiagnosticsReachabilityEventViewController *v9;
  HUDiagnosticsReachabilityEventViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUDiagnosticsReachabilityEventViewController;
  v9 = -[HUDiagnosticsReachabilityEventViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_container, a3);
    objc_storeStrong((id *)&v10->_cameraProfile, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUDiagnosticsReachabilityEventViewController;
  -[HUDiagnosticsReachabilityEventViewController viewDidLoad](&v7, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDiagnosticsReachabilityEventViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[HUDiagnosticsReachabilityEventViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDiagnosticsReachabilityEventViewController eventTableView](self, "eventTableView");
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
    -[HUDiagnosticsReachabilityEventViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = (UITableView *)objc_msgSend(v4, "initWithFrame:");

    -[UITableView setDataSource:](v6, "setDataSource:", self);
    -[UITableView setDelegate:](v6, "setDelegate:", self);
    -[UITableView setSemanticContentAttribute:](v6, "setSemanticContentAttribute:", 3);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[UITableView registerClass:forCellReuseIdentifier:](v6, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("HUDiagnosticsReachabilityEventCellIdentifier"));
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

  -[HUDiagnosticsReachabilityEventViewController container](self, "container", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = 2;
  else
    v6 = 1;

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("HUDiagnosticsReachabilityEventCellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHideIcon:", 1);
  v8 = objc_msgSend(v6, "row");

  -[HUDiagnosticsReachabilityEventViewController container](self, "container");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "endEvent");
  else
    objc_msgSend(v9, "startEvent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitleText:", v12);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  HUDiagnosticsCameraClipViewController *v14;
  void *v15;
  HUDiagnosticsCameraClipViewController *v16;
  void *v17;
  id v18;

  if (objc_msgSend(a4, "row", a3) == 1)
  {
    -[HUDiagnosticsReachabilityEventViewController container](self, "container");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containerType");

    if (v7 == 1)
    {
      v8 = objc_opt_class();
      -[HUDiagnosticsReachabilityEventViewController container](self, "container");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "endEvent");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;
        v18 = v10;
        if (v11)
          goto LABEL_10;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v8, objc_opt_class());

      }
      v18 = 0;
LABEL_10:

      v14 = [HUDiagnosticsCameraClipViewController alloc];
      -[HUDiagnosticsReachabilityEventViewController cameraProfile](self, "cameraProfile");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[HUDiagnosticsCameraClipViewController initWithRecordingEvent:cameraProfile:](v14, "initWithRecordingEvent:cameraProfile:", v18, v15);

      -[HUDiagnosticsReachabilityEventViewController navigationController](self, "navigationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pushViewController:animated:", v16, 1);

    }
  }
}

- (void)setEventTableView:(id)a3
{
  objc_storeStrong((id *)&self->_eventTableView, a3);
}

- (HFCameraScrubberReachabilityEventContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void)setCameraProfile:(id)a3
{
  objc_storeStrong((id *)&self->_cameraProfile, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraProfile, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_eventTableView, 0);
}

@end
