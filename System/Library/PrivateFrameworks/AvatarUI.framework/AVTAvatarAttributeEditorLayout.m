@implementation AVTAvatarAttributeEditorLayout

- (AVTAvatarAttributeEditorLayout)initWithContainerSize:(CGSize)a3 insets:(UIEdgeInsets)a4 userInfoViewHeight:(double)a5 screenScale:(double)a6 RTL:(BOOL)a7 showSideGroupPicker:(BOOL)a8
{
  return -[AVTAvatarAttributeEditorLayout initWithContainerSize:insets:userInfoViewHeight:screenScale:RTL:showSideGroupPicker:maxGroupLabelWidth:](self, "initWithContainerSize:insets:userInfoViewHeight:screenScale:RTL:showSideGroupPicker:maxGroupLabelWidth:", a7, a8, a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right, a5, a6, 0);
}

- (AVTAvatarAttributeEditorLayout)initWithContainerSize:(CGSize)a3 insets:(UIEdgeInsets)a4 userInfoViewHeight:(double)a5 screenScale:(double)a6 RTL:(BOOL)a7 showSideGroupPicker:(BOOL)a8 maxGroupLabelWidth:(double)a9
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  CGFloat height;
  CGFloat width;
  AVTAvatarAttributeEditorLayout *v19;
  AVTAvatarAttributeEditorLayout *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSString *contentSizeCategory;
  objc_super v26;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  height = a3.height;
  width = a3.width;
  v26.receiver = self;
  v26.super_class = (Class)AVTAvatarAttributeEditorLayout;
  v19 = -[AVTAvatarAttributeEditorLayout init](&v26, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_containerSize.width = width;
    v19->_containerSize.height = height;
    v19->_edgeInsets.top = top;
    v19->_edgeInsets.left = left;
    v19->_edgeInsets.bottom = bottom;
    v19->_edgeInsets.right = right;
    v19->_userInfoViewHeight = a5;
    v19->_screenScale = a6;
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "preferredContentSizeCategory");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    contentSizeCategory = v20->_contentSizeCategory;
    v20->_contentSizeCategory = (NSString *)v23;

    v20->_RTL = a7;
    v20->_showSideGroupPicker = a8;
    v20->_maxGroupLabelWidth = a9;
  }
  return v20;
}

- (CGRect)avatarContainerFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[AVTAvatarAttributeEditorLayout raiseExceptionForPropertyString:](self, "raiseExceptionForPropertyString:", CFSTR("avatarContainerFrame"));
  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)avatarContainerAlpha
{
  -[AVTAvatarAttributeEditorLayout raiseExceptionForPropertyString:](self, "raiseExceptionForPropertyString:", CFSTR("avatarContainerAlpha"));
  return 1.0;
}

- (CGRect)attributesContentViewFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[AVTAvatarAttributeEditorLayout raiseExceptionForPropertyString:](self, "raiseExceptionForPropertyString:", CFSTR("attributesContentViewFrame"));
  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)userInfoFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[AVTAvatarAttributeEditorLayout raiseExceptionForPropertyString:](self, "raiseExceptionForPropertyString:", CFSTR("userInfoFrame"));
  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)headerMaskingViewAlpha
{
  -[AVTAvatarAttributeEditorLayout raiseExceptionForPropertyString:](self, "raiseExceptionForPropertyString:", CFSTR("headerMaskingViewAlpha"));
  return 1.0;
}

- (CGRect)headerMaskingViewFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[AVTAvatarAttributeEditorLayout raiseExceptionForPropertyString:](self, "raiseExceptionForPropertyString:", CFSTR("headerMaskingViewFrame"));
  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)verticalRuleAlpha
{
  -[AVTAvatarAttributeEditorLayout raiseExceptionForPropertyString:](self, "raiseExceptionForPropertyString:", CFSTR("verticalRuleAlpha"));
  return 1.0;
}

- (CGRect)verticalRuleFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[AVTAvatarAttributeEditorLayout raiseExceptionForPropertyString:](self, "raiseExceptionForPropertyString:", CFSTR("verticalRuleFrame"));
  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIEdgeInsets)attributesContentViewInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[AVTAvatarAttributeEditorLayout raiseExceptionForPropertyString:](self, "raiseExceptionForPropertyString:", CFSTR("attributesContentViewInsets"));
  v2 = *MEMORY[0x1E0CEB4B0];
  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)attributesContentViewScrollIndicatorInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[AVTAvatarAttributeEditorLayout raiseExceptionForPropertyString:](self, "raiseExceptionForPropertyString:", CFSTR("attributesContentViewScrollIndicatorInsets"));
  v2 = *MEMORY[0x1E0CEB4B0];
  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)backgroundColor
{
  -[AVTAvatarAttributeEditorLayout raiseExceptionForPropertyString:](self, "raiseExceptionForPropertyString:", CFSTR("backgroundColor"));
  return 0;
}

- (unint64_t)supportedLayoutOrientation
{
  -[AVTAvatarAttributeEditorLayout raiseExceptionForPropertyString:](self, "raiseExceptionForPropertyString:", CFSTR("supportedLayoutOrientation"));
  return 0;
}

- (CGRect)groupDialContainerFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[AVTAvatarAttributeEditorLayout raiseExceptionForPropertyString:](self, "raiseExceptionForPropertyString:", CFSTR("groupDialContainerFrame"));
  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)sideGroupContainerFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[AVTAvatarAttributeEditorLayout raiseExceptionForPropertyString:](self, "raiseExceptionForPropertyString:", CFSTR("sideGroupContainerFrame"));
  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)raiseExceptionForPropertyString:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<AVTAvatarAttributeEditorLayout:%p> Property getter for \"%@\" called on abstract superclass"), self, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v4, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise");

}

- (CGSize)containerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_containerSize.width;
  height = self->_containerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)userInfoViewHeight
{
  return self->_userInfoViewHeight;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (BOOL)showSideGroupPicker
{
  return self->_showSideGroupPicker;
}

- (BOOL)RTL
{
  return self->_RTL;
}

- (double)maxGroupLabelWidth
{
  return self->_maxGroupLabelWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
}

@end
