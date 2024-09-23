@implementation HMDCreateUniquePSKClientConfiguration

void __HMDCreateUniquePSKClientConfiguration_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __HMDCreateUniquePSKClientConfiguration_block_invoke_2;
    v5[3] = &unk_1E89B6D70;
    v8 = *(id *)(a1 + 64);
    v6 = *(id *)(a1 + 48);
    v7 = *(id *)(a1 + 56);
    objc_msgSend(v3, "addClientConfiguration:completion:", v4, v5);

  }
}

void __HMDCreateUniquePSKClientConfiguration_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  HMDAccessoryNetworkCredential *v5;
  void *v6;
  HMDAccessoryNetworkCredential *v7;
  id v8;

  v8 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v5 = [HMDAccessoryNetworkCredential alloc];
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMDAccessoryNetworkCredential initWithNetworkRouterUUID:clientIdentifier:wiFiPSK:](v5, "initWithNetworkRouterUUID:clientIdentifier:wiFiPSK:", v6, v8, *(_QWORD *)(a1 + 40));

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

@end
