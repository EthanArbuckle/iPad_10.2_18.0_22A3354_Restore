@implementation MRVirtualOutputContext

- (MRVirtualOutputContext)initWithUID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  MRVirtualOutputContext *v8;
  MRVirtualOutputContext *v9;
  MRVirtualOutputContext *v10;
  void *v11;
  MRVirtualOutputContext *v12;
  objc_super v14;

  v5 = a3;
  +[MRVirtualOutputContextManager sharedManager](MRVirtualOutputContextManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchForUID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)MRVirtualOutputContext;
    v9 = -[MRVirtualOutputContext init](&v14, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_uniqueIdentifier, a3);
      +[MRVirtualOutputContextManager sharedManager](MRVirtualOutputContextManager, "sharedManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addOutputContext:", v10);

    }
    v8 = v10;
    self = v8;
  }
  v12 = v8;

  return v12;
}

- (id)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (unsigned)type
{
  return 5;
}

- (id)outputDevices
{
  return 0;
}

- (id)predictedOutputDevice
{
  return 0;
}

- (BOOL)isVolumeControlAvailable
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[MRVirtualOutputContext outputDevices](self, "outputDevices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isVolumeControlAvailable") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)supportsVolumeControl
{
  return 1;
}

- (float)volume
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  float v6;
  uint64_t i;
  void *v8;
  float v9;
  float v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[MRVirtualOutputContext outputDevices](self, "outputDevices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "volume");
        if (v6 <= v9)
        {
          objc_msgSend(v8, "volume");
          v6 = v10;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (BOOL)supportsMultipleBluetoothOutputDevices
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDevices, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
