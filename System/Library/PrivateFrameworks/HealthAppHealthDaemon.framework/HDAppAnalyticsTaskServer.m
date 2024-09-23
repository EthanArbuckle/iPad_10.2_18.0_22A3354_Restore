@implementation HDAppAnalyticsTaskServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x24BE3F800];
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BDD3310];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256CEF018);
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256CF3CC8);
}

- (void)remote_setAccepted:(BOOL)a3 agreement:(id)a4 version:(int64_t)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, uint64_t, id);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  int64_t v23;
  BOOL v24;
  id v25;

  v10 = a4;
  v11 = (void (**)(id, uint64_t, id))a6;
  -[HDStandardTaskServer profile](self, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDHealthAppPlugin pluginIdentifier](HDHealthAppPlugin, "pluginIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "profileExtensionWithIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[HDStandardTaskServer profile](self, "profile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "database");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE40AB0], "contextForWriting");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __76__HDAppAnalyticsTaskServer_remote_setAccepted_agreement_version_completion___block_invoke;
    v21[3] = &unk_250E7E468;
    v24 = a3;
    v22 = v10;
    v23 = a5;
    v18 = objc_msgSend(v16, "performTransactionWithContext:error:block:inaccessibilityHandler:", v17, &v25, v21, 0);
    v19 = v25;

    v11[2](v11, v18, v19);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:format:", 125, CFSTR("No extension found."));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v20);

  }
}

BOOL __76__HDAppAnalyticsTaskServer_remote_setAccepted_agreement_version_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _BOOL8 v10;

  v4 = *(unsigned __int8 *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = (void *)MEMORY[0x24BDBCE60];
  v8 = a2;
  objc_msgSend(v7, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[HDAppAnalyticsAcceptanceEntity setAcceptance:agreement:version:modificationDate:transaction:error:](HDAppAnalyticsAcceptanceEntity, "setAcceptance:agreement:version:modificationDate:transaction:error:", v4, v5, v6, v9, v8, a3);

  return v10;
}

- (void)remote_setAccepted:(BOOL)a3 currentAgreement:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, id);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;
  BOOL v25;
  id v26;

  v8 = a4;
  v9 = (void (**)(id, uint64_t, id))a5;
  -[HDStandardTaskServer profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDHealthAppPlugin pluginIdentifier](HDHealthAppPlugin, "pluginIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "profileExtensionWithIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "appAnalyticsUpdateManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "currentVersionForAgreement:", v8);

    -[HDStandardTaskServer profile](self, "profile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "database");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE40AB0], "contextForWriting");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __75__HDAppAnalyticsTaskServer_remote_setAccepted_currentAgreement_completion___block_invoke;
    v21[3] = &unk_250E7E490;
    v22 = v12;
    v25 = a3;
    v23 = v8;
    v24 = v14;
    v18 = objc_msgSend(v16, "performTransactionWithContext:error:block:inaccessibilityHandler:", v17, &v26, v21, 0);
    v19 = v26;

    v9[2](v9, v18, v19);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:format:", 125, CFSTR("No extension found."));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v20);

  }
}

uint64_t __75__HDAppAnalyticsTaskServer_remote_setAccepted_currentAgreement_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "appAnalyticsUpdateManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(unsigned __int8 *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "setAccepted:agreement:version:modificationDate:transaction:error:", v8, v10, v9, v11, v6, a3);

  return v12;
}

@end
