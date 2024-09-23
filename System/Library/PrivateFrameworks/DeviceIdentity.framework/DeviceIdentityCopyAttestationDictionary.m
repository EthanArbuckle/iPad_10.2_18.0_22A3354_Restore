@implementation DeviceIdentityCopyAttestationDictionary

void __DeviceIdentityCopyAttestationDictionary_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  createMobileActivationError((uint64_t)"DeviceIdentityCopyAttestationDictionary_block_invoke", 530, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a2, CFSTR("IPC Error."), a7, a8, v12);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

void __DeviceIdentityCopyAttestationDictionary_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("RKCertification"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isNSDictionary(v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

@end
