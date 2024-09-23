@implementation BWImageControlModeTransitionMonitor

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWImageControlModeTransitionMonitor)init
{
  char *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWImageControlModeTransitionMonitor;
  v2 = -[BWImageControlModeTransitionMonitor init](&v5, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 8) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_QWORD *)v2 + 9) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_QWORD *)v2 + 10) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_QWORD *)v2 + 6) = 0;
    v3 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)(v2 + 92) = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)(v2 + 108) = *(_QWORD *)(v3 + 16);
  }
  return (BWImageControlModeTransitionMonitor *)v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWImageControlModeTransitionMonitor;
  -[BWImageControlModeTransitionMonitor dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> Frame wait count %d.\nExpectedSphereModes %@, Actual %@\nExpectedMinimumFrameRates %@, ExpectedMaximumFrameRates %@, ActualFramerates %@"), NSStringFromClass(v4), self, HIDWORD(self->_firstFramePTS.epoch), self->_expectedSphereModesByPortType, self->_currentSphereModesByPortType, self->_expectedMinimumFrameRatesByPortType, self->_expectedMaximumFrameRatesByPortType, self->_currentFrameRatesByPortType);
}

- (BOOL)isTransitionCompleteWithSampleBuffer:(opaqueCMSampleBuffer *)a3 masterCaptureStreamPortType:(id)a4 activeSlaveStreamPortType:(id)a5
{
  void *v8;
  uint64_t v9;
  NSDictionary *expectedSphereModesByPortType;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  _BOOL4 v16;
  _QWORD *v17;
  NSDictionary *expectedMinimumFrameRatesByPortType;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  float v24;
  float v25;
  float v26;
  NSDictionary *expectedMaximumFrameRatesByPortType;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  float v33;
  float v34;
  float v35;
  NSDictionary *expectedLTMCurvesByPortType;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  int v42;
  int ltmCurvesTransitionFrameCount;
  int v44;
  void *v45;
  int v46;
  int *v47;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  BOOL v49;
  NSObject *v50;
  unsigned int value;
  unsigned int v52;
  int epoch_high;
  NSDictionary *v54;
  NSDictionary *v55;
  NSDictionary *v56;
  NSMutableDictionary *currentSphereModesByPortType;
  NSMutableDictionary *currentFrameRatesByPortType;
  _BYTE *v60;
  uint64_t v61;
  uint64_t v63;
  uint64_t v64;
  _BOOL4 v65;
  void *v66;
  CMTime time;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[28];
  __int16 v85;
  NSMutableDictionary *v86;
  __int16 v87;
  NSDictionary *v88;
  __int16 v89;
  NSDictionary *v90;
  __int16 v91;
  NSMutableDictionary *v92;
  CMTime lhs;
  CMTime rhs;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v8 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v9 = objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  v63 = objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB8]);
  v64 = v9;
  v66 = v8;
  if (self->_expectedSphereModesByPortType)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentSphereModesByPortType, "setObject:forKeyedSubscript:", objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06E58]), v9);
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    expectedSphereModesByPortType = self->_expectedSphereModesByPortType;
    v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](expectedSphereModesByPortType, "countByEnumeratingWithState:objects:count:", &v80, v98, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v81;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v81 != v13)
            objc_enumerationMutation(expectedSphereModesByPortType);
          v15 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
          if (((objc_msgSend(v15, "isEqualToString:", a4) & 1) != 0
             || objc_msgSend(v15, "isEqualToString:", a5))
            && !objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_expectedSphereModesByPortType, "objectForKeyedSubscript:", v15), "isEqualToString:", -[NSMutableDictionary objectForKeyedSubscript:](self->_currentSphereModesByPortType, "objectForKeyedSubscript:", v15)))
          {
            v16 = 0;
            v9 = v64;
            v8 = v66;
            goto LABEL_16;
          }
        }
        v12 = -[NSDictionary countByEnumeratingWithState:objects:count:](expectedSphereModesByPortType, "countByEnumeratingWithState:objects:count:", &v80, v98, 16);
        v16 = 1;
        v9 = v64;
        v8 = v66;
        if (v12)
          continue;
        break;
      }
    }
    else
    {
      v16 = 1;
    }
  }
  else
  {
    v16 = 0;
  }
LABEL_16:
  if ((objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06790]), "BOOLValue") & 1) == 0)
  {
    v17 = (_QWORD *)MEMORY[0x1E0D06978];
    if (self->_expectedMinimumFrameRatesByPortType)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentFrameRatesByPortType, "setObject:forKeyedSubscript:", objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06978]), v9);
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      expectedMinimumFrameRatesByPortType = self->_expectedMinimumFrameRatesByPortType;
      v19 = -[NSDictionary countByEnumeratingWithState:objects:count:](expectedMinimumFrameRatesByPortType, "countByEnumeratingWithState:objects:count:", &v76, v97, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v77;
        while (2)
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v77 != v21)
              objc_enumerationMutation(expectedMinimumFrameRatesByPortType);
            v23 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
            if ((objc_msgSend(v23, "isEqualToString:", a4) & 1) != 0
              || objc_msgSend(v23, "isEqualToString:", a5))
            {
              objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_expectedMinimumFrameRatesByPortType, "objectForKeyedSubscript:", v23), "floatValue");
              v25 = v24;
              objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_currentFrameRatesByPortType, "objectForKeyedSubscript:", v23), "floatValue");
              if ((float)(v26 + 0.1) < v25)
              {
                LOBYTE(v16) = 0;
                goto LABEL_30;
              }
            }
          }
          v20 = -[NSDictionary countByEnumeratingWithState:objects:count:](expectedMinimumFrameRatesByPortType, "countByEnumeratingWithState:objects:count:", &v76, v97, 16);
          if (v20)
            continue;
          break;
        }
LABEL_30:
        v9 = v64;
        v8 = v66;
        v17 = (_QWORD *)MEMORY[0x1E0D06978];
      }
    }
    else
    {
      LOBYTE(v16) = 0;
    }
    if (self->_expectedMaximumFrameRatesByPortType)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentFrameRatesByPortType, "setObject:forKeyedSubscript:", objc_msgSend(v8, "objectForKeyedSubscript:", *v17), v9);
      v75 = 0u;
      v73 = 0u;
      v74 = 0u;
      v72 = 0u;
      expectedMaximumFrameRatesByPortType = self->_expectedMaximumFrameRatesByPortType;
      v28 = -[NSDictionary countByEnumeratingWithState:objects:count:](expectedMaximumFrameRatesByPortType, "countByEnumeratingWithState:objects:count:", &v72, v96, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v73;
LABEL_35:
        v31 = 0;
        while (1)
        {
          if (*(_QWORD *)v73 != v30)
            objc_enumerationMutation(expectedMaximumFrameRatesByPortType);
          v32 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v31);
          if ((objc_msgSend(v32, "isEqualToString:", a4) & 1) != 0
            || objc_msgSend(v32, "isEqualToString:", a5))
          {
            objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_expectedMaximumFrameRatesByPortType, "objectForKeyedSubscript:", v32), "floatValue");
            v34 = v33;
            objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_currentFrameRatesByPortType, "objectForKeyedSubscript:", v32), "floatValue");
            if ((float)(v35 + 0.1) < v34)
              break;
          }
          if (v29 == ++v31)
          {
            v29 = -[NSDictionary countByEnumeratingWithState:objects:count:](expectedMaximumFrameRatesByPortType, "countByEnumeratingWithState:objects:count:", &v72, v96, 16);
            if (v29)
              goto LABEL_35;
            goto LABEL_43;
          }
        }
      }
      else
      {
LABEL_43:
        if (v16)
        {
          v16 = 1;
LABEL_46:
          v9 = v64;
          v8 = v66;
          goto LABEL_48;
        }
      }
      v16 = SHIDWORD(self->_firstFramePTS.epoch) > 10;
      goto LABEL_46;
    }
    v16 = 0;
  }
LABEL_48:
  if (!self->_expectedLTMCurvesByPortType)
  {
    v16 = 0;
    goto LABEL_64;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentLTMCurvesByPortType, "setObject:forKeyedSubscript:", objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06BD0]), v9);
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  expectedLTMCurvesByPortType = self->_expectedLTMCurvesByPortType;
  v37 = -[NSDictionary countByEnumeratingWithState:objects:count:](expectedLTMCurvesByPortType, "countByEnumeratingWithState:objects:count:", &v68, v95, 16);
  if (v37)
  {
    v38 = v37;
    v65 = v16;
    v39 = *(_QWORD *)v69;
    while (2)
    {
      for (k = 0; k != v38; ++k)
      {
        if (*(_QWORD *)v69 != v39)
          objc_enumerationMutation(expectedLTMCurvesByPortType);
        v41 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * k);
        if ((objc_msgSend(v41, "isEqualToString:", a4) & 1) != 0
          || objc_msgSend(v41, "isEqualToString:", a5))
        {
          v42 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_expectedLTMCurvesByPortType, "objectForKeyedSubscript:", v41), "intValue");
          if (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_currentLTMCurvesByPortType, "objectForKeyedSubscript:", v41), "intValue") != v42)
          {
            ltmCurvesTransitionFrameCount = self->_ltmCurvesTransitionFrameCount;
            if (ltmCurvesTransitionFrameCount > 0)
            {
              v44 = 0;
              v45 = (void *)v63;
              v16 = v65;
              v8 = v66;
              goto LABEL_67;
            }
            v45 = (void *)v63;
            v16 = v65;
            v8 = v66;
            goto LABEL_71;
          }
        }
      }
      v38 = -[NSDictionary countByEnumeratingWithState:objects:count:](expectedLTMCurvesByPortType, "countByEnumeratingWithState:objects:count:", &v68, v95, 16);
      if (v38)
        continue;
      break;
    }
    ltmCurvesTransitionFrameCount = self->_ltmCurvesTransitionFrameCount;
    v16 = v65;
    v8 = v66;
    if (ltmCurvesTransitionFrameCount > 0)
      goto LABEL_66;
    goto LABEL_64;
  }
  ltmCurvesTransitionFrameCount = self->_ltmCurvesTransitionFrameCount;
  if (ltmCurvesTransitionFrameCount < 1)
  {
LABEL_64:
    v45 = (void *)v63;
    goto LABEL_71;
  }
LABEL_66:
  v44 = self->_ltmCurvesTransitionFrameWaitCount + 1;
  v45 = (void *)v63;
LABEL_67:
  self->_ltmCurvesTransitionFrameWaitCount = v44;
  if (v44 < ltmCurvesTransitionFrameCount)
    v16 = 0;
LABEL_71:
  if (self->_coarseFocusCheckTimeout > 0.0 && !LOBYTE(self->_frameWaitCount))
  {
    v46 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D067D0]), "intValue");
    LOBYTE(self->_frameWaitCount) = v46 != 2;
    if (v46 == 2)
    {
      memset(v84, 0, 24);
      CMSampleBufferGetPresentationTimeStamp((CMTime *)v84, a3);
      v47 = &self->_ltmCurvesTransitionFrameWaitCount + 1;
      if ((self->_firstFramePTS.timescale & 1) != 0)
      {
        lhs = *(CMTime *)v84;
        *(_OWORD *)&rhs.value = *(_OWORD *)v47;
        rhs.epoch = *(_QWORD *)&self->_firstFramePTS.flags;
        CMTimeSubtract(&time, &lhs, &rhs);
        if (CMTimeGetSeconds(&time) > self->_coarseFocusCheckTimeout)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          LOBYTE(self->_frameWaitCount) = 1;
        }
      }
      else
      {
        CMSampleBufferGetPresentationTimeStamp(&lhs, a3);
        *(_OWORD *)v47 = *(_OWORD *)&lhs.value;
        *(_QWORD *)&self->_firstFramePTS.flags = lhs.epoch;
      }
      if (!LOBYTE(self->_frameWaitCount))
        v16 = 0;
    }
  }
  if (self->_waitForTorchToRampUp)
  {
    if ((v16 & ~objc_msgSend((id)CMGetAttachment(a3, CFSTR("DropFrameWaitingForTorchToRampUp"), 0), "BOOLValue") & 1) != 0)
    {
LABEL_82:
      v49 = 1;
      goto LABEL_92;
    }
  }
  else if (v16)
  {
    goto LABEL_82;
  }
  if (SHIDWORD(self->_firstFramePTS.epoch) < 45)
  {
    v49 = 0;
  }
  else
  {
    LODWORD(rhs.value) = 0;
    v50 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    value = rhs.value;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      v52 = value;
    else
      v52 = value & 0xFFFFFFFE;
    if (v52)
    {
      epoch_high = HIDWORD(self->_firstFramePTS.epoch);
      v54 = self->_expectedSphereModesByPortType;
      v55 = self->_expectedMinimumFrameRatesByPortType;
      v56 = self->_expectedMaximumFrameRatesByPortType;
      currentSphereModesByPortType = self->_currentSphereModesByPortType;
      currentFrameRatesByPortType = self->_currentFrameRatesByPortType;
      *(_DWORD *)v84 = 136316674;
      *(_QWORD *)&v84[4] = "-[BWImageControlModeTransitionMonitor isTransitionCompleteWithSampleBuffer:masterCaptureStrea"
                           "mPortType:activeSlaveStreamPortType:]";
      *(_WORD *)&v84[12] = 1024;
      *(_DWORD *)&v84[14] = epoch_high;
      *(_WORD *)&v84[18] = 2112;
      *(_QWORD *)&v84[20] = v54;
      v85 = 2112;
      v86 = currentSphereModesByPortType;
      v87 = 2112;
      v88 = v55;
      v89 = 2112;
      v90 = v56;
      v91 = 2112;
      v92 = currentFrameRatesByPortType;
      LODWORD(v61) = 68;
      v60 = v84;
      _os_log_send_and_compose_impl();
    }
    v49 = 1;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_92:
  if ((objc_msgSend(v45, "BOOLValue", v60, v61) & 1) != 0 || !v45)
    ++HIDWORD(self->_firstFramePTS.epoch);
  return v49;
}

- (NSDictionary)expectedSphereModesByPortType
{
  return self->_expectedSphereModesByPortType;
}

- (void)setExpectedSphereModesByPortType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)expectedMinimumFrameRatesByPortType
{
  return self->_expectedMinimumFrameRatesByPortType;
}

- (void)setExpectedMinimumFrameRatesByPortType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)expectedMaximumFrameRatesByPortType
{
  return self->_expectedMaximumFrameRatesByPortType;
}

- (void)setExpectedMaximumFrameRatesByPortType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)expectedLTMCurvesByPortType
{
  return self->_expectedLTMCurvesByPortType;
}

- (void)setExpectedLTMCurvesByPortType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)ltmCurvesTransitionFrameCount
{
  return self->_ltmCurvesTransitionFrameCount;
}

- (void)setLtmCurvesTransitionFrameCount:(int)a3
{
  self->_ltmCurvesTransitionFrameCount = a3;
}

- (double)coarseFocusCheckTimeout
{
  return self->_coarseFocusCheckTimeout;
}

- (void)setCoarseFocusCheckTimeout:(double)a3
{
  self->_coarseFocusCheckTimeout = a3;
}

- (BOOL)waitForTorchToRampUp
{
  return self->_waitForTorchToRampUp;
}

- (void)setWaitForTorchToRampUp:(BOOL)a3
{
  self->_waitForTorchToRampUp = a3;
}

@end
