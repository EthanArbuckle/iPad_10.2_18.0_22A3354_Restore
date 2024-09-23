@implementation MIDICIDeviceManager

- (MIDICIDeviceManager)init
{
  MIDICIDeviceManager *v2;
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  MIDICIDevice *v12;
  MIDICIDevice *v13;
  NSMutableArray *devices;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)MIDICIDeviceManager;
  v2 = -[MIDICIDeviceManager init](&v21, sel_init);
  if (v2)
  {
    v20 = 0;
    if (!UMPCIGlobalState((MIDIServer *)&v20))
    {
      objc_msgSend(v20, "objectForKey:", CFSTR("device_manager_muid"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      if (v3)
        v2->_serverMUID = objc_msgSend(v3, "unsignedIntValue");

      objc_msgSend(v20, "objectForKey:", CFSTR("midi_ci_devices"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v17;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v17 != v9)
              objc_enumerationMutation(v7);
            v11 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * v10);
            v12 = [MIDICIDevice alloc];
            v13 = -[MIDICIDevice initWithDescription:](v12, "initWithDescription:", v11, (_QWORD)v16);
            -[NSMutableArray addObject:](v6, "addObject:", v13);

            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
        }
        while (v8);
      }

      devices = v2->_devices;
      v2->_devices = v6;

    }
  }
  return v2;
}

- (NSArray)discoveredCIDevices
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_devices, "copy");
}

- (BOOL)postNotificationName:(id)a3 device:(id)a4 profile:(id)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = (unint64_t)a4;
  v10 = (unint64_t)a5;
  if (v9 | v10)
  {
    v11 = (void *)objc_opt_new();
    v12 = v11;
    if (v9)
      objc_msgSend(v11, "setValue:forKey:", v9, CFSTR("MIDICIDeviceObjectKey"));
    if (v10)
      objc_msgSend(v12, "setValue:forKey:", v10, CFSTR("MIDICIProfileObjectKey"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:userInfo:", v8, self, v12);

  }
  return (v9 | v10) != 0;
}

- (optional<std::pair<MIDICIDevice)findProfileAndDevice:(MIDICIDeviceManager *)self
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  optional<std::pair<MIDICIDevice *, MIDIUMPCIProfile *>> *result;
  id v16;
  id v17;
  optional<std::pair<MIDICIDevice *, MIDIUMPCIProfile *>> *v18;
  NSMutableArray *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v18 = retstr;
  v30 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = self->_devices;
  v19 = v5;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v9, "profiles", v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v21;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v21 != v12)
                objc_enumerationMutation(v10);
              v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
              if (objc_msgSend(v14, "objectRef") == a4)
              {
                v16 = v9;
                v17 = v14;
                v18->var0.var1.var0 = v16;
                v18->var0.var1.var1 = v17;
                v18->var1 = 1;

                return result;
              }
            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v11)
              continue;
            break;
          }
        }

        v5 = v19;
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }

  v18->var0.var0 = 0;
  v18->var1 = 0;
  return result;
}

- (id)findProfile:(unsigned int)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = self->_devices;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v8, "profiles", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v17;
          while (2)
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v17 != v11)
                objc_enumerationMutation(v9);
              v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * j);
              if (objc_msgSend(v13, "objectRef") == a3)
              {
                v14 = v13;

                goto LABEL_19;
              }
            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            if (v10)
              continue;
            break;
          }
        }

      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      v14 = 0;
    }
    while (v5);
  }
  else
  {
    v14 = 0;
  }
LABEL_19:

  return v14;
}

- (void)addProfile:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MIDICIDeviceManager findProfile:](self, "findProfile:", objc_msgSend(v5, "objectRef"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[NSMutableArray addObject:](self->_profiles, "addObject:", v5);

}

- (BOOL)removeProfile:(unsigned int)a3
{
  void *v5;
  void *v6;
  char v7;

  -[MIDICIDeviceManager findProfileAndDevice:](self, "findProfileAndDevice:", *(_QWORD *)&a3);
  if (v7)
  {
    -[NSMutableArray removeObject:](self->_profiles, "removeObject:", v6);
    -[MIDICIDeviceManager postNotificationName:device:profile:](self, "postNotificationName:device:profile:", CFSTR("MIDICIProfileWasRemovedNotification"), v5, v6);

  }
  return v7 != 0;
}

- (void)updateProfile:(unsigned int)a3 description:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[MIDICIDeviceManager findProfileAndDevice:](self, "findProfileAndDevice:", v4);
  if (v9)
  {
    if (objc_msgSend(v8, "deserialize:", v6))
      -[MIDICIDeviceManager postNotificationName:device:profile:](self, "postNotificationName:device:profile:", CFSTR("MIDICIProfileWasUpdatedNotification"), v7, v8);

  }
}

- (id)findDevice:(unsigned int)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_devices;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "objectRef", (_QWORD)v11) == a3)
        {
          v9 = v8;
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)addDevice:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MIDICIDeviceManager findDevice:](self, "findDevice:", objc_msgSend(v5, "objectRef"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[NSMutableArray addObject:](self->_devices, "addObject:", v5);
    -[MIDICIDeviceManager postNotificationName:device:profile:](self, "postNotificationName:device:profile:", CFSTR("MIDICIDeviceWasAddedNotification"), v5, 0);
  }

}

- (BOOL)removeDevice:(unsigned int)a3
{
  void *v4;
  BOOL v5;
  id v6;
  id v7;

  -[MIDICIDeviceManager findDevice:](self, "findDevice:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableArray removeObject:](self->_devices, "removeObject:", v4);
    -[MIDICIDeviceManager postNotificationName:device:profile:](self, "postNotificationName:device:profile:", CFSTR("MIDICIDeviceWasAddedNotification"), v4, 0);
    v5 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10842, 0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());

    v7 = v6;
    v5 = v7 == 0;
  }

  return v5;
}

- (void)updateDevice:(unsigned int)a3 description:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  -[MIDICIDeviceManager findDevice:](self, "findDevice:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "deserialize:", v8);

}

- (void)setServerMUID:(unsigned int)a3
{
  self->_serverMUID = a3;
}

- (NSMutableArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (NSMutableArray)profiles
{
  return self->_profiles;
}

- (void)setProfiles:(id)a3
{
  objc_storeStrong((id *)&self->_profiles, a3);
}

- (unsigned)serverMUID
{
  return self->_serverMUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profiles, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

+ (id)description
{
  return CFSTR("MIDI-CI Device Manager");
}

+ (MIDICIDeviceManager)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__MIDICIDeviceManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[MIDICIDeviceManager sharedInstance]::onceToken != -1)
    dispatch_once(&+[MIDICIDeviceManager sharedInstance]::onceToken, block);
  return (MIDICIDeviceManager *)(id)+[MIDICIDeviceManager sharedInstance]::theInstance;
}

void __37__MIDICIDeviceManager_sharedInstance__block_invoke(Class *a1)
{
  id v2;
  void *v3;

  UMPCIClients::instance((UMPCIClients *)a1);
  v2 = objc_alloc_init(a1[4]);
  v3 = (void *)+[MIDICIDeviceManager sharedInstance]::theInstance;
  +[MIDICIDeviceManager sharedInstance]::theInstance = (uint64_t)v2;

}

@end
