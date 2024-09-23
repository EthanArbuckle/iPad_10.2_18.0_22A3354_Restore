@implementation CCUISensorAttributionCompactControl

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUISensorAttributionCompactControl;
  -[CCUISensorAttributionCompactControl layoutSubviews](&v3, sel_layoutSubviews);
  -[CCUISensorAttributionCompactControl _updateContentIfDisplayedAttributionsAreStaleAndLayout](self, "_updateContentIfDisplayedAttributionsAreStaleAndLayout");
}

- (void)_updateContentIfDisplayedAttributionsAreStaleAndLayout
{
  CCUISensorAttributionCompactControl *v2;
  NSSet *attributions;
  NSSet **p_displayedAttributions;
  CCUISensorAttributionCompactControl *v5;
  NSSet *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  void *v41;
  int v42;
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
  const __CFString *v55;
  __CFString *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  CCUISensorActivityData **p_displayedInactiveMicModeSelectionAttribution;
  void *v63;
  void *v64;
  id *v65;
  void *v66;
  uint64_t v67;
  char v68;
  void *v69;
  void *v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _QWORD v85[2];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v2 = self;
  v88 = *MEMORY[0x1E0C80C00];
  attributions = self->_attributions;
  p_displayedAttributions = &self->_displayedAttributions;
  if (attributions != self->_displayedAttributions
    || self->_inactiveMicModeSelectionAttribution != self->_displayedInactiveMicModeSelectionAttribution)
  {
    objc_storeStrong((id *)&self->_displayedAttributions, attributions);
    p_displayedInactiveMicModeSelectionAttribution = &v2->_displayedInactiveMicModeSelectionAttribution;
    objc_storeStrong((id *)&v2->_displayedInactiveMicModeSelectionAttribution, v2->_inactiveMicModeSelectionAttribution);
    v2->_showingCamera = 0;
    v2->_showingMicrophone = 0;
    v2->_showingInactiveMicrophone = 0;
    v2->_showingLocation = 0;
    v5 = v2;
    v2->_showingGameMode = 0;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v65 = (id *)p_displayedAttributions;
    v6 = *p_displayedAttributions;
    v7 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v68 = 0;
      v10 = *(_QWORD *)v81;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v81 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
          if (!objc_msgSend(v12, "sensorType"))
          {
            v5->_showingCamera = 1;
            v68 = objc_msgSend(v12, "usedRecently");
          }
          if (objc_msgSend(v12, "sensorType") == 1)
          {
            v5->_showingMicrophone = 1;
            v9 = objc_msgSend(v12, "usedRecently");
          }
          if (objc_msgSend(v12, "sensorType") == 2)
            v5->_showingLocation = 1;
          if (objc_msgSend(v12, "sensorType") == 3)
            v5->_showingGameMode = 1;
        }
        v8 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
      v68 = 0;
    }

    v13 = *v65;
    v14 = v13;
    v2 = v5;
    if ((!v5->_showingCamera || (v68 & 1) != 0)
      && !v5->_showingMicrophone | v9 & 1
      && *p_displayedInactiveMicModeSelectionAttribution)
    {
      v5->_showingInactiveMicrophone = 1;
      objc_msgSend(v13, "setByAddingObject:", *p_displayedInactiveMicModeSelectionAttribution);
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
    }
    CCUIUniqueSensorAttributionEntitiesForSensorActivityData(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    objc_msgSend(v16, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "displayNameForCompactView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionCompactControl delegate](v5, "delegate");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "bundleIdentifierUsingAudioVideoControlsForSensorAttributionCompactControl:", v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count") == 1)
    {
      objc_msgSend(v17, "appendString:", v19);
    }
    else if (objc_msgSend(v16, "count") == 2)
    {
      v69 = v18;
      objc_msgSend(v16, "objectAtIndex:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "displayNameForCompactView");
      v22 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "languageCode");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v66 = v24;
      if (v20)
      {
        v61 = (void *)v22;
        v63 = v19;
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        v25 = v16;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
        if (v26)
        {
          v27 = v26;
          v57 = v17;
          v59 = v14;
          v28 = *(_QWORD *)v77;
          while (2)
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v77 != v28)
                objc_enumerationMutation(v25);
              v30 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
              objc_msgSend(v30, "bundleIdentifier");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "isEqualToString:", v20);

              if (v32)
              {
                objc_msgSend(v30, "displayNameForCompactView");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = v57;
                objc_msgSend(v57, "appendString:", v43);

                v2 = v5;
                v14 = v59;
                goto LABEL_51;
              }
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
            if (v27)
              continue;
            break;
          }
          v2 = v5;
          v17 = v57;
          v14 = v59;
        }
LABEL_51:
        v18 = v69;
        v44 = v61;
        v19 = v63;
      }
      else
      {
        if ((objc_msgSend(v24, "isEqualToString:", CFSTR("es")) & 1) != 0
          || objc_msgSend(v24, "isEqualToString:", CFSTR("he")))
        {
          v45 = (void *)MEMORY[0x1E0CB3738];
          v85[0] = v19;
          v85[1] = v22;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 2);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "localizedStringByJoiningStrings:", v46);
          v44 = (void *)v22;
          v25 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "appendString:", v25);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("CONTROL_CENTER_SENSOR_STATUS_TWO_APPS_AMPERSAND"), &stru_1E8D00320, CFSTR("ControlCenterUI"));
          v44 = (void *)v22;
          v25 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v25, v19, v44);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "appendString:", v51);

        }
        v18 = v69;
      }

    }
    else if ((unint64_t)objc_msgSend(v16, "count") >= 3)
    {
      v33 = objc_msgSend(v16, "count");
      v34 = v33 - 1;
      if (v20)
      {
        v64 = v19;
        v67 = v33 - 1;
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v35 = v16;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
        if (v36)
        {
          v37 = v36;
          v70 = v18;
          v58 = v17;
          v60 = v14;
          v38 = *(_QWORD *)v73;
          while (2)
          {
            for (k = 0; k != v37; ++k)
            {
              if (*(_QWORD *)v73 != v38)
                objc_enumerationMutation(v35);
              v40 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * k);
              objc_msgSend(v40, "bundleIdentifier");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v41, "isEqualToString:", v20);

              if (v42)
              {
                objc_msgSend(v40, "displayNameForCompactView");
                v19 = (void *)objc_claimAutoreleasedReturnValue();

                v2 = v5;
                v17 = v58;
                v14 = v60;
                v18 = v70;
                goto LABEL_56;
              }
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
            if (v37)
              continue;
            break;
          }
          v2 = v5;
          v17 = v58;
          v14 = v60;
          v18 = v70;
        }
        v19 = v64;
LABEL_56:

        v34 = v67;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("CONTROL_CENTER_SENSOR_STATUS_ONE_APP_AMPERSAND_N_MORE"), &stru_1E8D00320, CFSTR("ControlCenterUI"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v48, v19, v34);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "appendString:", v49);

    }
    -[CCUISensorAttributionCompactControl setDescriptionText:](v2, "setDescriptionText:", v17);
    if (v2->_showingGameMode)
    {
      v52 = v19;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v53;
      v55 = CFSTR("CONTROL_CENTER_GAME_MODE");
    }
    else
    {
      if (!v20)
      {
        v56 = &stru_1E8D00320;
        goto LABEL_66;
      }
      v52 = v19;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v53;
      v55 = CFSTR("CONTROL_CENTER_SENSOR_STATUS_CONTROLS");
    }
    objc_msgSend(v53, "localizedStringForKey:value:table:", v55, &stru_1E8D00320, CFSTR("ControlCenterUI"));
    v56 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v19 = v52;
LABEL_66:
    -[CCUISensorAttributionCompactControl setDetailText:](v2, "setDetailText:", v56);
    -[CCUISensorAttributionCompactControl setUserInteractionEnabled:](v2, "setUserInteractionEnabled:", -[CCUISensorAttributionCompactControl activeIndicatorsCount](v2, "activeIndicatorsCount") > 0);

  }
  -[CCUISensorAttributionCompactControl _layoutIndicatorViews](v2, "_layoutIndicatorViews");
  -[CCUISensorAttributionCompactControl _layoutLabelViews](v2, "_layoutLabelViews");
  -[CCUISensorAttributionCompactControl _layoutChevronViews](v2, "_layoutChevronViews");
  -[CCUISensorAttributionCompactControl _layoutBackgroundView](v2, "_layoutBackgroundView");
}

- (void)setDescriptionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (void)_layoutIndicatorViews
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -4.0;
  if (objc_msgSend(v3, "userInterfaceLayoutDirection") == 1)
  {
    -[CCUISensorAttributionCompactControl bounds](self, "bounds");
    v4 = v5 + 4.0 + 1.0;
  }

  -[CCUISensorAttributionCompactControl _layoutSingleIndicatorView:trailingX:visible:](self, "_layoutSingleIndicatorView:trailingX:visible:", self->_cameraIndicatorView, self->_showingCamera, v4);
  -[CCUISensorAttributionCompactControl _layoutSingleIndicatorView:trailingX:visible:](self, "_layoutSingleIndicatorView:trailingX:visible:", self->_micIndicatorView, self->_showingMicrophone);
  -[CCUISensorAttributionCompactControl _layoutSingleIndicatorView:trailingX:visible:](self, "_layoutSingleIndicatorView:trailingX:visible:", self->_inactiveMicIndicatorView, self->_showingInactiveMicrophone);
  -[CCUISensorAttributionCompactControl _layoutSingleIndicatorView:trailingX:visible:](self, "_layoutSingleIndicatorView:trailingX:visible:", self->_locationIndicatorView, self->_showingLocation);
  -[CCUISensorAttributionCompactControl _layoutSingleIndicatorView:trailingX:visible:](self, "_layoutSingleIndicatorView:trailingX:visible:", self->_gameModeIndicatorView, self->_showingGameMode);
}

- (double)_layoutSingleIndicatorView:(id)a3 trailingX:(double)a4 visible:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat MinX;
  CGFloat rect;
  CGRect v35;

  v5 = a5;
  v8 = a3;
  -[CCUISensorAttributionCompactControl bounds](self, "bounds");
  if (v8)
  {
    if (!v5)
    {
      objc_msgSend(v8, "setHidden:", 1);
      v17 = *MEMORY[0x1E0DC4698];
LABEL_11:
      objc_msgSend(v8, "setAccessibilityTraits:", v17);
      goto LABEL_12;
    }
    objc_msgSend(v8, "frame");
    rect = v9;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "userInterfaceLayoutDirection") == 1)
    {
      v35.origin.x = rect;
      v35.origin.y = v11;
      v35.size.width = v13;
      v35.size.height = v15;
      CGRectGetWidth(v35);
    }

    UIRectCenteredYInRect();
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "userInterfaceLayoutDirection");
    v28 = v19;
    v29 = v21;
    v30 = v23;
    v31 = v25;
    if (v27 == 1)
      MinX = CGRectGetMinX(*(CGRect *)&v28);
    else
      MinX = CGRectGetMaxX(*(CGRect *)&v28);
    a4 = MinX;

    objc_msgSend(v8, "setFrame:", v19, v21, v23, v25);
    if (!self->_alwaysHidesSensorIcons)
    {
      objc_msgSend(v8, "setHidden:", 0);
      v17 = 0;
      goto LABEL_11;
    }
  }
LABEL_12:

  return a4;
}

- (void)sensorAttributionsChanged:(id)a3
{
  objc_storeStrong((id *)&self->_attributions, a3);
}

- (void)_layoutChevronViews
{
  UIView *chevronWrapperView;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double maximumAllowableWidth;
  void *v24;
  double v25;
  CGRect v26;

  chevronWrapperView = self->_chevronWrapperView;
  if (chevronWrapperView)
  {
    -[UIView frame](chevronWrapperView, "frame");
    -[CCUISensorAttributionCompactControl labelWrapperView](self, "labelWrapperView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "userInterfaceLayoutDirection") != 1)
    {
      v26.origin.x = v6;
      v26.origin.y = v8;
      v26.size.width = v10;
      v26.size.height = v12;
      CGRectGetWidth(v26);
      -[CCUISensorAttributionCompactControl _visibleIndicatorsWidth](self, "_visibleIndicatorsWidth");
    }

    -[CCUISensorAttributionCompactControl bounds](self, "bounds");
    UIRectCenteredYInRect();
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20 + 0.5;
    if (self->_expanded)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      maximumAllowableWidth = 0.0;
      if (objc_msgSend(v22, "userInterfaceLayoutDirection") != 1)
        maximumAllowableWidth = self->_maximumAllowableWidth;

      -[CCUISensorAttributionCompactControl superview](self, "superview");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "convertPoint:toView:", self, maximumAllowableWidth, 0.0);
      v15 = v25;

    }
    -[UIView setFrame:](self->_chevronWrapperView, "setFrame:", v15, v21, v17, v19);
    -[UIView setHidden:](self->_chevronWrapperView, "setHidden:", -[CCUISensorAttributionCompactControl activeIndicatorsCount](self, "activeIndicatorsCount") == 0);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double height;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  width = a3.width;
  -[CCUISensorAttributionCompactControl _visibleIndicatorsWidth](self, "_visibleIndicatorsWidth", a3.width, a3.height);
  v6 = v5;
  v7 = width - v5;
  -[UIImageView frame](self->_chevronImageView, "frame");
  v9 = v7 - v8 + -4.0;
  -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", v9, self->_singleIndicatorSize.height);
  v11 = v10;
  height = self->_singleIndicatorSize.height;
  -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v9, height);
  v14 = 0.0;
  if (v13 != 0.0)
    v14 = 7.0;
  v15 = v13 + v6 + v11 + v14;
  -[UIImageView frame](self->_chevronImageView, "frame");
  v17 = v15 + v16 + 7.0 + 1.0;
  v18 = height;
  result.height = v18;
  result.width = v17;
  return result;
}

- (UIImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (void)setMaximumAllowableWidth:(double)a3
{
  self->_maximumAllowableWidth = a3;
}

- (CGSize)sizeThatFitsMaximumAllowableWidth
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  v2 = self->_maximumAllowableWidth + -14.0;
  -[CCUISensorAttributionCompactControl sizeThatFits:](self, "sizeThatFits:", v2, 20.0);
  if (v3 >= v2)
    v3 = v2;
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)fixedHeight
{
  return self->_singleIndicatorSize.height;
}

- (BOOL)isDisplayingSensorStatus
{
  return -[CCUISensorAttributionCompactControl activeIndicatorsCount](self, "activeIndicatorsCount") > 0
      || -[NSSet count](self->_attributions, "count")
      || self->_inactiveMicModeSelectionAttribution != 0;
}

- (double)_visibleIndicatorsWidth
{
  double v3;
  int v4;
  int v5;

  v3 = self->_singleIndicatorSize.width
     * (double)-[CCUISensorAttributionCompactControl activeIndicatorsCount](self, "activeIndicatorsCount");
  v4 = -[CCUISensorAttributionCompactControl activeIndicatorsCount](self, "activeIndicatorsCount");
  if (v4 <= 1)
    v5 = 1;
  else
    v5 = v4;
  return v3 + (double)(v5 - 1) * 4.0;
}

- (int)activeIndicatorsCount
{
  return self->_showingLocation
       + self->_showingCamera
       + self->_showingMicrophone
       + self->_showingInactiveMicrophone
       + self->_showingGameMode;
}

- (CCUISensorAttributionCompactControl)initWithFrame:(CGRect)a3
{
  CCUISensorAttributionCompactControl *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIView *v9;
  void *v10;
  UIView *backgroundView;
  UIView *v12;
  uint64_t v13;
  UILabel *descriptionLabel;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  uint64_t v19;
  UILabel *detailLabel;
  UILabel *v21;
  void *v22;
  UILabel *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  SBFView *labelWrapperView;
  void *v28;
  void *v29;
  uint64_t v30;
  UIView *cameraIndicatorView;
  uint64_t v32;
  UIView *micIndicatorView;
  uint64_t v34;
  UIView *inactiveMicIndicatorView;
  uint64_t v36;
  UIView *locationIndicatorView;
  uint64_t v38;
  UIView *gameModeIndicatorView;
  objc_super v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)CCUISensorAttributionCompactControl;
  v3 = -[CCUISensorAttributionCompactControl initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[CCUISensorAttributionCompactControl addSubview:](v3, "addSubview:", v9);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v9;
    v12 = v9;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = (UILabel *)v13;

    v15 = v3->_descriptionLabel;
    -[CCUISensorAttributionCompactControl _fontForTitleLabel](v3, "_fontForTitleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v15, "setFont:", v16);

    -[UILabel setAdjustsFontSizeToFitWidth:](v3->_descriptionLabel, "setAdjustsFontSizeToFitWidth:", 1);
    v17 = v3->_descriptionLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v17, "setTextColor:", v18);

    -[UILabel setUserInteractionEnabled:](v3->_descriptionLabel, "setUserInteractionEnabled:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_descriptionLabel, "setAdjustsFontForContentSizeCategory:", 0);
    -[UILabel setAlpha:](v3->_descriptionLabel, "setAlpha:", 0.8);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    detailLabel = v3->_detailLabel;
    v3->_detailLabel = (UILabel *)v19;

    v21 = v3->_detailLabel;
    -[CCUISensorAttributionCompactControl _fontForTitleLabel](v3, "_fontForTitleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v21, "setFont:", v22);

    -[UILabel setAdjustsFontSizeToFitWidth:](v3->_detailLabel, "setAdjustsFontSizeToFitWidth:", 1);
    v23 = v3->_detailLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v23, "setTextColor:", v24);

    -[UILabel setUserInteractionEnabled:](v3->_detailLabel, "setUserInteractionEnabled:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_detailLabel, "setAdjustsFontForContentSizeCategory:", 0);
    -[UILabel setAlpha:](v3->_detailLabel, "setAlpha:", 0.5);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setName:", CFSTR("gaussianBlur"));
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA9F58]), "initWithFrame:", v5, v6, v7, v8);
    labelWrapperView = v3->_labelWrapperView;
    v3->_labelWrapperView = (SBFView *)v26;

    -[SBFView layer](v3->_labelWrapperView, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFilters:", v29);

    -[SBFView setAnimatedLayerProperties:](v3->_labelWrapperView, "setAnimatedLayerProperties:", &unk_1E8D18890);
    -[CCUISensorAttributionCompactControl _setBlurRadius:ofView:](v3, "_setBlurRadius:ofView:", v3->_labelWrapperView, 0.0);
    -[SBFView controlCenterApplyPrimaryContentShadow](v3->_labelWrapperView, "controlCenterApplyPrimaryContentShadow");
    -[SBFView addSubview:](v3->_labelWrapperView, "addSubview:", v3->_descriptionLabel);
    -[SBFView addSubview:](v3->_labelWrapperView, "addSubview:", v3->_detailLabel);
    -[CCUISensorAttributionCompactControl addSubview:](v3, "addSubview:", v3->_labelWrapperView);
    -[CCUISensorAttributionCompactControl _configureIndicatorViewForType:inactive:](v3, "_configureIndicatorViewForType:inactive:", 0, 0);
    v30 = objc_claimAutoreleasedReturnValue();
    cameraIndicatorView = v3->_cameraIndicatorView;
    v3->_cameraIndicatorView = (UIView *)v30;

    -[CCUISensorAttributionCompactControl _configureIndicatorViewForType:inactive:](v3, "_configureIndicatorViewForType:inactive:", 1, 0);
    v32 = objc_claimAutoreleasedReturnValue();
    micIndicatorView = v3->_micIndicatorView;
    v3->_micIndicatorView = (UIView *)v32;

    -[CCUISensorAttributionCompactControl _configureIndicatorViewForType:inactive:](v3, "_configureIndicatorViewForType:inactive:", 1, 1);
    v34 = objc_claimAutoreleasedReturnValue();
    inactiveMicIndicatorView = v3->_inactiveMicIndicatorView;
    v3->_inactiveMicIndicatorView = (UIView *)v34;

    -[CCUISensorAttributionCompactControl _configureIndicatorViewForType:inactive:](v3, "_configureIndicatorViewForType:inactive:", 2, 0);
    v36 = objc_claimAutoreleasedReturnValue();
    locationIndicatorView = v3->_locationIndicatorView;
    v3->_locationIndicatorView = (UIView *)v36;

    -[CCUISensorAttributionCompactControl _configureIndicatorViewForType:inactive:](v3, "_configureIndicatorViewForType:inactive:", 3, 0);
    v38 = objc_claimAutoreleasedReturnValue();
    gameModeIndicatorView = v3->_gameModeIndicatorView;
    v3->_gameModeIndicatorView = (UIView *)v38;

    -[CCUISensorAttributionCompactControl _configureChevronViews](v3, "_configureChevronViews");
    -[CCUISensorAttributionCompactControl addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", v3, sel_handleTouchDown, 1);
    -[CCUISensorAttributionCompactControl addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", v3, sel_handleTouchUpInside, 64);
    -[CCUISensorAttributionCompactControl addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", v3, sel_handleTouchCanceled, 384);

  }
  return v3;
}

- (void)_decideToExpandOrCompactAndForwardToDelegate:(id)a3
{
  double v4;
  double v5;
  id WeakRetained;
  void *v7;
  NSUUID *touchUUID;

  if (self->_touchUUID == a3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v5 = v4 - self->_touchDownDate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = WeakRetained;
    if (v5 <= 1.0)
      objc_msgSend(WeakRetained, "handleCompactControlExpansionEvent");
    else
      objc_msgSend(WeakRetained, "handleCompactControlCompactionEvent");

    touchUUID = self->_touchUUID;
    self->_touchUUID = 0;

  }
}

- (void)handleTouchDown
{
  void *v3;
  double v4;
  dispatch_time_t v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  CCUISensorAttributionCompactControl *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_touchUUID, v3);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_touchDownDate = v4;
  v5 = dispatch_time(0, 200000000);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __54__CCUISensorAttributionCompactControl_handleTouchDown__block_invoke;
  v11 = &unk_1E8CFC540;
  v12 = self;
  v13 = v3;
  v6 = v3;
  dispatch_after(v5, MEMORY[0x1E0C80D38], &v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "handleCompactControlTouchBeganEvent", v8, v9, v10, v11, v12);

}

uint64_t __54__CCUISensorAttributionCompactControl_handleTouchDown__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_decideToExpandOrCompactAndForwardToDelegate:", *(_QWORD *)(a1 + 40));
}

- (void)handleTouchUpInside
{
  -[CCUISensorAttributionCompactControl _decideToExpandOrCompactAndForwardToDelegate:](self, "_decideToExpandOrCompactAndForwardToDelegate:", self->_touchUUID);
}

- (void)handleTouchCanceled
{
  id WeakRetained;
  NSUUID *touchUUID;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "handleCompactControlCompactionEvent");

  touchUUID = self->_touchUUID;
  self->_touchUUID = 0;

}

- (id)_configureIndicatorViewForType:(unint64_t)a3 inactive:(BOOL)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CGAffineTransform v23;

  CCUIImageForSensorType(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v7);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v9);

  CGAffineTransformMakeScale(&v23, 0.5, 0.5);
  objc_msgSend(v8, "setTransform:", &v23);
  v10 = objc_alloc(MEMORY[0x1E0DC3890]);
  CCUIPlainCircleImage();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithImage:", v11);

  objc_msgSend(v12, "setTag:", 1);
  if (a4)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  else
    CCUIIndicatorColorForSensorType(a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTintColor:", v13);
  v14 = objc_alloc(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v12, "bounds");
  v15 = (void *)objc_msgSend(v14, "initWithFrame:");
  objc_msgSend(v15, "setUserInteractionEnabled:", 0);
  objc_msgSend(v15, "addSubview:", v12);
  objc_msgSend(v15, "addSubview:", v8);
  objc_msgSend(v15, "sendSubviewToBack:", v12);
  objc_msgSend(v8, "frame");
  objc_msgSend(v12, "bounds");
  UIRectCenteredRect();
  objc_msgSend(v8, "setFrame:");
  objc_msgSend(v15, "bounds");
  self->_singleIndicatorSize.width = v16;
  self->_singleIndicatorSize.height = v17;
  CCUIIdentifierForSensorType(a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityIdentifier:", v18);

  objc_msgSend(v15, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setShouldRasterize:", 1);

  objc_msgSend(v15, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "scale");
  objc_msgSend(v20, "setRasterizationScale:");

  -[CCUISensorAttributionCompactControl addSubview:](self, "addSubview:", v15);
  return v15;
}

- (void)_configureIndicatorView:(id)a3 forGameModeState:(unint64_t)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *gameModeState;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a3, "subviews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "tag") == 1)
        {
          gameModeState = (void *)self->_gameModeState;
          v12 = v10;
          CCUIIndicatorColorForGameModeState(gameModeState);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setTintColor:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (id)_rightChevronImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0DC4B10], 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("chevron.forward"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithTintColor:renderingMode:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_configureChevronViews
{
  id v3;
  void *v4;
  UIImageView *v5;
  UIImageView *chevronImageView;
  id v7;
  UIView *v8;
  UIView *chevronWrapperView;

  v3 = objc_alloc(MEMORY[0x1E0DC3890]);
  -[CCUISensorAttributionCompactControl _rightChevronImage](self, "_rightChevronImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (UIImageView *)objc_msgSend(v3, "initWithImage:", v4);
  chevronImageView = self->_chevronImageView;
  self->_chevronImageView = v5;

  -[UIImageView sizeToFit](self->_chevronImageView, "sizeToFit");
  v7 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[UIImageView bounds](self->_chevronImageView, "bounds");
  v8 = (UIView *)objc_msgSend(v7, "initWithFrame:");
  chevronWrapperView = self->_chevronWrapperView;
  self->_chevronWrapperView = v8;

  -[UIImageView setAutoresizingMask:](self->_chevronImageView, "setAutoresizingMask:", 18);
  -[UIImageView setAlpha:](self->_chevronImageView, "setAlpha:", 0.25);
  -[UIView addSubview:](self->_chevronWrapperView, "addSubview:", self->_chevronImageView);
  -[UIView controlCenterApplyPrimaryContentShadow](self->_chevronWrapperView, "controlCenterApplyPrimaryContentShadow");
  -[CCUISensorAttributionCompactControl _configureChevronWrapperAppearance](self, "_configureChevronWrapperAppearance");
  -[CCUISensorAttributionCompactControl addSubview:](self, "addSubview:", self->_chevronWrapperView);
}

- (void)_configureChevronWrapperAppearance
{
  void *v3;
  CGFloat v4;
  UIView **p_chevronWrapperView;
  UIView *chevronWrapperView;
  double v7;
  UIView *v8;
  __int128 v9;
  _OWORD v10[3];
  CGAffineTransform v11;

  if (self->_expanded)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = dbl_1CFC01320[objc_msgSend(v3, "userInterfaceLayoutDirection") == 1];

    p_chevronWrapperView = &self->_chevronWrapperView;
    chevronWrapperView = self->_chevronWrapperView;
    CGAffineTransformMakeRotation(&v11, v4);
    -[UIView setTransform:](chevronWrapperView, "setTransform:", &v11);
    v7 = 0.0;
  }
  else
  {
    p_chevronWrapperView = &self->_chevronWrapperView;
    v8 = self->_chevronWrapperView;
    v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v10[0] = *MEMORY[0x1E0C9BAA8];
    v10[1] = v9;
    v10[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[UIView setTransform:](v8, "setTransform:", v10);
    v7 = 1.0;
  }
  -[UIView setAlpha:](*p_chevronWrapperView, "setAlpha:", v7);
}

- (void)gameModeStateDidChange:(unint64_t)a3
{
  self->_gameModeState = a3;
  -[CCUISensorAttributionCompactControl _configureIndicatorView:forGameModeState:](self, "_configureIndicatorView:forGameModeState:", self->_gameModeIndicatorView, a3);
}

- (void)inactiveMicModeSelectionAttributionChanged:(id)a3
{
  objc_storeStrong((id *)&self->_inactiveMicModeSelectionAttribution, a3);
}

- (id)clone
{
  CCUISensorAttributionCompactControl *v3;
  CCUISensorAttributionCompactControl *v4;
  void *v5;

  v3 = [CCUISensorAttributionCompactControl alloc];
  -[CCUISensorAttributionCompactControl bounds](self, "bounds");
  v4 = -[CCUISensorAttributionCompactControl initWithFrame:](v3, "initWithFrame:");
  -[CCUISensorAttributionCompactControl delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUISensorAttributionCompactControl setDelegate:](v4, "setDelegate:", v5);

  -[CCUISensorAttributionCompactControl maximumAllowableWidth](self, "maximumAllowableWidth");
  -[CCUISensorAttributionCompactControl setMaximumAllowableWidth:](v4, "setMaximumAllowableWidth:");
  -[CCUISensorAttributionCompactControl setAlwaysHidesSensorIcons:](v4, "setAlwaysHidesSensorIcons:", 1);
  -[CCUISensorAttributionCompactControl gameModeStateDidChange:](v4, "gameModeStateDidChange:", self->_gameModeState);
  -[CCUISensorAttributionCompactControl sensorAttributionsChanged:](v4, "sensorAttributionsChanged:", self->_displayedAttributions);
  -[CCUISensorAttributionCompactControl inactiveMicModeSelectionAttributionChanged:](v4, "inactiveMicModeSelectionAttributionChanged:", self->_displayedInactiveMicModeSelectionAttribution);
  -[CCUISensorAttributionCompactControl _updateContentIfDisplayedAttributionsAreStaleAndLayout](v4, "_updateContentIfDisplayedAttributionsAreStaleAndLayout");
  -[CCUISensorAttributionCompactControl frame](self, "frame");
  -[CCUISensorAttributionCompactControl setFrame:](v4, "setFrame:");
  return v4;
}

- (void)_layoutLabelViews
{
  UILabel **p_descriptionLabel;
  UILabel *descriptionLabel;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double height;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  UILabel **p_detailLabel;
  double v23;
  double v24;
  UILabel **v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double x;
  double v34;
  double y;
  double v36;
  double width;
  double v38;
  double v39;
  void *v40;
  double v41;
  CGRect v42;
  CGRect v43;

  p_descriptionLabel = &self->_descriptionLabel;
  descriptionLabel = self->_descriptionLabel;
  if (descriptionLabel)
  {
    -[UILabel setText:](descriptionLabel, "setText:", self->_descriptionText);
    -[UILabel setText:](self->_detailLabel, "setText:", self->_detailText);
    -[CCUISensorAttributionCompactControl bounds](self, "bounds");
    v6 = v5;
    -[CCUISensorAttributionCompactControl _visibleIndicatorsWidth](self, "_visibleIndicatorsWidth");
    v8 = v6 - v7;
    -[CCUISensorAttributionCompactControl chevronImageView](self, "chevronImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v8 - v10;

    -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v11, self->_singleIndicatorSize.height);
    height = self->_singleIndicatorSize.height;
    if (v12 >= v11)
      v14 = v11;
    else
      v14 = v12;
    -[UILabel sizeThatFits:](*p_descriptionLabel, "sizeThatFits:", v11, self->_singleIndicatorSize.height);
    v16 = self->_singleIndicatorSize.height;
    v17 = 0.0;
    if (v14 != 0.0)
      v17 = 7.0;
    v18 = v15 + v17;
    if (v18 >= v11)
      v19 = v11;
    else
      v19 = v18;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "userInterfaceLayoutDirection");

    if (v21 == 1)
      p_detailLabel = &self->_detailLabel;
    else
      p_detailLabel = p_descriptionLabel;
    if (v21 == 1)
      v23 = v14;
    else
      v23 = v19;
    if (v21 == 1)
      v24 = height;
    else
      v24 = v16;
    if (v21 == 1)
      v25 = p_descriptionLabel;
    else
      v25 = &self->_detailLabel;
    if (v21 == 1)
      v26 = v19;
    else
      v26 = v14;
    if (v21 == 1)
      height = v16;
    -[UILabel setFrame:](*p_detailLabel, "setFrame:", 0.0, 0.0, v23, v24);
    -[UILabel setFrame:](*v25, "setFrame:", v23, 0.0, v26, height);
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "userInterfaceLayoutDirection");

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "userInterfaceLayoutDirection") == 1)
    {
      -[CCUISensorAttributionCompactControl chevronImageView](self, "chevronImageView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "frame");

    }
    UIRectCenteredYInRect();
    -[CCUISensorAttributionCompactControl window](self, "window");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "screen");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "scale");
    UIRectIntegralWithScale();
    x = v32;
    y = v34;
    width = v36;
    v39 = v38;

    if (self->_expanded)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v40, "userInterfaceLayoutDirection") == 1)
        v41 = -108.0;
      else
        v41 = 108.0;

      v42.origin.x = x;
      v42.origin.y = y;
      v42.size.width = width;
      v42.size.height = v39;
      v43 = CGRectOffset(v42, v41, 72.0);
      x = v43.origin.x;
      y = v43.origin.y;
      width = v43.size.width;
      v39 = v43.size.height;
    }
    -[SBFView setFrame:](self->_labelWrapperView, "setFrame:", x, y, width, v39);
  }
}

- (void)_layoutBackgroundView
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  double v16;
  id v17;

  -[CCUISensorAttributionCompactControl backgroundView](self, "backgroundView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[CCUISensorAttributionCompactControl delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifierUsingAudioVideoControlsForSensorAttributionCompactControl:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  objc_msgSend(v17, "setHidden:", v5);
  -[CCUISensorAttributionCompactControl bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "userInterfaceLayoutDirection");

  v16 = -8.0;
  if (v15 != 1)
    v16 = -2.0;
  objc_msgSend(v17, "setFrame:", v7 + v16, v9 + -2.0, v11 + 12.0, v13 + 4.0);
  objc_msgSend(v17, "_setContinuousCornerRadius:", (v13 + 4.0) * 0.5);

}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  uint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  _QWORD v11[4];
  void (**v12)(_QWORD);
  _QWORD aBlock[5];
  BOOL v14;

  v4 = a4;
  v5 = a3;
  self->_expanded = a3;
  -[CCUISensorAttributionCompactControl _setLabelWrapperViewBlurAndAlphaForExpanded:animated:](self, "_setLabelWrapperViewBlurAndAlphaForExpanded:animated:");
  -[CCUISensorAttributionCompactControl _setChevronAlphaForExpanded:animated:](self, "_setChevronAlphaForExpanded:animated:", v5, v4);
  if (v5)
  {
    -[UIView setHidden:](self->_cameraIndicatorView, "setHidden:", 1);
    -[UIView setHidden:](self->_micIndicatorView, "setHidden:", 1);
    -[UIView setHidden:](self->_inactiveMicIndicatorView, "setHidden:", 1);
    -[UIView setHidden:](self->_locationIndicatorView, "setHidden:", 1);
  }
  else
  {
    -[UIView setHidden:](self->_inactiveMicIndicatorView, "setHidden:", 0);
    if (v4)
      -[UIView setAlpha:](self->_inactiveMicIndicatorView, "setAlpha:", 0.0);
  }
  -[UIView setHidden:](self->_gameModeIndicatorView, "setHidden:", v5);
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__CCUISensorAttributionCompactControl_setExpanded_animated___block_invoke;
  aBlock[3] = &unk_1E8CFC3F8;
  aBlock[4] = self;
  v14 = v5;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  v9 = v8;
  if (v4)
  {
    v10 = (void *)MEMORY[0x1E0DC3F10];
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __60__CCUISensorAttributionCompactControl_setExpanded_animated___block_invoke_2;
    v11[3] = &unk_1E8CFC738;
    v12 = v8;
    objc_msgSend(v10, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 6, v11, 0, 0.66, 0.0, 50.0, 0.0);

  }
  else
  {
    v8[2](v8);
  }

}

uint64_t __60__CCUISensorAttributionCompactControl_setExpanded_animated___block_invoke(uint64_t a1)
{
  double v2;

  objc_msgSend(*(id *)(a1 + 32), "_layoutLabelViews");
  objc_msgSend(*(id *)(a1 + 32), "_layoutChevronViews");
  v2 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v2 = 1.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "setAlpha:", v2);
}

uint64_t __60__CCUISensorAttributionCompactControl_setExpanded_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_setChevronAlphaForExpanded:(BOOL)a3 animated:(BOOL)a4
{
  double v4;
  _QWORD v5[5];

  if (a4)
  {
    v4 = 0.66;
    if (a3)
      v4 = 0.33;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __76__CCUISensorAttributionCompactControl__setChevronAlphaForExpanded_animated___block_invoke;
    v5[3] = &unk_1E8CFC3D0;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 6, v5, 0, v4, 0.0, 50.0, 0.0);
  }
  else
  {
    -[CCUISensorAttributionCompactControl _configureChevronWrapperAppearance](self, "_configureChevronWrapperAppearance", a3);
  }
}

uint64_t __76__CCUISensorAttributionCompactControl__setChevronAlphaForExpanded_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureChevronWrapperAppearance");
}

- (void)_setLabelWrapperViewBlurAndAlphaForExpanded:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  double v12;
  _QWORD v13[5];
  BOOL v14;
  BOOL v15;

  v4 = a4;
  v5 = a3;
  -[CCUISensorAttributionCompactControl delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifierUsingAudioVideoControlsForSensorAttributionCompactControl:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __92__CCUISensorAttributionCompactControl__setLabelWrapperViewBlurAndAlphaForExpanded_animated___block_invoke;
  v13[3] = &unk_1E8CFCB20;
  v14 = v5;
  v13[4] = self;
  v15 = v9;
  v10 = _Block_copy(v13);
  v11 = v10;
  if (v4)
  {
    v12 = 0.66;
    if (v5)
      v12 = 0.33;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 6, v10, 0, v12, 0.0, 50.0, 0.0);
  }
  else
  {
    (*((void (**)(void *))v10 + 2))(v10);
  }

}

uint64_t __92__CCUISensorAttributionCompactControl__setLabelWrapperViewBlurAndAlphaForExpanded_animated___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  double v4;
  _QWORD *v5;
  uint64_t v6;
  double v7;
  double v8;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 552);
  if (v2)
  {
    v4 = 0.0;
    if (!*(_BYTE *)(a1 + 41))
      v4 = 1.0;
    objc_msgSend(v3, "setAlpha:", v4);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "setAlpha:", 0.0);
    v5 = *(_QWORD **)(a1 + 32);
    v6 = v5[74];
    v7 = 6.0;
  }
  else
  {
    v8 = 1.0;
    if (!*(_BYTE *)(a1 + 41))
      v8 = 0.0;
    objc_msgSend(v3, "setAlpha:", v8);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "setAlpha:", 1.0);
    v5 = *(_QWORD **)(a1 + 32);
    v6 = v5[74];
    v7 = 0.0;
  }
  return objc_msgSend(v5, "_setBlurRadius:ofView:", v6, v7);
}

- (id)_fontForTitleLabel
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 15.0, *MEMORY[0x1E0DC1438]);
}

- (void)_setBlurRadius:(double)a3 ofView:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(a4, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKeyPath:", v5, CFSTR("filters.gaussianBlur.inputRadius"));

}

- (CCUISensorAttributionCompactControlDelegate)delegate
{
  return (CCUISensorAttributionCompactControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)maximumAllowableWidth
{
  return self->_maximumAllowableWidth;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailLabel, a3);
}

- (SBFView)labelWrapperView
{
  return self->_labelWrapperView;
}

- (void)setLabelWrapperView:(id)a3
{
  objc_storeStrong((id *)&self->_labelWrapperView, a3);
}

- (void)setChevronImageView:(id)a3
{
  objc_storeStrong((id *)&self->_chevronImageView, a3);
}

- (UIView)chevronWrapperView
{
  return self->_chevronWrapperView;
}

- (void)setChevronWrapperView:(id)a3
{
  objc_storeStrong((id *)&self->_chevronWrapperView, a3);
}

- (BOOL)showingCamera
{
  return self->_showingCamera;
}

- (void)setShowingCamera:(BOOL)a3
{
  self->_showingCamera = a3;
}

- (BOOL)showingMicrophone
{
  return self->_showingMicrophone;
}

- (void)setShowingMicrophone:(BOOL)a3
{
  self->_showingMicrophone = a3;
}

- (BOOL)showingInactiveMicrophone
{
  return self->_showingInactiveMicrophone;
}

- (void)setShowingInactiveMicrophone:(BOOL)a3
{
  self->_showingInactiveMicrophone = a3;
}

- (BOOL)showingLocation
{
  return self->_showingLocation;
}

- (void)setShowingLocation:(BOOL)a3
{
  self->_showingLocation = a3;
}

- (BOOL)showingGameMode
{
  return self->_showingGameMode;
}

- (void)setShowingGameMode:(BOOL)a3
{
  self->_showingGameMode = a3;
}

- (unint64_t)gameModeState
{
  return self->_gameModeState;
}

- (void)setGameModeState:(unint64_t)a3
{
  self->_gameModeState = a3;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (BOOL)alwaysHidesSensorIcons
{
  return self->_alwaysHidesSensorIcons;
}

- (void)setAlwaysHidesSensorIcons:(BOOL)a3
{
  self->_alwaysHidesSensorIcons = a3;
}

- (UIView)cameraIndicatorView
{
  return self->_cameraIndicatorView;
}

- (UIView)micIndicatorView
{
  return self->_micIndicatorView;
}

- (UIView)inactiveMicIndicatorView
{
  return self->_inactiveMicIndicatorView;
}

- (UIView)locationIndicatorView
{
  return self->_locationIndicatorView;
}

- (UIView)gameModeIndicatorView
{
  return self->_gameModeIndicatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gameModeIndicatorView, 0);
  objc_storeStrong((id *)&self->_locationIndicatorView, 0);
  objc_storeStrong((id *)&self->_inactiveMicIndicatorView, 0);
  objc_storeStrong((id *)&self->_micIndicatorView, 0);
  objc_storeStrong((id *)&self->_cameraIndicatorView, 0);
  objc_storeStrong((id *)&self->_chevronWrapperView, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_labelWrapperView, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_touchUUID, 0);
  objc_storeStrong((id *)&self->_displayedInactiveMicModeSelectionAttribution, 0);
  objc_storeStrong((id *)&self->_inactiveMicModeSelectionAttribution, 0);
  objc_storeStrong((id *)&self->_displayedAttributions, 0);
  objc_storeStrong((id *)&self->_attributions, 0);
}

@end
