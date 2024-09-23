@implementation HDMentalHealthPlugin

- (HDMentalHealthPlugin)init
{
  return -[HDMentalHealthPlugin initWithTypicalDayProvider:](self, "initWithTypicalDayProvider:", 0);
}

- (HDMentalHealthPlugin)initWithTypicalDayProvider:(id)a3
{
  id v5;
  HDMentalHealthPlugin *v6;
  HDMentalHealthPlugin *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDMentalHealthPlugin;
  v6 = -[HDMentalHealthPlugin init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_typicalDayProvider, a3);

  return v7;
}

- (NSString)pluginIdentifier
{
  return (NSString *)(id)*MEMORY[0x24BE65D60];
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
  HDMHProfileExtension *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[HDMHProfileExtension initWithProfile:typicalDayProvider:]([HDMHProfileExtension alloc], "initWithProfile:typicalDayProvider:", v4, self->_typicalDayProvider);
  else
    v5 = 0;

  return v5;
}

- (id)extensionForHealthDaemon:(id)a3
{
  return 0;
}

- (id)demoDataGeneratorClasses
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)taskServerClasses
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typicalDayProvider, 0);
}

@end
