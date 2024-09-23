@implementation VCIDRScheduler

- (VCIDRScheduler)initWithStreams:(id)a3 captureFramerate:(unsigned int)a4
{
  VCIDRScheduler *v6;
  uint64_t v7;
  NSObject *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)VCIDRScheduler;
  v6 = -[VCIDRScheduler init](&v10, sel_init);
  if (v6)
  {
    v6->_streams = (NSArray *)a3;
    v6->_captureFramerate = a4;
    v6->_schedulerGroups = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6->_schedulerItems = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[VCIDRScheduler computeBasePeriod](v6, "computeBasePeriod");
    if (!-[VCIDRScheduler computeCaptureFramerate](v6, "computeCaptureFramerate"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCIDRScheduler initWithStreams:captureFramerate:].cold.1(v7, v8);
      }

      v6 = 0;
    }
    -[VCIDRScheduler computeGroupList](v6, "computeGroupList");
    -[VCIDRScheduler computeSchedulerItemList](v6, "computeSchedulerItemList");
    -[VCIDRScheduler computeSchedulerItemsBudget](v6, "computeSchedulerItemsBudget");
    -[VCIDRScheduler computeSchedulerItemsPosition](v6, "computeSchedulerItemsPosition");
    -[VCIDRScheduler computeStreamsIDRPosition](v6, "computeStreamsIDRPosition");
    -[VCIDRScheduler realignStreams](v6, "realignStreams");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCIDRScheduler;
  -[VCIDRScheduler dealloc](&v3, sel_dealloc);
}

+ (unsigned)computeGcdForX:(unsigned int)a3 y:(unsigned int)a4
{
  unsigned int result;

  if (!a3)
    return a4;
  do
  {
    result = a3;
    a3 = a4 % a3;
    a4 = result;
  }
  while (a3);
  return result;
}

- (void)computeBasePeriod
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[24];
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  v4 = 80;
  v5 = v0;
  v6 = v1;
  _os_log_debug_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Computed base period: %d frames", v3, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (BOOL)computeCaptureFramerate
{
  unsigned int *p_captureFramerate;
  unint64_t v3;
  _BOOL4 v4;
  NSArray *streams;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  unsigned int v14;
  uint64_t v15;
  NSObject *v16;
  unsigned int v17;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  int v28;
  _BYTE v29[128];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  p_captureFramerate = &self->_captureFramerate;
  HIDWORD(v3) = 652835029 * self->_captureFramerate * self->_basePeriodMs;
  LODWORD(v3) = HIDWORD(v3);
  if ((v3 >> 3) < 0x418938)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    streams = self->_streams;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](streams, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v31;
LABEL_7:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(streams);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v9);
        v11 = *p_captureFramerate;
        if (v11 % objc_msgSend(v10, "framerate"))
          break;
        if (v7 == ++v9)
        {
          v7 = -[NSArray countByEnumeratingWithState:objects:count:](streams, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
          if (v7)
            goto LABEL_7;
          goto LABEL_13;
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_20;
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (v4)
      {
        v17 = *p_captureFramerate;
        v19 = 136316162;
        v20 = v15;
        v21 = 2080;
        v22 = "-[VCIDRScheduler computeCaptureFramerate]";
        v23 = 1024;
        v24 = 90;
        v25 = 1024;
        v26 = v17;
        v27 = 1024;
        v28 = objc_msgSend(v10, "framerate");
        _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d Configured max capture frame _captureFramerate=%d is incompatible with streamInfo.framerate=%d", (uint8_t *)&v19, 0x28u);
        goto LABEL_20;
      }
    }
    else
    {
LABEL_13:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v14 = *p_captureFramerate;
          v19 = 136315906;
          v20 = v12;
          v21 = 2080;
          v22 = "-[VCIDRScheduler computeCaptureFramerate]";
          v23 = 1024;
          v24 = 94;
          v25 = 1024;
          v26 = v14;
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Computed capture frame rate: %d", (uint8_t *)&v19, 0x22u);
        }
      }
      LOBYTE(v4) = 1;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    {
LABEL_20:
      LOBYTE(v4) = 0;
      return v4;
    }
    VRTraceErrorLogLevelToCSTR();
    v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (v4)
    {
      -[VCIDRScheduler computeCaptureFramerate].cold.1();
      goto LABEL_20;
    }
  }
  return v4;
}

- (void)computeGroupList
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d Computed group list: %@");
  OUTLINED_FUNCTION_3();
}

- (void)computeSchedulerItemList
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d Computed scheduler item list: %@");
  OUTLINED_FUNCTION_3();
}

- (void)computeSchedulerItemsBudget
{
  unsigned int framesPerBasePeriod;
  NSMutableArray *schedulerItems;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  unsigned int basePeriodMs;
  unsigned int v14;
  uint64_t v15;
  __int128 v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  unsigned int v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  unsigned int v29;
  unsigned int v30;
  __int128 v31;
  NSMutableArray *obj;
  _BYTE v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  _BYTE v45[10];
  __int16 v46;
  unsigned int v47;
  _BYTE v48[128];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  framesPerBasePeriod = self->_framesPerBasePeriod;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  schedulerItems = self->_schedulerItems;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](schedulerItems, "countByEnumeratingWithState:objects:count:", &v49, v48, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v50 != v8)
          objc_enumerationMutation(schedulerItems);
        v7 += objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "weightFactor");
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](schedulerItems, "countByEnumeratingWithState:objects:count:", &v49, v48, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    v12 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        basePeriodMs = self->_basePeriodMs;
        v14 = self->_framesPerBasePeriod;
        *(_DWORD *)buf = 136316418;
        v39 = v10;
        v40 = 2080;
        v41 = "-[VCIDRScheduler computeSchedulerItemsBudget]";
        v42 = 1024;
        v43 = 128;
        v44 = 1024;
        *(_DWORD *)v45 = basePeriodMs;
        *(_WORD *)&v45[4] = 1024;
        *(_DWORD *)&v45[6] = v7;
        v46 = 1024;
        v47 = v14;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Total budget: time:%dms weight:%d frames:%d", buf, 0x2Eu);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v29 = self->_basePeriodMs;
      v30 = self->_framesPerBasePeriod;
      *(_DWORD *)buf = 136316418;
      v39 = v10;
      v40 = 2080;
      v41 = "-[VCIDRScheduler computeSchedulerItemsBudget]";
      v42 = 1024;
      v43 = 128;
      v44 = 1024;
      *(_DWORD *)v45 = v29;
      *(_WORD *)&v45[4] = 1024;
      *(_DWORD *)&v45[6] = v7;
      v46 = 1024;
      v47 = v30;
      _os_log_debug_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Total budget: time:%dms weight:%d frames:%d", buf, 0x2Eu);
    }
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = self->_schedulerItems;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
  if (v15)
  {
    v18 = v15;
    v19 = *(_QWORD *)v35;
    *(_QWORD *)&v16 = 136315906;
    v31 = v16;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v35 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        v22 = self->_basePeriodMs;
        if (v7)
          v22 = objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "weightFactor") * v22 / v7;
        LODWORD(v17) = self->_captureFramerate;
        v23 = llround((double)v22 * (double)v17 / 1000.0);
        if (v23 <= 1)
          v23 = 1;
        if (v23 >= framesPerBasePeriod)
          v24 = framesPerBasePeriod;
        else
          v24 = v23;
        objc_msgSend(v21, "setBudgetInCaptureFrames:", v24, v31);
        v25 = objc_msgSend(v21, "budgetInCaptureFrames");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          v26 = VRTraceErrorLogLevelToCSTR();
          v27 = *MEMORY[0x1E0CF2758];
          v28 = *MEMORY[0x1E0CF2758];
          if (*MEMORY[0x1E0CF2748])
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v31;
              v39 = v26;
              v40 = 2080;
              v41 = "-[VCIDRScheduler computeSchedulerItemsBudget]";
              v42 = 1024;
              v43 = 135;
              v44 = 2112;
              *(_QWORD *)v45 = v21;
              _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Bugdet computed for item: %@", buf, 0x26u);
            }
          }
          else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v31;
            v39 = v26;
            v40 = 2080;
            v41 = "-[VCIDRScheduler computeSchedulerItemsBudget]";
            v42 = 1024;
            v43 = 135;
            v44 = 2112;
            *(_QWORD *)v45 = v21;
            _os_log_debug_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Bugdet computed for item: %@", buf, 0x26u);
          }
        }
        framesPerBasePeriod -= v25;
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
    }
    while (v18);
  }
}

- (void)placeRemainingItems:(id)a3 placedItems:(id)a4 leftItem:(id)a5 rightItem:(id)a6
{
  void *v8;
  int v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  unsigned int v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  id v46;
  void *v48;
  id obj;
  unsigned int v50;
  _BYTE v51[128];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  _BYTE v63[10];
  __int16 v64;
  unsigned int v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v9 = objc_msgSend(a5, "framePosition");
  v50 = objc_msgSend(a5, "budgetInCaptureFrames") + v9;
  objc_msgSend(a3, "removeObject:", v8);
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  obj = a3;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  v46 = a5;
  v11 = objc_msgSend(a5, "budgetInCaptureFrames");
  v12 = objc_msgSend(v8, "budgetInCaptureFrames");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    v15 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        v57 = v13;
        v58 = 2080;
        v59 = "-[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:]";
        v60 = 1024;
        v61 = 156;
        v62 = 1024;
        *(_DWORD *)v63 = v50;
        *(_WORD *)&v63[4] = 1024;
        *(_DWORD *)&v63[6] = v11;
        v64 = 1024;
        v65 = v12;
        v66 = 2112;
        v67 = v8;
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Position next item (start position=%d leftDist=%d rightDist=%d): %@", buf, 0x38u);
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316674;
      v57 = v13;
      v58 = 2080;
      v59 = "-[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:]";
      v60 = 1024;
      v61 = 156;
      v62 = 1024;
      *(_DWORD *)v63 = v50;
      *(_WORD *)&v63[4] = 1024;
      *(_DWORD *)&v63[6] = v11;
      v64 = 1024;
      v65 = v12;
      v66 = 2112;
      v67 = v8;
      _os_log_debug_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Position next item (start position=%d leftDist=%d rightDist=%d): %@", buf, 0x38u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    v18 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v57 = v16;
        v58 = 2080;
        v59 = "-[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:]";
        v60 = 1024;
        v61 = 157;
        v62 = 2112;
        *(_QWORD *)v63 = v46;
        _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Left item: %@", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      -[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:].cold.3();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    v21 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v57 = v19;
        v58 = 2080;
        v59 = "-[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:]";
        v60 = 1024;
        v61 = 158;
        v62 = 2112;
        *(_QWORD *)v63 = a6;
        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Right item: %@", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      -[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:].cold.2();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    v24 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v57 = v22;
        v58 = 2080;
        v59 = "-[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:]";
        v60 = 1024;
        v61 = 159;
        v62 = 2112;
        *(_QWORD *)v63 = a3;
        _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Remaining items: %@", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      -[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:].cold.1();
    }
  }
  v43 = v8;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v25 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v52, v51, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v53;
    v28 = v10;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v53 != v27)
          objc_enumerationMutation(obj);
        v30 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v29);
        if (v11 > v12
          || v11 == v12
          && (v36 = objc_msgSend(a6, "weightFactor"), v36 < objc_msgSend(v46, "weightFactor")))
        {
          objc_msgSend(v10, "addObject:", v30);
          v12 += objc_msgSend(v30, "budgetInCaptureFrames");
          if ((int)VRTraceGetErrorLogLevelForModule() < 8)
            goto LABEL_46;
          v31 = VRTraceErrorLogLevelToCSTR();
          v32 = *MEMORY[0x1E0CF2758];
          v33 = *MEMORY[0x1E0CF2758];
          if (*MEMORY[0x1E0CF2748])
          {
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316674;
              v57 = v31;
              v58 = 2080;
              v59 = "-[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:]";
              v60 = 1024;
              v61 = 165;
              v62 = 1024;
              *(_DWORD *)v63 = v50;
              *(_WORD *)&v63[4] = 1024;
              *(_DWORD *)&v63[6] = v11;
              v64 = 1024;
              v65 = v12;
              v66 = 2112;
              v67 = v30;
              v34 = v32;
              v35 = " [%s] %s:%d Place item in the right bucket (position=%d leftDist=%d rightDist=%d): %@ ";
LABEL_41:
              _os_log_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_DEFAULT, v35, buf, 0x38u);
            }
          }
          else if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136316674;
            v57 = v31;
            v58 = 2080;
            v59 = "-[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:]";
            v60 = 1024;
            v61 = 165;
            v62 = 1024;
            *(_DWORD *)v63 = v50;
            *(_WORD *)&v63[4] = 1024;
            *(_DWORD *)&v63[6] = v11;
            v64 = 1024;
            v65 = v12;
            v66 = 2112;
            v67 = v30;
            v40 = v32;
            v41 = " [%s] %s:%d Place item in the right bucket (position=%d leftDist=%d rightDist=%d): %@ ";
LABEL_49:
            _os_log_debug_impl(&dword_1D8A54000, v40, OS_LOG_TYPE_DEBUG, v41, buf, 0x38u);
          }
        }
        else
        {
          objc_msgSend(v48, "addObject:", v30);
          v11 += objc_msgSend(v30, "budgetInCaptureFrames");
          v50 += objc_msgSend(v30, "budgetInCaptureFrames");
          if ((int)VRTraceGetErrorLogLevelForModule() < 8)
            goto LABEL_46;
          v37 = VRTraceErrorLogLevelToCSTR();
          v38 = *MEMORY[0x1E0CF2758];
          v39 = *MEMORY[0x1E0CF2758];
          if (*MEMORY[0x1E0CF2748])
          {
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316674;
              v57 = v37;
              v58 = 2080;
              v59 = "-[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:]";
              v60 = 1024;
              v61 = 170;
              v62 = 1024;
              *(_DWORD *)v63 = v50;
              *(_WORD *)&v63[4] = 1024;
              *(_DWORD *)&v63[6] = v11;
              v64 = 1024;
              v65 = v12;
              v66 = 2112;
              v67 = v30;
              v34 = v38;
              v35 = " [%s] %s:%d Place item in the left bucket (position=%d leftDist=%d rightDist=%d): %@ ";
              goto LABEL_41;
            }
          }
          else if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136316674;
            v57 = v37;
            v58 = 2080;
            v59 = "-[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:]";
            v60 = 1024;
            v61 = 170;
            v62 = 1024;
            *(_DWORD *)v63 = v50;
            *(_WORD *)&v63[4] = 1024;
            *(_DWORD *)&v63[6] = v11;
            v64 = 1024;
            v65 = v12;
            v66 = 2112;
            v67 = v30;
            v40 = v38;
            v41 = " [%s] %s:%d Place item in the left bucket (position=%d leftDist=%d rightDist=%d): %@ ";
            goto LABEL_49;
          }
        }
        v10 = v28;
LABEL_46:
        ++v29;
      }
      while (v26 != v29);
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v51, 16);
      v26 = v42;
    }
    while (v42);
  }
  objc_msgSend(v43, "setFramePosition:", v50);
  objc_msgSend(a4, "addObject:", v43);
  if (objc_msgSend(v48, "count"))
    -[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:](self, "placeRemainingItems:placedItems:leftItem:rightItem:", v48, a4, v46, v43);
  if (objc_msgSend(v10, "count"))
    -[VCIDRScheduler placeRemainingItems:placedItems:leftItem:rightItem:](self, "placeRemainingItems:placedItems:leftItem:rightItem:", v10, a4, v43, a6);

}

- (void)computeSchedulerItemsPosition
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d Placing first item: %@");
  OUTLINED_FUNCTION_3();
}

- (void)computeStreamsIDRPosition
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[128];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)-[NSMutableDictionary allValues](self->_schedulerGroups, "allValues");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "computeStreamsIDRPosition");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
    }
    while (v4);
  }
}

- (void)realignStreams
{
  NSArray *streams;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t i;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  unsigned int v17;
  int v18;
  uint64_t v19;
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  streams = self->_streams;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](streams, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v27;
    v8 = -1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(streams);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v10, "weightFactor") < v8)
        {
          v8 = objc_msgSend(v10, "weightFactor");
          v6 = objc_msgSend(v10, "framePosition");
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](streams, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = self->_streams;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
        v17 = objc_msgSend(v16, "framePosition");
        v18 = objc_msgSend(v16, "framePosition");
        if (v17 >= v6)
          v19 = v18 - v6;
        else
          v19 = v18 - v6 + objc_msgSend(v16, "framesPerIdrPeriod");
        objc_msgSend(v16, "setFramePosition:", v19);
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
    }
    while (v13);
  }
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IDR Scheduler: framerate:%d, basePeriod:%dms framesPerBasePeriod:%d groups:%@"), self->_captureFramerate, self->_basePeriodMs, self->_framesPerBasePeriod, self->_schedulerGroups);
}

- (unsigned)basePeriodMs
{
  return self->_basePeriodMs;
}

- (unsigned)captureFramerate
{
  return self->_captureFramerate;
}

- (void)initWithStreams:(uint64_t)a1 captureFramerate:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
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
  v5 = "-[VCIDRScheduler initWithStreams:captureFramerate:]";
  v6 = 1024;
  v7 = 39;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to compute a valid capture framerate", (uint8_t *)&v2, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

- (void)computeCaptureFramerate
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[24];
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  v4 = 85;
  v5 = v0;
  v6 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Computed capture frame rate is not a valid _captureFramerate=%d", v3, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)placeRemainingItems:placedItems:leftItem:rightItem:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d Remaining items: %@");
  OUTLINED_FUNCTION_3();
}

- (void)placeRemainingItems:placedItems:leftItem:rightItem:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d Right item: %@");
  OUTLINED_FUNCTION_3();
}

- (void)placeRemainingItems:placedItems:leftItem:rightItem:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d Left item: %@");
  OUTLINED_FUNCTION_3();
}

@end
