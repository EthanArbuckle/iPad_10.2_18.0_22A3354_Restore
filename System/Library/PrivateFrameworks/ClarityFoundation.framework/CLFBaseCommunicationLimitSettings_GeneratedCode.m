@implementation CLFBaseCommunicationLimitSettings_GeneratedCode

- (CLFBaseCommunicationLimitSettings_GeneratedCode)init
{
  CLFBaseCommunicationLimitSettings_GeneratedCode *v2;
  CLFBaseCommunicationLimitSettings_GeneratedCode *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLFBaseCommunicationLimitSettings_GeneratedCode;
  v2 = -[CLFBaseSettings init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_incomingCommunicationLimit);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("IncomingCommunicationLimit"), v5);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_needsMigrationFor117558856);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("NeedsMigrationFor117558856"), v7);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_outgoingCommunicationLimit);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("OutgoingCommunicationLimit"), v9);

  }
  return v3;
}

+ (id)allPreferenceSelectorsAsStrings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___CLFBaseCommunicationLimitSettings_GeneratedCode;
  objc_msgSendSuper2(&v9, sel_allPreferenceSelectorsAsStrings);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_incomingCommunicationLimit);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  NSStringFromSelector(sel_needsMigrationFor117558856);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  NSStringFromSelector(sel_outgoingCommunicationLimit);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)incomingCommunicationLimit
{
  return (NSString *)-[AXBaseSettings objectValueForPreferenceKey:ofClass:defaultValue:](self, "objectValueForPreferenceKey:ofClass:defaultValue:", CFSTR("IncomingCommunicationLimit"), objc_opt_class(), CFSTR("contacts"));
}

- (void)setIncomingCommunicationLimit:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("IncomingCommunicationLimit"));
}

- (BOOL)needsMigrationFor117558856
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("NeedsMigrationFor117558856"), 1);
}

- (void)setNeedsMigrationFor117558856:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("NeedsMigrationFor117558856"));

}

- (NSString)outgoingCommunicationLimit
{
  return (NSString *)-[AXBaseSettings objectValueForPreferenceKey:ofClass:defaultValue:](self, "objectValueForPreferenceKey:ofClass:defaultValue:", CFSTR("OutgoingCommunicationLimit"), objc_opt_class(), CFSTR("contacts"));
}

- (void)setOutgoingCommunicationLimit:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("OutgoingCommunicationLimit"));
}

@end
