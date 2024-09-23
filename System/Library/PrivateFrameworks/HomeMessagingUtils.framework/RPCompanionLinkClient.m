@implementation RPCompanionLinkClient

uint64_t __56__RPCompanionLinkClient_HMU_HomeKit__hmu_devicesInHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(v3, "homeKitIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (objc_msgSend(*(id *)(a1 + 32), "accessoryWithUniqueIdentifier:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "homeKitUserIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __56__RPCompanionLinkClient_HMU_HomeKit__hmu_devicesInHome___block_invoke_2;
    v9[3] = &unk_24D2198E0;
    v10 = *(id *)(a1 + 32);
    v6 = objc_msgSend(v7, "na_any:", v9);

  }
  return v6;
}

BOOL __56__RPCompanionLinkClient_HMU_HomeKit__hmu_devicesInHome___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "hmu_userWithUniqueIdentifier:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __57__RPCompanionLinkClient_HMU_HomeKit__hmu_devicesForUser___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "homeKitUserIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

@end
