@implementation MPRouteButton

- (MPRouteButton)initWithFrame:(CGRect)a3
{
  MPRouteButton *v3;
  MPRouteButton *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  UIImageView *accessoryImageView;
  void *v12;
  MPRouteLabel *v13;
  MPRouteLabel *routeLabel;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MPRouteButton;
  v3 = -[MPRouteButton initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_accessoryImageSpacing = 8.0;
    v3->_alphaOverride = 1.0;
    v3->_routeLabelAxis = 0;
    v5 = objc_alloc(MEMORY[0x1E0DC3890]);
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    accessoryImageView = v4->_accessoryImageView;
    v4->_accessoryImageView = (UIImageView *)v10;

    -[UIImageView setUserInteractionEnabled:](v4->_accessoryImageView, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 6, 20.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v4->_accessoryImageView, "setPreferredSymbolConfiguration:", v12);

    -[MPRouteButton addSubview:](v4, "addSubview:", v4->_accessoryImageView);
    v13 = -[MPRouteLabel initWithFrame:]([MPRouteLabel alloc], "initWithFrame:", v6, v7, v8, v9);
    routeLabel = v4->_routeLabel;
    v4->_routeLabel = v13;

    -[MPRouteLabel setUserInteractionEnabled:](v4->_routeLabel, "setUserInteractionEnabled:", 0);
    -[MPRouteLabel _setTextColorFollowsTintColor:](v4->_routeLabel, "_setTextColorFollowsTintColor:", 1);
    -[MPRouteButton addSubview:](v4, "addSubview:", v4->_routeLabel);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v4, sel_routeDidChangeNotification_, CFSTR("MPAVRouteDidChangeNotification"), 0);

  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int64_t v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)MPRouteButton;
  -[MPRouteButton layoutSubviews](&v41, sel_layoutSubviews);
  -[MPRouteButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIImageView sizeThatFits:](self->_accessoryImageView, "sizeThatFits:", v3, v5);
  v8 = v7;
  v9 = -[MPRouteButton routeLabelAxis](self, "routeLabelAxis");
  if (v9 == 1)
  {
    -[MPRouteButton bounds](self, "bounds");
    UIRectCenteredXInRect();
    -[MPRouteButton accessoryImageSpacing](self, "accessoryImageSpacing");
    UIEdgeInsetsMakeWithEdges();
    v4 = v4 - (v11 + v12);
    v6 = v6 - (v13 + v14);
  }
  else if (!v9)
  {
    -[MPRouteButton accessoryImageSpacing](self, "accessoryImageSpacing");
    v4 = v4 - (v8 + v10 + 0.0);
  }
  if (!-[MPRouteButton isRouteLabelHidden](self, "isRouteLabelHidden"))
    -[MPRouteLabel sizeThatFits:](self->_routeLabel, "sizeThatFits:", v4, v6);
  if (!-[MPRouteButton isRouteLabelHidden](self, "isRouteLabelHidden"))
  {
    v15 = -[MPRouteButton routeLabelAxis](self, "routeLabelAxis");
    if (v15 == 1)
    {
      UIRectCenteredXInRect();
    }
    else if (!v15)
    {
      UIRectCenteredYInRect();
    }
  }
  -[MPRouteButton traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "displayScale");

  UIRectIntegralWithScale();
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[MPRouteButton bounds](self, "bounds");
  -[UIImageView setFrame:](self->_accessoryImageView, "setFrame:", MPRectByApplyingUserInterfaceLayoutDirectionInRect(v18, v20, v22, v24, v25, v26, v27, v28));
  UIRectIntegralWithScale();
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  -[MPRouteButton bounds](self, "bounds");
  -[MPRouteLabel setFrame:](self->_routeLabel, "setFrame:", MPRectByApplyingUserInterfaceLayoutDirectionInRect(v30, v32, v34, v36, v37, v38, v39, v40));
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[MPRouteButton sizeThatFits:](self, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double left;
  double top;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  -[MPRouteButton bounds](self, "bounds", a4);
  top = self->_hitRectInsets.top;
  left = self->_hitRectInsets.left;
  v15.origin.x = v9 + left;
  v15.size.width = v10 - (left + self->_hitRectInsets.right);
  v15.origin.y = v11 + top;
  v15.size.height = v12 - (top + self->_hitRectInsets.bottom);
  v14.x = x;
  v14.y = y;
  return CGRectContainsPoint(v15, v14);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int64_t routeLabelAxis;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIImageView sizeThatFits:](self->_accessoryImageView, "sizeThatFits:");
  v7 = v6;
  v9 = v8;
  if (-[MPRouteButton isRouteLabelHidden](self, "isRouteLabelHidden"))
  {
    v10 = *MEMORY[0x1E0C9D820];
    v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    -[MPRouteLabel sizeThatFits:](self->_routeLabel, "sizeThatFits:", width, height);
  }
  routeLabelAxis = self->_routeLabelAxis;
  if (routeLabelAxis == 1)
  {
    if (v10 >= v7)
      v7 = v10;
    v15 = -v11;
    if (v11 >= 0.0)
      v15 = v11;
    if (v15 > 0.00000011920929)
      v9 = v9 + v11 + self->_accessoryImageSpacing;
  }
  else if (!routeLabelAxis)
  {
    v13 = -v10;
    if (v10 >= 0.0)
      v13 = v10;
    if (v13 > 0.00000011920929)
      v7 = v7 + v10 + self->_accessoryImageSpacing;
    if (v9 >= v11)
      v14 = v9;
    else
      v14 = v11;
    if (v14 >= 0.0)
      v9 = v14;
    else
      v9 = 0.0;
  }
  v16 = v7;
  v17 = v9;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  double alphaOverride;
  double v14;
  _QWORD v15[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)MPRouteButton;
  -[MPRouteButton setHighlighted:](&v20, sel_setHighlighted_);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[MPRouteButton subviews](self, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    if (v3)
      v9 = 0.0;
    else
      v9 = 0.47;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        alphaOverride = 0.2;
        if (!v3)
          alphaOverride = self->_alphaOverride;
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "alpha");
        if (alphaOverride != v14)
        {
          v15[0] = v10;
          v15[1] = 3221225472;
          v15[2] = __32__MPRouteButton_setHighlighted___block_invoke;
          v15[3] = &unk_1E3161620;
          v15[4] = v12;
          *(double *)&v15[5] = alphaOverride;
          objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 327684, v15, 0, v9, 0.0);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v7);
  }

}

- (void)setAlpha:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPRouteButton;
  -[MPRouteButton setAlpha:](&v5, sel_setAlpha_);
  self->_alphaOverride = a3;
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPRouteButton;
  -[MPRouteButton tintColorDidChange](&v4, sel_tintColorDidChange);
  -[MPRouteButton tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPRouteLabel setTintColor:](self->_routeLabel, "setTintColor:", v3);

}

- (void)setAccessoryImage:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIImage isEqual:](self->_accessoryImage, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_accessoryImage, a3);
    -[MPRouteButton _updateAccessoryIcon](self, "_updateAccessoryIcon");
  }

}

- (void)setAccessoryImageSpacing:(double)a3
{
  double v3;

  v3 = self->_accessoryImageSpacing - a3;
  if (v3 < 0.0)
    v3 = -v3;
  if (v3 > 0.00000011920929)
  {
    self->_accessoryImageSpacing = a3;
    -[MPRouteButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[MPRouteButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setFont:(id)a3
{
  MPRouteLabel *routeLabel;
  id v5;

  routeLabel = self->_routeLabel;
  v5 = a3;
  -[MPRouteLabel setFont:](routeLabel, "setFont:", v5);
  LOBYTE(routeLabel) = -[UIFont isEqual:](self->_font, "isEqual:", v5);

  if ((routeLabel & 1) == 0)
  {
    -[MPRouteButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[MPRouteButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setRoute:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_route, a3);
  v5 = a3;
  -[MPRouteLabel setRoute:](self->_routeLabel, "setRoute:", v5);

  -[MPRouteButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[MPRouteButton setNeedsLayout](self, "setNeedsLayout");
  -[MPRouteButton _updateAccessoryIcon](self, "_updateAccessoryIcon");
}

- (BOOL)forcesUppercaseText
{
  return -[MPRouteLabel forcesUppercaseText](self->_routeLabel, "forcesUppercaseText");
}

- (void)setForcesUppercaseText:(BOOL)a3
{
  -[MPRouteLabel setForcesUppercaseText:](self->_routeLabel, "setForcesUppercaseText:", a3);
  -[MPRouteButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[MPRouteButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)setRouteLabelHidden:(BOOL)a3
{
  if (self->_routeLabelHidden != a3)
  {
    self->_routeLabelHidden = a3;
    -[MPRouteLabel setHidden:](self->_routeLabel, "setHidden:");
    -[MPRouteButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[MPRouteButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setRouteLabelAxis:(int64_t)a3
{
  if (self->_routeLabelAxis != a3)
  {
    self->_routeLabelAxis = a3;
    -[MPRouteButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[MPRouteButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return -[UIImageView preferredSymbolConfiguration](self->_accessoryImageView, "preferredSymbolConfiguration");
}

- (void)setPreferredSymbolConfiguration:(id)a3
{
  -[UIImageView setPreferredSymbolConfiguration:](self->_accessoryImageView, "setPreferredSymbolConfiguration:", a3);
}

- (NSArray)contentViews
{
  void *v2;
  void *v3;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = self->_accessoryImageView;
  -[MPRouteLabel titleLabel](self->_routeLabel, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)routeDidChangeNotification:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  MPRouteButton *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__MPRouteButton_routeDidChangeNotification___block_invoke;
  v6[3] = &unk_1E31635F8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  if (self->_routeLabel == a3)
    -[MPRouteButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)_updateAccessoryIcon
{
  MPAVRoute *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  MPAVOutputDeviceRoute *v15;
  void *v16;
  MPAVOutputDeviceRoute *v17;
  void *v18;
  MPAVRoute *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = self->_route;
    -[MPAVRoute predictedOutputDevice](v3, "predictedOutputDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[MPAVRoute isDeviceSpeakerRoute](v3, "isDeviceSpeakerRoute"))
      v5 = v4 == 0;
    else
      v5 = 0;
    if (v5)
    {
      -[UIImageView setImage:](self->_accessoryImageView, "setImage:", self->_accessoryImage);
    }
    else
    {
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = v3;
        -[MPAVRoute endpointObject](v3, "endpointObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "outputDevices");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v21;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v21 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
              v15 = [MPAVOutputDeviceRoute alloc];
              v24 = v14;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = -[MPAVOutputDeviceRoute initWithOutputDevices:](v15, "initWithOutputDevices:", v16);
              objc_msgSend(v6, "addObject:", v17);

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          }
          while (v11);
        }

        v4 = 0;
        v3 = v19;
      }
      +[MPAVRoutingController _symbolImageForRoutes:](MPAVRoutingController, "_symbolImageForRoutes:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](self->_accessoryImageView, "setImage:", v18);

    }
  }
  else
  {
    -[UIImageView setImage:](self->_accessoryImageView, "setImage:", self->_accessoryImage);
  }
  -[MPRouteButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[MPRouteButton setNeedsLayout](self, "setNeedsLayout");
}

- (UIImage)accessoryImage
{
  return self->_accessoryImage;
}

- (UIImageView)accessoryImageView
{
  return self->_accessoryImageView;
}

- (void)setAccessoryImageView:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryImageView, a3);
}

- (double)accessoryImageSpacing
{
  return self->_accessoryImageSpacing;
}

- (UIFont)font
{
  return self->_font;
}

- (UIEdgeInsets)hitRectInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hitRectInsets.top;
  left = self->_hitRectInsets.left;
  bottom = self->_hitRectInsets.bottom;
  right = self->_hitRectInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setHitRectInsets:(UIEdgeInsets)a3
{
  self->_hitRectInsets = a3;
}

- (MPAVRoute)route
{
  return self->_route;
}

- (NSString)routeTitle
{
  return self->_routeTitle;
}

- (BOOL)isRouteLabelHidden
{
  return self->_routeLabelHidden;
}

- (UIColor)overrideColor
{
  return self->_overrideColor;
}

- (void)setOverrideColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideColor, a3);
}

- (int64_t)routeLabelAxis
{
  return self->_routeLabelAxis;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideColor, 0);
  objc_storeStrong((id *)&self->_routeTitle, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_accessoryImageView, 0);
  objc_storeStrong((id *)&self->_accessoryImage, 0);
  objc_storeStrong((id *)&self->_routeLabel, 0);
}

void __44__MPRouteButton_routeDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "_updateAccessoryIcon");
}

uint64_t __32__MPRouteButton_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

@end
