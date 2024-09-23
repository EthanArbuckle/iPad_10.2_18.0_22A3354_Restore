@implementation ATXScorableTimeDNDModeWrapper

- (ATXScorableTimeDNDModeWrapper)initWithDNDMode:(id)a3
{
  id v5;
  ATXScorableTimeDNDModeWrapper *v6;
  ATXScorableTimeDNDModeWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXScorableTimeDNDModeWrapper;
  v6 = -[ATXScorableTimeDNDModeWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dndMode, a3);

  return v7;
}

- (NSString)scorableTimeIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[ATXScorableTimeDNDModeWrapper dndMode](self, "dndMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("dndModeUUID__%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (DNDMode)dndMode
{
  return self->_dndMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dndMode, 0);
}

@end
