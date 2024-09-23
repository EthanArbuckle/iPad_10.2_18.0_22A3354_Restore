@implementation VCSessionDownlinkBandwidthAllocator

- (VCSessionDownlinkBandwidthAllocator)initWithReportingAgent:(opaqueRTCReporting *)a3
{
  VCSessionDownlinkBandwidthAllocator *v4;
  NSObject *CustomRootQueue;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCSessionDownlinkBandwidthAllocator;
  v4 = -[VCSessionDownlinkBandwidthAllocator init](&v7, sel_init);
  if (v4)
  {
    v4->_clients = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4->_reportingAgent = a3;
    if (a3)
      CFRetain(a3);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v4->_clientQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.DOWN.VCBandwidth.clientQueue", 0, CustomRootQueue);
    v4->_sortedMediaEntries = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4->_allocatedMediaEntriesForClients = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4->_selectedMediaEntriesForClients = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4->_maxConcurrentVideoClients = -[VCHardwareSettingsEmbedded maxActiveVideoDecoders](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "maxActiveVideoDecoders");
  }
  return v4;
}

- (void)dealloc
{
  opaqueRTCReporting *reportingAgent;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];

  dispatch_release((dispatch_object_t)self->_clientQueue);
  reportingAgent = self->_reportingAgent;
  if (reportingAgent)
    CFRelease(reportingAgent);
  v4.receiver = self;
  v4.super_class = (Class)VCSessionDownlinkBandwidthAllocator;
  -[VCSessionDownlinkBandwidthAllocator dealloc](&v4, sel_dealloc);
}

+ (id)sortMediaEntriesGroupIds:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a3);
  if (objc_msgSend(a3, "containsObject:", &unk_1E9EF64A0))
    objc_msgSend(v4, "addObject:", &unk_1E9EF64A0);
  if (objc_msgSend(a3, "containsObject:", &unk_1E9EF64B8))
    objc_msgSend(v4, "addObject:", &unk_1E9EF64B8);
  if (objc_msgSend(a3, "containsObject:", &unk_1E9EF64D0))
    objc_msgSend(v4, "addObject:", &unk_1E9EF64D0);
  if (objc_msgSend(a3, "containsObject:", &unk_1E9EF64E8))
    objc_msgSend(v4, "addObject:", &unk_1E9EF64E8);
  objc_msgSend(v5, "removeObjectsInArray:", v4);
  objc_msgSend(v5, "sortUsingSelector:", sel_compare_);
  objc_msgSend(v4, "addObjectsFromArray:", v5);
  return v4;
}

- (void)sortMediaEntries
{
  VCSessionDownlinkBandwidthAllocator *v2;
  id v3;
  __int128 v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  uint64_t v14;
  id v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t k;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  NSObject *v39;
  NSMutableArray *v40;
  NSObject *v41;
  const char *v42;
  uint32_t v43;
  uint64_t v44;
  NSObject *v45;
  NSMutableArray *sortedMediaEntries;
  __int128 v47;
  NSMutableArray *obj;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  VCSessionDownlinkBandwidthAllocator *v52;
  void *v53;
  uint64_t v54;
  _BYTE v55[128];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  const char *v63;
  __int16 v64;
  int v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  VCSessionDownlinkBandwidthAllocator *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  _BYTE v74[128];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;

  v2 = self;
  v84 = *MEMORY[0x1E0C80C00];
  -[VCSessionDownlinkBandwidthAllocator reset](self, "reset");
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = v2->_clients;
  v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v80, v79, 16);
  v52 = v2;
  if (!v51)
  {
    v49 = 0;
    goto LABEL_31;
  }
  v49 = 0;
  v50 = *(_QWORD *)v81;
  *(_QWORD *)&v4 = 136316162;
  v47 = v4;
  do
  {
    for (i = 0; i != v51; ++i)
    {
      if (*(_QWORD *)v81 != v50)
        objc_enumerationMutation(obj);
      v6 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
      v75 = 0u;
      v76 = 0u;
      v77 = 0u;
      v78 = 0u;
      v53 = v6;
      v7 = (void *)objc_msgSend(v6, "mediaEntries", v47);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v75, v74, 16);
      if (v8)
      {
        v9 = v8;
        v54 = i;
        v10 = 0;
        v11 = *(_QWORD *)v76;
        do
        {
          for (j = 0; j != v9; ++j)
          {
            if (*(_QWORD *)v76 != v11)
              objc_enumerationMutation(v7);
            v13 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
            v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v13, "streamGroupID"));
            v15 = (id)objc_msgSend(v3, "objectForKeyedSubscript:", v14);
            if (!v15)
            {
              v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, v14);

            }
            v10 |= objc_msgSend(v13, "type") == 1;
            objc_msgSend(v15, "addObject:", v13);
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v75, v74, 16);
        }
        while (v9);
        i = v54;
        if ((v10 & 1) != 0)
        {
          ++v49;
          v2 = v52;
          continue;
        }
      }
      v2 = v52;
      if ((VCSessionDownlinkBandwidthAllocator *)objc_opt_class() == v52)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v24 = VRTraceErrorLogLevelToCSTR();
          v25 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v26 = objc_msgSend(v53, "uuid");
            v27 = objc_msgSend(v53, "mediaEntries");
            *(_DWORD *)buf = v47;
            v61 = v24;
            v62 = 2080;
            v63 = "-[VCSessionDownlinkBandwidthAllocator sortMediaEntries]";
            v64 = 1024;
            v65 = 122;
            v66 = 2112;
            v67 = v26;
            v68 = 2112;
            v69 = (VCSessionDownlinkBandwidthAllocator *)v27;
            v21 = v25;
            v22 = "VCBandwidth [%s] %s:%d No audio entry for client=%@ mediaEntries=%@";
            v23 = 48;
            goto LABEL_26;
          }
        }
      }
      else
      {
        v16 = &stru_1E9E58EE0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v16 = (const __CFString *)-[VCSessionDownlinkBandwidthAllocator performSelector:](v52, "performSelector:", sel_logPrefix);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v17 = VRTraceErrorLogLevelToCSTR();
          v18 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v19 = objc_msgSend(v53, "uuid");
            v20 = objc_msgSend(v53, "mediaEntries");
            *(_DWORD *)buf = 136316674;
            v61 = v17;
            v62 = 2080;
            v63 = "-[VCSessionDownlinkBandwidthAllocator sortMediaEntries]";
            v64 = 1024;
            v65 = 122;
            v66 = 2112;
            v67 = (uint64_t)v16;
            v68 = 2048;
            v69 = v52;
            v70 = 2112;
            v71 = v19;
            v72 = 2112;
            v73 = v20;
            v21 = v18;
            v22 = "VCBandwidth [%s] %s:%d %@(%p) No audio entry for client=%@ mediaEntries=%@";
            v23 = 68;
LABEL_26:
            _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, v23);
            continue;
          }
        }
      }
    }
    v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v80, v79, 16);
  }
  while (v51);
LABEL_31:
  v28 = +[VCSessionDownlinkBandwidthAllocator sortMediaEntriesGroupIds:](VCSessionDownlinkBandwidthAllocator, "sortMediaEntriesGroupIds:", objc_msgSend(v3, "allKeys"));
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v56, v55, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v57;
    v32 = v49;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v57 != v31)
          objc_enumerationMutation(v28);
        v34 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * k));
        objc_msgSend(v34, "sortUsingSelector:", sel_compare_);
        -[NSMutableArray addObjectsFromArray:](v2->_sortedMediaEntries, "addObjectsFromArray:", v34);
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v56, v55, 16);
    }
    while (v30);
  }
  else
  {
    v32 = v49;
  }
  -[NSMutableArray sortUsingSelector:](v2->_sortedMediaEntries, "sortUsingSelector:", sel_compare_);
  if (v32)
  {
    v35 = 0;
    v36 = v32;
    do
    {
      if (objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](v2->_sortedMediaEntries, "objectAtIndexedSubscript:", v35), "type") != 1)
      {
        if ((VCSessionDownlinkBandwidthAllocator *)objc_opt_class() == v52)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 5)
            goto LABEL_53;
          v44 = VRTraceErrorLogLevelToCSTR();
          v45 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_53;
          sortedMediaEntries = v52->_sortedMediaEntries;
          *(_DWORD *)buf = 136315906;
          v61 = v44;
          v62 = 2080;
          v63 = "-[VCSessionDownlinkBandwidthAllocator sortMediaEntries]";
          v64 = 1024;
          v65 = 140;
          v66 = 2112;
          v67 = (uint64_t)sortedMediaEntries;
          v41 = v45;
          v42 = "VCBandwidth [%s] %s:%d Missing audio entries in sortedMediaEntries=%@";
          v43 = 38;
        }
        else
        {
          v37 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v37 = (const __CFString *)-[VCSessionDownlinkBandwidthAllocator performSelector:](v52, "performSelector:", sel_logPrefix);
          if ((int)VRTraceGetErrorLogLevelForModule() < 5)
            goto LABEL_53;
          v38 = VRTraceErrorLogLevelToCSTR();
          v39 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_53;
          v40 = v52->_sortedMediaEntries;
          *(_DWORD *)buf = 136316418;
          v61 = v38;
          v62 = 2080;
          v63 = "-[VCSessionDownlinkBandwidthAllocator sortMediaEntries]";
          v64 = 1024;
          v65 = 140;
          v66 = 2112;
          v67 = (uint64_t)v37;
          v68 = 2048;
          v69 = v52;
          v70 = 2112;
          v71 = (uint64_t)v40;
          v41 = v39;
          v42 = "VCBandwidth [%s] %s:%d %@(%p) Missing audio entries in sortedMediaEntries=%@";
          v43 = 58;
        }
        _os_log_impl(&dword_1D8A54000, v41, OS_LOG_TYPE_DEFAULT, v42, buf, v43);
      }
LABEL_53:
      ++v35;
      v2 = v52;
    }
    while (v36 != v35);
  }

}

- (unsigned)requiredAudioBitrate:(unsigned int)a3 highestAudioBitrates:(id)a4
{
  uint64_t v6;

  v6 = objc_msgSend(a4, "count");
  if (v6)
  {
    if (objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", 0), "unsignedIntValue") >= a3)
      LODWORD(v6) = 0;
    else
      LODWORD(v6) = a3 - objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", 0), "unsignedIntValue");
  }
  return v6;
}

- (void)updateHighestAudioBitrates:(id)a3 bitrate:(unsigned int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  if (-[VCSessionDownlinkBandwidthAllocator requiredAudioBitrate:highestAudioBitrates:](self, "requiredAudioBitrate:highestAudioBitrates:", *(_QWORD *)&a4, a3))
  {
    objc_msgSend(a3, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4), 0);
    objc_msgSend(a3, "sortUsingSelector:", sel_compare_);
  }
}

- (unint64_t)simultaneousTalkers
{
  unint64_t v3;
  unsigned int v4;
  unint64_t result;
  unint64_t v6;

  v3 = -[NSMutableArray count](self->_clients, "count");
  v4 = -[VCDefaults minParticipantCountSendVoiceActiveOnly](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "minParticipantCountSendVoiceActiveOnly");
  result = -[NSMutableArray count](self->_clients, "count");
  v6 = (result + 1) >> 1;
  if ((int)v6 >= 4)
    LODWORD(v6) = 4;
  if (v3 >= v4)
    return (int)v6;
  return result;
}

- (id)distributeBitrate:(unsigned int)a3
{
  NSObject *clientQueue;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD block[6];
  unsigned int v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (self->_forceFullBandwidth)
    a3 = 2000000;
  if (!a3)
    return 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3052000000;
  v28 = __Block_byref_object_copy__31;
  v29 = __Block_byref_object_dispose__31;
  v30 = 0;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__VCSessionDownlinkBandwidthAllocator_distributeBitrate___block_invoke;
  block[3] = &unk_1E9E54D70;
  v24 = a3;
  block[4] = self;
  block[5] = &v25;
  dispatch_sync(clientQueue, block);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v32 = v5;
      v33 = 2080;
      v34 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]";
      v35 = 1024;
      v36 = 310;
      v37 = 1024;
      LODWORD(v38) = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCBandwidth [%s] %s:%d bitrate=%d, selectedMediaEntries", buf, 0x22u);
    }
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = (id)v26[5];
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
  if (v7)
  {
    v20 = *(_QWORD *)v46;
    do
    {
      v8 = 0;
      v21 = v7;
      do
      {
        if (*(_QWORD *)v46 != v20)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v8);
        v10 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR(" %@"), v9);
        v22 = v8;
        v11 = (void *)objc_msgSend((id)v26[5], "objectForKey:", v9);
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v39, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v41 != v13)
                objc_enumerationMutation(v11);
              objc_msgSend(v10, "appendFormat:", CFSTR(" [streamGroupID=%s, qualityIndex=%u, maxNetworkBitrate=%u, streamID=%u]"), FourccToCStr(objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "streamGroupID")), objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "qualityIndex"), objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "maxNetworkBitrate"), objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "streamID"));
            }
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v39, 16);
          }
          while (v12);
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v15 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v32 = v15;
            v33 = 2080;
            v34 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]";
            v35 = 1024;
            v36 = 317;
            v37 = 2112;
            v38 = v10;
            _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "VCBandwidth [%s] %s:%d %@", buf, 0x26u);
          }
        }
        ++v8;
      }
      while (v22 + 1 != v21);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
    }
    while (v7);
  }
  v17 = (void *)v26[5];
  _Block_object_dispose(&v25, 8);
  return v17;
}

id __57__VCSessionDownlinkBandwidthAllocator_distributeBitrate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint32_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  uint32_t v37;
  uint64_t v38;
  int v39;
  void *v40;
  uint64_t v41;
  char v42;
  void *v43;
  void *v44;
  int v45;
  int v46;
  int v47;
  uint64_t v48;
  void *v49;
  int v50;
  const __CFString *v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  const char *v57;
  uint32_t v58;
  int v59;
  int v60;
  uint64_t v61;
  NSObject *v62;
  NSObject *v63;
  int v64;
  _BOOL4 v65;
  int v66;
  int v67;
  int v68;
  int v69;
  BOOL v70;
  uint64_t v71;
  NSObject *v72;
  const __CFString *v73;
  uint64_t v74;
  NSObject *v75;
  NSObject *v76;
  uint64_t v77;
  uint64_t v78;
  const __CFString *v79;
  uint64_t v80;
  NSObject *v81;
  NSObject *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  NSObject *v86;
  NSObject *v87;
  uint64_t v88;
  uint64_t v89;
  NSObject *v90;
  NSObject *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  const char *v96;
  uint32_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  NSObject *v103;
  int v104;
  uint64_t v105;
  int v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t j;
  char **v112;
  const __CFString *v113;
  uint64_t v114;
  NSObject *v115;
  NSObject *v116;
  const char *v117;
  NSObject *v118;
  uint32_t v119;
  uint64_t v120;
  NSObject *v121;
  NSObject *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  uint64_t v131;
  const __CFString *v132;
  uint64_t v133;
  NSObject *v134;
  NSObject *v135;
  uint64_t v136;
  uint64_t v137;
  NSObject *v138;
  const char *v139;
  uint32_t v140;
  uint64_t v141;
  NSObject *v142;
  NSObject *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  NSObject *v147;
  const char *v148;
  uint32_t v149;
  uint64_t v150;
  uint64_t v151;
  id result;
  int v153;
  void *v154;
  void *v155;
  void *v156;
  _BYTE v157[128];
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  _BYTE v162[128];
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  uint8_t buf[4];
  uint64_t v168;
  __int16 v169;
  const char *v170;
  __int16 v171;
  int v172;
  __int16 v173;
  _BYTE v174[44];
  __int16 v175;
  int v176;
  _BYTE v177[128];
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  uint64_t v182;

  v182 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sortMediaEntries");
  v2 = objc_msgSend(*(id *)(a1 + 32), "simultaneousTalkers");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v2);
  if (v2)
  {
    for (i = 0; i != v2; ++i)
      objc_msgSend(v3, "setObject:atIndexedSubscript:", &unk_1E9EF6500, i);
  }
  v154 = v3;
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      v8 = *MEMORY[0x1E0CF2758];
      if (!*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          __57__VCSessionDownlinkBandwidthAllocator_distributeBitrate___block_invoke_cold_2();
        goto LABEL_21;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v168 = v6;
        v169 = 2080;
        v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
        v171 = 1024;
        v172 = 199;
        v9 = "VCBandwidth [%s] %s:%d Sorted media entries:";
        v10 = v7;
        v11 = 28;
LABEL_16:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      v14 = *MEMORY[0x1E0CF2758];
      if (!*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v16 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 136316162;
          v168 = v12;
          v169 = 2080;
          v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
          v171 = 1024;
          v172 = 199;
          v173 = 2112;
          *(_QWORD *)v174 = v5;
          *(_WORD *)&v174[8] = 2048;
          *(_QWORD *)&v174[10] = v16;
          _os_log_debug_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEBUG, "VCBandwidth [%s] %s:%d %@(%p) Sorted media entries:", buf, 0x30u);
        }
        goto LABEL_21;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136316162;
        v168 = v12;
        v169 = 2080;
        v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
        v171 = 1024;
        v172 = 199;
        v173 = 2112;
        *(_QWORD *)v174 = v5;
        *(_WORD *)&v174[8] = 2048;
        *(_QWORD *)&v174[10] = v15;
        v9 = "VCBandwidth [%s] %s:%d %@(%p) Sorted media entries:";
        v10 = v13;
        v11 = 48;
        goto LABEL_16;
      }
    }
  }
LABEL_21:
  v180 = 0u;
  v181 = 0u;
  v178 = 0u;
  v179 = 0u;
  v17 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v178, v177, 16);
  if (!v18)
    goto LABEL_46;
  v19 = v18;
  v20 = *(_QWORD *)v179;
  do
  {
    v21 = 0;
    do
    {
      if (*(_QWORD *)v179 != v20)
        objc_enumerationMutation(v17);
      v22 = *(_QWORD *)(*((_QWORD *)&v178 + 1) + 8 * v21);
      if (objc_opt_class() == *(_QWORD *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 8)
          goto LABEL_41;
        v31 = VRTraceErrorLogLevelToCSTR();
        v32 = *MEMORY[0x1E0CF2758];
        v33 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            goto LABEL_41;
          *(_DWORD *)buf = 136315906;
          v168 = v31;
          v169 = 2080;
          v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
          v171 = 1024;
          v172 = 201;
          v173 = 2112;
          *(_QWORD *)v174 = v22;
          v28 = v32;
          v29 = "VCBandwidth [%s] %s:%d %@";
          v30 = 38;
          goto LABEL_37;
        }
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v168 = v31;
          v169 = 2080;
          v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
          v171 = 1024;
          v172 = 201;
          v173 = 2112;
          *(_QWORD *)v174 = v22;
          v35 = v32;
          v36 = "VCBandwidth [%s] %s:%d %@";
          v37 = 38;
          goto LABEL_44;
        }
      }
      else
      {
        v23 = &stru_1E9E58EE0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v23 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          v24 = VRTraceErrorLogLevelToCSTR();
          v25 = *MEMORY[0x1E0CF2758];
          v26 = *MEMORY[0x1E0CF2758];
          if (*MEMORY[0x1E0CF2748])
          {
            if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              goto LABEL_41;
            v27 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 136316418;
            v168 = v24;
            v169 = 2080;
            v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
            v171 = 1024;
            v172 = 201;
            v173 = 2112;
            *(_QWORD *)v174 = v23;
            *(_WORD *)&v174[8] = 2048;
            *(_QWORD *)&v174[10] = v27;
            *(_WORD *)&v174[18] = 2112;
            *(_QWORD *)&v174[20] = v22;
            v28 = v25;
            v29 = "VCBandwidth [%s] %s:%d %@(%p) %@";
            v30 = 58;
LABEL_37:
            _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, v30);
            goto LABEL_41;
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            v34 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 136316418;
            v168 = v24;
            v169 = 2080;
            v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
            v171 = 1024;
            v172 = 201;
            v173 = 2112;
            *(_QWORD *)v174 = v23;
            *(_WORD *)&v174[8] = 2048;
            *(_QWORD *)&v174[10] = v34;
            *(_WORD *)&v174[18] = 2112;
            *(_QWORD *)&v174[20] = v22;
            v35 = v25;
            v36 = "VCBandwidth [%s] %s:%d %@(%p) %@";
            v37 = 58;
LABEL_44:
            _os_log_debug_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_DEBUG, v36, buf, v37);
          }
        }
      }
LABEL_41:
      ++v21;
    }
    while (v19 != v21);
    v38 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v178, v177, 16);
    v19 = v38;
  }
  while (v38);
LABEL_46:
  v39 = *(_DWORD *)(a1 + 48);
  v155 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 16));
  v40 = v154;
  if ((int)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count") >= 1)
  {
    v41 = 0;
    v42 = 0;
    while (1)
    {
      v43 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectAtIndexedSubscript:", v41);
      if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v43, "client"), "uuid")))
      {
        v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v44, objc_msgSend((id)objc_msgSend(v43, "client"), "uuid"));

      }
      if (objc_msgSend(v43, "type") != 1)
        break;
      if (objc_msgSend(v43, "streamGroupID") == 1835623287
        || objc_msgSend(v43, "streamGroupID") == 1835623282)
      {
        v45 = objc_msgSend(*(id *)(a1 + 32), "requiredAudioBitrate:highestAudioBitrates:", objc_msgSend(v43, "maxNetworkBitrate"), v40);
        if (!v45)
        {
          v47 = 0;
          goto LABEL_100;
        }
        v46 = objc_msgSend(v43, "isLowestQuality");
        if (v46)
          v47 = v45;
        else
          v47 = 0;
        if (((v46 | v42) & 1) != 0)
        {
          v42 |= v46 ^ 1;
LABEL_100:
          v39 -= v45;
          objc_msgSend(*(id *)(a1 + 32), "updateHighestAudioBitrates:bitrate:", v40, objc_msgSend(v43, "maxNetworkBitrate"));
LABEL_121:
          objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v43, "client"), "uuid")), "setObject:forKeyedSubscript:", v43, objc_msgSend(v43, "streamToken"));
          if (objc_opt_class() == *(_QWORD *)(a1 + 32))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
            {
              v85 = VRTraceErrorLogLevelToCSTR();
              v86 = *MEMORY[0x1E0CF2758];
              v87 = *MEMORY[0x1E0CF2758];
              if (*MEMORY[0x1E0CF2748])
              {
                if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
                {
                  v88 = objc_msgSend((id)objc_msgSend(v43, "client"), "uuid");
                  *(_DWORD *)buf = 136316674;
                  v168 = v85;
                  v169 = 2080;
                  v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
                  v171 = 1024;
                  v172 = 288;
                  v173 = 1024;
                  *(_DWORD *)v174 = v47;
                  *(_WORD *)&v174[4] = 2112;
                  *(_QWORD *)&v174[6] = v88;
                  *(_WORD *)&v174[14] = 2112;
                  *(_QWORD *)&v174[16] = v43;
                  *(_WORD *)&v174[24] = 1024;
                  *(_DWORD *)&v174[26] = v39;
                  v56 = v86;
                  v57 = "VCBandwidth [%s] %s:%d Opt in [%d] to client[%@] to upgrade to stream %@ remaining %d";
                  v58 = 60;
                  goto LABEL_136;
                }
              }
              else if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
              {
                v100 = objc_msgSend((id)objc_msgSend(v43, "client"), "uuid");
                *(_DWORD *)buf = 136316674;
                v168 = v85;
                v169 = 2080;
                v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
                v171 = 1024;
                v172 = 288;
                v173 = 1024;
                *(_DWORD *)v174 = v47;
                *(_WORD *)&v174[4] = 2112;
                *(_QWORD *)&v174[6] = v100;
                *(_WORD *)&v174[14] = 2112;
                *(_QWORD *)&v174[16] = v43;
                *(_WORD *)&v174[24] = 1024;
                *(_DWORD *)&v174[26] = v39;
                v95 = v86;
                v96 = "VCBandwidth [%s] %s:%d Opt in [%d] to client[%@] to upgrade to stream %@ remaining %d";
                v97 = 60;
                goto LABEL_145;
              }
            }
          }
          else
          {
            v79 = &stru_1E9E58EE0;
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v79 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
            if ((int)VRTraceGetErrorLogLevelForModule() < 8)
              goto LABEL_149;
            v80 = VRTraceErrorLogLevelToCSTR();
            v81 = *MEMORY[0x1E0CF2758];
            v82 = *MEMORY[0x1E0CF2758];
            if (*MEMORY[0x1E0CF2748])
            {
              if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
              {
                v83 = *(_QWORD *)(a1 + 32);
                v84 = objc_msgSend((id)objc_msgSend(v43, "client"), "uuid");
                *(_DWORD *)buf = 136317186;
                v168 = v80;
                v169 = 2080;
                v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
                v171 = 1024;
                v172 = 288;
                v173 = 2112;
                *(_QWORD *)v174 = v79;
                *(_WORD *)&v174[8] = 2048;
                *(_QWORD *)&v174[10] = v83;
                v40 = v154;
                *(_WORD *)&v174[18] = 1024;
                *(_DWORD *)&v174[20] = v47;
                *(_WORD *)&v174[24] = 2112;
                *(_QWORD *)&v174[26] = v84;
                *(_WORD *)&v174[34] = 2112;
                *(_QWORD *)&v174[36] = v43;
                v175 = 1024;
                v176 = v39;
                v56 = v81;
                v57 = "VCBandwidth [%s] %s:%d %@(%p) Opt in [%d] to client[%@] to upgrade to stream %@ remaining %d";
                v58 = 80;
                goto LABEL_136;
              }
            }
            else if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
            {
              v93 = *(_QWORD *)(a1 + 32);
              v94 = objc_msgSend((id)objc_msgSend(v43, "client"), "uuid");
              *(_DWORD *)buf = 136317186;
              v168 = v80;
              v169 = 2080;
              v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
              v171 = 1024;
              v172 = 288;
              v173 = 2112;
              *(_QWORD *)v174 = v79;
              *(_WORD *)&v174[8] = 2048;
              *(_QWORD *)&v174[10] = v93;
              v40 = v154;
              *(_WORD *)&v174[18] = 1024;
              *(_DWORD *)&v174[20] = v47;
              *(_WORD *)&v174[24] = 2112;
              *(_QWORD *)&v174[26] = v94;
              *(_WORD *)&v174[34] = 2112;
              *(_QWORD *)&v174[36] = v43;
              v175 = 1024;
              v176 = v39;
              v95 = v81;
              v96 = "VCBandwidth [%s] %s:%d %@(%p) Opt in [%d] to client[%@] to upgrade to stream %@ remaining %d";
              v97 = 80;
LABEL_145:
              _os_log_debug_impl(&dword_1D8A54000, v95, OS_LOG_TYPE_DEBUG, v96, buf, v97);
              goto LABEL_149;
            }
          }
          goto LABEL_149;
        }
        v47 = v45 * objc_msgSend(v40, "count");
        if (v47 <= v39)
        {
          v42 = 1;
          goto LABEL_100;
        }
        v42 = 0;
      }
      else
      {
        v47 = objc_msgSend(v43, "maxMediaBitrate");
        v67 = objc_msgSend(v43, "isLowestQuality");
        if (v47 <= v39)
          v68 = 1;
        else
          v68 = v67;
        if (v68)
          v69 = v47;
        else
          v69 = 0;
        v39 -= v69;
        if ((v68 & 1) != 0)
          goto LABEL_121;
      }
LABEL_114:
      if (objc_opt_class() == *(_QWORD *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          v89 = VRTraceErrorLogLevelToCSTR();
          v90 = *MEMORY[0x1E0CF2758];
          v91 = *MEMORY[0x1E0CF2758];
          if (*MEMORY[0x1E0CF2748])
          {
            if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
            {
              v92 = objc_msgSend((id)objc_msgSend(v43, "client"), "uuid");
              *(_DWORD *)buf = 136316418;
              v168 = v89;
              v169 = 2080;
              v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
              v171 = 1024;
              v172 = 290;
              v173 = 1024;
              *(_DWORD *)v174 = v39;
              *(_WORD *)&v174[4] = 2112;
              *(_QWORD *)&v174[6] = v92;
              *(_WORD *)&v174[14] = 2112;
              *(_QWORD *)&v174[16] = v43;
              v56 = v90;
              v57 = "VCBandwidth [%s] %s:%d Bitrate distribution completed; remaining %d (candidate: %@ %@)";
              v58 = 54;
              goto LABEL_136;
            }
          }
          else if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
          {
            v101 = objc_msgSend((id)objc_msgSend(v43, "client"), "uuid");
            *(_DWORD *)buf = 136316418;
            v168 = v89;
            v169 = 2080;
            v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
            v171 = 1024;
            v172 = 290;
            v173 = 1024;
            *(_DWORD *)v174 = v39;
            *(_WORD *)&v174[4] = 2112;
            *(_QWORD *)&v174[6] = v101;
            *(_WORD *)&v174[14] = 2112;
            *(_QWORD *)&v174[16] = v43;
            v95 = v90;
            v96 = "VCBandwidth [%s] %s:%d Bitrate distribution completed; remaining %d (candidate: %@ %@)";
            v97 = 54;
            goto LABEL_145;
          }
        }
      }
      else
      {
        v73 = &stru_1E9E58EE0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v73 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
        if ((int)VRTraceGetErrorLogLevelForModule() < 8)
          goto LABEL_149;
        v74 = VRTraceErrorLogLevelToCSTR();
        v75 = *MEMORY[0x1E0CF2758];
        v76 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            v77 = *(_QWORD *)(a1 + 32);
            v78 = objc_msgSend((id)objc_msgSend(v43, "client"), "uuid");
            *(_DWORD *)buf = 136316930;
            v168 = v74;
            v169 = 2080;
            v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
            v171 = 1024;
            v172 = 290;
            v173 = 2112;
            *(_QWORD *)v174 = v73;
            *(_WORD *)&v174[8] = 2048;
            *(_QWORD *)&v174[10] = v77;
            v40 = v154;
            *(_WORD *)&v174[18] = 1024;
            *(_DWORD *)&v174[20] = v39;
            *(_WORD *)&v174[24] = 2112;
            *(_QWORD *)&v174[26] = v78;
            *(_WORD *)&v174[34] = 2112;
            *(_QWORD *)&v174[36] = v43;
            v56 = v75;
            v57 = "VCBandwidth [%s] %s:%d %@(%p) Bitrate distribution completed; remaining %d (candidate: %@ %@)";
            v58 = 74;
LABEL_136:
            _os_log_impl(&dword_1D8A54000, v56, OS_LOG_TYPE_DEFAULT, v57, buf, v58);
          }
        }
        else if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
        {
          v98 = *(_QWORD *)(a1 + 32);
          v99 = objc_msgSend((id)objc_msgSend(v43, "client"), "uuid");
          *(_DWORD *)buf = 136316930;
          v168 = v74;
          v169 = 2080;
          v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
          v171 = 1024;
          v172 = 290;
          v173 = 2112;
          *(_QWORD *)v174 = v73;
          *(_WORD *)&v174[8] = 2048;
          *(_QWORD *)&v174[10] = v98;
          v40 = v154;
          *(_WORD *)&v174[18] = 1024;
          *(_DWORD *)&v174[20] = v39;
          *(_WORD *)&v174[24] = 2112;
          *(_QWORD *)&v174[26] = v99;
          *(_WORD *)&v174[34] = 2112;
          *(_QWORD *)&v174[36] = v43;
          v95 = v75;
          v96 = "VCBandwidth [%s] %s:%d %@(%p) Bitrate distribution completed; remaining %d (candidate: %@ %@)";
          v97 = 74;
          goto LABEL_145;
        }
      }
LABEL_149:
      if (++v41 >= (int)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count"))
        goto LABEL_150;
    }
    if (objc_msgSend(v43, "type") != 2 && objc_msgSend(v43, "type") != 3)
      goto LABEL_114;
    v48 = objc_msgSend(v43, "streamToken");
    v49 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v43, "client"), "uuid")), "objectForKeyedSubscript:", v48);
    v50 = objc_msgSend(v43, "streamGroupID");
    if (objc_msgSend(v43, "type") == 2
      && objc_msgSend(v155, "count") >= (unint64_t)*(unsigned int *)(*(_QWORD *)(a1 + 32) + 16)
      && (objc_msgSend(v155, "containsObject:", v48) & 1) == 0
      && v50 != 1935897189)
    {
      if (objc_opt_class() == *(_QWORD *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
          goto LABEL_149;
        v102 = VRTraceErrorLogLevelToCSTR();
        v103 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_149;
        v104 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16);
        v105 = objc_msgSend((id)objc_msgSend(v43, "client"), "uuid");
        *(_DWORD *)buf = 136316162;
        v168 = v102;
        v169 = 2080;
        v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
        v171 = 1024;
        v172 = 256;
        v173 = 1024;
        *(_DWORD *)v174 = v104;
        *(_WORD *)&v174[4] = 2112;
        *(_QWORD *)&v174[6] = v105;
        v56 = v103;
        v57 = "VCBandwidth [%s] %s:%d Reached max number of decoder streams (%d). Unable to display video for client:%@";
        v58 = 44;
      }
      else
      {
        v51 = &stru_1E9E58EE0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v51 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
          goto LABEL_149;
        v52 = VRTraceErrorLogLevelToCSTR();
        v53 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_149;
        v54 = *(_QWORD *)(a1 + 32);
        v153 = *(_DWORD *)(v54 + 16);
        v55 = objc_msgSend((id)objc_msgSend(v43, "client"), "uuid");
        *(_DWORD *)buf = 136316674;
        v168 = v52;
        v169 = 2080;
        v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
        v171 = 1024;
        v172 = 256;
        v173 = 2112;
        *(_QWORD *)v174 = v51;
        *(_WORD *)&v174[8] = 2048;
        *(_QWORD *)&v174[10] = v54;
        *(_WORD *)&v174[18] = 1024;
        *(_DWORD *)&v174[20] = v153;
        *(_WORD *)&v174[24] = 2112;
        *(_QWORD *)&v174[26] = v55;
        v56 = v53;
        v57 = "VCBandwidth [%s] %s:%d %@(%p) Reached max number of decoder streams (%d). Unable to display video for client:%@";
        v58 = 64;
      }
      goto LABEL_136;
    }
    v59 = objc_msgSend(v43, "maxNetworkBitrate");
    v47 = v59 - objc_msgSend(v49, "maxNetworkBitrate");
    if (v50 <= 1717854579)
    {
      if (v50 != 1650745716 && v50 != 1667329381)
      {
        v60 = 1667329399;
        goto LABEL_78;
      }
      goto LABEL_79;
    }
    if (v50 == 1717854580 || v50 == 1935897189)
      goto LABEL_79;
    v60 = 1718909044;
LABEL_78:
    if (v50 == v60)
    {
LABEL_79:
      if (objc_msgSend(v43, "isLowestQuality"))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          v61 = VRTraceErrorLogLevelToCSTR();
          v62 = *MEMORY[0x1E0CF2758];
          v63 = *MEMORY[0x1E0CF2758];
          if (*MEMORY[0x1E0CF2748])
          {
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
            {
              v64 = objc_msgSend(v43, "qualityIndex");
              *(_DWORD *)buf = 136316418;
              v168 = v61;
              v169 = 2080;
              v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
              v171 = 1024;
              v172 = 266;
              v173 = 1024;
              *(_DWORD *)v174 = v64;
              *(_WORD *)&v174[4] = 1024;
              *(_DWORD *)&v174[6] = v39;
              *(_WORD *)&v174[10] = 1024;
              *(_DWORD *)&v174[12] = v47;
              _os_log_impl(&dword_1D8A54000, v62, OS_LOG_TYPE_DEFAULT, "VCBandwidth [%s] %s:%d Always opt into Video Stream with Quality Index:%d availableBitrate %d requiredBitrate %d", buf, 0x2Eu);
            }
          }
          else if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
          {
            v106 = objc_msgSend(v43, "qualityIndex");
            *(_DWORD *)buf = 136316418;
            v168 = v61;
            v169 = 2080;
            v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
            v171 = 1024;
            v172 = 266;
            v173 = 1024;
            *(_DWORD *)v174 = v106;
            *(_WORD *)&v174[4] = 1024;
            *(_DWORD *)&v174[6] = v39;
            *(_WORD *)&v174[10] = 1024;
            *(_DWORD *)&v174[12] = v47;
            _os_log_debug_impl(&dword_1D8A54000, v62, OS_LOG_TYPE_DEBUG, "VCBandwidth [%s] %s:%d Always opt into Video Stream with Quality Index:%d availableBitrate %d requiredBitrate %d", buf, 0x2Eu);
          }
        }
        v70 = __OFSUB__(v39, v47);
        v39 -= v47;
        if (v39 < 0 != v70)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
          {
            v71 = VRTraceErrorLogLevelToCSTR();
            v72 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v168 = v71;
              v169 = 2080;
              v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
              v171 = 1024;
              v172 = 269;
              _os_log_impl(&dword_1D8A54000, v72, OS_LOG_TYPE_DEFAULT, "VCBandwidth [%s] %s:%d We do not have available bandwidth to support the lowest quality video stream, but we are forcing it on anyways.", buf, 0x1Cu);
            }
          }
          v39 = 0;
        }
        v65 = 0;
LABEL_110:
        if (objc_msgSend(v43, "type") == 2
          && ((v65 | objc_msgSend(v155, "containsObject:", objc_msgSend(v43, "streamToken"))) & 1) == 0)
        {
          objc_msgSend(v155, "addObject:", objc_msgSend(v43, "streamToken"));
        }
        v42 = 0;
        if (!v65)
          goto LABEL_121;
        goto LABEL_114;
      }
    }
    v65 = v39 < v47;
    if (v39 >= v47)
      v66 = v47;
    else
      v66 = 0;
    v39 -= v66;
    goto LABEL_110;
  }
LABEL_150:

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
  v165 = 0u;
  v166 = 0u;
  v163 = 0u;
  v164 = 0u;
  v107 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v163, v162, 16);
  if (v108)
  {
    v109 = v108;
    v110 = *(_QWORD *)v164;
    do
    {
      for (j = 0; j != v109; ++j)
      {
        if (*(_QWORD *)v164 != v110)
          objc_enumerationMutation(v107);
        objc_msgSend(*(id *)(a1 + 32), "updateSelectedMediaEntriesForClientWithUUID:", objc_msgSend(*(id *)(*((_QWORD *)&v163 + 1) + 8 * j), "uuid"));
      }
      v109 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v163, v162, 16);
    }
    while (v109);
  }
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    v112 = &selRef_load;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v114 = VRTraceErrorLogLevelToCSTR();
      v115 = *MEMORY[0x1E0CF2758];
      v116 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v168 = v114;
          v169 = 2080;
          v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
          v171 = 1024;
          v172 = 303;
          v117 = "VCBandwidth [%s] %s:%d Allocated media entries for clients:";
          v118 = v115;
          v119 = 28;
          goto LABEL_169;
        }
      }
      else if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
      {
        __57__VCSessionDownlinkBandwidthAllocator_distributeBitrate___block_invoke_cold_1();
      }
    }
  }
  else
  {
    v112 = &selRef_load;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v113 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v113 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v120 = VRTraceErrorLogLevelToCSTR();
      v121 = *MEMORY[0x1E0CF2758];
      v122 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
        {
          v123 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 136316162;
          v168 = v120;
          v169 = 2080;
          v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
          v171 = 1024;
          v172 = 303;
          v173 = 2112;
          *(_QWORD *)v174 = v113;
          *(_WORD *)&v174[8] = 2048;
          *(_QWORD *)&v174[10] = v123;
          v117 = "VCBandwidth [%s] %s:%d %@(%p) Allocated media entries for clients:";
          v118 = v121;
          v119 = 48;
LABEL_169:
          _os_log_impl(&dword_1D8A54000, v118, OS_LOG_TYPE_DEFAULT, v117, buf, v119);
        }
      }
      else if (os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG))
      {
        v124 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136316162;
        v168 = v120;
        v169 = 2080;
        v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
        v171 = 1024;
        v172 = 303;
        v173 = 2112;
        *(_QWORD *)v174 = v113;
        *(_WORD *)&v174[8] = 2048;
        *(_QWORD *)&v174[10] = v124;
        _os_log_debug_impl(&dword_1D8A54000, v121, OS_LOG_TYPE_DEBUG, "VCBandwidth [%s] %s:%d %@(%p) Allocated media entries for clients:", buf, 0x30u);
      }
    }
  }
  v160 = 0u;
  v161 = 0u;
  v158 = 0u;
  v159 = 0u;
  v125 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allKeys");
  v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v158, v157, 16);
  if (!v126)
    goto LABEL_199;
  v127 = v126;
  v128 = *(_QWORD *)v159;
  v156 = v125;
  while (2)
  {
    v129 = 0;
    v130 = v112[73];
    while (2)
    {
      if (*(_QWORD *)v159 != v128)
        objc_enumerationMutation(v125);
      v131 = *(_QWORD *)(*((_QWORD *)&v158 + 1) + 8 * v129);
      if (objc_opt_class() != *(_QWORD *)(a1 + 32))
      {
        v132 = &stru_1E9E58EE0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v132 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", v130);
        if ((int)VRTraceGetErrorLogLevelForModule() < 8)
          goto LABEL_194;
        v133 = VRTraceErrorLogLevelToCSTR();
        v134 = *MEMORY[0x1E0CF2758];
        v135 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
          {
            v136 = *(_QWORD *)(a1 + 32);
            v137 = objc_msgSend(*(id *)(v136 + 8), "objectForKeyedSubscript:", v131);
            *(_DWORD *)buf = 136316674;
            v168 = v133;
            v169 = 2080;
            v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
            v171 = 1024;
            v172 = 305;
            v173 = 2112;
            *(_QWORD *)v174 = v132;
            *(_WORD *)&v174[8] = 2048;
            *(_QWORD *)&v174[10] = v136;
            v125 = v156;
            *(_WORD *)&v174[18] = 2112;
            *(_QWORD *)&v174[20] = v131;
            *(_WORD *)&v174[28] = 2112;
            *(_QWORD *)&v174[30] = v137;
            v138 = v134;
            v139 = "VCBandwidth [%s] %s:%d %@(%p) %@: %@";
            v140 = 68;
            goto LABEL_190;
          }
          goto LABEL_194;
        }
        if (!os_log_type_enabled(v135, OS_LOG_TYPE_DEBUG))
          goto LABEL_194;
        v145 = *(_QWORD *)(a1 + 32);
        v146 = objc_msgSend(*(id *)(v145 + 8), "objectForKeyedSubscript:", v131);
        *(_DWORD *)buf = 136316674;
        v168 = v133;
        v169 = 2080;
        v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
        v171 = 1024;
        v172 = 305;
        v173 = 2112;
        *(_QWORD *)v174 = v132;
        *(_WORD *)&v174[8] = 2048;
        *(_QWORD *)&v174[10] = v145;
        v125 = v156;
        *(_WORD *)&v174[18] = 2112;
        *(_QWORD *)&v174[20] = v131;
        *(_WORD *)&v174[28] = 2112;
        *(_QWORD *)&v174[30] = v146;
        v147 = v134;
        v148 = "VCBandwidth [%s] %s:%d %@(%p) %@: %@";
        v149 = 68;
LABEL_197:
        _os_log_debug_impl(&dword_1D8A54000, v147, OS_LOG_TYPE_DEBUG, v148, buf, v149);
        goto LABEL_194;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        goto LABEL_194;
      v141 = VRTraceErrorLogLevelToCSTR();
      v142 = *MEMORY[0x1E0CF2758];
      v143 = *MEMORY[0x1E0CF2758];
      if (!*MEMORY[0x1E0CF2748])
      {
        if (!os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG))
          goto LABEL_194;
        v150 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v131);
        *(_DWORD *)buf = 136316162;
        v168 = v141;
        v169 = 2080;
        v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
        v171 = 1024;
        v172 = 305;
        v173 = 2112;
        *(_QWORD *)v174 = v131;
        *(_WORD *)&v174[8] = 2112;
        *(_QWORD *)&v174[10] = v150;
        v147 = v142;
        v148 = "VCBandwidth [%s] %s:%d %@: %@";
        v149 = 48;
        goto LABEL_197;
      }
      if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
      {
        v144 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v131);
        *(_DWORD *)buf = 136316162;
        v168 = v141;
        v169 = 2080;
        v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
        v171 = 1024;
        v172 = 305;
        v173 = 2112;
        *(_QWORD *)v174 = v131;
        *(_WORD *)&v174[8] = 2112;
        *(_QWORD *)&v174[10] = v144;
        v138 = v142;
        v139 = "VCBandwidth [%s] %s:%d %@: %@";
        v140 = 48;
LABEL_190:
        _os_log_impl(&dword_1D8A54000, v138, OS_LOG_TYPE_DEFAULT, v139, buf, v140);
      }
LABEL_194:
      if (v127 != ++v129)
        continue;
      break;
    }
    v151 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v158, v157, 16);
    v127 = v151;
    v112 = &selRef_load;
    if (v151)
      continue;
    break;
  }
LABEL_199:
  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)updateSelectedMediaEntriesForClientWithUUID:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  _BYTE v21[24];
  __int128 v22;
  VCSessionDownlinkBandwidthAllocator *v23;
  __int128 v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_allocatedMediaEntriesForClients, "objectForKeyedSubscript:", a3), "allValues");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
  if (!v7)
    goto LABEL_11;
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v27;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v27 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      if (objc_msgSend(v12, "type") == 1)
        v9 = v12;
      objc_msgSend(v5, "addObject:", v12);
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
  }
  while (v8);
  if (!v9)
  {
LABEL_11:
    if ((VCSessionDownlinkBandwidthAllocator *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v21 = 136315906;
          *(_QWORD *)&v21[4] = v14;
          *(_WORD *)&v21[12] = 2080;
          *(_QWORD *)&v21[14] = "-[VCSessionDownlinkBandwidthAllocator updateSelectedMediaEntriesForClientWithUUID:]";
          *(_WORD *)&v21[22] = 1024;
          LODWORD(v22) = 334;
          WORD2(v22) = 2112;
          *(_QWORD *)((char *)&v22 + 6) = a3;
          v16 = "VCBandwidth [%s] %s:%d No audio entry for client=%@";
          v17 = v15;
          v18 = 38;
LABEL_21:
          _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, v21, v18);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[VCSessionDownlinkBandwidthAllocator performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v21 = 136316418;
          *(_QWORD *)&v21[4] = v19;
          *(_WORD *)&v21[12] = 2080;
          *(_QWORD *)&v21[14] = "-[VCSessionDownlinkBandwidthAllocator updateSelectedMediaEntriesForClientWithUUID:]";
          *(_WORD *)&v21[22] = 1024;
          LODWORD(v22) = 334;
          WORD2(v22) = 2112;
          *(_QWORD *)((char *)&v22 + 6) = v13;
          HIWORD(v22) = 2048;
          v23 = self;
          LOWORD(v24) = 2112;
          *(_QWORD *)((char *)&v24 + 2) = a3;
          v16 = "VCBandwidth [%s] %s:%d %@(%p) No audio entry for client=%@";
          v17 = v20;
          v18 = 58;
          goto LABEL_21;
        }
      }
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_selectedMediaEntriesForClients, "setObject:forKeyedSubscript:", v5, a3, *(_OWORD *)v21, *(_QWORD *)&v21[16], v22, v23, v24);

}

- (void)reset
{
  -[NSMutableArray removeAllObjects](self->_sortedMediaEntries, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_allocatedMediaEntriesForClients, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_selectedMediaEntriesForClients, "removeAllObjects");
}

- (void)registerForBandwidthAllocationWithClient:(id)a3
{
  NSObject *clientQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__VCSessionDownlinkBandwidthAllocator_registerForBandwidthAllocationWithClient___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(clientQueue, block);
}

uint64_t __80__VCSessionDownlinkBandwidthAllocator_registerForBandwidthAllocationWithClient___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "reset");
  }
  return result;
}

- (void)reportingSessionParticipantEventBitrateChanged:(id)a3 optedInNetworkBitrate:(unsigned int)a4 actualNetworkBitrate:(unsigned int)a5 optedInStreamID:(id)a6 actualStreamID:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  __CFDictionary *Mutable;
  id v13;
  id v14;

  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, CFSTR("VCSPUUID"), a3);
  CFDictionaryAddValue(Mutable, CFSTR("VCSPActualBitrate"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9));
  CFDictionaryAddValue(Mutable, CFSTR("VCSPOptedInBitrate"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10));
  if (a7)
    v13 = a7;
  else
    v13 = &unk_1E9EF6500;
  CFDictionaryAddValue(Mutable, CFSTR("VCSPActiveStreamID"), v13);
  if (a6)
    v14 = a6;
  else
    v14 = &unk_1E9EF6500;
  CFDictionaryAddValue(Mutable, CFSTR("VCSPOptedInStreamID"), v14);
  reportingGenericEvent();
  if (Mutable)
    CFRelease(Mutable);
}

- (void)deregisterForBandwidthAllocationWithClient:(id)a3
{
  NSObject *clientQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__VCSessionDownlinkBandwidthAllocator_deregisterForBandwidthAllocationWithClient___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(clientQueue, block);
}

uint64_t __82__VCSessionDownlinkBandwidthAllocator_deregisterForBandwidthAllocationWithClient___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "reset");
  }
  return result;
}

- (void)client:(id)a3 didActualNetworkBitrateChangeForStreamGroupID:(unsigned int)a4
{
  -[VCSessionDownlinkBandwidthAllocator reportingSessionParticipantEventBitrateChanged:optedInNetworkBitrate:actualNetworkBitrate:optedInStreamID:actualStreamID:](self, "reportingSessionParticipantEventBitrateChanged:optedInNetworkBitrate:actualNetworkBitrate:optedInStreamID:actualStreamID:", objc_msgSend(a3, "uuid"), objc_msgSend(a3, "optedInNetworkBitrateForStreamGroup:", *(_QWORD *)&a4), objc_msgSend(a3, "actualNetworkBitrateForStreamGroup:", *(_QWORD *)&a4), objc_msgSend(a3, "optedInStreamIDForStreamGroupID:", *(_QWORD *)&a4), objc_msgSend(a3, "activeDownlinkStreamIDForStreamGroupID:", *(_QWORD *)&a4));
}

- (BOOL)forceFullBandwidth
{
  return self->_forceFullBandwidth;
}

- (void)setForceFullBandwidth:(BOOL)a3
{
  self->_forceFullBandwidth = a3;
}

void __57__VCSessionDownlinkBandwidthAllocator_distributeBitrate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, "VCBandwidth [%s] %s:%d Allocated media entries for clients:", v2, v3, v4, v5, 2u);
}

void __57__VCSessionDownlinkBandwidthAllocator_distributeBitrate___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, "VCBandwidth [%s] %s:%d Sorted media entries:", v2, v3, v4, v5, 2u);
}

@end
