@implementation AWAttentionStreamer

- (AWAttentionStreamer)initWithOptions:(id)a3
{
  id v4;
  void *v5;
  AWAttentionStreamer *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  objc_msgSend(v4, "valueForKey:", CFSTR("eventMask"));
  v6 = (AWAttentionStreamer *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "valueForKey:", CFSTR("useAVFoundation"));
    v6 = (AWAttentionStreamer *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "valueForKey:", CFSTR("unitTest"));
      v6 = (AWAttentionStreamer *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v5, "valueForKey:", CFSTR("eventMask"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "unsignedLongValue");

        objc_msgSend(v5, "valueForKey:", CFSTR("unitTest"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "BOOLValue");

        objc_msgSend(v5, "valueForKey:", CFSTR("useAVFoundation"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "BOOLValue");

        if (v8 == 128)
        {
          self = (AWAttentionStreamer *)-[AWAttentionStreamer initForUnitTest:useAVFoundation:](self, "initForUnitTest:useAVFoundation:", v10, v12);
          v6 = self;
          goto LABEL_8;
        }
LABEL_7:
        v6 = 0;
      }
    }
  }
LABEL_8:

  return v6;
}

- (id)initForUnitTest:(BOOL)a3 useAVFoundation:(BOOL)a4
{
  _BOOL4 v4;
  AWAttentionStreamer *v6;
  AWAttentionStreamer *v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  AWSampleLogger *sampleLogger;
  __objc2_class **v12;
  uint64_t v13;
  StreamingOperation *faceDetectStreamer;
  objc_super v16;

  v4 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AWAttentionStreamer;
  v6 = -[AWAttentionStreamer init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_unitTestMode = a3;
    awQueue(1);
    v8 = objc_claimAutoreleasedReturnValue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    +[AWSampleLogger sharedLogger](AWSampleLogger, "sharedLogger");
    v10 = objc_claimAutoreleasedReturnValue();
    sampleLogger = v7->_sampleLogger;
    v7->_sampleLogger = (AWSampleLogger *)v10;

    v12 = off_1E5F8D570;
    if (!v4)
      v12 = off_1E5F8D5A0;
    v13 = objc_msgSend(objc_alloc(*v12), "initForUnitTest:queue:", v7->_unitTestMode, v7->_queue);
    faceDetectStreamer = v7->_faceDetectStreamer;
    v7->_faceDetectStreamer = (StreamingOperation *)v13;

  }
  return v7;
}

- (id)streamEventsWithMask:(unint64_t)a3 block:(id)a4 options:(id)a5 operationStartFailedBlock:(id)a6
{
  int v7;
  id v10;
  id v11;
  StreamingOperation *faceDetectStreamer;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  double v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *v29;
  uint8_t buf[4];
  double v31;
  uint64_t v32;

  v7 = *(_DWORD *)&a5.var0;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  if (a3 != 128)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2FE0];
    v26 = *MEMORY[0x1E0CB2D50];
    v27 = CFSTR(" Invalid mask to start a stream");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v14;
    v18 = v15;
    v19 = 22;
LABEL_5:
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, v19, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  faceDetectStreamer = self->_faceDetectStreamer;
  if (!faceDetectStreamer)
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v24 = absTimeNS();
        if (v24 == -1)
          v25 = INFINITY;
        else
          v25 = (double)v24 / 1000000000.0;
        *(_DWORD *)buf = 134217984;
        v31 = v25;
        _os_log_error_impl(&dword_1AF589000, v21, OS_LOG_TYPE_ERROR, "%13.5f: No Attention streamer available", buf, 0xCu);
      }

    }
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2FE0];
    v28 = *MEMORY[0x1E0CB2D50];
    v29 = CFSTR(" No attention streamer found");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v22;
    v18 = v23;
    v19 = 19;
    goto LABEL_5;
  }
  -[StreamingOperation streamEventWithBlock:options:operationStartFailedBlock:](faceDetectStreamer, "streamEventWithBlock:options:operationStartFailedBlock:", v10, *(_QWORD *)&v7 & 0xFFFFFFLL, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v13;
}

- (id)cancelEventStreamWithMask:(unint64_t)a3
{
  StreamingOperation *faceDetectStreamer;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  double v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  const __CFString *v20;
  uint8_t buf[4];
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3 == 128)
  {
    faceDetectStreamer = self->_faceDetectStreamer;
    if (faceDetectStreamer)
    {
      -[StreamingOperation cancelEventStream](faceDetectStreamer, "cancelEventStream");
      return (id)objc_claimAutoreleasedReturnValue();
    }
    if (currentLogLevel >= 3)
    {
      _AALog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = absTimeNS();
        if (v15 == -1)
          v16 = INFINITY;
        else
          v16 = (double)v15 / 1000000000.0;
        *(_DWORD *)buf = 134217984;
        v22 = v16;
        _os_log_error_impl(&dword_1AF589000, v12, OS_LOG_TYPE_ERROR, "%13.5f: No Attention streamer available", buf, 0xCu);
      }

    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2FE0];
    v19 = *MEMORY[0x1E0CB2D50];
    v20 = CFSTR(" No attention streamer found");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    v9 = v14;
    v10 = 19;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0CB2FE0];
    v17 = *MEMORY[0x1E0CB2D50];
    v18 = CFSTR(" Invalid mask to start a stream");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5;
    v9 = v6;
    v10 = 22;
  }
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isStreamerRunningWithMask:(unint64_t)a3
{
  StreamingOperation *faceDetectStreamer;
  NSObject *v5;
  unint64_t v6;
  double v7;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3 == 128)
  {
    faceDetectStreamer = self->_faceDetectStreamer;
    if (faceDetectStreamer)
      return -[StreamingOperation attentionStreamerRunning](faceDetectStreamer, "attentionStreamerRunning");
    if (currentLogLevel >= 3)
    {
      _AALog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = absTimeNS();
        if (v6 == -1)
          v7 = INFINITY;
        else
          v7 = (double)v6 / 1000000000.0;
        v8 = 134217984;
        v9 = v7;
        _os_log_error_impl(&dword_1AF589000, v5, OS_LOG_TYPE_ERROR, "%13.5f: No Attention streamer available", (uint8_t *)&v8, 0xCu);
      }

    }
  }
  return 0;
}

- (void)setNotificationHandler:(id)a3 withMask:(unint64_t)a4
{
  if (a4 == 128)
    -[StreamingOperation setNotificationHandler:](self->_faceDetectStreamer, "setNotificationHandler:", a3);
}

- ($EB925890EBEBD6850280D1FB85A9BD43)getStreamerOptionsWithMask:(unint64_t)a3
{
  uint64_t v3;

  if (a3 == 128)
    return ($EB925890EBEBD6850280D1FB85A9BD43)-[StreamingOperation getStreamerOptions](self->_faceDetectStreamer, "getStreamerOptions");
  else
    LODWORD(v3) = 0;
  return ($EB925890EBEBD6850280D1FB85A9BD43)v3;
}

- (void)logStreamComplete:(unint64_t)a3 identifier:(id)a4 duration:(unint64_t)a5 ERActivated:(BOOL)a6
{
  if (a3 == 128)
    -[AWSampleLogger streamingCompleteWithidentifier:duration:ERActivated:](self->_sampleLogger, "streamingCompleteWithidentifier:duration:ERActivated:", a4, a5, a6);
}

- (void)setSmartCoverStateWithMask:(unint64_t)a3 smartCoverState:(BOOL)a4
{
  if (a3 == 128)
    -[StreamingOperation setSmartCoverState:](self->_faceDetectStreamer, "setSmartCoverState:", a4);
}

- (void)setDisplayStateWithMask:(unint64_t)a3 displayState:(BOOL)a4
{
  if (a3 == 128)
    -[StreamingOperation setDisplayState:](self->_faceDetectStreamer, "setDisplayState:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleLogger, 0);
  objc_storeStrong((id *)&self->_faceDetectStreamer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
