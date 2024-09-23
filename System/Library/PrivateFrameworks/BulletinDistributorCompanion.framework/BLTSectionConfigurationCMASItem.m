@implementation BLTSectionConfigurationCMASItem

- (unint64_t)coordinationType
{
  unint64_t v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BLTSectionConfigurationCMASItem;
  v2 = -[BLTSectionConfigurationItem coordinationType](&v10, sel_coordinationType);
  if (v2 == 2)
  {
    objc_msgSend(MEMORY[0x24BE6B4E0], "blt_boundedWaitForActivePairedDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("4AA3FF3B-3224-42E6-995E-481F49AE9260"));
    v5 = objc_msgSend(v3, "supportsCapability:", v4);

    if (v5)
    {
      +[BLTBulletinDistributor sharedDistributor](BLTBulletinDistributor, "sharedDistributor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "gizmoConnection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "lastKnownConnectionStatus");

      if ((unint64_t)(v8 - 1) < 2)
        v2 = 1;
      else
        v2 = 2;
    }
    else
    {
      v2 = 2;
    }

  }
  return v2;
}

- (BOOL)hasDisplayedCriticalBulletins
{
  return 1;
}

@end
