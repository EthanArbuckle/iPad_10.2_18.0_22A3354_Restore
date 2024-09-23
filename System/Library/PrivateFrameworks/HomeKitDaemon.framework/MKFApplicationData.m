@implementation MKFApplicationData

void __68___MKFApplicationData_HMDBackingStoreModelObject__hmd_parentModelID__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "hmd_lastKnownValueForKey:", a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;
}

void __50___MKFApplicationData_hmd_parentAttributeKeyPaths__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];

  v2[6] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("accessory");
  v2[1] = CFSTR("actionSet");
  v2[2] = CFSTR("home");
  v2[3] = CFSTR("room");
  v2[4] = CFSTR("service");
  v2[5] = CFSTR("serviceGroup");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)hmd_parentAttributeKeyPaths__hmf_once_v4;
  hmd_parentAttributeKeyPaths__hmf_once_v4 = v0;

}

void __54___MKFApplicationData_castIfApplicationDataContainer___block_invoke()
{
  HMCConformanceCache *v0;
  void *v1;

  v0 = -[HMCConformanceCache initWithProtocol:]([HMCConformanceCache alloc], "initWithProtocol:", &unk_255772B00);
  v1 = (void *)castIfApplicationDataContainer___hmf_once_v1;
  castIfApplicationDataContainer___hmf_once_v1 = (uint64_t)v0;

}

@end
