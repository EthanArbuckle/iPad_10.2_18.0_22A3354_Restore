@implementation HomePodSelectionContentView

- (HomePodSelectionContentView)initWithTitle:(id)a3 allowsRandomVoiceSelection:(BOOL)a4
{
  id v6;
  HomePodSelectionContentView *v7;
  uint64_t v8;
  VTUIStyle *vtStyle;
  void *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HomePodSelectionContentView;
  v7 = -[HomePodSelectionContentView initWithFrame:](&v12, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle"));
    vtStyle = v7->_vtStyle;
    v7->_vtStyle = (VTUIStyle *)v8;

    v7->_allowsRandomVoiceSelection = a4;
    -[HomePodSelectionContentView _setupContentWithTitle:](v7, "_setupContentWithTitle:", v6);
    -[HomePodSelectionContentView _setupConstraintsToSize](v7, "_setupConstraintsToSize");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[HomePodSelectionContentView setBackgroundColor:](v7, "setBackgroundColor:", v10);

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SUICOrbView invalidate](self->_orbView, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HomePodSelectionContentView;
  -[HomePodSelectionContentView dealloc](&v3, "dealloc");
}

- (void)_setupContentWithTitle:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  SUICOrbView *v9;
  SUICOrbView *orbView;
  UILabel *v11;
  UILabel *selectionLabel;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  HomePodVoiceSelectionOptionsView *v17;

  v4 = a3;
  v5 = objc_alloc((Class)SUICOrbView);
  -[VTUIStyle orbLength](self->_vtStyle, "orbLength");
  v7 = v6;
  -[VTUIStyle orbLength](self->_vtStyle, "orbLength");
  v9 = (SUICOrbView *)objc_msgSend(v5, "initWithFrame:", 0.0, 0.0, v7, v8);
  orbView = self->_orbView;
  self->_orbView = v9;

  -[SUICOrbView setMode:](self->_orbView, "setMode:", 3);
  -[HomePodSelectionContentView addSubview:](self, "addSubview:", self->_orbView);
  v11 = (UILabel *)objc_alloc_init((Class)UILabel);
  selectionLabel = self->_selectionLabel;
  self->_selectionLabel = v11;

  -[UILabel setNumberOfLines:](self->_selectionLabel, "setNumberOfLines:", 3);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_selectionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = self->_selectionLabel;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VTUIStyle proxHeaderFont](self->_vtStyle, "proxHeaderFont"));
  -[UILabel setFont:](v13, "setFont:", v14);

  v15 = self->_selectionLabel;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[VTUIStyle proxHeaderColor](self->_vtStyle, "proxHeaderColor"));
  -[UILabel setTextColor:](v15, "setTextColor:", v16);

  -[UILabel setTextAlignment:](self->_selectionLabel, "setTextAlignment:", 1);
  -[UILabel setText:](self->_selectionLabel, "setText:", v4);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_selectionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HomePodSelectionContentView addSubview:](self, "addSubview:", self->_selectionLabel);
  v17 = objc_alloc_init(HomePodVoiceSelectionOptionsView);
  -[HomePodVoiceSelectionOptionsView setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HomePodSelectionContentView setVoiceOptionsView:](self, "setVoiceOptionsView:", v17);
  -[HomePodSelectionContentView addSubview:](self, "addSubview:", v17);

}

- (void)_setupConstraintsToSize
{
  void *v3;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSArray *v26;
  NSArray *constraints;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  _QWORD v43[4];
  _QWORD v44[4];

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SUICOrbView firstBaselineAnchor](self->_orbView, "firstBaselineAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[HomePodSelectionContentView topAnchor](self, "topAnchor"));
  -[VTUIStyle orbOffsetFromTopEnrollment](self->_vtStyle, "orbOffsetFromTopEnrollment");
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v35));
  v44[0] = v32;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SUICOrbView centerXAnchor](self->_orbView, "centerXAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomePodSelectionContentView centerXAnchor](self, "centerXAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v3));
  v44[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUICOrbView widthAnchor](self->_orbView, "widthAnchor"));
  -[VTUIStyle orbLength](self->_vtStyle, "orbLength");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToConstant:"));
  v44[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUICOrbView heightAnchor](self->_orbView, "heightAnchor"));
  -[VTUIStyle orbLength](self->_vtStyle, "orbLength");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToConstant:"));
  v44[3] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 4));
  objc_msgSend(v41, "addObjectsFromArray:", v9);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_selectionLabel, "topAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[SUICOrbView bottomAnchor](self->_orbView, "bottomAnchor"));
  -[VTUIStyle titleOffsetFromOrb](self->_vtStyle, "titleOffsetFromOrb");
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v36));
  v43[0] = v33;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_selectionLabel, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomePodSelectionContentView leadingAnchor](self, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v10, 0.0));
  v43[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_selectionLabel, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomePodSelectionContentView trailingAnchor](self, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 0.0));
  v43[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel heightAnchor](self->_selectionLabel, "heightAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToConstant:", 50.0));
  v43[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 4));
  objc_msgSend(v41, "addObjectsFromArray:", v17);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[HomePodVoiceSelectionOptionsView topAnchor](self->_voiceOptionsView, "topAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_selectionLabel, "bottomAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v37, 0.0));
  v42[0] = v34;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[HomePodVoiceSelectionOptionsView trailingAnchor](self->_voiceOptionsView, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[HomePodSelectionContentView trailingAnchor](self, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v28, 0.0));
  v42[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[HomePodVoiceSelectionOptionsView leadingAnchor](self->_voiceOptionsView, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[HomePodSelectionContentView leadingAnchor](self, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 0.0));
  v42[2] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[HomePodVoiceSelectionOptionsView bottomAnchor](self->_voiceOptionsView, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[HomePodSelectionContentView bottomAnchor](self, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, 0.0));
  v42[3] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 4));
  objc_msgSend(v41, "addObjectsFromArray:", v25);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v41);
  v26 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v41));
  constraints = self->_constraints;
  self->_constraints = v26;

}

- (id)viewConstraints
{
  return self->_constraints;
}

- (BOOL)showPrivacyTextView
{
  return 0;
}

- (id)footerView
{
  return 0;
}

- (void)setOutputPowerLevel:(float)a3
{
  -[SUICOrbView setPowerLevel:](self->_orbView, "setPowerLevel:");
}

- (void)setInputPowerLevel:(float)a3
{
  -[SUICOrbView setPowerLevel:](self->_orbView, "setPowerLevel:");
}

- (void)animateOrbViewToOffWithCompletion:(id)a3
{
  -[SUICOrbView animateToOffWithCompletion:](self->_orbView, "animateToOffWithCompletion:", a3);
}

- (HomePodVoiceSelectionOptionsView)voiceOptionsView
{
  return self->_voiceOptionsView;
}

- (void)setVoiceOptionsView:(id)a3
{
  objc_storeStrong((id *)&self->_voiceOptionsView, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_voiceOptionsView, 0);
  objc_storeStrong((id *)&self->_vtStyle, 0);
  objc_storeStrong((id *)&self->_selectionLabel, 0);
  objc_storeStrong((id *)&self->_orbView, 0);
  objc_storeStrong((id *)&self->_voiceSelectionPresenter, 0);
}

@end
