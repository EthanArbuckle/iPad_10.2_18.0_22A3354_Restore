@implementation VCSessionBandwidthAllocationTable

- (VCSessionBandwidthAllocationTable)initWithType:(unsigned __int8)a3
{
  VCSessionBandwidthAllocationTable *v4;
  VCSessionBandwidthAllocationTable *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCSessionBandwidthAllocationTable;
  v4 = -[VCObject init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    v4->_streamTokenEntries = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5->_streamIDToEntryTable = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5->_maxActiveScreenEncoders = +[VCHardwareSettings maxActiveScreenEncoders](VCHardwareSettings, "maxActiveScreenEncoders");
    v5->_maxActiveCameraEncoders = +[VCHardwareSettings maxActiveVideoEncoders](VCHardwareSettings, "maxActiveVideoEncoders");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionBandwidthAllocationTable;
  -[VCObject dealloc](&v3, sel_dealloc);
}

- (id)entryForStreamID:(id)a3
{
  if (a3)
    return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamIDToEntryTable, "objectForKeyedSubscript:");
  else
    return 0;
}

- (void)addBandwidthAllocationTableEntry:(id)a3
{
  VCSessionBandwidthAllocationTableStreamInfo *v5;

  v5 = (VCSessionBandwidthAllocationTableStreamInfo *)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenEntries, "objectForKeyedSubscript:", objc_msgSend(a3, "streamToken"));
  if (!v5)
  {
    v5 = objc_alloc_init(VCSessionBandwidthAllocationTableStreamInfo);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamTokenEntries, "setObject:forKeyedSubscript:", v5, objc_msgSend(a3, "streamToken"));

  }
  -[VCSessionBandwidthAllocationTableStreamInfo addTableEntry:](v5, "addTableEntry:", a3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamIDToEntryTable, "setObject:forKeyedSubscript:", a3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "streamID")));
}

- (id)tableEntriesForStreamToken:(int64_t)a3
{
  return (id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenEntries, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3)), "sortedEntries");
}

- (BOOL)shouldUseRepairBitrateForEntry:(id)a3 isRedundancyEnabled:(BOOL)a4 isRedundancyEnabledFor720Stream:(BOOL)a5
{
  int v7;

  if (a4)
  {
    v7 = objc_msgSend(a3, "hasRepairStreamID");
    if (v7)
      LOBYTE(v7) = objc_msgSend(a3, "qualityIndex") != 1000 || a5;
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (id)newAggregatedBandwidthTableWithRedundancy:(BOOL)a3 redundancyEnabledFor720Stream:(BOOL)a4 enableMap:(id)a5 is1080pCameraAvailable:(BOOL)a6
{
  uint64_t v6;
  uint64_t v8;
  id v10;
  id v11;
  NSMutableDictionary *streamTokenEntries;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  int v25;
  int v26;
  const __CFString *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  uint64_t v34;
  NSObject *v35;
  id v37;
  id v38;
  unsigned int v39;
  unsigned int v40;
  VCSessionBandwidthAllocationTable *v41;
  _BOOL4 v42;
  id v43;
  void *v44;
  id obj;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int v50;
  _QWORD v51[7];
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  const __CFString *v59;
  __int16 v60;
  VCSessionBandwidthAllocationTable *v61;
  __int16 v62;
  int v63;
  _BYTE v64[128];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;

  v6 = a6;
  v42 = a4;
  v8 = a3;
  v74 = *MEMORY[0x1E0C80C00];
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  streamTokenEntries = self->_streamTokenEntries;
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __142__VCSessionBandwidthAllocationTable_newAggregatedBandwidthTableWithRedundancy_redundancyEnabledFor720Stream_enableMap_is1080pCameraAvailable___block_invoke;
  v51[3] = &unk_1E9E58A00;
  v51[4] = v11;
  v51[5] = a5;
  v51[6] = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](streamTokenEntries, "enumerateKeysAndObjectsUsingBlock:", v51);
  v13 = (void *)objc_msgSend((id)objc_msgSend(v10, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  v43 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v50 = 0;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = v13;
  v48 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v70, v69, 16);
  if (v48)
  {
    v47 = *(_QWORD *)v71;
    v41 = self;
    v39 = v6;
    v40 = v8;
    v37 = v14;
    v38 = v10;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v71 != v47)
          objc_enumerationMutation(obj);
        v49 = v15;
        v16 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v15);
        v17 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", v16);
        if (!objc_msgSend(v17, "isStartOnDemand")
          || (objc_msgSend(v17, "isSubscribedTo") & 1) != 0
          || -[VCSessionBandwidthAllocationTable shouldAddBackupEntry:referenceTable:referenceQualityIndices:](self, "shouldAddBackupEntry:referenceTable:referenceQualityIndices:", v16, v10, obj))
        {
          v18 = objc_msgSend(v11, "objectForKeyedSubscript:", objc_msgSend(v17, "streamToken"));
          -[VCSessionBandwidthAllocationTable cleanupStreamTokenEntries:currentNetworkBitrate:isRedundancyEnabled:appendedVideoEncoderGroups:](self, "cleanupStreamTokenEntries:currentNetworkBitrate:isRedundancyEnabled:appendedVideoEncoderGroups:", v18, &v50, v8, v14);
          if (-[VCSessionBandwidthAllocationTable shouldAppendEntry:appendedVideoEncoderGroups:is1080pCameraAvailable:](self, "shouldAppendEntry:appendedVideoEncoderGroups:is1080pCameraAvailable:", v17, v14, v6))
          {
            v44 = v17;
            v46 = -[VCSessionBandwidthAllocationTable shouldUseRepairBitrateForEntry:isRedundancyEnabled:isRedundancyEnabledFor720Stream:](self, "shouldUseRepairBitrateForEntry:isRedundancyEnabled:isRedundancyEnabledFor720Stream:", v17, v8, v42);
            -[VCSessionBandwidthAllocationTable appendEntry:streamTokenEntries:currentNetworkBitrate:shouldUseRepairBitrate:appendedVideoEncoderGroups:](self, "appendEntry:streamTokenEntries:currentNetworkBitrate:shouldUseRepairBitrate:appendedVideoEncoderGroups:", v17, v18, &v50);
            v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v65 = 0u;
            v66 = 0u;
            v67 = 0u;
            v68 = 0u;
            v20 = (void *)-[NSMutableDictionary allKeys](self->_streamTokenEntries, "allKeys");
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v65, v64, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v66;
              do
              {
                for (i = 0; i != v22; ++i)
                {
                  if (*(_QWORD *)v66 != v23)
                    objc_enumerationMutation(v20);
                  objc_msgSend(v19, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", objc_msgSend(v11, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i))), *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i));
                }
                v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v65, v64, 16);
              }
              while (v22);
            }
            objc_msgSend(v43, "setObject:forKeyedSubscript:", v19, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v50));
            if (!v46)
            {
              v25 = objc_msgSend(v44, "maxNetworkBitrate");
              v26 = objc_msgSend(v44, "minNetworkBitrate");
              v50 += v25 - v26;
            }

            self = v41;
            v6 = v39;
            v8 = v40;
            v14 = v37;
            v10 = v38;
          }
        }
        v15 = v49 + 1;
      }
      while (v49 + 1 != v48);
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v69, 16);
    }
    while (v48);
  }

  if ((VCSessionBandwidthAllocationTable *)objc_opt_class() == self)
  {
    v28 = v43;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v29 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v53 = v29;
        v54 = 2080;
        v55 = "-[VCSessionBandwidthAllocationTable newAggregatedBandwidthTableWithRedundancy:redundancyEnabledFor720Strea"
              "m:enableMap:is1080pCameraAvailable:]";
        v56 = 1024;
        v57 = 178;
        v58 = 1024;
        LODWORD(v59) = v8;
        v31 = " [%s] %s:%d Recomputed tier table. isRedundancyEnabled=%d";
        v32 = v30;
        v33 = 34;
LABEL_32:
        _os_log_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v27 = (const __CFString *)-[VCSessionBandwidthAllocationTable performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v27 = &stru_1E9E58EE0;
    v28 = v43;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v34 = VRTraceErrorLogLevelToCSTR();
      v35 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v53 = v34;
        v54 = 2080;
        v55 = "-[VCSessionBandwidthAllocationTable newAggregatedBandwidthTableWithRedundancy:redundancyEnabledFor720Strea"
              "m:enableMap:is1080pCameraAvailable:]";
        v56 = 1024;
        v57 = 178;
        v58 = 2112;
        v59 = v27;
        v60 = 2048;
        v61 = self;
        v62 = 1024;
        v63 = v8;
        v31 = " [%s] %s:%d %@(%p) Recomputed tier table. isRedundancyEnabled=%d";
        v32 = v35;
        v33 = 54;
        goto LABEL_32;
      }
    }
  }
  -[VCSessionBandwidthAllocationTable printTable:](self, "printTable:", v28);
  return v28;
}

uint64_t __142__VCSessionBandwidthAllocationTable_newAggregatedBandwidthTableWithRedundancy_redundancyEnabledFor720Stream_enableMap_is1080pCameraAvailable___block_invoke(id *a1, uint64_t a2, void *a3)
{
  uint64_t result;

  if (!objc_msgSend(a1[4], "objectForKeyedSubscript:", a2))
    objc_msgSend(a1[4], "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"), a2);
  result = objc_msgSend((id)objc_msgSend(a1[5], "objectForKeyedSubscript:", a2), "BOOLValue");
  if ((_DWORD)result)
    return objc_msgSend(a1[6], "addEntriesFromDictionary:", objc_msgSend(a3, "qualityIndexToTableEntry"));
  return result;
}

- (BOOL)shouldAppendEntry:(id)a3 appendedVideoEncoderGroups:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t i;
  int *v12;
  VCSessionBandwidthAllocationTable *v13;
  unsigned int v14;
  void *v15;
  BOOL result;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  _BOOL4 v26;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  _BYTE v35[10];
  VCSessionBandwidthAllocationTable *v36;
  __int16 v37;
  unsigned int v38;
  __int16 v39;
  int v40;
  _BYTE v41[128];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v6 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "streamGroupID")));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v43 != v10)
          objc_enumerationMutation(v6);
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "streamGroupID"))), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i)), "count"))
        {
          ++v9;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v41, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  if (objc_msgSend(a3, "streamGroupID") == 1935897189)
  {
    v12 = &OBJC_IVAR___VCSessionBandwidthAllocationTable__maxActiveScreenEncoders;
    v13 = self;
  }
  else
  {
    v13 = self;
    if (objc_msgSend(a3, "streamGroupID") != 1667329381)
    {
      v14 = -1;
      goto LABEL_18;
    }
    v12 = &OBJC_IVAR___VCSessionBandwidthAllocationTable__maxActiveCameraEncoders;
  }
  v14 = *(_DWORD *)((char *)&v13->super.super.isa + *v12);
LABEL_18:
  if (v9 < v14)
    return 1;
  v15 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "streamGroupID")));
  if (objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "encoderGroupID"))), "count"))
  {
    return 1;
  }
  if ((VCSessionBandwidthAllocationTable *)objc_opt_class() == v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v20)
    {
      *(_DWORD *)buf = 136316162;
      v29 = v18;
      v30 = 2080;
      v31 = "-[VCSessionBandwidthAllocationTable shouldAppendEntry:appendedVideoEncoderGroups:]";
      v32 = 1024;
      v33 = 205;
      v34 = 1024;
      *(_DWORD *)v35 = v9;
      *(_WORD *)&v35[4] = 1024;
      *(_DWORD *)&v35[6] = objc_msgSend(a3, "qualityIndex");
      v21 = " [%s] %s:%d Reached max screen encoders=%d Not adding streamQualityIndex=%d";
      v22 = v19;
      v23 = 40;
LABEL_32:
      _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      return 0;
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)-[VCSessionBandwidthAllocationTable performSelector:](v13, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v24 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    v26 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v26)
    {
      *(_DWORD *)buf = 136316674;
      v29 = v24;
      v30 = 2080;
      v31 = "-[VCSessionBandwidthAllocationTable shouldAppendEntry:appendedVideoEncoderGroups:]";
      v32 = 1024;
      v33 = 205;
      v34 = 2112;
      *(_QWORD *)v35 = v17;
      *(_WORD *)&v35[8] = 2048;
      v36 = v13;
      v37 = 1024;
      v38 = v9;
      v39 = 1024;
      v40 = objc_msgSend(a3, "qualityIndex");
      v21 = " [%s] %s:%d %@(%p) Reached max screen encoders=%d Not adding streamQualityIndex=%d";
      v22 = v25;
      v23 = 60;
      goto LABEL_32;
    }
  }
  return result;
}

- (BOOL)shouldAppendEntry:(id)a3 appendedVideoEncoderGroups:(id)a4 is1080pCameraAvailable:(BOOL)a5
{
  uint64_t v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "streamGroupID") != 1667329381
    || objc_msgSend(a3, "qualityIndex") != 1800
    || a5)
  {
    return -[VCSessionBandwidthAllocationTable shouldAppendEntry:appendedVideoEncoderGroups:](self, "shouldAppendEntry:appendedVideoEncoderGroups:", a3, a4);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315906;
      v13 = v9;
      v14 = 2080;
      v15 = "-[VCSessionBandwidthAllocationTable shouldAppendEntry:appendedVideoEncoderGroups:is1080pCameraAvailable:]";
      v16 = 1024;
      v17 = 219;
      v18 = 1024;
      v19 = objc_msgSend(a3, "qualityIndex");
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping stream [1080x1080] with qualityIndex=%d as camera doesn't support", (uint8_t *)&v12, 0x22u);
    }
  }
  return 0;
}

- (void)cleanupStreamTokenEntries:(id)a3 currentNetworkBitrate:(unsigned int *)a4 isRedundancyEnabled:(BOOL)a5 appendedVideoEncoderGroups:(id)a6
{
  _BOOL4 v7;
  void *v10;
  int v11;
  void *v12;
  void *v13;

  v7 = a5;
  v10 = (void *)objc_msgSend(a3, "lastObject");
  if (objc_msgSend(v10, "isStartOnDemand") && (objc_msgSend(v10, "isSubscribedTo") & 1) == 0)
  {
    if (v7 && objc_msgSend(v10, "hasRepairStreamID"))
      v11 = objc_msgSend(v10, "repairMaxNetworkBitrate");
    else
      v11 = objc_msgSend(v10, "maxNetworkBitrate");
    *a4 -= v11;
    if (objc_msgSend(v10, "streamGroupID") == 1935897189
      || objc_msgSend(v10, "streamGroupID") == 1667329381)
    {
      v12 = (void *)objc_msgSend(a6, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "streamGroupID")));
      v13 = (void *)objc_msgSend(v12, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "encoderGroupID")));
      objc_msgSend(v13, "removeObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "streamID")));
    }
    objc_msgSend(a3, "removeLastObject");
  }
}

- (void)appendEntry:(id)a3 streamTokenEntries:(id)a4 currentNetworkBitrate:(unsigned int *)a5 shouldUseRepairBitrate:(BOOL)a6 appendedVideoEncoderGroups:(id)a7
{
  _BOOL4 v8;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a6;
  objc_msgSend(a4, "addObject:");
  if (v8)
    v11 = objc_msgSend(a3, "repairMaxNetworkBitrate");
  else
    v11 = objc_msgSend(a3, "minNetworkBitrate");
  *a5 += v11;
  if (objc_msgSend(a3, "streamGroupID") == 1935897189
    || objc_msgSend(a3, "streamGroupID") == 1667329381)
  {
    if (!objc_msgSend(a7, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "streamGroupID"))))
    {
      v12 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      objc_msgSend(a7, "setObject:forKeyedSubscript:", v12, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "streamGroupID")));
    }
    v13 = (void *)objc_msgSend(a7, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "streamGroupID")));
    if (!objc_msgSend(v13, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "encoderGroupID"))))
    {
      v14 = objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v15 = (void *)objc_msgSend(a7, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "streamGroupID")));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "encoderGroupID")));
    }
    v16 = (void *)objc_msgSend(a7, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "streamGroupID")));
    v17 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "encoderGroupID")));
    objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "streamID")));
  }
}

- (BOOL)shouldAddBackupEntry:(id)a3 referenceTable:(id)a4 referenceQualityIndices:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v19;
    v12 = 1;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(a5);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
        v15 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", v14);
        if (objc_msgSend(v14, "isEqualToNumber:", a3))
        {
          v10 = objc_msgSend(v15, "streamToken");
LABEL_8:
          v12 = 0;
          goto LABEL_11;
        }
        if ((v12 & 1) == 0)
        {
          if (objc_msgSend((id)objc_msgSend(v15, "streamToken"), "isEqualToNumber:", v10)
            && (!objc_msgSend(v15, "isStartOnDemand") || (objc_msgSend(v15, "isSubscribedTo") & 1) != 0))
          {
            LOBYTE(v8) = 1;
            return v8;
          }
          goto LABEL_8;
        }
        v12 = 1;
LABEL_11:
        ++v13;
      }
      while (v9 != v13);
      v8 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
      v9 = v8;
    }
    while (v8);
  }
  return v8;
}

- (void)printTable:(id)a3
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v19;
  id obj;
  _QWORD v22[6];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  VCSessionBandwidthAllocationTable *v32;
  _BYTE v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = (id)objc_msgSend(a3, "allKeys");
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v35;
    *(_QWORD *)&v5 = 136315650;
    v19 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        v10 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", v9, v19);
        if ((VCSessionBandwidthAllocationTable *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v17 = VRTraceErrorLogLevelToCSTR();
            v18 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v19;
              v24 = v17;
              v25 = 2080;
              v26 = "-[VCSessionBandwidthAllocationTable printTable:]";
              v27 = 1024;
              v28 = 299;
              v14 = v18;
              v15 = " [%s] %s:%d Printing Table ########### ";
              v16 = 28;
              goto LABEL_15;
            }
          }
        }
        else
        {
          v11 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v11 = (const __CFString *)-[VCSessionBandwidthAllocationTable performSelector:](self, "performSelector:", sel_logPrefix);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v12 = VRTraceErrorLogLevelToCSTR();
            v13 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v24 = v12;
              v25 = 2080;
              v26 = "-[VCSessionBandwidthAllocationTable printTable:]";
              v27 = 1024;
              v28 = 299;
              v29 = 2112;
              v30 = v11;
              v31 = 2048;
              v32 = self;
              v14 = v13;
              v15 = " [%s] %s:%d %@(%p) Printing Table ########### ";
              v16 = 48;
LABEL_15:
              _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, v16);
            }
          }
        }
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __48__VCSessionBandwidthAllocationTable_printTable___block_invoke;
        v22[3] = &unk_1E9E58A28;
        v22[4] = self;
        v22[5] = v9;
        objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v22);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
    }
    while (v6);
  }
}

void __48__VCSessionBandwidthAllocationTable_printTable___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(const __CFString **)(a1 + 40);
        v17 = 136316418;
        v18 = v7;
        v19 = 2080;
        v20 = "-[VCSessionBandwidthAllocationTable printTable:]_block_invoke";
        v21 = 1024;
        v22 = 301;
        v23 = 2112;
        v24 = v9;
        v25 = 2112;
        v26 = a2;
        v27 = 2112;
        v28 = a3;
        v10 = " [%s] %s:%d Bandwidth %@, streamToken:%@, %@";
        v11 = v8;
        v12 = 58;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(a1 + 32);
        v16 = *(_QWORD *)(a1 + 40);
        v17 = 136316930;
        v18 = v13;
        v19 = 2080;
        v20 = "-[VCSessionBandwidthAllocationTable printTable:]_block_invoke";
        v21 = 1024;
        v22 = 301;
        v23 = 2112;
        v24 = v6;
        v25 = 2048;
        v26 = v15;
        v27 = 2112;
        v28 = v16;
        v29 = 2112;
        v30 = a2;
        v31 = 2112;
        v32 = a3;
        v10 = " [%s] %s:%d %@(%p) Bandwidth %@, streamToken:%@, %@";
        v11 = v14;
        v12 = 78;
        goto LABEL_11;
      }
    }
  }
}

- (NSDictionary)audioOnlyBitrateToStreamIDsTable
{
  return self->_audioOnlyBitrateToStreamIDsTable;
}

- (NSDictionary)audioVideoBitrateToStreamIDsTable
{
  return self->_audioVideoBitrateToStreamIDsTable;
}

- (NSDictionary)videoOnlyBitrateToStreamIDsTable
{
  return self->_videoOnlyBitrateToStreamIDsTable;
}

- (NSDictionary)videoStreamIdToRepairStreamIdMap
{
  return self->_videoStreamIdToRepairStreamIdMap;
}

@end
