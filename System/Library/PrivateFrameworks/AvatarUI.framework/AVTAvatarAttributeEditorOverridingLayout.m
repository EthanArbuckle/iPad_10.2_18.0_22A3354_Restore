@implementation AVTAvatarAttributeEditorOverridingLayout

- (AVTAvatarAttributeEditorOverridingLayout)initWithLayout:(id)a3
{
  id v5;
  AVTAvatarAttributeEditorOverridingLayout *v6;
  AVTAvatarAttributeEditorOverridingLayout *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AVTAvatarAttributeEditorOverridingLayout;
  v6 = -[AVTAvatarAttributeEditorOverridingLayout init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_backingLayout, a3);
    objc_msgSend(v5, "avatarContainerFrame");
    v7->_avatarContainerFrame.origin.x = v8;
    v7->_avatarContainerFrame.origin.y = v9;
    v7->_avatarContainerFrame.size.width = v10;
    v7->_avatarContainerFrame.size.height = v11;
    objc_msgSend(v5, "attributesContentViewFrame");
    v7->_attributesContentViewFrame.origin.x = v12;
    v7->_attributesContentViewFrame.origin.y = v13;
    v7->_attributesContentViewFrame.size.width = v14;
    v7->_attributesContentViewFrame.size.height = v15;
    objc_msgSend(v5, "avatarContainerAlpha");
    v7->_avatarContainerAlpha = v16;
  }

  return v7;
}

- (NSString)contentSizeCategory
{
  void *v2;
  void *v3;

  -[AVTAvatarAttributeEditorOverridingLayout backingLayout](self, "backingLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CGSize)containerSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[AVTAvatarAttributeEditorOverridingLayout backingLayout](self, "backingLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIEdgeInsets)edgeInsets
{
  void *v2;
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

  -[AVTAvatarAttributeEditorOverridingLayout backingLayout](self, "backingLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "edgeInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (double)userInfoViewHeight
{
  void *v2;
  double v3;
  double v4;

  -[AVTAvatarAttributeEditorOverridingLayout backingLayout](self, "backingLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfoViewHeight");
  v4 = v3;

  return v4;
}

- (double)screenScale
{
  void *v2;
  double v3;
  double v4;

  -[AVTAvatarAttributeEditorOverridingLayout backingLayout](self, "backingLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screenScale");
  v4 = v3;

  return v4;
}

- (CGRect)groupDialContainerFrame
{
  void *v2;
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
  CGRect result;

  -[AVTAvatarAttributeEditorOverridingLayout backingLayout](self, "backingLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupDialContainerFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)sideGroupContainerFrame
{
  void *v2;
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
  CGRect result;

  -[AVTAvatarAttributeEditorOverridingLayout backingLayout](self, "backingLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sideGroupContainerFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)showSideGroupPicker
{
  void *v2;
  char v3;

  -[AVTAvatarAttributeEditorOverridingLayout backingLayout](self, "backingLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showSideGroupPicker");

  return v3;
}

- (CGRect)userInfoFrame
{
  void *v2;
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
  CGRect result;

  -[AVTAvatarAttributeEditorOverridingLayout backingLayout](self, "backingLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfoFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)headerMaskingViewAlpha
{
  void *v2;
  double v3;
  double v4;

  -[AVTAvatarAttributeEditorOverridingLayout backingLayout](self, "backingLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headerMaskingViewAlpha");
  v4 = v3;

  return v4;
}

- (CGRect)headerMaskingViewFrame
{
  void *v2;
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
  CGRect result;

  -[AVTAvatarAttributeEditorOverridingLayout backingLayout](self, "backingLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headerMaskingViewFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)verticalRuleAlpha
{
  void *v2;
  double v3;
  double v4;

  -[AVTAvatarAttributeEditorOverridingLayout backingLayout](self, "backingLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "verticalRuleAlpha");
  v4 = v3;

  return v4;
}

- (CGRect)verticalRuleFrame
{
  void *v2;
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
  CGRect result;

  -[AVTAvatarAttributeEditorOverridingLayout backingLayout](self, "backingLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "verticalRuleFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (UIEdgeInsets)attributesContentViewInsets
{
  void *v2;
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

  -[AVTAvatarAttributeEditorOverridingLayout backingLayout](self, "backingLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributesContentViewInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (UIEdgeInsets)attributesContentViewScrollIndicatorInsets
{
  void *v2;
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

  -[AVTAvatarAttributeEditorOverridingLayout backingLayout](self, "backingLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributesContentViewScrollIndicatorInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (unint64_t)supportedLayoutOrientation
{
  void *v2;
  unint64_t v3;

  -[AVTAvatarAttributeEditorOverridingLayout backingLayout](self, "backingLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportedLayoutOrientation");

  return v3;
}

- (double)maxGroupLabelWidth
{
  void *v2;
  double v3;
  double v4;

  -[AVTAvatarAttributeEditorOverridingLayout backingLayout](self, "backingLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maxGroupLabelWidth");
  v4 = v3;

  return v4;
}

- (BOOL)RTL
{
  void *v2;
  char v3;

  -[AVTAvatarAttributeEditorOverridingLayout backingLayout](self, "backingLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "RTL");

  return v3;
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

- (void)setAvatarContainerFrame:(CGRect)a3
{
  self->_avatarContainerFrame = a3;
}

- (double)avatarContainerAlpha
{
  return self->_avatarContainerAlpha;
}

- (void)setAvatarContainerAlpha:(double)a3
{
  self->_avatarContainerAlpha = a3;
}

- (CGRect)attributesContentViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_attributesContentViewFrame.origin.x;
  y = self->_attributesContentViewFrame.origin.y;
  width = self->_attributesContentViewFrame.size.width;
  height = self->_attributesContentViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAttributesContentViewFrame:(CGRect)a3
{
  self->_attributesContentViewFrame = a3;
}

- (AVTAvatarAttributeEditorLayout)backingLayout
{
  return self->_backingLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingLayout, 0);
}

@end
