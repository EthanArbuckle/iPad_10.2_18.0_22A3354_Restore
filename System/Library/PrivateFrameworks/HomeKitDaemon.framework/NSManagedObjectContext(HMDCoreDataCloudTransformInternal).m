@implementation NSManagedObjectContext(HMDCoreDataCloudTransformInternal)

- (id)hmd_cloudPrivateStoreIdentifier
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("ctui_cpsi"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)setHmd_cloudPrivateStoreIdentifier:()HMDCoreDataCloudTransformInternal
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("ctui_cpsi"));

}

- (id)hmd_cloudSharedStoreIdentifier
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("ctui_cssi"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)setHmd_cloudSharedStoreIdentifier:()HMDCoreDataCloudTransformInternal
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("ctui_cssi"));

}

- (id)hmd_workingStoreIdentifier
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("ctui_wsi"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)setHmd_workingStoreIdentifier:()HMDCoreDataCloudTransformInternal
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("ctui_wsi"));

}

- (id)hmd_homeManagerContext
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("ctui_hmc"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)setHmd_homeManagerContext:()HMDCoreDataCloudTransformInternal
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("ctui_hmc"));

}

- (uint64_t)hmd_fakeRecordsEnabled
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("ctui_fre"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "BOOLValue");
  return v5;
}

- (void)setHmd_fakeRecordsEnabled:()HMDCoreDataCloudTransformInternal
{
  uint64_t v3;
  id v4;

  if (a3)
    v3 = MEMORY[0x24BDBD1C8];
  else
    v3 = MEMORY[0x24BDBD1C0];
  objc_msgSend(a1, "userInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("ctui_fre"));

}

- (uint64_t)hmd_homeManagerApplicationDataChanged
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("ctui_hmadc"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "BOOLValue");
  return v5;
}

- (void)setHmd_currentChangeSet:()HMDCoreDataCloudTransformInternal
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("ctui_ccs"));

}

- (id)hmd_currentChangeSet
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("ctui_ccs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)setHmd_homeManagerApplicationDataChanged:()HMDCoreDataCloudTransformInternal
{
  uint64_t v3;
  id v4;

  if (a3)
    v3 = MEMORY[0x24BDBD1C8];
  else
    v3 = MEMORY[0x24BDBD1C0];
  objc_msgSend(a1, "userInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("ctui_hmadc"));

}

@end
