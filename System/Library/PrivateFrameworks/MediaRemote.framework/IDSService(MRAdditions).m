@implementation IDSService(MRAdditions)

+ (id)mr_sharedIDSCompanionService
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__IDSService_MRAdditions__mr_sharedIDSCompanionService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mr_sharedIDSCompanionService_onceToken != -1)
    dispatch_once(&mr_sharedIDSCompanionService_onceToken, block);
  return (id)mr_sharedIDSCompanionService___service;
}

+ (const)mr_companionServiceName
{
  return CFSTR("com.apple.private.alloy.mediaremote.v2");
}

+ (id)mr_sharedIDSService
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__IDSService_MRAdditions__mr_sharedIDSService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mr_sharedIDSService_onceToken != -1)
    dispatch_once(&mr_sharedIDSService_onceToken, block);
  return (id)mr_sharedIDSService___service;
}

+ (const)mr_serviceName
{
  return CFSTR("com.apple.private.alloy.avconference.avctester");
}

@end
