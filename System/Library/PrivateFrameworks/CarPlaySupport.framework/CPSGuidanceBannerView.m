@implementation CPSGuidanceBannerView

- (CPSGuidanceBannerView)initWithBannerItem:(id)a3
{
  CPSGuidanceBannerView *v3;
  CPSAbridgableLabel *v4;
  CPSAbridgableLabel *guidanceTextLabel;
  CPSAbridgableLabel *v6;
  CPSAbridgableLabel *guidanceDetailTextLabel;
  double v8;
  UIImageView *v9;
  UIImageView *guidanceImageView;
  double v11;
  double v12;
  uint64_t v13;
  UIImageView *applicationIconImageView;
  CPUIBannerViewButton *v15;
  CPUIBannerViewButton *actionButton;
  CPSGuidanceBannerView *v18;
  CPSAbridgableLabel *v19;
  id v20;
  CPSAbridgableLabel *v21;
  id v22;
  id v23;
  id v24;
  CPSGuidanceBannerView *v25;
  CPImageSet *v26;
  CPSBannerItem *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  objc_super v72;
  id location[2];
  CPSGuidanceBannerView *v74;
  _QWORD v75[16];

  v75[15] = *MEMORY[0x24BDAC8D0];
  v74 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v74;
  v74 = 0;
  v72.receiver = v3;
  v72.super_class = (Class)CPSGuidanceBannerView;
  v74 = -[CPSBannerView initWithBannerItem:](&v72, sel_initWithBannerItem_, location[0]);
  objc_storeStrong((id *)&v74, v74);
  if (v74)
  {
    v71 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v70 = objc_alloc_init(MEMORY[0x24BDF6DD0]);
    objc_msgSend(v70, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v70, "setAxis:");
    objc_msgSend(v70, "setBaselineRelativeArrangement:", 1);
    objc_msgSend(v70, "setSpacing:", 18.0);
    objc_msgSend(v70, "setAlignment:");
    -[CPSGuidanceBannerView addSubview:](v74, "addSubview:", v70);
    objc_storeStrong((id *)&v74->_labelStackView, v70);
    v4 = objc_alloc_init(CPSAbridgableLabel);
    guidanceTextLabel = v74->_guidanceTextLabel;
    v74->_guidanceTextLabel = v4;

    v19 = v74->_guidanceTextLabel;
    v20 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "monospacedDigitSystemFontOfSize:weight:");
    -[CPSAbridgableLabel setFont:](v19, "setFont:");

    -[CPSAbridgableLabel setTranslatesAutoresizingMaskIntoConstraints:](v74->_guidanceTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPSAbridgableLabel setContentHuggingPriority:forAxis:](v74->_guidanceTextLabel, "setContentHuggingPriority:forAxis:", 0);
    -[CPSAbridgableLabel sizeToFit](v74->_guidanceTextLabel, "sizeToFit");
    -[CPSAbridgableLabel setTextColor:](v74->_guidanceTextLabel, "setTextColor:", v71);
    objc_msgSend(v70, "addArrangedSubview:", v74->_guidanceTextLabel);
    v6 = objc_alloc_init(CPSAbridgableLabel);
    guidanceDetailTextLabel = v74->_guidanceDetailTextLabel;
    v74->_guidanceDetailTextLabel = v6;

    v21 = v74->_guidanceDetailTextLabel;
    v22 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 16.0, *MEMORY[0x24BDF7888]);
    -[CPSAbridgableLabel setFont:](v21, "setFont:");

    -[CPSAbridgableLabel setTranslatesAutoresizingMaskIntoConstraints:](v74->_guidanceDetailTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPSAbridgableLabel sizeToFit](v74->_guidanceDetailTextLabel, "sizeToFit");
    -[CPSAbridgableLabel setTextColor:](v74->_guidanceDetailTextLabel, "setTextColor:", v71);
    LODWORD(v8) = 1112014848;
    -[CPSAbridgableLabel setContentHuggingPriority:forAxis:](v74->_guidanceDetailTextLabel, "setContentHuggingPriority:forAxis:", 0, v8);
    objc_msgSend(v70, "addArrangedSubview:", v74->_guidanceDetailTextLabel);
    v74->_currentInterfaceStyle = 0;
    v9 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
    guidanceImageView = v74->_guidanceImageView;
    v74->_guidanceImageView = v9;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v74->_guidanceImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v74->_guidanceImageView, "setContentMode:", 1);
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v74->_guidanceImageView, "setContentCompressionResistancePriority:forAxis:", 0);
    v23 = (id)-[UIImageView widthAnchor](v74->_guidanceImageView, "widthAnchor");
    v69 = (id)objc_msgSend(v23, "constraintLessThanOrEqualToConstant:", 92.0);

    LODWORD(v11) = 1148846080;
    objc_msgSend(v69, "setPriority:", v11);
    v24 = (id)-[UIImageView heightAnchor](v74->_guidanceImageView, "heightAnchor");
    v68 = (id)objc_msgSend(v24, "constraintLessThanOrEqualToConstant:", 38.0);

    LODWORD(v12) = 1148846080;
    objc_msgSend(v68, "setPriority:", v12);
    v25 = v74;
    v27 = -[CPSBannerView bannerItem](v74, "bannerItem");
    v26 = -[CPSBannerItem imageSet](v27, "imageSet");
    -[CPSGuidanceBannerView _setGuidanceImageViewForImageSet:](v25, "_setGuidanceImageViewForImageSet:");

    -[CPSGuidanceBannerView addSubview:](v74, "addSubview:", v74->_guidanceImageView);
    v28 = objc_alloc(MEMORY[0x24BDF6AE8]);
    v29 = -[CPSBannerView applicationIconImage](v74, "applicationIconImage");
    v13 = objc_msgSend(v28, "initWithImage:");
    applicationIconImageView = v74->_applicationIconImageView;
    v74->_applicationIconImageView = (UIImageView *)v13;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v74->_applicationIconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPSGuidanceBannerView addSubview:](v74, "addSubview:", v74->_applicationIconImageView);
    v15 = (CPUIBannerViewButton *)(id)objc_msgSend(MEMORY[0x24BE15368], "buttonWithChevronImage");
    actionButton = v74->_actionButton;
    v74->_actionButton = v15;

    -[CPUIBannerViewButton setTranslatesAutoresizingMaskIntoConstraints:](v74->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CPSGuidanceBannerView addSubview:](v74, "addSubview:", v74->_actionButton);
    -[CPSGuidanceBannerView _updateBannerSelectedState](v74, "_updateBannerSelectedState");
    v66 = (id)-[CPUIBannerViewButton trailingAnchor](v74->_actionButton, "trailingAnchor");
    v65 = (id)-[CPSGuidanceBannerView trailingAnchor](v74, "trailingAnchor");
    v64 = (id)objc_msgSend(v66, "constraintEqualToAnchor:constant:", -16.0);
    v75[0] = v64;
    v63 = (id)-[CPUIBannerViewButton centerYAnchor](v74->_actionButton, "centerYAnchor");
    v62 = (id)-[CPSGuidanceBannerView centerYAnchor](v74, "centerYAnchor");
    v61 = (id)objc_msgSend(v63, "constraintEqualToAnchor:");
    v75[1] = v61;
    v60 = (id)-[UIImageView leadingAnchor](v74->_applicationIconImageView, "leadingAnchor");
    v59 = (id)-[CPSGuidanceBannerView leadingAnchor](v74, "leadingAnchor");
    v58 = (id)objc_msgSend(v60, "constraintEqualToAnchor:constant:", 16.0);
    v75[2] = v58;
    v57 = (id)-[UIImageView centerYAnchor](v74->_applicationIconImageView, "centerYAnchor");
    v56 = (id)-[CPSGuidanceBannerView centerYAnchor](v74, "centerYAnchor");
    v55 = (id)objc_msgSend(v57, "constraintEqualToAnchor:");
    v75[3] = v55;
    v54 = (id)-[UIImageView widthAnchor](v74->_applicationIconImageView, "widthAnchor");
    v53 = (id)objc_msgSend(v54, "constraintEqualToConstant:");
    v75[4] = v53;
    v52 = (id)-[UIImageView heightAnchor](v74->_applicationIconImageView, "heightAnchor");
    v51 = (id)objc_msgSend(v52, "constraintEqualToConstant:", 29.0);
    v75[5] = v51;
    v50 = (id)-[UIImageView leadingAnchor](v74->_guidanceImageView, "leadingAnchor");
    v49 = (id)-[UIImageView trailingAnchor](v74->_applicationIconImageView, "trailingAnchor");
    v48 = (id)objc_msgSend(v50, "constraintEqualToAnchor:constant:");
    v75[6] = v48;
    v47 = (id)-[UIImageView centerYAnchor](v74->_guidanceImageView, "centerYAnchor");
    v46 = (id)-[CPSGuidanceBannerView centerYAnchor](v74, "centerYAnchor");
    v45 = (id)objc_msgSend(v47, "constraintEqualToAnchor:");
    v75[7] = v45;
    v75[8] = v68;
    v75[9] = v69;
    v44 = (id)-[UIStackView leadingAnchor](v74->_labelStackView, "leadingAnchor");
    v43 = (id)-[UIImageView trailingAnchor](v74->_guidanceImageView, "trailingAnchor");
    v42 = (id)objc_msgSend(v44, "constraintEqualToAnchor:constant:", 10.0);
    v75[10] = v42;
    v41 = (id)-[UIStackView centerYAnchor](v74->_labelStackView, "centerYAnchor");
    v40 = (id)-[CPSGuidanceBannerView centerYAnchor](v74, "centerYAnchor");
    v39 = (id)objc_msgSend(v41, "constraintEqualToAnchor:");
    v75[11] = v39;
    v38 = (id)-[UIStackView topAnchor](v74->_labelStackView, "topAnchor");
    v37 = (id)-[CPSGuidanceBannerView topAnchor](v74, "topAnchor");
    v36 = (id)objc_msgSend(v38, "constraintGreaterThanOrEqualToAnchor:");
    v75[12] = v36;
    v35 = (id)-[UIStackView bottomAnchor](v74->_labelStackView, "bottomAnchor");
    v34 = (id)-[CPSGuidanceBannerView bottomAnchor](v74, "bottomAnchor");
    v33 = (id)objc_msgSend(v35, "constraintLessThanOrEqualToAnchor:");
    v75[13] = v33;
    v32 = (id)-[UIStackView trailingAnchor](v74->_labelStackView, "trailingAnchor");
    v31 = (id)-[CPUIBannerViewButton leadingAnchor](v74->_actionButton, "leadingAnchor");
    v30 = (id)objc_msgSend(v32, "constraintEqualToAnchor:constant:", -10.0);
    v75[14] = v30;
    v67 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v75, 15);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v67);
    -[CPSGuidanceBannerView _updateLabels](v74, "_updateLabels");
    objc_storeStrong(&v67, 0);
    objc_storeStrong(&v68, 0);
    objc_storeStrong(&v69, 0);
    objc_storeStrong(&v70, 0);
    objc_storeStrong(&v71, 0);
  }
  v18 = v74;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v74, 0);
  return v18;
}

- (void)_updateLabels
{
  CPSAbridgableLabel *v2;
  id v3;
  id v4;
  CPSAbridgableLabel *guidanceDetailTextLabel;
  id v6;
  CPSBannerItem *v7;
  NSArray *v8;
  BOOL v9;
  BOOL v10;
  CPSAbridgableLabel *guidanceTextLabel;
  id v12;
  id v13;
  char v14;
  id v15;
  char v16;
  id v17;
  char v18;
  id v19;
  id location[2];
  CPSGuidanceBannerView *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = -[CPSBannerView bannerItem](self, "bannerItem");
  guidanceTextLabel = v21->_guidanceTextLabel;
  v12 = (id)objc_msgSend(location[0], "textVariants");
  -[CPSAbridgableLabel setTextVariants:](guidanceTextLabel, "setTextVariants:");

  v13 = (id)objc_msgSend(location[0], "textVariants");
  v18 = 0;
  v16 = 0;
  v14 = 0;
  if (!v13
    || (v19 = (id)objc_msgSend(location[0], "textVariants"),
        v18 = 1,
        v10 = 0,
        !objc_msgSend(v19, "count")))
  {
    v17 = (id)objc_msgSend(location[0], "detailTextVariants");
    v16 = 1;
    v9 = 1;
    if (!v17)
    {
      v15 = (id)objc_msgSend(location[0], "attributedDetailTextVariants");
      v14 = 1;
      v9 = v15 != 0;
    }
    v10 = v9;
  }
  if ((v14 & 1) != 0)

  if ((v16 & 1) != 0)
  if ((v18 & 1) != 0)

  if (v10)
    -[CPSAbridgableLabel setNumberOfLines:](v21->_guidanceDetailTextLabel, "setNumberOfLines:", 2);
  else
    -[CPSAbridgableLabel setNumberOfLines:](v21->_guidanceDetailTextLabel, "setNumberOfLines:", 1);
  v7 = -[CPSBannerView bannerItem](v21, "bannerItem");
  v8 = -[CPSBannerItem attributedDetailTextVariants](v7, "attributedDetailTextVariants");

  if (v8)
  {
    guidanceDetailTextLabel = v21->_guidanceDetailTextLabel;
    v6 = (id)objc_msgSend(location[0], "attributedDetailTextVariants");
    -[CPSAbridgableLabel setAttributedTextVariants:](guidanceDetailTextLabel, "setAttributedTextVariants:");

  }
  else
  {
    v4 = (id)objc_msgSend(location[0], "detailTextVariants");

    if (v4)
    {
      v2 = v21->_guidanceDetailTextLabel;
      v3 = (id)objc_msgSend(location[0], "detailTextVariants");
      -[CPSAbridgableLabel setTextVariants:](v2, "setTextVariants:");

    }
  }
  objc_storeStrong(location, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v3;
  UIImageView *v4;
  CPSGuidanceBannerView *v5;
  CPImageSet *v6;
  CPSBannerItem *v7;
  objc_super v8;
  id location[2];
  CPSGuidanceBannerView *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8.receiver = v10;
  v8.super_class = (Class)CPSGuidanceBannerView;
  -[CPSGuidanceBannerView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, location[0]);
  v4 = -[CPSGuidanceBannerView applicationIconImageView](v10, "applicationIconImageView");
  v3 = -[CPSBannerView applicationIconImage](v10, "applicationIconImage");
  -[UIImageView setImage:](v4, "setImage:");

  v5 = v10;
  v7 = -[CPSBannerView bannerItem](v10, "bannerItem");
  v6 = -[CPSBannerItem imageSet](v7, "imageSet");
  -[CPSGuidanceBannerView _setGuidanceImageViewForImageSet:](v5, "_setGuidanceImageViewForImageSet:");

  -[CPSGuidanceBannerView _updateBannerSelectedState](v10, "_updateBannerSelectedState");
  -[CPSGuidanceBannerView _updateLabels](v10, "_updateLabels");
  objc_storeStrong(location, 0);
}

- (void)updateBannerWithBannerItem:(id)a3
{
  CPSGuidanceBannerView *v3;
  CPImageSet *v4;
  CPSBannerItem *v5;
  objc_super v6;
  id location[2];
  CPSGuidanceBannerView *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6.receiver = v8;
  v6.super_class = (Class)CPSGuidanceBannerView;
  -[CPSBannerView updateBannerWithBannerItem:](&v6, sel_updateBannerWithBannerItem_, location[0]);
  v3 = v8;
  v5 = -[CPSBannerView bannerItem](v8, "bannerItem");
  v4 = -[CPSBannerItem imageSet](v5, "imageSet");
  -[CPSGuidanceBannerView _setGuidanceImageViewForImageSet:](v3, "_setGuidanceImageViewForImageSet:");

  -[CPSGuidanceBannerView _updateLabels](v8, "_updateLabels");
  objc_storeStrong(location, 0);
}

- (void)_setGuidanceImageViewForImageSet:(id)a3
{
  id v3;
  id v4;
  UIImageView *guidanceImageView;
  id v6;
  id v7;
  uint64_t v8;
  id location[2];
  CPSGuidanceBannerView *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = (id)-[CPSGuidanceBannerView traitCollection](v10, "traitCollection");
  v8 = objc_msgSend(v7, "userInterfaceStyle");

  if (v8 == 2)
  {
    guidanceImageView = v10->_guidanceImageView;
    v6 = (id)objc_msgSend(location[0], "darkContentImage");
    -[UIImageView setImage:](guidanceImageView, "setImage:");

  }
  else
  {
    v4 = (id)objc_msgSend(location[0], "lightContentImage", v10->_guidanceImageView);
    objc_msgSend(v3, "setImage:");

  }
  objc_storeStrong(location, 0);
}

- (void)_updateBannerSelectedState
{
  CPUIBannerViewButton *v2;
  id v3;
  BOOL v4;
  char v5;
  id v6;

  v3 = (id)-[CPSGuidanceBannerView traitCollection](self, "traitCollection");
  v5 = 0;
  v4 = 1;
  if ((objc_msgSend(v3, "interactionModel") & 2) != 2)
  {
    v6 = (id)-[CPSGuidanceBannerView traitCollection](self, "traitCollection");
    v5 = 1;
    v4 = objc_msgSend(v6, "primaryInteractionModel") == 8;
  }
  v2 = -[CPSGuidanceBannerView actionButton](self, "actionButton");
  -[CPUIBannerViewButton setSelected:](v2, "setSelected:", v4);

  if ((v5 & 1) != 0)
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
  objc_storeStrong((id *)&self->_labelStackView, a3);
}

- (CPUIBannerViewButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (UIImageView)applicationIconImageView
{
  return self->_applicationIconImageView;
}

- (void)setApplicationIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_applicationIconImageView, a3);
}

- (UIImageView)guidanceImageView
{
  return self->_guidanceImageView;
}

- (void)setGuidanceImageView:(id)a3
{
  objc_storeStrong((id *)&self->_guidanceImageView, a3);
}

- (CPSAbridgableLabel)guidanceTextLabel
{
  return self->_guidanceTextLabel;
}

- (void)setGuidanceTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_guidanceTextLabel, a3);
}

- (CPSAbridgableLabel)guidanceDetailTextLabel
{
  return self->_guidanceDetailTextLabel;
}

- (void)setGuidanceDetailTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_guidanceDetailTextLabel, a3);
}

- (int64_t)currentInterfaceStyle
{
  return self->_currentInterfaceStyle;
}

- (void)setCurrentInterfaceStyle:(int64_t)a3
{
  self->_currentInterfaceStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidanceDetailTextLabel, 0);
  objc_storeStrong((id *)&self->_guidanceTextLabel, 0);
  objc_storeStrong((id *)&self->_guidanceImageView, 0);
  objc_storeStrong((id *)&self->_applicationIconImageView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
}

@end
