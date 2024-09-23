@implementation HDRespiratoryDaemonPlugin

- (id)extensionForProfile:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "profileType") == 1)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE808E8]), "initWithProfile:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)taskServerClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)pluginIdentifier
{
  return (NSString *)(id)*MEMORY[0x24BE808A8];
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
  v4[0] = *MEMORY[0x24BDD36F0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_deleteDomainsNamed:", v3);

}

@end
