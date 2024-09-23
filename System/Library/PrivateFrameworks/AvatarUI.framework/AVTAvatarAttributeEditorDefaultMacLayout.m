@implementation AVTAvatarAttributeEditorDefaultMacLayout

- (unint64_t)supportedLayoutOrientation
{
  return 1;
}

- (double)maxHeaderHeight
{
  return 270.0;
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
  double v14;
  double v15;
  CGRect result;

  -[AVTAvatarAttributeEditorDefaultMacLayout attributesContentViewFrame](self, "attributesContentViewFrame");
  v4 = v3;
  v6 = v5;
  -[AVTAvatarAttributeEditorLayout edgeInsets](self, "edgeInsets");
  v8 = v7;
  -[AVTAvatarAttributeEditorDefaultMacLayout maxHeaderHeight](self, "maxHeaderHeight");
  v10 = v9;
  -[AVTAvatarAttributeEditorDefaultMacLayout groupDialContainerFrame](self, "groupDialContainerFrame");
  v12 = v10 - v11;
  v13 = v4;
  v14 = v8;
  v15 = v6;
  result.size.height = v12;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
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
    -[AVTAvatarAttributeEditorDefaultMacLayout defaultUserInfoFrame](self, "defaultUserInfoFrame");
    v5 = v20;
    v17 = v21;
    v9 = v22;
    v19 = v23;
  }
  else
  {
    -[AVTAvatarAttributeEditorDefaultMacLayout groupDialContainerFrame](self, "groupDialContainerFrame");
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
  -[AVTAvatarAttributeEditorDefaultMacLayout groupDialContainerFrame](self, "groupDialContainerFrame");
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
  double v10;
  double v11;
  double v12;
  CGRect result;

  -[AVTAvatarAttributeEditorDefaultMacLayout sideGroupContainerFrame](self, "sideGroupContainerFrame");
  v4 = v3;
  if (-[AVTAvatarAttributeEditorLayout RTL](self, "RTL"))
    v5 = 0.0;
  else
    v5 = v4;
  -[AVTAvatarAttributeEditorLayout containerSize](self, "containerSize");
  v7 = v6 - v4;
  -[AVTAvatarAttributeEditorLayout containerSize](self, "containerSize");
  v9 = v8;
  v10 = 0.0;
  v11 = v5;
  v12 = v7;
  result.size.height = v9;
  result.size.width = v12;
  result.origin.y = v10;
  result.origin.x = v11;
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

  -[AVTAvatarAttributeEditorDefaultMacLayout attributesContentViewFrame](self, "attributesContentViewFrame");
  v4 = v3;
  -[AVTAvatarAttributeEditorDefaultMacLayout groupDialContainerFrame](self, "groupDialContainerFrame");
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
  double v12;
  double v13;
  UIEdgeInsets result;

  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  -[AVTAvatarAttributeEditorDefaultMacLayout avatarContainerFrame](self, "avatarContainerFrame");
  v6 = v5;
  -[AVTAvatarAttributeEditorDefaultMacLayout attributesContentViewFrame](self, "attributesContentViewFrame");
  v8 = v7 - v6;
  -[AVTAvatarAttributeEditorDefaultMacLayout maxHeaderHeight](self, "maxHeaderHeight");
  v10 = v9 - v8;
  v11 = 36.0;
  v12 = v3;
  v13 = v4;
  result.right = v13;
  result.bottom = v11;
  result.left = v12;
  result.top = v10;
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
  UIEdgeInsets result;

  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  -[AVTAvatarAttributeEditorDefaultMacLayout avatarContainerFrame](self, "avatarContainerFrame");
  v7 = v6;
  -[AVTAvatarAttributeEditorDefaultMacLayout attributesContentViewFrame](self, "attributesContentViewFrame");
  v9 = v8 - v7;
  -[AVTAvatarAttributeEditorDefaultMacLayout maxHeaderHeight](self, "maxHeaderHeight");
  v11 = v10 - v9;
  v12 = v3;
  v13 = v4;
  v14 = v5;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
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
  double v17;
  CGRect result;

  v3 = 0.0;
  if (!-[AVTAvatarAttributeEditorLayout showSideGroupPicker](self, "showSideGroupPicker"))
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
  -[AVTAvatarAttributeEditorDefaultMacLayout maxHeaderHeight](self, "maxHeaderHeight");
  v11 = v10 - v3;
  -[AVTAvatarAttributeEditorLayout edgeInsets](self, "edgeInsets");
  v13 = v11 + v12;
  -[AVTAvatarAttributeEditorDefaultMacLayout attributesContentViewFrame](self, "attributesContentViewFrame");
  v15 = 0.0;
  v16 = v13;
  v17 = v3;
  result.size.height = v17;
  result.size.width = v14;
  result.origin.y = v16;
  result.origin.x = v15;
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
  double v9;
  double v10;
  double v11;
  CGRect result;

  v3 = 0.0;
  v4 = 0.0;
  if (-[AVTAvatarAttributeEditorLayout showSideGroupPicker](self, "showSideGroupPicker"))
  {
    -[AVTAvatarAttributeEditorDefaultMacLayout widthToFitGroupLabels](self, "widthToFitGroupLabels");
    v4 = v5;
  }
  if (-[AVTAvatarAttributeEditorLayout RTL](self, "RTL"))
  {
    -[AVTAvatarAttributeEditorLayout containerSize](self, "containerSize");
    v3 = v6 - v4;
  }
  -[AVTAvatarAttributeEditorLayout containerSize](self, "containerSize");
  v8 = v7;
  v9 = 0.0;
  v10 = v3;
  v11 = v4;
  result.size.height = v8;
  result.size.width = v11;
  result.origin.y = v9;
  result.origin.x = v10;
  return result;
}

- (double)widthToFitGroupLabels
{
  double v3;
  double v4;
  double v5;
  double result;

  +[AVTGroupListCollectionViewCell estimatedLabelWidthForContainerWidth:](AVTGroupListCollectionViewCell, "estimatedLabelWidthForContainerWidth:", 195.0);
  v4 = v3;
  -[AVTAvatarAttributeEditorLayout maxGroupLabelWidth](self, "maxGroupLabelWidth");
  result = fmax(v5 - v4 + 215.0, 192.0);
  if (result > 215.0)
    return 215.0;
  return result;
}

@end
