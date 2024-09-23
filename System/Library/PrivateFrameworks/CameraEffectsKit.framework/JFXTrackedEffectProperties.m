@implementation JFXTrackedEffectProperties

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (JFXTrackedEffectProperties)init
{
  JFXTrackedEffectProperties *v2;
  JFXTrackedEffectProperties *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)JFXTrackedEffectProperties;
  v2 = -[JFXTrackedEffectProperties init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[JFXTrackedEffectProperties setTrackingType:](v2, "setTrackingType:", 0);
    -[JFXTrackedEffectProperties setDisableTracking:](v3, "setDisableTracking:", 0);
    -[JFXTrackedEffectProperties setInternalTrackingType:](v3, "setInternalTrackingType:", -[JFXTrackedEffectProperties currentTrackingType](v3, "currentTrackingType"));
  }
  return v3;
}

- (JFXTrackedEffectProperties)initWithCoder:(id)a3
{
  id v4;
  JFXTrackedEffectProperties *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)JFXTrackedEffectProperties;
  v5 = -[JFXTrackedEffectProperties init](&v7, sel_init);
  if (v5)
  {
    -[JFXTrackedEffectProperties setTrackingType:](v5, "setTrackingType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kJFXTrackedEffectProperties_typeKey")));
    -[JFXTrackedEffectProperties setDisableTracking:](v5, "setDisableTracking:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kJFXTrackedEffectProperties_disableKey")));
    -[JFXTrackedEffectProperties setInternalTrackingType:](v5, "setInternalTrackingType:", -[JFXTrackedEffectProperties currentTrackingType](v5, "currentTrackingType"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setTrackingType:", -[JFXTrackedEffectProperties trackingType](self, "trackingType"));
  objc_msgSend(v4, "setDisableTracking:", -[JFXTrackedEffectProperties isTrackingDisabled](self, "isTrackingDisabled"));
  objc_msgSend(v4, "setInternalTrackingType:", -[JFXTrackedEffectProperties internalTrackingType](self, "internalTrackingType"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[JFXTrackedEffectProperties trackingType](self, "trackingType"), CFSTR("kJFXTrackedEffectProperties_typeKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[JFXTrackedEffectProperties isTrackingDisabled](self, "isTrackingDisabled"), CFSTR("kJFXTrackedEffectProperties_disableKey"));

}

- (void)setTrackingType:(int64_t)a3
{
  id v5;

  if (-[JFXTrackedEffectProperties internalTrackingType](self, "internalTrackingType") != a3)
  {
    -[JFXTrackedEffectProperties setInternalTrackingType:](self, "setInternalTrackingType:", a3);
    -[JFXTrackedEffectProperties delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trackedEffectProperties:didChangeTrackingType:didChangeEnabled:", self, 1, 0);

  }
}

- (int64_t)currentTrackingType
{
  if (-[JFXTrackedEffectProperties isTrackingDisabled](self, "isTrackingDisabled"))
    return 0;
  else
    return -[JFXTrackedEffectProperties internalTrackingType](self, "internalTrackingType");
}

- (void)enableTrackingState:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  if (-[JFXTrackedEffectProperties isTrackingDisabled](self, "isTrackingDisabled") == a3)
  {
    -[JFXTrackedEffectProperties setDisableTracking:](self, "setDisableTracking:", !v3);
    -[JFXTrackedEffectProperties delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trackedEffectProperties:didChangeTrackingType:didChangeEnabled:", self, 0, 1);

  }
}

- (BOOL)isTrackingDisabled
{
  return self->_disableTracking;
}

- (void)setDisableTracking:(BOOL)a3
{
  self->_disableTracking = a3;
}

- (JFXTrackedEffectPropertiesDelegate)delegate
{
  return (JFXTrackedEffectPropertiesDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)internalTrackingType
{
  return self->_internalTrackingType;
}

- (void)setInternalTrackingType:(int64_t)a3
{
  self->_internalTrackingType = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
