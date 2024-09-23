@implementation LPCaptionBarPresentationProperties

- (LPCaptionBarPresentationProperties)init
{
  LPCaptionBarPresentationProperties *v2;
  LPCaptionBarPresentationProperties *v3;
  LPCaptionBarPresentationProperties *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LPCaptionBarPresentationProperties;
  v2 = -[LPCaptionBarPresentationProperties init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (LPCaptionRowPresentationProperties)aboveTop
{
  LPCaptionRowPresentationProperties *aboveTop;
  LPCaptionRowPresentationProperties *v4;
  LPCaptionRowPresentationProperties *v5;

  aboveTop = self->_aboveTop;
  if (!aboveTop)
  {
    v4 = objc_alloc_init(LPCaptionRowPresentationProperties);
    v5 = self->_aboveTop;
    self->_aboveTop = v4;

    aboveTop = self->_aboveTop;
  }
  return aboveTop;
}

- (LPCaptionRowPresentationProperties)top
{
  LPCaptionRowPresentationProperties *top;
  LPCaptionRowPresentationProperties *v4;
  LPCaptionRowPresentationProperties *v5;

  top = self->_top;
  if (!top)
  {
    v4 = objc_alloc_init(LPCaptionRowPresentationProperties);
    v5 = self->_top;
    self->_top = v4;

    top = self->_top;
  }
  return top;
}

- (LPCaptionRowPresentationProperties)bottom
{
  LPCaptionRowPresentationProperties *bottom;
  LPCaptionRowPresentationProperties *v4;
  LPCaptionRowPresentationProperties *v5;

  bottom = self->_bottom;
  if (!bottom)
  {
    v4 = objc_alloc_init(LPCaptionRowPresentationProperties);
    v5 = self->_bottom;
    self->_bottom = v4;

    bottom = self->_bottom;
  }
  return bottom;
}

- (LPCaptionRowPresentationProperties)belowBottom
{
  LPCaptionRowPresentationProperties *belowBottom;
  LPCaptionRowPresentationProperties *v4;
  LPCaptionRowPresentationProperties *v5;

  belowBottom = self->_belowBottom;
  if (!belowBottom)
  {
    v4 = objc_alloc_init(LPCaptionRowPresentationProperties);
    v5 = self->_belowBottom;
    self->_belowBottom = v4;

    belowBottom = self->_belowBottom;
  }
  return belowBottom;
}

- (BOOL)hasAnyContent
{
  return -[LPCaptionRowPresentationProperties hasAnyContent](self->_aboveTop, "hasAnyContent")
      || -[LPCaptionRowPresentationProperties hasAnyContent](self->_top, "hasAnyContent")
      || -[LPCaptionRowPresentationProperties hasAnyContent](self->_bottom, "hasAnyContent")
      || -[LPCaptionRowPresentationProperties hasAnyContent](self->_belowBottom, "hasAnyContent")
      || self->_leadingIcon
      || self->_trailingIcon != 0;
}

- (void)applyToAllCaptions:(id)a3
{
  id v4;

  v4 = a3;
  -[LPCaptionRowPresentationProperties applyToAllCaptions:](self->_aboveTop, "applyToAllCaptions:");
  -[LPCaptionRowPresentationProperties applyToAllCaptions:](self->_top, "applyToAllCaptions:", v4);
  -[LPCaptionRowPresentationProperties applyToAllCaptions:](self->_bottom, "applyToAllCaptions:", v4);
  -[LPCaptionRowPresentationProperties applyToAllCaptions:](self->_belowBottom, "applyToAllCaptions:", v4);

}

- (void)removeAllIcons
{
  LPImage *leadingIcon;
  NSArray *additionalLeadingIcons;
  LPImage *trailingIcon;
  NSArray *additionalTrailingIcons;

  leadingIcon = self->_leadingIcon;
  self->_leadingIcon = 0;

  additionalLeadingIcons = self->_additionalLeadingIcons;
  self->_additionalLeadingIcons = 0;

  trailingIcon = self->_trailingIcon;
  self->_trailingIcon = 0;

  additionalTrailingIcons = self->_additionalTrailingIcons;
  self->_additionalTrailingIcons = 0;

}

- (id)leftIcon
{
  if (appIsLTR())
    -[LPCaptionBarPresentationProperties leadingIcon](self, "leadingIcon");
  else
    -[LPCaptionBarPresentationProperties trailingIcon](self, "trailingIcon");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)rightIcon
{
  if (appIsLTR())
    -[LPCaptionBarPresentationProperties trailingIcon](self, "trailingIcon");
  else
    -[LPCaptionBarPresentationProperties leadingIcon](self, "leadingIcon");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)leftIconProperties
{
  if (appIsLTR())
    -[LPCaptionBarPresentationProperties leadingIconProperties](self, "leadingIconProperties");
  else
    -[LPCaptionBarPresentationProperties trailingIconProperties](self, "trailingIconProperties");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)rightIconProperties
{
  if (appIsLTR())
    -[LPCaptionBarPresentationProperties trailingIconProperties](self, "trailingIconProperties");
  else
    -[LPCaptionBarPresentationProperties leadingIconProperties](self, "leadingIconProperties");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)leftAccessoryType
{
  if (appIsLTR())
    return -[LPCaptionBarPresentationProperties leadingAccessoryType](self, "leadingAccessoryType");
  else
    return -[LPCaptionBarPresentationProperties trailingAccessoryType](self, "trailingAccessoryType");
}

- (int64_t)rightAccessoryType
{
  if (appIsLTR())
    return -[LPCaptionBarPresentationProperties trailingAccessoryType](self, "trailingAccessoryType");
  else
    return -[LPCaptionBarPresentationProperties leadingAccessoryType](self, "leadingAccessoryType");
}

- (void)setButtonCaption:(id)a3
{
  LPCaptionButtonPresentationProperties *v4;
  LPCaptionButtonPresentationProperties *button;
  id v6;

  v6 = a3;
  v4 = objc_alloc_init(LPCaptionButtonPresentationProperties);
  button = self->_button;
  self->_button = v4;

  -[LPCaptionButtonPresentationProperties setText:](self->_button, "setText:", v6);
  -[LPCaptionButtonPresentationProperties setType:](self->_button, "setType:", 1);

}

- (NSString)buttonCaption
{
  return -[LPCaptionButtonPresentationProperties text](self->_button, "text");
}

- (LPImage)leadingIcon
{
  return self->_leadingIcon;
}

- (void)setLeadingIcon:(id)a3
{
  objc_storeStrong((id *)&self->_leadingIcon, a3);
}

- (CGSize)leadingIconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_leadingIconSize.width;
  height = self->_leadingIconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLeadingIconSize:(CGSize)a3
{
  self->_leadingIconSize = a3;
}

- (NSArray)additionalLeadingIcons
{
  return self->_additionalLeadingIcons;
}

- (void)setAdditionalLeadingIcons:(id)a3
{
  objc_storeStrong((id *)&self->_additionalLeadingIcons, a3);
}

- (LPImagePresentationProperties)leadingIconProperties
{
  return self->_leadingIconProperties;
}

- (void)setLeadingIconProperties:(id)a3
{
  objc_storeStrong((id *)&self->_leadingIconProperties, a3);
}

- (LPImage)leadingIconBadge
{
  return self->_leadingIconBadge;
}

- (void)setLeadingIconBadge:(id)a3
{
  objc_storeStrong((id *)&self->_leadingIconBadge, a3);
}

- (LPImagePresentationProperties)leadingIconBadgeProperties
{
  return self->_leadingIconBadgeProperties;
}

- (void)setLeadingIconBadgeProperties:(id)a3
{
  objc_storeStrong((id *)&self->_leadingIconBadgeProperties, a3);
}

- (LPImage)trailingIcon
{
  return self->_trailingIcon;
}

- (void)setTrailingIcon:(id)a3
{
  objc_storeStrong((id *)&self->_trailingIcon, a3);
}

- (CGSize)trailingIconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_trailingIconSize.width;
  height = self->_trailingIconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTrailingIconSize:(CGSize)a3
{
  self->_trailingIconSize = a3;
}

- (NSArray)additionalTrailingIcons
{
  return self->_additionalTrailingIcons;
}

- (void)setAdditionalTrailingIcons:(id)a3
{
  objc_storeStrong((id *)&self->_additionalTrailingIcons, a3);
}

- (LPImagePresentationProperties)trailingIconProperties
{
  return self->_trailingIconProperties;
}

- (void)setTrailingIconProperties:(id)a3
{
  objc_storeStrong((id *)&self->_trailingIconProperties, a3);
}

- (LPImage)trailingIconBadge
{
  return self->_trailingIconBadge;
}

- (void)setTrailingIconBadge:(id)a3
{
  objc_storeStrong((id *)&self->_trailingIconBadge, a3);
}

- (LPImagePresentationProperties)trailingIconBadgeProperties
{
  return self->_trailingIconBadgeProperties;
}

- (void)setTrailingIconBadgeProperties:(id)a3
{
  objc_storeStrong((id *)&self->_trailingIconBadgeProperties, a3);
}

- (int64_t)leadingAccessoryType
{
  return self->_leadingAccessoryType;
}

- (void)setLeadingAccessoryType:(int64_t)a3
{
  self->_leadingAccessoryType = a3;
}

- (int64_t)trailingAccessoryType
{
  return self->_trailingAccessoryType;
}

- (void)setTrailingAccessoryType:(int64_t)a3
{
  self->_trailingAccessoryType = a3;
}

- (LPCaptionButtonPresentationProperties)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (LPIndeterminateProgressSpinnerPresentationProperties)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (LPPlayButtonPresentationProperties)playButton
{
  return self->_playButton;
}

- (void)setPlayButton:(id)a3
{
  objc_storeStrong((id *)&self->_playButton, a3);
}

- (LPCollaborationFooterPresentationProperties)collaborationFooter
{
  return self->_collaborationFooter;
}

- (void)setCollaborationFooter:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationFooter, a3);
}

- (BOOL)shouldHighlightIndependently
{
  return self->_shouldHighlightIndependently;
}

- (void)setShouldHighlightIndependently:(BOOL)a3
{
  self->_shouldHighlightIndependently = a3;
}

- (NSNumber)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(id)a3
{
  objc_storeStrong((id *)&self->_minimumHeight, a3);
}

- (BOOL)usesBlurredBackground
{
  return self->_usesBlurredBackground;
}

- (void)setUsesBlurredBackground:(BOOL)a3
{
  self->_usesBlurredBackground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumHeight, 0);
  objc_storeStrong((id *)&self->_collaborationFooter, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_trailingIconBadgeProperties, 0);
  objc_storeStrong((id *)&self->_trailingIconBadge, 0);
  objc_storeStrong((id *)&self->_trailingIconProperties, 0);
  objc_storeStrong((id *)&self->_additionalTrailingIcons, 0);
  objc_storeStrong((id *)&self->_trailingIcon, 0);
  objc_storeStrong((id *)&self->_leadingIconBadgeProperties, 0);
  objc_storeStrong((id *)&self->_leadingIconBadge, 0);
  objc_storeStrong((id *)&self->_leadingIconProperties, 0);
  objc_storeStrong((id *)&self->_additionalLeadingIcons, 0);
  objc_storeStrong((id *)&self->_leadingIcon, 0);
  objc_storeStrong((id *)&self->_belowBottom, 0);
  objc_storeStrong((id *)&self->_bottom, 0);
  objc_storeStrong((id *)&self->_top, 0);
  objc_storeStrong((id *)&self->_aboveTop, 0);
}

@end
