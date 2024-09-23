@implementation HMBCloudZoneConfiguration

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBCloudZoneConfiguration shouldRebuildOnManateeKeyLoss](self, "shouldRebuildOnManateeKeyLoss");
  HMFBooleanToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Rebuild On Manatee Key Loss"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBCloudZoneConfiguration shouldSkipCloudPulls](self, "shouldSkipCloudPulls");
  HMFBooleanToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Skip Cloud Pulls"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  int v8;
  _BOOL4 v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v7 = -[HMBCloudZoneConfiguration shouldRebuildOnManateeKeyLoss](self, "shouldRebuildOnManateeKeyLoss"),
        v7 == objc_msgSend(v6, "shouldRebuildOnManateeKeyLoss")))
  {
    v9 = -[HMBCloudZoneConfiguration shouldSkipCloudPulls](self, "shouldSkipCloudPulls");
    v8 = v9 ^ objc_msgSend(v6, "shouldSkipCloudPulls") ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  _BOOL4 v3;

  v3 = -[HMBCloudZoneConfiguration shouldRebuildOnManateeKeyLoss](self, "shouldRebuildOnManateeKeyLoss");
  return v3 ^ -[HMBCloudZoneConfiguration shouldSkipCloudPulls](self, "shouldSkipCloudPulls");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMBMutableCloudZoneConfiguration *v4;

  v4 = -[HMBMutableCloudZoneConfiguration init](+[HMBMutableCloudZoneConfiguration allocWithZone:](HMBMutableCloudZoneConfiguration, "allocWithZone:", a3), "init");
  -[HMBCloudZoneConfiguration setShouldRebuildOnManateeKeyLoss:](v4, "setShouldRebuildOnManateeKeyLoss:", -[HMBCloudZoneConfiguration shouldRebuildOnManateeKeyLoss](self, "shouldRebuildOnManateeKeyLoss"));
  -[HMBCloudZoneConfiguration setShouldSkipCloudPulls:](v4, "setShouldSkipCloudPulls:", -[HMBCloudZoneConfiguration shouldSkipCloudPulls](self, "shouldSkipCloudPulls"));
  return v4;
}

- (BOOL)shouldRebuildOnManateeKeyLoss
{
  return self->_shouldRebuildOnManateeKeyLoss;
}

- (void)setShouldRebuildOnManateeKeyLoss:(BOOL)a3
{
  self->_shouldRebuildOnManateeKeyLoss = a3;
}

- (BOOL)shouldSkipCloudPulls
{
  return self->_shouldSkipCloudPulls;
}

- (void)setShouldSkipCloudPulls:(BOOL)a3
{
  self->_shouldSkipCloudPulls = a3;
}

@end
