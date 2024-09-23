@implementation AWScheduler

void __58__AWScheduler_shouldActivateAttentionDetectionForSampling__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "isStreamingClient") & 1) == 0
    && objc_msgSend(v3, "activateAttentionDetection")
    && (objc_msgSend(v3, "invalid") & 1) == 0)
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }

}

void __52__AWScheduler_shouldActivateMotionDetectForSampling__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "isStreamingClient") & 1) == 0
    && objc_msgSend(v3, "activateMotionDetect")
    && (objc_msgSend(v3, "invalid") & 1) == 0)
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }

}

- (BOOL)allowHIDEvents
{
  return self->_allowHIDEvents;
}

- (void)processHIDEvent:(__IOHIDEvent *)a3 mask:(unint64_t)a4 timestamp:(unint64_t)a5 senderID:(unint64_t)a6 displayUUID:(id)a7
{
  id v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v12 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = self->_clients;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17++), "notifyHIDEvent:mask:timestamp:senderID:displayUUID:", a3, a4, a5, a6, v12, (_QWORD)v18);
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

  -[AWScheduler armEvents](self, "armEvents");
}

- (void)armEvents
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t j;
  unint64_t v17;
  unint64_t v18;
  NSObject *v20;
  unint64_t v21;
  double v22;
  NSObject *v23;
  unint64_t v24;
  double v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  unint64_t v29;
  int64_t v30;
  NSObject *timer;
  dispatch_time_t v32;
  unint64_t v33;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  double v44;
  __int16 v45;
  AWScheduler *v46;
  __int16 v47;
  double v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = absTimeNS();
  v4 = -[AWScheduler shouldActivateAttentionDetectionForSampling](self, "shouldActivateAttentionDetectionForSampling");
  if (v4)
  {
    v5 = 0;
  }
  else if (-[AWScheduler shouldActivateMotionDetectForSampling](self, "shouldActivateMotionDetectForSampling"))
  {
    v5 = 256;
  }
  else
  {
    v5 = 0;
  }
  -[AWAttentionSampler startDeadlineComputation](self->_attentionSampler, "startDeadlineComputation");
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v6 = self->_clients;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "updateDeadlinesForTime:", v3);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    }
    while (v8);
  }

  -[AWAttentionSampler finishDeadlineComputationWithOptions:](self->_attentionSampler, "finishDeadlineComputationWithOptions:", v5 | v4);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v11 = self->_clients;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
  if (!v12)
  {

LABEL_31:
    if (currentLogLevel < 7)
      return;
    _AALog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_52;
    v24 = absTimeNS();
    if (v24 == -1)
      v25 = INFINITY;
    else
      v25 = (double)v24 / 1000000000.0;
    *(_DWORD *)buf = 134218242;
    v44 = v25;
    v45 = 2112;
    v46 = self;
    v26 = "%13.5f: %@ no timer to schedule, waiting for next event";
    v27 = v23;
    v28 = 22;
    goto LABEL_51;
  }
  v13 = v12;
  v14 = *(_QWORD *)v36;
  v15 = -1;
  do
  {
    for (j = 0; j != v13; ++j)
    {
      if (*(_QWORD *)v36 != v14)
        objc_enumerationMutation(v11);
      v17 = objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "nextTimerForTime:", v3, (_QWORD)v35);
      if (v17 < v15)
        v15 = v17;
    }
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
  }
  while (v13);

  if (v15 == -1)
    goto LABEL_31;
  v18 = absTimeNS();
  if (v15 < v18 && currentLogLevel >= 7)
  {
    _AALog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = absTimeNS();
      if (v21 == -1)
        v22 = INFINITY;
      else
        v22 = (double)v21 / 1000000000.0;
      *(_DWORD *)buf = 134218498;
      v44 = v22;
      v45 = 2112;
      v46 = self;
      v47 = 2048;
      v48 = (double)v15 / 1000000000.0;
      _os_log_impl(&dword_1AF589000, v20, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ next deadline %13.5f IN THE PAST!", buf, 0x20u);
    }

  }
  v29 = v15 - v18;
  if (v15 < v18)
    v29 = 0;
  if (v29 >= 0x7FFFFFFFFFFFFFFFLL)
    v30 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v30 = v29;
  timer = self->_timer;
  v32 = dispatch_time(0, v30);
  dispatch_source_set_timer(timer, v32, 0xFFFFFFFFFFFFFFFFLL, 0);
  if (currentLogLevel >= 7)
  {
    _AALog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
LABEL_52:

      return;
    }
    v33 = absTimeNS();
    if (v33 == -1)
      v34 = INFINITY;
    else
      v34 = (double)v33 / 1000000000.0;
    *(_DWORD *)buf = 134218498;
    v44 = v34;
    v45 = 2112;
    v46 = self;
    v47 = 2048;
    v48 = (double)v15 / 1000000000.0;
    v26 = "%13.5f: %@ scheduled timer for %13.5f";
    v27 = v23;
    v28 = 32;
LABEL_51:
    _os_log_impl(&dword_1AF589000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
    goto LABEL_52;
  }
}

- (AWAttentionSampler)attentionSampler
{
  return self->_attentionSampler;
}

- (BOOL)shouldActivateMotionDetectForSampling
{
  NSMutableArray *clients;
  NSObject *v3;
  unint64_t v4;
  double v5;
  int v6;
  BOOL v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint8_t buf[4];
  double v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  clients = self->_clients;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__AWScheduler_shouldActivateMotionDetectForSampling__block_invoke;
  v9[3] = &unk_1E5F8DCF8;
  v9[4] = &v10;
  -[NSMutableArray enumerateObjectsUsingBlock:](clients, "enumerateObjectsUsingBlock:", v9);
  if (currentLogLevel >= 7)
  {
    _AALog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = absTimeNS();
      if (v4 == -1)
        v5 = INFINITY;
      else
        v5 = (double)v4 / 1000000000.0;
      v6 = *((_DWORD *)v11 + 6);
      *(_DWORD *)buf = 134218240;
      v15 = v5;
      v16 = 1024;
      v17 = v6;
      _os_log_impl(&dword_1AF589000, v3, OS_LOG_TYPE_DEFAULT, "%13.5f: %d active motion detect clients", buf, 0x12u);
    }

  }
  v7 = *((_DWORD *)v11 + 6) > 0;
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (BOOL)shouldActivateAttentionDetectionForSampling
{
  NSMutableArray *clients;
  NSObject *v3;
  unint64_t v4;
  double v5;
  int v6;
  BOOL v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint8_t buf[4];
  double v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  clients = self->_clients;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__AWScheduler_shouldActivateAttentionDetectionForSampling__block_invoke;
  v9[3] = &unk_1E5F8DCF8;
  v9[4] = &v10;
  -[NSMutableArray enumerateObjectsUsingBlock:](clients, "enumerateObjectsUsingBlock:", v9);
  if (currentLogLevel >= 7)
  {
    _AALog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = absTimeNS();
      if (v4 == -1)
        v5 = INFINITY;
      else
        v5 = (double)v4 / 1000000000.0;
      v6 = *((_DWORD *)v11 + 6);
      *(_DWORD *)buf = 134218240;
      v15 = v5;
      v16 = 1024;
      v17 = v6;
      _os_log_impl(&dword_1AF589000, v3, OS_LOG_TYPE_DEFAULT, "%13.5f: %d active AttentionDetect clients", buf, 0x12u);
    }

  }
  v7 = *((_DWORD *)v11 + 6) > 0;
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __31__AWScheduler_initWithOptions___block_invoke(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  double v4;
  uint64_t v5;
  int v7;
  double v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (currentLogLevel >= 7)
  {
    _AALog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = absTimeNS();
      if (v3 == -1)
        v4 = INFINITY;
      else
        v4 = (double)v3 / 1000000000.0;
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 134218242;
      v8 = v4;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1AF589000, v2, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ timer fired", (uint8_t *)&v7, 0x16u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "armEvents");
}

- (AWScheduler)initWithOptions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  BOOL v9;
  void *v10;
  BOOL v11;
  void *v12;
  BOOL v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  dispatch_source_t v24;
  void *v25;
  NSObject *v26;
  unsigned __int8 *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  int v35;
  _BOOL4 v36;
  NSObject *v37;
  int BoolAnswer;
  NSObject *v39;
  unint64_t v40;
  double v41;
  NSObject *v42;
  unint64_t v43;
  double v44;
  const char *v45;
  uint64_t v46;
  _BOOL8 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  AWAttentionSampler *v52;
  void *v53;
  AWAttentionStreamer *v54;
  AWAttentionStreamer **v55;
  void *v56;
  AWAttentionStreamer *v57;
  AWScheduler *v58;
  unint64_t v60;
  double v61;
  int *v62;
  char *v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  id location;
  _QWORD handler[4];
  id v72;
  objc_super v73;
  size_t v74;
  int v75;
  _QWORD v76[3];
  _QWORD v77[3];
  uint8_t buf[4];
  double v79;
  __int16 v80;
  _BYTE v81[10];
  uint64_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)AWScheduler;
  v5 = -[AWScheduler init](&v73, sel_init);
  if (!v5)
    goto LABEL_40;
  if (!v4)
    goto LABEL_46;
  objc_msgSend(v4, "valueForKey:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  if (v7)
    goto LABEL_46;
  objc_msgSend(v4, "valueForKey:", CFSTR("allowFaceDetect"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (v9)
    goto LABEL_46;
  objc_msgSend(v4, "valueForKey:", CFSTR("allowHIDEvents"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  if (v11)
    goto LABEL_46;
  objc_msgSend(v4, "valueForKey:", CFSTR("allowMotionDetect"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 == 0;

  if (v13
    || (objc_msgSend(v4, "valueForKey:", CFSTR("initForUnitTest")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = v14 == 0,
        v14,
        v15))
  {
LABEL_46:
    v58 = 0;
    goto LABEL_41;
  }
  objc_msgSend(v4, "valueForKey:", CFSTR("identifier"));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)*((_QWORD *)v5 + 11);
  *((_QWORD *)v5 + 11) = v16;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allowFaceDetect"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)v5 + 73) = objc_msgSend(v18, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allowHIDEvents"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)v5 + 74) = objc_msgSend(v19, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allowMotionDetect"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)v5 + 75) = objc_msgSend(v20, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("initForUnitTest"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)v5 + 76) = objc_msgSend(v21, "BOOLValue");

  awQueue(1);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)*((_QWORD *)v5 + 1);
  *((_QWORD *)v5 + 1) = v22;

  v24 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v5 + 1));
  v25 = (void *)*((_QWORD *)v5 + 2);
  *((_QWORD *)v5 + 2) = v24;

  v26 = *((_QWORD *)v5 + 2);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __31__AWScheduler_initWithOptions___block_invoke;
  handler[3] = &unk_1E5F8EC18;
  v27 = (unsigned __int8 *)v5;
  v72 = v27;
  dispatch_source_set_event_handler(v26, handler);
  dispatch_resume(*((dispatch_object_t *)v5 + 2));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)*((_QWORD *)v27 + 3);
  *((_QWORD *)v27 + 3) = v28;

  v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v31 = (void *)*((_QWORD *)v27 + 4);
  *((_QWORD *)v27 + 4) = v30;

  v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v33 = (void *)*((_QWORD *)v27 + 5);
  *((_QWORD *)v27 + 5) = v32;

  mach_timebase_info((mach_timebase_info_t)v27 + 8);
  objc_initWeak(&location, v27);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.AttentionAwareness"));
  v35 = objc_msgSend(v34, "BOOLForKey:", CFSTR("useBioKit"));
  v75 = 255;
  v74 = 4;
  if (sysctlbyname("kern.exclaves_status", &v75, &v74, 0, 0) == -1)
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v60 = absTimeNS();
        if (v60 == -1)
          v61 = INFINITY;
        else
          v61 = (double)v60 / 1000000000.0;
        v62 = __error();
        v63 = strerror(*v62);
        *(_DWORD *)buf = 134218242;
        v79 = v61;
        v80 = 2080;
        *(_QWORD *)v81 = v63;
        _os_log_error_impl(&dword_1AF589000, v37, OS_LOG_TYPE_ERROR, "%13.5f: sysctlbyname(kern.exclaves_status): %s", buf, 0x16u);
      }

    }
    v36 = 0;
  }
  else
  {
    v36 = v75 != 255;
  }
  BoolAnswer = AVGestaltGetBoolAnswer();
  if (currentLogLevel >= 6)
  {
    _AALog();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = absTimeNS();
      if (v40 == -1)
        v41 = INFINITY;
      else
        v41 = (double)v40 / 1000000000.0;
      *(_DWORD *)buf = 134218752;
      v79 = v41;
      v80 = 1024;
      *(_DWORD *)v81 = v35;
      *(_WORD *)&v81[4] = 1024;
      *(_DWORD *)&v81[6] = v36;
      LOWORD(v82) = 1024;
      *(_DWORD *)((char *)&v82 + 2) = BoolAnswer;
      _os_log_impl(&dword_1AF589000, v39, OS_LOG_TYPE_DEFAULT, "%13.5f: useBioKit: %d, exclavesAvailable: %d areFeatureFlagsON: %d", buf, 0x1Eu);
    }

  }
  v27[72] = !v35 && (v36 & BoolAnswer) == 1;
  if (currentLogLevel >= 6)
  {
    _AALog();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = absTimeNS();
      if (v43 == -1)
        v44 = INFINITY;
      else
        v44 = (double)v43 / 1000000000.0;
      v45 = "AVFoundation";
      v46 = *((_QWORD *)v5 + 11);
      if (!v27[72])
        v45 = "BiometricKit";
      *(_DWORD *)buf = 134218498;
      v79 = v44;
      v80 = 2080;
      *(_QWORD *)v81 = v45;
      *(_WORD *)&v81[8] = 2112;
      v82 = v46;
      _os_log_impl(&dword_1AF589000, v42, OS_LOG_TYPE_DEFAULT, "%13.5f: Using %s for Pearl operations for %@", buf, 0x20u);
    }

  }
  if (*((_BYTE *)v5 + 76))
  {
    v47 = 1;
LABEL_38:
    v76[0] = CFSTR("unitTest");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v48;
    v76[1] = CFSTR("useAVFoundation");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v27[72]);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v77[1] = v49;
    v76[2] = CFSTR("eventMask");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 128);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v77[2] = v50;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 3);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = -[AWAttentionSampler initWithOptions:]([AWAttentionSampler alloc], "initWithOptions:", v51);
    v53 = (void *)*((_QWORD *)v27 + 6);
    *((_QWORD *)v27 + 6) = v52;

    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __31__AWScheduler_initWithOptions___block_invoke_38;
    v68[3] = &unk_1E5F8DBE0;
    objc_copyWeak(&v69, &location);
    objc_msgSend(*((id *)v27 + 6), "setStateChangedCallback:", v68);
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __31__AWScheduler_initWithOptions___block_invoke_40;
    v66[3] = &unk_1E5F8DC08;
    objc_copyWeak(&v67, &location);
    objc_msgSend(*((id *)v27 + 6), "setOperationEndableCallback:", v66);
    v54 = -[AWAttentionStreamer initWithOptions:]([AWAttentionStreamer alloc], "initWithOptions:", v51);
    v56 = (void *)*((_QWORD *)v27 + 7);
    v55 = (AWAttentionStreamer **)(v27 + 56);
    *v55 = v54;

    v57 = *v55;
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __31__AWScheduler_initWithOptions___block_invoke_2;
    v64[3] = &unk_1E5F8DC30;
    objc_copyWeak(&v65, &location);
    -[AWAttentionStreamer setNotificationHandler:withMask:](v57, "setNotificationHandler:withMask:", v64, 128);
    objc_destroyWeak(&v65);
    objc_destroyWeak(&v67);
    objc_destroyWeak(&v69);

    goto LABEL_39;
  }
  if (MGGetBoolAnswer())
  {
    v47 = *((_BYTE *)v5 + 76) != 0;
    goto LABEL_38;
  }
LABEL_39:

  objc_destroyWeak(&location);
LABEL_40:
  v58 = (AWScheduler *)v5;
LABEL_41:

  return v58;
}

- (BOOL)canActiveOperationBeEnded
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_clients;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    v7 = 1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v7 &= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "canOperationBeEndedForClient", (_QWORD)v10);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> (identifier: %@)"), v5, self, self->_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addClient:(id)a3
{
  AWScheduler *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  unint64_t v8;
  double v9;
  uint64_t v10;
  NSObject *v11;
  unint64_t v12;
  double v13;
  int v14;
  double v15;
  __int16 v16;
  AWScheduler *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (AWScheduler *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v4)
    __assert_rtn("-[AWScheduler addClient:]", "Scheduler.m", 249, "client");
  v5 = -[NSMutableArray count](self->_clients, "count");
  -[NSMutableArray addObject:](self->_clients, "addObject:", v4);
  -[AWScheduler observer](self, "observer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientCountChangedFrom:to:forScheduler:", v5, -[NSMutableArray count](self->_clients, "count"), self);

  if (currentLogLevel >= 6)
  {
    _AALog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = absTimeNS();
      if (v8 == -1)
        v9 = INFINITY;
      else
        v9 = (double)v8 / 1000000000.0;
      v10 = -[NSMutableArray count](self->_clients, "count");
      v14 = 134218498;
      v15 = v9;
      v16 = 2112;
      v17 = self;
      v18 = 2048;
      v19 = v10;
      _os_log_impl(&dword_1AF589000, v7, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ %lu clients", (uint8_t *)&v14, 0x20u);
    }

    if (currentLogLevel >= 6)
    {
      _AALog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = absTimeNS();
        if (v12 == -1)
          v13 = INFINITY;
        else
          v13 = (double)v12 / 1000000000.0;
        v14 = 134218242;
        v15 = v13;
        v16 = 2112;
        v17 = v4;
        _os_log_impl(&dword_1AF589000, v11, OS_LOG_TYPE_DEFAULT, "%13.5f: New client: %@", (uint8_t *)&v14, 0x16u);
      }

    }
  }
  -[AWScheduler armEvents](self, "armEvents");

}

- (void)removeInvalidClientsWithConnection:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  unint64_t v13;
  double v14;
  void *v15;
  void *v16;
  __int128 v17;
  uint8_t buf[4];
  double v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = -[NSMutableArray count](self->_clients, "count");
  if (v5)
  {
    v7 = v5;
    v8 = 0;
    *(_QWORD *)&v6 = 134218242;
    v17 = v6;
    v9 = v5;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_clients, "objectAtIndex:", v8, v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "invalid") & 1) != 0
        || (objc_msgSend(v10, "connection"), v11 = (id)objc_claimAutoreleasedReturnValue(), v11, v11 == v4))
      {
        if (currentLogLevel >= 6)
        {
          _AALog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = absTimeNS();
            if (v13 == -1)
              v14 = INFINITY;
            else
              v14 = (double)v13 / 1000000000.0;
            *(_DWORD *)buf = v17;
            v19 = v14;
            v20 = 2112;
            v21 = v10;
            _os_log_impl(&dword_1AF589000, v12, OS_LOG_TYPE_DEFAULT, "%13.5f: Removing client: %@", buf, 0x16u);
          }

        }
        objc_msgSend(v10, "clientId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[AWScheduler removeStreamingClientwithIdentifier:](self, "removeStreamingClientwithIdentifier:", v15);

        objc_msgSend(v10, "invalidateWithHandler:", 0);
        -[NSMutableArray removeObjectAtIndex:](self->_clients, "removeObjectAtIndex:", v8--);
        --v9;
      }

      ++v8;
    }
    while (v8 < v9);
    if (v7 != v9)
    {
      -[AWScheduler observer](self, "observer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "clientCountChangedFrom:to:forScheduler:", v7, v9, self);

      -[AWScheduler armEvents](self, "armEvents");
    }
  }

}

- (void)removeInvalidClients
{
  -[AWScheduler removeInvalidClientsWithConnection:](self, "removeInvalidClientsWithConnection:", 0);
}

- (void)setSmartCoverClosed:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[AWAttentionSampler setSmartCoverClosed:](self->_attentionSampler, "setSmartCoverClosed:", v3);
  -[AWAttentionStreamer setSmartCoverStateWithMask:smartCoverState:](self->_attentionStreamer, "setSmartCoverStateWithMask:smartCoverState:", 128, v3);
}

- (void)reevaluate
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_clients;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "reevaluateConfig", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (unint64_t)nextSamplingTimeForSamplingInterval:(unint64_t)a3
{
  _BOOL8 v5;

  v5 = -[AWScheduler shouldActivateMotionDetectForSampling](self, "shouldActivateMotionDetectForSampling")
    && !-[AWScheduler shouldActivateAttentionDetectionForSampling](self, "shouldActivateAttentionDetectionForSampling");
  return -[AWAttentionSampler nextSampleTimeForSamplingInterval:ignoreDisplayState:](self->_attentionSampler, "nextSampleTimeForSamplingInterval:ignoreDisplayState:", a3, v5);
}

- (id)resetInterruptedStreamingClientWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  unint64_t v7;
  double v8;
  void *v9;
  int v11;
  double v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_interruptedStreamingClients, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (currentLogLevel >= 6)
    {
      _AALog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = absTimeNS();
        if (v7 == -1)
          v8 = INFINITY;
        else
          v8 = (double)v7 / 1000000000.0;
        objc_msgSend(v5, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 134218242;
        v12 = v8;
        v13 = 2112;
        v14 = v9;
        _os_log_impl(&dword_1AF589000, v6, OS_LOG_TYPE_DEFAULT, "%13.5f: Interrupted streaming client %@ restarting", (uint8_t *)&v11, 0x16u);

      }
    }
    -[NSMutableDictionary removeObjectForKey:](self->_interruptedStreamingClients, "removeObjectForKey:", v4);
    -[NSMutableDictionary setObject:forKey:](self->_streamingClients, "setObject:forKey:", v5, v4);
    objc_msgSend(v5, "setStreamingDuration:", 0.0);
    objc_msgSend(v5, "setStreamingStartTime:", mach_continuous_time());
  }

  return v5;
}

- (id)addStreamingClient:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  unint64_t v16;
  double v17;
  NSObject *v18;
  unint64_t v19;
  double v20;
  uint64_t v21;
  void *v22;
  unint64_t v24;
  double v25;
  int v26;
  double v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    __assert_rtn("-[AWScheduler addStreamingClient:withIdentifier:]", "Scheduler.m", 436, "client");
  v8 = v7;
  -[NSMutableDictionary objectForKey:](self->_streamingClients, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v24 = absTimeNS();
        if (v24 == -1)
          v25 = INFINITY;
        else
          v25 = (double)v24 / 1000000000.0;
        v26 = 134217984;
        v27 = v25;
        _os_log_error_impl(&dword_1AF589000, v10, OS_LOG_TYPE_ERROR, "%13.5f: Client already added to the list of streaming clients, don't add it again", (uint8_t *)&v26, 0xCu);
      }

    }
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2FE0];
    v32 = *MEMORY[0x1E0CB2D50];
    v33[0] = CFSTR(" Client already active");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 37, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (currentLogLevel >= 6)
    {
      _AALog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = absTimeNS();
        if (v16 == -1)
          v17 = INFINITY;
        else
          v17 = (double)v16 / 1000000000.0;
        v26 = 134218242;
        v27 = v17;
        v28 = 2112;
        v29 = (uint64_t)v6;
        _os_log_impl(&dword_1AF589000, v15, OS_LOG_TYPE_DEFAULT, "%13.5f: Creating new streaming client %@", (uint8_t *)&v26, 0x16u);
      }

    }
    -[NSMutableDictionary setObject:forKey:](self->_streamingClients, "setObject:forKey:", v6, v8);
    -[AWScheduler addClient:](self, "addClient:", v6);
    objc_msgSend(v6, "setStreamingDuration:", 0.0);
    objc_msgSend(v6, "setStreamingStartTime:", mach_continuous_time());
    v14 = 0;
  }
  if (currentLogLevel >= 6)
  {
    _AALog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = absTimeNS();
      if (v19 == -1)
        v20 = INFINITY;
      else
        v20 = (double)v19 / 1000000000.0;
      v21 = -[NSMutableDictionary count](self->_streamingClients, "count");
      -[NSMutableDictionary allValues](self->_streamingClients, "allValues");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 134218498;
      v27 = v20;
      v28 = 2048;
      v29 = v21;
      v30 = 2112;
      v31 = v22;
      _os_log_impl(&dword_1AF589000, v18, OS_LOG_TYPE_DEFAULT, "%13.5f: %lu streaming clients: %@", (uint8_t *)&v26, 0x20u);

    }
  }

  return v14;
}

- (void)removeStreamingClientwithIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  unint64_t v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  unint64_t v13;
  double v14;
  void *v15;
  int v16;
  double v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_streamingClients, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (currentLogLevel >= 6)
    {
      _AALog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = absTimeNS();
        if (v7 == -1)
          v8 = INFINITY;
        else
          v8 = (double)v7 / 1000000000.0;
        v16 = 134218242;
        v17 = v8;
        v18 = 2112;
        v19 = v5;
        _os_log_impl(&dword_1AF589000, v6, OS_LOG_TYPE_DEFAULT, "%13.5f: Trying to remove streaming client %@", (uint8_t *)&v16, 0x16u);
      }

    }
    v9 = -[AWScheduler cancelFaceDetectStream:withIdentifier:](self, "cancelFaceDetectStream:withIdentifier:", v5, v4);
    -[NSMutableDictionary objectForKey:](self->_streamingClients, "objectForKey:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      -[NSMutableDictionary removeObjectForKey:](self->_streamingClients, "removeObjectForKey:", v4);
  }
  -[NSMutableDictionary objectForKey:](self->_interruptedStreamingClients, "objectForKey:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (currentLogLevel >= 6)
    {
      _AALog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = absTimeNS();
        if (v13 == -1)
          v14 = INFINITY;
        else
          v14 = (double)v13 / 1000000000.0;
        objc_msgSend(v11, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 134218242;
        v17 = v14;
        v18 = 2112;
        v19 = v15;
        _os_log_impl(&dword_1AF589000, v12, OS_LOG_TYPE_DEFAULT, "%13.5f: Removing client %@ from the list of interrupted clients", (uint8_t *)&v16, 0x16u);

      }
    }
    -[NSMutableDictionary removeObjectForKey:](self->_interruptedStreamingClients, "removeObjectForKey:", v4);
  }

}

- (id)streamFaceDetectEvents
{
  _BOOL4 v3;
  _BOOL4 v4;
  uint64_t v5;

  v3 = -[AWScheduler shouldActivateAttentionDetectForStreaming](self, "shouldActivateAttentionDetectForStreaming");
  v4 = -[AWScheduler shouldActivateEyeReliefForStreaming](self, "shouldActivateEyeReliefForStreaming");
  v5 = 256;
  if (!v3)
    v5 = 0;
  return -[AWScheduler streamFaceDetectEventsWithOptions:](self, "streamFaceDetectEventsWithOptions:", v5 | v4);
}

- (id)streamFaceDetectEventsWithOptions:(id)a3
{
  int v3;
  uint64_t v5;
  void *v6;
  AWAttentionStreamer *attentionStreamer;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v18;
  double v19;
  unint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  AWScheduler *v26;
  id v27;
  _QWORD v28[5];
  _QWORD v29[5];
  uint8_t buf[4];
  double v31;
  __int16 v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[2];

  v3 = *(_DWORD *)&a3.var0;
  v35[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __49__AWScheduler_streamFaceDetectEventsWithOptions___block_invoke;
  v29[3] = &unk_1E5F8DC58;
  v29[4] = self;
  v6 = (void *)MEMORY[0x1B5DF9110](v29);
  if ((MGGetBoolAnswer() & 1) != 0)
  {
    attentionStreamer = self->_attentionStreamer;
    v28[0] = v5;
    v28[1] = 3221225472;
    v28[2] = __49__AWScheduler_streamFaceDetectEventsWithOptions___block_invoke_55;
    v28[3] = &unk_1E5F8DC80;
    v28[4] = self;
    v22 = v5;
    v23 = 3221225472;
    v24 = __49__AWScheduler_streamFaceDetectEventsWithOptions___block_invoke_58;
    v25 = &unk_1E5F8DCA8;
    v26 = self;
    v8 = v6;
    v27 = v8;
    -[AWAttentionStreamer streamEventsWithMask:block:options:operationStartFailedBlock:](attentionStreamer, "streamEventsWithMask:block:options:operationStartFailedBlock:", 128, v28, *(_QWORD *)&v3 & 0xFFFFFFLL, &v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (currentLogLevel >= 3)
      {
        _AALog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v20 = absTimeNS();
          if (v20 == -1)
            v21 = INFINITY;
          else
            v21 = (double)v20 / 1000000000.0;
          *(_DWORD *)buf = 134218242;
          v31 = v21;
          v32 = 2112;
          v33 = v9;
          _os_log_error_impl(&dword_1AF589000, v10, OS_LOG_TYPE_ERROR, "%13.5f: Error %@ when starting streaming operation from AttentionStreamer", buf, 0x16u);
        }

      }
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_streamingClients, "enumerateKeysAndObjectsUsingBlock:", v8, v22, v23, v24, v25, v26);
    }
    v11 = v9;

  }
  else
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v18 = absTimeNS();
        if (v18 == -1)
          v19 = INFINITY;
        else
          v19 = (double)v18 / 1000000000.0;
        *(_DWORD *)buf = 134217984;
        v31 = v19;
        _os_log_error_impl(&dword_1AF589000, v12, OS_LOG_TYPE_ERROR, "%13.5f: Device doesn't support pearl", buf, 0xCu);
      }

    }
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_streamingClients, "enumerateKeysAndObjectsUsingBlock:", v6);
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2FE0];
    v34 = *MEMORY[0x1E0CB2D50];
    v35[0] = CFSTR(" Device doesn't support Pearl");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 19, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v16;
  }

  return v11;
}

- (id)cancelFaceDetectStream:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  double v10;
  NSObject *v11;
  unint64_t v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  unint64_t v19;
  double v20;
  uint64_t v21;
  void *v22;
  __int16 v23;
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  NSObject *v27;
  unint64_t v28;
  double v29;
  id v30;
  uint64_t v31;
  id v32;
  int v34;
  double v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[AWAttentionStreamer isStreamerRunningWithMask:](self->_attentionStreamer, "isStreamerRunningWithMask:", 128))
  {
    if ((unint64_t)-[NSMutableDictionary count](self->_streamingClients, "count") > 1)
      goto LABEL_19;
    if (currentLogLevel >= 6)
    {
      _AALog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = absTimeNS();
        if (v9 == -1)
          v10 = INFINITY;
        else
          v10 = (double)v9 / 1000000000.0;
        v34 = 134217984;
        v35 = v10;
        _os_log_impl(&dword_1AF589000, v8, OS_LOG_TYPE_DEFAULT, "%13.5f: Stopping the streamer as there are no active streaming clients", (uint8_t *)&v34, 0xCu);
      }

    }
    -[AWAttentionStreamer cancelEventStreamWithMask:](self->_attentionStreamer, "cancelEventStreamWithMask:", 128);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
LABEL_19:
      -[AWScheduler calculateTimeDelta:endTime:timebase:](self, "calculateTimeDelta:endTime:timebase:", objc_msgSend(v6, "streamingStartTime"), mach_continuous_time(), *(_QWORD *)&self->_timebase);
      objc_msgSend(v6, "setStreamingDuration:");
      -[AWScheduler setClientAsInterrupted:forKey:](self, "setClientAsInterrupted:forKey:", v6, v7);
      if (currentLogLevel >= 6)
      {
        _AALog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = absTimeNS();
          if (v19 == -1)
            v20 = INFINITY;
          else
            v20 = (double)v19 / 1000000000.0;
          v21 = -[NSMutableDictionary count](self->_streamingClients, "count");
          -[NSMutableDictionary allValues](self->_streamingClients, "allValues");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 134218498;
          v35 = v20;
          v36 = 2048;
          v37 = v21;
          v38 = 2112;
          v39 = v22;
          _os_log_impl(&dword_1AF589000, v18, OS_LOG_TYPE_DEFAULT, "%13.5f: %lu streaming clients: %@", (uint8_t *)&v34, 0x20u);

        }
      }
      v23 = (__int16)-[AWAttentionStreamer getStreamerOptionsWithMask:](self->_attentionStreamer, "getStreamerOptionsWithMask:", 128);
      v24 = -[AWScheduler shouldActivateAttentionDetectForStreaming](self, "shouldActivateAttentionDetectForStreaming");
      v25 = -[AWScheduler shouldActivateEyeReliefForStreaming](self, "shouldActivateEyeReliefForStreaming");
      v26 = v25;
      if (v24 == ((v23 & 0x100) == 0) || ((((v23 & 1) == 0) ^ v25) & 1) == 0)
      {
        if (currentLogLevel >= 6)
        {
          _AALog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = absTimeNS();
            if (v28 == -1)
              v29 = INFINITY;
            else
              v29 = (double)v28 / 1000000000.0;
            v34 = 134217984;
            v35 = v29;
            _os_log_impl(&dword_1AF589000, v27, OS_LOG_TYPE_DEFAULT, "%13.5f: Streaming options have changed, cancelling current operation and starting a new one with updated options", (uint8_t *)&v34, 0xCu);
          }

        }
        v30 = -[AWAttentionStreamer cancelEventStreamWithMask:](self->_attentionStreamer, "cancelEventStreamWithMask:", 128);
        v31 = 256;
        if (!v24)
          v31 = 0;
        v32 = -[AWScheduler streamFaceDetectEventsWithOptions:](self, "streamFaceDetectEventsWithOptions:", v31 | v26);
      }
      v17 = 0;
    }
  }
  else
  {
    if (currentLogLevel >= 6)
    {
      _AALog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = absTimeNS();
        if (v12 == -1)
          v13 = INFINITY;
        else
          v13 = (double)v12 / 1000000000.0;
        v34 = 134217984;
        v35 = v13;
        _os_log_impl(&dword_1AF589000, v11, OS_LOG_TYPE_DEFAULT, "%13.5f: Not stopping streamer as it isn't running currently", (uint8_t *)&v34, 0xCu);
      }

    }
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2FE0];
    v40 = *MEMORY[0x1E0CB2D50];
    v41[0] = CFSTR(" Streamer not running");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 3, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

- (void)handleNotification:(unint64_t)a3
{
  NSMutableDictionary *streamingClients;
  _QWORD v6[6];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a3 == 4 || a3 == 1)
  {
    streamingClients = self->_streamingClients;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34__AWScheduler_handleNotification___block_invoke;
    v6[3] = &unk_1E5F8DCD0;
    v6[4] = self;
    v6[5] = a3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](streamingClients, "enumerateKeysAndObjectsUsingBlock:", v6);
  }
}

- (void)setClientAsInterrupted:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  double v10;
  void *v11;
  AWAttentionStreamer *attentionStreamer;
  void *v13;
  double v14;
  int v15;
  double v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (currentLogLevel >= 6)
  {
    _AALog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = absTimeNS();
      if (v9 == -1)
        v10 = INFINITY;
      else
        v10 = (double)v9 / 1000000000.0;
      objc_msgSend(v6, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 134218242;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_1AF589000, v8, OS_LOG_TYPE_DEFAULT, "%13.5f: Adding client %@ to the interrupted clients list", (uint8_t *)&v15, 0x16u);

    }
  }
  -[NSMutableDictionary removeObjectForKey:](self->_streamingClients, "removeObjectForKey:", v7);
  -[NSMutableDictionary setObject:forKey:](self->_interruptedStreamingClients, "setObject:forKey:", v6, v7);
  attentionStreamer = self->_attentionStreamer;
  objc_msgSend(v6, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "streamingDuration");
  -[AWAttentionStreamer logStreamComplete:identifier:duration:ERActivated:](attentionStreamer, "logStreamComplete:identifier:duration:ERActivated:", 128, v13, (unint64_t)v14, objc_msgSend(v6, "activateEyeRelief"));

  objc_msgSend(v6, "setStreamingDuration:", 0.0);
}

- (BOOL)shouldActivateAttentionDetectForStreaming
{
  NSMutableDictionary *streamingClients;
  NSObject *v3;
  unint64_t v4;
  double v5;
  int v6;
  BOOL v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint8_t buf[4];
  double v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  streamingClients = self->_streamingClients;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__AWScheduler_shouldActivateAttentionDetectForStreaming__block_invoke;
  v9[3] = &unk_1E5F8E308;
  v9[4] = &v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](streamingClients, "enumerateKeysAndObjectsUsingBlock:", v9);
  if (currentLogLevel >= 7)
  {
    _AALog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = absTimeNS();
      if (v4 == -1)
        v5 = INFINITY;
      else
        v5 = (double)v4 / 1000000000.0;
      v6 = *((_DWORD *)v11 + 6);
      *(_DWORD *)buf = 134218240;
      v15 = v5;
      v16 = 1024;
      v17 = v6;
      _os_log_impl(&dword_1AF589000, v3, OS_LOG_TYPE_DEFAULT, "%13.5f: %d active AD clients", buf, 0x12u);
    }

  }
  v7 = *((_DWORD *)v11 + 6) > 0;
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (BOOL)shouldActivateEyeReliefForStreaming
{
  NSMutableDictionary *streamingClients;
  NSObject *v3;
  unint64_t v4;
  double v5;
  int v6;
  BOOL v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint8_t buf[4];
  double v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  streamingClients = self->_streamingClients;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__AWScheduler_shouldActivateEyeReliefForStreaming__block_invoke;
  v9[3] = &unk_1E5F8E308;
  v9[4] = &v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](streamingClients, "enumerateKeysAndObjectsUsingBlock:", v9);
  if (currentLogLevel >= 7)
  {
    _AALog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = absTimeNS();
      if (v4 == -1)
        v5 = INFINITY;
      else
        v5 = (double)v4 / 1000000000.0;
      v6 = *((_DWORD *)v11 + 6);
      *(_DWORD *)buf = 134218240;
      v15 = v5;
      v16 = 1024;
      v17 = v6;
      _os_log_impl(&dword_1AF589000, v3, OS_LOG_TYPE_DEFAULT, "%13.5f: %d active eyeRelief client", buf, 0x12u);
    }

  }
  v7 = *((_DWORD *)v11 + 6) > 0;
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (double)calculateTimeDelta:(unint64_t)a3 endTime:(unint64_t)a4 timebase:(mach_timebase_info)a5
{
  return (double)(a5.numer * (a4 - a3) / a5.denom) / 1000000000.0;
}

- (BOOL)canRunMotionDetect
{
  return -[AWAttentionSampler currentState](self->_attentionSampler, "currentState") != 1
      && !-[AWScheduler shouldActivateAttentionDetectionForSampling](self, "shouldActivateAttentionDetectionForSampling")&& -[AWScheduler shouldActivateMotionDetectForSampling](self, "shouldActivateMotionDetectForSampling");
}

- (void)screenStateChanging:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[AWAttentionSampler setDisplayState:](self->_attentionSampler, "setDisplayState:");
  -[AWAttentionStreamer setDisplayStateWithMask:displayState:](self->_attentionStreamer, "setDisplayStateWithMask:displayState:", 128, v3);
}

- (void)carPlayStateChanging:(BOOL)a3
{
  -[AWAttentionSampler setCarPlayConnected:](self->_attentionSampler, "setCarPlayConnected:", a3);
}

- (void)motionActivityChanging:(BOOL)a3
{
  self->_isDeviceStationary = a3;
}

- (void)lockScreenStateChanging:(BOOL)a3
{
  self->_isDeviceOnLockScreen = a3;
}

- (AWSchedulerObserver)observer
{
  return (AWSchedulerObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)allowFaceDetect
{
  return self->_allowFaceDetect;
}

- (BOOL)allowMotionDetect
{
  return self->_allowMotionDetect;
}

- (BOOL)unitTestMode
{
  return self->_unitTestMode;
}

- (BOOL)isDeviceStationary
{
  return self->_isDeviceStationary;
}

- (BOOL)isDeviceOnLockScreen
{
  return self->_isDeviceOnLockScreen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_attentionStreamer, 0);
  objc_storeStrong((id *)&self->_attentionSampler, 0);
  objc_storeStrong((id *)&self->_interruptedStreamingClients, 0);
  objc_storeStrong((id *)&self->_streamingClients, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __50__AWScheduler_shouldActivateEyeReliefForStreaming__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "activateEyeRelief") && (objc_msgSend(v4, "invalid") & 1) == 0)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

}

void __56__AWScheduler_shouldActivateAttentionDetectForStreaming__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "activateAttentionDetection") && (objc_msgSend(v4, "invalid") & 1) == 0)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

}

void __34__AWScheduler_handleNotification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((objc_msgSend(v5, "invalid") & 1) == 0)
  {
    objc_msgSend(v5, "notifyStreamingClientOfInterruption:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "calculateTimeDelta:endTime:timebase:", objc_msgSend(v5, "streamingStartTime"), mach_continuous_time(), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(v5, "setStreamingDuration:");
    objc_msgSend(*(id *)(a1 + 32), "setClientAsInterrupted:forKey:", v5, v6);
    objc_msgSend(v5, "invalidateWithoutQueue");
  }

}

void __49__AWScheduler_streamFaceDetectEventsWithOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  unint64_t v8;
  double v9;
  void *v10;
  int v11;
  double v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v6, "invalid") & 1) == 0)
  {
    if (currentLogLevel >= 6)
    {
      _AALog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = absTimeNS();
        if (v8 == -1)
          v9 = INFINITY;
        else
          v9 = (double)v8 / 1000000000.0;
        objc_msgSend(v6, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 134218242;
        v12 = v9;
        v13 = 2112;
        v14 = v10;
        _os_log_impl(&dword_1AF589000, v7, OS_LOG_TYPE_DEFAULT, "%13.5f: Removing client %@ from streaming clients list", (uint8_t *)&v11, 0x16u);

      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", v5);
    objc_msgSend(v6, "invalidateWithoutQueue");
  }

}

void __49__AWScheduler_streamFaceDetectEventsWithOptions___block_invoke_55(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__AWScheduler_streamFaceDetectEventsWithOptions___block_invoke_2;
  v6[3] = &unk_1E5F8DC58;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __49__AWScheduler_streamFaceDetectEventsWithOptions___block_invoke_58(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unint64_t v5;
  double v6;
  int v7;
  double v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = absTimeNS();
        if (v5 == -1)
          v6 = INFINITY;
        else
          v6 = (double)v5 / 1000000000.0;
        v7 = 134218242;
        v8 = v6;
        v9 = 2112;
        v10 = v3;
        _os_log_error_impl(&dword_1AF589000, v4, OS_LOG_TYPE_ERROR, "%13.5f: Error %@ when starting streaming operation from BioKit", (uint8_t *)&v7, 0x16u);
      }

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "enumerateKeysAndObjectsUsingBlock:", *(_QWORD *)(a1 + 40));
  }

}

void __49__AWScheduler_streamFaceDetectEventsWithOptions___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  id v9;
  uint8_t v10[16];

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = *(id *)(a1 + 32);
    if (objc_msgSend(v5, "metadataType") == 2 || objc_msgSend(v5, "metadataType") == 5)
    {
      _AALog();
      v6 = objc_claimAutoreleasedReturnValue();
      _AALog();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_signpost_id_generate(v7);

      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
      {
        *(_WORD *)v10 = 0;
        _os_signpost_emit_with_name_impl(&dword_1AF589000, v6, OS_SIGNPOST_EVENT, v8, "AA: Streaming event received", (const char *)&unk_1AF5B9EFB, v10, 2u);
      }

    }
  }
  v9 = v4;
  if ((objc_msgSend(v9, "invalid") & 1) == 0)
    objc_msgSend(v9, "notifyClientOfStreamingEvent:", *(_QWORD *)(a1 + 32));

}

void __31__AWScheduler_initWithOptions___block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unint64_t v5;
  double v6;
  id WeakRetained;
  id v8;
  int v9;
  double v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (currentLogLevel >= 6)
  {
    _AALog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = absTimeNS();
      if (v5 == -1)
        v6 = INFINITY;
      else
        v6 = (double)v5 / 1000000000.0;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      v9 = 134218498;
      v10 = v6;
      v11 = 2112;
      v12 = WeakRetained;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_1AF589000, v4, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ attentionSampler state change (%@)", (uint8_t *)&v9, 0x20u);

    }
  }
  v8 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v8, "armEvents");

}

uint64_t __31__AWScheduler_initWithOptions___block_invoke_40(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "canActiveOperationBeEnded");

  return v2;
}

void __31__AWScheduler_initWithOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleNotification:", a2);

}

+ (id)sharedScheduler
{
  if (sharedScheduler_onceToken != -1)
    dispatch_once(&sharedScheduler_onceToken, &__block_literal_global);
  return (id)sharedScheduler_scheduler;
}

+ (id)sharedMotionDetectScheduler
{
  if (sharedMotionDetectScheduler_onceToken != -1)
    dispatch_once(&sharedMotionDetectScheduler_onceToken, &__block_literal_global_14);
  return (id)sharedMotionDetectScheduler_motionDetectScheduler;
}

+ (id)sharedUnitTestScheduler
{
  if (sharedUnitTestScheduler_onceToken != -1)
    dispatch_once(&sharedUnitTestScheduler_onceToken, &__block_literal_global_17);
  return (id)sharedUnitTestScheduler_unitTestScheduler;
}

void __38__AWScheduler_sharedUnitTestScheduler__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  AWScheduler *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("initForUnitTest");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  v7[1] = CFSTR("allowFaceDetect");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  v7[2] = CFSTR("allowHIDEvents");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  v7[3] = CFSTR("allowMotionDetect");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = CFSTR("identifier");
  v8[3] = v3;
  v8[4] = CFSTR("Unit test scheduler");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[AWScheduler initWithOptions:]([AWScheduler alloc], "initWithOptions:", v4);
  v6 = (void *)sharedUnitTestScheduler_unitTestScheduler;
  sharedUnitTestScheduler_unitTestScheduler = (uint64_t)v5;

}

void __42__AWScheduler_sharedMotionDetectScheduler__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  AWScheduler *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("initForUnitTest");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  v7[1] = CFSTR("allowFaceDetect");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  v7[2] = CFSTR("allowHIDEvents");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  v7[3] = CFSTR("allowMotionDetect");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = CFSTR("identifier");
  v8[3] = v3;
  v8[4] = CFSTR("Motion detect scheduler");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[AWScheduler initWithOptions:]([AWScheduler alloc], "initWithOptions:", v4);
  v6 = (void *)sharedMotionDetectScheduler_motionDetectScheduler;
  sharedMotionDetectScheduler_motionDetectScheduler = (uint64_t)v5;

}

void __30__AWScheduler_sharedScheduler__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  AWScheduler *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("initForUnitTest");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  v7[1] = CFSTR("allowFaceDetect");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  v7[2] = CFSTR("allowHIDEvents");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  v7[3] = CFSTR("allowMotionDetect");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = CFSTR("identifier");
  v8[3] = v3;
  v8[4] = CFSTR("Face detect scheduler");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[AWScheduler initWithOptions:]([AWScheduler alloc], "initWithOptions:", v4);
  v6 = (void *)sharedScheduler_scheduler;
  sharedScheduler_scheduler = (uint64_t)v5;

}

@end
