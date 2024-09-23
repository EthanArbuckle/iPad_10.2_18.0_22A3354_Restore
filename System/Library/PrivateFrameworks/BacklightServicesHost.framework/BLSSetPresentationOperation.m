@implementation BLSSetPresentationOperation

- (BLSSetPresentationOperation)initWithBacklightState:(int64_t)a3 additions:(id)a4
{
  id v7;
  BLSSetPresentationOperation *v8;
  BLSSetPresentationOperation *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BLSSetPresentationOperation;
  v8 = -[BLSHEnvironmentOperation initWithBacklightState:](&v11, sel_initWithBacklightState_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_additions, a4);

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHEnvironmentOperation backlightState](self, "backlightState");
  NSStringFromBLSBacklightState();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("backlightState"));

  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_additions, CFSTR("additions"));
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)additions
{
  return self->_additions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additions, 0);
}

@end
