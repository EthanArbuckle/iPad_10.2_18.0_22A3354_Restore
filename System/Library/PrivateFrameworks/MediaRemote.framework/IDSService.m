@implementation IDSService

void __55__IDSService_MRAdditions__mr_sharedIDSCompanionService__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0D34358]);
  objc_msgSend((id)objc_opt_class(), "mr_companionServiceName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithService:", v3);
  v2 = (void *)mr_sharedIDSCompanionService___service;
  mr_sharedIDSCompanionService___service = v1;

}

void __46__IDSService_MRAdditions__mr_sharedIDSService__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0D34358]);
  objc_msgSend((id)objc_opt_class(), "mr_serviceName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithService:", v3);
  v2 = (void *)mr_sharedIDSService___service;
  mr_sharedIDSService___service = v1;

}

@end
