@implementation VCRateControlTrafficMetricCollector

- (VCRateControlTrafficMetricCollector)initWithMediaController:(void *)a3 statisticsCollector:(id)a4
{
  VCRateControlTrafficMetricCollector *v4;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  VCRateControlTrafficMetricCollector *mediaController;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  objc_super v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  VCRateControlTrafficMetricCollector *v34;
  __int16 v35;
  VCRateControlTrafficMetricCollector *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v4 = self;
  v39 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((VCRateControlTrafficMetricCollector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCRateControlTrafficMetricCollector initWithMediaController:statisticsCollector:].cold.1();
      }
      goto LABEL_34;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)-[VCRateControlTrafficMetricCollector performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_34;
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_DWORD *)buf = 136316162;
    v26 = v19;
    v27 = 2080;
    v28 = "-[VCRateControlTrafficMetricCollector initWithMediaController:statisticsCollector:]";
    v29 = 1024;
    v30 = 23;
    v31 = 2112;
    v32 = (void *)v17;
    v33 = 2048;
    v34 = v4;
    v21 = " [%s] %s:%d %@(%p) Passed MediaController is nil";
    goto LABEL_37;
  }
  if (!a4)
  {
    if ((VCRateControlTrafficMetricCollector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCRateControlTrafficMetricCollector initWithMediaController:statisticsCollector:].cold.2();
      }
      goto LABEL_34;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = (const __CFString *)-[VCRateControlTrafficMetricCollector performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v18 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v22 = VRTraceErrorLogLevelToCSTR(),
          v20 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_34:

      return 0;
    }
    *(_DWORD *)buf = 136316162;
    v26 = v22;
    v27 = 2080;
    v28 = "-[VCRateControlTrafficMetricCollector initWithMediaController:statisticsCollector:]";
    v29 = 1024;
    v30 = 24;
    v31 = 2112;
    v32 = (void *)v18;
    v33 = 2048;
    v34 = v4;
    v21 = " [%s] %s:%d %@(%p) Passed statisticsCollector is nil";
LABEL_37:
    _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, v21, buf, 0x30u);
    goto LABEL_34;
  }
  v24.receiver = self;
  v24.super_class = (Class)VCRateControlTrafficMetricCollector;
  v4 = -[VCRateControlTrafficMetricCollector init](&v24, sel_init);
  if (!v4)
    goto LABEL_34;
  v4->_mediaController = a3;
  v4->_statisticsCollector = (AVCStatisticsCollector *)a4;
  v4->_isStopped = 1;
  if ((VCRateControlTrafficMetricCollector *)objc_opt_class() == v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        mediaController = (VCRateControlTrafficMetricCollector *)v4->_mediaController;
        *(_DWORD *)buf = 136316162;
        v26 = v8;
        v27 = 2080;
        v28 = "-[VCRateControlTrafficMetricCollector initWithMediaController:statisticsCollector:]";
        v29 = 1024;
        v30 = 30;
        v31 = 2048;
        v32 = v4;
        v33 = 2048;
        v34 = mediaController;
        v11 = " [%s] %s:%d Traffic Metric Collector=%p created with mediaController=%p";
        v12 = v9;
        v13 = 48;
LABEL_14:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCRateControlTrafficMetricCollector performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = v4->_mediaController;
        *(_DWORD *)buf = 136316674;
        v26 = v14;
        v27 = 2080;
        v28 = "-[VCRateControlTrafficMetricCollector initWithMediaController:statisticsCollector:]";
        v29 = 1024;
        v30 = 30;
        v31 = 2112;
        v32 = (void *)v7;
        v33 = 2048;
        v34 = v4;
        v35 = 2048;
        v36 = v4;
        v37 = 2048;
        v38 = v16;
        v11 = " [%s] %s:%d %@(%p) Traffic Metric Collector=%p created with mediaController=%p";
        v12 = v15;
        v13 = 68;
        goto LABEL_14;
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  VCRateControlTrafficMetricCollector *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((VCRateControlTrafficMetricCollector *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v13 = v4;
        v14 = 2080;
        v15 = "-[VCRateControlTrafficMetricCollector dealloc]";
        v16 = 1024;
        v17 = 41;
        v6 = " [%s] %s:%d VCRateControlTrafficMetricCollector dealloc";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCRateControlTrafficMetricCollector performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v13 = v9;
        v14 = 2080;
        v15 = "-[VCRateControlTrafficMetricCollector dealloc]";
        v16 = 1024;
        v17 = 41;
        v18 = 2112;
        v19 = v3;
        v20 = 2048;
        v21 = self;
        v6 = " [%s] %s:%d %@(%p) VCRateControlTrafficMetricCollector dealloc";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)VCRateControlTrafficMetricCollector;
  -[VCRateControlTrafficMetricCollector dealloc](&v11, sel_dealloc);
}

- (void)stopVCRateControlTrafficMetricCollector
{
  const __CFString *v3;
  NSObject *trafficMetricSource;
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  VCRateControlTrafficMetricCollector *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_isStopped)
  {
    if ((VCRateControlTrafficMetricCollector *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)-[VCRateControlTrafficMetricCollector performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v16 = 136316162;
          v17 = v10;
          v18 = 2080;
          v19 = "-[VCRateControlTrafficMetricCollector stopVCRateControlTrafficMetricCollector]";
          v20 = 1024;
          v21 = 49;
          v22 = 2112;
          v23 = v3;
          v24 = 2048;
          v25 = self;
          v9 = " [%s] %s:%d %@(%p) VCRateControlTrafficMetricCollector already stopped";
LABEL_26:
          v13 = v11;
          v14 = 48;
          goto LABEL_27;
        }
      }
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      return;
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    v16 = 136315650;
    v17 = v7;
    v18 = 2080;
    v19 = "-[VCRateControlTrafficMetricCollector stopVCRateControlTrafficMetricCollector]";
    v20 = 1024;
    v21 = 49;
    v9 = " [%s] %s:%d VCRateControlTrafficMetricCollector already stopped";
LABEL_21:
    v13 = v8;
    v14 = 28;
LABEL_27:
    _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, v14);
    return;
  }
  trafficMetricSource = self->_trafficMetricSource;
  if (trafficMetricSource)
  {
    dispatch_source_cancel(trafficMetricSource);
    v5 = self->_trafficMetricSource;
    if (v5)
    {
      dispatch_release(v5);
      self->_trafficMetricSource = 0;
    }
  }
  self->_trafficMetrics.bytesInFlights = 0;
  self->_trafficMetrics.senderTxBitrate = 0;
  self->_trafficMetrics.receiverTxBitrate = 0;
  self->_isStopped = 1;
  if ((VCRateControlTrafficMetricCollector *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      return;
    v12 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    v16 = 136315650;
    v17 = v12;
    v18 = 2080;
    v19 = "-[VCRateControlTrafficMetricCollector stopVCRateControlTrafficMetricCollector]";
    v20 = 1024;
    v21 = 58;
    v9 = " [%s] %s:%d VCRateControlTrafficMetricCollector stopped";
    goto LABEL_21;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = (const __CFString *)-[VCRateControlTrafficMetricCollector performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v6 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136316162;
      v17 = v15;
      v18 = 2080;
      v19 = "-[VCRateControlTrafficMetricCollector stopVCRateControlTrafficMetricCollector]";
      v20 = 1024;
      v21 = 58;
      v22 = 2112;
      v23 = v6;
      v24 = 2048;
      v25 = self;
      v9 = " [%s] %s:%d %@(%p) VCRateControlTrafficMetricCollector stopped";
      goto LABEL_26;
    }
  }
}

- (void)startVCRateControlTrafficMetricCollector
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d _trafficMetricSource dispatch source creation failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

uint64_t __79__VCRateControlTrafficMetricCollector_startVCRateControlTrafficMetricCollector__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "calculateTrafficMetrics");
}

- (void)calculateTrafficMetrics
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d mediaController is nill", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithMediaController:statisticsCollector:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Passed MediaController is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithMediaController:statisticsCollector:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Passed statisticsCollector is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
