@implementation VCSessionUplinkBandwidthAllocatorMultiway

- (VCSessionUplinkBandwidthAllocatorMultiway)init
{
  VCSessionUplinkBandwidthAllocatorMultiway *v2;
  VCSessionBandwidthAllocationTable *v3;
  NSMutableDictionary *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)VCSessionUplinkBandwidthAllocatorMultiway;
  v2 = -[VCObject init](&v6, sel_init);
  if (v2)
  {
    v3 = -[VCSessionBandwidthAllocationTable initWithType:]([VCSessionBandwidthAllocationTable alloc], "initWithType:", 1);
    v2->_table = v3;
    if (v3)
    {
      v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v2->_streamTokenToEnableMap = v4;
      if (v4)
      {
        v2->_camera1080pAvailable = objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "is1080pCameraAvailable");
        return v2;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionUplinkBandwidthAllocatorMultiway init].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionUplinkBandwidthAllocatorMultiway init].cold.1();
    }

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionUplinkBandwidthAllocatorMultiway;
  -[VCObject dealloc](&v3, sel_dealloc);
}

- (void)addBandwidthAllocationTableEntry:(id)a3 updateNow:(BOOL)a4
{
  _BOOL4 v4;
  NSMutableDictionary *streamTokenToEnableMap;
  uint64_t v8;

  v4 = a4;
  -[VCObject lock](self, "lock");
  if (a3)
  {
    -[VCSessionBandwidthAllocationTable addBandwidthAllocationTableEntry:](self->_table, "addBandwidthAllocationTableEntry:", a3);
    streamTokenToEnableMap = self->_streamTokenToEnableMap;
    v8 = objc_msgSend(a3, "streamToken");
    -[NSMutableDictionary setObject:forKeyedSubscript:](streamTokenToEnableMap, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v8);
  }
  if (v4)
    -[VCSessionUplinkBandwidthAllocatorMultiway _recomputeCurrentTable](self, "_recomputeCurrentTable");
  -[VCObject unlock](self, "unlock");
}

- (void)streamToken:(int64_t)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  void *v8;

  v4 = a4;
  -[VCObject lock](self, "lock");
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToEnableMap, "objectForKeyedSubscript:", v7);
  if (v8 && objc_msgSend(v8, "BOOLValue") != v4)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamTokenToEnableMap, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4), v7);
    -[VCSessionUplinkBandwidthAllocatorMultiway _recomputeCurrentTable](self, "_recomputeCurrentTable");
  }
  -[VCObject unlock](self, "unlock");
}

- (BOOL)isEnabledStreamToken:(int64_t)a3
{
  return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToEnableMap, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3)), "BOOLValue");
}

- (void)setRedundancyEnabled:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[VCObject lock](self, "lock");
  if (self->_redundancyEnabled != v3)
  {
    self->_redundancyEnabled = v3;
    -[VCSessionUplinkBandwidthAllocatorMultiway _recomputeCurrentTable](self, "_recomputeCurrentTable");
  }
  -[VCObject unlock](self, "unlock");
}

- (BOOL)isRedundancyEnabled
{
  return self->_redundancyEnabled;
}

- (void)setRedundancyEnabledFor720Stream:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[VCObject lock](self, "lock");
  if (self->_redundancyEnabledFor720Stream != v3)
  {
    self->_redundancyEnabledFor720Stream = v3;
    -[VCSessionUplinkBandwidthAllocatorMultiway _recomputeCurrentTable](self, "_recomputeCurrentTable");
  }
  -[VCObject unlock](self, "unlock");
}

- (BOOL)isRedundancyEnabledFor720Stream
{
  return self->_redundancyEnabledFor720Stream;
}

- (void)setCamera1080pAvailable:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[VCObject lock](self, "lock");
  if (self->_camera1080pAvailable != v3)
  {
    self->_camera1080pAvailable = v3;
    -[VCSessionUplinkBandwidthAllocatorMultiway _recomputeCurrentTable](self, "_recomputeCurrentTable");
  }
  -[VCObject unlock](self, "unlock");
}

- (BOOL)isCamera1080pAvailable
{
  return self->_camera1080pAvailable;
}

- (BOOL)peerSubscription:(BOOL)a3 streamID:(unsigned __int16)a4
{
  uint64_t v4;
  _BOOL8 v5;
  id v7;
  void *v8;
  int v9;
  BOOL v10;

  v4 = a4;
  v5 = a3;
  -[VCObject lock](self, "lock");
  v7 = -[VCSessionBandwidthAllocationTable entryForStreamID:](self->_table, "entryForStreamID:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4));
  if (!v7 || (v8 = v7, v9 = objc_msgSend(v7, "isSubscribedTo"), objc_msgSend(v8, "setSubscribedTo:", v5), v9 == v5))
  {
    v10 = 0;
  }
  else
  {
    -[VCSessionUplinkBandwidthAllocatorMultiway _recomputeCurrentTable](self, "_recomputeCurrentTable");
    v10 = 1;
  }
  -[VCObject unlock](self, "unlock");
  return v10;
}

- (id)tableEntriesForStreamToken:(int64_t)a3 targetBitrate:(unsigned int)a4 remainingBitrate:(unsigned int *)a5 isLastEntryForStreamToken:(BOOL *)a6
{
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  unsigned int v23;
  NSArray *obj;
  BOOL *v26;
  _BYTE v28[128];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  obj = -[NSArray sortedArrayUsingSelector:](-[NSDictionary allKeys](self->_currentTable, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  v26 = a6;
  *a6 = 0;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
  v23 = a4;
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v30;
    v15 = a4;
LABEL_3:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v14)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v16);
      if (objc_msgSend(v17, "unsignedIntegerValue") > v15)
        break;
      v18 = -[NSDictionary objectForKeyedSubscript:](self->_currentTable, "objectForKeyedSubscript:", v17);
      v13 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3));
      v11 = objc_msgSend(v17, "unsignedIntValue");
      v19 = (void *)objc_msgSend(v13, "lastObject");
      if (v19)
      {
        v20 = v19;
        if (v12 == objc_msgSend(v19, "streamID"))
        {
          v21 = 0;
        }
        else
        {
          v12 = objc_msgSend(v20, "streamID");
          v21 = 1;
        }
        *v26 = v21;
      }
      if (v10 == ++v16)
      {
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  if (a5)
    *a5 = v23 - v11;
  return v13;
}

- (id)targetBitratesForStreamToken:(int64_t)a3 targetNetworkBitrate:(unsigned int)a4 preferNetworkBitrates:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 v17;
  BOOL v18;
  unsigned int v19;
  void *v20;
  void *v21;
  int v22;
  unsigned int v23;
  int v24;
  unsigned int v25;
  double v26;
  unsigned int v27;
  uint64_t v28;
  NSObject *v29;
  id obj;
  id v32;
  char v33;
  int v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  unsigned int v46;
  __int16 v47;
  unsigned int v48;
  _BYTE v49[128];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v54 = *MEMORY[0x1E0C80C00];
  v34 = 0;
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = 0;
  -[VCObject lock](self, "lock");
  v9 = -[VCSessionUplinkBandwidthAllocatorMultiway tableEntriesForStreamToken:targetBitrate:remainingBitrate:isLastEntryForStreamToken:](self, "tableEntriesForStreamToken:targetBitrate:remainingBitrate:isLastEntryForStreamToken:", a3, v6, &v34, &v33);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v9;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v49, 16);
  if (!v10)
  {
    if (!v33)
      goto LABEL_28;
    v20 = (void *)objc_msgSend(obj, "lastObject");
    goto LABEL_19;
  }
  v11 = v10;
  v12 = *(_QWORD *)v51;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v51 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
      if (v5)
        v15 = objc_msgSend(v14, "maxNetworkBitrate");
      else
        v15 = objc_msgSend(v14, "maxMediaBitrate");
      v16 = v15;
      v17 = -[VCSessionBandwidthAllocationTable shouldUseRepairBitrateForEntry:isRedundancyEnabled:isRedundancyEnabledFor720Stream:](self->_table, "shouldUseRepairBitrateForEntry:isRedundancyEnabled:isRedundancyEnabledFor720Stream:", v14, self->_redundancyEnabled, self->_redundancyEnabledFor720Stream);
      v18 = v17;
      if (v17)
      {
        v19 = objc_msgSend(v14, "repairMaxNetworkBitrate");
        if (!v5)
          v16 = ((double)v19 / 1.1);
      }
      objc_msgSend(v32, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v16));
    }
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v49, 16);
  }
  while (v11);
  if (v33)
  {
    v20 = (void *)objc_msgSend(obj, "lastObject");
    if (!v18)
    {
LABEL_19:
      v21 = v20;
      v22 = objc_msgSend(v20, "minNetworkBitrate");
      if (v22 != objc_msgSend(v21, "maxNetworkBitrate"))
      {
        objc_msgSend(v32, "removeLastObject");
        v23 = objc_msgSend(v21, "maxNetworkBitrate");
        v24 = objc_msgSend(v21, "minNetworkBitrate");
        if (v23 >= v34 + v24)
          v25 = v34 + v24;
        else
          v25 = v23;
        v26 = (double)v25;
        if (!v5)
          v26 = (double)v25 / 1.1;
        v27 = v26;
        objc_msgSend(v32, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v26));
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v28 = VRTraceErrorLogLevelToCSTR();
          v29 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316674;
            v36 = v28;
            v37 = 2080;
            v38 = "-[VCSessionUplinkBandwidthAllocatorMultiway targetBitratesForStreamToken:targetNetworkBitrate:preferNetworkBitrates:]";
            v39 = 1024;
            v40 = 206;
            v41 = 2112;
            v42 = v21;
            v43 = 1024;
            v44 = v34;
            v45 = 1024;
            v46 = v25;
            v47 = 1024;
            v48 = v27;
            _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Last entry=%@ will use remainingBitrate=%d available networkBitrate=%d bitrate=%d", buf, 0x38u);
          }
        }
      }
    }
  }
LABEL_28:
  -[VCObject unlock](self, "unlock");
  return v32;
}

- (id)streamIDsForStreamToken:(int64_t)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VCObject lock](self, "lock");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = -[VCSessionBandwidthAllocationTable tableEntriesForStreamToken:](self->_table, "tableEntriesForStreamToken:", a3);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10++), "streamID")));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v8);
  }
  -[VCObject unlock](self, "unlock");
  return v5;
}

- (id)repairStreamIDsForStreamToken:(int64_t)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VCObject lock](self, "lock");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = -[VCSessionBandwidthAllocationTable tableEntriesForStreamToken:](self->_table, "tableEntriesForStreamToken:", a3);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10++), "repairStreamID")));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v8);
  }
  -[VCObject unlock](self, "unlock");
  return v5;
}

- (id)streamIDsForStreamToken:(int64_t)a3 targetBitrate:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v15;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v4 = *(_QWORD *)&a4;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0;
  -[VCObject lock](self, "lock");
  v8 = -[VCSessionUplinkBandwidthAllocatorMultiway tableEntriesForStreamToken:targetBitrate:remainingBitrate:isLastEntryForStreamToken:](self, "tableEntriesForStreamToken:targetBitrate:remainingBitrate:isLastEntryForStreamToken:", a3, v4, 0, &v15);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v13, "streamID")));
        if (objc_msgSend(v13, "v2StreamID"))
          objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v13, "v2StreamID")));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    }
    while (v10);
  }
  -[VCObject unlock](self, "unlock");
  return v7;
}

- (id)streamIDsForStreamToken:(int64_t)a3 targetBitrateCap:(unsigned int)a4
{
  id v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  int64_t v23;
  VCSessionUplinkBandwidthAllocatorMultiway *v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v23 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[VCObject lock](self, "lock");
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = self;
  v8 = -[NSArray sortedArrayUsingSelector:](-[NSDictionary allKeys](self->_currentTable, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    v12 = a4;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (objc_msgSend(v14, "unsignedIntegerValue", v23) <= v12)
        {
          v15 = -[NSDictionary objectForKeyedSubscript:](v24->_currentTable, "objectForKeyedSubscript:", v14);
          objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(v15, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v23)));
        }
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
    }
    while (v10);
  }
  -[VCObject unlock](v24, "unlock", v23);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v7);
        v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v20, "streamID")));
        if (objc_msgSend(v20, "v2StreamID"))
          objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v20, "v2StreamID")));
      }
      v17 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
    }
    while (v17);
  }

  v21 = (void *)objc_msgSend(v6, "allObjects");
  return v21;
}

- (void)_recomputeCurrentTable
{

  self->_currentTable = (NSDictionary *)-[VCSessionBandwidthAllocationTable newAggregatedBandwidthTableWithRedundancy:redundancyEnabledFor720Stream:enableMap:is1080pCameraAvailable:](self->_table, "newAggregatedBandwidthTableWithRedundancy:redundancyEnabledFor720Stream:enableMap:is1080pCameraAvailable:", self->_redundancyEnabled, self->_redundancyEnabledFor720Stream, self->_streamTokenToEnableMap, self->_camera1080pAvailable);
}

- (id)getBitrateToStreamTable
{
  id v3;

  -[VCObject lock](self, "lock");
  v3 = (id)-[NSDictionary copy](self->_currentTable, "copy");
  -[VCObject unlock](self, "unlock");
  return v3;
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate stream token to enable map", v2, v3, v4, v5, 2u);
}

@end
