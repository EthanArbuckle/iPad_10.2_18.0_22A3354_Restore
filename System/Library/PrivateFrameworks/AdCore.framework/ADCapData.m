@implementation ADCapData

void __27__ADCapData_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance__instance;
  sharedInstance__instance = (uint64_t)v0;

}

- (ADCapData)init
{
  return -[ADCapData initWithStorageType:keychainKey:title:](self, "initWithStorageType:keychainKey:title:", 0, CFSTR("ADCapDataKeychainKey"), CFSTR("Results"));
}

- (ADCapData)initWithStorageType:(int64_t)a3
{
  ADCapData *v3;

  v3 = 0;
  switch(a3)
  {
    case 0:
      break;
    default:
      self = -[ADCapData initWithStorageType:keychainKey:title:](self, "initWithStorageType:keychainKey:title:");
      v3 = self;
      break;
  }

  return v3;
}

- (ADCapData)initWithStorageType:(int64_t)a3 keychainKey:(id)a4 title:(id)a5
{
  id v9;
  id v10;
  ADCapData *v11;
  ADCapData *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ADCapData;
  v11 = -[ADCapData init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_storageType = a3;
    objc_storeStrong((id *)&v11->_keychainKey, a4);
    objc_storeStrong((id *)&v12->_title, a5);
    -[ADCapData restoreAllCapData](v12, "restoreAllCapData");
  }

  return v12;
}

- (void)restoreAllCapData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  NSString *toroID;
  void *v15;
  NSMutableArray *v16;
  NSMutableArray *frequencyCapData;
  void *v18;
  NSMutableArray *v19;
  NSMutableArray *clickCountData;
  void *v21;
  NSMutableArray *v22;
  NSMutableArray *downloadData;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  OSStatus v33;

  v33 = 0;
  -[ADCapData keychainKey](self, "keychainKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ADCopyDataFromKeychain(v3, &v33);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v32 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, &v32);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v32;
    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      -[ADCapData title](self, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("Error restoring cap data for %@ %@"), v8, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog(CFSTR("ToroLogging"), v9, 16);

      -[ADCapData resetCapDataObject](self, "resetCapDataObject");
    }
    else
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("ADToroIDKey"));
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      toroID = self->_toroID;
      self->_toroID = v13;

      if (self->_toroID)
      {
        objc_msgSend(v5, "objectForKey:", CFSTR("ADFrequencyCapTypeKey"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[ADCapData restoreCapDataArrayFromPlist:](self, "restoreCapDataArrayFromPlist:", v15);
        v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        frequencyCapData = self->_frequencyCapData;
        self->_frequencyCapData = v16;

        objc_msgSend(v5, "objectForKey:", CFSTR("ADToroClickTypeKey"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[ADCapData restoreCapDataArrayFromPlist:](self, "restoreCapDataArrayFromPlist:", v18);
        v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        clickCountData = self->_clickCountData;
        self->_clickCountData = v19;

        objc_msgSend(v5, "objectForKey:", CFSTR("ADDownloadTypeKey"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[ADCapData restoreCapDataArrayFromPlist:](self, "restoreCapDataArrayFromPlist:", v21);
        v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        downloadData = self->_downloadData;
        self->_downloadData = v22;

      }
      else
      {
        v24 = (void *)MEMORY[0x1E0CB3940];
        -[ADCapData title](self, "title");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("Unable to restore Toro ID for ADCapData for %@. Please file a radar..."), v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog(CFSTR("ToroLogging"), v26, 16);

        -[ADCapData resetCapDataObject](self, "resetCapDataObject");
      }
      v27 = (void *)MEMORY[0x1E0CB3940];
      -[ADCapData title](self, "title");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[ADCapData dictionaryRepresentation](self, "dictionaryRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "AD_jsonString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("Restored Cap Data information for %@: %@"), v28, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      _ADLog(CFSTR("ToroLogging"), v31, 0);

    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    -[ADCapData title](self, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("No data to restore. Initializing an empty Cap Data object for %@."), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("ToroLogging"), v12, 0);

    -[ADCapData resetCapDataObject](self, "resetCapDataObject");
  }

}

- (NSString)title
{
  return self->_title;
}

- (NSString)keychainKey
{
  return self->_keychainKey;
}

- (id)restoreCapDataArrayFromPlist:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  ADFrequencyCap *v11;
  ADFrequencyCap *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
          v11 = [ADFrequencyCap alloc];
          v12 = -[ADFrequencyCap initWithDictionary:](v11, "initWithDictionary:", v10, (_QWORD)v14);
          objc_msgSend(v4, "addObject:", v12);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  return v4;
}

- (void)resetCapDataObject
{
  void *v3;
  NSString *v4;
  NSString *toroID;
  NSMutableArray *v6;
  NSMutableArray *frequencyCapData;
  NSMutableArray *v8;
  NSMutableArray *clickCountData;
  NSMutableArray *v10;
  NSMutableArray *downloadData;

  +[ADIDManager sharedInstance](ADIDManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idForClientType:", 4);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  toroID = self->_toroID;
  self->_toroID = v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  frequencyCapData = self->_frequencyCapData;
  self->_frequencyCapData = v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  clickCountData = self->_clickCountData;
  self->_clickCountData = v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  downloadData = self->_downloadData;
  self->_downloadData = v10;

}

- (void)checkAndUpdateToroID
{
  void *v3;
  ADCapData *v4;
  NSString *toroID;
  uint64_t v6;

  +[ADIDManager sharedInstance](ADIDManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idForClientType:", 4);
  v6 = objc_claimAutoreleasedReturnValue();

  v4 = self;
  objc_sync_enter(v4);
  toroID = v4->_toroID;
  if ((unint64_t)toroID | v6 && !-[NSString isEqualToString:](toroID, "isEqualToString:", v6))
    -[ADCapData resetCapDataObject](v4, "resetCapDataObject");
  objc_sync_exit(v4);

}

- (NSMutableArray)frequencyCapData
{
  return self->_frequencyCapData;
}

- (NSMutableArray)clickCountData
{
  return self->_clickCountData;
}

- (void)setFrequencyCapData:(id)a3
{
  objc_storeStrong((id *)&self->_frequencyCapData, a3);
}

- (void)setClickCountData:(id)a3
{
  objc_storeStrong((id *)&self->_clickCountData, a3);
}

- (id)capData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v13, "identifier", (_QWORD)v22);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v13, "setTime");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (int)((v7 - v15) / 3600.0));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, v19);

          }
          objc_msgSend(v18, "addObject:", v16);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to read a ADFrequencyCap object."));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          _ADLog(CFSTR("ToroLogging"), v16, 16);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v4, "count"))
    v20 = v4;
  else
    v20 = 0;

  return v20;
}

- (id)filteredCapData:(id)a3 maxItems:(unint64_t)a4 expirationThresholdInSeconds:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSince1970");
  v11 = v10;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v17, "setTime", (_QWORD)v22);
        if (v11 - v18 < a5)
          objc_msgSend(v8, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

  objc_msgSend(v8, "arrayCappedToMaxItems:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  return v20;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *toroID;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  toroID = self->_toroID;
  if (toroID)
  {
    objc_msgSend(v3, "setObject:forKey:", toroID, CFSTR("ADToroIDKey"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v7 = self->_frequencyCapData;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v39 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("ADFrequencyCapTypeKey"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v14 = self->_clickCountData;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v35 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("ADToroClickTypeKey"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v21 = self->_downloadData;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v31;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v31 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * k), "dictionaryRepresentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      }
      while (v23);
    }

    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("ADDownloadTypeKey"));
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] The Toro ID is null inside of the ADCapData object. Please file a radar..."), objc_opt_class());
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("ToroLogging"), v28, 16);

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v27;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__ADCapData_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken != -1)
    dispatch_once(&sharedInstance__onceToken, block);
  return (id)sharedInstance__instance;
}

- (void)saveCapDataWithReason:(id)a3
{
  id v4;
  ADCapData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[ADCapData dictionaryRepresentation](v5, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[ADCapData title](v5, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "AD_jsonString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Updated %@ Cap Data information for %@: %@"), v8, v4, v9);
  else
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Updated %@ Cap Data information: %@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("ToroLogging"), v10, 0);

  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v6, 200, 0, &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18;
  if (!v11)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    -[ADCapData title](v5, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Error serializing %@ Cap Data: %@"), v15, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("ToroLogging"), v17, 16);

    goto LABEL_8;
  }
  -[ADCapData keychainKey](v5, "keychainKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = ADWriteDataToKeychain(v13, v11);

  if ((_DWORD)v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error writing results cap data to keychain: %d"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdInternalLogging"), v15, 16);
LABEL_8:

  }
  objc_sync_exit(v5);

}

- (void)addCapDataObject:(id)a3 ofKind:(int64_t)a4
{
  ADCapData *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v6 = self;
  objc_sync_enter(v6);
  -[ADCapData checkAndUpdateToroID](v6, "checkAndUpdateToroID");
  switch(a4)
  {
    case 2:
      v12 = -[ADCapData storageType](v6, "storageType");
      v13 = (void *)MEMORY[0x1E0CB3940];
      if (v12)
      {
        -[ADCapData title](v6, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("Adding %@ Download Data: %@"), v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog(CFSTR("iAdToroClick"), v16, 0);

      }
      else
      {
        objc_msgSend(v27, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("Adding Download Data: %@"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog(CFSTR("iAdToroClick"), v15, 0);
      }

      -[NSMutableArray addObject:](v6->_downloadData, "addObject:", v27);
      v24 = CFSTR("Ad Download Update");
      goto LABEL_17;
    case 1:
      v17 = -[ADCapData storageType](v6, "storageType");
      v18 = (void *)MEMORY[0x1E0CB3940];
      if (v17)
      {
        -[ADCapData title](v6, "title");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("Adding %@ Click Count Data: %@"), v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog(CFSTR("iAdToroClick"), v21, 0);

        v22 = (void *)MEMORY[0x1E0CB3940];
        -[ADCapData title](v6, "title");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("%@ Click Update"), v23);
        v24 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v27, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("Adding Toro Click Count Data: %@"), v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog(CFSTR("iAdToroClick"), v26, 0);

        v24 = CFSTR("Toro Click Update");
      }

      -[NSMutableArray addObject:](v6->_clickCountData, "addObject:", v27);
      goto LABEL_17;
    case 0:
      v7 = -[ADCapData storageType](v6, "storageType");
      v8 = (void *)MEMORY[0x1E0CB3940];
      if (v7)
      {
        -[ADCapData title](v6, "title");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("Adding %@ Frequency Cap Identifier: %@"), v9, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog(CFSTR("iAdFrequencyCap"), v11, 0);

      }
      else
      {
        objc_msgSend(v27, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("Adding Sponsored Frequency Cap Identifier: %@"), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog(CFSTR("iAdFrequencyCap"), v10, 0);
      }

      -[NSMutableArray addObject:](v6->_frequencyCapData, "addObject:", v27);
      v24 = CFSTR("Frequency Cap Update");
LABEL_17:
      objc_sync_exit(v6);

      -[ADCapData saveCapDataWithReason:](v6, "saveCapDataWithReason:", v24);
      v6 = (ADCapData *)v24;
      goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: Unknown type of Cap Data."));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("ToroLogging"), v25, 16);

  objc_sync_exit(v6);
LABEL_18:

}

- (void)updateCapDataWith:(id)a3 ofKind:(int64_t)a4
{
  id v6;
  ADFrequencyCap *v7;

  v6 = a3;
  v7 = -[ADFrequencyCap initWithIdentifier:]([ADFrequencyCap alloc], "initWithIdentifier:", v6);

  -[ADCapData addCapDataObject:ofKind:](self, "addCapDataObject:ofKind:", v7, a4);
}

- (id)capDataJSON:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  -[ADCapData capData:](self, "capData:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_6;
  if ((objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("There was an error attempting to serialize a JSON object for: %@. Invalid JSON object."), v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("ToroLogging"), v7, 16);

LABEL_6:
    v6 = 0;
    goto LABEL_9;
  }
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 0, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("There was an error attempting to serialize a JSON object for: %@"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("ToroLogging"), v5, 16);

    v6 = 0;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
  }

LABEL_9:
  return v6;
}

- (id)clickCapObjectForAdamID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[ADIDManager sharedInstance](ADIDManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "idForClientType:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", self->_toroID);

  if (v7)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[NSMutableArray reverseObjectEnumerator](self->_clickCountData, "reverseObjectEnumerator", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v4);

          if ((v14 & 1) != 0)
          {
            v9 = v12;
            goto LABEL_13;
          }
        }
        v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)downloadObjectForAdamID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[ADIDManager sharedInstance](ADIDManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "idForClientType:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", self->_toroID);

  if (v7)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[NSMutableArray reverseObjectEnumerator](self->_downloadData, "reverseObjectEnumerator", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v4);

          if ((v14 & 1) != 0)
          {
            v9 = v12;
            goto LABEL_13;
          }
        }
        v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)eraseCapData
{
  NSString *toroID;
  NSMutableArray *v4;
  NSMutableArray *frequencyCapData;
  NSMutableArray *v6;
  NSMutableArray *clickCountData;
  NSMutableArray *v8;
  NSMutableArray *downloadData;

  toroID = self->_toroID;
  self->_toroID = (NSString *)&stru_1E82B34E8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  frequencyCapData = self->_frequencyCapData;
  self->_frequencyCapData = v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  clickCountData = self->_clickCountData;
  self->_clickCountData = v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  downloadData = self->_downloadData;
  self->_downloadData = v8;

  -[ADCapData saveCapDataWithReason:](self, "saveCapDataWithReason:", CFSTR("Erasing"));
}

- (NSString)toroID
{
  return self->_toroID;
}

- (void)setToroID:(id)a3
{
  objc_storeStrong((id *)&self->_toroID, a3);
}

- (NSMutableArray)downloadData
{
  return self->_downloadData;
}

- (void)setDownloadData:(id)a3
{
  objc_storeStrong((id *)&self->_downloadData, a3);
}

- (void)setKeychainKey:(id)a3
{
  objc_storeStrong((id *)&self->_keychainKey, a3);
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (int64_t)storageType
{
  return self->_storageType;
}

- (void)setStorageType:(int64_t)a3
{
  self->_storageType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_keychainKey, 0);
  objc_storeStrong((id *)&self->_downloadData, 0);
  objc_storeStrong((id *)&self->_clickCountData, 0);
  objc_storeStrong((id *)&self->_frequencyCapData, 0);
  objc_storeStrong((id *)&self->_toroID, 0);
}

@end
