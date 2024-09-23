@implementation AVTAvatarAttributeEditorDefaultPortraitLayout

- (unint64_t)supportedLayoutOrientation
{
  return 1;
}

- (double)maxHeaderHeight
{
  double v3;
  double v4;
  double v5;

  -[AVTAvatarAttributeEditorLayout containerSize](self, "containerSize");
  v4 = v3 * 0.5;
  -[AVTAvatarAttributeEditorLayout edgeInsets](self, "edgeInsets");
  return v4 - v5;
}

- (CGRect)avatarContainerFrame
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
  double v13;
  CGRect result;

  -[AVTAvatarAttributeEditorLayout edgeInsets](self, "edgeInsets");
  v4 = v3;
  -[AVTAvatarAttributeEditorLayout containerSize](self, "containerSize");
  v6 = v5;
  -[AVTAvatarAttributeEditorDefaultPortraitLayout maxHeaderHeight](self, "maxHeaderHeight");
  v8 = v7;
  -[AVTAvatarAttributeEditorDefaultPortraitLayout groupDialContainerFrame](self, "groupDialContainerFrame");
  v10 = v8 - v9;
  v11 = 0.0;
  v12 = v4;
  v13 = v6;
  result.size.height = v10;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)avatarContainerAlpha
{
  return 1.0;
}

- (CGRect)userInfoFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  BOOL v13;
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
  CGRect result;

  -[AVTAvatarAttributeEditorLayout userInfoViewHeight](self, "userInfoViewHeight");
  if (v3 <= 0.0)
  {
    -[AVTAvatarAttributeEditorDefaultPortraitLayout defaultUserInfoFrame](self, "defaultUserInfoFrame");
    v5 = v20;
    v17 = v21;
    v9 = v22;
    v19 = v23;
  }
  else
  {
    -[AVTAvatarAttributeEditorDefaultPortraitLayout groupDialContainerFrame](self, "groupDialContainerFrame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    +[AVTUIFontRepository groupDialBoldLabelFont](AVTUIFontRepository, "groupDialBoldLabelFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_scaledValueForValue:", 18.0);
    v12 = v11 * 0.5;
    v13 = v11 <= 30.0;
    v14 = 15.0;
    if (v13)
      v14 = v12;
    v15 = v7 + v14;
    -[AVTAvatarAttributeEditorLayout userInfoViewHeight](self, "userInfoViewHeight");
    v17 = v15 - v16;
    -[AVTAvatarAttributeEditorLayout userInfoViewHeight](self, "userInfoViewHeight");
    v19 = v18;

  }
  v24 = v5;
  v25 = v17;
  v26 = v9;
  v27 = v19;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)defaultUserInfoFrame
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double MinY;
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
  CGRect v35;
  CGRect result;

  +[AVTUIFontRepository userInfoLabelFont](AVTUIFontRepository, "userInfoLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorDefaultPortraitLayout groupDialContainerFrame](self, "groupDialContainerFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  +[AVTUIFontRepository groupDialBoldLabelFont](AVTUIFontRepository, "groupDialBoldLabelFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_scaledValueForValue:", 18.0);
  v14 = v13;
  v15 = v13 * 0.5;
  v35.origin.x = v5;
  v35.origin.y = v7;
  v35.size.width = v9;
  v35.size.height = v11;
  MinY = CGRectGetMinY(v35);
  v17 = 15.0;
  if (v14 <= 30.0)
    v17 = v15;
  v18 = MinY + v17;
  objc_msgSend(v3, "ascender");
  v20 = v19;
  objc_msgSend(v3, "descender");
  v22 = v18 - (v20 - v21);
  +[AVTUserInfoView textVerticalPadding](AVTUserInfoView, "textVerticalPadding");
  v24 = v22 - v23 * 2.0;
  objc_msgSend(v3, "ascender");
  v26 = v25;
  objc_msgSend(v3, "descender");
  v28 = v26 - v27;
  +[AVTUserInfoView textVerticalPadding](AVTUserInfoView, "textVerticalPadding");
  v30 = v28 + v29 * 2.0;

  v31 = v5;
  v32 = v24;
  v33 = v9;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (CGRect)attributesContentViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[AVTAvatarAttributeEditorLayout containerSize](self, "containerSize");
  v4 = v3;
  -[AVTAvatarAttributeEditorLayout containerSize](self, "containerSize");
  v6 = v5;
  v7 = 0.0;
  v8 = 0.0;
  v9 = v4;
  result.size.height = v6;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
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
  double MaxY;
  double v6;
  double v7;
  double v8;
  CGRect v9;
  CGRect result;

  -[AVTAvatarAttributeEditorLayout containerSize](self, "containerSize");
  v4 = v3;
  -[AVTAvatarAttributeEditorDefaultPortraitLayout groupDialContainerFrame](self, "groupDialContainerFrame");
  MaxY = CGRectGetMaxY(v9);
  v6 = 0.0;
  v7 = 0.0;
  v8 = v4;
  result.size.height = MaxY;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
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
  UIEdgeInsets result;

  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  -[AVTAvatarAttributeEditorDefaultPortraitLayout maxHeaderHeight](self, "maxHeaderHeight");
  v6 = v5;
  -[AVTAvatarAttributeEditorLayout screenScale](self, "screenScale");
  AVTRoundToScale(v6, v7);
  v9 = 36.0;
  v10 = v3;
  v11 = v4;
  result.right = v11;
  result.bottom = v9;
  result.left = v10;
  result.top = v8;
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
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  -[AVTAvatarAttributeEditorDefaultPortraitLayout avatarContainerFrame](self, "avatarContainerFrame");
  v7 = v6;
  -[AVTAvatarAttributeEditorLayout edgeInsets](self, "edgeInsets");
  v9 = v8 - v7;
  -[AVTAvatarAttributeEditorDefaultPortraitLayout maxHeaderHeight](self, "maxHeaderHeight");
  v11 = v10 - v9;
  -[AVTAvatarAttributeEditorLayout screenScale](self, "screenScale");
  AVTRoundToScale(v11, v12);
  v14 = v3;
  v15 = v4;
  v16 = v5;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (CGRect)groupDialContainerFrame
{
  void *v3;
  double v4;
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
  double v17;
  double v18;
  double v19;
  CGRect result;

  +[AVTUIFontRepository groupDialBoldLabelFont](AVTUIFontRepository, "groupDialBoldLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scaledValueForValue:", 18.0);
  if (v4 <= 30.0)
    v5 = v4;
  else
    v5 = 30.0;
  objc_msgSend(v3, "ascender");
  v7 = v6;
  objc_msgSend(v3, "descender");
  v9 = ceil(v7 - v8 + v5 * 2.0);
  -[AVTAvatarAttributeEditorDefaultPortraitLayout maxHeaderHeight](self, "maxHeaderHeight");
  v11 = v10 - v9;
  -[AVTAvatarAttributeEditorLayout edgeInsets](self, "edgeInsets");
  v13 = v12 + v11;
  -[AVTAvatarAttributeEditorLayout containerSize](self, "containerSize");
  v15 = v14;

  v16 = 0.0;
  v17 = v13;
  v18 = v15;
  v19 = v9;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)sideGroupContainerFrame
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

@end
