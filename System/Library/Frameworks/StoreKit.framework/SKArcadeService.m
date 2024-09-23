@implementation SKArcadeService

+ (void)registerArcadeAppWithRandomFromLib:(NSData *)randomFromLib randomFromLibLength:(uint32_t)randomFromLibLength resultHandler:(void *)resultHandler
{
  uint64_t v5;
  void *v7;
  NSData *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = *(_QWORD *)&randomFromLibLength;
  v7 = resultHandler;
  v8 = randomFromLib;
  +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__SKArcadeService_registerArcadeAppWithRandomFromLib_randomFromLibLength_resultHandler___block_invoke;
  v12[3] = &unk_1E5B26C08;
  v13 = v7;
  v10 = v7;
  objc_msgSend(v9, "storeKitServiceWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "registerArcadeAppWithRandomFromLib:randomFromLibLength:resultHandler:", v8, v5, v10);
}

uint64_t __88__SKArcadeService_registerArcadeAppWithRandomFromLib_randomFromLibLength_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)arcadeSubscriptionStatusWithNonce:(uint64_t)nonce resultHandler:(void *)resultHandler
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = resultHandler;
  +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__SKArcadeService_arcadeSubscriptionStatusWithNonce_resultHandler___block_invoke;
  v9[3] = &unk_1E5B26C08;
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "storeKitServiceWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "arcadeSubscriptionStatusWithNonce:resultHandler:", nonce, v7);
}

uint64_t __67__SKArcadeService_arcadeSubscriptionStatusWithNonce_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)repairArcadeApp
{
  void *v2;
  id v3;

  +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeKitServiceWithErrorHandler:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "repairArcadeApp");
}

@end
