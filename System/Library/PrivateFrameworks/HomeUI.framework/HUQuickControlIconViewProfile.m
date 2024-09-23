@implementation HUQuickControlIconViewProfile

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUQuickControlIconViewProfile;
  v4 = -[HUQuickControlViewProfile copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[HUQuickControlIconViewProfile statusString](self, "statusString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStatusString:", v5);

  -[HUQuickControlIconViewProfile statusTextColor](self, "statusTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStatusTextColor:", v6);

  -[HUQuickControlIconViewProfile supplementaryString](self, "supplementaryString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupplementaryString:", v7);

  -[HUQuickControlIconViewProfile iconDescriptor](self, "iconDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconDescriptor:", v8);

  return v4;
}

- (NSString)statusString
{
  return self->_statusString;
}

- (void)setStatusString:(id)a3
{
  objc_storeStrong((id *)&self->_statusString, a3);
}

- (UIColor)statusTextColor
{
  return self->_statusTextColor;
}

- (void)setStatusTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_statusTextColor, a3);
}

- (NSString)supplementaryString
{
  return self->_supplementaryString;
}

- (void)setSupplementaryString:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryString, a3);
}

- (HFIconDescriptor)iconDescriptor
{
  return self->_iconDescriptor;
}

- (void)setIconDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_iconDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconDescriptor, 0);
  objc_storeStrong((id *)&self->_supplementaryString, 0);
  objc_storeStrong((id *)&self->_statusTextColor, 0);
  objc_storeStrong((id *)&self->_statusString, 0);
}

@end
