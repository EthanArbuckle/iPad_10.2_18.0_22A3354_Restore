@implementation VCAudioCaptionsBufferInfoCollection

- (VCAudioCaptionsBufferInfoCollection)initWithBufferLength:(double)a3
{
  VCAudioCaptionsBufferInfoCollection *v4;
  NSMutableArray *v5;
  NSObject *CustomRootQueue;
  dispatch_queue_t v7;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  objc_super v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  VCAudioCaptionsBufferInfoCollection *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)VCAudioCaptionsBufferInfoCollection;
  v4 = -[VCAudioCaptionsBufferInfoCollection init](&v17, sel_init);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4->_bufferInfos = v5;
    if (v5)
    {
      v4->_bufferLength = a3;
      CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
      v7 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCAudioCaptionsBufferInfoCollection.stateQueue", 0, CustomRootQueue);
      v4->_stateQueue = (OS_dispatch_queue *)v7;
      if (v7)
        return v4;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioCaptionsBufferInfoCollection initWithBufferLength:].cold.1();
      }
    }
    else
    {
      if ((VCAudioCaptionsBufferInfoCollection *)objc_opt_class() == v4)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_19;
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        *(_DWORD *)buf = 136315650;
        v19 = v10;
        v20 = 2080;
        v21 = "-[VCAudioCaptionsBufferInfoCollection initWithBufferLength:]";
        v22 = 1024;
        v23 = 105;
        v12 = " [%s] %s:%d Failed to create buffer infos array.";
        v13 = v11;
        v14 = 28;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v9 = (const __CFString *)-[VCAudioCaptionsBufferInfoCollection performSelector:](v4, "performSelector:", sel_logPrefix);
        else
          v9 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_19;
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        *(_DWORD *)buf = 136316162;
        v19 = v15;
        v20 = 2080;
        v21 = "-[VCAudioCaptionsBufferInfoCollection initWithBufferLength:]";
        v22 = 1024;
        v23 = 105;
        v24 = 2112;
        v25 = v9;
        v26 = 2048;
        v27 = v4;
        v12 = " [%s] %s:%d %@(%p) Failed to create buffer infos array.";
        v13 = v16;
        v14 = 48;
      }
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }
LABEL_19:

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  NSObject *stateQueue;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  if (stateQueue)
    dispatch_release(stateQueue);

  v4.receiver = self;
  v4.super_class = (Class)VCAudioCaptionsBufferInfoCollection;
  -[VCAudioCaptionsBufferInfoCollection dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p> bufferInfos=%@"), NSStringFromClass(v4), self, self->_bufferInfos);
}

- (NSArray)streamTokens
{
  NSObject *stateQueue;
  uint64_t v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSArray *v8;
  _QWORD v10[6];
  _QWORD block[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  stateQueue = self->_stateQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__VCAudioCaptionsBufferInfoCollection_streamTokens__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v12;
  dispatch_sync(stateQueue, block);
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v6 = (void *)objc_msgSend(v5, "initWithCapacity:", v13[3]);
  v7 = self->_stateQueue;
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __51__VCAudioCaptionsBufferInfoCollection_streamTokens__block_invoke_2;
  v10[3] = &unk_1E9E52238;
  v10[4] = self;
  v10[5] = v6;
  dispatch_sync(v7, v10);
  v8 = v6;
  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __51__VCAudioCaptionsBufferInfoCollection_streamTokens__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __51__VCAudioCaptionsBufferInfoCollection_streamTokens__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__VCAudioCaptionsBufferInfoCollection_streamTokens__block_invoke_3;
  v4[3] = &unk_1E9E56598;
  v4[4] = v1;
  return objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);
}

uint64_t __51__VCAudioCaptionsBufferInfoCollection_streamTokens__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "token")));
}

uint64_t __VCAudioCaptionsBufferInfoCollection_GetBufferInfo_block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(void **)(a1[4] + 8);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        v8 = a1[6];
        result = objc_msgSend(v7, "token");
        if (v8 == result)
        {
          *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = v7;
          return result;
        }
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
      v4 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

void __VCAudioCaptionsBufferInfoCollection_AddBufferInfo_block_invoke(_QWORD *a1)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  __int128 v7;
  char v8;
  uint64_t v9;
  NSObject *v10;
  char *v11;
  char *v12;
  _QWORD v13[5];
  uint64_t __s2;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  char *v26;
  char __str[16];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  char v31[16];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a1[4];
  v2 = (_BYTE *)a1[5];
  if (objc_msgSend(*(id *)(v3 + 8), "count"))
  {
    v4 = 0;
    while (1)
    {
      v5 = (_BYTE *)objc_msgSend(*(id *)(v3 + 8), "objectAtIndexedSubscript:", v4);
      v6 = objc_msgSend(v2, "token");
      if (v6 == objc_msgSend(v5, "token"))
        break;
      if (v2)
      {
        if (v2[64])
        {
          if (v5)
          {
            if (v5[64])
            {
              __s2 = -1;
              *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v15 = v7;
              v16 = v7;
              objc_msgSend(v5, "format");
              objc_msgSend(v2, "format", -1, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL);
              if (memcmp(v13, &__s2, 0x28uLL))
              {
                v33 = 0u;
                v34 = 0u;
                *(_OWORD *)v31 = 0u;
                v32 = 0u;
                v29 = 0u;
                v30 = 0u;
                *(_OWORD *)__str = 0u;
                v28 = 0u;
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  v9 = VRTraceErrorLogLevelToCSTR();
                  v10 = *MEMORY[0x1E0CF2758];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  {
                    v11 = FormatToCStr((uint64_t)v13, __str, 0x40uLL);
                    v12 = FormatToCStr((uint64_t)&__s2, v31, 0x40uLL);
                    *(_DWORD *)buf = 136316162;
                    v18 = v9;
                    v19 = 2080;
                    v20 = "_VCAudioCaptionsBufferInfoCollection_InsertBufferInfo";
                    v21 = 1024;
                    v22 = 178;
                    v23 = 2080;
                    v24 = v11;
                    v25 = 2080;
                    v26 = v12;
                    _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unexpected buffer format. Format=%s doesn't match existing format=%s", buf, 0x30u);
                  }
                }
                break;
              }
            }
          }
        }
      }
      if (++v4 >= (unint64_t)objc_msgSend(*(id *)(v3 + 8), "count"))
        goto LABEL_10;
    }
    v8 = 0;
  }
  else
  {
LABEL_10:
    objc_msgSend(*(id *)(v3 + 8), "addObject:", v2);
    v8 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v8;
}

uint64_t __VCAudioCaptionsBufferInfoCollection_CopyOrderedBufferInfos_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)initWithBufferLength:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
