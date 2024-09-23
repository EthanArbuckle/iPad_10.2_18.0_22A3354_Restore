@implementation HMDResidentDeviceManagerUpdatePrimaryResidentUUID

uint64_t ____HMDResidentDeviceManagerUpdatePrimaryResidentUUID_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t ____HMDResidentDeviceManagerUpdatePrimaryResidentUUID_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t ____HMDResidentDeviceManagerUpdatePrimaryResidentUUID_block_invoke_458(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "run");
}

@end
