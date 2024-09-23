@implementation MKTransitDepartureContainerHeaderView

- (MKTransitDepartureContainerHeaderView)initWithFrame:(CGRect)a3
{
  MKTransitDepartureContainerHeaderView *v3;
  MKTransitDepartureContainerHeaderView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKTransitDepartureContainerHeaderView;
  v3 = -[MKViewWithHairline initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MKTransitDepartureContainerHeaderView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  void *v3;
  objc_class *v4;
  void *v5;
  MKTransitInfoLabelView *v6;
  MKTransitInfoLabelView *containerArtworkView;
  double v8;
  _MKUILabel *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _MKUILabel *v14;
  _MKUILabel *containerTitleLabel;
  void *v16;
  uint64_t v17;
  UIImageView *v18;
  UIImageView *incidentImageView;
  UILayoutGuide *v20;
  UILayoutGuide *contentLayoutGuide;
  void *v22;
  void *v23;
  NSLayoutConstraint *v24;
  NSLayoutConstraint *artworkToTitleLabelHorizontalSpacingConstraint;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  NSLayoutConstraint *v35;
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
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _QWORD v79[17];

  v79[15] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "separatorColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKViewWithHairline setHairlineColor:](self, "setHairlineColor:", v3);

  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitDepartureContainerHeaderView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v5);

  v6 = -[MKTransitInfoLabelView initWithMapItem:]([MKTransitInfoLabelView alloc], "initWithMapItem:", 0);
  containerArtworkView = self->_containerArtworkView;
  self->_containerArtworkView = v6;

  -[MKTransitInfoLabelView setAccessibilityIdentifier:](self->_containerArtworkView, "setAccessibilityIdentifier:", CFSTR("ContainerArtworkView"));
  -[MKTransitInfoLabelView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerArtworkView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKTransitInfoLabelView setIconSize:](self->_containerArtworkView, "setIconSize:", 6);
  -[MKTransitInfoLabelView setShieldSize:](self->_containerArtworkView, "setShieldSize:", 6);
  -[MKTransitInfoLabelView setMaxShieldHeight:](self->_containerArtworkView, "setMaxShieldHeight:", 24.0);
  LODWORD(v8) = 1148846080;
  -[MKTransitInfoLabelView setContentCompressionResistancePriority:forAxis:](self->_containerArtworkView, "setContentCompressionResistancePriority:forAxis:", 0, v8);
  -[MKTransitDepartureContainerHeaderView addSubview:](self, "addSubview:", self->_containerArtworkView);
  v9 = [_MKUILabel alloc];
  v10 = *MEMORY[0x1E0C9D648];
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v14 = -[_MKUILabel initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], v11, v12, v13);
  containerTitleLabel = self->_containerTitleLabel;
  self->_containerTitleLabel = v14;

  -[_MKUILabel setAccessibilityIdentifier:](self->_containerTitleLabel, "setAccessibilityIdentifier:", CFSTR("ContainerTitleLabel"));
  -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_containerTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_MKUILabel setAdjustsFontForContentSizeCategory:](self->_containerTitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:", *MEMORY[0x1E0CEB538]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_mapkit_fontWithWeight:", *MEMORY[0x1E0CEB5F8]);
  v17 = objc_claimAutoreleasedReturnValue();

  v78 = (void *)v17;
  -[_MKUILabel setFont:](self->_containerTitleLabel, "setFont:", v17);
  -[_MKUILabel setNumberOfLines:](self->_containerTitleLabel, "setNumberOfLines:", 0);
  -[MKTransitDepartureContainerHeaderView addSubview:](self, "addSubview:", self->_containerTitleLabel);
  v18 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v10, v11, v12, v13);
  incidentImageView = self->_incidentImageView;
  self->_incidentImageView = v18;

  -[UIImageView setAccessibilityIdentifier:](self->_incidentImageView, "setAccessibilityIdentifier:", CFSTR("IncidentImageView"));
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_incidentImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setHidden:](self->_incidentImageView, "setHidden:", 1);
  -[UIImageView setContentMode:](self->_incidentImageView, "setContentMode:", 1);
  -[MKTransitDepartureContainerHeaderView addSubview:](self, "addSubview:", self->_incidentImageView);
  v20 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
  contentLayoutGuide = self->_contentLayoutGuide;
  self->_contentLayoutGuide = v20;

  -[MKTransitDepartureContainerHeaderView addLayoutGuide:](self, "addLayoutGuide:", self->_contentLayoutGuide);
  -[MKTransitInfoLabelView trailingAnchor](self->_containerArtworkView, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel leadingAnchor](self->_containerTitleLabel, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  artworkToTitleLabelHorizontalSpacingConstraint = self->_artworkToTitleLabelHorizontalSpacingConstraint;
  self->_artworkToTitleLabelHorizontalSpacingConstraint = v24;

  -[UIImageView image](self->_incidentImageView, "image");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "size");
  v28 = v27;

  v29 = 10.0;
  if (v28 > 0.0)
  {
    -[UIImageView image](self->_incidentImageView, "image");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "size");
    v32 = v31;
    -[UIImageView image](self->_incidentImageView, "image");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "size");
    v29 = v32 / v34 * 10.0;

  }
  v62 = (void *)MEMORY[0x1E0CB3718];
  -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitDepartureContainerHeaderView leadingAnchor](self, "leadingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:constant:", v76, 16.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v75;
  -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitDepartureContainerHeaderView topAnchor](self, "topAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:constant:", v73, 12.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v72;
  -[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitDepartureContainerHeaderView bottomAnchor](self, "bottomAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:constant:", v70, -12.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v79[2] = v69;
  -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitDepartureContainerHeaderView trailingAnchor](self, "trailingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:constant:", v67, -16.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v79[3] = v66;
  -[MKTransitInfoLabelView leadingAnchor](self->_containerArtworkView, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v64);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v79[4] = v63;
  -[MKTransitInfoLabelView topAnchor](self->_containerArtworkView, "topAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v79[5] = v59;
  -[MKTransitInfoLabelView bottomAnchor](self->_containerArtworkView, "bottomAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v57);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = self->_artworkToTitleLabelHorizontalSpacingConstraint;
  v79[6] = v56;
  v79[7] = v35;
  -[UIImageView bottomAnchor](self->_incidentImageView, "bottomAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitInfoLabelView bottomAnchor](self->_containerArtworkView, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v79[8] = v53;
  -[UIImageView leadingAnchor](self->_incidentImageView, "leadingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel leadingAnchor](self->_containerTitleLabel, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, -15.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v79[9] = v50;
  -[UIImageView widthAnchor](self->_incidentImageView, "widthAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToConstant:", 10.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v79[10] = v48;
  -[UIImageView heightAnchor](self->_incidentImageView, "heightAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToConstant:", v29);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v79[11] = v46;
  -[_MKUILabel trailingAnchor](self->_containerTitleLabel, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintLessThanOrEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v79[12] = v38;
  -[_MKUILabel topAnchor](self->_containerTitleLabel, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v79[13] = v41;
  -[_MKUILabel bottomAnchor](self->_containerTitleLabel, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v79[14] = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 15);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "activateConstraints:", v45);

}

- (void)setViewModel:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[MKTransitDepartureContainerHeaderViewModel isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[MKTransitDepartureContainerHeaderView _updateAppearance](self, "_updateAppearance");
  }

}

- (void)_updateAppearance
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  UIImageView *incidentImageView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;

  -[MKTransitDepartureContainerHeaderViewModel titleText](self->_viewModel, "titleText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKUILabel setText:](self->_containerTitleLabel, "setText:", v3);

  -[MKTransitDepartureContainerHeaderViewModel labelItems](self->_viewModel, "labelItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitInfoLabelView setLabelItems:](self->_containerArtworkView, "setLabelItems:", v4);

  -[UIImageView setHidden:](self->_incidentImageView, "setHidden:", -[MKTransitDepartureContainerHeaderViewModel showIncidentsIcon](self->_viewModel, "showIncidentsIcon") ^ 1);
  v5 = -[MKTransitDepartureContainerHeaderViewModel showIncidentsIcon](self->_viewModel, "showIncidentsIcon");
  incidentImageView = self->_incidentImageView;
  if (v5)
  {
    -[UIImageView setHidden:](incidentImageView, "setHidden:", 0);
    -[UIImageView image](self->_incidentImageView, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[MKTransitDepartureContainerHeaderView window](self, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "screen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "scale");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "scale");

      }
      MKTransitIncidentIcon();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](self->_incidentImageView, "setImage:", v12);

    }
  }
  else
  {
    -[UIImageView setHidden:](incidentImageView, "setHidden:", 1);
  }
  -[MKTransitDepartureContainerHeaderViewModel labelItems](self->_viewModel, "labelItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
    v15 = -10.0;
  else
    v15 = 0.0;
  -[MKTransitInfoLabelView setHidden:](self->_containerArtworkView, "setHidden:", v14 == 0);
  -[NSLayoutConstraint setConstant:](self->_artworkToTitleLabelHorizontalSpacingConstraint, "setConstant:", v15);
}

- (MKTransitDepartureContainerHeaderViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_artworkToTitleLabelHorizontalSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_incidentImageView, 0);
  objc_storeStrong((id *)&self->_containerTitleLabel, 0);
  objc_storeStrong((id *)&self->_containerArtworkView, 0);
}

@end
