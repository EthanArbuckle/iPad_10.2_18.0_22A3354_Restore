@implementation BRFileProviderServicesFactory

+ (id)itemServiceSyncProxyForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  BRCXPCBRItemServiceProtocolInterface();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _fetchSynchronousAutomaticErrorProxyFromURL(v3, CFSTR("com.apple.CloudDocs.private.BRItem"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)fetchItemServiceSyncProxyForURL:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  BRCXPCBRItemServiceProtocolInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__BRFileProviderServicesFactory_fetchItemServiceSyncProxyForURL_handler___block_invoke;
  v9[3] = &unk_1E3DA4ED0;
  v10 = v5;
  v8 = v5;
  _fetchServiceAutomaticErrorProxyFromURL(v6, CFSTR("com.apple.CloudDocs.private.BRItem"), v7, 0, v9);

}

uint64_t __73__BRFileProviderServicesFactory_fetchItemServiceSyncProxyForURL_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)clientSideServiceSyncProxyForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  BRCXPCICDFileProviderClientSideCollaborationProtocolInterface();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _fetchSynchronousAutomaticErrorProxyFromURL(v3, CFSTR("com.apple.CloudDocs.private.ClientSideCollaboration"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
