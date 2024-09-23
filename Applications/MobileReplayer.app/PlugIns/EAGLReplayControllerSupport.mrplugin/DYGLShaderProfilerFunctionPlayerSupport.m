@implementation DYGLShaderProfilerFunctionPlayerSupport

- (DYEAGLDebugFunctionPlayer)strongFunctionPlayer
{
  return (DYEAGLDebugFunctionPlayer *)objc_loadWeakRetained((id *)&self->_functionPlayer);
}

- (DYEAGLDebugPlaybackEngine)strongPlaybackEngine
{
  return (DYEAGLDebugPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (DYGLShaderProfilerFunctionPlayerSupport)initWithDebugEAGLPlaybackEngine:(id)a3 payLoad:(id)a4
{
  id v6;
  id v7;
  DYGLShaderProfilerFunctionPlayerSupport *v8;
  DYGLShaderProfilerFunctionPlayerSupport *v9;
  DYGLShaderProfilerFunctionPlayerSupport *v10;
  void *v11;
  id *p_payLoad;
  uint64_t v13;
  NSArray *functionFlag;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  unsigned int v19;
  unint64_t v20;
  const __CFDictionary *v21;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)DYGLShaderProfilerFunctionPlayerSupport;
  v8 = -[DYGLShaderProfilerFunctionPlayerSupport init](&v23, "init");
  v9 = v8;
  v10 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_playbackEngine, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "player"));
    objc_storeWeak((id *)&v9->_functionPlayer, v11);

    p_payLoad = (id *)&v9->_payLoad;
    objc_storeStrong((id *)&v9->_payLoad, a4);
    v13 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v10->_payLoad, "objectForKeyedSubscript:", CFSTR("function flag")));
    functionFlag = v10->_functionFlag;
    v10->_functionFlag = (NSArray *)v13;

    if (-[NSArray count](v10->_functionFlag, "count"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_payLoad, "objectForKeyedSubscript:", CFSTR("harvest draw call footprint")));
      v10->_harvestDrawCallFootprint = objc_msgSend(v15, "BOOLValue");

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v10->_payLoad, "objectForKeyedSubscript:", CFSTR("usc sampling period")));
      v10->_uscSampling_Period = objc_msgSend(v16, "unsignedIntValue");

      if (v10->_uscSampling_Period)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_payLoad, "objectForKeyedSubscript:", CFSTR("draw call num")));
        v18 = objc_msgSend(v17, "unsignedIntValue");

        v10->_uscSampling_SampleBufferSize = 0x2000000;
        v19 = 60 * v18 * v10->_uscSampling_Period;
        if (v19 <= 0x6666)
          v20 = 26214;
        else
          v20 = v19;
        v10->_uscSampling_AddressBufferSize = 40 * v20;
        if (vm_allocate(mach_task_self_, (vm_address_t *)&v9->_uscSampling_SampleBuffer, 0x2000000uLL, 1))
          goto LABEL_8;
        sub_E35C((uint64_t)&v9->_uscSampling_AddressBuffer, v20);
        memset(v10->_uscSampling_SampleBuffer, 255, v10->_uscSampling_SampleBufferSize);
        memset(v10->_uscSampling_AddressBuffer.__begin_, 255, v10->_uscSampling_AddressBufferSize);
      }
      v21 = IOServiceMatching("IOAcceleratorES");
      dword_2AC74 = IOServiceGetMatchingService(kIOMasterPortDefault, v21);
      v9 = v10;
      goto LABEL_11;
    }
LABEL_8:
    v9 = 0;
  }
LABEL_11:

  return v9;
}

- (void)dealloc
{
  void *v3;
  NSDictionary *payLoad;
  void *uscSampling_SampleBuffer;
  NSMutableArray *frameTiming_PerformanceStatisticsArray;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
  objc_msgSend(v3, "setDelegate:", 0);

  payLoad = self->_payLoad;
  self->_payLoad = 0;

  uscSampling_SampleBuffer = self->_uscSampling_SampleBuffer;
  if (uscSampling_SampleBuffer)
    vm_deallocate(mach_task_self_, (vm_address_t)uscSampling_SampleBuffer, self->_uscSampling_SampleBufferSize);
  frameTiming_PerformanceStatisticsArray = self->_frameTiming_PerformanceStatisticsArray;
  self->_frameTiming_PerformanceStatisticsArray = 0;

  if (dword_2AC74)
  {
    IOObjectRelease(dword_2AC74);
    dword_2AC74 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)DYGLShaderProfilerFunctionPlayerSupport;
  -[DYGLShaderProfilerFunctionPlayerSupport dealloc](&v7, "dealloc");
}

- (id)queryShaderStart
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSString *v8;
  void *v9;
  id v10;
  dispatch_queue_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  id v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DYFuture future](DYFuture, "future"));
  self->_queryShaderState = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
  objc_msgSend(v4, "setDelegate:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
  v6 = objc_msgSend(v5, "loopCount");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
  objc_msgSend(v7, "setLoopCount:", 0xFFFFFFFFLL);

  v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", object_getClassName(self));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("gputools.%@.%p"), v9, self)));
  v11 = dispatch_queue_create((const char *)objc_msgSend(v10, "UTF8String"), 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "playbackToFunction:", objc_msgSend(v13, "targetFunctionIndex")));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_E6D4;
  v20[3] = &unk_247B0;
  v20[4] = self;
  v15 = v3;
  v21 = v15;
  objc_msgSend(v14, "notifyOnQueue:handler:", v11, v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
  objc_msgSend(v16, "setLoopCount:", v6);

  v17 = v21;
  v18 = v15;

  return v18;
}

- (id)_valueFromKey:(id)a3
{
  __CFString *v3;
  void *CFProperty;
  void *v5;

  v3 = (__CFString *)a3;
  if (dword_2AC74
    && (CFProperty = (void *)IORegistryEntryCreateCFProperty(dword_2AC74, v3, kCFAllocatorDefault, 0)) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", CFProperty));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_queryShaderResult
{
  id v2;
  uint64_t v3;
  void *i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  DYGLShaderProfilerFunctionPlayerSupport *v10;
  void *uscSampling_SampleBuffer;
  void *v12;
  void *v13;
  id v14;
  _DWORD *value;
  int v16;
  unsigned int v17;
  void *v18;
  NSMutableArray *frameTiming_PerformanceStatisticsArray;
  void *v20;
  id v22;
  NSMutableArray *obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v25 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_drawCallInfo, "count"));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = self->_drawCallInfo;
  v2 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v5, "footprint")));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "vertexShaderKey"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fragmentShaderKey"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v6, CFSTR("footprint"), v7, CFSTR("vertex shader key"), v8, CFSTR("fragment shader key"), 0));
        objc_msgSend(v25, "addObject:", v9);

      }
      v2 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v2);
  }

  objc_msgSend(v22, "setObject:forKey:", v25, CFSTR("draw call info"));
  v10 = self;
  objc_msgSend(v22, "setObject:forKey:", self->_vertexShaderInfo, CFSTR("vertex shader info"));
  objc_msgSend(v22, "setObject:forKey:", self->_fragmentShaderInfo, CFSTR("fragment shader info"));
  uscSampling_SampleBuffer = self->_uscSampling_SampleBuffer;
  if (uscSampling_SampleBuffer)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", uscSampling_SampleBuffer, self->_uscSampling_SampleBufferSize));
    objc_msgSend(v22, "setObject:forKey:", v12, CFSTR("usc sampling sample data"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", self->_uscSampling_AddressBuffer.__begin_, self->_uscSampling_AddressBufferSize));
    objc_msgSend(v22, "setObject:forKey:", v13, CFSTR("usc sampling address data"));

    v10 = self;
  }
  if (v10->_frameTiming_FrameTimeStatistics.__ptr_.__value_)
  {
    v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", *((unsigned int *)v10->_frameTiming_FrameTimeStatistics.__ptr_.__value_ + 56));
    value = v10->_frameTiming_FrameTimeStatistics.__ptr_.__value_;
    if (value[56])
    {
      v16 = 0;
      v17 = 0;
      do
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)value + 8 * ((v16 + value[57] + value[6]) % value[6]))));
        objc_msgSend(v14, "addObject:", v18);

        ++v17;
        value = self->_frameTiming_FrameTimeStatistics.__ptr_.__value_;
        --v16;
      }
      while (v17 < value[56]);
    }
    objc_msgSend(v22, "setObject:forKey:", v14, CFSTR("frametime"));

    v10 = self;
  }
  frameTiming_PerformanceStatisticsArray = v10->_frameTiming_PerformanceStatisticsArray;
  if (frameTiming_PerformanceStatisticsArray)
    objc_msgSend(v22, "setObject:forKey:", frameTiming_PerformanceStatisticsArray, CFSTR("performance statistics"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport _valueFromKey:](v10, "_valueFromKey:", CFSTR("MetalPluginName")));
  if (v20)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v20, CFSTR("MetalPluginName"));

  return v22;
}

- (BOOL)shouldExecuteGraphicsFunction
{
  void *v3;
  unint64_t *v4;
  void *v5;
  void (**v6)(id, uint64_t, unint64_t *);
  void *v7;
  id v8;
  int v9;
  unsigned int v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  unsigned int v15;
  unint64_t v16;
  NSArray *functionFlag;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  unsigned int v27;
  unint64_t v28;
  uint64_t v29;
  BOOL result;
  void *v31;
  int v32;
  unsigned int v33;
  void *v34;
  unsigned int v35;
  void *v36;
  unsigned int v37;
  int v38;
  int v39;
  int v40;
  uint64_t v41;
  int v42;
  int v43;
  NSArray *v45;
  void *v46;
  void *v47;
  void *v48;
  unsigned __int8 v49;
  _QWORD *v50;
  void *v51;
  _QWORD *v52;
  void **v53;
  void *v54;
  NSArray *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  unsigned __int8 v61;
  void *v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t *v65;

  -[DYGLShaderProfilerFunctionPlayerSupport setShouldReturn:](self, "setShouldReturn:", 1);
  -[DYGLShaderProfilerFunctionPlayerSupport setShouldCallSuper:](self, "setShouldCallSuper:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v4 = (unint64_t *)objc_msgSend(v3, "function");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v6 = (void (**)(id, uint64_t, unint64_t *))objc_msgSend(v5, "gliDispatch");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v8 = objc_msgSend(v7, "gliContext");

  if (self->_queryShaderState == 4)
    -[DYGLShaderProfilerFunctionPlayerSupport _restoreColorAttachment](self, "_restoreColorAttachment");
  v9 = *(_DWORD *)v4;
  if (*(int *)v4 > 822)
  {
    v10 = v9 - 823;
    if (v10 > 0x1F)
      goto LABEL_13;
    v11 = 1 << v10;
    if ((v11 & 0xF0004000) == 0 && (v11 & 3) == 0)
      goto LABEL_13;
LABEL_12:
    LODWORD(v64) = 0;
    v6[104](v8, 36006, &v64);
    v12 = v64;
    v65 = v4 + 2;
    *((_DWORD *)sub_12298((uint64_t)&self->_lastUpdatedFramebuffer, v4 + 2, (uint64_t)&unk_237D1, &v65) + 6) = v12;
    goto LABEL_13;
  }
  if ((v9 - 139) <= 7 && ((1 << (v9 + 117)) & 0x91) != 0 || v9 == 28 || v9 == 36)
    goto LABEL_12;
LABEL_13:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  if (!objc_msgSend(v13, "mainExecutionMode") || self->_queryShaderState != 3)
  {

    goto LABEL_21;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v15 = objc_msgSend(v14, "currentExecutionModeFunctionIndex");
  v16 = -[NSArray count](self->_functionFlag, "count");

  if (v16 <= v15)
    goto LABEL_21;
  functionFlag = self->_functionFlag;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](functionFlag, "objectAtIndexedSubscript:", objc_msgSend(v18, "currentExecutionModeFunctionIndex")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("flag")));
  v21 = objc_msgSend(v20, "unsignedIntValue");

  if ((v21 & 1) == 0)
  {
    if ((v21 & 4) == 0)
      goto LABEL_18;
LABEL_41:
    -[DYGLShaderProfilerFunctionPlayerSupport _replaceColorAttachment](self, "_replaceColorAttachment");
    if ((v21 & 2) == 0)
      goto LABEL_21;
    goto LABEL_42;
  }
  v65 = v4 + 2;
  -[DYGLShaderProfilerFunctionPlayerSupport _saveColorAttachmentFramebuffer:](self, "_saveColorAttachmentFramebuffer:", *((unsigned int *)sub_12298((uint64_t)&self->_lastUpdatedFramebuffer, v4 + 2, (uint64_t)&unk_237D1, &v65) + 6));
  if ((v21 & 4) != 0)
    goto LABEL_41;
LABEL_18:
  if ((v21 & 2) == 0)
    goto LABEL_21;
LABEL_42:
  ((void (*)(id, uint64_t))v6[10])(v8, 0x4000);
LABEL_21:
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v23 = objc_msgSend(v22, "isFunctionEnabled");

  if ((v23 & 1) == 0)
    return 0;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v25 = objc_msgSend(v24, "mainExecutionMode");

  if ((v25 & 1) == 0)
    goto LABEL_38;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v27 = objc_msgSend(v26, "currentExecutionModeFunctionIndex");
  v28 = -[NSArray count](self->_functionFlag, "count");

  if (v28 <= v27)
  {
LABEL_29:
    v32 = *(_DWORD *)v4;
    if (*(int *)v4 <= 822)
    {
      if (((v32 - 139) > 7 || ((1 << (v32 + 117)) & 0x91) == 0) && v32 != 382 && v32 != 384)
        goto LABEL_38;
    }
    else
    {
      v33 = v32 - 823;
      if (v33 > 0x16 || ((1 << v33) & 0x780003) == 0)
        goto LABEL_38;
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
    v35 = objc_msgSend(v34, "currentExecutionModeFunctionIndex");
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
    v37 = objc_msgSend(v36, "targetFunctionIndex");

    if (v35 < v37)
      goto LABEL_38;
    return 0;
  }
  result = 1;
  switch(self->_queryShaderState)
  {
    case 2:
      if (((*(_DWORD *)v4 - 139) > 7 || ((1 << (*(_BYTE *)v4 + 117)) & 0x91) == 0)
        && (*(_DWORD *)v4 - 823) >= 2)
      {
        return result;
      }
      v31 = (void *)objc_opt_new(DrawCallInfo, v29);
      -[NSMutableArray addObject:](self->_drawCallInfo, "addObject:", v31);
      self->_drawCallIndex = -[NSMutableArray count](self->_drawCallInfo, "count");

      return 1;
    case 3:
      result = 0;
      v38 = *(_DWORD *)v4;
      if (*(int *)v4 <= 133)
      {
        v41 = (v38 - 24);
        if (v41 > 0x36)
          goto LABEL_38;
        if (((1 << v41) & 0x4000000000401FLL) != 0)
          return result;
        if (v41 != 12)
          goto LABEL_38;
        v42 = *(_DWORD *)v4[9];
        if (v42 != 0x4000)
          ((void (*)(id, _QWORD))v6[10])(v8, v42 & 0xFFFFBFFF);
        return 0;
      }
      if (v38 <= 836)
      {
        if ((v38 - 134) <= 0x11)
        {
          v39 = 1 << (v38 + 122);
          if ((v39 & 0x1220) != 0)
          {
LABEL_74:
            v45 = self->_functionFlag;
            v46 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
            v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v45, "objectAtIndexedSubscript:", objc_msgSend(v46, "currentExecutionModeFunctionIndex")));
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("flag")));
            v49 = objc_msgSend(v48, "unsignedIntValue");

            v64 = v4[2];
            if ((v49 & 0x30) != 0)
            {
              if (!sub_55DC(&self->_drawCallIndexMap.__table_.__bucket_list_.__ptr_.__value_, &v64))
              {
                v65 = &v64;
                v50 = sub_124B8((uint64_t)&self->_drawCallIndexMap, &v64, (uint64_t)&unk_237D1, (uint64_t **)&v65);
                v52 = v50 + 3;
                v51 = (void *)v50[3];
                if (v51)
                {
                  v50[4] = v51;
                  operator delete(v51);
                  *v52 = 0;
                  v52[1] = 0;
                  v52[2] = 0;
                }
                *v52 = 0;
                v52[1] = 0;
                v52[2] = 0;
              }
              v65 = &v64;
              v53 = (void **)sub_124B8((uint64_t)&self->_drawCallIndexMap, &v64, (uint64_t)&unk_237D1, (uint64_t **)&v65);
              v54 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
              LODWORD(v65) = objc_msgSend(v54, "currentExecutionModeFunctionIndex");
              sub_F5B0(v53 + 3, &v65, &self->_drawCallIndex);

            }
            ++self->_drawCallIndex;
            if ((v49 & 0x10) != 0)
            {
              ((void (*)(id, uint64_t, _QWORD, uint64_t, _QWORD))v6[336])(v8, 32769, 0, 32771, 0);
              ((void (*)(id, float, float, float, float))v6[337])(v8, (float)self->_drawCallIndex / 255.0, (float)BYTE1(self->_drawCallIndex) / 255.0, (float)BYTE2(self->_drawCallIndex) / 255.0, (float)HIBYTE(self->_drawCallIndex) / 255.0);
            }
            else if ((v49 & 0x20) != 0)
            {
              v55 = self->_functionFlag;
              v56 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
              v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v55, "objectAtIndexedSubscript:", objc_msgSend(v56, "currentExecutionModeFunctionIndex")));
              v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("parameters")));

              ((void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))v6[336])(v8, 32769, 1, 32771, 1);
              v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("blending draw call scale")));

              if (v59)
              {
                v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("blending draw call scale")));
                v61 = objc_msgSend(v60, "unsignedIntValue");

                ((void (*)(id, float, float, float, float))v6[337])(v8, 0.0039216, 1.0 / (float)((float)(1 << v61) * 255.0), 1.0 / (float)((float)(1 << (2 * v61)) * 255.0), 1.0 / (float)((float)(1 << (3 * v61)) * 255.0));
              }
              else
              {
                v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("blending draw call bit start")));
                v63 = objc_msgSend(v62, "unsignedIntValue");

                ((void (*)(id, float, float, float, float))v6[337])(v8, (float)(1 << v63) / 255.0, (float)((unsigned __int16)(1 << v63) >> 8) / 255.0, (float)((1 << v63) >> 16) / 255.0, (float)((1 << v63) >> 24) / 255.0);
              }

            }
            else
            {
              ((void (*)(id, _QWORD, _QWORD, _QWORD, _QWORD))v6[336])(v8, 0, 0, 0, 0);
            }
            return 1;
          }
          if ((v39 & 0x20001) != 0)
          {
            result = 0;
            v40 = *(_DWORD *)v4[9];
            if (v40 == 3024 || v40 == 3042)
              return result;
            goto LABEL_38;
          }
        }
        if ((v38 - 823) >= 2)
          goto LABEL_38;
        goto LABEL_74;
      }
      if ((v38 - 851) < 4)
      {
        v43 = *(_DWORD *)v4[9];
        return v43 == 34041 || (v43 - 6145) < 2;
      }
      if (v38 == 837)
        return result;
LABEL_38:
      -[DYGLShaderProfilerFunctionPlayerSupport setShouldReturn:](self, "setShouldReturn:", 0);
      return 1;
    case 5:
      if (((*(_DWORD *)v4 - 139) > 7 || ((1 << (*(_BYTE *)v4 + 117)) & 0x91) == 0)
        && (*(_DWORD *)v4 - 823) >= 2)
      {
        return result;
      }
      if (!self->_uscSampling_Enabled)
      {
        -[DYGLShaderProfilerFunctionPlayerSupport _startUSCSampling](self, "_startUSCSampling");
        return 1;
      }
      if (self->_shouldStopUSCSampling && !self->_uscSamplingEnded)
      {
        -[DYGLShaderProfilerFunctionPlayerSupport _endUSCSampling](self, "_endUSCSampling");
        return 1;
      }
      return result;
    case 6:
      return result;
    default:
      goto LABEL_29;
  }
}

- (void)performPostGraphicsFunctionDispatchActions:(BOOL)a3
{
  int *v4;
  int v5;
  BOOL v6;
  BOOL v8;
  void *v9;
  unsigned int v10;
  unint64_t v11;
  NSArray *functionFlag;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  id v17;
  id v18;

  v16 = (id)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer", a3));
  v4 = (int *)objc_msgSend(v16, "function");

  -[DYGLShaderProfilerFunctionPlayerSupport setShouldReturn:](self, "setShouldReturn:", 1);
  -[DYGLShaderProfilerFunctionPlayerSupport setShouldCallSuper:](self, "setShouldCallSuper:", 0);
  v5 = *v4;
  if (*v4 <= 381)
  {
    v8 = (v5 - 139) <= 7 && ((1 << (v5 + 117)) & 0x91) != 0 || v5 == 28;
    if (!v8 && v5 != 36)
      return;
  }
  else
  {
    v6 = (v5 - 823) > 0x1F || ((1 << (v5 - 55)) & 0xF0784003) == 0;
    if (v6 && v5 != 382 && v5 != 384)
      return;
  }
  if (self->_queryShaderState == 2)
  {
    v17 = (id)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
    if ((objc_msgSend(v17, "mainExecutionMode") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
      v10 = objc_msgSend(v9, "currentExecutionModeFunctionIndex");
      v11 = -[NSArray count](self->_functionFlag, "count");

      if (v11 > v10)
      {
        functionFlag = self->_functionFlag;
        v18 = (id)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](functionFlag, "objectAtIndexedSubscript:", objc_msgSend(v18, "currentExecutionModeFunctionIndex")));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("flag")));
        v15 = objc_msgSend(v14, "unsignedIntValue");

        if ((v15 & 8) != 0)
          -[DYGLShaderProfilerFunctionPlayerSupport _harvestShaderBinaries](self, "_harvestShaderBinaries");
      }
    }
    else
    {

    }
  }
}

- (void)executePlatformFunction
{
  void *v3;
  unint64_t *v4;
  void *v5;
  void (**v6)(id);
  void *v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  unsigned int v12;
  unint64_t v13;
  NSArray *functionFlag;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  unsigned int v21;
  unint64_t v22;
  void *v23;
  unsigned int v24;
  unsigned int v25;
  _QWORD *v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v4 = (unint64_t *)objc_msgSend(v3, "function");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v6 = (void (**)(id))objc_msgSend(v5, "gliDispatch");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v8 = objc_msgSend(v7, "gliContext");

  v9 = *(_DWORD *)v4;
  -[DYGLShaderProfilerFunctionPlayerSupport setShouldReturn:](self, "setShouldReturn:", 0);
  -[DYGLShaderProfilerFunctionPlayerSupport setShouldCallSuper:](self, "setShouldCallSuper:", 0);
  if (self->_queryShaderState != 3)
  {
LABEL_9:
    if ((self->_queryShaderState - 5) <= 1)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
      if ((objc_msgSend(v19, "mainExecutionMode") & 1) != 0)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
        v21 = objc_msgSend(v20, "currentExecutionModeFunctionIndex");
        v22 = -[NSArray count](self->_functionFlag, "count");

        if (v22 > v21 && (v9 + 8190) <= 0xC && ((1 << (v9 - 2)) & 0x1801) != 0)
        {
          if (self->_queryShaderState == 6)
          {
            -[DYGLShaderProfilerFunctionPlayerSupport setShouldReturn:](self, "setShouldReturn:", 1);
            -[DYGLShaderProfilerFunctionPlayerSupport setShouldCallSuper:](self, "setShouldCallSuper:", 1);
          }
          else
          {
            v6[90](v8);
            -[DYGLShaderProfilerFunctionPlayerSupport setShouldReturn:](self, "setShouldReturn:", 1);
          }
          return;
        }
      }
      else
      {

      }
    }
    goto LABEL_20;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  if ((objc_msgSend(v10, "mainExecutionMode") & 1) == 0)
  {

    goto LABEL_9;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v12 = objc_msgSend(v11, "currentExecutionModeFunctionIndex");
  v13 = -[NSArray count](self->_functionFlag, "count");

  if (v13 <= v12)
    goto LABEL_9;
  functionFlag = self->_functionFlag;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](functionFlag, "objectAtIndexedSubscript:", objc_msgSend(v15, "currentExecutionModeFunctionIndex")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("flag")));
  v18 = objc_msgSend(v17, "unsignedIntValue");

  if ((v18 & 1) != 0)
  {
    v26 = v4 + 2;
    -[DYGLShaderProfilerFunctionPlayerSupport _saveColorAttachmentFramebuffer:](self, "_saveColorAttachmentFramebuffer:", *((unsigned int *)sub_12298((uint64_t)&self->_lastUpdatedFramebuffer, v4 + 2, (uint64_t)&unk_237D1, &v26) + 6));
    if ((v18 & 4) == 0)
    {
LABEL_6:
      if ((v18 & 2) == 0)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if ((v18 & 4) == 0)
  {
    goto LABEL_6;
  }
  -[DYGLShaderProfilerFunctionPlayerSupport _replaceColorAttachment](self, "_replaceColorAttachment");
  if ((v18 & 2) != 0)
LABEL_19:
    ((void (*)(id, uint64_t))v6[10])(v8, 0x4000);
LABEL_20:
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v24 = objc_msgSend(v23, "isFunctionEnabled");
  if (v9 == -8188)
    v25 = v24;
  else
    v25 = 0;

  if (v25 == 1)
  {
    v26 = v4 + 2;
    *((_DWORD *)sub_12298((uint64_t)&self->_lastUpdatedFramebuffer, v4 + 2, (uint64_t)&unk_237D1, &v26) + 6) = 0;
  }
}

- (BOOL)shouldPerformPlaybackLoopIteration:(unsigned int)a3
{
  -[DYGLShaderProfilerFunctionPlayerSupport setShouldReturn:](self, "setShouldReturn:", 1);
  -[DYGLShaderProfilerFunctionPlayerSupport setShouldCallSuper:](self, "setShouldCallSuper:", 0);
  return self->_queryShaderState != 0;
}

- (void)performPlaybackLoopIterationPreCaptureActions:(unsigned int)a3
{
  void *v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *drawCallInfo;
  NSMutableDictionary *v9;
  NSMutableDictionary *vertexShaderInfo;
  NSMutableDictionary *v11;
  NSMutableDictionary *fragmentShaderInfo;
  int v13;
  uint64_t *value;
  void *v15;
  void *v16;
  _BOOL8 backup_enableWireframePresent;
  void *v18;
  NSMutableArray *frameTiming_PerformanceStatisticsArray;
  id v20;
  NSMutableArray *v21;
  NSMutableArray *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  int v27;

  -[DYGLShaderProfilerFunctionPlayerSupport setShouldReturn:](self, "setShouldReturn:", 1);
  -[DYGLShaderProfilerFunctionPlayerSupport setShouldCallSuper:](self, "setShouldCallSuper:", 0);
  switch(self->_queryShaderState)
  {
    case 1:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
      self->_backup_enableWireframePresent = objc_msgSend(v5, "enableWireframePresent");

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
      objc_msgSend(v6, "setEnableWireframePresent:", 0);

      v7 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](self->_functionFlag, "count") >> 2);
      drawCallInfo = self->_drawCallInfo;
      self->_drawCallInfo = v7;

      v9 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSArray count](self->_functionFlag, "count") >> 2);
      vertexShaderInfo = self->_vertexShaderInfo;
      self->_vertexShaderInfo = v9;

      v11 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSArray count](self->_functionFlag, "count") >> 2);
      fragmentShaderInfo = self->_fragmentShaderInfo;
      self->_fragmentShaderInfo = v11;

      self->_drawCallIndex = 0;
      v13 = 2;
      goto LABEL_20;
    case 2:
      if (!self->_harvestDrawCallFootprint)
        goto LABEL_6;
      -[DYGLShaderProfilerFunctionPlayerSupport _backupAndSetupStates](self, "_backupAndSetupStates");
      self->_drawCallIndex = 0;
      sub_12738((uint64_t)&self->_colorAttachmentMap);
      sub_127C8((uint64_t)&self->_drawCallIndexMap);
      v13 = 3;
      goto LABEL_20;
    case 3:
      -[DYGLShaderProfilerFunctionPlayerSupport _restoreStates](self, "_restoreStates");
LABEL_6:
      v13 = 4;
      goto LABEL_20;
    case 4:
      self->_uscSampling_FrameIndexStart = a3;
      self->_uscSampling_TimeStart = mach_absolute_time();
      v13 = 5;
      goto LABEL_20;
    case 5:
      if (-[DYGLShaderProfilerFunctionPlayerSupport _uscSamplingEnded](self, "_uscSamplingEnded"))
      {
        value = (uint64_t *)self->_frameTiming_FrameTimeStatistics.__ptr_.__value_;
        if (!value)
          operator new();
        sub_FF68(value);
        frameTiming_PerformanceStatisticsArray = self->_frameTiming_PerformanceStatisticsArray;
        if (frameTiming_PerformanceStatisticsArray)
        {
          -[NSMutableArray removeAllObjects](frameTiming_PerformanceStatisticsArray, "removeAllObjects");
        }
        else
        {
          v20 = objc_alloc((Class)NSMutableArray);
          v21 = (NSMutableArray *)objc_msgSend(v20, "initWithCapacity:", kDYExperimentFrameTimeArraySizeDefault);
          v22 = self->_frameTiming_PerformanceStatisticsArray;
          self->_frameTiming_PerformanceStatisticsArray = v21;

        }
        self->_frameTiming_FrameIndexStart = a3;
        v23 = mach_absolute_time();
        self->_frameTiming_GlobalTimeStart = v23;
        self->_frameTiming_FrameTimeStart = v23;
        self->_frameTiming_Done = 0;
        v27 = 0;
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "context"));
        objc_msgSend(v25, "setParameter:to:", 1414, &v27);

        v13 = 6;
LABEL_20:
        self->_queryShaderState = v13;
      }
      else
      {
        -[DYGLShaderProfilerFunctionPlayerSupport _shouldEndUSCSampling](self, "_shouldEndUSCSampling");
      }
      return;
    case 6:
      self->_frameTiming_FrameTimeStart = mach_absolute_time();
      if (!self->_frameTiming_Done)
        return;
      v26 = 0;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "context"));
      objc_msgSend(v16, "setParameter:to:", 1414, &v26);

      backup_enableWireframePresent = self->_backup_enableWireframePresent;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
      objc_msgSend(v18, "setEnableWireframePresent:", backup_enableWireframePresent);

      v13 = 7;
      goto LABEL_20;
    case 7:
      self->_queryShaderState = 0;
      return;
    default:
      return;
  }
}

- (void)_startUSCSampling
{
  void *v3;
  void (*v4)(id);
  void *v5;
  unint64_t v6;
  uint64_t uscSampling_SampleBufferSize;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  _QWORD v13[5];

  if (self->_uscSampling_SampleBuffer)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
    v4 = (void (*)(id))*((_QWORD *)objc_msgSend(v3, "gliDispatch") + 89);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
    v4(objc_msgSend(v5, "gliContext"));

    v6 = self->_uscSampling_AddressBufferSize / 0x28uLL;
    v13[0] = self->_uscSampling_AddressBuffer.__begin_;
    v13[1] = v6;
    uscSampling_SampleBufferSize = self->_uscSampling_SampleBufferSize;
    v13[2] = self->_uscSampling_SampleBuffer;
    v13[3] = uscSampling_SampleBufferSize / 0xCuLL;
    v13[4] = uscSampling_SampleBufferSize;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "context"));
    objc_msgSend(v9, "setParameter:to:", 1411, v13);

    v12 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "context"));
    objc_msgSend(v11, "setParameter:to:", 1412, &v12);

    self->_uscSampling_Enabled = 1;
  }
}

- (BOOL)_uscSamplingEnded
{
  return !self->_uscSampling_SampleBuffer || !self->_uscSampling_Enabled || self->_uscSamplingEnded;
}

- (void)_shouldEndUSCSampling
{
  uint64_t v3;
  unint64_t v4;

  v3 = mach_absolute_time();
  self->_uscSampling_TimeEnd = v3;
  v4 = v3 - self->_uscSampling_TimeStart;
  if (g_DYTimebaseInfo != *((_DWORD *)&g_DYTimebaseInfo + 1))
    v4 = __udivti3(v4 * g_DYTimebaseInfo, (v4 * (unsigned __int128)g_DYTimebaseInfo) >> 64);
  if (v4 >= 1000000000 * (unint64_t)self->_uscSampling_Period)
    self->_shouldStopUSCSampling = 1;
}

- (void)_endUSCSampling
{
  void *v3;
  void *v4;
  void *v5;
  void (*v6)(id);
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  int v11;

  v11 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "context"));
  objc_msgSend(v4, "setParameter:to:", 1413, &v11);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v6 = (void (*)(id))*((_QWORD *)objc_msgSend(v5, "gliDispatch") + 89);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v6(objc_msgSend(v7, "gliContext"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer", 0, 0, 0, 0, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "context"));
  objc_msgSend(v9, "setParameter:to:", 1411, &v10);

  self->_uscSamplingEnded = 1;
}

- (void)performPlaybackLoopIterationPostCaptureActions:(unsigned int)a3
{
  uint64_t v5;
  void *value;
  uint64_t v7;
  id v8;
  CFTypeRef CFProperty;
  void *v10;
  NSMutableArray *frameTiming_PerformanceStatisticsArray;
  _DWORD *v12;
  unsigned int v13;
  unsigned int v14;
  unint64_t v15;
  _DWORD *v16;
  double v17;
  double v18;

  -[DYGLShaderProfilerFunctionPlayerSupport setShouldReturn:](self, "setShouldReturn:", 1);
  -[DYGLShaderProfilerFunctionPlayerSupport setShouldCallSuper:](self, "setShouldCallSuper:", 0);
  if (self->_queryShaderState == 6)
  {
    v5 = mach_absolute_time();
    value = self->_frameTiming_FrameTimeStatistics.__ptr_.__value_;
    v7 = v5 - self->_frameTiming_FrameTimeStart;
    if (g_DYTimebaseInfo != *((_DWORD *)&g_DYTimebaseInfo + 1))
      v7 = __udivti3(v7 * g_DYTimebaseInfo, ((unint64_t)v7 * (unsigned __int128)g_DYTimebaseInfo) >> 64);
    v18 = *(double *)&v7;
    sub_10520((uint64_t)value, &v18);
    v8 = -[NSMutableArray count](self->_frameTiming_PerformanceStatisticsArray, "count");
    if (v8 == (id)kDYExperimentFrameTimeArraySizeDefault)
      -[NSMutableArray removeObjectAtIndex:](self->_frameTiming_PerformanceStatisticsArray, "removeObjectAtIndex:", 0);
    if (dword_2AC74
      && (CFProperty = IORegistryEntryCreateCFProperty(dword_2AC74, CFSTR("PerformanceStatistics"), kCFAllocatorDefault, 0)) != 0)
    {
      v10 = (void *)CFProperty;
      -[NSMutableArray addObject:](self->_frameTiming_PerformanceStatisticsArray, "addObject:", CFProperty);
    }
    else
    {
      frameTiming_PerformanceStatisticsArray = self->_frameTiming_PerformanceStatisticsArray;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      -[NSMutableArray addObject:](frameTiming_PerformanceStatisticsArray, "addObject:", v10);
    }

    v12 = self->_frameTiming_FrameTimeStatistics.__ptr_.__value_;
    v13 = v12[56];
    v14 = v12[6];
    if (v13 >= v14)
    {
      if (a3 - self->_frameTiming_FrameIndexStart > 0x7F)
        goto LABEL_16;
      v15 = v5 - self->_frameTiming_GlobalTimeStart;
      if (g_DYTimebaseInfo != *((_DWORD *)&g_DYTimebaseInfo + 1))
      {
        v16 = self->_frameTiming_FrameTimeStatistics.__ptr_.__value_;
        v15 = __udivti3(v15 * g_DYTimebaseInfo, (v15 * (unsigned __int128)g_DYTimebaseInfo) >> 64);
        v12 = v16;
      }
      if (v15 >= 0x3B9ACA01
        || (double)(unint64_t)(*(_QWORD *)(*((_QWORD *)v12 + 19) + 8 * ((v12[57] + v14) % v14))
                                    - *(_QWORD *)(*((_QWORD *)v12 + 13) + 8 * ((v12[57] + v14) % v14)))
         / (double)*(unint64_t *)(*((_QWORD *)v12 + 7) + 8 * ((v12[57] + v14) % v14)) < kDYExperimentFrameTimeVariationLimit1
        || v13 >= kDYExperimentFrameTimeVariationArraySizeDefault
        && (v17 = 0.0,
            v18 = 0.0,
            sub_107A4((uint64_t)v12, kDYExperimentFrameTimeVariationArraySizeDefault, &v18, &v17))
        && v17 < kDYExperimentFrameTimeVariationLimit2
        && v17 - v18 < kDYExperimentFrameTimeVariationRangeMax)
      {
LABEL_16:
        self->_frameTiming_Done = 1;
      }
    }
  }
}

- (void)_replaceColorAttachment
{
  void *v3;
  unint64_t *v4;
  void *v5;
  void (**v6)(id, uint64_t, char *);
  void *v7;
  id v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  unint64_t v19;
  int i;
  char *v21;
  __int128 v22;
  void *v23;
  char *v24;
  int64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  __int128 v30;
  char *v31;
  char *v32;
  __int128 v33;
  char *v34;
  uint64_t v35;
  uint64_t p_colorAttachmentMap;
  unint64_t *v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  void *v41;
  DYGLShaderProfilerFunctionPlayerSupport *v42;
  unint64_t *v43;
  __int128 v44;
  __int128 v45;
  int v46;
  void *__p[2];
  char *v48;
  int v49;
  _QWORD v50[2];
  id v51[5];
  int v52;
  uint64_t v53;
  uint64_t v54;
  unsigned int v55[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v4 = (unint64_t *)objc_msgSend(v3, "function");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v6 = (void (**)(id, uint64_t, char *))objc_msgSend(v5, "gliDispatch");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v8 = objc_msgSend(v7, "gliContext");

  v54 = 0;
  v6[104](v8, 36006, (char *)&v54 + 4);
  v6[104](v8, 36007, (char *)&v54);
  v53 = 0;
  v52 = 0;
  if (!-[DYGLShaderProfilerFunctionPlayerSupport _getFramebufferWidth:height:numSamples:](self, "_getFramebufferWidth:height:numSamples:", (char *)&v53 + 4, &v53, &v52))self->_error = 1;
  v9 = kDYReservedGLNameFootprintRenderbuffer;
  v6[666](v8, 36161, (char *)kDYReservedGLNameFootprintRenderbuffer);
  v43 = v4;
  if (v52)
    ((void (*)(id, uint64_t))v6[756])(v8, 36161);
  else
    ((void (*)(id, uint64_t, uint64_t, _QWORD, _QWORD))v6[669])(v8, 36161, 32856, HIDWORD(v53), v53);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "context"));
  sub_485C(v51, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v50[0] = v51;
  v50[1] = objc_msgSend(v12, "gliDispatch");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "captureSessionInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contextInfoForContext:", objc_msgSend(v15, "ctxID")));
  v17 = objc_msgSend(v16, "api");

  v49 = 1;
  v42 = self;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v19 = *((_QWORD *)objc_msgSend(v18, "currentContextInfo") + 13);

  if (v19 >= 3)
    v6[104](v8, 36063, (char *)&v49);
  __p[0] = 0;
  __p[1] = 0;
  v48 = 0;
  if (v49 >= 1)
  {
    for (i = 0; i < v49; ++i)
    {
      GPUTools::GL::GetFramebufferAttachmentInfo(v50, v17, 36009, (i + 36064), &v44);
      v21 = (char *)__p[1];
      if (__p[1] >= v48)
      {
        v24 = (char *)__p[0];
        v25 = ((char *)__p[1] - (char *)__p[0]) >> 5;
        v26 = v25 + 1;
        if ((unint64_t)(v25 + 1) >> 59)
          sub_2610();
        v27 = v48 - (char *)__p[0];
        if ((v48 - (char *)__p[0]) >> 4 > v26)
          v26 = v27 >> 4;
        if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFE0)
          v28 = 0x7FFFFFFFFFFFFFFLL;
        else
          v28 = v26;
        if (v28)
        {
          v29 = (char *)sub_12CD4((uint64_t)&v48, v28);
          v24 = (char *)__p[0];
          v21 = (char *)__p[1];
        }
        else
        {
          v29 = 0;
        }
        v30 = v45;
        v31 = &v29[32 * v25];
        *(_OWORD *)v31 = v44;
        *((_OWORD *)v31 + 1) = v30;
        if (v21 == v24)
        {
          v34 = &v29[32 * v25];
        }
        else
        {
          v32 = &v29[32 * v25];
          do
          {
            v33 = *((_OWORD *)v21 - 1);
            v34 = v32 - 32;
            *((_OWORD *)v32 - 2) = *((_OWORD *)v21 - 2);
            *((_OWORD *)v32 - 1) = v33;
            v21 -= 32;
            v32 -= 32;
          }
          while (v21 != v24);
        }
        v23 = v31 + 32;
        __p[0] = v34;
        __p[1] = v31 + 32;
        v48 = &v29[32 * v28];
        if (v24)
          operator delete(v24);
      }
      else
      {
        v22 = v45;
        *(_OWORD *)__p[1] = v44;
        *((_OWORD *)v21 + 1) = v22;
        v23 = v21 + 32;
      }
      __p[1] = v23;
      if (i)
        v35 = 0;
      else
        v35 = v9;
      ((void (*)(id, uint64_t, _QWORD, uint64_t, uint64_t))v6[679])(v8, 36009, (i + 36064), 36161, v35);
    }
  }
  p_colorAttachmentMap = (uint64_t)&v42->_colorAttachmentMap;
  v37 = v43 + 2;
  if (!sub_55DC(&v42->_colorAttachmentMap.__table_.__bucket_list_.__ptr_.__value_, v43 + 2))
  {
    v44 = 0u;
    v45 = 0u;
    v46 = 1065353216;
    *(_QWORD *)v55 = v43 + 2;
    v38 = sub_12D08(p_colorAttachmentMap, v37, (uint64_t)&unk_237D1, (_QWORD **)v55);
    sub_12FB8((uint64_t)(v38 + 3), (uint64_t *)&v44);
    sub_48CC((uint64_t)&v44);
  }
  *(_QWORD *)&v44 = v43 + 2;
  v39 = sub_12D08(p_colorAttachmentMap, v37, (uint64_t)&unk_237D1, (_QWORD **)&v44);
  v55[0] = HIDWORD(v54);
  *(_QWORD *)&v44 = v55;
  v40 = sub_13058((uint64_t)(v39 + 3), v55, (uint64_t)&unk_237D1, (_DWORD **)&v44);
  v41 = (void *)v40[3];
  if (v41)
  {
    v40[4] = v41;
    operator delete(v41);
    v40[3] = 0;
    v40[4] = 0;
    v40[5] = 0;
  }
  *(_OWORD *)(v40 + 3) = *(_OWORD *)__p;
  v40[5] = v48;
  __p[1] = 0;
  v48 = 0;
  __p[0] = 0;
  ((void (*)(id, float, float, float, float))v6[12])(v8, 0.0, 0.0, 0.0, 0.0);
  ((void (*)(id, uint64_t))v6[10])(v8, 0x4000);
  v6[666](v8, 36161, (char *)v54);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

}

- (void)_saveColorAttachmentFramebuffer:(unsigned int)a3
{
  void *v4;
  _QWORD *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  _QWORD *v9;
  unsigned int *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  unsigned int *i;
  unsigned int *v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  uint64_t v26;
  unsigned int *v27;
  unsigned int *v28;
  unsigned int v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  unsigned __int8 v39;
  uint64_t **v40;
  uint64_t v41;
  unsigned int *v42;
  unsigned int *v43;
  uint64_t v44;
  unsigned int v45;
  unint64_t v46;
  unsigned int v47;
  int v48;
  void *v49;
  void *v50;
  unordered_map<unsigned long long, std::vector<std::pair<unsigned int, unsigned int>>, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, std::vector<std::pair<unsigned int, unsigned int>>>>> *p_drawCallIndexMap;
  _QWORD *v52;
  _QWORD v53[3];
  int v54;
  uint64_t v55;
  _QWORD v56[5];
  int v57;
  uint64_t *v58[32];

  if (a3)
  {
    memset(v53, 0, sizeof(v53));
    v54 = 0;
    v55 = 0x100000001;
    v56[0] = 0;
    *(_QWORD *)((char *)v56 + 5) = 0;
    memset(&v56[2], 0, 24);
    v57 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
    v5 = objc_msgSend(v4, "function");
    DYHarvestRenderbufferInfo(v5[2], kDYReservedGLNameFootprintRenderbuffer, 1, v53);

    if (LODWORD(v56[2]))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
      p_drawCallIndexMap = &self->_drawCallIndexMap;
      v7 = sub_55DC(&self->_drawCallIndexMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)objc_msgSend(v6, "function") + 2);

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
        v58[0] = (uint64_t *)((char *)objc_msgSend(v8, "function") + 16);
        v9 = sub_124B8((uint64_t)p_drawCallIndexMap, (unint64_t *)v58[0], (uint64_t)&unk_237D1, v58);

        v10 = (unsigned int *)v9[3];
        if (v10 != (unsigned int *)v9[4])
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_functionFlag, "objectAtIndexedSubscript:", *v10));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("flag")));
          v13 = objc_msgSend(v12, "unsignedIntValue");

          if ((v13 & 0x10) != 0)
          {
            v27 = *(unsigned int **)((char *)&v56[2] + 4);
            v28 = *(unsigned int **)((char *)&v56[3] + 4);
            while (v27 != v28)
            {
              v29 = *v27;
              if (*v27 && v29 <= self->_drawCallIndex)
              {
                v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_drawCallInfo, "objectAtIndexedSubscript:", v29 - 1));
                objc_msgSend(v30, "setFootprint:", objc_msgSend(v30, "footprint") + 1);

              }
              ++v27;
            }
          }
          else if ((v13 & 0x20) != 0)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_functionFlag, "objectAtIndexedSubscript:", *(unsigned int *)v9[3]));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("parameters")));

            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("blending draw call scale")));
            v17 = v16 == 0;

            if (v17)
            {
              v31 = v9[4];
              if (v31 == v9[3])
              {
                v41 = v9[4];
              }
              else
              {
                v32 = 0;
                v33 = 1;
                v31 = v9[3];
                do
                {
                  v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_functionFlag, "objectAtIndexedSubscript:", *(unsigned int *)(v31 + 8 * v32), p_drawCallIndexMap));
                  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("parameters")));

                  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("blending draw call bit start")));
                  v37 = objc_msgSend(v36, "unsignedIntValue");

                  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("blending draw call bit end")));
                  v39 = objc_msgSend(v38, "unsignedIntValue");

                  v40 = &v58[v32];
                  *(_DWORD *)v40 = v37;
                  *((_DWORD *)v40 + 1) = (-1 << ~v39) >> (31 - v39 + v37);
                  v32 = v33;
                  v31 = v9[3];
                  v41 = v9[4];
                  ++v33;
                  v15 = v35;
                }
                while (v32 < (v41 - v31) >> 3);
                v15 = v35;
              }
              v42 = *(unsigned int **)((char *)&v56[2] + 4);
              v43 = *(unsigned int **)((char *)&v56[3] + 4);
              if (*(_QWORD *)((char *)&v56[2] + 4) != *(_QWORD *)((char *)&v56[3] + 4))
              {
                v44 = v41;
                do
                {
                  v45 = *v42;
                  if (*v42)
                  {
                    if (v44 == v31)
                    {
                      v44 = v31;
                    }
                    else
                    {
                      v46 = 0;
                      v47 = 1;
                      do
                      {
                        v48 = (v45 >> LODWORD(v58[v46])) & HIDWORD(v58[v46]);
                        if (v48)
                        {
                          v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_drawCallInfo, "objectAtIndexedSubscript:", *(unsigned int *)(v31 + 8 * v46 + 4)));
                          objc_msgSend(v49, "setFootprint:", objc_msgSend(v49, "footprint") + v48);

                          v31 = v9[3];
                          v41 = v9[4];
                        }
                        v46 = v47++;
                        v44 = v41;
                      }
                      while (v46 < (v41 - v31) >> 3);
                    }
                  }
                  ++v42;
                }
                while (v42 != v43);
              }
            }
            else
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("blending draw call scale")));
              v19 = objc_msgSend(v18, "unsignedIntValue");

              v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_drawCallInfo, "objectAtIndexedSubscript:", *(unsigned int *)(v9[3] + 4)));
              v22 = *(unsigned int **)((char *)&v56[3] + 4);
              for (i = *(unsigned int **)((char *)&v56[2] + 4); i != v22; ++i)
              {
                v23 = *i;
                if (*i)
                {
                  if (*i == 255)
                  {
                    if (BYTE1(v23) == 255)
                    {
                      v24 = objc_msgSend(v20, "footprint");
                      if (BYTE2(v23) == 255)
                        v25 = HIBYTE(v23) << (3 * v19);
                      else
                        v25 = BYTE2(v23) << (2 * v19);
                    }
                    else
                    {
                      v24 = objc_msgSend(v20, "footprint");
                      v25 = BYTE1(v23) << v19;
                    }
                    v26 = v24 + v25;
                  }
                  else
                  {
                    v26 = objc_msgSend(v20, "footprint") + v23;
                  }
                  objc_msgSend(v20, "setFootprint:", v26, p_drawCallIndexMap);
                }
              }

            }
          }
          v50 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer", p_drawCallIndexMap));
          sub_132AC(v52, (unint64_t *)objc_msgSend(v50, "function") + 2);

        }
      }
    }
    if (*(_QWORD *)((char *)&v56[2] + 4))
    {
      *(_QWORD *)((char *)&v56[3] + 4) = *(_QWORD *)((char *)&v56[2] + 4);
      operator delete(*(void **)((char *)&v56[2] + 4));
    }
  }
}

- (void)_harvestShaderBinaries
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  size_t v10;
  id v11;
  size_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *vertexShaderInfo;
  void *v19;
  void *v20;
  NSMutableDictionary *fragmentShaderInfo;
  void *v22;
  void *__src[2];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27[2];

  v3 = (void *)objc_opt_new(NSMutableData, a2);
  v5 = (void *)objc_opt_new(NSMutableData, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v7 = *((_QWORD *)objc_msgSend(v6, "currentContextInfo") + 13);

  if (v7 >= 2)
  {
    v26 = 0u;
    *(_OWORD *)v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    *(_OWORD *)__src = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "context"));
    objc_msgSend(v9, "getParameter:to:", 1407, __src);

    if (__src[0])
    {
      if (*(_DWORD *)__src[0] == -17958193)
      {
        v10 = LODWORD(__src[1]);
        if (LODWORD(__src[1]))
        {
          objc_msgSend(v3, "setLength:", LODWORD(__src[1]));
          v11 = objc_msgSend(objc_retainAutorelease(v3), "mutableBytes");
          memcpy(v11, __src[0], v10);
        }
      }
    }
    if (v27[0])
    {
      if (*(_DWORD *)v27[0] == -17958193)
      {
        v12 = LODWORD(v27[1]);
        if (LODWORD(v27[1]))
        {
          objc_msgSend(v5, "setLength:", LODWORD(v27[1]));
          v13 = objc_msgSend(objc_retainAutorelease(v5), "mutableBytes");
          memcpy(v13, v27[0], v12);
        }
      }
    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), objc_msgSend(v3, "dy_crc32")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), objc_msgSend(v5, "dy_crc32")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_drawCallInfo, "objectAtIndexedSubscript:", self->_drawCallIndex - 1));
  objc_msgSend(v16, "setVertexShaderKey:", v14);
  objc_msgSend(v16, "setFragmentShaderKey:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_vertexShaderInfo, "objectForKey:", v14));

  if (!v17)
  {
    vertexShaderInfo = self->_vertexShaderInfo;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v3, CFSTR("binary"), 0));
    -[NSMutableDictionary setObject:forKey:](vertexShaderInfo, "setObject:forKey:", v19, v14);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_fragmentShaderInfo, "objectForKey:", v15));

  if (!v20)
  {
    fragmentShaderInfo = self->_fragmentShaderInfo;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, CFSTR("binary"), 0));
    -[NSMutableDictionary setObject:forKey:](fragmentShaderInfo, "setObject:forKey:", v22, v15);

  }
}

- (BOOL)_getFramebufferWidth:(int *)a3 height:(int *)a4 numSamples:(int *)a5
{
  void *v9;
  void (**v10)(id, uint64_t, int *);
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  unint64_t v22;
  __int128 v23;
  int v24;
  int v25;
  char v26;
  __int32 v27;
  BOOL v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v31;
  __int128 v32;
  BOOL v33;
  int *v35;
  int *v36;
  int *v37;
  __int128 v38;
  _QWORD v39[3];
  int32x2_t v40[4];
  char v41[4];
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  _QWORD v45[2];
  id v46[5];
  int v47[3];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v10 = (void (**)(id, uint64_t, int *))objc_msgSend(v9, "gliDispatch");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v12 = objc_msgSend(v11, "gliContext");

  v47[0] = 1;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "context"));
  sub_485C(v46, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v37 = a3;
  v45[0] = v46;
  v45[1] = objc_msgSend(v15, "gliDispatch");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "captureSessionInfo"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contextInfoForContext:", objc_msgSend(v18, "ctxID")));
  v20 = objc_msgSend(v19, "api");

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v22 = *((_QWORD *)objc_msgSend(v21, "currentContextInfo") + 13);

  if (v22 < 3)
  {
    v24 = 1;
  }
  else
  {
    v10[104](v12, 36063, v47);
    v24 = v47[0];
    if (v47[0] < -1)
    {
LABEL_19:
      v33 = 0;
      goto LABEL_20;
    }
  }
  v35 = a4;
  v36 = a5;
  v25 = 0;
  v26 = 0;
  *(_QWORD *)&v23 = 0x8000000080000000;
  v38 = v23;
  v27 = 0x7FFFFFFF;
  do
  {
    v28 = v25 < v24;
    if (v25 == v24)
      v29 = 36096;
    else
      v29 = 36128;
    v30 = v25 + 36064;
    if (v28)
      v31 = v30;
    else
      v31 = v29;
    GPUTools::GL::GetFramebufferAttachmentInfo(v45, v20, 36009, v31, v41);
    if (v42)
    {
      memset(v39, 0, sizeof(v39));
      v40[0].i32[0] = 0;
      *(int32x2_t *)((char *)v40 + 4) = (int32x2_t)0x100000001;
      memset((char *)&v40[1] + 4, 0, 13);
      GPUTools::GL::GetImageInfo(v45, v20, v42, v43, v44, v39);
      *((_QWORD *)&v32 + 1) = *((_QWORD *)&v38 + 1);
      *(int32x2_t *)&v32 = vmin_s32(v40[0], *(int32x2_t *)&v38);
      v38 = v32;
      if (v40[2].i32[0] < v27)
        v27 = v40[2].i32[0];
      v26 = 1;
    }
    v24 = v47[0];
    v25 = v30 - 36063;
  }
  while ((int)(v30 - 36064) <= v47[0]);
  if ((v26 & 1) == 0)
    goto LABEL_19;
  *v37 = v38;
  *v35 = DWORD1(v38);
  v33 = 1;
  *v36 = v27;
LABEL_20:

  return v33;
}

- (void)_backupAndSetupStates
{
  void (**v3)(id, uint64_t, float *);
  id v4;
  id v5;
  id v6;
  id v7;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v3 = (void (**)(id, uint64_t, float *))objc_msgSend(v5, "gliDispatch");

  v6 = (id)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v4 = objc_msgSend(v6, "gliContext");

  v3[103](v4, 3106, self->_backup_color_clear_value);
  v3[99](v4, 3107, (float *)self->_backup_color_writemask);
  v3[104](v4, 3042, (float *)&self->_backup_blend);
  v3[103](v4, 32773, self->_backup_blend_color);
  v3[104](v4, 32970, (float *)&self->_backup_blend_dst_alpha);
  v3[104](v4, 32968, (float *)&self->_backup_blend_dst_rgb);
  v3[104](v4, 34877, (float *)&self->_backup_blend_equation_alpha);
  v3[104](v4, 32777, (float *)&self->_backup_blend_equation_rgb);
  v3[104](v4, 32971, (float *)&self->_backup_blend_src_alpha);
  v3[104](v4, 32969, (float *)&self->_backup_blend_src_rgb);
  v3[104](v4, 3024, (float *)&self->_backup_dither);
  ((void (*)(id, uint64_t))v3[72])(v4, 3042);
  v3[458](v4, 35445, (float *)((char *)&loc_8A74 + 1));
  ((void (*)(id, uint64_t))v3[63])(v4, 3024);
  ((void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))v3[49])(v4, 1, 1, 1, 1);
  ((void (*)(id, float, float, float, float))v3[12])(v4, 0.0, 0.0, 0.0, 0.0);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
  self->_backup_enableWireframePresent = objc_msgSend(v7, "enableWireframePresent");

}

- (void)_restoreStates
{
  void (**v3)(id, float, float, float, float);
  id v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 backup_enableWireframePresent;
  id v8;
  id v9;
  id v10;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v3 = (void (**)(id, float, float, float, float))objc_msgSend(v8, "gliDispatch");

  v9 = (id)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v4 = objc_msgSend(v9, "gliContext");

  v3[12](v4, self->_backup_color_clear_value[0], self->_backup_color_clear_value[1], self->_backup_color_clear_value[2], self->_backup_color_clear_value[3]);
  ((void (*)(id, _QWORD, _QWORD, _QWORD, _QWORD))v3[49])(v4, self->_backup_color_writemask[0], self->_backup_color_writemask[1], self->_backup_color_writemask[2], self->_backup_color_writemask[3]);
  if (self->_backup_blend)
    v5 = 72;
  else
    v5 = 63;
  ((void (*)(id, uint64_t))v3[v5])(v4, 3042);
  v3[337](v4, self->_backup_blend_color[0], self->_backup_blend_color[1], self->_backup_blend_color[2], self->_backup_blend_color[3]);
  ((void (*)(id, _QWORD, _QWORD, _QWORD, _QWORD))v3[336])(v4, self->_backup_blend_src_rgb, self->_backup_blend_dst_rgb, self->_backup_blend_src_alpha, self->_backup_blend_dst_alpha);
  ((void (*)(id, _QWORD, _QWORD))v3[458])(v4, self->_backup_blend_equation_rgb, self->_backup_blend_equation_alpha);
  if (self->_backup_dither)
    v6 = 72;
  else
    v6 = 63;
  ((void (*)(id, uint64_t))v3[v6])(v4, 3024);
  backup_enableWireframePresent = self->_backup_enableWireframePresent;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
  objc_msgSend(v10, "setEnableWireframePresent:", backup_enableWireframePresent);

}

- (void)_restoreColorAttachment
{
  void *v3;
  unint64_t *v4;
  void *v5;
  void (**v6)(id, uint64_t, _DWORD *);
  void *v7;
  id v8;
  unordered_map<unsigned long long, std::unordered_map<unsigned int, std::vector<GPUTools::GL::FramebufferAttachmentInfo>>, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, std::unordered_map<unsigned int, std::vector<GPUTools::GL::FramebufferAttachmentInfo>>>>> *p_colorAttachmentMap;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t **v12;
  unsigned int *v13;
  unsigned int *v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  void (*v19)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  _QWORD *v25;
  unordered_map<unsigned long long, std::unordered_map<unsigned int, std::vector<GPUTools::GL::FramebufferAttachmentInfo>>, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, std::unordered_map<unsigned int, std::vector<GPUTools::GL::FramebufferAttachmentInfo>>>>> *v26;
  unsigned int v27;
  _BYTE v28[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v4 = (unint64_t *)objc_msgSend(v3, "function");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v6 = (void (**)(id, uint64_t, _DWORD *))objc_msgSend(v5, "gliDispatch");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  v8 = objc_msgSend(v7, "gliContext");

  p_colorAttachmentMap = &self->_colorAttachmentMap;
  v10 = sub_55DC(&self->_colorAttachmentMap.__table_.__bucket_list_.__ptr_.__value_, v4 + 2);
  if (v10)
  {
    v11 = v10;
    v26 = p_colorAttachmentMap;
    v27 = 0;
    v6[104](v8, 36006, &v27);
    v25 = v11;
    v12 = (uint64_t **)v11[5];
    if (v12)
    {
      while (1)
      {
        if (((unsigned int (*)(id, _QWORD))v6[671])(v8, *((unsigned int *)v12 + 4)))
        {
          v6[672](v8, 36009, (_DWORD *)*((unsigned int *)v12 + 4));
          v13 = (unsigned int *)v12[3];
          v14 = (unsigned int *)v12[4];
          if (v13 != v14)
            break;
        }
LABEL_23:
        v12 = (uint64_t **)*v12;
        if (!v12)
          goto LABEL_24;
      }
      v15 = 36064;
      while (1)
      {
        v16 = v13[2];
        if (v16 != 5890)
        {
          if (v16 == 36161)
            ((void (*)(id, uint64_t, uint64_t, uint64_t, _QWORD))v6[679])(v8, 36009, v15, 36161, v13[1]);
          else
            ((void (*)(id, uint64_t, uint64_t, uint64_t, _QWORD))v6[679])(v8, 36009, v15, 36161, 0);
          goto LABEL_20;
        }
        v17 = v13[3];
        if (v17 == 35866 || v17 == 32879)
        {
          v19 = (void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v6[691];
          v20 = v13[1];
          v21 = v13[5];
          v22 = v13[6];
        }
        else
        {
          v19 = (void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v6[677];
          v21 = v13[1];
          v20 = v13[4];
          v22 = v13[5];
          if (!(_DWORD)v20)
          {
            v23 = v8;
            v24 = v15;
            v20 = 3553;
            goto LABEL_19;
          }
        }
        v23 = v8;
        v24 = v15;
LABEL_19:
        v19(v23, 36009, v24, v20, v21, v22);
LABEL_20:
        v13 += 8;
        v15 = (v15 + 1);
        if (v13 == v14)
          goto LABEL_23;
      }
    }
LABEL_24:
    v6[672](v8, 36009, (_DWORD *)v27);
    sub_66FC(v26, v25, (uint64_t)v28);
    sub_12F74((uint64_t)v28, 0);
  }
}

- (BOOL)shouldReturn
{
  return self->_shouldReturn;
}

- (void)setShouldReturn:(BOOL)a3
{
  self->_shouldReturn = a3;
}

- (BOOL)shouldCallSuper
{
  return self->_shouldCallSuper;
}

- (void)setShouldCallSuper:(BOOL)a3
{
  self->_shouldCallSuper = a3;
}

- (void).cxx_destruct
{
  void *value;
  DYGLShaderProfilerProgramAddress *begin;
  unsigned int *v5;

  objc_storeStrong((id *)&self->_frameTiming_PerformanceStatisticsArray, 0);
  value = self->_frameTiming_FrameTimeStatistics.__ptr_.__value_;
  self->_frameTiming_FrameTimeStatistics.__ptr_.__value_ = 0;
  if (value)
    sub_12C10((uint64_t)&self->_frameTiming_FrameTimeStatistics, (uint64_t)value);
  begin = self->_uscSampling_AddressBuffer.__begin_;
  if (begin)
  {
    self->_uscSampling_AddressBuffer.__end_ = begin;
    operator delete(begin);
  }
  sub_48CC((uint64_t)&self->_drawCallIndexMap);
  sub_13328((uint64_t)&self->_colorAttachmentMap);
  objc_storeStrong((id *)&self->_fragmentShaderInfo, 0);
  objc_storeStrong((id *)&self->_vertexShaderInfo, 0);
  objc_storeStrong((id *)&self->_drawCallInfo, 0);
  v5 = self->_funcFlag.__begin_;
  if (v5)
  {
    self->_funcFlag.__end_ = v5;
    operator delete(v5);
  }
  sub_49BC((uint64_t)&self->_lastUpdatedFramebuffer);
  objc_storeStrong((id *)&self->_functionFlag, 0);
  objc_storeStrong((id *)&self->_payLoad, 0);
  objc_destroyWeak((id *)&self->_functionPlayer);
  objc_destroyWeak((id *)&self->_playbackEngine);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_DWORD *)self + 44) = 1065353216;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *((_DWORD *)self + 54) = 1065353216;
  *((_QWORD *)self + 43) = 0;
  *((_QWORD *)self + 44) = 0;
  *((_QWORD *)self + 42) = 0;
  *((_QWORD *)self + 50) = 0;
  return self;
}

@end
