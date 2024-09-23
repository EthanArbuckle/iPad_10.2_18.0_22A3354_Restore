@implementation MSPSenderVirtualLiveStrategy

- (MSPSenderVirtualLiveStrategy)initWithGroupSession:(id)a3
{
  id v4;
  void *v5;
  int v6;
  MSPSenderVirtualLiveStrategy *v7;
  MSPSenderVirtualLiveStrategy *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInternalInstall");

  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)MSPSenderVirtualLiveStrategy;
    v7 = -[MSPSenderLiveStrategy initWithGroupSession:](&v10, sel_initWithGroupSession_, v4);
    if (v7)
      v7->super.super.super._loggingOnly = 1;
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)fetchCapabilitiesForParticipants:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        MSPSharedTripVirtualReceiverHandleGetReceiverCapabilities(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v13, (_QWORD)v16);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v15 = (void *)objc_msgSend(v7, "copy");
  v6[2](v6, v15);

}

@end
