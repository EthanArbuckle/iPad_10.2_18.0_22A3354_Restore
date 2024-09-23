@implementation HDMenstrualCyclesPlugin

- (HDMenstrualCyclesPlugin)init
{
  void *v3;
  HDMenstrualCyclesPlugin *v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "hkmc_menstrualCyclesDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HDMenstrualCyclesPlugin initWithLocalUserDefaults:](self, "initWithLocalUserDefaults:", v3);

  return v4;
}

- (HDMenstrualCyclesPlugin)initWithLocalUserDefaults:(id)a3
{
  id v5;
  HDMenstrualCyclesPlugin *v6;
  HDMenstrualCyclesPlugin *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDMenstrualCyclesPlugin;
  v6 = -[HDMenstrualCyclesPlugin init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_userDefaults, a3);

  return v7;
}

- (NSString)pluginIdentifier
{
  return (NSString *)(id)*MEMORY[0x24BE46AC8];
}

+ (BOOL)shouldLoadPluginForDaemon:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRealityDevice");

  return v4 ^ 1;
}

- (id)extensionForProfile:(id)a3
{
  id v4;
  HDMCProfileExtension *v5;
  void *v6;
  HDMCProfileExtension *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = [HDMCProfileExtension alloc];
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE46C08]), "initWithUserDefaults:", self->_userDefaults);
    v7 = -[HDMCProfileExtension initWithProfile:settingsManager:](v5, "initWithProfile:settingsManager:", v4, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)extensionForHealthDaemon:(id)a3
{
  return 0;
}

- (void)handleDatabaseObliteration
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF50];
  v4[0] = *MEMORY[0x24BE469D0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_deleteDomainsNamed:", v3);

}

- (id)taskServerClasses
{
  _QWORD v3[8];

  v3[7] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)stateSyncEntityClasses
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "features");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "seahorse");

  if (v4)
  {
    v7[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
