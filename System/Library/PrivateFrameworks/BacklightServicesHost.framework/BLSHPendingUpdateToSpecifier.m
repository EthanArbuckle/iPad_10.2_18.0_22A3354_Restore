@implementation BLSHPendingUpdateToSpecifier

- (BLSHPendingUpdateToSpecifier)initWithSpecifier:(id)a3
{
  id v5;
  BLSHPendingUpdateToSpecifier *v6;
  BLSHPendingUpdateToSpecifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLSHPendingUpdateToSpecifier;
  v6 = -[BLSHPendingUpdateToSpecifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_specifier, a3);

  return v7;
}

- (int64_t)type
{
  return 1;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHPendingUpdateToSpecifier isStarted](self, "isStarted"), CFSTR("started"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHPendingUpdateToSpecifier isCompleted](self, "isCompleted"), CFSTR("completed"));
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_specifier, CFSTR("specifier"));
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BLSHPresentationDateSpecifier)specifier
{
  return (BLSHPresentationDateSpecifier *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifier, 0);
}

@end
