@implementation AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout

- (double)initWithContainerSize:(uint64_t)a3 insets:(char)a4 userInfoViewHeight:(uint64_t)a5 screenScale:(uint64_t)a6 RTL:(uint64_t)a7 avatarViewContainerFrame:(uint64_t)a8 attributesContentViewFrameExtraHeight:(double)a9 avatarViewAlpha:(double)a10 showSideGroupPicker:(double)a11
{
  double *v15;
  double result;
  objc_super v17;

  v17.receiver = a1;
  v17.super_class = (Class)AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout;
  v15 = (double *)objc_msgSendSuper2(&v17, sel_initWithContainerSize_insets_userInfoViewHeight_screenScale_RTL_showSideGroupPicker_);
  if (v15)
  {
    result = a20;
    *((_QWORD *)v15 + 15) = a17;
    *((_QWORD *)v15 + 16) = a18;
    *((_QWORD *)v15 + 17) = a19;
    v15[18] = a20;
    *((_QWORD *)v15 + 14) = a21;
    *((_QWORD *)v15 + 13) = a22;
    *((_BYTE *)v15 + 96) = a4;
  }
  return result;
}

- (unint64_t)supportedLayoutOrientation
{
  return 1;
}

- (CGRect)groupDialContainerFrame
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v3 = 0.0;
  if (!-[AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout showSideGroupPicker](self, "showSideGroupPicker"))
  {
    +[AVTUIFontRepository groupDialBoldLabelFont](AVTUIFontRepository, "groupDialBoldLabelFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_scaledValueForValue:", 18.0);
    if (v5 <= 30.0)
      v6 = v5;
    else
      v6 = 30.0;
    objc_msgSend(v4, "ascender");
    v8 = v7;
    objc_msgSend(v4, "descender");
    v3 = ceil(v8 - v9 + v6 * 2.0);

  }
  -[AVTAvatarAttributeEditorLayout containerSize](self, "containerSize");
  v11 = v10;
  -[AVTAvatarAttributeEditorLayout containerSize](self, "containerSize");
  v13 = v12;
  v14 = 0.0;
  v15 = v11;
  v16 = v3;
  result.size.height = v16;
  result.size.width = v13;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)sideGroupContainerFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  if (-[AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout showSideGroupPicker](self, "showSideGroupPicker"))
  {
    v3 = 192.0;
  }
  else
  {
    v3 = 0.0;
  }
  -[AVTAvatarAttributeEditorLayout containerSize](self, "containerSize");
  v5 = v4;
  v6 = 0.0;
  v7 = -v3;
  v8 = v3;
  result.size.height = v5;
  result.size.width = v8;
  result.origin.y = v6;
  result.origin.x = v7;
  return result;
}

- (CGRect)attributesContentViewFrame
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect result;

  -[AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout attributesContentViewInsets](self, "attributesContentViewInsets");
  v4 = v3;
  -[AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout groupDialContainerFrame](self, "groupDialContainerFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout sideGroupContainerFrame](self, "sideGroupContainerFrame");
  v14 = v13;
  v25.origin.x = v6;
  v25.origin.y = v8;
  v25.size.width = v10;
  v25.size.height = v12;
  v15 = CGRectGetMaxY(v25) - v4;
  -[AVTAvatarAttributeEditorLayout containerSize](self, "containerSize");
  v17 = v16 - v14;
  -[AVTAvatarAttributeEditorLayout containerSize](self, "containerSize");
  v19 = v18;
  -[AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout attributesContentViewExtraHeight](self, "attributesContentViewExtraHeight");
  v21 = v19 + v20;
  v22 = v14;
  v23 = v15;
  v24 = v17;
  result.size.height = v21;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)userInfoFrame
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double MinY;
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
  CGRect v34;
  CGRect result;

  -[AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout groupDialContainerFrame](self, "groupDialContainerFrame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  +[AVTUIFontRepository userInfoLabelFont](AVTUIFontRepository, "userInfoLabelFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTUIFontRepository groupDialBoldLabelFont](AVTUIFontRepository, "groupDialBoldLabelFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_scaledValueForValue:", 18.0);
  v13 = v12;
  v14 = v12 * 0.5;
  v34.origin.x = v3;
  v34.origin.y = v5;
  v34.size.width = v7;
  v34.size.height = v9;
  MinY = CGRectGetMinY(v34);
  v16 = 15.0;
  if (v13 <= 30.0)
    v16 = v14;
  v17 = MinY + v16;
  objc_msgSend(v10, "ascender");
  v19 = v18;
  objc_msgSend(v10, "descender");
  v21 = v17 - (v19 - v20);
  +[AVTUserInfoView textVerticalPadding](AVTUserInfoView, "textVerticalPadding");
  v23 = v21 - v22 * 2.0;
  objc_msgSend(v10, "ascender");
  v25 = v24;
  objc_msgSend(v10, "descender");
  v27 = v25 - v26;
  +[AVTUserInfoView textVerticalPadding](AVTUserInfoView, "textVerticalPadding");
  v29 = v27 + v28 * 2.0;

  v30 = v3;
  v31 = v23;
  v32 = v7;
  v33 = v29;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (double)headerMaskingViewAlpha
{
  return 1.0;
}

- (CGRect)headerMaskingViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v11;
  CGRect result;

  -[AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout attributesContentViewFrame](self, "attributesContentViewFrame");
  v4 = v3;
  v6 = v5;
  -[AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout groupDialContainerFrame](self, "groupDialContainerFrame");
  v7 = CGRectGetMaxY(v11) - v4;
  v8 = 0.0;
  v9 = 0.0;
  v10 = v6;
  result.size.height = v7;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (double)verticalRuleAlpha
{
  return 0.0;
}

- (CGRect)verticalRuleFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIEdgeInsets)attributesContentViewInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIEdgeInsets result;

  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  -[AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout avatarContainerFrame](self, "avatarContainerFrame");
  v7 = v6;
  -[AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout groupDialContainerFrame](self, "groupDialContainerFrame");
  v9 = v7 + v8;
  v10 = v3;
  v11 = v4;
  v12 = v5;
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v9;
  return result;
}

- (UIEdgeInsets)attributesContentViewScrollIndicatorInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIEdgeInsets result;

  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  -[AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout avatarContainerFrame](self, "avatarContainerFrame");
  v7 = v6;
  -[AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout groupDialContainerFrame](self, "groupDialContainerFrame");
  v9 = v7 + v8;
  v10 = v3;
  v11 = v4;
  v12 = v5;
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v9;
  return result;
}

- (id)backgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
}

- (CGRect)avatarContainerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_avatarContainerFrame.origin.x;
  y = self->_avatarContainerFrame.origin.y;
  width = self->_avatarContainerFrame.size.width;
  height = self->_avatarContainerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)avatarContainerAlpha
{
  return self->_avatarContainerAlpha;
}

- (BOOL)showSideGroupPicker
{
  return self->_showSideGroupPicker;
}

- (double)attributesContentViewExtraHeight
{
  return self->_attributesContentViewExtraHeight;
}

@end
