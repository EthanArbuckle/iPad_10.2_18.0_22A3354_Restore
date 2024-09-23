@implementation HUDiagnosticsCameraTimelineView

- (HUDiagnosticsCameraTimelineView)initWithFrame:(CGRect)a3
{
  HUDiagnosticsCameraTimelineView *v3;
  UILabel *v4;
  UILabel *cameraStatusLabel;
  UILabel *v6;
  UILabel *currentPositionLabel;
  UILabel *v8;
  UILabel *currentEventLabel;
  UILabel *v10;
  UILabel *currentTimelineStateLabel;
  UIButton *v12;
  void *v13;
  void *v14;
  UIButton *moreButton;
  UIButton *v16;
  id v17;
  void *v18;
  void *v19;
  objc_super v21;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)HUDiagnosticsCameraTimelineView;
  v3 = -[HUDiagnosticsCameraTimelineView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    cameraStatusLabel = v3->_cameraStatusLabel;
    v3->_cameraStatusLabel = v4;

    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    currentPositionLabel = v3->_currentPositionLabel;
    v3->_currentPositionLabel = v6;

    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    currentEventLabel = v3->_currentEventLabel;
    v3->_currentEventLabel = v8;

    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    currentTimelineStateLabel = v3->_currentTimelineStateLabel;
    v3->_currentTimelineStateLabel = v10;

    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v12 = (UIButton *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v12, "setTitle:forState:", CFSTR("Event Details"), 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v12, "setTitleColor:forState:", v13, 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemDarkGrayColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v12, "setBackgroundColor:", v14);

    moreButton = v3->_moreButton;
    v3->_moreButton = v12;
    v16 = v12;

    v17 = objc_alloc(MEMORY[0x1E0CEA9E0]);
    v22[0] = v3->_cameraStatusLabel;
    v22[1] = v3->_currentTimelineStateLabel;
    v22[2] = v3->_currentPositionLabel;
    v22[3] = v3->_currentEventLabel;
    v22[4] = v3->_moreButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)objc_msgSend(v17, "initWithArrangedSubviews:", v18);
    objc_msgSend(v19, "setAxis:", 1);
    objc_msgSend(v19, "setDistribution:", 1);
    -[HUDiagnosticsCameraTimelineView bounds](v3, "bounds");
    objc_msgSend(v19, "setFrame:");
    objc_msgSend(v19, "setAutoresizingMask:", 18);
    -[HUDiagnosticsCameraTimelineView addSubview:](v3, "addSubview:", v19);

  }
  return v3;
}

- (void)updateWithPlaybackEngine:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;

  v26 = a3;
  objc_msgSend(v26, "timeControlStatusDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDiagnosticsCameraTimelineView cameraStatusLabel](self, "cameraStatusLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(v26, "timelineStateDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDiagnosticsCameraTimelineView currentTimelineStateLabel](self, "currentTimelineStateLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(v26, "playbackPosition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clipPlaybackDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDiagnosticsCameraTimelineView currentPositionLabel](self, "currentPositionLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  objc_msgSend(v26, "currentClip");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDiagnosticsCameraTimelineView currentEventLabel](self, "currentEventLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  -[HUDiagnosticsCameraTimelineView setHidden:](self, "setHidden:", objc_msgSend(v26, "engineMode") == 0);
  if (objc_msgSend(v26, "timelineState") == 2)
  {
    objc_opt_class();
    objc_msgSend(v26, "clipPlayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "player");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "asset");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
    v21 = v20;

    objc_msgSend(v21, "resourceLoader");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
      objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemDarkGrayColor");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v24;
  -[UIButton setBackgroundColor:](self->_moreButton, "setBackgroundColor:", v24);

}

- (UILabel)cameraStatusLabel
{
  return self->_cameraStatusLabel;
}

- (void)setCameraStatusLabel:(id)a3
{
  objc_storeStrong((id *)&self->_cameraStatusLabel, a3);
}

- (UILabel)currentPositionLabel
{
  return self->_currentPositionLabel;
}

- (void)setCurrentPositionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_currentPositionLabel, a3);
}

- (UILabel)currentEventLabel
{
  return self->_currentEventLabel;
}

- (void)setCurrentEventLabel:(id)a3
{
  objc_storeStrong((id *)&self->_currentEventLabel, a3);
}

- (UIButton)moreButton
{
  return self->_moreButton;
}

- (void)setMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_moreButton, a3);
}

- (UILabel)currentTimelineStateLabel
{
  return self->_currentTimelineStateLabel;
}

- (void)setCurrentTimelineStateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_currentTimelineStateLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTimelineStateLabel, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_currentEventLabel, 0);
  objc_storeStrong((id *)&self->_currentPositionLabel, 0);
  objc_storeStrong((id *)&self->_cameraStatusLabel, 0);
}

@end
