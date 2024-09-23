@implementation CSBluetoothWirelessSplitterInfo

- (CSBluetoothWirelessSplitterInfo)init
{
  CSBluetoothWirelessSplitterInfo *v2;
  uint64_t v3;
  NSMutableArray *splitterDeviceList;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSBluetoothWirelessSplitterInfo;
  v2 = -[CSBluetoothWirelessSplitterInfo init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    splitterDeviceList = v2->_splitterDeviceList;
    v2->_splitterDeviceList = (NSMutableArray *)v3;

  }
  return v2;
}

- (id)description
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[SplitterEnabled(%d)]"), self->_splitterEnabled);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_splitterDeviceList;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = 1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "address");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("[Device%d(%@) DoAP(%d)]"), v8 + i, v11, objc_msgSend(v10, "supportDoAP"));

      }
      v8 = (v8 + i);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("[SplitterState:%d]"), -[CSBluetoothWirelessSplitterInfo splitterState](self, "splitterState"));
  return v3;
}

- (id)splitterDeviceList
{
  return (id)-[NSMutableArray copy](self->_splitterDeviceList, "copy");
}

- (void)addDeviceIntoSplitterDeviceList:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self->_splitterDeviceList, "addObject:");
}

- (unint64_t)splitterState
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  unint64_t result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_splitterEnabled)
    return 1;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_splitterDeviceList;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (!v3)
  {

    return 2;
  }
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v10;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v2);
      v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "supportDoAP", (_QWORD)v9);
    }
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  }
  while (v4);

  if (v5 == 1)
    result = 3;
  else
    result = 4;
  if (!v5)
    return 2;
  return result;
}

- (BOOL)shouldDisableSpeakerVerificationInSplitterMode
{
  if ((-[CSBluetoothWirelessSplitterInfo splitterState](self, "splitterState") & 0xFFFFFFFFFFFFFFFELL) == 2)
    return !-[CSBluetoothWirelessSplitterInfo _hasDeviceTemporaryPairedNotInContacts](self, "_hasDeviceTemporaryPairedNotInContacts");
  else
    return 0;
}

- (BOOL)_hasDeviceTemporaryPairedNotInContacts
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_splitterEnabled)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = self->_splitterDeviceList;
    v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v9;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v9 != v4)
            objc_enumerationMutation(v2);
          v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
          if ((objc_msgSend(v6, "supportDoAP", (_QWORD)v8) & 1) == 0
            && (objc_msgSend(v6, "isTemporaryPairedNotInContacts") & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_14;
          }
        }
        v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)splitterEnabled
{
  return self->_splitterEnabled;
}

- (void)setSplitterEnabled:(BOOL)a3
{
  self->_splitterEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_splitterDeviceList, 0);
}

@end
