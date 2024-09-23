@implementation VCSessionUplinkBandwidthAllocatorOneToOne

- (VCSessionUplinkBandwidthAllocatorOneToOne)init
{
  VCSessionUplinkBandwidthAllocatorOneToOne *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCSessionUplinkBandwidthAllocatorOneToOne *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)VCSessionUplinkBandwidthAllocatorOneToOne;
  v2 = -[VCObject init](&v13, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_streamTokenToEnableMap = v3;
    if (v3)
    {
      v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v2->_streamTokenToTableEntryMap = v4;
      if (v4)
      {
        v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v2->_bandwithAllocationTable = v5;
        if (v5)
          return v2;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionUplinkBandwidthAllocatorOneToOne init].cold.3();
        }
        goto LABEL_28;
      }
      if ((VCSessionUplinkBandwidthAllocatorOneToOne *)objc_opt_class() == v2)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionUplinkBandwidthAllocatorOneToOne init].cold.2();
        }
        goto LABEL_28;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCSessionUplinkBandwidthAllocatorOneToOne performSelector:](v2, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (v12 = VRTraceErrorLogLevelToCSTR(),
            v10 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
      {
LABEL_28:

        return 0;
      }
      *(_DWORD *)buf = 136316162;
      v15 = v12;
      v16 = 2080;
      v17 = "-[VCSessionUplinkBandwidthAllocatorOneToOne init]";
      v18 = 1024;
      v19 = 34;
      v20 = 2112;
      v21 = v8;
      v22 = 2048;
      v23 = v2;
      v11 = " [%s] %s:%d %@(%p) Failed to allocate stream token to table entry map";
    }
    else
    {
      if ((VCSessionUplinkBandwidthAllocatorOneToOne *)objc_opt_class() == v2)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionUplinkBandwidthAllocatorOneToOne init].cold.1();
        }
        goto LABEL_28;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCSessionUplinkBandwidthAllocatorOneToOne performSelector:](v2, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_28;
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      *(_DWORD *)buf = 136316162;
      v15 = v9;
      v16 = 2080;
      v17 = "-[VCSessionUplinkBandwidthAllocatorOneToOne init]";
      v18 = 1024;
      v19 = 31;
      v20 = 2112;
      v21 = v7;
      v22 = 2048;
      v23 = v2;
      v11 = " [%s] %s:%d %@(%p) Failed to allocate stream token to enable map";
    }
    _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0x30u);
    goto LABEL_28;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionUplinkBandwidthAllocatorOneToOne;
  -[VCObject dealloc](&v3, sel_dealloc);
}

- (void)addBandwidthAllocationTableEntry:(id)a3 updateNow:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;

  v4 = a4;
  -[VCObject lock](self, "lock");
  if (a3)
  {
    v7 = objc_msgSend(a3, "streamToken");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamTokenToEnableMap, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v7);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamTokenToTableEntryMap, "setObject:forKeyedSubscript:", a3, v7);
  }
  if (v4)
    -[VCSessionUplinkBandwidthAllocatorOneToOne recomputeAllocationTableIfRequired](self, "recomputeAllocationTableIfRequired");
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
    -[VCSessionUplinkBandwidthAllocatorOneToOne recomputeAllocationTableIfRequired](self, "recomputeAllocationTableIfRequired");
  }
  -[VCObject unlock](self, "unlock");
}

- (BOOL)isEnabledStreamToken:(int64_t)a3
{
  -[VCObject lock](self, "lock");
  LOBYTE(a3) = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToEnableMap, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3)), "BOOLValue");
  -[VCObject unlock](self, "unlock");
  return a3;
}

- (BOOL)peerSubscription:(BOOL)a3 streamID:(unsigned __int16)a4
{
  return 0;
}

- (void)getCurrentEnabledTierTables:(id)a3 qualityIndices:(id)a4 qualityIndexToStreamToken:(id)a5
{
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  int v18;
  char *v19;
  char *v20;
  id obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  char *v39;
  __int16 v40;
  char *v41;
  _BYTE v42[128];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = (id)-[NSMutableDictionary allKeys](self->_streamTokenToEnableMap, "allKeys");
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v47, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v49;
    v6 = "";
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v49 != v23)
          objc_enumerationMutation(obj);
        v26 = v7;
        v8 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v7);
        if (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToEnableMap, "objectForKeyedSubscript:", v8), "BOOLValue"))
        {
          v27 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", v8);
          v28 = v8;
          objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v27, "uplinkClient"), "qualityTierTableForStreamToken:", objc_msgSend(v8, "unsignedIntValue")), v8);
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v9 = (void *)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v8), "allKeys");
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v42, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v44;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v44 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
                objc_msgSend(a4, "addObject:", v14);
                if (objc_msgSend(a5, "objectForKeyedSubscript:", v14))
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
                  {
                    v15 = VRTraceErrorLogLevelToCSTR();
                    v16 = *MEMORY[0x1E0CF2758];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                    {
                      v17 = v6;
                      v18 = objc_msgSend(v14, "unsignedIntValue");
                      v19 = FourccToCStr(objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", v14), "unsignedIntValue"));
                      v20 = FourccToCStr(objc_msgSend(v27, "streamGroupID"));
                      *(_DWORD *)buf = 136316418;
                      v31 = v15;
                      v32 = 2080;
                      v33 = "-[VCSessionUplinkBandwidthAllocatorOneToOne getCurrentEnabledTierTables:qualityIndices:quali"
                            "tyIndexToStreamToken:]";
                      v34 = 1024;
                      v35 = 110;
                      v36 = 1024;
                      v37 = v18;
                      v6 = v17;
                      v8 = v28;
                      v38 = 2080;
                      v39 = v19;
                      v40 = 2080;
                      v41 = v20;
                      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Quality Index collision for index=%u existing streamGroupID=%s other streamGroupID=%s", buf, 0x36u);
                    }
                  }
                }
                else
                {
                  objc_msgSend(a5, "setObject:forKeyedSubscript:", v8, v14);
                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v42, 16);
            }
            while (v11);
          }
        }
        v7 = v26 + 1;
      }
      while (v26 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v47, 16);
    }
    while (v24);
  }
}

- (void)generateBandwidthAllocationTableWithTierTables:(id)a3 qualityIndices:(id)a4 qualityIndexToStreamToken:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  int v15;
  id obj;
  uint64_t v17;
  uint64_t v20;
  unsigned int v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_msgSend(a4, "sortedArrayUsingSelector:", sel_compare_);
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
  if (v20)
  {
    v8 = 0;
    v17 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v11 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v11), "objectForKeyedSubscript:", v10);
        v21 = 0;
        if (objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", v11), "uplinkClient"), "shouldCapStream:cappedBitrate:", objc_msgSend(v11, "unsignedIntValue"), &v21))
        {
          v13 = objc_msgSend(v12, "unsignedIntValue");
          if (v13 > v21)
            continue;
        }
        v14 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_bandwithAllocationTable, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8)), "mutableCopy");
        if (!v14)
          v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v15 = v8 - objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", v11), "unsignedIntValue");
        v8 = v15 + objc_msgSend(v12, "unsignedIntValue");
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, v11);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bandwithAllocationTable, "setObject:forKeyedSubscript:", v14, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v11);

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    }
    while (v20);
  }

}

- (void)recomputeAllocationTableIfRequired
{
  id v3;
  id v4;
  id v5;

  if (-[VCSessionUplinkBandwidthAllocatorOneToOne shouldUseMultipleStreamGroupAlgorithm](self, "shouldUseMultipleStreamGroupAlgorithm"))
  {
    -[NSMutableDictionary removeAllObjects](self->_bandwithAllocationTable, "removeAllObjects");
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[VCSessionUplinkBandwidthAllocatorOneToOne getCurrentEnabledTierTables:qualityIndices:qualityIndexToStreamToken:](self, "getCurrentEnabledTierTables:qualityIndices:qualityIndexToStreamToken:", v3, v4, v5);
    -[VCSessionUplinkBandwidthAllocatorOneToOne generateBandwidthAllocationTableWithTierTables:qualityIndices:qualityIndexToStreamToken:](self, "generateBandwidthAllocationTableWithTierTables:qualityIndices:qualityIndexToStreamToken:", v3, v4, v5);

  }
}

- (id)streamIDsIfStreamTokenIsPresent:(int64_t)a3
{
  id v5;
  id v6;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VCObject lock](self, "lock");
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToEnableMap, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3)))
  {
    objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3)), "streamID")));
    v6 = v5;
  }
  else
  {

    v5 = 0;
  }
  -[VCObject unlock](self, "unlock");
  return v5;
}

- (id)repairStreamIDsForStreamToken:(int64_t)a3
{
  return 0;
}

- (void)setRedundancyEnabled:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[VCObject lock](self, "lock");
  if (self->_redundancyEnabled != v3)
  {
    self->_redundancyEnabled = v3;
    -[VCSessionUplinkBandwidthAllocatorOneToOne recomputeAllocationTableIfRequired](self, "recomputeAllocationTableIfRequired");
  }
  -[VCObject unlock](self, "unlock");
}

- (BOOL)isRedundancyEnabled
{
  BOOL redundancyEnabled;

  -[VCObject lock](self, "lock");
  redundancyEnabled = self->_redundancyEnabled;
  -[VCObject unlock](self, "unlock");
  return redundancyEnabled;
}

- (BOOL)isRedundancyEnabledFor720Stream
{
  return 0;
}

- (id)findBitrateSplitForStreamToken:(int64_t)a3 targetBitrate:(unsigned int)a4
{
  id v7;
  unint64_t v8;
  unsigned int v9;
  uint64_t v10;
  _BOOL4 v11;
  unsigned int v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  uint64_t i;
  id v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v7 = -[VCSessionUplinkBandwidthAllocatorOneToOne baseNetworkBitrateSplitForTargetBitrate:baseNetworkBitrate:](self, "baseNetworkBitrateSplitForTargetBitrate:baseNetworkBitrate:", *(_QWORD *)&a4, &v26);
  v8 = 0x1E0CB3000uLL;
  v9 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3)), "unsignedIntValue");
  v10 = a4 - v26;
  v11 = -[VCSessionUplinkBandwidthAllocatorOneToOne shouldUseMinMicBitrate:streamToken:remainderBitrate:](self, "shouldUseMinMicBitrate:streamToken:remainderBitrate:");
  if (a4 <= 0x2710)
    v12 = 10000;
  else
    v12 = a4;
  if (v11)
    v13 = v12;
  else
    v13 = v9;
  if (v10 >= 1 && (_DWORD)v13)
  {
    v24 = v10 & ~(v10 >> 63);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = (void *)objc_msgSend(v7, "allKeys");
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
    if (v15)
    {
      v16 = v15;
      v21 = v7;
      v22 = v13;
      v23 = a3;
      v17 = *(_QWORD *)v29;
      v18 = 0.0;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          v18 = v18
              + (float)objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), v21, v22, v23), "uplinkClient"), "remainderBitrateSplitForStreamToken:", objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "unsignedIntValue"));
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
      }
      while (v16);
      v8 = 0x1E0CB3000;
      LODWORD(v13) = v22;
      a3 = v23;
      v7 = v21;
    }
    else
    {
      v18 = 0.0;
    }
    if (v18 <= 0.0)
      v18 = 1.0;
    v13 = -[VCSessionUplinkBandwidthAllocatorOneToOne findAndSplitExtraBitrateFromCappedStreams:remainderBitrate:currentStreamGroupBitrate:streamToken:totalRemainderBitrateWeight:](self, "findAndSplitExtraBitrateFromCappedStreams:remainderBitrate:currentStreamGroupBitrate:streamToken:totalRemainderBitrateWeight:", v7, v24, (unint64_t)(float)((float)v13+ (float)((float)v24* (float)((float)objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", objc_msgSend(*(id *)(v8 + 2024), "numberWithInteger:", a3)), "uplinkClient"), "remainderBitrateSplitForStreamToken:", a3)
                                                    / v18))),
            a3,
            (unint64_t)v18);
    v25 = 0;
    if (objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", objc_msgSend(*(id *)(v8 + 2024), "numberWithInteger:", a3)), "uplinkClient"), "shouldCapStream:cappedBitrate:", a3, &v25)&& v13 >= v25)
    {
      v13 = v25;
    }
  }
  return (id)objc_msgSend(*(id *)(v8 + 2024), "numberWithUnsignedInteger:", v13);
}

- (unint64_t)findAndSplitExtraBitrateFromCappedStreams:(id)a3 remainderBitrate:(int64_t)a4 currentStreamGroupBitrate:(unint64_t)a5 streamToken:(int64_t)a6 totalRemainderBitrateWeight:(unint64_t)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  uint64_t i;
  void *v15;
  void *v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v24;
  unint64_t v25;
  uint64_t v28;
  id obj;
  unsigned int v31;
  _BYTE v32[128];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = (id)objc_msgSend(a3, "allKeys");
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
  if (v10)
  {
    v11 = v10;
    v24 = a6;
    v25 = a5;
    v28 = 0;
    v12 = *(_QWORD *)v34;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v16 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", v15, v24, v25), "uplinkClient");
        v17 = objc_msgSend(v16, "remainderBitrateSplitForStreamToken:", objc_msgSend(v15, "unsignedIntValue"));
        v18 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v15), "unsignedIntValue");
        v31 = 0;
        if (objc_msgSend(v16, "shouldCapStream:cappedBitrate:", objc_msgSend(v15, "unsignedIntValue"), &v31)&& (v19 = v18 + (unint64_t)v17 * a4 / a7, v20 = v19 >= v31, v21 = v19 - v31, (_DWORD)v21 != 0 && v20))
        {
          v28 += v21;
        }
        else
        {
          v13 = v13 + (float)v17;
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
    }
    while (v11);
    a6 = v24;
    a5 = v25;
    v22 = v28;
  }
  else
  {
    v22 = 0;
    v13 = 0.0;
  }
  if (v13 <= 0.0)
    v13 = 1.0;
  return (unint64_t)(float)((float)a5
                                 + (float)((float)v22
                                         * (float)((float)objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6)), "uplinkClient"), "remainderBitrateSplitForStreamToken:", a6)/ v13)));
}

- (BOOL)isStreamGroupEnabled:(unsigned int)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  BOOL v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[NSMutableDictionary allKeys](self->_streamTokenToEnableMap, "allKeys");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", v10), "streamGroupID");
        if (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToEnableMap, "objectForKeyedSubscript:", v10), "BOOLValue"))v12 = v11 == a3;
        else
          v12 = 0;
        if (v12)
        {
          LOBYTE(v6) = 1;
          return v6;
        }
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      v7 = v6;
      if (v6)
        continue;
      break;
    }
  }
  return v6;
}

- (BOOL)shouldUseMinMicBitrate:(unint64_t)a3 streamToken:(int64_t)a4 remainderBitrate:(int64_t)a5
{
  void *v9;
  unint64_t v10;

  if (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4)), "streamGroupID") != 1835623282)return 0;
  v9 = (void *)objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4)), "uplinkClient"), "qualityTierTableForStreamToken:", a4);
  v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "allKeys"), "sortedArrayUsingSelector:", sel_compare_), "firstObject")), "unsignedIntegerValue");
  return !a5 && v10 >= a3;
}

- (BOOL)shouldUseMultipleStreamGroupAlgorithm
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  int v10;
  BOOL v11;
  int v12;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableDictionary allKeys](self->_streamTokenToEnableMap, "allKeys");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v17 != v7)
        objc_enumerationMutation(v3);
      v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
      v10 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", v9), "streamGroupID");
      if (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToEnableMap, "objectForKeyedSubscript:", v9), "BOOLValue"))
      {
        if (v10 > 1935897188)
        {
          v11 = v10 == 1937339233;
          v12 = 1935897189;
        }
        else
        {
          v11 = v10 == 1650745716;
          v12 = 1718909044;
        }
        if (v11 || v10 == v12)
          v6 = 1;
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  }
  while (v5);
  return v6;
}

- (id)baseNetworkBitrateSplitForTargetBitrate:(unsigned int)a3 baseNetworkBitrate:(unint64_t *)a4
{
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend((id)-[NSMutableDictionary allKeys](self->_bandwithAllocationTable, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  v8 = objc_msgSend((id)objc_msgSend(v7, "firstObject"), "unsignedIntegerValue");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v11)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
      if (objc_msgSend(v13, "unsignedIntValue") > a3)
        break;
      v8 = objc_msgSend(v13, "unsignedIntegerValue");
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }
  *a4 = v8;
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_bandwithAllocationTable, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8));
}

+ (id)valueForNetworkBitrate:(id)a3 networkBitrate:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v4 = *(_QWORD *)&a4;
  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  v7 = objc_msgSend(v6, "count") - 1;
  v8 = +[VCArrayUtils insertionIndexForValue:array:](VCArrayUtils, "insertionIndexForValue:array:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4), v6);
  if (v7 >= v8)
    v9 = v8;
  else
    v9 = v7;
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(v6, "objectAtIndexedSubscript:", v9));
}

- (id)targetBitratesForStreamToken:(int64_t)a3 targetNetworkBitrate:(unsigned int)a4 preferNetworkBitrates:(BOOL)a5
{
  uint64_t v5;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  int v21;
  const __CFString *v22;
  uint64_t v23;
  NSObject *v24;
  char *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  NSObject *v30;
  char *v31;
  void *v32;
  void *v33;
  const __CFString *v35;
  const __CFString *v36;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  NSObject *v40;
  uint32_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  _BYTE v46[24];
  __int128 v47;
  VCSessionUplinkBandwidthAllocatorOneToOne *v48;
  __int128 v49;
  uint64_t v50;

  v5 = *(_QWORD *)&a4;
  v50 = *MEMORY[0x1E0C80C00];
  if (!a5)
  {
    if ((VCSessionUplinkBandwidthAllocatorOneToOne *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v46 = 136315650;
          *(_QWORD *)&v46[4] = v9;
          *(_WORD *)&v46[12] = 2080;
          *(_QWORD *)&v46[14] = "-[VCSessionUplinkBandwidthAllocatorOneToOne targetBitratesForStreamToken:targetNetworkBi"
                                "trate:preferNetworkBitrates:]";
          *(_WORD *)&v46[22] = 1024;
          LODWORD(v47) = 371;
          v11 = " [%s] %s:%d Media bitrate allocation not supported for U+1, calculating network bitrates";
          v12 = v10;
          v13 = 28;
LABEL_12:
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, v46, v13);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCSessionUplinkBandwidthAllocatorOneToOne performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v46 = 136316162;
          *(_QWORD *)&v46[4] = v14;
          *(_WORD *)&v46[12] = 2080;
          *(_QWORD *)&v46[14] = "-[VCSessionUplinkBandwidthAllocatorOneToOne targetBitratesForStreamToken:targetNetworkBi"
                                "trate:preferNetworkBitrates:]";
          *(_WORD *)&v46[22] = 1024;
          LODWORD(v47) = 371;
          WORD2(v47) = 2112;
          *(_QWORD *)((char *)&v47 + 6) = v8;
          HIWORD(v47) = 2048;
          v48 = self;
          v11 = " [%s] %s:%d %@(%p) Media bitrate allocation not supported for U+1, calculating network bitrates";
          v12 = v15;
          v13 = 48;
          goto LABEL_12;
        }
      }
    }
  }
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v16)
  {
    -[VCObject lock](self, "lock");
    if (-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToEnableMap, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3))&& (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToEnableMap, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3)), "BOOLValue") & 1) != 0)
    {
      if (-[VCSessionUplinkBandwidthAllocatorOneToOne shouldUseMultipleStreamGroupAlgorithm](self, "shouldUseMultipleStreamGroupAlgorithm"))
      {
        v17 = -[VCSessionUplinkBandwidthAllocatorOneToOne findBitrateSplitForStreamToken:targetBitrate:](self, "findBitrateSplitForStreamToken:targetBitrate:", a3, v5);
        goto LABEL_36;
      }
      v18 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3)), "uplinkClient");
      if (-[VCSessionUplinkBandwidthAllocatorOneToOne isStreamGroupEnabled:](self, "isStreamGroupEnabled:", 1667329381))
      {
        v19 = objc_msgSend(v18, "videoCallMicrophoneBandwidthTable");
      }
      else
      {
        v19 = objc_msgSend(v18, "microphoneOnlyBandwidthTable");
      }
      v20 = +[VCSessionUplinkBandwidthAllocatorOneToOne valueForNetworkBitrate:networkBitrate:](VCSessionUplinkBandwidthAllocatorOneToOne, "valueForNetworkBitrate:networkBitrate:", v19, v5, *(_OWORD *)v46, *(_QWORD *)&v46[16], v47, v48);
      v21 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3)), "streamGroupID");
      if ((VCSessionUplinkBandwidthAllocatorOneToOne *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_32;
        v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_32;
        v25 = FourccToCStr(v21);
        *(_DWORD *)v46 = 136315906;
        *(_QWORD *)&v46[4] = v23;
        *(_WORD *)&v46[12] = 2080;
        *(_QWORD *)&v46[14] = "-[VCSessionUplinkBandwidthAllocatorOneToOne targetBitratesForStreamToken:targetNetworkBitr"
                              "ate:preferNetworkBitrates:]";
        *(_WORD *)&v46[22] = 1024;
        LODWORD(v47) = 391;
        WORD2(v47) = 2080;
        *(_QWORD *)((char *)&v47 + 6) = v25;
        v26 = " [%s] %s:%d Calculate bitrate for streamGroup=%s";
        v27 = v24;
        v28 = 38;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v22 = (const __CFString *)-[VCSessionUplinkBandwidthAllocatorOneToOne performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v22 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_32;
        v29 = VRTraceErrorLogLevelToCSTR();
        v30 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_32;
        v31 = FourccToCStr(v21);
        *(_DWORD *)v46 = 136316418;
        *(_QWORD *)&v46[4] = v29;
        *(_WORD *)&v46[12] = 2080;
        *(_QWORD *)&v46[14] = "-[VCSessionUplinkBandwidthAllocatorOneToOne targetBitratesForStreamToken:targetNetworkBitr"
                              "ate:preferNetworkBitrates:]";
        *(_WORD *)&v46[22] = 1024;
        LODWORD(v47) = 391;
        WORD2(v47) = 2112;
        *(_QWORD *)((char *)&v47 + 6) = v22;
        HIWORD(v47) = 2048;
        v48 = self;
        LOWORD(v49) = 2080;
        *(_QWORD *)((char *)&v49 + 2) = v31;
        v26 = " [%s] %s:%d %@(%p) Calculate bitrate for streamGroup=%s";
        v27 = v30;
        v28 = 58;
      }
      _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, v26, v46, v28);
LABEL_32:
      if (v21 == 1835623282)
      {
        v32 = v16;
        v33 = v20;
LABEL_38:
        objc_msgSend(v32, "addObject:", v33, *(_QWORD *)v46, *(_OWORD *)&v46[8], v47, v48, v49);
        goto LABEL_39;
      }
      if (objc_msgSend(v20, "unsignedIntValue") >= v5)
      {
        v33 = &unk_1E9EF5150;
        goto LABEL_37;
      }
      v17 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5 - objc_msgSend(v20, "unsignedIntValue"));
LABEL_36:
      v33 = v17;
LABEL_37:
      v32 = v16;
      goto LABEL_38;
    }
    if ((VCSessionUplinkBandwidthAllocatorOneToOne *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v37 = VRTraceErrorLogLevelToCSTR();
        v38 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v46 = 136315906;
          *(_QWORD *)&v46[4] = v37;
          *(_WORD *)&v46[12] = 2080;
          *(_QWORD *)&v46[14] = "-[VCSessionUplinkBandwidthAllocatorOneToOne targetBitratesForStreamToken:targetNetworkBi"
                                "trate:preferNetworkBitrates:]";
          *(_WORD *)&v46[22] = 1024;
          LODWORD(v47) = 381;
          WORD2(v47) = 2048;
          *(_QWORD *)((char *)&v47 + 6) = a3;
          v39 = " [%s] %s:%d StreamToken=%ld is disabled";
          v40 = v38;
          v41 = 38;
LABEL_54:
          _os_log_impl(&dword_1D8A54000, v40, OS_LOG_TYPE_DEFAULT, v39, v46, v41);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v35 = (const __CFString *)-[VCSessionUplinkBandwidthAllocatorOneToOne performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v35 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v42 = VRTraceErrorLogLevelToCSTR();
        v43 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v46 = 136316418;
          *(_QWORD *)&v46[4] = v42;
          *(_WORD *)&v46[12] = 2080;
          *(_QWORD *)&v46[14] = "-[VCSessionUplinkBandwidthAllocatorOneToOne targetBitratesForStreamToken:targetNetworkBi"
                                "trate:preferNetworkBitrates:]";
          *(_WORD *)&v46[22] = 1024;
          LODWORD(v47) = 381;
          WORD2(v47) = 2112;
          *(_QWORD *)((char *)&v47 + 6) = v35;
          HIWORD(v47) = 2048;
          v48 = self;
          LOWORD(v49) = 2048;
          *(_QWORD *)((char *)&v49 + 2) = a3;
          v39 = " [%s] %s:%d %@(%p) StreamToken=%ld is disabled";
          v40 = v43;
          v41 = 58;
          goto LABEL_54;
        }
      }
    }
  }
  else if ((VCSessionUplinkBandwidthAllocatorOneToOne *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionUplinkBandwidthAllocatorOneToOne targetBitratesForStreamToken:targetNetworkBitrate:preferNetworkBitrates:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v36 = (const __CFString *)-[VCSessionUplinkBandwidthAllocatorOneToOne performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v36 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v44 = VRTraceErrorLogLevelToCSTR();
      v45 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v46 = 136316162;
        *(_QWORD *)&v46[4] = v44;
        *(_WORD *)&v46[12] = 2080;
        *(_QWORD *)&v46[14] = "-[VCSessionUplinkBandwidthAllocatorOneToOne targetBitratesForStreamToken:targetNetworkBitr"
                              "ate:preferNetworkBitrates:]";
        *(_WORD *)&v46[22] = 1024;
        LODWORD(v47) = 377;
        WORD2(v47) = 2112;
        *(_QWORD *)((char *)&v47 + 6) = v36;
        HIWORD(v47) = 2048;
        v48 = self;
        _os_log_error_impl(&dword_1D8A54000, v45, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate media bitrate array", v46, 0x30u);
      }
    }
  }
LABEL_39:
  -[VCObject unlock](self, "unlock", *(_QWORD *)v46, *(_OWORD *)&v46[8], v47, v48, v49);
  return v16;
}

- (id)streamIDsIfStreamTokenIsEnabled:(int64_t)a3
{
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int64_t v22;
  __int16 v23;
  VCSessionUplinkBandwidthAllocatorOneToOne *v24;
  __int16 v25;
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToEnableMap, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3))&& objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToEnableMap, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3)), "BOOLValue"))
  {
    objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3)), "streamID")));
    return v5;
  }
  if ((VCSessionUplinkBandwidthAllocatorOneToOne *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315906;
        v16 = v7;
        v17 = 2080;
        v18 = "-[VCSessionUplinkBandwidthAllocatorOneToOne streamIDsIfStreamTokenIsEnabled:]";
        v19 = 1024;
        v20 = 413;
        v21 = 2048;
        v22 = a3;
        v9 = " [%s] %s:%d StreamToken=%ld is disabled";
        v10 = v8;
        v11 = 38;
LABEL_14:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCSessionUplinkBandwidthAllocatorOneToOne performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136316418;
        v16 = v12;
        v17 = 2080;
        v18 = "-[VCSessionUplinkBandwidthAllocatorOneToOne streamIDsIfStreamTokenIsEnabled:]";
        v19 = 1024;
        v20 = 413;
        v21 = 2112;
        v22 = (int64_t)v6;
        v23 = 2048;
        v24 = self;
        v25 = 2048;
        v26 = a3;
        v9 = " [%s] %s:%d %@(%p) StreamToken=%ld is disabled";
        v10 = v13;
        v11 = 58;
        goto LABEL_14;
      }
    }
  }
  return v5;
}

- (id)streamIDsForStreamToken:(int64_t)a3 targetBitrate:(unsigned int)a4
{
  uint64_t v4;
  id v7;

  v4 = *(_QWORD *)&a4;
  -[VCObject lock](self, "lock");
  if (-[VCSessionUplinkBandwidthAllocatorOneToOne shouldUseMultipleStreamGroupAlgorithm](self, "shouldUseMultipleStreamGroupAlgorithm")&& !objc_msgSend(-[VCSessionUplinkBandwidthAllocatorOneToOne findBitrateSplitForStreamToken:targetBitrate:](self, "findBitrateSplitForStreamToken:targetBitrate:", a3, v4), "intValue"))
  {
    -[VCObject unlock](self, "unlock");
    return (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  }
  else
  {
    v7 = -[VCSessionUplinkBandwidthAllocatorOneToOne streamIDsIfStreamTokenIsEnabled:](self, "streamIDsIfStreamTokenIsEnabled:", a3);
    -[VCObject unlock](self, "unlock");
    return v7;
  }
}

- (BOOL)isCamera1080pAvailable
{
  return 1;
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate bandwith allocation map", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)targetBitratesForStreamToken:targetNetworkBitrate:preferNetworkBitrates:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate media bitrate array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
