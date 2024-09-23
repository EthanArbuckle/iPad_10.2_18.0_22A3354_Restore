@implementation HSPCRoomProviderFactory

+ (id)providerForCoordinator:(id)a3 config:(id)a4
{
  id v5;
  id v6;
  unsigned int v7;
  __objc2_class **v8;
  id v9;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v5, "isSetupInitiatedByOtherMatterEcosystem");
  v8 = off_1000A0608;
  if (!v7)
    v8 = off_1000A0618;
  v9 = objc_msgSend(objc_alloc(*v8), "initWithCoordinator:configuration:", v6, v5);

  return v9;
}

@end
