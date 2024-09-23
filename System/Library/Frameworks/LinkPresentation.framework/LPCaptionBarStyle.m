@implementation LPCaptionBarStyle

- (LPCaptionBarStyle)initWithPlatform:(int64_t)a3 sizeClass:(unint64_t)a4 sizeClassParameters:(id)a5 fontScalingFactor:(double)a6
{
  LPCaptionBarStyle *v9;
  LPPointUnit *v10;
  LPPointUnit *minimumWidth;
  LPPointUnit *v12;
  void *v13;
  LPImageViewStyle *v14;
  LPImageViewStyle *leadingIcon;
  LPPointUnit *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  LPImageViewStyle *v26;
  LPImageViewStyle *trailingIcon;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  LPIconBadgeStyle *v37;
  LPIconBadgeStyle *leadingIconBadge;
  LPSize *v39;
  LPSize *v40;
  uint64_t v42;
  LPIconBadgeStyle *v43;
  LPIconBadgeStyle *trailingIconBadge;
  LPPointUnit *v45;
  LPVerticalTextStackViewStyle *v46;
  LPVerticalTextStackViewStyle *textStack;
  LPPointUnit *v48;
  double v49;
  double v50;
  LPPointUnit *v51;
  double v52;
  double v53;
  LPAudioPlayButtonStyle *v54;
  LPAudioPlayButtonStyle *playButton;
  LPPadding *v56;
  LPPadding *playButtonPadding;
  LPPointUnit *v58;
  LPPointUnit *v59;
  LPCaptionBarAccessoryStyle *v60;
  LPCaptionBarAccessoryStyle *leadingAccessory;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  LPCaptionBarAccessoryStyle *v68;
  LPCaptionBarAccessoryStyle *trailingAccessory;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  LPPointUnit *v76;
  LPPointUnit *trailingPaddingForPresenceOfLeadingIcon;
  uint64_t v78;
  LPButtonStyle *button;
  UIColor *backgroundColor;
  LPCaptionBarStyle *v81;
  objc_super v83;

  v83.receiver = self;
  v83.super_class = (Class)LPCaptionBarStyle;
  v9 = -[LPCaptionBarStyle init](&v83, sel_init, a3, a4, a5);
  if (v9)
  {
    if (a3 == 2)
      v10 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 100.0);
    else
      v10 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 140.0);
    minimumWidth = v9->_minimumWidth;
    v9->_minimumWidth = v10;

    if (!initWithPlatform_sizeClass_sizeClassParameters_fontScalingFactor__defaultVerticalMargin)
    {
      v12 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 6.0);
      v13 = (void *)initWithPlatform_sizeClass_sizeClassParameters_fontScalingFactor__defaultVerticalMargin;
      initWithPlatform_sizeClass_sizeClassParameters_fontScalingFactor__defaultVerticalMargin = (uint64_t)v12;

    }
    v14 = objc_alloc_init(LPImageViewStyle);
    leadingIcon = v9->_leadingIcon;
    v9->_leadingIcon = v14;

    v16 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 3.0);
    -[LPImageViewStyle setCornerRadius:](v9->_leadingIcon, "setCornerRadius:", v16);

    if (a4 == 5)
      v17 = 13;
    else
      v17 = 3;
    -[LPImageViewStyle setFilter:](v9->_leadingIcon, "setFilter:", v17);
    iconSize((id)a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPImageViewStyle setFixedSize:](v9->_leadingIcon, "setFixedSize:", v18);

    outerHorizontalIconMargin((id)a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPImageViewStyle margin](v9->_leadingIcon, "margin");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLeading:", v19);

    v21 = initWithPlatform_sizeClass_sizeClassParameters_fontScalingFactor__defaultVerticalMargin;
    -[LPImageViewStyle margin](v9->_leadingIcon, "margin");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTop:", v21);

    v23 = initWithPlatform_sizeClass_sizeClassParameters_fontScalingFactor__defaultVerticalMargin;
    -[LPImageViewStyle margin](v9->_leadingIcon, "margin");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBottom:", v23);

    fallbackIconSize(a3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPImageViewStyle setFixedFallbackImageSize:](v9->_leadingIcon, "setFixedFallbackImageSize:", v25);

    v26 = objc_alloc_init(LPImageViewStyle);
    trailingIcon = v9->_trailingIcon;
    v9->_trailingIcon = v26;

    -[LPImageViewStyle cornerRadius](v9->_leadingIcon, "cornerRadius");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPImageViewStyle setCornerRadius:](v9->_trailingIcon, "setCornerRadius:", v28);

    -[LPImageViewStyle setFilter:](v9->_trailingIcon, "setFilter:", v17);
    iconSize((id)a3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPImageViewStyle setFixedSize:](v9->_trailingIcon, "setFixedSize:", v29);

    outerHorizontalIconMargin((id)a3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPImageViewStyle margin](v9->_trailingIcon, "margin");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTrailing:", v30);

    v32 = initWithPlatform_sizeClass_sizeClassParameters_fontScalingFactor__defaultVerticalMargin;
    -[LPImageViewStyle margin](v9->_trailingIcon, "margin");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTop:", v32);

    v34 = initWithPlatform_sizeClass_sizeClassParameters_fontScalingFactor__defaultVerticalMargin;
    -[LPImageViewStyle margin](v9->_trailingIcon, "margin");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setBottom:", v34);

    -[LPImageViewStyle fixedFallbackImageSize](v9->_leadingIcon, "fixedFallbackImageSize");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPImageViewStyle setFixedFallbackImageSize:](v9->_trailingIcon, "setFixedFallbackImageSize:", v36);

    v37 = objc_alloc_init(LPIconBadgeStyle);
    leadingIconBadge = v9->_leadingIconBadge;
    v9->_leadingIconBadge = v37;

    v39 = [LPSize alloc];
    +[LPTheme badgeIconSizeInPoints](LPTheme, "badgeIconSizeInPoints");
    v40 = -[LPSize initWithSquareSize:](v39, "initWithSquareSize:");
    -[LPImageViewStyle setFixedSize:](v9->_leadingIconBadge, "setFixedSize:", v40);

    -[LPIconBadgeStyle setOffset:](v9->_leadingIconBadge, "setOffset:", 3.0);
    if (a3 == 4 || a3 == 1)
      v42 = 1;
    else
      v42 = 5;
    -[LPImageViewStyle setFilter:](v9->_leadingIconBadge, "setFilter:", v42);
    v43 = objc_alloc_init(LPIconBadgeStyle);
    trailingIconBadge = v9->_trailingIconBadge;
    v9->_trailingIconBadge = v43;

    -[LPImageViewStyle fixedSize](v9->_leadingIconBadge, "fixedSize");
    v45 = (LPPointUnit *)objc_claimAutoreleasedReturnValue();
    -[LPImageViewStyle setFixedSize:](v9->_trailingIconBadge, "setFixedSize:", v45);

    -[LPIconBadgeStyle offset](v9->_leadingIconBadge, "offset");
    -[LPIconBadgeStyle setOffset:](v9->_trailingIconBadge, "setOffset:");
    -[LPImageViewStyle setFilter:](v9->_trailingIconBadge, "setFilter:", -[LPImageViewStyle filter](v9->_leadingIconBadge, "filter"));
    v46 = -[LPVerticalTextStackViewStyle initWithPlatform:sizeClass:fontScalingFactor:]([LPVerticalTextStackViewStyle alloc], "initWithPlatform:sizeClass:fontScalingFactor:", a3, a4, a6);
    textStack = v9->_textStack;
    v9->_textStack = v46;

    switch(a3)
    {
      case 0:
      case 6:
        v48 = [LPPointUnit alloc];
        v50 = 23.0;
        goto LABEL_23;
      case 1:
      case 3:
      case 4:
        v48 = [LPPointUnit alloc];
        v49 = 18.0;
        goto LABEL_24;
      case 2:
        v48 = [LPPointUnit alloc];
        v50 = 15.0;
        goto LABEL_23;
      case 5:
        v48 = [LPPointUnit alloc];
        if (a4 == 5)
          v50 = 24.0;
        else
          v50 = 27.0;
LABEL_23:
        v49 = a6 * v50;
LABEL_24:
        v45 = -[LPPointUnit initWithValue:](v48, "initWithValue:", v49);
        break;
      default:
        break;
    }
    -[LPVerticalTextStackViewStyle setFirstLineLeading:](v9->_textStack, "setFirstLineLeading:", v45);

    switch(a3)
    {
      case 0:
      case 6:
        v51 = [LPPointUnit alloc];
        v53 = 12.0;
        goto LABEL_32;
      case 1:
      case 3:
      case 4:
        v51 = [LPPointUnit alloc];
        v52 = 10.0;
        goto LABEL_33;
      case 2:
        v51 = [LPPointUnit alloc];
        v53 = 9.0;
        goto LABEL_32;
      case 5:
        v51 = [LPPointUnit alloc];
        if (a4 == 5)
          v53 = 13.0;
        else
          v53 = 16.0;
LABEL_32:
        v52 = a6 * v53;
LABEL_33:
        v45 = -[LPPointUnit initWithValue:](v51, "initWithValue:", v52);
        break;
      default:
        break;
    }
    -[LPVerticalTextStackViewStyle setLastLineDescent:](v9->_textStack, "setLastLineDescent:", v45);

    v54 = -[LPAudioPlayButtonStyle initWithPlatform:]([LPAudioPlayButtonStyle alloc], "initWithPlatform:", a3);
    playButton = v9->_playButton;
    v9->_playButton = v54;

    v56 = objc_alloc_init(LPPadding);
    playButtonPadding = v9->_playButtonPadding;
    v9->_playButtonPadding = v56;

    v58 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 8.0);
    -[LPPadding setLeading:](v9->_playButtonPadding, "setLeading:", v58);

    v59 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 15.0);
    -[LPPadding setTrailing:](v9->_playButtonPadding, "setTrailing:", v59);

    v60 = objc_alloc_init(LPCaptionBarAccessoryStyle);
    leadingAccessory = v9->_leadingAccessory;
    v9->_leadingAccessory = v60;

    outerHorizontalIconMargin((id)a3);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPCaptionBarAccessoryStyle margin](v9->_leadingAccessory, "margin");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setLeading:", v62);

    v64 = initWithPlatform_sizeClass_sizeClassParameters_fontScalingFactor__defaultVerticalMargin;
    -[LPCaptionBarAccessoryStyle margin](v9->_leadingAccessory, "margin");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setTop:", v64);

    v66 = initWithPlatform_sizeClass_sizeClassParameters_fontScalingFactor__defaultVerticalMargin;
    -[LPCaptionBarAccessoryStyle margin](v9->_leadingAccessory, "margin");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setBottom:", v66);

    v68 = objc_alloc_init(LPCaptionBarAccessoryStyle);
    trailingAccessory = v9->_trailingAccessory;
    v9->_trailingAccessory = v68;

    outerHorizontalIconMargin((id)a3);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPCaptionBarAccessoryStyle margin](v9->_trailingAccessory, "margin");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setTrailing:", v70);

    v72 = initWithPlatform_sizeClass_sizeClassParameters_fontScalingFactor__defaultVerticalMargin;
    -[LPCaptionBarAccessoryStyle margin](v9->_trailingAccessory, "margin");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setTop:", v72);

    v74 = initWithPlatform_sizeClass_sizeClassParameters_fontScalingFactor__defaultVerticalMargin;
    -[LPCaptionBarAccessoryStyle margin](v9->_trailingAccessory, "margin");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setBottom:", v74);

    v76 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 30.0);
    trailingPaddingForPresenceOfLeadingIcon = v9->_trailingPaddingForPresenceOfLeadingIcon;
    v9->_trailingPaddingForPresenceOfLeadingIcon = v76;

    +[LPButtonStyle systemPillButtonStyleForPlatform:sizeClass:](LPButtonStyle, "systemPillButtonStyleForPlatform:sizeClass:", a3, a4);
    v78 = objc_claimAutoreleasedReturnValue();
    button = v9->_button;
    v9->_button = (LPButtonStyle *)v78;

    backgroundColor = v9->_backgroundColor;
    v9->_backgroundColor = 0;

    v9->_minimumNumberOfLinesToVerticallyCenter = 0;
    v81 = v9;
  }

  return v9;
}

- (id)leftIcon
{
  if (appIsLTR())
    -[LPCaptionBarStyle leadingIcon](self, "leadingIcon");
  else
    -[LPCaptionBarStyle trailingIcon](self, "trailingIcon");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)rightIcon
{
  if (appIsLTR())
    -[LPCaptionBarStyle trailingIcon](self, "trailingIcon");
  else
    -[LPCaptionBarStyle leadingIcon](self, "leadingIcon");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)leftAccessory
{
  if (appIsLTR())
    -[LPCaptionBarStyle leadingAccessory](self, "leadingAccessory");
  else
    -[LPCaptionBarStyle trailingAccessory](self, "trailingAccessory");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)rightAccessory
{
  if (appIsLTR())
    -[LPCaptionBarStyle trailingAccessory](self, "trailingAccessory");
  else
    -[LPCaptionBarStyle leadingAccessory](self, "leadingAccessory");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (LPImageViewStyle)leadingIcon
{
  return self->_leadingIcon;
}

- (LPImageViewStyle)trailingIcon
{
  return self->_trailingIcon;
}

- (LPIconBadgeStyle)leadingIconBadge
{
  return self->_leadingIconBadge;
}

- (LPIconBadgeStyle)trailingIconBadge
{
  return self->_trailingIconBadge;
}

- (LPCaptionBarAccessoryStyle)leadingAccessory
{
  return self->_leadingAccessory;
}

- (LPCaptionBarAccessoryStyle)trailingAccessory
{
  return self->_trailingAccessory;
}

- (LPVerticalTextStackViewStyle)textStack
{
  return self->_textStack;
}

- (LPPointUnit)minimumWidth
{
  return self->_minimumWidth;
}

- (void)setMinimumWidth:(id)a3
{
  objc_storeStrong((id *)&self->_minimumWidth, a3);
}

- (LPPointUnit)trailingPaddingForPresenceOfLeadingIcon
{
  return self->_trailingPaddingForPresenceOfLeadingIcon;
}

- (void)setTrailingPaddingForPresenceOfLeadingIcon:(id)a3
{
  objc_storeStrong((id *)&self->_trailingPaddingForPresenceOfLeadingIcon, a3);
}

- (LPAudioPlayButtonStyle)playButton
{
  return self->_playButton;
}

- (LPPadding)playButtonPadding
{
  return self->_playButtonPadding;
}

- (LPButtonStyle)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (BOOL)usesOutOfLineButton
{
  return self->_usesOutOfLineButton;
}

- (void)setUsesOutOfLineButton:(BOOL)a3
{
  self->_usesOutOfLineButton = a3;
}

- (BOOL)canAddLineForButton
{
  return self->_canAddLineForButton;
}

- (void)setCanAddLineForButton:(BOOL)a3
{
  self->_canAddLineForButton = a3;
}

- (BOOL)positionButtonRelativeToTextStack
{
  return self->_positionButtonRelativeToTextStack;
}

- (void)setPositionButtonRelativeToTextStack:(BOOL)a3
{
  self->_positionButtonRelativeToTextStack = a3;
}

- (BOOL)buttonRespectsTextStackPadding
{
  return self->_buttonRespectsTextStackPadding;
}

- (void)setButtonRespectsTextStackPadding:(BOOL)a3
{
  self->_buttonRespectsTextStackPadding = a3;
}

- (BOOL)buttonIgnoresTextSafeAreaInsets
{
  return self->_buttonIgnoresTextSafeAreaInsets;
}

- (void)setButtonIgnoresTextSafeAreaInsets:(BOOL)a3
{
  self->_buttonIgnoresTextSafeAreaInsets = a3;
}

- (BOOL)addFullWidthLineForButton
{
  return self->_addFullWidthLineForButton;
}

- (void)setAddFullWidthLineForButton:(BOOL)a3
{
  self->_addFullWidthLineForButton = a3;
}

- (BOOL)alignButtonWithCaptionTextLeadingEdge
{
  return self->_alignButtonWithCaptionTextLeadingEdge;
}

- (void)setAlignButtonWithCaptionTextLeadingEdge:(BOOL)a3
{
  self->_alignButtonWithCaptionTextLeadingEdge = a3;
}

- (BOOL)expandButtonToCaptionEdge
{
  return self->_expandButtonToCaptionEdge;
}

- (void)setExpandButtonToCaptionEdge:(BOOL)a3
{
  self->_expandButtonToCaptionEdge = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (unsigned)minimumNumberOfLinesToVerticallyCenter
{
  return self->_minimumNumberOfLinesToVerticallyCenter;
}

- (void)setMinimumNumberOfLinesToVerticallyCenter:(unsigned int)a3
{
  self->_minimumNumberOfLinesToVerticallyCenter = a3;
}

- (LPCollaborationFooterStyle)collaborationFooter
{
  return self->_collaborationFooter;
}

- (void)setCollaborationFooter:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationFooter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationFooter, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_playButtonPadding, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_trailingPaddingForPresenceOfLeadingIcon, 0);
  objc_storeStrong((id *)&self->_minimumWidth, 0);
  objc_storeStrong((id *)&self->_textStack, 0);
  objc_storeStrong((id *)&self->_trailingAccessory, 0);
  objc_storeStrong((id *)&self->_leadingAccessory, 0);
  objc_storeStrong((id *)&self->_trailingIconBadge, 0);
  objc_storeStrong((id *)&self->_leadingIconBadge, 0);
  objc_storeStrong((id *)&self->_trailingIcon, 0);
  objc_storeStrong((id *)&self->_leadingIcon, 0);
}

@end
