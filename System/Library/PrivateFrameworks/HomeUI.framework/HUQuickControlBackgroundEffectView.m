@implementation HUQuickControlBackgroundEffectView

- (HUQuickControlBackgroundEffectView)initWithEffectType:(unint64_t)a3
{
  HUQuickControlBackgroundEffectView *v4;
  HUQuickControlBackgroundEffectView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUQuickControlBackgroundEffectView;
  v4 = -[HUQuickControlBackgroundEffectView init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_effectType = a3;
    -[HUQuickControlBackgroundEffectView _configureForCurrentEffectType](v4, "_configureForCurrentEffectType");
  }
  return v5;
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlBackgroundEffectView;
  -[HUQuickControlBackgroundEffectView tintColorDidChange](&v4, sel_tintColorDidChange);
  -[HUQuickControlBackgroundEffectView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlBackgroundEffectView setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (void)_configureForCurrentEffectType
{
  void *v3;
  void *v4;
  id v5;

  +[HUQuickControlVisualEffect effectWithType:](HUQuickControlVisualEffect, "effectWithType:", -[HUQuickControlBackgroundEffectView effectType](self, "effectType"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configureLayerView:", self);

}

- (unint64_t)effectType
{
  return self->_effectType;
}

@end
