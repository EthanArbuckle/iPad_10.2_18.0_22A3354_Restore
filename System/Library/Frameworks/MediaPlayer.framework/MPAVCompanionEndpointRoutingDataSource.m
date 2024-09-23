@implementation MPAVCompanionEndpointRoutingDataSource

- (id)discoverySessionConfiguration
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4C508]), "initWithEndpointFeatures:", 16);
  objc_msgSend(v3, "setTargetAudioSessionID:", -[MPAVEndpointRoutingDataSource targetSessionID](self, "targetSessionID"));
  return v3;
}

- (id)getRoutesForCategory:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18.receiver = self;
  v18.super_class = (Class)MPAVCompanionEndpointRoutingDataSource;
  -[MPAVEndpointRoutingDataSource getRoutesForCategory:](&v18, sel_getRoutesForCategory_, v4);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "isPhoneRoute", (_QWORD)v14))
        {
          objc_msgSend(v5, "addObject:", v11);
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

@end
