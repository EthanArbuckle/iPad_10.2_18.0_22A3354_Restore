@implementation HUDiagnosticsCameraClipViewController

- (HUDiagnosticsCameraClipViewController)initWithRecordingEvent:(id)a3 cameraProfile:(id)a4
{
  id v7;
  id v8;
  HUDiagnosticsCameraClipViewController *v9;
  HUDiagnosticsCameraClipViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUDiagnosticsCameraClipViewController;
  v9 = -[HUDiagnosticsCameraClipViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cameraClip, a3);
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
  v7.super_class = (Class)HUDiagnosticsCameraClipViewController;
  -[HUDiagnosticsCameraClipViewController viewDidLoad](&v7, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDiagnosticsCameraClipViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[HUDiagnosticsCameraClipViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDiagnosticsCameraClipViewController eventTableView](self, "eventTableView");
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
    -[HUDiagnosticsCameraClipViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = (UITableView *)objc_msgSend(v4, "initWithFrame:");

    -[UITableView setDataSource:](v6, "setDataSource:", self);
    -[UITableView setDelegate:](v6, "setDelegate:", self);
    -[UITableView setSemanticContentAttribute:](v6, "setSemanticContentAttribute:", 3);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[UITableView registerClass:forCellReuseIdentifier:](v6, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("HUDiagnosticsRecordingCellEventIdentifier"));
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
  return 7;
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
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  const __CFString *v24;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("HUDiagnosticsRecordingCellEventIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHideIcon:", 1);
  v8 = objc_msgSend(v6, "row");

  switch(v8)
  {
    case 0:
      v9 = (void *)MEMORY[0x1E0CB3940];
      -[HUDiagnosticsCameraClipViewController cameraClip](self, "cameraClip");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uniqueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("UUID: %@"), v11);
      goto LABEL_10;
    case 1:
      v12 = (void *)MEMORY[0x1E0CB3940];
      -[HUDiagnosticsCameraClipViewController cameraClip](self, "cameraClip");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dateOfOccurrence");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Start Date: %@"), v11);
      goto LABEL_10;
    case 2:
      v13 = (void *)MEMORY[0x1E0CB3940];
      -[HUDiagnosticsCameraClipViewController cameraClip](self, "cameraClip");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "duration");
      objc_msgSend(v13, "stringWithFormat:", CFSTR("Duration: %.2f"), v14);
      goto LABEL_14;
    case 3:
      v15 = (void *)MEMORY[0x1E0CB3940];
      -[HUDiagnosticsCameraClipViewController cameraClip](self, "cameraClip");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v10, "isComplete");
      v17 = CFSTR("NO");
      if (v16)
        v17 = CFSTR("YES");
      objc_msgSend(v15, "stringWithFormat:", CFSTR("Complete: %@"), v17);
      goto LABEL_14;
    case 4:
      v18 = (void *)MEMORY[0x1E0CB3940];
      -[HUDiagnosticsCameraClipViewController cameraClip](self, "cameraClip");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "targetFragmentDuration");
      objc_msgSend(v18, "stringWithFormat:", CFSTR("Target Fragment Duration: %.2f"), v19);
      goto LABEL_14;
    case 5:
      v20 = (void *)MEMORY[0x1E0CB3940];
      -[HUDiagnosticsCameraClipViewController cameraClip](self, "cameraClip");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "significantEvents");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("Significant Events: %lu"), objc_msgSend(v11, "count"));
LABEL_10:
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTitleText:", v21);

      goto LABEL_15;
    case 6:
      v22 = (void *)MEMORY[0x1E0CB3940];
      -[HUDiagnosticsCameraClipViewController cameraClip](self, "cameraClip");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v10, "canAskForUserFeedback");
      v24 = CFSTR("NO");
      if (v23)
        v24 = CFSTR("YES");
      objc_msgSend(v22, "stringWithFormat:", CFSTR("Can ask for feedback: %@"), v24);
LABEL_14:
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTitleText:", v11);
LABEL_15:

      break;
    default:
      return v7;
  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  HUDiagnosticsCameraClipSignificantEventsViewController *v5;
  void *v6;
  void *v7;
  HUDiagnosticsCameraClipSignificantEventsViewController *v8;

  if (objc_msgSend(a4, "row", a3) == 5)
  {
    v5 = [HUDiagnosticsCameraClipSignificantEventsViewController alloc];
    -[HUDiagnosticsCameraClipViewController cameraClip](self, "cameraClip");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HUDiagnosticsCameraClipSignificantEventsViewController initWithCameraClip:](v5, "initWithCameraClip:", v6);

    -[HUDiagnosticsCameraClipViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", v8, 1);

  }
}

- (void)setEventTableView:(id)a3
{
  objc_storeStrong((id *)&self->_eventTableView, a3);
}

- (HMCameraClip)cameraClip
{
  return self->_cameraClip;
}

- (void)setCameraClip:(id)a3
{
  objc_storeStrong((id *)&self->_cameraClip, a3);
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
  objc_storeStrong((id *)&self->_cameraClip, 0);
  objc_storeStrong((id *)&self->_eventTableView, 0);
}

@end
