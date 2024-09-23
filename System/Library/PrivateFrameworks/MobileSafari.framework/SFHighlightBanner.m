@implementation SFHighlightBanner

- (SFHighlightBanner)initWithHighlight:(id)a3
{
  id v5;
  SFHighlightBanner *v6;
  SFHighlightBanner *v7;
  SFThemeColorEffectView *v8;
  void *v9;
  uint64_t v10;
  SFThemeColorEffectView *backdrop;
  SWAttributionView *v12;
  SWAttributionView *attributionView;
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
  SFHighlightBanner *v31;
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
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  objc_super v50;
  _QWORD v51[8];

  v51[6] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v50.receiver = self;
  v50.super_class = (Class)SFHighlightBanner;
  v6 = -[SFHighlightBanner init](&v50, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_highlight, a3);
    v8 = [SFThemeColorEffectView alloc];
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SFThemeColorEffectView initWithEffect:](v8, "initWithEffect:", v9);
    backdrop = v7->_backdrop;
    v7->_backdrop = (SFThemeColorEffectView *)v10;

    -[SFHighlightBanner bounds](v7, "bounds");
    -[SFThemeColorEffectView setFrame:](v7->_backdrop, "setFrame:");
    -[SFThemeColorEffectView setAutoresizingMask:](v7->_backdrop, "setAutoresizingMask:", 18);
    -[SFHighlightBanner addSubview:](v7, "addSubview:", v7->_backdrop);
    -[SFHighlightBanner sendSubviewToBack:](v7, "sendSubviewToBack:", v7->_backdrop);
    v12 = (SWAttributionView *)objc_alloc_init(MEMORY[0x1E0CD7380]);
    attributionView = v7->_attributionView;
    v7->_attributionView = v12;

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD7390]), "initWithSLHighlight:", v5);
    -[SWAttributionView setHighlight:](v7->_attributionView, "setHighlight:", v14);

    -[SWAttributionView useBannerLayout](v7->_attributionView, "useBannerLayout");
    -[SWAttributionView setTranslatesAutoresizingMaskIntoConstraints:](v7->_attributionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFHighlightBanner addSubview:](v7, "addSubview:", v7->_attributionView);
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v5;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "background");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v16);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark.circle.fill"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "imageWithTintColor:renderingMode:", v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setImage:", v20);

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 6, 2, 15.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v15;
    objc_msgSend(v15, "setPreferredSymbolConfigurationForImage:", v21);

    objc_msgSend(v15, "setContentInsets:", 6.0, 6.0, 6.0, 6.0);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v15, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v22, "addTarget:action:forControlEvents:", v7, sel__close, 64);
    objc_msgSend(v22, "_sf_setMatchesIntrinsicContentSize");
    -[SFHighlightBanner addSubview:](v7, "addSubview:", v22);
    v39 = (void *)MEMORY[0x1E0CB3718];
    -[SFHighlightBanner heightAnchor](v7, "heightAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWAttributionView heightAnchor](v7->_attributionView, "heightAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v46, 16.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v45;
    -[SWAttributionView leadingAnchor](v7->_attributionView, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHighlightBanner layoutMarginsGuide](v7, "layoutMarginsGuide");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, 4.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v41;
    -[SWAttributionView centerYAnchor](v7->_attributionView, "centerYAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHighlightBanner centerYAnchor](v7, "centerYAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v37;
    -[SWAttributionView trailingAnchor](v7->_attributionView, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, -8.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v51[3] = v34;
    objc_msgSend(v22, "imageView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHighlightBanner layoutMarginsGuide](v7, "layoutMarginsGuide");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25, -4.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v51[4] = v26;
    objc_msgSend(v22, "centerYAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHighlightBanner centerYAnchor](v7, "centerYAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v51[5] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "activateConstraints:", v30);

    v31 = v7;
    v5 = v49;

  }
  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1112014848;
  -[SFHighlightBanner systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height, v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)themeDidChange
{
  id v3;

  -[SFPinnableBanner theme](self, "theme");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SFThemeColorEffectView setTheme:](self->_backdrop, "setTheme:", v3);

}

- (void)_close
{
  void (**closeActionHandler)(id, SFHighlightBanner *);

  closeActionHandler = (void (**)(id, SFHighlightBanner *))self->_closeActionHandler;
  if (closeActionHandler)
    closeActionHandler[2](closeActionHandler, self);
}

- (SLHighlight)highlight
{
  return self->_highlight;
}

- (id)closeActionHandler
{
  return self->_closeActionHandler;
}

- (void)setCloseActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_closeActionHandler, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_attributionView, 0);
  objc_storeStrong((id *)&self->_backdrop, 0);
}

@end
