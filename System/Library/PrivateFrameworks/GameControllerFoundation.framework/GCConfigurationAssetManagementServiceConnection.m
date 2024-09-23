@implementation GCConfigurationAssetManagementServiceConnection

+ (id)serviceProtocol
{
  return &unk_1F03A3B48;
}

- (id)assets
{
  return -[GCConfigXPCServiceServiceConnection serviceVendorRequestWithLabel:handler:](self, "serviceVendorRequestWithLabel:handler:", CFSTR("Assets"), &__block_literal_global_139);
}

void __57__GCConfigurationAssetManagementServiceConnection_assets__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__GCConfigurationAssetManagementServiceConnection_assets__block_invoke_2;
  v6[3] = &unk_1EA4D3B38;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a2, "assetsWithReply:", v6);

}

uint64_t __57__GCConfigurationAssetManagementServiceConnection_assets__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)currentAsset:(BOOL)a3
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__GCConfigurationAssetManagementServiceConnection_currentAsset___block_invoke;
  v4[3] = &__block_descriptor_33_e81_v24__0___GCConfigurationAssetManagementServiceXPCInterface__8___v_____NSError__16l;
  v5 = a3;
  -[GCConfigXPCServiceServiceConnection serviceVendorRequestWithLabel:handler:](self, "serviceVendorRequestWithLabel:handler:", CFSTR("Current Asset"), v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __64__GCConfigurationAssetManagementServiceConnection_currentAsset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v6 = *(unsigned __int8 *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__GCConfigurationAssetManagementServiceConnection_currentAsset___block_invoke_2;
  v8[3] = &unk_1EA4D3B60;
  v9 = v5;
  v7 = v5;
  objc_msgSend(a2, "currentAsset:withReply:", v6, v8);

}

uint64_t __64__GCConfigurationAssetManagementServiceConnection_currentAsset___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)lastUpdateDate
{
  return -[GCConfigXPCServiceServiceConnection serviceVendorRequestWithLabel:handler:](self, "serviceVendorRequestWithLabel:handler:", CFSTR("Last Update Date"), &__block_literal_global_147);
}

void __65__GCConfigurationAssetManagementServiceConnection_lastUpdateDate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__GCConfigurationAssetManagementServiceConnection_lastUpdateDate__block_invoke_2;
  v6[3] = &unk_1EA4D3BC8;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a2, "lastUpdateDateWithReply:", v6);

}

uint64_t __65__GCConfigurationAssetManagementServiceConnection_lastUpdateDate__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)checkForNewAssets:(BOOL)a3 forceCatalogRefresh:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  const char *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[GCConfigXPCServiceServiceConnection serviceVendor](self, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "checkForNewAssets:forceCatalogRefresh:reply:", v6, v5, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
