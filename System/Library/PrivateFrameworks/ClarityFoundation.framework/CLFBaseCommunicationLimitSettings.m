@implementation CLFBaseCommunicationLimitSettings

- (void)setIncomingCommunicationLimit:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLFBaseCommunicationLimitSettings;
  -[CLFBaseCommunicationLimitSettings_GeneratedCode setIncomingCommunicationLimit:](&v9, sel_setIncomingCommunicationLimit_, v4);
  if (-[CLFBaseCommunicationLimitSettings requiresMoreRestrictiveOutgoingCommunicationLimit](self, "requiresMoreRestrictiveOutgoingCommunicationLimit"))
  {
    -[CLFBaseCommunicationLimitSettings outgoingCommunicationLimit](self, "outgoingCommunicationLimit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isLessRestrictiveThanCommunicationLimit:", v4);

    if (v6)
    {
      +[CLFLog commonLog](CLFLog, "commonLog");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        -[CLFBaseCommunicationLimitSettings outgoingCommunicationLimit](self, "outgoingCommunicationLimit");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v11 = v8;
        v12 = 2112;
        v13 = v4;
        _os_log_impl(&dword_20D4E9000, v7, OS_LOG_TYPE_DEFAULT, "Updating outgoing communication limit \"%@\" to be at least as restrictive as incoming communication limit \"%@\".", buf, 0x16u);

      }
      -[CLFBaseCommunicationLimitSettings setOutgoingCommunicationLimit:](self, "setOutgoingCommunicationLimit:", v4);
    }
  }

}

- (id)outgoingCommunicationLimit
{
  objc_super v4;

  -[CLFBaseCommunicationLimitSettings migrateCommunicationLimitsIfNecessary](self, "migrateCommunicationLimitsIfNecessary");
  v4.receiver = self;
  v4.super_class = (Class)CLFBaseCommunicationLimitSettings;
  -[CLFBaseCommunicationLimitSettings_GeneratedCode outgoingCommunicationLimit](&v4, sel_outgoingCommunicationLimit);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setOutgoingCommunicationLimit:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  objc_super v8;

  v4 = a3;
  if (-[CLFBaseCommunicationLimitSettings requiresMoreRestrictiveOutgoingCommunicationLimit](self, "requiresMoreRestrictiveOutgoingCommunicationLimit")&& (-[CLFBaseCommunicationLimitSettings_GeneratedCode incomingCommunicationLimit](self, "incomingCommunicationLimit"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v4, "isLessRestrictiveThanCommunicationLimit:", v5), v5, v6))
  {
    +[CLFLog commonLog](CLFLog, "commonLog");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[CLFBaseCommunicationLimitSettings(Additions) setOutgoingCommunicationLimit:].cold.1((uint64_t)v4, self, v7);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CLFBaseCommunicationLimitSettings;
    -[CLFBaseCommunicationLimitSettings_GeneratedCode setOutgoingCommunicationLimit:](&v8, sel_setOutgoingCommunicationLimit_, v4);
  }

}

- (NSString)legacyIncomingCommunicationLimit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLFBaseCommunicationLimitSettings;
  -[CLFBaseCommunicationLimitSettings_GeneratedCode incomingCommunicationLimit](&v3, sel_incomingCommunicationLimit);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLegacyIncomingCommunicationLimit:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLFBaseCommunicationLimitSettings;
  -[CLFBaseCommunicationLimitSettings_GeneratedCode setIncomingCommunicationLimit:](&v3, sel_setIncomingCommunicationLimit_, a3);
}

- (void)migrateCommunicationLimitsIfNecessary
{
  id v3;

  if (-[CLFBaseCommunicationLimitSettings_GeneratedCode needsMigrationFor117558856](self, "needsMigrationFor117558856"))
  {
    -[CLFBaseCommunicationLimitSettings legacyOutgoingCommunicationLimit](self, "legacyOutgoingCommunicationLimit");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[CLFBaseCommunicationLimitSettings setOutgoingCommunicationLimit:](self, "setOutgoingCommunicationLimit:", v3);
    -[CLFBaseCommunicationLimitSettings_GeneratedCode setNeedsMigrationFor117558856:](self, "setNeedsMigrationFor117558856:", 0);

  }
}

- (BOOL)requiresMoreRestrictiveOutgoingCommunicationLimit
{
  objc_opt_class();
  OUTLINED_FUNCTION_0_0();
  return 1;
}

- (NSString)legacyOutgoingCommunicationLimit
{
  objc_opt_class();
  OUTLINED_FUNCTION_0_0();
  return (NSString *)CFSTR("selectedContacts");
}

@end
