@implementation MSDKPeerDemoIPDStatus

- (MSDKPeerDemoIPDStatus)initWithTargetIPD:(double)a3 currentIPD:(double)a4 clipOnState:(unint64_t)a5
{
  MSDKPeerDemoIPDStatus *v8;
  MSDKPeerDemoIPDStatus *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MSDKPeerDemoIPDStatus;
  v8 = -[MSDKPeerDemoIPDStatus init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[MSDKPeerDemoIPDStatus setTargetIPD:](v8, "setTargetIPD:", a3);
    -[MSDKPeerDemoIPDStatus setCurrentIPD:](v9, "setCurrentIPD:", a4);
    -[MSDKPeerDemoIPDStatus setClipOnState:](v9, "setClipOnState:", a5);
  }
  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKPeerDemoIPDStatus targetIPD](self, "targetIPD");
  v7 = v6;
  -[MSDKPeerDemoIPDStatus currentIPD](self, "currentIPD");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@[%p]: TaregtIPD=%f CurrentIPD=%f ClipOnState=%lu>"), v5, self, v7, v8, -[MSDKPeerDemoIPDStatus clipOnState](self, "clipOnState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSDKPeerDemoIPDStatus)initWithCoder:(id)a3
{
  id v4;
  MSDKPeerDemoIPDStatus *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSDKPeerDemoIPDStatus;
  v5 = -[MSDKPeerDemoIPDStatus init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TargetIPD"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    -[MSDKPeerDemoIPDStatus setTargetIPD:](v5, "setTargetIPD:");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CurrentIPD"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    -[MSDKPeerDemoIPDStatus setCurrentIPD:](v5, "setCurrentIPD:");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ClipOnState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    -[MSDKPeerDemoIPDStatus setClipOnState:](v5, "setClipOnState:", (unint64_t)v9);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  -[MSDKPeerDemoIPDStatus targetIPD](self, "targetIPD");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("TargetIPD"));

  v7 = (void *)MEMORY[0x24BDD16E0];
  -[MSDKPeerDemoIPDStatus currentIPD](self, "currentIPD");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("CurrentIPD"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[MSDKPeerDemoIPDStatus clipOnState](self, "clipOnState"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("ClipOnState"));

}

- (double)targetIPD
{
  return self->_targetIPD;
}

- (void)setTargetIPD:(double)a3
{
  self->_targetIPD = a3;
}

- (double)currentIPD
{
  return self->_currentIPD;
}

- (void)setCurrentIPD:(double)a3
{
  self->_currentIPD = a3;
}

- (unint64_t)clipOnState
{
  return self->_clipOnState;
}

- (void)setClipOnState:(unint64_t)a3
{
  self->_clipOnState = a3;
}

@end
