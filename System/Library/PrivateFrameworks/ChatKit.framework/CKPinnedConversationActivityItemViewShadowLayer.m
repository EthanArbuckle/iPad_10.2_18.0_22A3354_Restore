@implementation CKPinnedConversationActivityItemViewShadowLayer

- (CKPinnedConversationActivityItemViewShadowLayer)initWithShadowType:(int64_t)a3
{
  CKPinnedConversationActivityItemViewShadowLayer *v4;
  CKPinnedConversationActivityItemViewShadowLayer *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKPinnedConversationActivityItemViewShadowLayer;
  v4 = -[CKPinnedConversationActivityItemViewShadowLayer init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_shadowType = a3;
    v4->_userInterfaceStyle = 0;
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CKPinnedConversationActivityItemViewShadowLayer setShadowColor:](v5, "setShadowColor:", objc_msgSend(v6, "CGColor"));

    -[CKPinnedConversationActivityItemViewShadowLayer _updateShadowProperties](v5, "_updateShadowProperties");
  }
  return v5;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  if (self->_userInterfaceStyle != a3)
  {
    self->_userInterfaceStyle = a3;
    -[CKPinnedConversationActivityItemViewShadowLayer _updateShadowProperties](self, "_updateShadowProperties");
  }
}

- (void)_updateShadowProperties
{
  int64_t v3;
  double v4;

  v3 = -[CKPinnedConversationActivityItemViewShadowLayer _shadowStyleForShadowType:userInterfaceStyle:](self, "_shadowStyleForShadowType:userInterfaceStyle:", self->_shadowType, self->_userInterfaceStyle);
  -[CKPinnedConversationActivityItemViewShadowLayer _opacityForShadowStyle:](self, "_opacityForShadowStyle:", v3);
  *(float *)&v4 = v4;
  -[CKPinnedConversationActivityItemViewShadowLayer setShadowOpacity:](self, "setShadowOpacity:", v4);
  -[CKPinnedConversationActivityItemViewShadowLayer _radiusForShadowStyle:](self, "_radiusForShadowStyle:", v3);
  -[CKPinnedConversationActivityItemViewShadowLayer setShadowRadius:](self, "setShadowRadius:");
  -[CKPinnedConversationActivityItemViewShadowLayer _offsetForShadowStyle:](self, "_offsetForShadowStyle:", v3);
  -[CKPinnedConversationActivityItemViewShadowLayer setShadowOffset:](self, "setShadowOffset:");
}

- (int64_t)_shadowStyleForShadowType:(int64_t)a3 userInterfaceStyle:(int64_t)a4
{
  int64_t v4;

  v4 = 3;
  if (a3 != 1)
    v4 = 0;
  if (!a3)
    v4 = 1;
  if (a4 != 2)
    v4 = 0;
  if ((unint64_t)a4 >= 2)
    return v4;
  else
    return 2 * (a3 == 1);
}

- (double)_opacityForShadowStyle:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;

  switch(a3)
  {
    case 0:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pinnedConversationActivityBroadShadowLightOpacity");
      goto LABEL_7;
    case 1:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pinnedConversationActivityBroadShadowDarkOpacity");
      goto LABEL_7;
    case 2:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pinnedConversationActivityTightShadowLightOpacity");
      goto LABEL_7;
    case 3:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pinnedConversationActivityTightShadowDarkOpacity");
LABEL_7:
      v5 = v4;

      break;
    default:
      v5 = 0.0;
      break;
  }
  return v5;
}

- (double)_radiusForShadowStyle:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;

  switch(a3)
  {
    case 0:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pinnedConversationActivityBroadShadowLightRadius");
      goto LABEL_7;
    case 1:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pinnedConversationActivityBroadShadowDarkRadius");
      goto LABEL_7;
    case 2:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pinnedConversationActivityTightShadowLightRadius");
      goto LABEL_7;
    case 3:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pinnedConversationActivityTightShadowDarkRadius");
LABEL_7:
      v5 = v4;

      break;
    default:
      v5 = 0.0;
      break;
  }
  return v5;
}

- (CGSize)_offsetForShadowStyle:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  switch(a3)
  {
    case 0:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pinnedConversationActivityBroadShadowLightOffset");
      goto LABEL_7;
    case 1:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pinnedConversationActivityBroadShadowDarkOffset");
      goto LABEL_7;
    case 2:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pinnedConversationActivityTightShadowLightOffset");
      goto LABEL_7;
    case 3:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pinnedConversationActivityTightShadowDarkOffset");
LABEL_7:
      v7 = v4;
      v6 = v5;

      break;
    default:
      v6 = 0.0;
      v7 = 0.0;
      break;
  }
  v8 = v7;
  v9 = v6;
  result.height = v9;
  result.width = v8;
  return result;
}

- (int64_t)shadowType
{
  return self->_shadowType;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

@end
