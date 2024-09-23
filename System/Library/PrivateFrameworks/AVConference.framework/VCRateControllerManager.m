@implementation VCRateControllerManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_25);
  return (id)sharedInstance_rateControllerManager;
}

VCRateControllerManager *__41__VCRateControllerManager_sharedInstance__block_invoke()
{
  VCRateControllerManager *result;

  result = objc_alloc_init(VCRateControllerManager);
  sharedInstance_rateControllerManager = (uint64_t)result;
  return result;
}

- (VCRateControllerManager)init
{
  VCRateControllerManager *v2;
  VCRateSharingGroup *v3;
  NSMutableDictionary *v4;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  objc_super v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  VCRateControllerManager *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)VCRateControllerManager;
  v2 = -[VCObject init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VCRateSharingGroup);
    v2->_defaultSharingGroup = v3;
    if (v3)
    {
      pthread_mutex_init(&v2->_sharingGroupMutex, 0);
      v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v2->_sharingGroup = v4;
      if (v4)
        return v2;
      if ((VCRateControllerManager *)objc_opt_class() == v2)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCRateControllerManager init].cold.2();
        }
        goto LABEL_24;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCRateControllerManager performSelector:](v2, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (v11 = VRTraceErrorLogLevelToCSTR(),
            v9 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
      {
LABEL_24:

        return 0;
      }
      *(_DWORD *)buf = 136316162;
      v14 = v11;
      v15 = 2080;
      v16 = "-[VCRateControllerManager init]";
      v17 = 1024;
      v18 = 39;
      v19 = 2112;
      v20 = v7;
      v21 = 2048;
      v22 = v2;
      v10 = " [%s] %s:%d %@(%p) Failed to allocate sharing group dictionary";
    }
    else
    {
      if ((VCRateControllerManager *)objc_opt_class() == v2)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCRateControllerManager init].cold.1();
        }
        goto LABEL_24;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCRateControllerManager performSelector:](v2, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_24;
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      *(_DWORD *)buf = 136316162;
      v14 = v8;
      v15 = 2080;
      v16 = "-[VCRateControllerManager init]";
      v17 = 1024;
      v18 = 36;
      v19 = 2112;
      v20 = v6;
      v21 = 2048;
      v22 = v2;
      v10 = " [%s] %s:%d %@(%p) Failed to allocate default sharing group";
    }
    _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x30u);
    goto LABEL_24;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  pthread_mutex_destroy(&self->_sharingGroupMutex);
  v3.receiver = self;
  v3.super_class = (Class)VCRateControllerManager;
  -[VCObject dealloc](&v3, sel_dealloc);
}

- (id)prepareEndPointKeyFromConnection:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id result;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  VCRateControllerManager *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  if (!objc_msgSend(a3, "connectionResult"))
  {
    if ((VCRateControllerManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCRateControllerManager prepareEndPointKeyFromConnection:].cold.1();
      }
      return 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[VCRateControllerManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return 0;
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136316162;
    v22 = v12;
    v23 = 2080;
    v24 = "-[VCRateControllerManager prepareEndPointKeyFromConnection:]";
    v25 = 1024;
    v26 = 64;
    v27 = 2112;
    v28 = v9;
    v29 = 2048;
    v30 = self;
    v14 = " [%s] %s:%d %@(%p) No connectionResult";
    goto LABEL_46;
  }
  v19 = 0u;
  v20 = 0u;
  v18 = 0u;
  IPToString();
  v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &v18);
  if (!v4)
  {
    if ((VCRateControllerManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCRateControllerManager prepareEndPointKeyFromConnection:].cold.2();
      }
      return 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[VCRateControllerManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return 0;
    v15 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136316162;
    v22 = v15;
    v23 = 2080;
    v24 = "-[VCRateControllerManager prepareEndPointKeyFromConnection:]";
    v25 = 1024;
    v26 = 69;
    v27 = 2112;
    v28 = v10;
    v29 = 2048;
    v30 = self;
    v14 = " [%s] %s:%d %@(%p) No sourceIP";
LABEL_46:
    _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0x30u);
    return 0;
  }
  v5 = v4;
  IPToString();
  v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &v18);
  if (v6)
  {
    result = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v5, v6, v18, v19, v20);
    if (result)
      return result;
    if ((VCRateControllerManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCRateControllerManager prepareEndPointKeyFromConnection:].cold.4();
      }
      return 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCRateControllerManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v22 = v16;
        v23 = 2080;
        v24 = "-[VCRateControllerManager prepareEndPointKeyFromConnection:]";
        v25 = 1024;
        v26 = 76;
        v27 = 2112;
        v28 = v8;
        v29 = 2048;
        v30 = self;
        v14 = " [%s] %s:%d %@(%p) No endPointKey";
        goto LABEL_46;
      }
    }
  }
  else
  {
    if ((VCRateControllerManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCRateControllerManager prepareEndPointKeyFromConnection:].cold.3();
      }
      return 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCRateControllerManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v22 = v17;
        v23 = 2080;
        v24 = "-[VCRateControllerManager prepareEndPointKeyFromConnection:]";
        v25 = 1024;
        v26 = 73;
        v27 = 2112;
        v28 = v11;
        v29 = 2048;
        v30 = self;
        v14 = " [%s] %s:%d %@(%p) No destIP";
        goto LABEL_46;
      }
    }
  }
  return 0;
}

- (void)cleanupRateControllerSharingGroupWithConnection:(id)a3 usePolicy:(unsigned int)a4
{
  id v6;
  id v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCRateControllerManager *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a3 || a4 != 1)
    return;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[VCRateControllerManager prepareEndPointKeyFromConnection:](self, "prepareEndPointKeyFromConnection:", a3);
    if (v6)
    {
      v7 = v6;
      pthread_mutex_lock(&self->_sharingGroupMutex);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sharingGroup, "setObject:forKeyedSubscript:", 0, v7);
      pthread_mutex_unlock(&self->_sharingGroupMutex);
      return;
    }
    if ((VCRateControllerManager *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = (const __CFString *)-[VCRateControllerManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v9 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return;
      v13 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return;
      v14 = 136316162;
      v15 = v13;
      v16 = 2080;
      v17 = "-[VCRateControllerManager cleanupRateControllerSharingGroupWithConnection:usePolicy:]";
      v18 = 1024;
      v19 = 88;
      v20 = 2112;
      v21 = v9;
      v22 = 2048;
      v23 = self;
      v12 = " [%s] %s:%d %@(%p) No endPointKey";
LABEL_27:
      _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v14, 0x30u);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCRateControllerManager cleanupRateControllerSharingGroupWithConnection:usePolicy:].cold.1();
    }
  }
  else if ((VCRateControllerManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCRateControllerManager cleanupRateControllerSharingGroupWithConnection:usePolicy:].cold.2();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCRateControllerManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v14 = 136316162;
        v15 = v10;
        v16 = 2080;
        v17 = "-[VCRateControllerManager cleanupRateControllerSharingGroupWithConnection:usePolicy:]";
        v18 = 1024;
        v19 = 86;
        v20 = 2112;
        v21 = v8;
        v22 = 2048;
        v23 = self;
        v12 = " [%s] %s:%d %@(%p) VCConnection type does not match";
        goto LABEL_27;
      }
    }
  }
}

- (id)getRateControllerSharingGroupWithConnection:(id)a3 usePolicy:(unsigned int)a4
{
  _opaque_pthread_mutex_t *p_sharingGroupMutex;
  VCRateSharingGroup *v8;
  id v9;
  id v10;
  uint64_t v11;
  VCRateControllerManager *v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  NSObject *v28;
  VCRateSharingGroup *v29;
  const __CFString *v30;
  uint64_t v31;
  NSObject *v32;
  VCRateSharingGroup *defaultSharingGroup;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  uint64_t v37;
  NSObject *v38;
  VCRateSharingGroup *v39;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  uint64_t v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  _BYTE v50[24];
  __int128 v51;
  VCRateControllerManager *v52;
  _BYTE v53[20];
  __int16 v54;
  id v55;
  __int16 v56;
  unsigned int v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  p_sharingGroupMutex = &self->_sharingGroupMutex;
  pthread_mutex_lock(&self->_sharingGroupMutex);
  v8 = self->_defaultSharingGroup;
  if (!a3 || a4 != 1)
    goto LABEL_31;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = -[VCRateControllerManager prepareEndPointKeyFromConnection:](self, "prepareEndPointKeyFromConnection:", a3);
    if (v9)
    {
      v10 = v9;
      v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_sharingGroup, "objectForKeyedSubscript:", v9);
      v12 = (VCRateControllerManager *)objc_opt_class();
      if (v11)
      {
        if (v12 == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            goto LABEL_20;
          v15 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_20;
          *(_DWORD *)v50 = 136315906;
          *(_QWORD *)&v50[4] = v15;
          *(_WORD *)&v50[12] = 2080;
          *(_QWORD *)&v50[14] = "-[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:]";
          *(_WORD *)&v50[22] = 1024;
          LODWORD(v51) = 116;
          WORD2(v51) = 2112;
          *(_QWORD *)((char *)&v51 + 6) = v10;
          v17 = " [%s] %s:%d Sharing group found for key=%@";
          v18 = v16;
          v19 = 38;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v13 = (const __CFString *)-[VCRateControllerManager performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v13 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            goto LABEL_20;
          v20 = VRTraceErrorLogLevelToCSTR();
          v21 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_20;
          *(_DWORD *)v50 = 136316418;
          *(_QWORD *)&v50[4] = v20;
          *(_WORD *)&v50[12] = 2080;
          *(_QWORD *)&v50[14] = "-[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:]";
          *(_WORD *)&v50[22] = 1024;
          LODWORD(v51) = 116;
          WORD2(v51) = 2112;
          *(_QWORD *)((char *)&v51 + 6) = v13;
          HIWORD(v51) = 2048;
          v52 = self;
          *(_WORD *)v53 = 2112;
          *(_QWORD *)&v53[2] = v10;
          v17 = " [%s] %s:%d %@(%p) Sharing group found for key=%@";
          v18 = v21;
          v19 = 58;
        }
        _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, v50, v19);
LABEL_20:
        v8 = (VCRateSharingGroup *)(id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sharingGroup, "objectForKeyedSubscript:", v10, *(_OWORD *)v50, *(_QWORD *)&v50[16], v51, v52, *(_OWORD *)v53);
        goto LABEL_31;
      }
      if (v12 == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v22 = VRTraceErrorLogLevelToCSTR();
          v23 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v50 = 136315906;
            *(_QWORD *)&v50[4] = v22;
            *(_WORD *)&v50[12] = 2080;
            *(_QWORD *)&v50[14] = "-[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:]";
            *(_WORD *)&v50[22] = 1024;
            LODWORD(v51) = 111;
            WORD2(v51) = 2112;
            *(_QWORD *)((char *)&v51 + 6) = v10;
            v24 = " [%s] %s:%d No existing sharing group found for key=%@, creating a new one";
            v25 = v23;
            v26 = 38;
LABEL_28:
            _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, v24, v50, v26);
          }
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v14 = (const __CFString *)-[VCRateControllerManager performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v14 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v27 = VRTraceErrorLogLevelToCSTR();
          v28 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v50 = 136316418;
            *(_QWORD *)&v50[4] = v27;
            *(_WORD *)&v50[12] = 2080;
            *(_QWORD *)&v50[14] = "-[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:]";
            *(_WORD *)&v50[22] = 1024;
            LODWORD(v51) = 111;
            WORD2(v51) = 2112;
            *(_QWORD *)((char *)&v51 + 6) = v14;
            HIWORD(v51) = 2048;
            v52 = self;
            *(_WORD *)v53 = 2112;
            *(_QWORD *)&v53[2] = v10;
            v24 = " [%s] %s:%d %@(%p) No existing sharing group found for key=%@, creating a new one";
            v25 = v28;
            v26 = 58;
            goto LABEL_28;
          }
        }
      }
      v29 = -[VCRateSharingGroup initWithIdentifier:]([VCRateSharingGroup alloc], "initWithIdentifier:", v10);
      if (v29)
      {
        v8 = v29;
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sharingGroup, "setObject:forKeyedSubscript:", v29, v10);
      }
      else
      {
        if ((VCRateControllerManager *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:].cold.2();
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v43 = (const __CFString *)-[VCRateControllerManager performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v43 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v48 = VRTraceErrorLogLevelToCSTR();
            v49 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v50 = 136316162;
              *(_QWORD *)&v50[4] = v48;
              *(_WORD *)&v50[12] = 2080;
              *(_QWORD *)&v50[14] = "-[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:]";
              *(_WORD *)&v50[22] = 1024;
              LODWORD(v51) = 113;
              WORD2(v51) = 2112;
              *(_QWORD *)((char *)&v51 + 6) = v43;
              HIWORD(v51) = 2048;
              v52 = self;
              _os_log_error_impl(&dword_1D8A54000, v49, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate sharing group", v50, 0x30u);
            }
          }
        }
        v8 = 0;
      }
      goto LABEL_31;
    }
    if ((VCRateControllerManager *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v42 = (const __CFString *)-[VCRateControllerManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v42 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_31;
      v47 = VRTraceErrorLogLevelToCSTR();
      v45 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_31;
      *(_DWORD *)v50 = 136316162;
      *(_QWORD *)&v50[4] = v47;
      *(_WORD *)&v50[12] = 2080;
      *(_QWORD *)&v50[14] = "-[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:]";
      *(_WORD *)&v50[22] = 1024;
      LODWORD(v51) = 109;
      WORD2(v51) = 2112;
      *(_QWORD *)((char *)&v51 + 6) = v42;
      HIWORD(v51) = 2048;
      v52 = self;
      v46 = " [%s] %s:%d %@(%p) No endPointKey";
      goto LABEL_66;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:].cold.1();
    }
  }
  else
  {
    if ((VCRateControllerManager *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v41 = (const __CFString *)-[VCRateControllerManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v41 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_31;
      v44 = VRTraceErrorLogLevelToCSTR();
      v45 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_31;
      *(_DWORD *)v50 = 136316162;
      *(_QWORD *)&v50[4] = v44;
      *(_WORD *)&v50[12] = 2080;
      *(_QWORD *)&v50[14] = "-[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:]";
      *(_WORD *)&v50[22] = 1024;
      LODWORD(v51) = 107;
      WORD2(v51) = 2112;
      *(_QWORD *)((char *)&v51 + 6) = v41;
      HIWORD(v51) = 2048;
      v52 = self;
      v46 = " [%s] %s:%d %@(%p) VCConnection type does not match resolve policy";
LABEL_66:
      _os_log_error_impl(&dword_1D8A54000, v45, OS_LOG_TYPE_ERROR, v46, v50, 0x30u);
      goto LABEL_31;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:].cold.3();
    }
  }
LABEL_31:
  pthread_mutex_unlock(p_sharingGroupMutex);
  if ((VCRateControllerManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v31 = VRTraceErrorLogLevelToCSTR();
      v32 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        defaultSharingGroup = self->_defaultSharingGroup;
        *(_DWORD *)v50 = 136316674;
        *(_QWORD *)&v50[4] = v31;
        *(_WORD *)&v50[12] = 2080;
        *(_QWORD *)&v50[14] = "-[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:]";
        *(_WORD *)&v50[22] = 1024;
        LODWORD(v51) = 127;
        WORD2(v51) = 2048;
        *(_QWORD *)((char *)&v51 + 6) = v8;
        HIWORD(v51) = 2048;
        v52 = (VCRateControllerManager *)defaultSharingGroup;
        *(_WORD *)v53 = 2048;
        *(_QWORD *)&v53[2] = a3;
        *(_WORD *)&v53[10] = 1024;
        *(_DWORD *)&v53[12] = a4;
        v34 = " [%s] %s:%d Returning sharingGroup=%p defaultSharingGroup=%p connection=%p policy=%d";
        v35 = v32;
        v36 = 64;
LABEL_41:
        _os_log_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_DEFAULT, v34, v50, v36);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v30 = (const __CFString *)-[VCRateControllerManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v30 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v37 = VRTraceErrorLogLevelToCSTR();
      v38 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v39 = self->_defaultSharingGroup;
        *(_DWORD *)v50 = 136317186;
        *(_QWORD *)&v50[4] = v37;
        *(_WORD *)&v50[12] = 2080;
        *(_QWORD *)&v50[14] = "-[VCRateControllerManager getRateControllerSharingGroupWithConnection:usePolicy:]";
        *(_WORD *)&v50[22] = 1024;
        LODWORD(v51) = 127;
        WORD2(v51) = 2112;
        *(_QWORD *)((char *)&v51 + 6) = v30;
        HIWORD(v51) = 2048;
        v52 = self;
        *(_WORD *)v53 = 2048;
        *(_QWORD *)&v53[2] = v8;
        *(_WORD *)&v53[10] = 2048;
        *(_QWORD *)&v53[12] = v39;
        v54 = 2048;
        v55 = a3;
        v56 = 1024;
        v57 = a4;
        v34 = " [%s] %s:%d %@(%p) Returning sharingGroup=%p defaultSharingGroup=%p connection=%p policy=%d";
        v35 = v38;
        v36 = 84;
        goto LABEL_41;
      }
    }
  }
  return v8;
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate sharing group dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)prepareEndPointKeyFromConnection:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No connectionResult", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)prepareEndPointKeyFromConnection:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No sourceIP", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)prepareEndPointKeyFromConnection:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No destIP", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)prepareEndPointKeyFromConnection:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No endPointKey", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)cleanupRateControllerSharingGroupWithConnection:usePolicy:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No endPointKey", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)cleanupRateControllerSharingGroupWithConnection:usePolicy:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCConnection type does not match", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)getRateControllerSharingGroupWithConnection:usePolicy:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No endPointKey", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)getRateControllerSharingGroupWithConnection:usePolicy:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate sharing group", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)getRateControllerSharingGroupWithConnection:usePolicy:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCConnection type does not match resolve policy", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
