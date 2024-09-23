@implementation HDMobilityPlugin

- (NSString)pluginIdentifier
{
  return (NSString *)(id)*MEMORY[0x24BE46D58];
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

- (id)extensionForHealthDaemon:(id)a3
{
  return 0;
}

- (id)extensionForProfile:(id)a3
{
  id v3;
  HDMobilityProfileExtension *v4;

  v3 = a3;
  if (objc_msgSend(v3, "profileType") == 1)
    v4 = -[HDMobilityProfileExtension initWithProfile:]([HDMobilityProfileExtension alloc], "initWithProfile:", v3);
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

@end
