@implementation HUQuickControlPushButtonViewProfile

- (HUQuickControlPushButtonViewProfile)init
{
  HUQuickControlPushButtonViewProfile *v2;
  HUQuickControlPushButtonViewProfile *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlPushButtonViewProfile;
  v2 = -[HUQuickControlPushButtonViewProfile init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[HUQuickControlPushButtonViewProfile setToggleColorScheme:](v2, "setToggleColorScheme:", 1);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlPushButtonViewProfile;
  v4 = -[HUQuickControlViewProfile copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setToggleColorScheme:", -[HUQuickControlPushButtonViewProfile toggleColorScheme](self, "toggleColorScheme"));
  return v4;
}

- (HFNumberValueConstraints)primaryValueConstraints
{
  return (HFNumberValueConstraints *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D315F8]), "initWithMinValue:maxValue:stepValue:", &unk_1E7041E78, &unk_1E7041E90, &unk_1E7041E90);
}

- (HFNumberValueConstraints)secondaryValueConstraints
{
  return 0;
}

- (BOOL)hasSecondaryValue
{
  return 0;
}

- (BOOL)toggleColorScheme
{
  return self->_toggleColorScheme;
}

- (void)setToggleColorScheme:(BOOL)a3
{
  self->_toggleColorScheme = a3;
}

@end
