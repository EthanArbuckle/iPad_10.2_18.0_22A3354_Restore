@implementation ARRecordingTechniquePublic

- (ARRecordingTechniquePublic)init
{
  return -[ARRecordingTechniquePublic initWithFileURL:sensorDataTypes:](self, "initWithFileURL:sensorDataTypes:", 0, 0);
}

- (ARRecordingTechniquePublic)initWithFileURL:(id)a3 recordingSensorDataTypes:(unint64_t)a4
{
  return -[ARRecordingTechniquePublic initWithFileURL:recordingSensorDataTypes:startImmediately:recordCollaborationData:](self, "initWithFileURL:recordingSensorDataTypes:startImmediately:recordCollaborationData:", a3, a4, 1, 0);
}

- (ARRecordingTechniquePublic)initWithFileURL:(id)a3 recordingSensorDataTypes:(unint64_t)a4 startImmediately:(BOOL)a5 recordCollaborationData:(BOOL)a6
{
  _BOOL4 v7;
  id v10;
  ARRecordingTechniquePublic *v11;
  ARRecordingTechniquePublic *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  unint64_t v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  char v35;
  _BOOL4 v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  OS_dispatch_queue *recordingQueue;
  NSObject *v41;
  dispatch_queue_t v42;
  OS_dispatch_queue *timeSensitiveQueue;
  uint64_t v44;
  NSMutableDictionary *lastRecordedTimestamps;
  uint64_t v46;
  NSMutableSet *knownVIOSessionIDs;
  ARRecordingTechniquePublic *v48;
  NSObject *v49;
  objc_class *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  objc_super v57;
  uint64_t v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  ARRecordingTechniquePublic *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v7 = a5;
  v65 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v57.receiver = self;
  v57.super_class = (Class)ARRecordingTechniquePublic;
  v11 = -[ARTechnique init](&v57, sel_init);
  v12 = v11;
  if (!v11)
  {
    v15 = v10;
LABEL_21:
    v48 = v12;
    goto LABEL_25;
  }
  v11->_recordCollaborationData = a6;
  v11->_recordPearlDepthData = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.recordingTechnique.recordPearlDepthData"));
  +[ARKitUserDefaults stringForKey:](ARKitUserDefaults, "stringForKey:", CFSTR("com.apple.arkit.session.record.filepath"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if (objc_msgSend(v13, "isAbsolutePath"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v18, "stringByAppendingPathComponent:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "fileURLWithPath:", v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v18;
    }

    if (_ARLogSession_onceToken_0 != -1)
      dispatch_once(&_ARLogSession_onceToken_0, &__block_literal_global_32);
    v21 = (void *)_ARLogSession_logObj_0;
    if (os_log_type_enabled((os_log_t)_ARLogSession_logObj_0, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "absoluteString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v60 = v24;
      v61 = 2048;
      v62 = v12;
      v63 = 2112;
      v64 = v25;
      _os_log_impl(&dword_1B3A68000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Setting recording URL to %@", buf, 0x20u);

    }
    v16 = 0;
  }
  else if (v10)
  {
    v16 = 0;
    v15 = v10;
  }
  else
  {
    v53 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "stringByAppendingPathComponent:", CFSTR("movie.mov"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "fileURLWithPath:", v55);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 1;
  }
  if (objc_msgSend(v15, "isFileURL"))
  {
    objc_msgSend(v15, "URLByDeletingLastPathComponent");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = *MEMORY[0x1E0C99A50];
    v26 = v58;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "resourceValuesForKeys:error:", v27, 0);
    v28 = v15;
    v29 = v14;
    v30 = v16;
    v31 = a4;
    v32 = v7;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", v26);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "BOOLValue");

    v36 = v32;
    v37 = v31;
    v38 = v30;
    v14 = v29;
    v15 = v28;

    if ((v35 & 1) != 0)
    {
      objc_storeStrong((id *)&v12->_outputFileURL, v28);
      v12->_sensorDataTypes = v37;
      ARCreateFixedPriorityDispatchQueueWithQOS("com.apple.arkit.arrecordingpublictechnique.mainqueue");
      v39 = objc_claimAutoreleasedReturnValue();
      recordingQueue = v12->_recordingQueue;
      v12->_recordingQueue = (OS_dispatch_queue *)v39;

      dispatch_queue_attr_make_initially_inactive(0);
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = dispatch_queue_create("com.apple.arkit.arrecordingpublictechnique.runningqueue", v41);
      timeSensitiveQueue = v12->_timeSensitiveQueue;
      v12->_timeSensitiveQueue = (OS_dispatch_queue *)v42;

      dispatch_set_target_queue((dispatch_object_t)v12->_timeSensitiveQueue, (dispatch_queue_t)v12->_recordingQueue);
      v12->_state = 0;
      v12->_sessionSourceTime = -1.0;
      v44 = objc_opt_new();
      lastRecordedTimestamps = v12->_lastRecordedTimestamps;
      v12->_lastRecordedTimestamps = (NSMutableDictionary *)v44;

      v46 = objc_opt_new();
      knownVIOSessionIDs = v12->_knownVIOSessionIDs;
      v12->_knownVIOSessionIDs = (NSMutableSet *)v46;

      v12->_shouldSaveVideoInPhotosLibrary = v38;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[ARRecordingTechniquePublic performSelector:](v12, "performSelector:", sel__subscribeToBackgroundNotifications);
      if (v36)
        -[ARRecordingTechniquePublic startRecording](v12, "startRecording");

      goto LABEL_21;
    }
  }
  _ARLogTechnique_2();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
  {
    v50 = (objc_class *)objc_opt_class();
    NSStringFromClass(v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v60 = v51;
    v61 = 2048;
    v62 = v12;
    v63 = 2112;
    v64 = v15;
    _os_log_impl(&dword_1B3A68000, v49, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Recording fileURL is not writable: %@", buf, 0x20u);

  }
  v48 = 0;
LABEL_25:

  return v48;
}

- (void)dealloc
{
  NSObject *timeSensitiveQueue;
  objc_super v4;

  CVPixelBufferRelease(self->_pearlFixedPointUnsigned13_3PixelBuffer);
  -[ARRecordingTechniquePublic setState:](self, "setState:", 4);
  timeSensitiveQueue = self->_timeSensitiveQueue;
  if (timeSensitiveQueue)
    dispatch_activate(timeSensitiveQueue);
  v4.receiver = self;
  v4.super_class = (Class)ARRecordingTechniquePublic;
  -[ARRecordingTechniquePublic dealloc](&v4, sel_dealloc);
}

- (void)setParentImageSensorSettings:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t sensorDataTypes;
  unint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_parentImageSensorSettings, a3);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v17 = v5;
  objc_msgSend(v5, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "videoFormat");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "captureDevicePosition");

        if (v13 == 2)
        {
          objc_msgSend(v11, "metaData");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          sensorDataTypes = self->_sensorDataTypes;
          if (v14)
          {
            sensorDataTypes |= 0x10uLL;
            self->_sensorDataTypes = sensorDataTypes;
          }
          v16 = sensorDataTypes | 0x21;
        }
        else
        {
          v16 = self->_sensorDataTypes | 1;
        }
        self->_sensorDataTypes = v16;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

}

- (unint64_t)recordingSensorDataTypes
{
  return self->_sensorDataTypes;
}

- (unint64_t)requiredSensorDataTypes
{
  return self->_sensorDataTypes;
}

- (void)startRecording
{
  NSObject *recordingQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  recordingQueue = self->_recordingQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__ARRecordingTechniquePublic_startRecording__block_invoke;
  v4[3] = &unk_1E66722C0;
  objc_copyWeak(&v5, &location);
  dispatch_async(recordingQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __44__ARRecordingTechniquePublic_startRecording__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_startRecording");

}

- (void)recordCustomData:(id)a3 forTimestamp:(double)a4
{
  id v6;
  NSObject *timeSensitiveQueue;
  _QWORD v8[4];
  id v9;
  id v10[2];
  id location;

  v6 = a3;
  if (self->_expectCustomData)
  {
    objc_initWeak(&location, self);
    timeSensitiveQueue = self->_timeSensitiveQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__ARRecordingTechniquePublic_recordCustomData_forTimestamp___block_invoke;
    v8[3] = &unk_1E6673840;
    objc_copyWeak(v10, &location);
    v9 = v6;
    v10[1] = *(id *)&a4;
    dispatch_async(timeSensitiveQueue, v8);

    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }

}

void __60__ARRecordingTechniquePublic_recordCustomData_forTimestamp___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "processTimeSensitiveNSCoderObject:withTimestamp:metadataID:", *(_QWORD *)(a1 + 32), CFSTR("mdta/com.apple.arkit.customdata"), *(double *)(a1 + 48));

}

- (void)finishRecording
{
  NSObject *timeSensitiveQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  timeSensitiveQueue = self->_timeSensitiveQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__ARRecordingTechniquePublic_finishRecording__block_invoke;
  v4[3] = &unk_1E66722C0;
  objc_copyWeak(&v5, &location);
  dispatch_async(timeSensitiveQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __45__ARRecordingTechniquePublic_finishRecording__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_finishRecording");

}

- (void)abortRecording
{
  -[ARRecordingTechniquePublic setState:](self, "setState:", 4);
}

- (BOOL)allowedToWrite
{
  return -[ARRecordingTechniquePublic state](self, "state") - 1 < 2;
}

- (BOOL)finished
{
  return -[ARRecordingTechniquePublic state](self, "state") - 3 < 2;
}

- (void)removeTemporaryVideoFile
{
  void *v3;
  NSURL *outputFileURL;
  id v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  NSURL *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  ARRecordingTechniquePublic *v16;
  __int16 v17;
  NSURL *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSURL checkResourceIsReachableAndReturnError:](self->_outputFileURL, "checkResourceIsReachableAndReturnError:", 0))
  {
    outputFileURL = self->_outputFileURL;
    v12 = 0;
    objc_msgSend(v3, "removeItemAtURL:error:", outputFileURL, &v12);
    v5 = v12;
    if (v5)
    {
      v6 = v5;
      _ARLogTechnique_2();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = self->_outputFileURL;
        objc_msgSend(v6, "localizedDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v14 = v9;
        v15 = 2048;
        v16 = self;
        v17 = 2112;
        v18 = v10;
        v19 = 2112;
        v20 = v11;
        _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not remove temporary file at %@: %@", buf, 0x2Au);

      }
    }
  }

}

- (void)_fail:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  ARRecordingTechniquePublic *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ARLogTechnique_2();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v7;
    v17 = 2048;
    v18 = self;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Recording failed: %@", (uint8_t *)&v15, 0x20u);

  }
  -[ARRecordingTechniquePublic setState:](self, "setState:", 4);
  -[ARTechnique delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[ARTechnique delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "technique:didFailWithError:", self, v4);

  }
  -[ARRecordingTechniquePublic recordingTechniqueDelegate](self, "recordingTechniqueDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[ARRecordingTechniquePublic recordingTechniqueDelegate](self, "recordingTechniqueDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "technique:didFinishWithResult:", self, v4);

  }
  dispatch_activate((dispatch_object_t)self->_timeSensitiveQueue);

}

- (void)_finish:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  ARRecordingTechniquePublic *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_finishedError, a3);
  if (v5)
  {
    -[ARRecordingTechniquePublic _fail:](self, "_fail:", v5);
  }
  else
  {
    _ARLogTechnique_2();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v8;
      v14 = 2048;
      v15 = self;
      _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Recording successful", (uint8_t *)&v12, 0x16u);

    }
    -[ARRecordingTechniquePublic setState:](self, "setState:", 4);
    -[ARRecordingTechniquePublic recordingTechniqueDelegate](self, "recordingTechniqueDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[ARRecordingTechniquePublic recordingTechniqueDelegate](self, "recordingTechniqueDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "technique:didFinishWithResult:", self, 0);

    }
  }

}

- (id)processData:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *recordingQueue;
  id v11;
  NSObject *timeSensitiveQueue;
  id *v13;
  void *v14;
  id *v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD block[4];
  id v32;
  id v33;
  id location;

  v4 = a3;
  if (!-[ARRecordingTechniquePublic finished](self, "finished"))
  {
    v5 = v4;
    v6 = v5;
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EF084A28))
    {
      v6 = (void *)objc_msgSend(v5, "copy");

    }
    objc_initWeak(&location, self);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      objc_msgSend(v7, "originalImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "copy");

      recordingQueue = self->_recordingQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__ARRecordingTechniquePublic_processData___block_invoke;
      block[3] = &unk_1E66721B8;
      objc_copyWeak(&v33, &location);
      v32 = v9;
      v11 = v9;
      dispatch_async(recordingQueue, block);

      objc_destroyWeak(&v33);
LABEL_12:
      v19 = v5;
      objc_destroyWeak(&location);

      return v4;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      timeSensitiveQueue = self->_timeSensitiveQueue;
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __42__ARRecordingTechniquePublic_processData___block_invoke_2;
      v28[3] = &unk_1E66721B8;
      v13 = &v30;
      objc_copyWeak(&v30, &location);
      v29 = v6;
      dispatch_async(timeSensitiveQueue, v28);
      v14 = v29;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v6;
        v17 = self->_recordingQueue;
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __42__ARRecordingTechniquePublic_processData___block_invoke_3;
        v25[3] = &unk_1E66721B8;
        objc_copyWeak(&v27, &location);
        v26 = v16;
        v18 = v16;
        dispatch_async(v17, v25);

        v15 = &v27;
        goto LABEL_11;
      }
      if (!objc_msgSend(v6, "conformsToProtocol:", &unk_1EF084910))
        goto LABEL_12;
      v21 = self->_recordingQueue;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __42__ARRecordingTechniquePublic_processData___block_invoke_4;
      v22[3] = &unk_1E66721B8;
      v13 = &v24;
      objc_copyWeak(&v24, &location);
      v23 = v6;
      dispatch_async(v21, v22);
      v14 = v23;
    }

    v15 = v13;
LABEL_11:
    objc_destroyWeak(v15);
    goto LABEL_12;
  }
  return v4;
}

void __42__ARRecordingTechniquePublic_processData___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "writeImageData:", *(_QWORD *)(a1 + 32));

}

void __42__ARRecordingTechniquePublic_processData___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "writeAudioData:", *(_QWORD *)(a1 + 32));

}

void __42__ARRecordingTechniquePublic_processData___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "writeTimeOfFlightData:", *(_QWORD *)(a1 + 32));

}

void __42__ARRecordingTechniquePublic_processData___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "writeSensorData:", *(_QWORD *)(a1 + 32));

}

- (void)recordCollaborationData:(id)a3 localSession:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  ARRecordingTechniquePublic *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (ARInternalOSBuild() && self->_recordCollaborationData)
  {
    if (-[ARRecordingTechniquePublic allowedToWrite](self, "allowedToWrite"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llX"), objc_msgSend(v6, "vioSessionID"));
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = -[NSObject length](v7, "length");
      if (v8 >= 8)
        v9 = 8;
      else
        v9 = v8;
      -[NSObject substringToIndex:](v7, "substringToIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v6, "vioSessionID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[NSMutableSet containsObject:](self->_knownVIOSessionIDs, "containsObject:", v11);
      if (v4)
      {
        if ((v12 & 1) == 0)
        {
          -[NSMutableSet addObject:](self->_knownVIOSessionIDs, "addObject:", v11);
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCB48]), "initWithEventType:timestamp:", 7, CACurrentMediaTime());
          objc_msgSend(v13, "setPeerDisplayName:", v10);
          objc_msgSend(v13, "setSessionID:", v11);
          -[MOVWriterInterface processCVAUserEvent:](self->_writer, "processCVAUserEvent:", v13);

        }
      }
      else
      {
        if ((v12 & 1) == 0)
        {
          -[NSMutableSet addObject:](self->_knownVIOSessionIDs, "addObject:", v11);
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCB48]), "initWithEventType:timestamp:", 5, CACurrentMediaTime());
          objc_msgSend(v15, "setPeerDisplayName:", v10);
          -[MOVWriterInterface processCVAUserEvent:](self->_writer, "processCVAUserEvent:", v15);
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCB48]), "initWithEventType:timestamp:", 11, CACurrentMediaTime());
          objc_msgSend(v16, "setPeerDisplayName:", v10);
          objc_msgSend(v16, "setSessionID:", v11);
          -[MOVWriterInterface processCVAUserEvent:](self->_writer, "processCVAUserEvent:", v16);

        }
        v23 = 0;
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v23);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v23;
        if (v18)
        {
          _ARLogTechnique_2();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v20 = (objc_class *)objc_opt_class();
            NSStringFromClass(v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v25 = v21;
            v26 = 2048;
            v27 = self;
            v28 = 2112;
            v29 = v18;
            _os_log_impl(&dword_1B3A68000, v19, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error encoding collaboration data during recording: %@", buf, 0x20u);

          }
        }
        else
        {
          v19 = objc_opt_new();
          objc_msgSend(v6, "vioData");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setData:](v19, "setData:", v22);

          -[NSObject setAdditionalData:](v19, "setAdditionalData:", v17);
          -[NSObject setTimestamp:](v19, "setTimestamp:", CACurrentMediaTime());
          -[NSObject setIsSent:](v19, "setIsSent:", 0);
          -[NSObject setType:](v19, "setType:", objc_msgSend(v6, "vioDataType"));
          -[NSObject setSourcePeerDisplayName:](v19, "setSourcePeerDisplayName:", v10);
          -[MOVWriterInterface processCMData:](self->_writer, "processCMData:", v19);
        }

      }
    }
    else
    {
      _ARLogTechnique_2();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
LABEL_21:

        goto LABEL_22;
      }
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v10;
      v26 = 2048;
      v27 = self;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Dropping collaboration data which arrives while recording isn't running.", buf, 0x16u);
    }

    goto LABEL_21;
  }
LABEL_22:

}

- (void)recordAddedAnchor:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  ARRecordingTechniquePublic *v16;
  __int16 v17;
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (ARInternalOSBuild())
  {
    if (-[ARRecordingTechniquePublic allowedToWrite](self, "allowedToWrite"))
    {
      v12 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v12);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v12;
      if (v6)
      {
        _ARLogTechnique_2();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v8 = (objc_class *)objc_opt_class();
          NSStringFromClass(v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v14 = v9;
          v15 = 2048;
          v16 = self;
          v17 = 2112;
          v18 = v6;
          _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error encoding anchor data during recording: %@", buf, 0x20u);

        }
      }
      else
      {
        v7 = objc_opt_new();
        -[NSObject setAnchorData:](v7, "setAnchorData:", v5);
        -[NSObject setEventType:](v7, "setEventType:", 4);
        objc_msgSend(v4, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setUuid:](v7, "setUuid:", v11);

        -[NSObject setTimestamp:](v7, "setTimestamp:", CACurrentMediaTime());
        -[MOVWriterInterface processCVAUserEvent:](self->_writer, "processCVAUserEvent:", v7);
      }

    }
    else
    {
      _ARLogTechnique_2();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
LABEL_11:

        goto LABEL_12;
      }
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v5;
      v15 = 2048;
      v16 = self;
      _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Dropping added anchor data which arrives while recording isn't running.", buf, 0x16u);
    }

    goto LABEL_11;
  }
LABEL_12:

}

- (void)recordRemovedAnchor:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  ARRecordingTechniquePublic *v16;
  __int16 v17;
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (ARInternalOSBuild())
  {
    if (-[ARRecordingTechniquePublic allowedToWrite](self, "allowedToWrite"))
    {
      v12 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v12);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v12;
      if (v6)
      {
        _ARLogTechnique_2();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v8 = (objc_class *)objc_opt_class();
          NSStringFromClass(v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v14 = v9;
          v15 = 2048;
          v16 = self;
          v17 = 2112;
          v18 = v6;
          _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error encoding anchor data during recording: %@", buf, 0x20u);

        }
      }
      else
      {
        v7 = objc_opt_new();
        -[NSObject setAnchorData:](v7, "setAnchorData:", v5);
        -[NSObject setEventType:](v7, "setEventType:", 13);
        objc_msgSend(v4, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setUuid:](v7, "setUuid:", v11);

        -[NSObject setTimestamp:](v7, "setTimestamp:", CACurrentMediaTime());
        -[MOVWriterInterface processCVAUserEvent:](self->_writer, "processCVAUserEvent:", v7);
      }

    }
    else
    {
      _ARLogTechnique_2();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
LABEL_11:

        goto LABEL_12;
      }
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v5;
      v15 = 2048;
      v16 = self;
      _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Dropping removed anchor data which arrives while recording isn't running.", buf, 0x16u);
    }

    goto LABEL_11;
  }
LABEL_12:

}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

- (void)_startRecording
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  id v8;
  NSURL *outputFileURL;
  void *v10;
  MOVWriterInterface *v11;
  MOVWriterInterface *writer;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  ARRecordingTechniquePublic *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (-[ARRecordingTechniquePublic state](self, "state"))
  {
    v18 = *MEMORY[0x1E0CB2D50];
    v19[0] = CFSTR("Attempted to start recording more than once");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    ARErrorWithCodeAndUserInfo(1001, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARRecordingTechniquePublic _fail:](self, "_fail:", v4);

  }
  else
  {
    _ARLogTechnique_2();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v7;
      v16 = 2048;
      v17 = self;
      _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Starting recording", (uint8_t *)&v14, 0x16u);

    }
    -[ARRecordingTechniquePublic removeTemporaryVideoFile](self, "removeTemporaryVideoFile");
    v8 = objc_alloc(MEMORY[0x1E0CFCB58]);
    outputFileURL = self->_outputFileURL;
    -[ARRecordingTechniquePublic createFileMetadata](self, "createFileMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (MOVWriterInterface *)objc_msgSend(v8, "initWithFileURL:expectedFrameRate:fileSummary:callbackQueue:", outputFileURL, v10, self->_recordingQueue, 60.0);
    writer = self->_writer;
    self->_writer = v11;

    -[MOVWriterInterface setInterface_delegate:](self->_writer, "setInterface_delegate:", self);
    objc_msgSend(MEMORY[0x1E0CFCB58], "makeDeviceString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOVWriterInterface setDeviceString:](self->_writer, "setDeviceString:", v13);

    -[ARRecordingTechniquePublic setupSensorTracks](self, "setupSensorTracks");
    -[ARRecordingTechniquePublic setupCustomTrack](self, "setupCustomTrack");
    -[ARRecordingTechniquePublic setState:](self, "setState:", 1);
  }
}

- (void)setupSensorTracks
{
  void *v3;
  uint64_t v4;
  MOVWriterInterface *writer;
  ARParentImageSensorSettings *parentImageSensorSettings;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  MOVWriterInterface *v21;
  CMAudioFormatDescriptionRef v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  MOVWriterInterface *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  objc_class *v35;
  ARRecordingTechniquePublic *v36;
  id v37;
  CMAudioFormatDescriptionRef formatDescriptionOut;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  void *v47;
  _BYTE v48[128];
  _BYTE asbd[48];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  +[ARBKSAccelerometer sharedWeakAccelerometerHandle](ARBKSAccelerometer, "sharedWeakAccelerometerHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentOrientation");

  v44 = 0u;
  v45 = 0u;
  v43 = 0u;
  ARVideoTransformForDeviceOrientation(v4, (uint64_t)&v43);
  writer = self->_writer;
  *(_OWORD *)asbd = v43;
  *(_OWORD *)&asbd[16] = v44;
  *(_OWORD *)&asbd[32] = v45;
  -[MOVWriterInterface setVideoTransform:](writer, "setVideoTransform:", asbd);
  parentImageSensorSettings = self->_parentImageSensorSettings;
  if (parentImageSensorSettings)
  {
    v36 = self;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[ARParentImageSensorSettings settings](parentImageSensorSettings, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v40;
      v11 = *MEMORY[0x1E0C89F80];
      v12 = -1;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(v7);
          v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v14, "videoFormat");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            objc_msgSend(v15, "captureDeviceType");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqualToString:", v11);

            if (v18)
            {
              v12 = objc_msgSend(v16, "framesPerSecond");
            }
            else if (objc_msgSend(v14, "isEnabled"))
            {
              objc_msgSend(v16, "captureDeviceType");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              ARStreamIdentifierForDeviceTypeAndPosition(v19, objc_msgSend(v16, "captureDevicePosition"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              -[MOVWriterInterface registerStreamID:withConfigObject:](v36->_writer, "registerStreamID:withConfigObject:", v20, 0);
              -[MOVWriterInterface registerMetadataID:](v36->_writer, "registerMetadataID:", v20);

            }
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v9);
    }
    else
    {
      v12 = -1;
    }

    self = v36;
  }
  else
  {
    -[MOVWriterInterface registerStreamID:withConfigObject:](self->_writer, "registerStreamID:withConfigObject:", CFSTR("mdta/com.apple.arkit.stream.arimagedata"), 0);
    -[MOVWriterInterface registerMetadataID:](self->_writer, "registerMetadataID:", CFSTR("mdta/com.apple.arkit.arimagedata"));
    v12 = -1;
  }
  if (self->_recordPearlDepthData && (self->_sensorDataTypes & 0x20) != 0)
    -[MOVWriterInterface registerCVADepthIR](self->_writer, "registerCVADepthIR");
  if (-[ARRecordingTechniquePublic expectAudioData](self, "expectAudioData"))
  {
    if (objc_msgSend(MEMORY[0x1E0C8B0A0], "authorizationStatusForMediaType:", *MEMORY[0x1E0C8A7A0]) == 3)
    {
      *(_QWORD *)asbd = 0x40E5888000000000;
      *(_OWORD *)&asbd[24] = xmmword_1B3BE3770;
      *(_OWORD *)&asbd[8] = xmmword_1B3BE3780;
      formatDescriptionOut = 0;
      CMAudioFormatDescriptionCreate(0, (const AudioStreamBasicDescription *)asbd, 0, 0, 0, 0, 0, &formatDescriptionOut);
      v21 = self->_writer;
      v22 = formatDescriptionOut;
      objc_msgSend(MEMORY[0x1E0D46938], "audioNoneEncoderConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MOVWriterInterface addTrackForStreamWithIdentifier:formatDescription:recordingConfiguration:](v21, "addTrackForStreamWithIdentifier:formatDescription:recordingConfiguration:", CFSTR("mdta/com.apple.arkit.stream.araudio"), v22, v23);

      CFRelease(formatDescriptionOut);
    }
    else
    {
      _ARLogTechnique_2();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)asbd = 138543618;
        *(_QWORD *)&asbd[4] = v26;
        *(_WORD *)&asbd[12] = 2048;
        *(_QWORD *)&asbd[14] = self;
        _os_log_impl(&dword_1B3A68000, v24, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not add audio track since user has not granted microphone access to the app.", asbd, 0x16u);

      }
    }
  }
  -[MOVWriterInterface registerAccelerometer](self->_writer, "registerAccelerometer");
  -[MOVWriterInterface registerGyro](self->_writer, "registerGyro");
  if ((self->_sensorDataTypes & 0x400) != 0)
    -[MOVWriterInterface registerCompass](self->_writer, "registerCompass");
  -[MOVWriterInterface registerDeviceMotion](self->_writer, "registerDeviceMotion");
  if ((self->_sensorDataTypes & 0x40) != 0)
    -[MOVWriterInterface registerLocation](self->_writer, "registerLocation");
  -[MOVWriterInterface registerCVACameraCalibrationData](self->_writer, "registerCVACameraCalibrationData");
  -[MOVWriterInterface registerCVAFeatureBuffer](self->_writer, "registerCVAFeatureBuffer");
  if (ARDeviceSupportsJasper())
  {
    -[MOVWriterInterface setDepthTOFTrackName:](self->_writer, "setDepthTOFTrackName:", *MEMORY[0x1E0CFCBB8]);
    -[MOVWriterInterface registerCVADepthTOF](self->_writer, "registerCVADepthTOF");
    if (v12 < 1)
    {
      _ARLogTechnique_2();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v32 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)asbd = 138543618;
        *(_QWORD *)&asbd[4] = v32;
        *(_WORD *)&asbd[12] = 2048;
        *(_QWORD *)&asbd[14] = self;
        _os_log_impl(&dword_1B3A68000, v31, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to get jasper FPS metadata", asbd, 0x16u);
LABEL_38:

      }
    }
    else
    {
      v27 = self->_writer;
      v46 = *MEMORY[0x1E0CFCBB0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *MEMORY[0x1E0CFCB88];
      v37 = 0;
      LOBYTE(v27) = -[MOVWriterInterface setTrackMetadata:forMetadataStream:error:](v27, "setTrackMetadata:forMetadataStream:error:", v29, v30, &v37);
      v31 = v37;

      if ((v27 & 1) == 0)
      {
        _ARLogTechnique_2();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = (objc_class *)objc_opt_class();
          NSStringFromClass(v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)asbd = 138543874;
          *(_QWORD *)&asbd[4] = v34;
          *(_WORD *)&asbd[12] = 2048;
          *(_QWORD *)&asbd[14] = self;
          *(_WORD *)&asbd[22] = 2112;
          *(_QWORD *)&asbd[24] = v31;
          _os_log_impl(&dword_1B3A68000, v32, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to set jasper FPS metadata: %@", asbd, 0x20u);

        }
        goto LABEL_38;
      }
    }

  }
  if (ARInternalOSBuild())
  {
    -[MOVWriterInterface registerCVAUserEvent](self->_writer, "registerCVAUserEvent");
    if (self->_recordCollaborationData)
      -[MOVWriterInterface registerCMData](self->_writer, "registerCMData");
  }
}

- (void)setupCustomTrack
{
  if (self->_expectCustomData)
    -[MOVWriterInterface registerMetadataID:](self->_writer, "registerMetadataID:", CFSTR("mdta/com.apple.arkit.customdata"));
}

- (id)createFileMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sensorDataTypes);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("mdta/com.apple.arkit.arsensordatatypeinformation"));

  AROSVersionString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("mdta/com.apple.arkit.osversion"));

  ARVersionStringForIdentifier(CFSTR("com.apple.ARKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("mdta/com.apple.arkit.arkitversion"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_customUserData, CFSTR("mdta/com.apple.arkit.customuserdata"));
  return v3;
}

- (void)writeTimeOfFlightData:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  objc_class *Class;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  _BYTE buf[12];
  __int16 v19;
  ARRecordingTechniquePublic *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[ARRecordingTechniquePublic finished](self, "finished"))
  {
    if (-[ARRecordingTechniquePublic allowedToWrite](self, "allowedToWrite"))
    {
      v6 = v5;
      v7 = objc_alloc(MEMORY[0x1E0CFCB30]);
      objc_msgSend(v6, "pointCloudData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timestamp");
      v9 = objc_msgSend(v7, "initWithAVPointCloudData:timestamp:", v8);

      if (v9)
      {
        -[MOVWriterInterface processCVADepthTOF:](self->_writer, "processCVADepthTOF:", v9);
      }
      else
      {
        _ARLogTechnique_2();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v17;
          v19 = 2048;
          v20 = self;
          _os_log_impl(&dword_1B3A68000, v15, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to make CVADepthTOF for pointCloudData", buf, 0x16u);

        }
      }
    }
    else
    {
      Class = object_getClass(v5);
      NSStringFromClass(Class);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timestamp");
      *(_QWORD *)buf = 0;
      v6 = v11;
      objc_msgSend(v6, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(v6, "length"), 0);

      *(_QWORD *)buf = 0;
      objc_msgSend(CFSTR("NotStart"), "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(CFSTR("NotStart"), "length"), 0);
      kdebug_trace();
      _ARLogTechnique_2();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v13;
        v19 = 2048;
        v20 = self;
        v21 = 2112;
        v22 = v14;
        v23 = 2112;
        v24 = v6;
        _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Tried to call %@ with %@ before session has started", buf, 0x2Au);

      }
    }

  }
}

- (void)writeSensorData:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  NSObject *v12;
  void *v13;
  objc_class *Class;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  _BYTE buf[12];
  __int16 v20;
  ARRecordingTechniquePublic *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[ARRecordingTechniquePublic finished](self, "finished"))
  {
    if (-[ARRecordingTechniquePublic allowedToWrite](self, "allowedToWrite"))
    {
      v6 = objc_opt_class();
      ARMetadataIdentifierForARSensorDataClass(v6, 1);
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "appendToWriter:", self->_writer);
LABEL_12:

        goto LABEL_13;
      }
      Class = object_getClass(v5);
      NSStringFromClass(Class);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timestamp");
      *(_QWORD *)buf = 0;
      v10 = v15;
      -[NSObject getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v10, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, -[NSObject length](v10, "length"), 0);

      *(_QWORD *)buf = 0;
      objc_msgSend(CFSTR("BadClass"), "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(CFSTR("BadClass"), "length"), 0);
      kdebug_trace();
      _ARLogTechnique_2();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v17;
        v20 = 2048;
        v21 = self;
        v22 = 2112;
        v23 = v18;
        v24 = 2112;
        v25 = v10;
        _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Tried to call %@ with %@ which we don't have support for", buf, 0x2Au);

      }
    }
    else
    {
      v8 = object_getClass(v5);
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timestamp");
      *(_QWORD *)buf = 0;
      v7 = v9;
      -[NSObject getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v7, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, -[NSObject length](v7, "length"), 0);

      *(_QWORD *)buf = 0;
      objc_msgSend(CFSTR("NotStart"), "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(CFSTR("NotStart"), "length"), 0);
      kdebug_trace();
      _ARLogTechnique_2();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_11:

        goto LABEL_12;
      }
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v12;
      v20 = 2048;
      v21 = self;
      v22 = 2112;
      v23 = v13;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Tried to call %@ with %@ before session has started", buf, 0x2Au);

    }
    goto LABEL_11;
  }
LABEL_13:

}

- (void)writeImageData:(id)a3
{
  id v5;
  BOOL v6;
  double v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  __CFString *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  objc_class *Class;
  void *v20;
  __CFString *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  MOVWriterInterface *writer;
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  uint8_t buf[32];
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[ARRecordingTechniquePublic finished](self, "finished"))
  {
    v6 = -[ARRecordingTechniquePublic allowedToWrite](self, "allowedToWrite");
    objc_msgSend(v5, "timestamp");
    if (v6)
    {
      kdebug_trace();
      if (-[ARRecordingTechniquePublic state](self, "state") == 1 && self->_writerReady)
      {
        objc_msgSend(v5, "timestamp");
        self->_sessionSourceTime = v7;
        -[ARRecordingTechniquePublic setState:](self, "setState:", 2);
        dispatch_activate((dispatch_object_t)self->_timeSensitiveQueue);
        _ARLogTechnique_2();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = (objc_class *)objc_opt_class();
          NSStringFromClass(v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v10;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = self;
          _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Writer is now running", buf, 0x16u);

        }
      }
      objc_msgSend(v5, "cameraType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ARStreamIdentifierForDeviceTypeAndPosition(v11, objc_msgSend(v5, "cameraPosition"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v12;
      v14 = v13;
      if (self->_parentImageSensorSettings)
      {
        v15 = (__CFString *)v13;
      }
      else
      {
        v21 = CFSTR("mdta/com.apple.arkit.stream.arimagedata");

        v15 = CFSTR("mdta/com.apple.arkit.arimagedata");
        v14 = v21;
      }
      -[MOVWriterInterface processNSCoderObject:metadataID:](self->_writer, "processNSCoderObject:metadataID:", v5, v15);
      if (objc_msgSend(v5, "visionData"))
      {
        v22 = objc_alloc(MEMORY[0x1E0CFCB38]);
        v23 = objc_msgSend(v5, "visionData");
        objc_msgSend(v5, "timestamp");
        v24 = (void *)objc_msgSend(v22, "initWithPixelBufferRef:timestamp:streamID:", v23, v14);
        -[MOVWriterInterface processCVAFeatureBuffer:](self->_writer, "processCVAFeatureBuffer:", v24);

      }
      v45 = 0uLL;
      v46 = 0;
      v25 = (void *)MEMORY[0x1E0CFCB58];
      objc_msgSend(v5, "timestamp");
      objc_msgSend(v25, "cmTimeFromTimestamp:");
      v48 = 0u;
      memset(buf, 0, sizeof(buf));
      objc_msgSend(v5, "cameraIntrinsics");
      *(_DWORD *)&buf[8] = v26;
      *(_DWORD *)&buf[24] = v27;
      *(_QWORD *)buf = v28;
      *(_QWORD *)&buf[16] = v29;
      DWORD2(v48) = v30;
      *(_QWORD *)&v48 = v31;
      writer = self->_writer;
      v33 = objc_msgSend(v5, "pixelBuffer");
      objc_msgSend(v5, "exposureDuration");
      v43 = v45;
      v44 = v46;
      -[MOVWriterInterface processPixelBuffer:withTimeStamp:intrinsics:exposureTime:streamID:](writer, "processPixelBuffer:withTimeStamp:intrinsics:exposureTime:streamID:", v33, &v43, buf, v14);
      if (self->_recordPearlDepthData)
      {
        objc_msgSend(v5, "depthData");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          objc_msgSend(v5, "depthData");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "depthDataTimestamp");
          v37 = v36;
          objc_msgSend(v5, "captureDevice");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[ARRecordingTechniquePublic writePearlDepthData:withTimestamp:fromCaptureDevice:](self, "writePearlDepthData:withTimestamp:fromCaptureDevice:", v35, v38, v37);

        }
      }
      objc_msgSend(v5, "calibrationData");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        v40 = objc_alloc(MEMORY[0x1E0CFCB20]);
        objc_msgSend(v5, "calibrationData");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "timestamp");
        v42 = (void *)objc_msgSend(v40, "initWithAVCameraCalibrationData:timestamp:streamID:", v41, v14);

        -[MOVWriterInterface processCVACameraCalibrationData:](self->_writer, "processCVACameraCalibrationData:", v42);
      }
      objc_msgSend(v5, "timestamp");
      kdebug_trace();

    }
    else
    {
      *(_QWORD *)buf = 0;
      objc_msgSend(CFSTR("ARImageData"), "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(CFSTR("ARImageData"), "length"), 0);
      *(_QWORD *)buf = 0;
      objc_msgSend(CFSTR("NotStart"), "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(CFSTR("NotStart"), "length"), 0);
      kdebug_trace();
      _ARLogTechnique_2();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        Class = object_getClass(v5);
        NSStringFromClass(Class);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&buf[24] = v18;
        LOWORD(v48) = 2112;
        *(_QWORD *)((char *)&v48 + 2) = v20;
        _os_log_impl(&dword_1B3A68000, v14, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Tried to call %@ with %@ before session has started", buf, 0x2Au);

      }
    }

  }
}

- (void)writePearlDepthData:(id)a3 withTimestamp:(double)a4 fromCaptureDevice:(id)a5
{
  id v7;
  id v8;
  __CVBuffer *v9;
  __CVBuffer *v10;
  __CVBuffer **p_pearlFixedPointUnsigned13_3PixelBuffer;
  __CVBuffer *pearlFixedPointUnsigned13_3PixelBuffer;
  __CVBuffer *v13;
  const __CFString *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  objc_class *v18;
  NSObject *v19;
  const char *v20;
  objc_class *v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint32_t v25;
  const __CFAllocator *v26;
  size_t Width;
  size_t Height;
  CVReturn v29;
  CVReturn v30;
  objc_class *v31;
  objc_class *v32;
  int v33;
  NSObject *v34;
  __int16 v35;
  ARRecordingTechniquePublic *v36;
  __int16 v37;
  CVReturn v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  v8 = objc_retainAutorelease(v7);
  v9 = (__CVBuffer *)objc_msgSend(v8, "depthDataMap");
  if (!v9)
  {
    _ARLogTechnique_2();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      goto LABEL_18;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v17 = objc_claimAutoreleasedReturnValue();
    v33 = 138543618;
    v34 = v17;
    v35 = 2048;
    v36 = self;
    v22 = "%{public}@ <%p>: Depth data has NULL depthDataMap, not writing Pearl frame";
    v23 = v16;
    v24 = OS_LOG_TYPE_INFO;
    v25 = 22;
LABEL_13:
    _os_log_impl(&dword_1B3A68000, v23, v24, v22, (uint8_t *)&v33, v25);
    goto LABEL_17;
  }
  v10 = v9;
  p_pearlFixedPointUnsigned13_3PixelBuffer = &self->_pearlFixedPointUnsigned13_3PixelBuffer;
  pearlFixedPointUnsigned13_3PixelBuffer = self->_pearlFixedPointUnsigned13_3PixelBuffer;
  if (pearlFixedPointUnsigned13_3PixelBuffer)
    goto LABEL_3;
  v26 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Width = CVPixelBufferGetWidth(v9);
  Height = CVPixelBufferGetHeight(v10);
  v39 = *MEMORY[0x1E0CA8FF0];
  v40[0] = MEMORY[0x1E0C9AA70];
  v29 = CVPixelBufferCreate(v26, Width, Height, 0x31332E33u, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1), &self->_pearlFixedPointUnsigned13_3PixelBuffer);
  if (v29)
  {
    v30 = v29;
    _ARLogTechnique_2();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v17 = objc_claimAutoreleasedReturnValue();
    v33 = 138543874;
    v34 = v17;
    v35 = 2048;
    v36 = self;
    v37 = 1024;
    v38 = v30;
    v22 = "%{public}@ <%p>: Failed to create 13_3 pixel buffer for transcoding Pearl data, CVReturn=%d";
    v23 = v16;
    v24 = OS_LOG_TYPE_ERROR;
    v25 = 28;
    goto LABEL_13;
  }
  pearlFixedPointUnsigned13_3PixelBuffer = *p_pearlFixedPointUnsigned13_3PixelBuffer;
LABEL_3:
  if (ARConvertDepthFloatingPointBufferToFixedPointUnsigned13_3Buffer(v10, pearlFixedPointUnsigned13_3PixelBuffer))
  {
    v13 = *p_pearlFixedPointUnsigned13_3PixelBuffer;
    v14 = (const __CFString *)*MEMORY[0x1E0D05458];
    v15 = ARDepthRepresentationDictionary(v8);
    CVBufferSetAttachment(v13, v14, v15, kCVAttachmentMode_ShouldPropagate);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFCB28]), "initWithPixelBufferRef:timestamp:", *p_pearlFixedPointUnsigned13_3PixelBuffer, a4);
    if (!v16)
    {
      _ARLogTechnique_2();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v19 = objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v19;
        v35 = 2048;
        v36 = self;
        v20 = "%{public}@ <%p>: Failed to create CVADepthIR wrapper for writing depth data";
        goto LABEL_16;
      }
LABEL_17:

      goto LABEL_18;
    }
    if ((-[MOVWriterInterface processCVADepthIR:](self->_writer, "processCVADepthIR:", v16) & 1) == 0)
    {
      _ARLogTechnique_2();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v19;
        v35 = 2048;
        v36 = self;
        v20 = "%{public}@ <%p>: Failed to write a CVADepthIR instance";
LABEL_16:
        _os_log_impl(&dword_1B3A68000, v17, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v33, 0x16u);

        goto LABEL_17;
      }
      goto LABEL_17;
    }
LABEL_18:

  }
}

- (void)writeAudioData:(id)a3
{
  id v5;
  double v6;
  double v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  double sessionSourceTime;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  objc_class *v19;
  objc_class *Class;
  _QWORD block[5];
  _BYTE buf[12];
  __int16 v23;
  ARRecordingTechniquePublic *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_timeSensitiveQueue);
  objc_msgSend(v5, "timestamp");
  v7 = v6;
  if (!-[ARRecordingTechniquePublic finished](self, "finished"))
  {
    if (-[ARRecordingTechniquePublic state](self, "state") != 2)
    {
      *(_QWORD *)buf = 0;
      objc_msgSend(CFSTR("ARAudioData"), "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(CFSTR("ARAudioData"), "length"), 0);
      *(_QWORD *)buf = 0;
      objc_msgSend(CFSTR("NotRunning"), "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(CFSTR("NotRunning"), "length"), 0);
      kdebug_trace();
      _ARLogTechnique_2();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_10:

        goto LABEL_14;
      }
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      Class = object_getClass(v5);
      NSStringFromClass(Class);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v10;
      v23 = 2048;
      v24 = self;
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v13;
      v15 = "%{public}@ <%p>: Tried to call %@ with %@ before session has started";
      v16 = v8;
      v17 = OS_LOG_TYPE_ERROR;
      v18 = 42;
LABEL_9:
      _os_log_impl(&dword_1B3A68000, v16, v17, v15, buf, v18);

      goto LABEL_10;
    }
    if (self->_expectAudioData)
    {
      if (v7 >= self->_sessionSourceTime)
      {
        -[MOVWriterInterface appendAudioBuffer:forStream:](self->_writer, "appendAudioBuffer:forStream:", objc_msgSend(v5, "sampleBuffer"), CFSTR("mdta/com.apple.arkit.stream.araudio"));
        goto LABEL_14;
      }
      *(_QWORD *)buf = 0;
      objc_msgSend(CFSTR("ARAudioData"), "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(CFSTR("ARAudioData"), "length"), 0);
      *(_QWORD *)buf = 0;
      objc_msgSend(CFSTR("OldData"), "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(CFSTR("OldData"), "length"), 0);
      kdebug_trace();
      _ARLogTechnique_2();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        goto LABEL_10;
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = object_getClass(v5);
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      sessionSourceTime = self->_sessionSourceTime;
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)&buf[4] = v10;
      v23 = 2048;
      v24 = self;
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v13;
      v29 = 2048;
      v30 = v7;
      v31 = 2048;
      v32 = sessionSourceTime;
      v15 = "%{public}@ <%p>: %@ for %@ metadata with timestamp %f < _sessionSourceTime %f, dropping";
      v16 = v8;
      v17 = OS_LOG_TYPE_DEBUG;
      v18 = 62;
      goto LABEL_9;
    }
    *(_QWORD *)buf = 0;
    objc_msgSend(CFSTR("ARAudioData"), "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(CFSTR("ARAudioData"), "length"), 0);
    *(_QWORD *)buf = 0;
    objc_msgSend(CFSTR("AudioOff"), "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(CFSTR("AudioOff"), "length"), 0);
    kdebug_trace();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__ARRecordingTechniquePublic_writeAudioData___block_invoke;
    block[3] = &unk_1E6672168;
    block[4] = self;
    if (writeAudioData__onceToken != -1)
      dispatch_once(&writeAudioData__onceToken, block);
  }
LABEL_14:

}

void __45__ARRecordingTechniquePublic_writeAudioData___block_invoke(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _ARLogTechnique_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v4;
    v8 = 2048;
    v9 = v5;
    _os_log_impl(&dword_1B3A68000, v2, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: You turned on audio data but we're not recording it because it wasn't turned on when you started recording.", (uint8_t *)&v6, 0x16u);

  }
}

- (void)writeResultData:(id)a3 withTimestamp:(double)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12 = (objc_class *)objc_opt_class();
        ARMetadataIdentifierForARRecordableResultsClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARRecordingTechniquePublic processTimeSensitiveNSCoderObject:withTimestamp:metadataID:](self, "processTimeSensitiveNSCoderObject:withTimestamp:metadataID:", v11, v13, a4);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)processTimeSensitiveNSCoderObject:(id)a3 withTimestamp:(double)a4 metadataID:(id)a5
{
  id v9;
  id v10;
  objc_class *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  double sessionSourceTime;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  objc_class *v23;
  objc_class *v24;
  objc_class *v25;
  uint32_t v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  MOVWriterInterface *writer;
  objc_class *Class;
  objc_class *v33;
  objc_class *v34;
  objc_class *v35;
  NSObject *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  __int128 v42;
  uint64_t v43;
  uint8_t buf[24];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_timeSensitiveQueue);
  if (!-[ARRecordingTechniquePublic finished](self, "finished"))
  {
    if (-[ARRecordingTechniquePublic state](self, "state") == 2)
    {
      if (self->_sessionSourceTime <= a4)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_lastRecordedTimestamps, "objectForKeyedSubscript:", v10);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "doubleValue");
        v29 = v28;

        if (v29 + 2.22044605e-16 >= a4)
        {
          Class = object_getClass(v9);
          NSStringFromClass(Class);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          objc_msgSend(v12, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(v12, "length"), 0);
          *(_QWORD *)buf = 0;
          objc_msgSend(CFSTR("TimeDupe"), "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(CFSTR("TimeDupe"), "length"), 0);
          kdebug_trace();
          _ARLogTechnique_2();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            v33 = (objc_class *)objc_opt_class();
            NSStringFromClass(v33);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = object_getClass(v9);
            NSStringFromClass(v34);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            *(_QWORD *)&buf[4] = v15;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = self;
            *(_WORD *)&buf[22] = 2112;
            v45 = v16;
            v46 = 2112;
            v47 = v18;
            v48 = 2048;
            v49 = a4;
            v50 = 2048;
            v51 = v29;
            v20 = "%{public}@ <%p>: %@ for %@ metadata with timestamp %f <= lastTimestamp %f, dropping";
            v21 = v13;
            v22 = OS_LOG_TYPE_INFO;
            goto LABEL_13;
          }
        }
        else
        {
          v12 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, 0);
          v13 = objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            v35 = object_getClass(0);
            NSStringFromClass(v35);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)buf = 0;
            objc_msgSend(v15, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(v15, "length"), 0);
            *(_QWORD *)buf = 0;
            objc_msgSend(CFSTR("Archive"), "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(CFSTR("Archive"), "length"), 0);
            kdebug_trace();
            _ARLogTechnique_2();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              v37 = (objc_class *)objc_opt_class();
              NSStringFromClass(v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = object_getClass(0);
              NSStringFromClass(v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              *(_QWORD *)&buf[4] = v38;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = self;
              *(_WORD *)&buf[22] = 2112;
              v45 = v39;
              v46 = 2112;
              v47 = v41;
              _os_log_impl(&dword_1B3A68000, v36, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to archive data: %@ with %@", buf, 0x2Au);

            }
            goto LABEL_15;
          }
          objc_msgSend(v12, "addObject:", v13);
          memset(buf, 0, sizeof(buf));
          objc_msgSend(MEMORY[0x1E0CFCB58], "cmTimeFromTimestamp:", a4);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lastRecordedTimestamps, "setObject:forKeyedSubscript:", v30, v10);

          writer = self->_writer;
          v42 = *(_OWORD *)buf;
          v43 = *(_QWORD *)&buf[16];
          -[MOVWriterInterface appendMetadata:withTimeStamp:toStream:](writer, "appendMetadata:withTimeStamp:toStream:", v12, &v42, v10);
        }
      }
      else
      {
        v11 = object_getClass(v9);
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        objc_msgSend(v12, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(v12, "length"), 0);
        *(_QWORD *)buf = 0;
        objc_msgSend(CFSTR("OldData"), "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(CFSTR("OldData"), "length"), 0);
        kdebug_trace();
        _ARLogTechnique_2();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v14 = (objc_class *)objc_opt_class();
          NSStringFromClass(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = object_getClass(v9);
          NSStringFromClass(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          sessionSourceTime = self->_sessionSourceTime;
          *(_DWORD *)buf = 138544642;
          *(_QWORD *)&buf[4] = v15;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = self;
          *(_WORD *)&buf[22] = 2112;
          v45 = v16;
          v46 = 2112;
          v47 = v18;
          v48 = 2048;
          v49 = a4;
          v50 = 2048;
          v51 = sessionSourceTime;
          v20 = "%{public}@ <%p>: %@ for %@ metadata with timestamp %f < _sessionSourceTime %f, dropping";
          v21 = v13;
          v22 = OS_LOG_TYPE_DEBUG;
LABEL_13:
          v26 = 62;
          goto LABEL_14;
        }
      }
    }
    else
    {
      v23 = object_getClass(v9);
      NSStringFromClass(v23);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      objc_msgSend(v12, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(v12, "length"), 0);
      *(_QWORD *)buf = 0;
      objc_msgSend(CFSTR("NotRunning"), "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(CFSTR("NotRunning"), "length"), 0);
      kdebug_trace();
      _ARLogTechnique_2();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = object_getClass(v9);
        NSStringFromClass(v25);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2112;
        v45 = v16;
        v46 = 2112;
        v47 = v18;
        v20 = "%{public}@ <%p>: Tried to call %@ with %@ before session has started";
        v21 = v13;
        v22 = OS_LOG_TYPE_ERROR;
        v26 = 42;
LABEL_14:
        _os_log_impl(&dword_1B3A68000, v21, v22, v20, buf, v26);

LABEL_15:
      }
    }

  }
}

- (void)_finishRecording
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  MOVWriterInterface *writer;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  ARRecordingTechniquePublic *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_timeSensitiveQueue);
  switch(-[ARRecordingTechniquePublic state](self, "state"))
  {
    case 0uLL:
      v23 = *MEMORY[0x1E0CB2D50];
      v24[0] = CFSTR("Attempted to finish without starting");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      ARErrorWithCodeAndUserInfo(1001, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARRecordingTechniquePublic _fail:](self, "_fail:", v4);

      break;
    case 1uLL:
    case 3uLL:
      return;
    case 4uLL:
      -[ARRecordingTechniquePublic recordingTechniqueDelegate](self, "recordingTechniqueDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) != 0)
      {
        -[ARRecordingTechniquePublic recordingTechniqueDelegate](self, "recordingTechniqueDelegate");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "technique:didFinishWithResult:", self, self->_finishedError);

      }
      break;
    default:
      -[ARRecordingTechniquePublic setState:](self, "setState:", 3);
      _ARLogTechnique_2();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v7;
        v21 = 2048;
        v22 = self;
        _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Finish requested", buf, 0x16u);

      }
      writer = self->_writer;
      v16 = 0;
      -[MOVWriterInterface finishWriting:](writer, "finishWriting:", &v16);
      v9 = v16;
      v10 = v9;
      if (v9)
      {
        v17 = *MEMORY[0x1E0CB3388];
        v18 = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        ARErrorWithCodeAndUserInfo(1001, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ARRecordingTechniquePublic _fail:](self, "_fail:", v12);

      }
      break;
  }
}

- (void)isReadyToRecord
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  ARRecordingTechniquePublic *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  self->_writerReady = 1;
  _ARLogTechnique_2();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2048;
    v12 = self;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Writer ready for recording", (uint8_t *)&v9, 0x16u);

  }
  -[ARRecordingTechniquePublic recordingTechniqueDelegate](self, "recordingTechniqueDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[ARRecordingTechniquePublic recordingTechniqueDelegate](self, "recordingTechniqueDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordingTechniqueDidBecomeReady:", self);

  }
}

- (void)didFailWithError:(id)a3
{
  NSObject *recordingQueue;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  recordingQueue = self->_recordingQueue;
  v5 = a3;
  dispatch_assert_queue_V2(recordingQueue);
  v8 = *MEMORY[0x1E0CB3388];
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  ARErrorWithCodeAndUserInfo(1001, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARRecordingTechniquePublic _fail:](self, "_fail:", v7);

}

- (void)didFinishRecording
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  NSURL *outputFileURL;
  int v7;
  void *v8;
  __int16 v9;
  ARRecordingTechniquePublic *v10;
  __int16 v11;
  NSURL *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  if (self->_shouldSaveVideoInPhotosLibrary)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[ARRecordingTechniquePublic performSelector:withObject:](self, "performSelector:withObject:", sel__saveVideoInPhotosLibrary_, self->_outputFileURL);
  }
  else
  {
    _ARLogTechnique_2();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      outputFileURL = self->_outputFileURL;
      v7 = 138543874;
      v8 = v5;
      v9 = 2048;
      v10 = self;
      v11 = 2112;
      v12 = outputFileURL;
      _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Saved video to file at %@.", (uint8_t *)&v7, 0x20u);

    }
    -[ARRecordingTechniquePublic _finish:](self, "_finish:", 0);
  }
}

+ (BOOL)isSupported
{
  return 1;
}

- (NSURL)outputFileURL
{
  return self->_outputFileURL;
}

- (BOOL)expectDepthData
{
  return self->_expectDepthData;
}

- (void)setExpectDepthData:(BOOL)a3
{
  self->_expectDepthData = a3;
}

- (BOOL)expectAudioData
{
  return self->_expectAudioData;
}

- (void)setExpectAudioData:(BOOL)a3
{
  self->_expectAudioData = a3;
}

- (BOOL)expectCustomData
{
  return self->_expectCustomData;
}

- (void)setExpectCustomData:(BOOL)a3
{
  self->_expectCustomData = a3;
}

- (BOOL)shouldSaveVideoInPhotosLibrary
{
  return self->_shouldSaveVideoInPhotosLibrary;
}

- (void)setShouldSaveVideoInPhotosLibrary:(BOOL)a3
{
  self->_shouldSaveVideoInPhotosLibrary = a3;
}

- (ARRecordingTechniqueDelegate)recordingTechniqueDelegate
{
  return (ARRecordingTechniqueDelegate *)objc_loadWeakRetained((id *)&self->_recordingTechniqueDelegate);
}

- (void)setRecordingTechniqueDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_recordingTechniqueDelegate, a3);
}

- (ARParentImageSensorSettings)parentImageSensorSettings
{
  return self->_parentImageSensorSettings;
}

- (NSDictionary)customUserData
{
  return self->_customUserData;
}

- (void)setCustomUserData:(id)a3
{
  objc_storeStrong((id *)&self->_customUserData, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customUserData, 0);
  objc_storeStrong((id *)&self->_parentImageSensorSettings, 0);
  objc_destroyWeak((id *)&self->_recordingTechniqueDelegate);
  objc_storeStrong((id *)&self->_outputFileURL, 0);
  objc_storeStrong((id *)&self->_knownVIOSessionIDs, 0);
  objc_storeStrong((id *)&self->_finishedError, 0);
  objc_storeStrong((id *)&self->_lastRecordedTimestamps, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_timeSensitiveQueue, 0);
  objc_storeStrong((id *)&self->_recordingQueue, 0);
}

@end
