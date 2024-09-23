@implementation MRUMediaControlsModuleRouteButton

- (MRUMediaControlsModuleRouteButton)init
{
  MRUMediaControlsModuleRouteButton *v2;
  MPRouteLabel *v3;
  MPRouteLabel *routeLabel;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MRUMediaControlsModuleRouteButton;
  v2 = -[MRUMediaControlsModuleRouteButton init](&v7, sel_init);
  if (v2)
  {
    v3 = (MPRouteLabel *)objc_alloc_init(MEMORY[0x1E0CC24F8]);
    routeLabel = v2->_routeLabel;
    v2->_routeLabel = v3;

    -[MPRouteLabel setUserInteractionEnabled:](v2->_routeLabel, "setUserInteractionEnabled:", 0);
    -[MPRouteLabel setUsesPredictedOutputDevice:](v2->_routeLabel, "setUsesPredictedOutputDevice:", 1);
    -[MRUMediaControlsModuleRouteButton addSubview:](v2, "addSubview:", v2->_routeLabel);
    v2->_contentScale = 1.0;
    -[MRUTransportButton setScaleOnHighlight:](v2, "setScaleOnHighlight:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_updateContentSizeCategory, *MEMORY[0x1E0DC48E8], 0);

    -[MRUMediaControlsModuleRouteButton updateVisibility](v2, "updateVisibility");
    -[MRUMediaControlsModuleRouteButton updateVisualStyling](v2, "updateVisualStyling");
    -[MRUMediaControlsModuleRouteButton updateContentSizeCategory](v2, "updateContentSizeCategory");
  }
  return v2;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 showRouteLabel;
  void *v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  MPRouteLabel **p_routeLabel;
  CGFloat v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  CGFloat v49;
  CGFloat v50;
  objc_super v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v51.receiver = self;
  v51.super_class = (Class)MRUMediaControlsModuleRouteButton;
  -[MRUTransportButton layoutSubviews](&v51, sel_layoutSubviews);
  -[MRUMediaControlsModuleRouteButton traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");

  -[MRUMediaControlsModuleRouteButton bounds](self, "bounds");
  UIRectInset();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  showRouteLabel = self->_showRouteLabel;
  -[MRUMediaControlsModuleRouteButton imageView](self, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeThatFits:", v9, v11);

  if (showRouteLabel)
  {
    v52.origin.x = v5;
    v52.origin.y = v7;
    v52.size.width = v9;
    v52.size.height = v11;
    CGRectGetMinX(v52);
    UIRectCenteredYInRect();
    UIRectRoundToScale();
    v49 = v15;
    v50 = v14;
    v17 = v16;
    v19 = v18;
    -[MRUMediaControlsModuleRouteButton bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    -[MRUMediaControlsModuleRouteButton imageView](self, "imageView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

    v53.size.height = v49;
    v53.origin.x = v50;
    v53.origin.y = v17;
    v53.size.width = v19;
    CGRectGetWidth(v53);
    UIRectInset();
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    p_routeLabel = &self->_routeLabel;
    -[MPRouteLabel sizeThatFits:](self->_routeLabel, "sizeThatFits:", v33, v35);
    v54.origin.x = v30;
    v54.origin.y = v32;
    v54.size.width = v34;
    v54.size.height = v36;
    CGRectGetMinX(v54);
  }
  else
  {
    UIRectCenteredRect();
    UIRectRoundToScale();
    v38 = v5;
    v40 = v39;
    v41 = v7;
    v43 = v42;
    v45 = v44;
    v47 = v46;
    -[MRUMediaControlsModuleRouteButton imageView](self, "imageView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setFrame:", v40, v43, v45, v47);

    p_routeLabel = &self->_routeLabel;
    -[MPRouteLabel sizeThatFits:](self->_routeLabel, "sizeThatFits:", v9, v11);
    v55.origin.x = v38;
    v55.origin.y = v41;
    v55.size.width = v9;
    v55.size.height = v11;
    CGRectGetMaxX(v55);
  }
  UIRectCenteredYInRect();
  UIRectIntegralWithScale();
  -[MRUMediaControlsModuleRouteButton bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MPRouteLabel setFrame:](*p_routeLabel, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double v5;
  CGFloat v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  if (self->_showRouteLabel)
  {
    height = a3.height;
    v5 = self->_contentScale * 27.0;
    v6 = a3.width - v5;
    -[MRUMediaControlsModuleRouteButton imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sizeThatFits:", v6, height);
    v9 = v8;

    -[MPRouteLabel sizeThatFits:](self->_routeLabel, "sizeThatFits:", v6 - v9, height);
    v11 = v5 + v9 + v10;
    v12 = self->_contentScale * 32.0;
  }
  else
  {
    v11 = MRUCGSizeMultiply(40.0, 40.0, self->_contentScale);
  }
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setRoute:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_route, a3);
  v5 = a3;
  -[MPRouteLabel setRoute:](self->_routeLabel, "setRoute:", v5);

  -[MRUMediaControlsModuleRouteButton updateLabel](self, "updateLabel");
  -[MRUMediaControlsModuleRouteButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)setShowRouteLabel:(BOOL)a3
{
  if (self->_showRouteLabel != a3)
  {
    self->_showRouteLabel = a3;
    -[MRUMediaControlsModuleRouteButton updateContentSizeCategory](self, "updateContentSizeCategory");
    -[MRUMediaControlsModuleRouteButton updateVisibility](self, "updateVisibility");
    -[MRUMediaControlsModuleRouteButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[MRUMediaControlsModuleRouteButton isEnabled](self, "isEnabled") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)MRUMediaControlsModuleRouteButton;
    -[MRUTransportButton setEnabled:](&v5, sel_setEnabled_, v3);
    -[MRUMediaControlsModuleRouteButton updateVisualStyling](self, "updateVisualStyling");
  }
}

- (void)setContentScale:(double)a3
{
  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    -[MRUMediaControlsModuleRouteButton updateContentSizeCategory](self, "updateContentSizeCategory");
  }
}

- (void)updateLabel
{
  MPAVEndpointRoute *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  _BYTE v16[24];
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = self->_route;
  -[MPAVEndpointRoute endpointObject](v3, "endpointObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predictedOutputDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[MPAVEndpointRoute isSplitRoute](v3, "isSplitRoute") & 1) != 0)
  {
    v6 = CFSTR("person.2.fill");
    goto LABEL_12;
  }
  if (v5)
  {
    v7 = objc_alloc(MEMORY[0x1E0CC22F8]);
    v18[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithOutputDevices:", v8);

    objc_msgSend(MEMORY[0x1E0CC2318], "_symbolNameForRoute:", v9);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    MCLogCategoryDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v16 = 138543874;
      *(_QWORD *)&v16[4] = objc_opt_class();
      *(_WORD *)&v16[12] = 2114;
      *(_QWORD *)&v16[14] = v6;
      *(_WORD *)&v16[22] = 2114;
      v17 = v9;
      v11 = "%{public}@ predicted output device symbol: %{public}@ | routes: %{public}@";
LABEL_10:
      _os_log_impl(&dword_1AA991000, v10, OS_LOG_TYPE_DEFAULT, v11, v16, 0x20u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  v12 = -[MPAVEndpointRoute isDeviceSpeakerRoute](v3, "isDeviceSpeakerRoute");
  v6 = CFSTR("airplayaudio");
  if (v4 && (v12 & 1) == 0)
  {
    objc_msgSend(v4, "outputDevices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "msv_map:", &__block_literal_global_34);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CC2318], "_symbolNameForRoutes:", v9);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    MCLogCategoryDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v16 = 138543874;
      *(_QWORD *)&v16[4] = objc_opt_class();
      *(_WORD *)&v16[12] = 2114;
      *(_QWORD *)&v16[14] = v6;
      *(_WORD *)&v16[22] = 2114;
      v17 = v9;
      v11 = "%{public}@ output devices symbol: %{public}@ | routes: %{public}@";
      goto LABEL_10;
    }
LABEL_11:

  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v6, *(_OWORD *)v16, *(_QWORD *)&v16[16], v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRUAsset image:](MRUAsset, "image:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUTransportButton setAsset:](self, "setAsset:", v15);

}

id __48__MRUMediaControlsModuleRouteButton_updateLabel__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)MEMORY[0x1E0CC22F8];
  v3 = a2;
  v4 = [v2 alloc];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithOutputDevices:", v5);
  return v6;
}

- (void)updateVisibility
{
  double v2;

  v2 = 1.0;
  if (!self->_showRouteLabel)
    v2 = 0.0;
  -[MPRouteLabel setAlpha:](self->_routeLabel, "setAlpha:", v2);
}

- (void)updateVisualStyling
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUMediaControlsModuleRouteButton;
  -[MRUTransportButton updateVisualStyling](&v6, sel_updateVisualStyling);
  -[MRUTransportButton stylingProvider](self, "stylingProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MRUMediaControlsModuleRouteButton isEnabled](self, "isEnabled"))
    v4 = 0;
  else
    v4 = 2;
  -[MPRouteLabel contentView](self->_routeLabel, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applyStyle:toView:", v4, v5);

}

- (void)updateContentSizeCategory
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0DC1350], "mru_controlCenterRouteButtonFontWithScale:", self->_contentScale);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MPRouteLabel setFont:](self->_routeLabel, "setFont:");
  v3 = (void *)MEMORY[0x1E0DC3888];
  if (self->_showRouteLabel)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v6, 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUMediaControlsModuleRouteButton setPreferredSymbolConfiguration:forImageInState:](self, "setPreferredSymbolConfiguration:forImageInState:", v4, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", self->_contentScale * 15.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "configurationWithFont:scale:", v4, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUMediaControlsModuleRouteButton setPreferredSymbolConfiguration:forImageInState:](self, "setPreferredSymbolConfiguration:forImageInState:", v5, 0);

  }
  -[MRUMediaControlsModuleRouteButton setNeedsLayout](self, "setNeedsLayout");

}

- (MPAVEndpointRoute)route
{
  return self->_route;
}

- (BOOL)showRouteLabel
{
  return self->_showRouteLabel;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (MPRouteLabel)routeLabel
{
  return self->_routeLabel;
}

- (void)setRouteLabel:(id)a3
{
  objc_storeStrong((id *)&self->_routeLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeLabel, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

@end
