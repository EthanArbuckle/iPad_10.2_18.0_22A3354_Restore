@implementation CBFrameStats

- (CBFrameStats)initWithQueue:(id)a3
{
  os_log_t v3;
  id v4;
  float *v5;
  uint64_t v7;
  uint64_t inited;
  NSObject *v9;
  int i;
  objc_super v11;
  id v12;
  SEL v13;
  id v14;
  uint8_t v16[40];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14 = self;
  v13 = a2;
  v12 = a3;
  if (!a3)
    return 0;
  v11.receiver = v14;
  v11.super_class = (Class)CBFrameStats;
  v14 = -[CBFrameStats init](&v11, sel_init);
  if (v14)
  {
    v3 = os_log_create("com.apple.CoreBrightness.FrameStats", "default");
    *((_QWORD *)v14 + 16) = v3;
    *((_QWORD *)v14 + 1) = v12;
    dispatch_retain(*((dispatch_object_t *)v14 + 1));
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)v14 + 17) = v4;
    objc_msgSend(v14, "initialiseWindowServerDisplay");
    for (i = 0;
          i < (unint64_t)objc_msgSend((id)objc_msgSend(*((id *)v14 + 2), "averagePixelConstraints"), "tableSize");
          ++i)
    {
      std::vector<float>::push_back[abi:ne180100]((uint64_t *)v14 + 3, (float *)(objc_msgSend((id)objc_msgSend(*((id *)v14 + 2), "averagePixelConstraints"), "nitsTable") + 4 * i));
      std::vector<float>::push_back[abi:ne180100]((uint64_t *)v14 + 6, (float *)(objc_msgSend((id)objc_msgSend(*((id *)v14 + 2), "averagePixelConstraints"), "averagePixelTable")+ 4 * i));
      if (*((_QWORD *)v14 + 16))
      {
        v9 = *((_QWORD *)v14 + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        v9 = inited;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(double *)&v7 = *(float *)std::vector<float>::back[abi:ne180100]((uint64_t)v14 + 24);
        v5 = (float *)std::vector<float>::back[abi:ne180100]((uint64_t)v14 + 48);
        __os_log_helper_16_0_4_4_0_8_0_4_0_8_0((uint64_t)v16, i, v7, i, COERCE__INT64(*v5));
        _os_log_impl(&dword_1B5291000, v9, OS_LOG_TYPE_DEFAULT, "FrameStats RTPLC | FrameDelayedNits[%d]=%f FrameDelayedAPCE[%d]=%f", v16, 0x22u);
      }
    }
    *((_BYTE *)v14 + 112) = 0;
    *((_DWORD *)v14 + 30) = 0;
    *((_DWORD *)v14 + 29) = 0;
    *((_QWORD *)v14 + 22) = 0;
    *((_DWORD *)v14 + 40) = 0;
    *((_DWORD *)v14 + 18) = 0;
    *((float *)v14 + 20) = 0.5;
    *((float *)v14 + 21) = 2.0;
    *((float *)v14 + 22) = mach_time_now_in_seconds();
    *((_DWORD *)v14 + 26) = 1060320051;
    *((float *)v14 + 27) = 10.0;
    *((float *)v14 + 31) = -1.0;
    *((_BYTE *)v14 + 148) = 0;
  }
  return (CBFrameStats *)v14;
}

- (void)initialiseWindowServerDisplay
{
  CAWindowServerDisplay *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id obj;
  uint64_t v9;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  _QWORD __b[8];
  id v15;
  uint8_t v16[7];
  char v17;
  NSObject *v18;
  id v19;
  SEL v20;
  CBFrameStats *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21 = self;
  v20 = a2;
  if (!self->_windowServerDisplay)
  {
    v19 = (id)objc_msgSend(MEMORY[0x1E0CD28E0], "serverIfRunning");
    if (v19)
    {
      memset(__b, 0, sizeof(__b));
      obj = (id)objc_msgSend(v19, "displays");
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v22, 16);
      if (v9)
      {
        v5 = *(_QWORD *)__b[2];
        v6 = 0;
        v7 = v9;
        while (1)
        {
          v4 = v6;
          if (*(_QWORD *)__b[2] != v5)
            objc_enumerationMutation(obj);
          v15 = 0;
          v15 = *(id *)(__b[1] + 8 * v6);
          if (!objc_msgSend(v15, "displayType", v7))
            break;
          ++v6;
          v7 = v3;
          if (v4 + 1 >= v3)
          {
            v6 = 0;
            v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v22, 16);
            if (!v7)
              return;
          }
        }
        v2 = (CAWindowServerDisplay *)v15;
        v21->_windowServerDisplay = v2;
      }
    }
    else
    {
      v18 = 0;
      if (v21->_logHandle)
      {
        logHandle = v21->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        logHandle = inited;
      }
      v18 = logHandle;
      v17 = 16;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        log = v18;
        type = v17;
        __os_log_helper_16_0_0(v16);
        _os_log_error_impl(&dword_1B5291000, log, type, "CAWindowServer is not running", v16, 2u);
      }
    }
  }
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBFrameStats *v4;

  v4 = self;
  v3 = a2;
  -[CBFrameStats stopMonitoring](self, "stopMonitoring");
  if (v4->_queue)
  {
    dispatch_release((dispatch_object_t)v4->_queue);
    v4->_queue = 0;
  }
  if (v4->_logHandle)
  {

    v4->_logHandle = 0;
  }

  v2.receiver = v4;
  v2.super_class = (Class)CBFrameStats;
  -[CBFrameStats dealloc](&v2, sel_dealloc);
}

- (void)startMonitoring:(id)a3
{
  uint64_t block;
  int v4;
  int v5;
  float (*v6)(uint64_t);
  void *v7;
  CBFrameStats *v8;
  dispatch_block_t v9;
  id v10;
  SEL v11;
  CBFrameStats *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  self->_previousFramePresentationTime = -1.0;
  v12->_rtplcCapApplied.previous = 0;
  v12->_rtplcCapApplied.triggerCount = 0.0;
  v12->_rtplcCapApplied.count = 0.0;
  v12->_peakAPCE.recoveryTimer = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v12->_queue);
  if (v12->_peakAPCE.recoveryTimer)
  {
    dispatch_source_set_timer((dispatch_source_t)v12->_peakAPCE.recoveryTimer, 0, (unint64_t)(float)(v12->_peakAPCE.recoveryWindowSize * 1000000000.0), 0);
    v9 = 0;
    block = MEMORY[0x1E0C809B0];
    v4 = -1073741824;
    v5 = 0;
    v6 = __32__CBFrameStats_startMonitoring___block_invoke;
    v7 = &unk_1E68E9E60;
    v8 = v12;
    v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, &block);
    if (v9)
    {
      dispatch_source_set_event_handler((dispatch_source_t)v12->_peakAPCE.recoveryTimer, v9);
      _Block_release(v9);
    }
    dispatch_resume((dispatch_object_t)v12->_peakAPCE.recoveryTimer);
  }
  -[CAWindowServerDisplay setFrameInfoCallback:](v12->_windowServerDisplay, "setFrameInfoCallback:", v10);
}

float __32__CBFrameStats_startMonitoring___block_invoke(uint64_t a1)
{
  uint64_t v1;
  float result;

  *(float *)(*(_QWORD *)(a1 + 32) + 120) = *(float *)(*(_QWORD *)(a1 + 32) + 120)
                                           * *(float *)(*(_QWORD *)(a1 + 32) + 104);
  v1 = *(_QWORD *)(a1 + 32);
  result = *(float *)(v1 + 116) * *(float *)(v1 + 104);
  *(float *)(v1 + 116) = result;
  return result;
}

- (void)stopMonitoring
{
  -[CAWindowServerDisplay setFrameInfoCallback:](self->_windowServerDisplay, "setFrameInfoCallback:", 0, a2);
  if (self->_peakAPCE.recoveryTimer)
  {
    dispatch_source_cancel((dispatch_source_t)self->_peakAPCE.recoveryTimer);
    dispatch_release((dispatch_object_t)self->_peakAPCE.recoveryTimer);
    self->_peakAPCE.recoveryTimer = 0;
  }
}

- (float)getMovingAverage
{
  float v2;
  float v3;
  float v4;
  double v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  float v20;
  float v21;
  float v22;
  float v24;
  float v25;
  unsigned __int16 v26;

  v25 = 0.0;
  v24 = 0.0;
  v22 = mach_time_now_in_seconds();
  v2 = v22 - self->_movingAverageDuration;
  v21 = v2;
  v20 = 0.0;
  while (-[NSMutableArray count](self->_frameArray, "count"))
  {
    v18 = (void *)-[NSMutableArray objectAtIndex:](self->_frameArray, "objectAtIndex:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)objc_msgSend(v18, "objectForKey:", CFSTR("PresentationTimeInSeconds")), "floatValue");
      v20 = v3;
      if (v3 >= v21)
        break;
      objc_msgSend((id)objc_msgSend(v18, "objectForKey:", CFSTR("APCE")), "floatValue");
      self->_lastFrameAPCE = v4;
      -[NSMutableArray removeObjectAtIndex:](self->_frameArray, "removeObjectAtIndex:", 0);
    }
  }
  if (!-[NSMutableArray count](self->_frameArray, "count"))
    return self->_lastFrameAPCE;
  v26 = 0;
  v19 = (void *)-[NSMutableArray objectAtIndex:](self->_frameArray, "objectAtIndex:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend((id)objc_msgSend(v19, "objectForKey:", CFSTR("PresentationTimeInSeconds")), "floatValue");
    v20 = *(float *)&v5;
  }
  *(float *)&v5 = v20;
  if (v20 > v21)
  {
    v25 = (float)(self->_lastFrameAPCE * (float)(v20 - v21)) + 0.0;
    *(float *)&v5 = (float)(v20 - v21) + 0.0;
    v24 = *(float *)&v5;
  }
  while (v26 + 1 < (unint64_t)-[NSMutableArray count](self->_frameArray, "count", v5))
  {
    v17 = (void *)-[NSMutableArray objectAtIndex:](self->_frameArray, "objectAtIndex:", v26);
    v16 = (void *)-[NSMutableArray objectAtIndex:](self->_frameArray, "objectAtIndex:", v26 + 1);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend((id)objc_msgSend(v17, "objectForKey:"), "floatValue");
        v15 = v6;
        objc_msgSend((id)objc_msgSend(v16, "objectForKey:", CFSTR("PresentationTimeInSeconds")), "floatValue");
        v14 = v7;
        objc_msgSend((id)objc_msgSend(v17, "objectForKey:", CFSTR("APCE")), "floatValue");
        v25 = v25 + (float)(*(float *)&v5 * (float)(v14 - v15));
        *(float *)&v5 = v24 + (float)(v14 - v15);
        v24 = *(float *)&v5;
      }
    }
    ++v26;
  }
  v13 = (void *)-[NSMutableArray objectAtIndex:](self->_frameArray, "objectAtIndex:", v26);
  v12 = 0.0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend((id)objc_msgSend(v13, "objectForKey:", CFSTR("PresentationTimeInSeconds")), "floatValue");
    v12 = v8;
  }
  if (v22 > v12)
  {
    objc_msgSend((id)objc_msgSend(v13, "objectForKey:", CFSTR("APCE")), "floatValue");
    v25 = v25 + (float)(v9 * (float)(v22 - v12));
  }
  return v25 / self->_movingAverageDuration;
}

- (void)enableFrameInfoLogging:(BOOL)a3
{
  self->_frameInfoLoggingEnabled = a3;
}

- (void)processFrameInfo:(id *)a3
{
  const char *v3;
  const char *v4;
  double v5;
  double v6;
  float v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *logHandle;
  void *v13;
  id v14;
  float var12;
  float v16;
  uint8_t v18[72];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_frameInfoLoggingEnabled)
  {
    if (self->_logHandle)
    {
      logHandle = self->_logHandle;
    }
    else
    {
      v10 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      logHandle = v10;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      if (a3->var8)
        v3 = "YES";
      else
        v3 = "NO";
      if (a3->var9)
        v4 = "YES";
      else
        v4 = "NO";
      __os_log_helper_16_2_7_4_0_8_0_8_32_8_32_8_0_8_0_8_0((uint64_t)v18, a3->var6, a3->var3, (uint64_t)v3, (uint64_t)v4, COERCE__INT64(a3->var10), COERCE__INT64(a3->var11), COERCE__INT64(a3->var12));
      _os_log_impl(&dword_1B5291000, logHandle, OS_LOG_TYPE_DEFAULT, "FrameStats Info\n{\n\tSwap=%u\n\tPresentationTime=%llu\n\tRTPLC.Triggered=%s\n\tRTPLC.CapApplied=%s\n\tNominalBrightness=%f\n\tScaleFactor=%f\n\tAPCE=%f\n}", v18, 0x44u);
    }
  }
  v16 = mach_time_to_seconds(a3->var3);
  var12 = a3->var12;
  self->_scaleFactor = a3->var11;
  v9 = objc_alloc(MEMORY[0x1E0C99D80]);
  *(float *)&v5 = var12;
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  *(float *)&v6 = v16;
  v14 = (id)objc_msgSend(v9, "initWithObjectsAndKeys:", v8, CFSTR("APCE"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6), CFSTR("PresentationTimeInSeconds"), 0);
  -[NSMutableArray addObject:](self->_frameArray, "addObject:", v14);

  if (-[CBFrameStats shouldPop](self, "shouldPop"))
  {
    v13 = (void *)-[NSMutableArray objectAtIndex:](self->_frameArray, "objectAtIndex:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)objc_msgSend(v13, "objectForKey:", CFSTR("APCE")), "floatValue");
      self->_lastFrameAPCE = v7;
    }
    -[NSMutableArray removeObjectAtIndex:](self->_frameArray, "removeObjectAtIndex:", 0);
  }
  if (var12 <= self->_peakAPCE.current)
  {
    if ((float)(mach_time_now_in_seconds() - self->_peakAPCE.windowStart) >= self->_peakAPCE.windowSize)
      self->_peakAPCE.current = self->_peakAPCE.current
                              + (float)((float)(var12 - self->_peakAPCE.current)
                                      * (float)(self->_peakAPCE.timeTaperConstant
                                              / (float)((float)((float)(self->_rtplcCapApplied.triggerCount
                                                                      * self->_rtplcCapApplied.count)
                                                              / 5.0)
                                                      + 1.0)));
  }
  else
  {
    self->_peakAPCE.current = var12;
    self->_peakAPCE.windowStart = mach_time_now_in_seconds();
  }
  if (a3->var9)
  {
    if (self->_previousFramePresentationTime != -1.0)
      self->_rtplcCapApplied.count = self->_rtplcCapApplied.count
                                   + (float)(60.0 * (float)(v16 - self->_previousFramePresentationTime));
    if (!self->_rtplcCapApplied.previous)
      self->_rtplcCapApplied.triggerCount = self->_rtplcCapApplied.triggerCount + 1.0;
  }
  if (a3->var8 || a3->var9)
  {
    if (!self->_tripLength)
    {
      self->_currentTripStartTime = mach_time_now_in_seconds();
      self->_tripMaxAPCE = 0.0;
    }
    self->_tripMaxAPCE = fmaxf(a3->var12, self->_tripMaxAPCE);
    ++self->_tripLength;
  }
  else
  {
    self->_tripLength = 0;
  }
  self->_rtplcCapApplied.previous = a3->var9;
  self->_previousFramePresentationTime = v16;
}

- (BOOL)shouldPop
{
  float v2;
  float v3;
  float v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v10;

  v8 = -[NSMutableArray count](self->_frameArray, "count");
  v10 = 0;
  if (v8)
  {
    v7 = (void *)-[NSMutableArray objectAtIndex:](self->_frameArray, "objectAtIndex:", 0);
    v6 = (void *)-[NSMutableArray objectAtIndex:](self->_frameArray, "objectAtIndex:", v8 - 1);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend((id)objc_msgSend(v7, "objectForKey:"), "floatValue");
        v5 = v2;
        objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("PresentationTimeInSeconds")), "floatValue");
        if ((float)(v3 - v5) > self->_movingAverageDuration)
          return 1;
      }
    }
  }
  return v10;
}

- (float)getPeakAPCE
{
  return std::__math::round[abi:ne180100](self->_peakAPCE.current * 100.0) / 100.0;
}

- (float)getPeakAPCECap
{
  float v2;
  float *v3;
  float v5;
  float v6;
  float v7;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  int i;
  float v13;
  uint8_t v14[15];
  char v15;
  NSObject *v16;
  SEL v17;
  CBFrameStats *v18;

  v18 = self;
  v17 = a2;
  if (std::vector<float>::empty[abi:ne180100](&self->_rtplcFrameDelayedNitsTable.__begin_))
  {
    v16 = 0;
    if (v18->_logHandle)
    {
      logHandle = v18->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      logHandle = inited;
    }
    v16 = logHandle;
    v15 = 16;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = v16;
      type = v15;
      __os_log_helper_16_0_0(v14);
      _os_log_error_impl(&dword_1B5291000, log, type, "FrameStats PeakAPCE | PixelConstraints table is empty!", v14, 2u);
    }
    return 100000.0;
  }
  else
  {
    -[CBFrameStats getPeakAPCE](v18, "getPeakAPCE");
    v13 = v2;
    for (i = 0; ; ++i)
    {
      if (i >= (unint64_t)std::vector<float>::size[abi:ne180100](&v18->_rtplcFrameDelayedNitsTable.__begin_))
        return *(float *)std::vector<float>::back[abi:ne180100]((uint64_t)&v18->_rtplcFrameDelayedNitsTable);
      if (v13 > *(float *)std::vector<float>::operator[][abi:ne180100](&v18->_rtplcFrameDelayedAPCETable.__begin_, i))
        break;
    }
    if (i)
    {
      v5 = *(float *)std::vector<float>::operator[][abi:ne180100](&v18->_rtplcFrameDelayedAPCETable.__begin_, i);
      v6 = *(float *)std::vector<float>::operator[][abi:ne180100](&v18->_rtplcFrameDelayedNitsTable.__begin_, i);
      v7 = *(float *)std::vector<float>::operator[][abi:ne180100](&v18->_rtplcFrameDelayedAPCETable.__begin_, i - 1);
      v3 = (float *)std::vector<float>::operator[][abi:ne180100](&v18->_rtplcFrameDelayedNitsTable.__begin_, i - 1);
      return linear_interpolation(v13, v5, v6, v7, *v3);
    }
    else
    {
      return *(float *)std::vector<float>::front[abi:ne180100]((uint64_t)&v18->_rtplcFrameDelayedNitsTable);
    }
  }
}

- (double)movingAverageDuration
{
  return self->_movingAverageDuration;
}

- (void)setMovingAverageDuration:(double)a3
{
  self->_movingAverageDuration = a3;
}

- (float)scaleFactor
{
  return self->_scaleFactor;
}

- (unint64_t)tripLength
{
  return self->_tripLength;
}

- (float)currentTripStartTime
{
  return self->_currentTripStartTime;
}

- (float)tripMaxAPCE
{
  return self->_tripMaxAPCE;
}

- (void).cxx_destruct
{
  std::vector<float>::~vector[abi:ne180100]((uint64_t *)&self->_rtplcFrameDelayedAPCETable);
  std::vector<float>::~vector[abi:ne180100]((uint64_t *)&self->_rtplcFrameDelayedNitsTable);
}

- (id).cxx_construct
{
  std::vector<float>::vector[abi:ne180100](&self->_rtplcFrameDelayedNitsTable.__begin_);
  std::vector<float>::vector[abi:ne180100](&self->_rtplcFrameDelayedAPCETable.__begin_);
  return self;
}

@end
