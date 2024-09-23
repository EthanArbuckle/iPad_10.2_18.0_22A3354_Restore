@implementation VCMockRouter

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_14 != -1)
    dispatch_once(&sharedInstance_onceToken_14, &__block_literal_global_79);
  return (id)sharedInstance_sharedInstance_1;
}

void __30__VCMockRouter_sharedInstance__block_invoke()
{
  uint64_t v0;
  NSObject *v1;

  sharedInstance_sharedInstance_1 = objc_alloc_init(VCMockRouter);
  if (!sharedInstance_sharedInstance_1 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v0 = VRTraceErrorLogLevelToCSTR();
    v1 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __30__VCMockRouter_sharedInstance__block_invoke_cold_1(v0, v1);
  }
}

- (BOOL)routeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramOptions:(id *)a5 fromDatagramChannel:(id)a6 error:(id *)a7
{
  uint64_t v10;
  id v12;
  void *v13;
  BOOL result;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  BOOL v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  int ErrorLogLevelForModule;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  id *v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  const void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v10 = *(_QWORD *)&a4;
  v48 = *MEMORY[0x1E0C80C00];
  v12 = -[VCDatagramChannelManager datagramChannels](+[VCDatagramChannelManager sharedInstance](VCDatagramChannelManager, "sharedInstance"), "datagramChannels");
  if (!v12)
    return objc_msgSend(a6, "processDirectIDSPathWithDatagram:datagramSize:datagramOptions:error:", a3, v10, a5, a7);
  v13 = v12;
  if ((unint64_t)objc_msgSend(v12, "count") <= 1)
    return objc_msgSend(a6, "processDirectIDSPathWithDatagram:datagramSize:datagramOptions:error:", a3, v10, a5, a7);
  v30 = a7;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v15 = (void *)objc_msgSend(v13, "allKeys");
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v45;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v45 != v18)
          objc_enumerationMutation(v15);
        v20 = (id)objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i)), "idsDatagramChannel");
        if (v20)
          v21 = v20 == a6;
        else
          v21 = 1;
        if (!v21)
        {
          v25 = v20;
          ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
          if (ErrorLogLevelForModule >= 8)
          {
            v27 = VRTraceErrorLogLevelToCSTR();
            v28 = *MEMORY[0x1E0CF2758];
            v29 = *MEMORY[0x1E0CF2758];
            if (*MEMORY[0x1E0CF2748])
            {
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136316418;
                v32 = v27;
                v33 = 2080;
                v34 = "-[VCMockRouter routeDatagram:datagramSize:datagramOptions:fromDatagramChannel:error:]";
                v35 = 1024;
                v36 = 53;
                v37 = 2048;
                v38 = a3;
                v39 = 2048;
                v40 = a6;
                v41 = 2048;
                v42 = v25;
                _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forward datagram[%p] from MockIDSDatagramChannel=%p to MockIDSDatagramChannel=%p", buf, 0x3Au);
              }
            }
            else if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136316418;
              v32 = v27;
              v33 = 2080;
              v34 = "-[VCMockRouter routeDatagram:datagramSize:datagramOptions:fromDatagramChannel:error:]";
              v35 = 1024;
              v36 = 53;
              v37 = 2048;
              v38 = a3;
              v39 = 2048;
              v40 = a6;
              v41 = 2048;
              v42 = v25;
              _os_log_debug_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Forward datagram[%p] from MockIDSDatagramChannel=%p to MockIDSDatagramChannel=%p", buf, 0x3Au);
            }
          }
          return objc_msgSend(v25, "processDirectIDSPathWithDatagram:datagramSize:datagramOptions:error:", a3, v10, a5, v30);
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
      if (v17)
        continue;
      break;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v32 = v22;
      v33 = 2080;
      v34 = "-[VCMockRouter routeDatagram:datagramSize:datagramOptions:fromDatagramChannel:error:]";
      v35 = 1024;
      v36 = 57;
      v37 = 2048;
      v38 = a3;
      v39 = 2048;
      v40 = a6;
      _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to forward datagram=%p from MockIDSDatagramChannel=%p", buf, 0x30u);
    }
  }
  if (!v30)
    return 0;
  v24 = objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32000, 0, CFSTR("Failed to forward datagram"));
  result = 0;
  *v30 = (id)v24;
  return result;
}

void __30__VCMockRouter_sharedInstance__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "+[VCMockRouter sharedInstance]_block_invoke";
  v6 = 1024;
  v7 = 34;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to instantiate VCMockRouter object", (uint8_t *)&v2, 0x1Cu);
}

@end
