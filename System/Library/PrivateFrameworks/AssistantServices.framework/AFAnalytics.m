@implementation AFAnalytics

+ (id)sharedAnalytics
{
  if (sharedAnalytics_onceToken != -1)
    dispatch_once(&sharedAnalytics_onceToken, &__block_literal_global_26748);
  return (id)sharedAnalytics_analytics;
}

void __30__AFAnalytics_sharedAnalytics__block_invoke()
{
  AFAnalytics *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [AFAnalytics alloc];
  +[AFInstanceContext currentContext](AFInstanceContext, "currentContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[AFAnalytics initWithInstanceContext:](v0, "initWithInstanceContext:", v3);
  v2 = (void *)sharedAnalytics_analytics;
  sharedAnalytics_analytics = v1;

}

- (AFAnalytics)initWithInstanceContext:(id)a3
{
  AFAnalytics *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  dispatch_group_t v8;
  OS_dispatch_group *group;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AFAnalytics;
  v3 = -[AFAnalytics init](&v11, sel_init, a3);
  if (v3)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = dispatch_queue_create("com.apple.assistant.analytics.client", v5);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

    v8 = dispatch_group_create();
    group = v3->_group;
    v3->_group = (OS_dispatch_group *)v8;

  }
  return v3;
}

- (AFAnalytics)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFAnalytics.m"), 41, CFSTR("%s is marked as NS_UNAVAILABLE. Use the designated initializer instead."), "-[AFAnalytics init]");

  return 0;
}

- (void)logEventWithType:(int64_t)a3 machAbsoluteTime:(unint64_t)a4 context:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (a4)
  {
    -[AFAnalytics logEventWithType:machAbsoluteTime:context:contextNoCopy:](self, "logEventWithType:machAbsoluteTime:context:contextNoCopy:", a3, a4, v8, 0);
  }
  else
  {
    v9 = (void *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      AFAnalyticsEventTypeGetName(a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315650;
      v13 = "-[AFAnalytics logEventWithType:machAbsoluteTime:context:]";
      v14 = 2112;
      v15 = v11;
      v16 = 2112;
      v17 = v8;
      _os_log_error_impl(&dword_19AF50000, v10, OS_LOG_TYPE_ERROR, "%s Not logging event %@ because it has no associated time. Context: %@", (uint8_t *)&v12, 0x20u);

    }
  }

}

- (void)logEventWithType:(int64_t)a3 context:(id)a4
{
  uint64_t v6;
  id v7;

  v7 = a4;
  v6 = mach_absolute_time();
  kdebug_trace();
  -[AFAnalytics logEventWithType:machAbsoluteTime:context:contextNoCopy:](self, "logEventWithType:machAbsoluteTime:context:contextNoCopy:", a3, v6, v7, 0);

}

- (void)logEventWithType:(int64_t)a3 context:(id)a4 contextNoCopy:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v8;
  id v9;

  v5 = a5;
  v9 = a4;
  v8 = mach_absolute_time();
  kdebug_trace();
  -[AFAnalytics logEventWithType:machAbsoluteTime:context:contextNoCopy:](self, "logEventWithType:machAbsoluteTime:context:contextNoCopy:", a3, v8, v9, v5);

}

- (void)logEventWithType:(int64_t)a3 contextProvider:(id)a4
{
  uint64_t v6;
  id v7;

  v7 = a4;
  v6 = mach_absolute_time();
  kdebug_trace();
  -[AFAnalytics logEventWithType:machAbsoluteTime:contextProvider:contextProvidingQueue:](self, "logEventWithType:machAbsoluteTime:contextProvider:contextProvidingQueue:", a3, v6, v7, 0);

}

- (void)logEventWithType:(int64_t)a3 contextProvider:(id)a4 contextProvidingQueue:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;

  v8 = a5;
  v10 = a4;
  v9 = mach_absolute_time();
  kdebug_trace();
  -[AFAnalytics logEventWithType:machAbsoluteTime:contextProvider:contextProvidingQueue:](self, "logEventWithType:machAbsoluteTime:contextProvider:contextProvidingQueue:", a3, v9, v10, v8);

}

- (void)logEventWithType:(int64_t)a3 contextResolver:(id)a4
{
  uint64_t v6;
  id v7;

  v7 = a4;
  v6 = mach_absolute_time();
  kdebug_trace();
  -[AFAnalytics logEventWithType:machAbsoluteTime:contextResolver:](self, "logEventWithType:machAbsoluteTime:contextResolver:", a3, v6, v7);

}

- (void)logInstrumentation:(id)a3 turnContext:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[AFAnalytics logInstrumentation:machAbsoluteTime:turnContext:](self, "logInstrumentation:machAbsoluteTime:turnContext:", v7, mach_absolute_time(), v6);

}

- (void)logInstrumentation:(id)a3 machAbsoluteTime:(unint64_t)a4 turnIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  SISchemaClientTurnContext *v11;

  v8 = a5;
  v9 = a3;
  v11 = objc_alloc_init(SISchemaClientTurnContext);
  AFTurnIdentifierGetBytes(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SISchemaClientTurnContext setTurnID:](v11, "setTurnID:", v10);
  -[AFAnalytics logInstrumentation:machAbsoluteTime:turnContext:](self, "logInstrumentation:machAbsoluteTime:turnContext:", v9, a4, v11);

}

- (void)logInstrumentation:(id)a3 machAbsoluteTime:(unint64_t)a4 turnContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  NSObject *queue;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  AFAnalytics *v27;
  unint64_t v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isDictationHIPAACompliant");

  if (v11)
  {
    v12 = AFSiriLogContextAnalytics;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v30 = "-[AFAnalytics logInstrumentation:machAbsoluteTime:turnContext:]";
      v31 = 2112;
      v32 = v8;
      v33 = 2112;
      v34 = v9;
      _os_log_impl(&dword_19AF50000, v12, OS_LOG_TYPE_INFO, "%s Not logging instrumentation event %@ because we have HIPAA On-Device Dictation enabled: %@", buf, 0x20u);
    }
    goto LABEL_16;
  }
  if (!v8)
  {
    v15 = AFSiriLogContextAnalytics;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_DWORD *)buf = 136315138;
    v30 = "-[AFAnalytics logInstrumentation:machAbsoluteTime:turnContext:]";
    v16 = "%s Attempted to log nil instrumentation event.";
    v17 = v15;
    v18 = 12;
LABEL_12:
    _os_log_error_impl(&dword_19AF50000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    goto LABEL_16;
  }
  if (!a4)
  {
    v19 = AFSiriLogContextAnalytics;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_DWORD *)buf = 136315650;
    v30 = "-[AFAnalytics logInstrumentation:machAbsoluteTime:turnContext:]";
    v31 = 2112;
    v32 = v8;
    v33 = 2112;
    v34 = v9;
    v16 = "%s Not logging instrumentation event %@ because it has no associated time. Turn context: %@";
    v17 = v19;
    v18 = 32;
    goto LABEL_12;
  }
  objc_opt_class();
  SIReflectionInferEventTypeFromClass();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    queue = self->_queue;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __63__AFAnalytics_logInstrumentation_machAbsoluteTime_turnContext___block_invoke;
    v24[3] = &unk_1E3A32C20;
    v25 = v9;
    v26 = v8;
    v27 = self;
    v28 = a4;
    dispatch_async(queue, v24);

  }
  else
  {
    v20 = (void *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      v21 = v20;
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v30 = "-[AFAnalytics logInstrumentation:machAbsoluteTime:turnContext:]";
      v31 = 2112;
      v32 = v23;
      v33 = 2112;
      v34 = v8;
      _os_log_error_impl(&dword_19AF50000, v21, OS_LOG_TYPE_ERROR, "%s Not logging instrumentation type %@ because it is of an unknown type. Context: %@", buf, 0x20u);

    }
  }

LABEL_16:
}

- (void)beginEventsGrouping
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__AFAnalytics_beginEventsGrouping__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)endEventsGrouping
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__AFAnalytics_endEventsGrouping__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)logInstrumentationOfType:(Class)a3 turnIdentifier:(id)a4
{
  id v6;

  v6 = a4;
  -[AFAnalytics logInstrumentationOfType:machAbsoluteTime:turnIdentifier:](self, "logInstrumentationOfType:machAbsoluteTime:turnIdentifier:", a3, mach_absolute_time(), v6);

}

- (void)logInstrumentationOfType:(Class)a3 machAbsoluteTime:(unint64_t)a4 turnIdentifier:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  Class v13;
  unint64_t v14;

  v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__AFAnalytics_logInstrumentationOfType_machAbsoluteTime_turnIdentifier___block_invoke;
  v11[3] = &unk_1E3A32C48;
  v13 = a3;
  v14 = a4;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)boostQueuedEvents:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[AFAnalytics boostQueuedEvents:]";
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__AFAnalytics_boostQueuedEvents___block_invoke;
  v8[3] = &unk_1E3A36FA0;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_DEFAULT, 0, v8);
  dispatch_async((dispatch_queue_t)self->_queue, v7);

}

- (void)setService:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __26__AFAnalytics_setService___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)logEventWithType:(int64_t)a3 machAbsoluteTime:(unint64_t)a4 context:(id)a5 contextNoCopy:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  id v12;
  NSObject *queue;
  id v14;
  _QWORD v15[4];
  id v16;
  AFAnalytics *v17;
  int64_t v18;
  unint64_t v19;

  v6 = a6;
  v10 = a5;
  v11 = v10;
  if (v6)
    v12 = v10;
  else
    v12 = (id)objc_msgSend(v10, "copy");
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__AFAnalytics_logEventWithType_machAbsoluteTime_context_contextNoCopy___block_invoke;
  v15[3] = &unk_1E3A35150;
  v18 = a3;
  v19 = a4;
  v16 = v12;
  v17 = self;
  v14 = v12;
  dispatch_async(queue, v15);

}

- (void)logEventWithType:(int64_t)a3 machAbsoluteTime:(unint64_t)a4 contextProvider:(id)a5 contextProvidingQueue:(id)a6
{
  id v10;
  NSObject *v11;
  id *v12;
  _QWORD *v13;
  NSObject *v14;
  OS_dispatch_queue *queue;
  _QWORD v16[5];
  _QWORD v17[3];
  _QWORD v18[5];
  _QWORD v19[3];

  v10 = a5;
  v11 = a6;
  if (v11)
  {
    dispatch_group_enter((dispatch_group_t)self->_group);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __87__AFAnalytics_logEventWithType_machAbsoluteTime_contextProvider_contextProvidingQueue___block_invoke;
    v18[3] = &unk_1E3A32C70;
    v19[1] = a3;
    v19[2] = a4;
    v12 = (id *)v19;
    v18[4] = self;
    v19[0] = v10;
    v13 = v18;
    v14 = v11;
  }
  else
  {
    queue = self->_queue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __87__AFAnalytics_logEventWithType_machAbsoluteTime_contextProvider_contextProvidingQueue___block_invoke_3;
    v16[3] = &unk_1E3A32C70;
    v17[1] = a3;
    v17[2] = a4;
    v12 = (id *)v17;
    v16[4] = self;
    v17[0] = v10;
    v13 = v16;
    v14 = queue;
  }
  dispatch_async(v14, v13);

}

- (void)logEventWithType:(int64_t)a3 machAbsoluteTime:(unint64_t)a4 contextResolver:(id)a5
{
  NSObject *queue;
  _QWORD v6[7];
  _QWORD v7[7];

  if (a5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__AFAnalytics_logEventWithType_machAbsoluteTime_contextResolver___block_invoke;
    v7[3] = &unk_1E3A32C98;
    v7[4] = self;
    v7[5] = a3;
    v7[6] = a4;
    (*((void (**)(id, _QWORD *))a5 + 2))(a5, v7);
  }
  else
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__AFAnalytics_logEventWithType_machAbsoluteTime_contextResolver___block_invoke_3;
    v6[3] = &unk_1E3A32CC0;
    v6[5] = a3;
    v6[6] = a4;
    v6[4] = self;
    dispatch_async(queue, v6);
  }
}

- (void)logEvent:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __24__AFAnalytics_logEvent___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)logEvents:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __25__AFAnalytics_logEvents___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)barrier:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  NSObject *v7;
  OS_dispatch_queue **p_queue;
  _QWORD block[4];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    p_queue = &self->_queue;
    queue = self->_queue;
    v7 = p_queue[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __23__AFAnalytics_barrier___block_invoke;
    block[3] = &unk_1E3A36BB8;
    v10 = v4;
    dispatch_group_notify(v7, queue, block);

  }
}

- (void)_stageEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = a3;
    -[AFAnalytics _service:](self, "_service:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "stageEvents:completion:", v6, 0);
  }
}

- (void)_stageEvents:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    -[AFAnalytics _service:](self, "_service:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stageEvents:completion:", v5, 0);

  }
}

- (id)_service:(BOOL)a3
{
  AFAnalyticsService *service;
  AFAnalyticsService **p_service;
  BOOL v5;

  p_service = &self->_service;
  service = self->_service;
  if (service)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    if (_AFAnalyticsServiceGetRemoteXPC_onceToken != -1)
      dispatch_once(&_AFAnalyticsServiceGetRemoteXPC_onceToken, &__block_literal_global_68_26716);
    objc_storeStrong((id *)p_service, (id)_AFAnalyticsServiceGetRemoteXPC_remoteXPCService);
    service = *p_service;
  }
  return service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __23__AFAnalytics_barrier___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __25__AFAnalytics_logEvents___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stageEvents:", *(_QWORD *)(a1 + 40));
}

uint64_t __24__AFAnalytics_logEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stageEvent:", *(_QWORD *)(a1 + 40));
}

void __65__AFAnalytics_logEventWithType_machAbsoluteTime_contextResolver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  __int128 v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__AFAnalytics_logEventWithType_machAbsoluteTime_contextResolver___block_invoke_2;
  v7[3] = &unk_1E3A35150;
  v10 = *(_OWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __65__AFAnalytics_logEventWithType_machAbsoluteTime_contextResolver___block_invoke_3(uint64_t a1)
{
  id v2;

  _AFAnalyticsEventCreate(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_stageEvent:", v2);

}

void __65__AFAnalytics_logEventWithType_machAbsoluteTime_contextResolver___block_invoke_2(uint64_t a1)
{
  id v2;

  _AFAnalyticsEventCreate(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(void **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_stageEvent:", v2);

}

void __87__AFAnalytics_logEventWithType_machAbsoluteTime_contextProvider_contextProvidingQueue___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  __int128 v9;

  _AFAnalyticsEventGetContextGuarded(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(void **)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 8);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __87__AFAnalytics_logEventWithType_machAbsoluteTime_contextProvider_contextProvidingQueue___block_invoke_2;
  v6[3] = &unk_1E3A35150;
  v9 = *(_OWORD *)(a1 + 48);
  v7 = v2;
  v8 = v3;
  v5 = v2;
  dispatch_async(v4, v6);

}

void __87__AFAnalytics_logEventWithType_machAbsoluteTime_contextProvider_contextProvidingQueue___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  _AFAnalyticsEventGetContextGuarded(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(void **)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  _AFAnalyticsEventCreate(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_stageEvent:", v2);

}

void __87__AFAnalytics_logEventWithType_machAbsoluteTime_contextProvider_contextProvidingQueue___block_invoke_2(uint64_t a1)
{
  id v2;

  _AFAnalyticsEventCreate(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(void **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_stageEvent:", v2);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 16));

}

void __71__AFAnalytics_logEventWithType_machAbsoluteTime_context_contextNoCopy___block_invoke(uint64_t a1)
{
  id v2;

  _AFAnalyticsEventCreate(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(void **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_stageEvent:", v2);

}

void __26__AFAnalytics_setService___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

uint64_t __33__AFAnalytics_boostQueuedEvents___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextAnalytics;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = 136315394;
    v6 = "-[AFAnalytics boostQueuedEvents:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s Completed boosting event producer queue %@", (uint8_t *)&v5, 0x16u);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __72__AFAnalytics_logInstrumentationOfType_machAbsoluteTime_turnIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_service:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logInstrumentationOfType:machAbsoluteTime:turnIdentifier:", v3, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

void __32__AFAnalytics_endEventsGrouping__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_service:", 1);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endEventsGrouping");

}

void __34__AFAnalytics_beginEventsGrouping__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_service:", 1);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "beginEventsGrouping");

}

void __63__AFAnalytics_logInstrumentation_machAbsoluteTime_turnContext___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = objc_alloc_init(MEMORY[0x1E0D9A400]);
  objc_msgSend(*(id *)(a1 + 32), "turnID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0D9A408]);
  objc_msgSend(v7, "setEventMetadata:", v3);

  objc_msgSend(v7, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTurnID:", v2);

  objc_msgSend(v7, "setEventType:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "_service:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stageUEIEventData:timestamp:completion:", v6, *(_QWORD *)(a1 + 56), 0);

}

- (void)logClientFeedbackPresented:(id)a3
{
  -[AFAnalytics logClientFeedbackPresented:dialogIdentifierProvider:](self, "logClientFeedbackPresented:dialogIdentifierProvider:", a3, 0);
}

- (void)logClientFeedbackPresented:(id)a3 dialogIdentifierProvider:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  AFAnalytics *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE421BC0))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __92__AFAnalytics_ClientFeedbackPresented__logClientFeedbackPresented_dialogIdentifierProvider___block_invoke;
    v8[3] = &unk_1E3A33B50;
    v9 = v7;
    v10 = self;
    objc_msgSend(v6, "_af_enumerateClientFeedbackDetails:", v8);

  }
}

void __92__AFAnalytics_ClientFeedbackPresented__logClientFeedbackPresented_dialogIdentifierProvider___block_invoke(uint64_t a1, id *a2)
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = v4;
  if (*a2)
    objc_msgSend(v4, "setObject:forKey:", *a2, CFSTR("aceId"));
  v6 = a2[1];
  if (v6)
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("class"));
  v7 = a2[2];
  if (v7)
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("dialogPhase"));
  v8 = a2[3];
  if (v8)
  {
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("dialogIdentifier"));
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    if (v10 && *a2)
    {
      objc_msgSend(v10, "associatedDialogIdentifiersForAceObjectIdentifier:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("dialogIdentifier"));

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)a2 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("listenAfterSpeaking"));

  objc_msgSend(*(id *)(a1 + 40), "logEventWithType:context:", 1924, v5);
  __destructor_8_s0_s8_s16_s24(a2);
}

- (id)newTurnBasedInstrumentationContext
{
  return +[AFAnalyticsTurnBasedInstrumentationContext newTurnBasedContextWithPreviousTurnID:analytics:](AFAnalyticsTurnBasedInstrumentationContext, "newTurnBasedContextWithPreviousTurnID:analytics:", 0, self);
}

@end
