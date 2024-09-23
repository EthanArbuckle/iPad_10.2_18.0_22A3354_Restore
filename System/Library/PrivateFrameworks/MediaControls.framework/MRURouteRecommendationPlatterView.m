@implementation MRURouteRecommendationPlatterView

- (MRURouteRecommendationPlatterView)initWithFrame:(CGRect)a3
{
  MRURouteRecommendationPlatterView *v3;
  MRURouteRecommendationPlatterView *v4;
  void *v5;
  void *v6;
  MRUVisualStylingProvider *v7;
  MRUVisualStylingProvider *stylingProvider;
  MRUActivityRouteView *v9;
  MRUActivityRouteView *activityRouteView;
  MRUNowPlayingLabelView *v11;
  MRUNowPlayingLabelView *labelView;
  UIButton *v13;
  UIButton *actionButton;
  void *v15;
  double v16;
  double v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id location;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)MRURouteRecommendationPlatterView;
  v3 = -[MRURouteRecommendationPlatterView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MRURouteRecommendationPlatterView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHitTestsAsOpaque:", 1);

    -[MRURouteRecommendationPlatterView visualStylingProviderForCategory:](v4, "visualStylingProviderForCategory:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MRUVisualStylingProvider initWithVisualStylingProvider:]([MRUVisualStylingProvider alloc], "initWithVisualStylingProvider:", v6);
    stylingProvider = v4->_stylingProvider;
    v4->_stylingProvider = v7;

    -[MRUVisualStylingProvider addObserver:](v4->_stylingProvider, "addObserver:", v4);
    v9 = objc_alloc_init(MRUActivityRouteView);
    activityRouteView = v4->_activityRouteView;
    v4->_activityRouteView = v9;

    -[MRUActivityRouteView setTranslatesAutoresizingMaskIntoConstraints:](v4->_activityRouteView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MRURouteRecommendationPlatterView addSubview:](v4, "addSubview:", v4->_activityRouteView);
    v11 = objc_alloc_init(MRUNowPlayingLabelView);
    labelView = v4->_labelView;
    v4->_labelView = v11;

    -[MRUNowPlayingLabelView setTranslatesAutoresizingMaskIntoConstraints:](v4->_labelView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MRUNowPlayingLabelView setUserInteractionEnabled:](v4->_labelView, "setUserInteractionEnabled:", 0);
    -[MRUNowPlayingLabelView setStylingProvider:](v4->_labelView, "setStylingProvider:", v4->_stylingProvider);
    -[MRUNowPlayingLabelView setLayout:](v4->_labelView, "setLayout:", 2);
    -[MRUNowPlayingLabelView setShowRoute:](v4->_labelView, "setShowRoute:", 0);
    -[MRURouteRecommendationPlatterView addSubview:](v4, "addSubview:", v4->_labelView);
    v13 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
    actionButton = v4->_actionButton;
    v4->_actionButton = v13;

    objc_msgSend(MEMORY[0x1E0DC3520], "borderlessButtonConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v4);
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __51__MRURouteRecommendationPlatterView_initWithFrame___block_invoke;
    v22 = &unk_1E5818C40;
    objc_copyWeak(&v23, &location);
    -[UIButton setConfigurationUpdateHandler:](v4->_actionButton, "setConfigurationUpdateHandler:", &v19);
    -[UIButton setConfiguration:](v4->_actionButton, "setConfiguration:", v15, v19, v20, v21, v22);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v16) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v4->_actionButton, "setContentHuggingPriority:forAxis:", 0, v16);
    LODWORD(v17) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v4->_actionButton, "setContentCompressionResistancePriority:forAxis:", 0, v17);
    -[MRURouteRecommendationPlatterView addSubview:](v4, "addSubview:", v4->_actionButton);
    -[MRURouteRecommendationPlatterView setActionType:](v4, "setActionType:", 0);
    -[MRURouteRecommendationPlatterView _addLayoutConstraints](v4, "_addLayoutConstraints");
    -[MRURouteRecommendationPlatterView updateVisualStyling](v4, "updateVisualStyling");
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
  return v4;
}

void __51__MRURouteRecommendationPlatterView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isHighlighted"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "stylingProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "blendColorForStyle:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBaseForegroundColor:", v6);

  }
  else
  {
    objc_msgSend(v3, "setBaseForegroundColor:", 0);
  }
  objc_msgSend(v7, "setConfiguration:", v3);

}

- (void)setActionType:(unint64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;

  self->_actionType = a3;
  if (a3 == 1)
  {
    +[MRUAssetsProvider suggestedRouteTVRemote](MRUAssetsProvider, "suggestedRouteTVRemote");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0DC3888];
    v6 = 25.0;
    goto LABEL_5;
  }
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.down"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0DC3888];
    v6 = 12.0;
LABEL_5:
    objc_msgSend(v5, "configurationWithPointSize:weight:", 4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageWithConfiguration:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIButton setImage:forState:](self->_actionButton, "setImage:forState:", v8, 0);
  }
  -[MRURouteRecommendationPlatterView updateVisualStyling](self, "updateVisualStyling");
}

- (void)_addLayoutConstraints
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
  void *v26;
  void *v27;
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
  void *v42;
  void *v43;
  _QWORD v44[11];

  v44[9] = *MEMORY[0x1E0C80C00];
  v27 = (void *)MEMORY[0x1E0CB3718];
  -[MRURouteRecommendationPlatterView activityRouteView](self, "activityRouteView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURouteRecommendationPlatterView topAnchor](self, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, 10.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v40;
  -[MRURouteRecommendationPlatterView activityRouteView](self, "activityRouteView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURouteRecommendationPlatterView leadingAnchor](self, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, 10.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v36;
  -[MRURouteRecommendationPlatterView activityRouteView](self, "activityRouteView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURouteRecommendationPlatterView bottomAnchor](self, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, -10.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v32;
  -[MRURouteRecommendationPlatterView activityRouteView](self, "activityRouteView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "widthAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURouteRecommendationPlatterView activityRouteView](self, "activityRouteView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "heightAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v26;
  -[MRURouteRecommendationPlatterView labelView](self, "labelView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURouteRecommendationPlatterView activityRouteView](self, "activityRouteView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22, 10.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v21;
  -[MRURouteRecommendationPlatterView labelView](self, "labelView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centerYAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURouteRecommendationPlatterView centerYAnchor](self, "centerYAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v44[5] = v17;
  -[MRURouteRecommendationPlatterView actionButton](self, "actionButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURouteRecommendationPlatterView trailingAnchor](self, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v14, -22.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44[6] = v13;
  -[MRURouteRecommendationPlatterView actionButton](self, "actionButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURouteRecommendationPlatterView labelView](self, "labelView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, 22.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44[7] = v7;
  -[MRURouteRecommendationPlatterView actionButton](self, "actionButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURouteRecommendationPlatterView centerYAnchor](self, "centerYAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v44[8] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v12);

}

- (void)updateVisualStyling
{
  unint64_t actionType;
  MRUVisualStylingProvider *stylingProvider;
  uint64_t v5;
  void *v6;
  id v7;

  actionType = self->_actionType;
  if (!actionType)
  {
    stylingProvider = self->_stylingProvider;
    v5 = 2;
    goto LABEL_5;
  }
  if (actionType == 1)
  {
    stylingProvider = self->_stylingProvider;
    v5 = 0;
LABEL_5:
    -[MRUVisualStylingProvider blendColorForStyle:](stylingProvider, "blendColorForStyle:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](self->_actionButton, "setTintColor:", v6);

  }
  -[MRUVisualStylingProvider blendColorForStyle:](self->_stylingProvider, "blendColorForStyle:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUActivityRouteView setTintColor:](self->_activityRouteView, "setTintColor:", v7);

}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (MRUActivityRouteView)activityRouteView
{
  return self->_activityRouteView;
}

- (MRUNowPlayingLabelView)labelView
{
  return self->_labelView;
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (void)setStylingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_stylingProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_activityRouteView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
}

@end
