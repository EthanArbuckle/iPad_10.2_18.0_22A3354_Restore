@implementation FCUIActivityControl

- (FCUIActivityControl)initWithActivityDescription:(id)a3 style:(int64_t)a4
{
  id v6;
  FCUIActivityControl *v7;
  FCUIActivityControl *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FCUIActivityControl;
  v7 = -[FCUIActivityControl init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_controlStyle = a4;
    v7->_adjustsFontForContentSizeCategory = 1;
    -[FCUIActivityControl setActivityDescription:](v7, "setActivityDescription:", v6);
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    if (v10 == 1)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD828]), "initWithDelegate:", v8);
      -[FCUIActivityControl addInteraction:](v8, "addInteraction:", v11);

    }
  }

  return v8;
}

- (FCUIActivityControl)initWithActivityDescription:(id)a3
{
  return -[FCUIActivityControl initWithActivityDescription:style:](self, "initWithActivityDescription:style:", a3, 0);
}

- (void)setActivityDescription:(id)a3
{
  id v5;

  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_activityDescription, a3);
    -[FCUIActivityControl _updateActivityIcon](self, "_updateActivityIcon");
    -[FCUIActivityControl _updateActivityTitle](self, "_updateActivityTitle");
    -[FCUIActivityControl _updateActivityDetail](self, "_updateActivityDetail");
    -[FCUIActivityControl _updateAccessibilityIdentifier](self, "_updateAccessibilityIdentifier");
  }

}

- (UIAction)defaultAction
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__FCUIActivityControl_defaultAction__block_invoke;
  v4[3] = &unk_24D20AC60;
  v4[4] = &v5;
  -[FCUIActivityControl enumerateEventHandlers:](self, "enumerateEventHandlers:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (UIAction *)v2;
}

void __36__FCUIActivityControl_defaultAction__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  id v9;
  id v10;

  v9 = a2;
  if (v9)
  {
    v10 = v9;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v9 = v10;
    *a6 = 1;
  }

}

- (void)setDefaultAction:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FCUIActivityControl defaultAction](self, "defaultAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "fcui_isEqualToAction:", v4) & 1) == 0)
  {
    if (v4)
      -[FCUIActivityControl removeAction:forControlEvents:](self, "removeAction:forControlEvents:", v4, 64);
    if (v5)
      -[FCUIActivityControl addAction:forControlEvents:](self, "addAction:forControlEvents:", v5, 64);
  }

}

- (UIAction)optionsAction
{
  FCUIOptionsControl *optionsButton;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  optionsButton = self->_optionsButton;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__FCUIActivityControl_optionsAction__block_invoke;
  v5[3] = &unk_24D20AC60;
  v5[4] = &v6;
  -[FCUIOptionsControl enumerateEventHandlers:](optionsButton, "enumerateEventHandlers:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (UIAction *)v3;
}

void __36__FCUIActivityControl_optionsAction__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  id v9;
  id v10;

  v9 = a2;
  if (v9)
  {
    v10 = v9;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v9 = v10;
    *a6 = 1;
  }

}

- (void)setOptionsAction:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[FCUIActivityControl optionsAction](self, "optionsAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "fcui_isEqualToAction:", v4) & 1) == 0)
  {
    -[FCUIActivityControl _configureOptionsButtonIfNecessary](self, "_configureOptionsButtonIfNecessary");
    if (v4)
      -[FCUIOptionsControl removeAction:forControlEvents:](self->_optionsButton, "removeAction:forControlEvents:", v4, 64);
    if (v5)
      -[FCUIOptionsControl addAction:forControlEvents:](self->_optionsButton, "addAction:forControlEvents:", v5, 64);
  }

}

- (NSArray)menuItemActions
{
  return -[FCUIActivityControlMenuView menuItemActions](self->_menuView, "menuItemActions");
}

- (void)setMenuItemActions:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[FCUIActivityControl menuItemActions](self, "menuItemActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "fcui_isEqualToActionArray:", v4);

  if ((v5 & 1) == 0)
  {
    -[FCUIActivityControl _configureMenuViewIfNecessary](self, "_configureMenuViewIfNecessary");
    -[FCUIActivityControlMenuView setMenuItemActions:](self->_menuView, "setMenuItemActions:", v6);
    -[FCUIActivityControl setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSArray)menuItemElements
{
  return -[FCUIActivityControlMenuView menuItemElements](self->_menuView, "menuItemElements");
}

- (NSString)menuAlternativeDescription
{
  return -[FCUIActivityControlMenuView menuAlternativeDescription](self->_menuView, "menuAlternativeDescription");
}

- (void)setMenuAlternativeDescription:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[FCUIActivityControl menuAlternativeDescription](self, "menuAlternativeDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    -[FCUIActivityControl _configureMenuViewIfNecessary](self, "_configureMenuViewIfNecessary");
    -[FCUIActivityControlMenuView setMenuAlternativeDescription:](self->_menuView, "setMenuAlternativeDescription:", v6);
    -[FCUIActivityControl setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UIAction)footerAction
{
  return -[FCUIActivityControlMenuView footerAction](self->_menuView, "footerAction");
}

- (void)setFooterAction:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[FCUIActivityControl footerAction](self, "footerAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "fcui_isEqualToAction:", v4);

  if ((v5 & 1) == 0)
  {
    -[FCUIActivityControl _configureMenuViewIfNecessary](self, "_configureMenuViewIfNecessary");
    -[FCUIActivityControlMenuView setFooterAction:](self->_menuView, "setFooterAction:", v6);
  }

}

- (BOOL)showsPersistentDetailText
{
  return !-[FCUIActivityControl activitySemanticType](self, "activitySemanticType")
      || -[FCUIActivityControl activitySemanticType](self, "activitySemanticType") == 9;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[FCUIActivityControl _sizeThatFits:withControlSize:](self, "_sizeThatFits:withControlSize:", self->_controlSize, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  UIView *contentView;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double width;
  double v11;
  double height;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  FCUICAPackageView *activityIconPackageView;
  double v45;
  __int128 v46;
  int64_t controlSize;
  CGFloat MaxY;
  double v49;
  CGFloat v50;
  double v51;
  _BOOL8 v52;
  __CFString **v53;
  int64_t controlStyle;
  UIImageView *activityIconImageView;
  void *v56;
  UIView *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGAffineTransform v69;
  _QWORD v70[5];
  CGAffineTransform v71;
  _QWORD v72[9];
  _QWORD v73[5];
  __int128 v74;
  __int128 v75;
  _QWORD v76[4];
  double v77;
  double v78;
  double v79;
  double v80;
  objc_super v81;
  _QWORD v82[5];
  CGAffineTransform v83;
  CGAffineTransform v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;

  v63 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v64 = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v84.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v84.c = v63;
  v62 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&v84.tx = v62;
  if (self->_controlStyle == 1)
  {
    contentView = self->_contentView;
    if (contentView)
      -[UIView transform](contentView, "transform");
    else
      memset(&v83, 0, sizeof(v83));
    v84 = v83;
    v82[0] = MEMORY[0x24BDAC760];
    v82[1] = 3221225472;
    v82[2] = __37__FCUIActivityControl_layoutSubviews__block_invoke;
    v82[3] = &unk_24D20A9C0;
    v82[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v82);
  }
  v81.receiver = self;
  v81.super_class = (Class)FCUIActivityControl;
  -[FCUIActivityControl layoutSubviews](&v81, sel_layoutSubviews);
  -[UIView bounds](self->_contentView, "bounds");
  v65 = v4;
  v66 = v5;
  v67 = v7;
  v68 = v6;
  -[FCUIActivityControl _configureBackgroundViewIfNecesssary](self, "_configureBackgroundViewIfNecesssary");
  v8 = -[FCUIActivityControl _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (CGRectIsEmpty(self->_targetContainerBounds))
  {
    -[FCUIActivityControl bounds](self, "bounds");
    width = v9;
    height = v11;
  }
  else
  {
    width = self->_targetContainerBounds.size.width;
    height = self->_targetContainerBounds.size.height;
  }
  if (self->_controlSize == -1)
    v13 = -1;
  else
    v13 = 0;
  -[FCUIActivityControl _sizeThatFits:withControlSize:](self, "_sizeThatFits:withControlSize:", v13, width, height);
  BSRectWithSize();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[FCUIActivityControl _cornerRadiusForControlFrame:](self, "_cornerRadiusForControlFrame:");
  v23 = v22;
  -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:");
  -[FCUIActivityControlMenuView _setContinuousCornerRadius:](self->_menuView, "_setContinuousCornerRadius:", v23);
  -[FCUIActivityControl _iconLayoutFrameForControlFrame:isRTL:controlSize:](self, "_iconLayoutFrameForControlFrame:isRTL:controlSize:", v8, self->_controlSize, v15, v17, v19, v21);
  v77 = v24;
  v78 = v25;
  v79 = v26;
  v80 = v27;
  -[UIImageView sizeThatFits:](self->_activityIconImageView, "sizeThatFits:", v19, v21);
  -[FCUIActivityControl _glyphFrameForLayoutFrame:sizeThatFits:](self, "_glyphFrameForLayoutFrame:sizeThatFits:", &v77);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  -[FCUIActivityControl _optionsButtonLayoutFrameForControlFrame:isRTL:](self, "_optionsButtonLayoutFrameForControlFrame:isRTL:", v8, v15, v17, v19, v21);
  v76[0] = v36;
  v76[1] = v37;
  v76[2] = v38;
  v76[3] = v39;
  -[FCUIOptionsControl sizeThatFits:](self->_optionsButton, "sizeThatFits:", v19, v21);
  -[FCUIActivityControl _glyphFrameForLayoutFrame:sizeThatFits:](self, "_glyphFrameForLayoutFrame:sizeThatFits:", v76);
  if (!self->_textLayoutDisabled)
  {
    v58 = v43;
    v59 = v42;
    v60 = v41;
    v61 = v40;
    activityIconPackageView = self->_activityIconPackageView;
    if (activityIconPackageView)
    {
      -[FCUICAPackageView sizeThatFits:](activityIconPackageView, "sizeThatFits:", v19, v21);
      -[FCUIActivityControl _effectiveGlyphPointSize](self, "_effectiveGlyphPointSize");
      BSRectWithSize();
      UIRectCenteredIntegralRectScale();
      -[FCUICAPackageView setFrame:](self->_activityIconPackageView, "setFrame:", 0);
    }
    -[UIImageView setFrame:](self->_activityIconImageView, "setFrame:", v29, v31, v33, v35);
    -[FCUIOptionsControl setFrame:](self->_optionsButton, "setFrame:", v61, v60, v59, v58);
    -[FCUIOptionsControl setSelected:](self->_optionsButton, "setSelected:", self->_controlSize == 1);
    v45 = 1.0;
    if (self->_controlSize == -1)
      v45 = 0.0;
    -[FCUIOptionsControl setAlpha:](self->_optionsButton, "setAlpha:", v45);
    -[FCUIActivityControl _textFrameForControlFrame:iconLayoutFrame:isRTL:controlSize:](self, "_textFrameForControlFrame:iconLayoutFrame:isRTL:controlSize:", v8, self->_controlSize, v15, v17, v19, v21, v77, v78, v79, v80);
    UIRectCenteredYInRect();
    v46 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
    *(_OWORD *)&v83.a = *MEMORY[0x24BDBF090];
    *(_OWORD *)&v83.c = v46;
    *(_OWORD *)&v69.a = *(_OWORD *)&v83.a;
    *(_OWORD *)&v69.c = v46;
    objc_msgSend(MEMORY[0x24BEBD708], "fcui_layoutPrimaryLabel:secondaryLabel:inTextFrame:primaryLabelFrame:secondaryLabelFrame:drawingContext:", self->_activityTitleLabel, self->_detailLabel, &v83, &v69, self->_drawingContext);
    -[UILabel setFrame:](self->_activityTitleLabel, "setFrame:", v83.a, v83.b, v83.c, v83.d);
    v73[1] = 3221225472;
    v74 = *(_OWORD *)&v69.a;
    v73[0] = MEMORY[0x24BDAC760];
    v73[2] = __37__FCUIActivityControl_layoutSubviews__block_invoke_2;
    v73[3] = &unk_24D20AC88;
    v73[4] = self;
    v75 = *(_OWORD *)&v69.c;
    objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v73);
    -[UILabel setAlpha:](self->_detailLabel, "setAlpha:", 1.0);
  }
  controlSize = self->_controlSize;
  if (controlSize == 1)
  {
    v85.origin.x = v15;
    v85.origin.y = v17;
    v85.size.width = v19;
    v85.size.height = v21;
    MaxY = CGRectGetMaxY(v85);
    v86.origin.x = v65;
    v86.size.height = v67;
    v86.origin.y = v68;
    v86.size.width = v66;
    v49 = CGRectGetHeight(v86);
    v87.origin.x = v15;
    v87.origin.y = v17;
    v87.size.width = v19;
    v87.size.height = v21;
    v50 = CGRectGetHeight(v87);
    v72[0] = MEMORY[0x24BDAC760];
    v72[1] = 3221225472;
    v72[2] = __37__FCUIActivityControl_layoutSubviews__block_invoke_3;
    v72[3] = &unk_24D20AC88;
    v72[4] = self;
    *(CGFloat *)&v72[5] = v65;
    *(CGFloat *)&v72[6] = MaxY;
    *(CGFloat *)&v72[7] = v66;
    *(double *)&v72[8] = v49 - v50;
    objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v72);
    controlSize = self->_controlSize;
  }
  v51 = 0.0;
  if (controlSize == 1)
    v51 = 1.0;
  -[FCUIActivityControlMenuView setAlpha:](self->_menuView, "setAlpha:", v51);
  v52 = -[FCUIActivityControl _isDrawingSelectedAppearance](self, "_isDrawingSelectedAppearance");
  -[FCUIActivityControl _setBackgroundViewHighlighted:](self, "_setBackgroundViewHighlighted:", v52);
  v53 = kFCUIPackageViewStateOn;
  if (!v52)
    v53 = &kFCUIPackageViewStateOff;
  -[FCUICAPackageView setState:animated:](self->_activityIconPackageView, "setState:animated:", *v53, objc_msgSend(MEMORY[0x24BEBDB00], "_isInAnimationBlockWithAnimationsEnabled"));
  controlStyle = self->_controlStyle;
  if (controlStyle == 2)
  {
    activityIconImageView = self->_activityIconImageView;
    -[FCUIActivityControl _activityIconTintColorForSelectedAppearance:](self, "_activityIconTintColorForSelectedAppearance:", v52);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](activityIconImageView, "setTintColor:", v56);

    -[FCUIOptionsControl setParentControlSelected:](self->_optionsButton, "setParentControlSelected:", v52);
    -[FCUIOptionsControl layoutIfNeeded](self->_optionsButton, "layoutIfNeeded");
  }
  else if (controlStyle == 1)
  {
    -[FCUIActivityControl setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", -[FCUIActivityControl _userInterfaceStyleForSelectedAppearance:](self, "_userInterfaceStyleForSelectedAppearance:", v52));
    v70[1] = 3221225472;
    v71 = v84;
    v70[0] = MEMORY[0x24BDAC760];
    v70[2] = __37__FCUIActivityControl_layoutSubviews__block_invoke_4;
    v70[3] = &unk_24D20ACB0;
    v70[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v70);
    memset(&v83, 0, sizeof(v83));
    if (-[FCUIActivityControl isHighlighted](self, "isHighlighted"))
    {
      CGAffineTransformMakeScale(&v83, 0.93, 0.93);
    }
    else
    {
      *(_OWORD *)&v83.a = v64;
      *(_OWORD *)&v83.c = v63;
      *(_OWORD *)&v83.tx = v62;
    }
    v57 = self->_contentView;
    v69 = v83;
    -[UIView setTransform:](v57, "setTransform:", &v69);
  }
}

uint64_t __37__FCUIActivityControl_layoutSubviews__block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
  v2 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v4[0] = *MEMORY[0x24BDBD8B8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __37__FCUIActivityControl_layoutSubviews__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __37__FCUIActivityControl_layoutSubviews__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "layoutIfNeeded");
}

uint64_t __37__FCUIActivityControl_layoutSubviews__block_invoke_4(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "setTransform:", v4);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  FCUIActivityControl *v5;
  BOOL v6;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (FCUIActivityControl *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || objc_msgSend(v4, "numberOfTouchesRequired") != 1
    || objc_msgSend(v4, "numberOfTapsRequired") != 1;

  return v6;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  _QWORD v6[5];
  objc_super v7;

  v3 = a3;
  v5 = -[FCUIActivityControl isHighlighted](self, "isHighlighted");
  v7.receiver = self;
  v7.super_class = (Class)FCUIActivityControl;
  -[FCUIActivityControl setHighlighted:](&v7, sel_setHighlighted_, v3);
  if (v5 != -[FCUIActivityControl isHighlighted](self, "isHighlighted"))
  {
    if (self->_controlStyle != 1)
      -[FCUIActivityControl _updateDrawingSelectedAppearance](self, "_updateDrawingSelectedAppearance");
    -[FCUIActivityControl setNeedsLayout](self, "setNeedsLayout");
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __38__FCUIActivityControl_setHighlighted___block_invoke;
    v6[3] = &unk_24D20A9C0;
    v6[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "fcui_animateWithSelectionParameters:completion:", v6, 0);
  }
}

uint64_t __38__FCUIActivityControl_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FCUIActivityControl;
  -[FCUIActivityControl setSelected:](&v4, sel_setSelected_, a3);
  -[FCUIActivityControl _updateDrawingSelectedAppearance](self, "_updateDrawingSelectedAppearance");
}

- (void)addAction:(id)a3 forControlEvents:(unint64_t)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCUIActivityControl;
  -[FCUIActivityControl addAction:forControlEvents:](&v7, sel_addAction_forControlEvents_, v6, a4);
  if (!self->_controlStyle)
    -[FCUIActivityControl setOptionsAction:](self, "setOptionsAction:", v6);

}

- (NSString)activityIdentifier
{
  return (NSString *)-[FCActivityDescribing activityIdentifier](self->_activityDescription, "activityIdentifier");
}

- (NSUUID)activityUniqueIdentifier
{
  return (NSUUID *)-[FCActivityDescribing activityUniqueIdentifier](self->_activityDescription, "activityUniqueIdentifier");
}

- (int64_t)activitySemanticType
{
  return -[FCActivityDescribing activitySemanticType](self->_activityDescription, "activitySemanticType");
}

- (NSString)activityDisplayName
{
  return (NSString *)-[FCActivityDescribing activityDisplayName](self->_activityDescription, "activityDisplayName");
}

- (NSString)activitySymbolImageName
{
  return (NSString *)-[FCActivityDescribing activitySymbolImageName](self->_activityDescription, "activitySymbolImageName");
}

- (NSString)activityColorName
{
  return (NSString *)-[FCActivityDescribing activityColorName](self->_activityDescription, "activityColorName");
}

- (NSDate)activityCreationDate
{
  return (NSDate *)-[FCActivityDescribing activityCreationDate](self->_activityDescription, "activityCreationDate");
}

- (NSString)activityDetailText
{
  return (NSString *)-[FCActivityDescribing activityDetailText](self->_activityDescription, "activityDetailText");
}

- (NSURL)activitySettingsURL
{
  return (NSURL *)-[FCActivityDescribing activitySettingsURL](self->_activityDescription, "activitySettingsURL");
}

- (NSURL)activitySetupURL
{
  return (NSURL *)-[FCActivityDescribing activitySetupURL](self->_activityDescription, "activitySetupURL");
}

- (NSArray)activityLifetimeDescriptions
{
  return (NSArray *)-[FCActivityDescribing activityLifetimeDescriptions](self->_activityDescription, "activityLifetimeDescriptions");
}

- (NSString)activityLifetimesAlternativeDescription
{
  return (NSString *)-[FCActivityDescribing activityLifetimesAlternativeDescription](self->_activityDescription, "activityLifetimesAlternativeDescription");
}

- (BOOL)isPlaceholder
{
  return -[FCActivityDescribing isPlaceholder](self->_activityDescription, "isPlaceholder");
}

- (UIImage)activityIcon
{
  return -[UIImageView image](self->_activityIconImageView, "image");
}

- (void)setActivityIcon:(id)a3
{
  -[FCUIActivityControl _setActivityIcon:forReference:](self, "_setActivityIcon:forReference:", a3, 0);
}

- (NSString)detailText
{
  return -[UILabel text](self->_detailLabel, "text");
}

- (void)setDetailText:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v8 = a3;
  -[FCUIActivityControl detailText](self, "detailText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x24BEBDB00];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __37__FCUIActivityControl_setDetailText___block_invoke;
    v9[3] = &unk_24D20A8D0;
    v9[4] = self;
    v10 = v8;
    objc_msgSend(v6, "performWithoutAnimation:", v9);
    -[FCUIActivityControl setNeedsLayout](self, "setNeedsLayout");
    -[FCUIActivityControl superview](self, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

  }
}

uint64_t __37__FCUIActivityControl_setDetailText___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_configureDetailLabelIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setText:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setAlpha:", 0.0);
}

- (void)setSelectionHidden:(BOOL)a3
{
  if (self->_selectionHidden != a3)
  {
    self->_selectionHidden = a3;
    -[FCUIActivityControl _updateDrawingSelectedAppearance](self, "_updateDrawingSelectedAppearance");
    -[FCUIActivityControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)isExpanded
{
  return self->_controlSize == 1;
}

- (void)setExpanded:(BOOL)a3
{
  int64_t controlSize;

  controlSize = self->_controlSize;
  if (a3)
  {
    if (controlSize == 1)
      return;
    goto LABEL_3;
  }
  if (controlSize == 1)
  {
LABEL_3:
    self->_controlSize = a3;
    -[FCUIActivityControl _setNeedsTextAttributesUpdate](self, "_setNeedsTextAttributesUpdate");
    -[FCUIActivityControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIGestureRecognizer)gestureRecognizerForExclusionRelationships
{
  return -[FCUIActivityControlMenuView pressGestureRecognizer](self->_menuView, "pressGestureRecognizer");
}

- (void)setExpanded:(BOOL)a3 withTransitionCoordinator:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _BOOL4 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCUIActivityControl isExpanded](self, "isExpanded");
  -[FCUIActivityControl setExpanded:](self, "setExpanded:", v4);
  v9 = -[FCUIActivityControl isExpanded](self, "isExpanded");
  if (v8 != v9)
  {
    v10 = v9;
    objc_setAssociatedObject(self, &_FCUIActivityControlAnimationUUID, v7, (void *)1);
    -[UIView setClipsToBounds:](self->_contentView, "setClipsToBounds:", 1);
    -[FCUIActivityControl setSelectionHidden:](self, "setSelectionHidden:", v10);
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__FCUIActivityControl_setExpanded_withTransitionCoordinator___block_invoke;
  v12[3] = &unk_24D20ACD8;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v6, "animateAlongsideTransition:completion:", 0, v12);

}

void __61__FCUIActivityControl_setExpanded_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;

  if ((objc_msgSend(a2, "isCancelled") & 1) == 0)
  {
    objc_getAssociatedObject(*(id *)(a1 + 32), &_FCUIActivityControlAnimationUUID);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

    if (v4)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setClipsToBounds:", 0);
      objc_setAssociatedObject(*(id *)(a1 + 32), &_FCUIActivityControlAnimationUUID, 0, (void *)1);
    }
  }
}

- (BOOL)isContracted
{
  return self->_controlSize == -1;
}

- (void)setContracted:(BOOL)a3
{
  int64_t controlSize;

  controlSize = self->_controlSize;
  if (a3)
  {
    if (controlSize == -1)
      return;
    goto LABEL_3;
  }
  if (controlSize == -1)
  {
LABEL_3:
    self->_controlSize = a3 << 63 >> 63;
    -[FCUIActivityControl _setNeedsTextAttributesUpdate](self, "_setNeedsTextAttributesUpdate");
    -[FCUIActivityControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)willPresent:(BOOL)a3 withTargetContainerBounds:(CGRect)a4 transitionCoordinator:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _BOOL4 v9;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  if (a5)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    v9 = a3;
    v11 = (void *)MEMORY[0x24BDD1880];
    v12 = a5;
    objc_msgSend(v11, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(self, &_FCUIActivityControlAnimationUUID, v13, (void *)1);
    self->_targetContainerBounds.origin.x = x;
    self->_targetContainerBounds.origin.y = y;
    self->_targetContainerBounds.size.width = width;
    self->_targetContainerBounds.size.height = height;
    -[UIView setClipsToBounds:](self->_contentView, "setClipsToBounds:", 1);
    -[FCUIActivityControl _setTextLayoutDisabled:](self, "_setTextLayoutDisabled:", !v9);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __83__FCUIActivityControl_willPresent_withTargetContainerBounds_transitionCoordinator___block_invoke;
    v15[3] = &unk_24D20ACD8;
    v15[4] = self;
    v16 = v13;
    v14 = v13;
    objc_msgSend(v12, "animateAlongsideTransition:completion:", 0, v15);

  }
}

void __83__FCUIActivityControl_willPresent_withTargetContainerBounds_transitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  _OWORD *v5;
  __int128 v6;

  if ((objc_msgSend(a2, "isCancelled") & 1) == 0)
  {
    objc_getAssociatedObject(*(id *)(a1 + 32), &_FCUIActivityControlAnimationUUID);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

    if (v4)
    {
      v5 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 560);
      v6 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
      *v5 = *MEMORY[0x24BDBF090];
      v5[1] = v6;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setClipsToBounds:", 0);
      objc_msgSend(*(id *)(a1 + 32), "_setTextLayoutDisabled:", 0);
      objc_setAssociatedObject(*(id *)(a1 + 32), &_FCUIActivityControlAnimationUUID, 0, (void *)1);
    }
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    -[FCUIOptionsControl setAdjustsFontForContentSizeCategory:](self->_optionsButton, "setAdjustsFontForContentSizeCategory:");
    -[FCUIActivityControlMenuView setAdjustsFontForContentSizeCategory:](self->_menuView, "setAdjustsFontForContentSizeCategory:", self->_adjustsFontForContentSizeCategory);
    -[FCUIActivityControl _setNeedsTextAttributesUpdate](self, "_setNeedsTextAttributesUpdate");
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  _BOOL4 v3;

  v3 = -[FCUIActivityControl adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory");
  if (v3)
  {
    -[FCUIActivityControl _setNeedsTextAttributesUpdate](self, "_setNeedsTextAttributesUpdate");
    -[FCUIOptionsControl adjustForContentSizeCategoryChange](self->_optionsButton, "adjustForContentSizeCategoryChange");
    -[FCUIActivityControlMenuView adjustForContentSizeCategoryChange](self->_menuView, "adjustForContentSizeCategoryChange");
  }
  return v3;
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  UIView *backgroundView;
  uint64_t v6;
  UIView *v7;
  UIView *v8;
  UIView *v9;
  void *v10;

  -[FCUIActivityControl _configureBackgroundViewIfNecesssary](self, "_configureBackgroundViewIfNecesssary");
  backgroundView = self->_backgroundView;
  v6 = objc_opt_class();
  v7 = backgroundView;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  -[UIView visualStylingProviderForCategory:](v9, "visualStylingProviderForCategory:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  if (self->_controlSize == 1)
    return 0;
  else
    return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = objc_alloc_init(MEMORY[0x24BEBD888]);
  v6 = (void *)MEMORY[0x24BEBD420];
  -[FCUIActivityControl bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[UIView _continuousCornerRadius](self->_backgroundView, "_continuousCornerRadius");
  objc_msgSend(v6, "bezierPathWithRoundedRect:cornerRadius:", v8, v10, v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVisiblePath:", v16);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA30]), "initWithView:parameters:", self, v5);
  v18 = (void *)MEMORY[0x24BEBD848];
  objc_msgSend(MEMORY[0x24BEBD810], "effectWithPreview:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "styleWithEffect:shape:", v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (double)_cornerRadiusForControlFrame:(CGRect)a3
{
  double result;

  CGRectGetHeight(a3);
  UIRoundToScale();
  if (result > 37.0)
    return 37.0;
  return result;
}

- (BOOL)_isDrawingSelectedAppearance
{
  return self->_drawingSelectedAppearance;
}

- (void)_setDrawingSelectedAppearance:(BOOL)a3
{
  if (-[FCUIActivityControl _isDrawingSelectedAppearance](self, "_isDrawingSelectedAppearance") != a3)
  {
    self->_drawingSelectedAppearance = a3;
    -[FCUIActivityControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateDrawingSelectedAppearance
{
  uint64_t v3;

  if (self->_controlStyle)
  {
    if (-[FCUIActivityControl isExpanded](self, "isExpanded")
      || !-[FCUIActivityControl isSelected](self, "isSelected"))
    {
      v3 = 0;
    }
    else
    {
      v3 = -[FCUIActivityControl isSelectionHidden](self, "isSelectionHidden") ^ 1;
    }
  }
  else
  {
    v3 = -[FCUIActivityControl isHighlighted](self, "isHighlighted");
  }
  -[FCUIActivityControl _setDrawingSelectedAppearance:](self, "_setDrawingSelectedAppearance:", v3);
}

+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a4, *(_QWORD *)&a6, 0);
  else
    objc_msgSend(MEMORY[0x24BEBB528], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a4, *(_QWORD *)&a6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BEBB590];
  v14 = *MEMORY[0x24BEBB620];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptorByAddingAttributes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v11, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (double)_scaledValueForValue:(double)a3
{
  void *v5;
  double v6;
  double v7;

  -[FCUIActivityControl _configureActivityTitleLabelIfNecessary](self, "_configureActivityTitleLabelIfNecessary");
  -[FCUIActivityControl _updateTextAttributesIfNecessary](self, "_updateTextAttributesIfNecessary");
  -[UILabel font](self->_activityTitleLabel, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_scaledValueForValue:", a3);
  v7 = v6;

  return v7;
}

- (double)_effectiveGlyphPointSize
{
  double result;

  -[FCUIActivityControl _scaledValueForValue:](self, "_scaledValueForValue:", 21.0);
  if (result > 30.0)
    return 30.0;
  return result;
}

- (void)_updateTextAttributesForActivityItemImageView
{
  UIImageView *activityIconImageView;
  void *v3;
  id v4;

  activityIconImageView = self->_activityIconImageView;
  if (activityIconImageView)
  {
    v3 = (void *)MEMORY[0x24BEBD660];
    -[FCUIActivityControl _effectiveGlyphPointSize](self, "_effectiveGlyphPointSize");
    objc_msgSend(v3, "configurationWithPointSize:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](activityIconImageView, "setPreferredSymbolConfiguration:", v4);

  }
}

- (void)_updateTextAttributesForActivityTitleLabel
{
  UILabel *activityTitleLabel;
  id v3;

  activityTitleLabel = self->_activityTitleLabel;
  if (activityTitleLabel)
  {
    objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:additionalTraits:", 1, *MEMORY[0x24BEBE218], 0x8000, *MEMORY[0x24BEBB600]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](activityTitleLabel, "setFont:", v3);

  }
}

- (void)_updateTextAttributesForDetailLabel
{
  UILabel *detailLabel;
  id v3;

  detailLabel = self->_detailLabel;
  if (detailLabel)
  {
    objc_msgSend((id)objc_opt_class(), "_preferredFont:textStyle:weight:additionalTraits:", 1, *MEMORY[0x24BEBE1E8], 0x8000, *MEMORY[0x24BEBB600]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](detailLabel, "setFont:", v3);

  }
}

- (BOOL)_needsTextAttributesUpdate
{
  return self->_preferredContentSizeCategory == 0;
}

- (void)_setNeedsTextAttributesUpdate
{
  NSString *preferredContentSizeCategory;

  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = 0;

  -[FCUIActivityControl setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateTextAttributes
{
  void *v3;
  NSString *v4;
  NSString *preferredContentSizeCategory;

  -[FCUIActivityControl traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = v4;

  -[FCUIActivityControl _updateTextAttributesForActivityTitleLabel](self, "_updateTextAttributesForActivityTitleLabel");
  -[FCUIActivityControl _updateTextAttributesForActivityItemImageView](self, "_updateTextAttributesForActivityItemImageView");
  -[FCUIActivityControl _updateTextAttributesForDetailLabel](self, "_updateTextAttributesForDetailLabel");
}

- (void)_updateTextAttributesIfNecessary
{
  if (-[FCUIActivityControl _needsTextAttributesUpdate](self, "_needsTextAttributesUpdate"))
    -[FCUIActivityControl _updateTextAttributes](self, "_updateTextAttributes");
}

- (void)_configureTextVisualStylingProviderIfNecessary
{
  void *v3;
  MTVisualStylingProvider *v4;
  MTVisualStylingProvider *textVisualStylingProvider;
  id v6;

  if (!self->_textVisualStylingProvider)
  {
    v3 = (void *)MEMORY[0x24BE64070];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_visualStylingProviderForStyleSetNamed:inBundle:", CFSTR("focusModeText"), v6);
    v4 = (MTVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
    textVisualStylingProvider = self->_textVisualStylingProvider;
    self->_textVisualStylingProvider = v4;

  }
}

- (void)_configureGlyphVisualStylingProviderIfNecessary
{
  void *v3;
  MTVisualStylingProvider *v4;
  MTVisualStylingProvider *glyphVisualStylingProvider;
  id v6;

  if (!self->_glyphVisualStylingProvider)
  {
    v3 = (void *)MEMORY[0x24BE64070];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_visualStylingProviderForStyleSetNamed:inBundle:", CFSTR("focusModeGlyph"), v6);
    v4 = (MTVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
    glyphVisualStylingProvider = self->_glyphVisualStylingProvider;
    self->_glyphVisualStylingProvider = v4;

  }
}

- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  id v9;
  id v10;

  if (a3)
  {
    v9 = a5;
    v10 = a3;
    objc_msgSend(a6, "stopAutomaticallyUpdatingView:", v10);
    objc_msgSend(v9, "automaticallyUpdateView:withStyle:", v10, a4);

  }
}

- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  -[FCUIActivityControlMenuView requiredVisualStyleCategories](self->_menuView, "requiredVisualStyleCategories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (v9)
    -[FCUIActivityControlMenuView setVisualStylingProvider:forCategory:](self->_menuView, "setVisualStylingProvider:forCategory:", v10, a4);

}

- (void)_configureContentViewIfNecessary
{
  _FCUIActivityControlContentView *v3;
  UIView *v4;
  UIView *contentView;

  if (!self->_contentView)
  {
    v3 = [_FCUIActivityControlContentView alloc];
    -[FCUIActivityControl bounds](self, "bounds");
    v4 = -[_FCUIActivityControlContentView initWithFrame:](v3, "initWithFrame:");
    contentView = self->_contentView;
    self->_contentView = v4;

    -[UIView setAutoresizingMask:](self->_contentView, "setAutoresizingMask:", 18);
    -[FCUIActivityControl addSubview:](self, "addSubview:", self->_contentView);
  }
}

- (void)_configureActivityIconImageViewIfNecessaryForReference:(BOOL)a3
{
  UIImageView *v5;
  UIImageView *activityIconImageView;

  if (!self->_activityIconImageView)
  {
    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    activityIconImageView = self->_activityIconImageView;
    self->_activityIconImageView = v5;

    -[UIImageView setContentMode:](self->_activityIconImageView, "setContentMode:", 4);
    if (!a3)
    {
      -[FCUIActivityControl _configureContentViewIfNecessary](self, "_configureContentViewIfNecessary");
      -[UIView addSubview:](self->_contentView, "addSubview:", self->_activityIconImageView);
    }
  }
}

- (id)_activityIconTintColorForSelectedAppearance:(BOOL)a3
{
  int64_t controlStyle;
  void *v4;

  controlStyle = self->_controlStyle;
  if (!controlStyle)
    goto LABEL_4;
  if (controlStyle != 2)
    return 0;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_4:
    objc_msgSend(MEMORY[0x24BEBD4B8], "fcui_colorForActivity:", self->_activityDescription);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)_setActivityIcon:(id)a3 forReference:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  UIImageView *activityIconImageView;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  -[FCUIActivityControl activityIcon](self, "activityIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();

  if ((v7 & 1) == 0)
  {
    -[FCUIActivityControl _configureActivityIconImageViewIfNecessaryForReference:](self, "_configureActivityIconImageViewIfNecessaryForReference:", v4);
    -[UIImageView setImage:](self->_activityIconImageView, "setImage:", v10);
    if (!v4)
    {
      if (self->_controlStyle == 1)
      {
        -[FCUIActivityControl _configureGlyphVisualStylingProviderIfNecessary](self, "_configureGlyphVisualStylingProviderIfNecessary");
        -[FCUIActivityControl _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_activityIconImageView, 0, self->_glyphVisualStylingProvider, 0);
      }
      else
      {
        activityIconImageView = self->_activityIconImageView;
        -[FCUIActivityControl _activityIconTintColorForSelectedAppearance:](self, "_activityIconTintColorForSelectedAppearance:", -[FCUIActivityControl _isDrawingSelectedAppearance](self, "_isDrawingSelectedAppearance"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setTintColor:](activityIconImageView, "setTintColor:", v9);

      }
      -[FCUIActivityControl setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (int64_t)_titleLabelVisualStyleForHighlightState:(BOOL)a3
{
  if (a3)
    return 2;
  else
    return 0;
}

- (void)_configureActivityTitleLabelIfNecessary
{
  UILabel *v3;
  UILabel *activityTitleLabel;
  UILabel *v5;
  id v6;

  if (!self->_activityTitleLabel)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    activityTitleLabel = self->_activityTitleLabel;
    self->_activityTitleLabel = v3;

    -[UILabel setTextAlignment:](self->_activityTitleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](self->_activityTitleLabel, "setNumberOfLines:", 0);
    -[FCUIActivityControl _configureContentViewIfNecessary](self, "_configureContentViewIfNecessary");
    -[UIView addSubview:](self->_contentView, "addSubview:", self->_activityTitleLabel);
    -[FCUIActivityControl _updateTextAttributesForActivityTitleLabel](self, "_updateTextAttributesForActivityTitleLabel");
    if (self->_controlStyle == 1)
    {
      -[FCUIActivityControl _configureTextVisualStylingProviderIfNecessary](self, "_configureTextVisualStylingProviderIfNecessary");
      -[FCUIActivityControl _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_activityTitleLabel, -[FCUIActivityControl _titleLabelVisualStyleForHighlightState:](self, "_titleLabelVisualStyleForHighlightState:", -[FCUIActivityControl _isBackgroundViewHighlighted](self, "_isBackgroundViewHighlighted")), self->_textVisualStylingProvider, 0);
    }
    else
    {
      v5 = self->_activityTitleLabel;
      objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v5, "setTextColor:", v6);

    }
  }
}

- (int64_t)_detailLabelVisualStyleForHighlightState:(BOOL)a3
{
  if (a3)
    return 3;
  else
    return 1;
}

- (void)_configureDetailLabelIfNecessary
{
  UILabel *v3;
  UILabel *detailLabel;
  UILabel *v5;
  id v6;

  if (!self->_detailLabel)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    detailLabel = self->_detailLabel;
    self->_detailLabel = v3;

    -[UILabel setTextAlignment:](self->_detailLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](self->_detailLabel, "setNumberOfLines:", 0);
    -[FCUIActivityControl _configureContentViewIfNecessary](self, "_configureContentViewIfNecessary");
    -[UIView addSubview:](self->_contentView, "addSubview:", self->_detailLabel);
    -[FCUIActivityControl _updateTextAttributesForDetailLabel](self, "_updateTextAttributesForDetailLabel");
    if (self->_controlStyle == 1)
    {
      -[FCUIActivityControl _configureTextVisualStylingProviderIfNecessary](self, "_configureTextVisualStylingProviderIfNecessary");
      -[FCUIActivityControl _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_detailLabel, -[FCUIActivityControl _detailLabelVisualStyleForHighlightState:](self, "_detailLabelVisualStyleForHighlightState:", -[FCUIActivityControl _isBackgroundViewHighlighted](self, "_isBackgroundViewHighlighted")), self->_textVisualStylingProvider, 0);
    }
    else
    {
      v5 = self->_detailLabel;
      objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v5, "setTextColor:", v6);

    }
  }
}

- (int64_t)_optionsControlTypeForControlStyle:(int64_t)a3
{
  int64_t controlStyle;
  int64_t v4;

  controlStyle = self->_controlStyle;
  v4 = 1;
  if (controlStyle == 2)
    v4 = 2;
  if (controlStyle == 1)
    return 0;
  else
    return v4;
}

- (void)_configureOptionsButtonIfNecessary
{
  FCUIOptionsControl *v3;
  FCUIOptionsControl *optionsButton;
  int64_t controlStyle;
  FCUIOptionsControl *v6;
  void *v7;

  if (!self->_optionsButton)
  {
    v3 = -[FCUIOptionsControl initWithReferencePointSize:maximumPointSize:]([FCUIOptionsControl alloc], "initWithReferencePointSize:maximumPointSize:", 21.0, 30.0);
    optionsButton = self->_optionsButton;
    self->_optionsButton = v3;

    -[FCUIOptionsControl setAdjustsFontForContentSizeCategory:](self->_optionsButton, "setAdjustsFontForContentSizeCategory:", self->_adjustsFontForContentSizeCategory);
    controlStyle = self->_controlStyle;
    -[FCUIOptionsControl setControlType:](self->_optionsButton, "setControlType:", -[FCUIActivityControl _optionsControlTypeForControlStyle:](self, "_optionsControlTypeForControlStyle:", controlStyle));
    if (controlStyle == 1)
    {
      -[FCUIActivityControl _configureGlyphVisualStylingProviderIfNecessary](self, "_configureGlyphVisualStylingProviderIfNecessary");
      -[FCUIOptionsControl setVisualStylingProvider:forCategory:](self->_optionsButton, "setVisualStylingProvider:forCategory:", self->_glyphVisualStylingProvider, 1);
    }
    else
    {
      v6 = self->_optionsButton;
      objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCUIOptionsControl setTintColor:](v6, "setTintColor:", v7);

    }
    -[FCUIActivityControl _configureContentViewIfNecessary](self, "_configureContentViewIfNecessary");
    -[UIView addSubview:](self->_contentView, "addSubview:", self->_optionsButton);
  }
}

- (void)_configureMenuViewIfNecessary
{
  FCUIActivityControlMenuView *v3;
  FCUIActivityControlMenuView *menuView;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  FCUIActivityControlMenuView *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!self->_menuView)
  {
    v3 = objc_alloc_init(FCUIActivityControlMenuView);
    menuView = self->_menuView;
    self->_menuView = v3;

    -[FCUIActivityControlMenuView setAdjustsFontForContentSizeCategory:](self->_menuView, "setAdjustsFontForContentSizeCategory:", self->_adjustsFontForContentSizeCategory);
    -[FCUIActivityControl _configureContentViewIfNecessary](self, "_configureContentViewIfNecessary");
    -[UIView addSubview:](self->_contentView, "addSubview:", self->_menuView);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[FCUIActivityControlMenuView requiredVisualStyleCategories](self->_menuView, "requiredVisualStyleCategories", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "integerValue");
          v11 = self->_menuView;
          -[FCUIActivityControl visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCUIActivityControlMenuView setVisualStylingProvider:forCategory:](v11, "setVisualStylingProvider:forCategory:", v12, v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
}

- (void)_configureBackgroundViewIfNecesssary
{
  _FCUIActivityControlBackgroundView *v3;
  UIView *backgroundView;
  UIView *v5;
  UIView *v6;
  uint64_t v7;
  UIView *v8;
  id v9;

  if (!self->_backgroundView)
  {
    if (self->_controlStyle == 1)
    {
      objc_msgSend(MEMORY[0x24BE64060], "materialViewWithRecipe:", -[FCUIActivityControl _recipe](self, "_recipe"));
      v3 = (_FCUIActivityControlBackgroundView *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = -[_FCUIActivityControlBackgroundView initWithControlStyle:]([_FCUIActivityControlBackgroundView alloc], "initWithControlStyle:", self->_controlStyle);
    }
    backgroundView = self->_backgroundView;
    self->_backgroundView = &v3->super;

    -[FCUIActivityControl _configureContentViewIfNecessary](self, "_configureContentViewIfNecessary");
    v5 = self->_backgroundView;
    -[UIView bounds](self->_contentView, "bounds");
    -[UIView setFrame:](v5, "setFrame:");
    -[UIView insertSubview:atIndex:](self->_contentView, "insertSubview:atIndex:", self->_backgroundView, 0);
    -[UIView setAutoresizingMask:](self->_backgroundView, "setAutoresizingMask:", 18);
    v6 = self->_backgroundView;
    v7 = objc_opt_class();
    v8 = v6;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = (uint64_t)v8;
      else
        v7 = 0;
    }

    if (v7)
    {
      -[FCUIActivityControl visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[FCUIActivityControl _visualStylingProviderDidChange:forCategory:outgoingProvider:](self, "_visualStylingProviderDidChange:forCategory:outgoingProvider:", v9, 1, 0);

    }
  }
}

- (void)_setActivityIconPackageView:(id)a3
{
  FCUICAPackageView **p_activityIconPackageView;
  id v6;

  p_activityIconPackageView = &self->_activityIconPackageView;
  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    -[FCUICAPackageView removeFromSuperview](*p_activityIconPackageView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_activityIconPackageView, a3);
    -[FCUIActivityControl _configureContentViewIfNecessary](self, "_configureContentViewIfNecessary");
    -[UIView addSubview:](self->_contentView, "addSubview:", *p_activityIconPackageView);
    -[FCUIActivityControl setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_updateActivityIcon
{
  uint64_t v3;
  id v4;
  UIImageView *activityIconImageView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_controlStyle == 1)
  {
    +[FCUICAPackageView packageViewForActivity:](FCUICAPackageView, "packageViewForActivity:", self->_activityDescription);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v10 = (id)v3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = v10;
    if (v10 && self->_activityIconPackageView)
      goto LABEL_9;
    -[UIImageView removeFromSuperview](self->_activityIconImageView, "removeFromSuperview");
    activityIconImageView = self->_activityIconImageView;
    self->_activityIconImageView = 0;

  }
  v4 = v10;
  if (!v10)
  {
    -[FCUIActivityControl _setActivityIconPackageView:](self, "_setActivityIconPackageView:", 0);
    v9 = (void *)MEMORY[0x24BEBD640];
    -[FCActivityDescribing activitySymbolImageName](self->_activityDescription, "activitySymbolImageName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_systemImageNamed:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCUIActivityControl setActivityIcon:](self, "setActivityIcon:", v8);
    goto LABEL_11;
  }
LABEL_9:
  -[FCUIActivityControl _setActivityIconPackageView:](self, "_setActivityIconPackageView:", v4);
  v6 = (void *)MEMORY[0x24BEBD640];
  -[FCActivityDescribing activitySymbolImageName](self->_activityDescription, "activitySymbolImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_systemImageNamed:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUIActivityControl _setActivityIcon:forReference:](self, "_setActivityIcon:forReference:", v8, 1);
LABEL_11:

}

- (void)_updateActivityTitle
{
  void *v3;
  char v4;
  id v5;

  -[FCUIActivityControl activityDisplayName](self, "activityDisplayName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel text](self->_activityTitleLabel, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = BSEqualStrings();

  if ((v4 & 1) == 0)
  {
    -[FCUIActivityControl _configureActivityTitleLabelIfNecessary](self, "_configureActivityTitleLabelIfNecessary");
    -[UILabel setText:](self->_activityTitleLabel, "setText:", v5);
    -[FCUIActivityControl setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_updateActivityDetail
{
  void *v3;
  char v4;
  id v5;

  -[FCUIActivityControl _activityDetailText](self, "_activityDetailText");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel text](self->_detailLabel, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = BSEqualStrings();

  if ((v4 & 1) == 0)
  {
    -[FCUIActivityControl _configureDetailLabelIfNecessary](self, "_configureDetailLabelIfNecessary");
    -[UILabel setText:](self->_detailLabel, "setText:", v5);
    -[FCUIActivityControl setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_updateAccessibilityIdentifier
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[FCUIActivityControl activityDisplayName](self, "activityDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("mode-%@"), v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[FCUIActivityControl setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v5);
}

- (id)_highlightingBackgroundView
{
  UIView *backgroundView;

  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    backgroundView = self->_backgroundView;
  else
    backgroundView = 0;
  return backgroundView;
}

- (BOOL)_isBackgroundViewHighlighted
{
  void *v2;
  char v3;

  -[FCUIActivityControl _highlightingBackgroundView](self, "_highlightingBackgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHighlighted");

  return v3;
}

- (int64_t)_userInterfaceStyleForSelectedAppearance:(BOOL)a3
{
  if (a3)
    return 1;
  else
    return 2;
}

- (void)_setBackgroundViewHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  UIImageView *activityIconImageView;
  void *v8;
  UIImageView *v9;
  UILabel *activityTitleLabel;
  void *v11;
  UILabel *detailLabel;
  void *v13;

  v3 = a3;
  if (-[FCUIActivityControl _isBackgroundViewHighlighted](self, "_isBackgroundViewHighlighted") != a3)
  {
    -[FCUIActivityControl _highlightingBackgroundView](self, "_highlightingBackgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHighlighted:", v3);

    if (self->_controlStyle == 1)
    {
      if (v3)
      {
        -[FCUIActivityControl visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stopAutomaticallyUpdatingView:", self->_activityIconImageView);

        -[UIImageView mt_removeAllVisualStyling](self->_activityIconImageView, "mt_removeAllVisualStyling");
        activityIconImageView = self->_activityIconImageView;
        objc_msgSend(MEMORY[0x24BEBD4B8], "fcui_colorForActivity:", self->_activityDescription);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setTintColor:](activityIconImageView, "setTintColor:", v8);
      }
      else
      {
        v9 = self->_activityIconImageView;
        -[FCUIActivityControl visualStylingProviderForCategory:](self, "visualStylingProviderForCategory:", 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCUIActivityControl _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", v9, 0, v8, 0);
      }

      activityTitleLabel = self->_activityTitleLabel;
      -[MTVisualStylingProvider _visualStylingForStyle:](self->_textVisualStylingProvider, "_visualStylingForStyle:", -[FCUIActivityControl _titleLabelVisualStyleForHighlightState:](self, "_titleLabelVisualStyleForHighlightState:", v3));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel mt_replaceVisualStyling:](activityTitleLabel, "mt_replaceVisualStyling:", v11);

      detailLabel = self->_detailLabel;
      -[MTVisualStylingProvider _visualStylingForStyle:](self->_textVisualStylingProvider, "_visualStylingForStyle:", -[FCUIActivityControl _detailLabelVisualStyleForHighlightState:](self, "_detailLabelVisualStyleForHighlightState:", v3));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel mt_replaceVisualStyling:](detailLabel, "mt_replaceVisualStyling:", v13);

      -[FCUIOptionsControl setParentControlHighlighted:](self->_optionsButton, "setParentControlHighlighted:", v3);
      -[FCUIOptionsControl layoutIfNeeded](self->_optionsButton, "layoutIfNeeded");
    }
  }
}

- (CGRect)_iconLayoutFrameForControlFrame:(CGRect)a3 isRTL:(BOOL)a4 controlSize:(int64_t)a5
{
  _BOOL4 v5;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat rect;
  CGFloat rect_8;
  CGRect v24;
  CGRect v25;
  CGRect result;

  v5 = a4;
  rect_8 = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x24BEBE0C0], self->_preferredContentSizeCategory) == NSOrderedDescending)-[FCUIActivityControl _scaledValueForValue:](self, "_scaledValueForValue:", 32.0);
  BSRectWithSize();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  if (v5)
  {
    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = rect_8;
    rect = v11;
    CGRectGetMaxX(v24);
    v25.origin.x = rect;
    v25.origin.y = v13;
    v25.size.width = v15;
    v25.size.height = v17;
    CGRectGetWidth(v25);
  }
  UIRectCenteredYInRectScale();
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)_optionsButtonLayoutFrameForControlFrame:(CGRect)a3 isRTL:(BOOL)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x24BEBE0C0], self->_preferredContentSizeCategory) == NSOrderedDescending)-[FCUIActivityControl _scaledValueForValue:](self, "_scaledValueForValue:", 32.0);
  BSRectWithSize();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  if (!a4)
  {
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    CGRectGetWidth(v22);
    v23.origin.x = v11;
    v23.origin.y = v13;
    v23.size.width = v15;
    v23.size.height = v17;
    CGRectGetWidth(v23);
  }
  UIRectCenteredYInRectScale();
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)_glyphFrameForLayoutFrame:(CGRect *)a3 sizeThatFits:(CGSize)a4
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect result;

  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  v9 = CGRectGetWidth(v14);
  if (v9 > CGRectGetWidth(*a3))
  {
    a3->origin.x = x;
    a3->origin.y = y;
    a3->size.width = width;
    a3->size.height = height;
  }
  v10 = x;
  v11 = y;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)_textFrameForControlFrame:(CGRect)a3 iconLayoutFrame:(CGRect)a4 isRTL:(BOOL)a5 controlSize:(int64_t)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  if (a6 == -1)
  {
    v14 = a4.origin.x;
    v15 = a4.origin.y;
    v16 = a4.size.width;
    v17 = a4.size.height;
    if (a5)
    {
      v18 = CGRectGetMinX(*(CGRect *)&v14) + -12.0;
      v19 = 22.0;
    }
    else
    {
      v19 = CGRectGetMaxX(*(CGRect *)&v14) + 12.0;
      v30.origin.x = v13;
      v30.origin.y = v12;
      v30.size.width = v11;
      v30.size.height = v10;
      v18 = CGRectGetMaxX(v30) + -22.0;
    }
    v24 = v18 - v19;
    v31.origin.x = v13;
    v31.origin.y = v12;
    v31.size.width = v11;
    v31.size.height = v10;
    v21 = CGRectGetHeight(v31);
    v20 = 0.0;
  }
  else
  {
    if (a5)
    {
      CGRectGetMaxX(a3);
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      CGRectGetMinX(v27);
    }
    else
    {
      CGRectGetMaxX(a4);
    }
    v28.origin.x = v13;
    v28.origin.y = v12;
    v28.size.width = v11;
    v28.size.height = v10;
    CGRectGetWidth(v28);
    v29.origin.x = v13;
    v29.origin.y = v12;
    v29.size.width = v11;
    v29.size.height = v10;
    CGRectGetHeight(v29);
    BSRectWithSize();
    UIRectCenteredXInRect();
    v19 = v22;
    v24 = v23;
  }
  v25 = v19;
  v26 = v24;
  result.size.height = v21;
  result.size.width = v26;
  result.origin.y = v20;
  result.origin.x = v25;
  return result;
}

- (CGSize)_sizeThatFits:(CGSize)a3 withControlSize:(int64_t)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (**v25)(void *, UILabel *);
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _QWORD aBlock[9];
  double v33;
  double v34;
  double v35;
  double v36;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[FCUIActivityControl _updateTextAttributesIfNecessary](self, "_updateTextAttributesIfNecessary");
  if (a4 == -1)
    v8 = 40.0;
  else
    v8 = 74.0;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x24BEBE0C0], self->_preferredContentSizeCategory) == NSOrderedDescending)-[FCUIActivityControl _scaledValueForValue:](self, "_scaledValueForValue:", v8);
  BSRectWithSize();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = -[FCUIActivityControl _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[FCUIActivityControl _iconLayoutFrameForControlFrame:isRTL:controlSize:](self, "_iconLayoutFrameForControlFrame:isRTL:controlSize:", v17, a4, v10, v12, v14, v16);
  v33 = v18;
  v34 = v19;
  v35 = v20;
  v36 = v21;
  -[UIImageView sizeThatFits:](self->_activityIconImageView, "sizeThatFits:", v14, v16);
  -[FCUIActivityControl _glyphFrameForLayoutFrame:sizeThatFits:](self, "_glyphFrameForLayoutFrame:sizeThatFits:", &v33);
  -[FCUIActivityControl _textFrameForControlFrame:iconLayoutFrame:isRTL:controlSize:](self, "_textFrameForControlFrame:iconLayoutFrame:isRTL:controlSize:", v17, a4, v10, v12, v14, v16, v33, v34, v35, v36);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__FCUIActivityControl__sizeThatFits_withControlSize___block_invoke;
  aBlock[3] = &unk_24D20AD00;
  aBlock[5] = v22;
  aBlock[6] = v23;
  aBlock[7] = v24;
  aBlock[8] = 0x7FEFFFFFFFFFFFFFLL;
  aBlock[4] = self;
  v25 = (void (**)(void *, UILabel *))_Block_copy(aBlock);
  v25[2](v25, self->_activityTitleLabel);
  ((double (*)(void *, UILabel *))v25[2])(v25, self->_detailLabel);
  if (a4 == 1)
    -[FCUIActivityControlMenuView sizeThatFits:](self->_menuView, "sizeThatFits:", width, height);
  UISizeRoundToScale();
  v27 = v26;
  v29 = v28;

  v30 = v27;
  v31 = v29;
  result.height = v31;
  result.width = v30;
  return result;
}

double __53__FCUIActivityControl__sizeThatFits_withControlSize___block_invoke(double *a1, void *a2)
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;

  v2 = *(_QWORD *)(*((_QWORD *)a1 + 4) + 544);
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v6 = a1[8];
  v7 = a2;
  objc_msgSend(v7, "fcui_measuringHeightWithNumberOfLines:", objc_msgSend(v7, "fcui_numberOfLinesInFrame:maximum:drawingContext:", 0, v2, v3, v4, v5, v6));
  v9 = v8;

  return v9;
}

- (int64_t)_recipe
{
  if (self->_controlStyle == 1)
    return 4;
  else
    return 1;
}

- (id)_activityDetailText
{
  int64_t controlStyle;
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  if (!-[FCUIActivityControl isPlaceholder](self, "isPlaceholder"))
  {
    if (!-[FCUIActivityControl showsPersistentDetailText](self, "showsPersistentDetailText"))
    {
LABEL_8:
      v7 = 0;
      return v7;
    }
LABEL_6:
    -[FCUIActivityControl activityDetailText](self, "activityDetailText");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  controlStyle = self->_controlStyle;
  v4 = -[FCUIActivityControl showsPersistentDetailText](self, "showsPersistentDetailText");
  if ((unint64_t)(controlStyle - 1) > 1)
  {
    if (!v4)
      goto LABEL_8;
    goto LABEL_6;
  }
  -[FCUIActivityControl activityDetailText](self, "activityDetailText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ACTIVITY_TRY_IT"), &stru_24D20B520, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)_setTextLayoutDisabled:(BOOL)a3
{
  NSObject *v5;
  const __CFString *v6;
  int v7;
  FCUIActivityControl *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (self->_textLayoutDisabled != a3)
  {
    v5 = FCUILogSelection;
    if (os_log_type_enabled((os_log_t)FCUILogSelection, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_textLayoutDisabled)
        v6 = CFSTR("disabled");
      else
        v6 = CFSTR("enabled");
      v7 = 138543618;
      v8 = self;
      v9 = 2114;
      v10 = v6;
      _os_log_impl(&dword_214772000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: text layout %{public}@", (uint8_t *)&v7, 0x16u);
    }
    self->_textLayoutDisabled = a3;
  }
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FCUIActivityControl;
  -[FCUIActivityControl description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)MEMORY[0x24BDD17C8];
  -[FCUIActivityControl activityDisplayName](self, "activityDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("; activityDisplayName: %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertString:atIndex:", v7, objc_msgSend(v4, "rangeOfString:options:", CFSTR(">"), 4));

  return (NSString *)v4;
}

- (BOOL)isSelectionHidden
{
  return self->_selectionHidden;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 600);
}

- (FCActivityDescribing)activityDescription
{
  return self->_activityDescription;
}

- (int64_t)controlStyle
{
  return self->_controlStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityDescription, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_drawingContext, 0);
  objc_storeStrong((id *)&self->_glyphVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_textVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_menuView, 0);
  objc_storeStrong((id *)&self->_optionsButton, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_activityTitleLabel, 0);
  objc_storeStrong((id *)&self->_activityIconPackageView, 0);
  objc_storeStrong((id *)&self->_activityIconImageView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
