@implementation MPRadioLibrary

- (MPRadioLibrary)init
{
  MPRadioLibrary *v2;
  MPRadioController *v3;
  MPRadioController *radioController;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPRadioLibrary;
  v2 = -[MPRadioLibrary init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MPRadioController);
    radioController = v2->_radioController;
    v2->_radioController = v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__radioAvailabilityDidChangeNotification_, CFSTR("MPRadioControllerRadioAvailabilityDidChangeNotification"), v2->_radioController);
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__radioRecentStationsDidChangeNotification_, CFSTR("MPRadioControllerRecentStationsDidChangeNotification"), v2->_radioController);
    -[MPRadioLibrary _radioModel](v2, "_radioModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__radioModelDidChangeNotification_, CFSTR("RadioModelDidChangeNotification"), v6);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MPRadioControllerRadioAvailabilityDidChangeNotification"), self->_radioController);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MPRadioControllerRecentStationsDidChangeNotification"), self->_radioController);
  -[MPRadioLibrary _radioModel](self, "_radioModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("RadioModelDidChangeNotification"), v4);

  v5.receiver = self;
  v5.super_class = (Class)MPRadioLibrary;
  -[MPRadioLibrary dealloc](&v5, sel_dealloc);
}

- (void)getRecentStationGroupsWithCompletionHandler:(id)a3
{
  -[MPRadioController getRecentStationGroupsWithCompletionHandler:](self->_radioController, "getRecentStationGroupsWithCompletionHandler:", a3);
}

- (BOOL)isEnabled
{
  return -[MPRadioController isRadioAvailable](self->_radioController, "isRadioAvailable");
}

- (unint64_t)stationCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[MPRadioLibrary _radioModel](self, "_radioModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userStations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (NSArray)stations
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  MPRadioStation *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  MPRadioStation *v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[MPRadioLibrary _radioModel](self, "_radioModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v2, "stationSortOrdering");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v2, "stationWithID:", objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "longLongValue"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = -[MPRadioStation initWithStation:]([MPRadioStation alloc], "initWithStation:", v10);
          if (v11)
          {
            objc_msgSend(v4, "addObject:", v11);
            objc_msgSend(v3, "addObject:", v10);
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v2, "userStations", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j);
        if ((objc_msgSend(v3, "containsObject:", v17) & 1) == 0)
        {
          v18 = -[MPRadioStation initWithStation:]([MPRadioStation alloc], "initWithStation:", v17);
          if (v18)
            objc_msgSend(v4, "addObject:", v18);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v4, "count"))
    v19 = v4;
  else
    v19 = 0;

  return (NSArray *)v19;
}

- (id)stationWithIdentifier:(int64_t)a3
{
  void *v4;
  void *v5;
  MPRadioStation *v6;

  -[MPRadioLibrary _radioModel](self, "_radioModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stationWithID:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = -[MPRadioStation initWithStation:]([MPRadioStation alloc], "initWithStation:", v5);
  else
    v6 = 0;

  return v6;
}

- (void)_radioAvailabilityDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MPRadioLibrary__radioAvailabilityDidChangeNotification___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_radioRecentStationsDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MPRadioLibrary__radioRecentStationsDidChangeNotification___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_radioModelDidChangeNotification:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("MPRadioLibraryStationsDidChangeNotification"), self);

}

- (id)_radioModel
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getRadioModelClass_softClass;
  v9 = getRadioModelClass_softClass;
  if (!getRadioModelClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getRadioModelClass_block_invoke;
    v5[3] = &unk_1E31639A0;
    v5[4] = &v6;
    __getRadioModelClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v3, "sharedModel");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioController, 0);
}

void __60__MPRadioLibrary__radioRecentStationsDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MPRadioLibraryStationsDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __58__MPRadioLibrary__radioAvailabilityDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MPRadioLibraryStationsDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

+ (id)defaultRadioLibrary
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__MPRadioLibrary_defaultRadioLibrary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultRadioLibrary_onceToken != -1)
    dispatch_once(&defaultRadioLibrary_onceToken, block);
  return (id)defaultRadioLibrary_defaultLibrary;
}

void __37__MPRadioLibrary_defaultRadioLibrary__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultRadioLibrary_defaultLibrary;
  defaultRadioLibrary_defaultLibrary = (uint64_t)v1;

}

@end
