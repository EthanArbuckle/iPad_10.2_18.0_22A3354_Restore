@implementation NRDeviceDiscoveryController

- (NRDeviceDiscoveryController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NRDeviceDiscoveryController;
  return -[NRDeviceDiscoveryController init](&v3, sel_init);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__NRDeviceDiscoveryController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECE23838 != -1)
    dispatch_once(&qword_1ECE23838, block);
  return (id)qword_1ECE23830;
}

void __45__NRDeviceDiscoveryController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECE23830;
  qword_1ECE23830 = (uint64_t)v1;

}

- (void)overrideSignalStrengthLimit:(int64_t)a3
{
  id v4;

  +[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overrideSignalStrengthLimit:", a3);

}

- (void)begin
{
  id v2;

  +[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginDiscovery");

}

- (void)end
{
  id v2;

  +[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endDiscovery");

}

- (NSArray)devices
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getAllDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "valueForProperty:", CFSTR("isPaired"), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "valueForProperty:", CFSTR("isActive"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "BOOLValue") & 1) == 0 && (objc_msgSend(v12, "BOOLValue") & 1) == 0)
          objc_msgSend(v2, "insertObject:atIndex:", v10, objc_msgSend(v2, "indexOfObject:inSortedRange:options:usingComparator:", v10, 0, objc_msgSend(v2, "count"), 1024, &__block_literal_global_464));

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return (NSArray *)v2;
}

uint64_t __38__NRDeviceDiscoveryController_devices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  objc_msgSend(a2, "valueForProperty:", CFSTR("_RSSI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForProperty:", CFSTR("_RSSI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = -1;
  else
    v7 = v6 != 0;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8)
    v7 = objc_msgSend(v6, "compare:", v5);

  return v7;
}

@end
