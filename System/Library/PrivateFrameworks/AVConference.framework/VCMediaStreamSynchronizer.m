@implementation VCMediaStreamSynchronizer

- (VCMediaStreamSynchronizer)initWithSourceSampleRate:(unsigned int)a3 destinationSampleRate:(unsigned int)a4
{
  VCMediaStreamSynchronizer *v7;
  VCMediaStreamSynchronizer *v8;
  uint64_t v9;
  NSObject *v10;
  int64_t sampleRate;
  int64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  objc_super v17;
  uint8_t buf[72];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v17.receiver = self;
    v17.super_class = (Class)VCMediaStreamSynchronizer;
    v7 = -[VCMediaStreamSynchronizer init](&v17, sel_init);
    v8 = v7;
    if (v7)
    {
      v7->_source.sampleRate = a3;
      v7->_destination.sampleRate = a4;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          sampleRate = v8->_source.sampleRate;
          v12 = v8->_destination.sampleRate;
          *(_DWORD *)buf = 136316418;
          *(_QWORD *)&buf[4] = v9;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCMediaStreamSynchronizer initWithSourceSampleRate:destinationSampleRate:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 47;
          *(_WORD *)&buf[28] = 2048;
          *(_QWORD *)&buf[30] = v8;
          *(_WORD *)&buf[38] = 2048;
          *(_QWORD *)&buf[40] = sampleRate;
          *(_WORD *)&buf[48] = 2048;
          *(_QWORD *)&buf[50] = v12;
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: sourceSampleRate:%ld destinationSampleRate:%ld", buf, 0x3Au);
        }
      }
      v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
      v8->_mediaStreamSynchronizerQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVConference.VCMediaStreamSynchronizer.mediaStreamSynchronizerQueue", v13);
      memset(buf, 0, 64);
      VCVideoPlayer_Create((uint64_t *)&v8->_videoPlayerHandle, (__int128 *)buf);
      v8->_sourceState = 1;
      *(_QWORD *)&v8->_sourcePlayoutHandlerLock._os_unfair_lock_opaque = 0;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCMediaStreamSynchronizer initWithSourceSampleRate:destinationSampleRate:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 41;
        *(_WORD *)&buf[28] = 2048;
        *(_QWORD *)&buf[30] = self;
        *(_WORD *)&buf[38] = 1024;
        *(_DWORD *)&buf[40] = a3;
        *(_WORD *)&buf[44] = 1024;
        *(_DWORD *)&buf[46] = a4;
        _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p] failed! sourceSampleRate:%u destinationSampleRate:%u", buf, 0x32u);
      }
    }
    return 0;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  dispatch_release((dispatch_object_t)self->_mediaStreamSynchronizerQueue);
  _Block_release(self->_destinationHandler);
  self->_destinationHandler = 0;
  _Block_release(self->_sourcePlayoutTimeUpdatedHandler);
  VCVideoPlayer_Destroy(&self->_videoPlayerHandle);
  v3.receiver = self;
  v3.super_class = (Class)VCMediaStreamSynchronizer;
  -[VCMediaStreamSynchronizer dealloc](&v3, sel_dealloc);
}

- (unsigned)sourceSampleRate
{
  return self->_source.sampleRate;
}

double __VCMediaStreamSynchronizer_updateDestinationNTPTime_block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 72) = result;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 88) = *(_DWORD *)(a1 + 48);
  return result;
}

uint64_t __VCMediaStreamSynchronizer_resetDestinationState_block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 72) = 0;
  *(_DWORD *)(*(_QWORD *)(result + 32) + 88) = 0;
  return result;
}

uint64_t __VCMediaStreamSynchronizer_scheduleTimeForDestinationRTPTimestamp_block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  int v4;
  unsigned int v5;
  BOOL v6;
  int v7;
  unsigned int v8;
  int v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  result = _VCMediaStreamSynchronizer_sourceRTPTimestampFromDestinationRTPTimestampInternal(*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 48), (int *)&v19);
  if ((_DWORD)result)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_DWORD *)(v3 + 16);
    v5 = *(_DWORD *)(v3 + 96);
    v6 = v19 >= v5 || v19 - v5 >= 0x7FFFFFFF;
    v7 = !v6;
    v6 = v5 >= v19;
    v8 = v5 - v19;
    if (v6 || v8 >= 0x7FFFFFFF)
      v10 = v7;
    else
      v10 = -1;
    v11 = v4 + v10;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = ((double)v19 + (double)(v4 + v10) * 4294967300.0)
                                                                / (double)*(uint64_t *)(v3 + 56);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      v14 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(_QWORD *)(a1 + 32);
          v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          *(_DWORD *)buf = 136316418;
          v21 = v12;
          v22 = 2080;
          v23 = "VCMediaStreamSynchronizer_scheduleTimeForDestinationRTPTimestamp_block_invoke";
          v24 = 1024;
          v25 = 187;
          v26 = 2048;
          v27 = v15;
          v28 = 1024;
          v29 = v11;
          v30 = 2048;
          v31 = v16;
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: wrapCount=%d sourceTime=%.9f", buf, 0x36u);
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v17 = *(_QWORD *)(a1 + 32);
        v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        *(_DWORD *)buf = 136316418;
        v21 = v12;
        v22 = 2080;
        v23 = "VCMediaStreamSynchronizer_scheduleTimeForDestinationRTPTimestamp_block_invoke";
        v24 = 1024;
        v25 = 187;
        v26 = 2048;
        v27 = v17;
        v28 = 1024;
        v29 = v11;
        v30 = 2048;
        v31 = v18;
        _os_log_debug_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEBUG, "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: wrapCount=%d sourceTime=%.9f", buf, 0x36u);
      }
    }
    return kdebug_trace();
  }
  return result;
}

BOOL __VCMediaStreamSynchronizer_sourceRTPTimestampFromDestinationRTPTimestamp_block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = _VCMediaStreamSynchronizer_sourceRTPTimestampFromDestinationRTPTimestampInternal(*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 56), (int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __VCMediaStreamSynchronizer_destRTPTimestampFromSourceRTPTimestamp_block_invoke(uint64_t a1)
{
  _DWORD *v1;
  uint64_t *v2;
  int v4;
  int ErrorLogLevelForModule;
  _BYTE *v6;
  NSObject **v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  int v47;
  uint64_t v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  __int16 v65;
  int v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  int v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v2 = (uint64_t *)(a1 + 32);
  v1 = *(_DWORD **)(a1 + 32);
  if (v1[25] != 1 && v1[16] && v1[24])
  {
    v4 = v1[22];
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v4)
    {
      v6 = (_BYTE *)MEMORY[0x1E0CF2748];
      v7 = (NSObject **)MEMORY[0x1E0CF2758];
      if (ErrorLogLevelForModule >= 8)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *v7;
        v10 = *v7;
        if (*v6)
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v11 = *(_QWORD *)(a1 + 32);
            v12 = *(_DWORD *)(v11 + 96);
            v13 = *(_DWORD *)(v11 + 64);
            v14 = *(_QWORD *)(v11 + 48);
            v15 = *(_QWORD *)(v11 + 56);
            v16 = **(_DWORD **)(a1 + 48);
            v17 = *(_DWORD *)(v11 + 88);
            v18 = *(_QWORD *)(v11 + 72);
            v19 = *(_QWORD *)(v11 + 80);
            v47 = 136317954;
            v48 = v8;
            v49 = 2080;
            v50 = "VCMediaStreamSynchronizer_destRTPTimestampFromSourceRTPTimestamp_block_invoke";
            v51 = 1024;
            v52 = 225;
            v53 = 2048;
            v54 = v11;
            v55 = 1024;
            v56 = v12;
            v57 = 1024;
            v58 = v13;
            v59 = 2048;
            v60 = v14;
            v61 = 1024;
            v62 = v15;
            v63 = 1024;
            v64 = v16;
            v65 = 1024;
            v66 = v17;
            v67 = 2048;
            v68 = v18;
            v69 = 1024;
            v70 = v19;
            _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: lastSrcRTP=%u srcSRRTP=%u srcSRNPT=%.9f srcRate=%d dstRTP=%u dstSrRTP=%u dstSRNTP=%.9f dstRate=%d", (uint8_t *)&v47, 0x5Eu);
          }
        }
        else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v36 = *(_QWORD *)(a1 + 32);
          v37 = *(_DWORD *)(v36 + 96);
          v38 = *(_DWORD *)(v36 + 64);
          v39 = *(_QWORD *)(v36 + 48);
          v40 = *(_QWORD *)(v36 + 56);
          v41 = **(_DWORD **)(a1 + 48);
          v42 = *(_DWORD *)(v36 + 88);
          v43 = *(_QWORD *)(v36 + 72);
          v44 = *(_QWORD *)(v36 + 80);
          v47 = 136317954;
          v48 = v8;
          v49 = 2080;
          v50 = "VCMediaStreamSynchronizer_destRTPTimestampFromSourceRTPTimestamp_block_invoke";
          v51 = 1024;
          v52 = 225;
          v53 = 2048;
          v54 = v36;
          v55 = 1024;
          v56 = v37;
          v57 = 1024;
          v58 = v38;
          v59 = 2048;
          v60 = v39;
          v61 = 1024;
          v62 = v40;
          v63 = 1024;
          v64 = v41;
          v65 = 1024;
          v66 = v42;
          v67 = 2048;
          v68 = v43;
          v69 = 1024;
          v70 = v44;
          _os_log_debug_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEBUG, "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: lastSrcRTP=%u srcSRRTP=%u srcSRNPT=%.9f srcRate=%d dstRTP=%u dstSrRTP=%u dstSRNTP=%.9f dstRate=%d", (uint8_t *)&v47, 0x5Eu);
        }
      }
      v28 = _VCMediaStreamSynchronizer_differenceBetweenRtpTimestamp(*(_DWORD *)(a1 + 56), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 64));
      v29 = *(_QWORD *)(a1 + 32);
      v30 = *(_DWORD *)(v29 + 88)
          + (int)((*(double *)(v29 + 48) + (double)v28 / (double)*(uint64_t *)(v29 + 56) - *(double *)(v29 + 72))
                * (double)*(uint64_t *)(v29 + 80));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v31 = VRTraceErrorLogLevelToCSTR();
        v32 = *v7;
        v33 = *v7;
        if (*v6)
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v34 = *(_QWORD *)(a1 + 32);
            v35 = *(_DWORD *)(a1 + 56);
            v47 = 136316418;
            v48 = v31;
            v49 = 2080;
            v50 = "VCMediaStreamSynchronizer_destRTPTimestampFromSourceRTPTimestamp_block_invoke";
            v51 = 1024;
            v52 = 230;
            v53 = 2048;
            v54 = v34;
            v55 = 1024;
            v56 = v35;
            v57 = 1024;
            v58 = v30;
            _os_log_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_DEFAULT, "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: SToD: %u->%u", (uint8_t *)&v47, 0x32u);
          }
        }
        else if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          v45 = *(_QWORD *)(a1 + 32);
          v46 = *(_DWORD *)(a1 + 56);
          v47 = 136316418;
          v48 = v31;
          v49 = 2080;
          v50 = "VCMediaStreamSynchronizer_destRTPTimestampFromSourceRTPTimestamp_block_invoke";
          v51 = 1024;
          v52 = 230;
          v53 = 2048;
          v54 = v45;
          v55 = 1024;
          v56 = v46;
          v57 = 1024;
          v58 = v30;
          _os_log_debug_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_DEBUG, "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: SToD: %u->%u", (uint8_t *)&v47, 0x32u);
        }
      }
      **(_DWORD **)(a1 + 48) = v30;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      return;
    }
    if (ErrorLogLevelForModule < 8)
      return;
    v25 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    v26 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        return;
      v27 = *v2;
      v47 = 136315906;
      v48 = v25;
      v49 = 2080;
      v50 = "VCMediaStreamSynchronizer_destRTPTimestampFromSourceRTPTimestamp_block_invoke";
      v51 = 1024;
      v52 = 221;
      v53 = 2048;
      v54 = v27;
      v24 = "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: destination info not ready";
LABEL_13:
      _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v47, 0x26u);
      return;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      __VCMediaStreamSynchronizer_destRTPTimestampFromSourceRTPTimestamp_block_invoke_cold_2();
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      return;
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    v22 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        return;
      v23 = *v2;
      v47 = 136315906;
      v48 = v20;
      v49 = 2080;
      v50 = "VCMediaStreamSynchronizer_destRTPTimestampFromSourceRTPTimestamp_block_invoke";
      v51 = 1024;
      v52 = 216;
      v53 = 2048;
      v54 = v23;
      v24 = "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: source info not ready";
      goto LABEL_13;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      __VCMediaStreamSynchronizer_destRTPTimestampFromSourceRTPTimestamp_block_invoke_cold_1();
  }
}

void __VCMediaStreamSynchronizer_destRTPTimestampFromSourceRTPTimestamp_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: source info not ready", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __VCMediaStreamSynchronizer_destRTPTimestampFromSourceRTPTimestamp_block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_12_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "VCMediaStreamSynchronizer [%s] %s:%d VCMediaStreamSynchronizer[%p]: destination info not ready", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
