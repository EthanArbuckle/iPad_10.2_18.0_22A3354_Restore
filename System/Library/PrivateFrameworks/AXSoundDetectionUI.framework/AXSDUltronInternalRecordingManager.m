@implementation AXSDUltronInternalRecordingManager

- (AXSDUltronInternalRecordingManager)initWithSampleLength:(double)a3 bufferSize:(double)a4
{
  AXSDUltronInternalRecordingManager *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *fileProcessingQueue;
  AXHARingBuffer *v9;
  AXHARingBuffer *audioRingBuffer;
  uint64_t v11;
  NSMutableDictionary *currentDetections;
  uint64_t v13;
  NSMutableDictionary *detectionResultCollection;
  uint64_t v15;
  void *v16;
  AXSDUltronInternalRecordingManager *v17;
  uint64_t v18;
  NSTimer *cleanupTimer;
  _QWORD v21[4];
  AXSDUltronInternalRecordingManager *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)();
  void *v26;
  AXSDUltronInternalRecordingManager *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)AXSDUltronInternalRecordingManager;
  v6 = -[AXSDUltronInternalRecordingManager init](&v28, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.ax.ultron.file_write_q", 0);
    fileProcessingQueue = v6->_fileProcessingQueue;
    v6->_fileProcessingQueue = (OS_dispatch_queue *)v7;

    v6->_sampleLength = a3;
    v9 = -[AXHARingBuffer initWithCount:]([AXHARingBuffer alloc], "initWithCount:", vcvtpd_u64_f64(20.0 / (a3 * a4)));
    audioRingBuffer = v6->_audioRingBuffer;
    v6->_audioRingBuffer = v9;

    v11 = objc_opt_new();
    currentDetections = v6->_currentDetections;
    v6->_currentDetections = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    detectionResultCollection = v6->_detectionResultCollection;
    v6->_detectionResultCollection = (NSMutableDictionary *)v13;

    v15 = MEMORY[0x24BDAC760];
    v23 = MEMORY[0x24BDAC760];
    v24 = 3221225472;
    v25 = __70__AXSDUltronInternalRecordingManager_initWithSampleLength_bufferSize___block_invoke;
    v26 = &unk_24DDF6AE0;
    v27 = v6;
    AXPerformBlockOnMainThread();
    v16 = (void *)MEMORY[0x24BDBCF40];
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __70__AXSDUltronInternalRecordingManager_initWithSampleLength_bufferSize___block_invoke_2;
    v21[3] = &unk_24DDF6B08;
    v17 = v27;
    v22 = v17;
    objc_msgSend(v16, "scheduledTimerWithTimeInterval:repeats:block:", 1, v21, 86400.0);
    v18 = objc_claimAutoreleasedReturnValue();
    cleanupTimer = v17->_cleanupTimer;
    v17->_cleanupTimer = (NSTimer *)v18;

  }
  return v6;
}

uint64_t __70__AXSDUltronInternalRecordingManager_initWithSampleLength_bufferSize___block_invoke()
{
  return objc_msgSend((id)objc_opt_class(), "cleanupUltron");
}

void __70__AXSDUltronInternalRecordingManager_initWithSampleLength_bufferSize___block_invoke_2(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  AXPerformBlockOnMainThread();

}

uint64_t __70__AXSDUltronInternalRecordingManager_initWithSampleLength_bufferSize___block_invoke_3()
{
  return objc_msgSend((id)objc_opt_class(), "cleanupUltron");
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_cleanupTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AXSDUltronInternalRecordingManager;
  -[AXSDUltronInternalRecordingManager dealloc](&v3, sel_dealloc);
}

+ (id)defaults
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.Accessibility"));
}

+ (BOOL)isEnrolled
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("com.apple.accessibility.ultron.user_identifier_key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (void)enroll
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", CFSTR("com.apple.accessibility.ultron.user_identifier_key"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_21ACD4000, a2, v5, "Enrolling in Ultron Data Collection - ID: %@", v6);

}

+ (void)unenroll
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_21ACD4000, v0, v1, "Unenrolling from Ultron Data Collection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (BOOL)wasPrompted
{
  void *v2;
  char v3;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("com.apple.accessibility.ultron.user_identifier_prompt_key"));

  return v3;
}

+ (void)setPrompted
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_21ACD4000, v0, v1, "Updating \"User was prompted to join Ultron Data Collection\" defaults to True", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)cleanupUltron
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("com.apple.accessibility.ultron.last_cleanup_key"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -86400.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (objc_msgSend(v4, "laterDate:", v6), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7 == v4))
  {
    AXLogUltron();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_21ACD4000, v11, OS_LOG_TYPE_INFO, "Not cleaning up Ultron Files - last cleanup was recent: %@", (uint8_t *)&v12, 0xCu);
    }

  }
  else
  {
    objc_msgSend(a1, "_retrieveFilesOlderThan:", 1209600.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
      objc_msgSend(a1, "_cleanupUltronFiles:", v8);
    objc_msgSend(a1, "_reduceFileDirectorySize");
    objc_msgSend(a1, "defaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("com.apple.accessibility.ultron.last_cleanup_key"));

  }
}

+ (id)path
{
  return CFSTR("/var/mobile/Library/Accessibility/DataCollection/SoundFiles");
}

+ (id)_directory
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v10;

  v10 = 1;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v4, &v10);

  if ((v5 & 1) == 0)
  {
    AXLogUltron();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      +[AXSDUltronInternalRecordingManager _directory].cold.1();

    objc_msgSend(a1, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0);

  }
  objc_msgSend(a1, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_retrieveFilesOlderThan:(double)a3
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  __int128 v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (a3 <= 0.0)
    v4 = a3;
  else
    v4 = -a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_directory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enumeratorAtPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v8, "nextObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v12 = (void *)v10;
    *(_QWORD *)&v11 = 138412546;
    v21 = v11;
    do
    {
      objc_msgSend(v6, "stringByAppendingPathComponent:", v12, v21);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      objc_msgSend(v14, "attributesOfItemAtPath:error:", v13, &v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v23;
      objc_msgSend(v15, "fileCreationDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        AXLogUltron();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v21;
          v25 = v13;
          v26 = 2112;
          v27 = v16;
          _os_log_error_impl(&dword_21ACD4000, v18, OS_LOG_TYPE_ERROR, "Ultron cleanup: failed to find creation date for file %@. error: %@", buf, 0x16u);
        }

      }
      else if (objc_msgSend(v17, "compare:", v22) == -1)
      {
        objc_msgSend(v9, "addObject:", v13);
      }

      objc_msgSend(v8, "nextObject");
      v19 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v19;
    }
    while (v19);
  }

  return v9;
}

- (void)trackBuffer:(id)a3 atTime:(id)a4
{
  AXHARingBuffer *audioRingBuffer;
  id v6;
  id v7;
  AXSDTimedAudioBuffer *v8;

  audioRingBuffer = self->_audioRingBuffer;
  v6 = a4;
  v7 = a3;
  v8 = -[AXSDTimedAudioBuffer initWithBuffer:atTime:]([AXSDTimedAudioBuffer alloc], "initWithBuffer:atTime:", v7, v6);

  -[AXHARingBuffer addObject:](audioRingBuffer, "addObject:", v8);
}

- (void)listenEngineFailedToStartWithError:(id)a3
{
  NSObject *v3;

  AXLogUltron();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[AXSDUltronInternalRecordingManager listenEngineFailedToStartWithError:].cold.1();

}

+ (BOOL)_cleanupUltronFiles:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  __int128 v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = *(_QWORD *)v19;
    v9 = 1;
    *(_QWORD *)&v5 = 138412546;
    v16 = v5;
    do
    {
      v10 = 0;
      v11 = v7;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v3);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v11;
        objc_msgSend(v13, "removeItemAtPath:error:", v12, &v17);
        v7 = v17;

        if (v7)
        {
          AXLogUltron();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            v23 = v12;
            v24 = 2112;
            v25 = v7;
            _os_log_error_impl(&dword_21ACD4000, v14, OS_LOG_TYPE_ERROR, "Ultron cleanup: failed to remove: %@. Error: %@", buf, 0x16u);
          }

          v9 = 0;
        }
        ++v10;
        v11 = v7;
      }
      while (v6 != v10);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v6);

  }
  else
  {
    v9 = 1;
  }

  return v9 & 1;
}

- (void)saveDetectionResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *detectionResultCollection;
  AXHARingBuffer *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_detectionResultCollection, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    detectionResultCollection = self->_detectionResultCollection;
    v8 = -[AXHARingBuffer initWithCount:]([AXHARingBuffer alloc], "initWithCount:", -[AXHARingBuffer count](self->_audioRingBuffer, "count"));
    -[NSMutableDictionary setObject:forKey:](detectionResultCollection, "setObject:forKey:", v8, v5);

  }
  -[NSMutableDictionary objectForKey:](self->_detectionResultCollection, "objectForKey:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v4);

  if (objc_msgSend(v4, "detected"))
  {
    -[NSMutableDictionary objectForKey:](self->_currentDetections, "objectForKey:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      AXLogUltron();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[AXSDUltronInternalRecordingManager saveDetectionResult:].cold.1((uint64_t)v5, v4, v11);

      v12 = (void *)MEMORY[0x24BDBCF40];
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __58__AXSDUltronInternalRecordingManager_saveDetectionResult___block_invoke;
      v15[3] = &unk_24DDF6B30;
      v15[4] = self;
      v16 = v4;
      v13 = v5;
      v17 = v13;
      objc_msgSend(v12, "scheduledTimerWithTimeInterval:repeats:block:", 0, v15, 10.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_currentDetections, "setObject:forKey:", v14, v13);

    }
  }

}

void __58__AXSDUltronInternalRecordingManager_saveDetectionResult___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v3, "_recordResultToFile:", v4);
  objc_msgSend(*(id *)(a1[4] + 48), "removeObjectForKey:", a1[6]);
  objc_msgSend(v5, "invalidate");

}

- (void)_recordResultToFile:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *fileProcessingQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  AXSDUltronInternalRecordingManager *v14;
  id v15;
  id v16;

  v4 = a3;
  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AXSDUltronInternalRecordingManager _recordResultToFile:].cold.1(v4, v5);

  -[AXHARingBuffer content](self->_audioRingBuffer, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary ax_deepMutableCopy](self->_detectionResultCollection, "ax_deepMutableCopy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fileProcessingQueue = self->_fileProcessingQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__AXSDUltronInternalRecordingManager__recordResultToFile___block_invoke;
  v12[3] = &unk_24DDF6B80;
  v13 = v4;
  v14 = self;
  v15 = v7;
  v16 = v6;
  v9 = v6;
  v10 = v7;
  v11 = v4;
  dispatch_async(fileProcessingQueue, v12);

}

void __58__AXSDUltronInternalRecordingManager__recordResultToFile___block_invoke(id *a1)
{
  id *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  id v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  NSObject *v73;
  id *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id obj;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  _QWORD v95[5];
  _QWORD block[4];
  NSObject *v97;
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  uint64_t v114;
  uint64_t v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  uint64_t v131;

  v131 = *MEMORY[0x24BDAC8D0];
  v1 = a1 + 4;
  objc_msgSend(a1[4], "identifier");
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_directory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%ld"), (uint64_t)v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v81 = (void *)v7;
  v84 = (void *)v2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v2, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("wav"));
  v9 = objc_claimAutoreleasedReturnValue();
  v83 = v8;
  objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("txt"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v3, "stringByAppendingPathComponent:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fileURLWithPath:", v12);
  v13 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", v10);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x24BDB1810]);
  objc_msgSend(v1[1], "audioFileSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (void *)objc_msgSend(v15, "initForWriting:settings:commonFormat:interleaved:error:", v13, v16, 1, 1, 0);

  v17 = v1[2];
  objc_msgSend(*v1, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v77 = v19;
  objc_msgSend(v19, "content");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "reverseObjectEnumerator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = vcvtpd_s64_f64(10.0 / *((double *)v1[1] + 1));
  v76 = (void *)v14;
  if (!*v1)
  {
    v126 = 0u;
    v127 = 0u;
    v125 = 0u;
    if (v22 > 0)
    {
      v93 = 0;
      goto LABEL_13;
    }
    goto LABEL_9;
  }
  objc_msgSend(*v1, "timeRange");
  v23 = *v1;
  if ((uint64_t)v125 >= v22)
  {
    if (v23)
    {
      objc_msgSend(v23, "timeRange");
      v24 = v122;
      v23 = *v1;
      goto LABEL_10;
    }
LABEL_9:
    v23 = 0;
    v24 = 0;
    v123 = 0u;
    v124 = 0u;
    v122 = 0u;
LABEL_10:
    v93 = v24 - v22;
    if (v23)
      goto LABEL_11;
LABEL_13:
    v25 = 0;
    v120 = 0u;
    v121 = 0u;
    v119 = 0u;
    goto LABEL_14;
  }
  v93 = 0;
  if (!v23)
    goto LABEL_13;
LABEL_11:
  objc_msgSend(v23, "timeRange");
  v25 = v119;
  if (*v1)
  {
    objc_msgSend(*v1, "timeRange");
    v26 = *((_QWORD *)&v117 + 1);
    goto LABEL_15;
  }
LABEL_14:
  v26 = 0;
  v117 = 0u;
  v118 = 0u;
  v116 = 0u;
LABEL_15:
  v27 = 0;
  v28 = v26 + v25;
  v82 = v3;
  v79 = (void *)v10;
  v80 = (void *)v9;
  v78 = (void *)v13;
  while (1)
  {
    objc_msgSend(v21, "nextObject");
    v29 = (id)objc_claimAutoreleasedReturnValue();

    v27 = v29;
    if (!v29)
      break;
    if ((objc_msgSend(v29, "detected") & 1) != 0 || v29 == *v1)
    {
      objc_msgSend(v29, "timeRange");
      v75 = v29;
      objc_msgSend(v29, "timeRange");
      v28 = v114 + v115;
      goto LABEL_21;
    }
  }
  v75 = 0;
LABEL_21:
  v92 = v28 + v22;
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v30 = a1[7];
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v110, v130, 16);
  if (!v31)
    goto LABEL_32;
  v32 = v31;
  v33 = *(_QWORD *)v111;
  do
  {
    for (i = 0; i != v32; ++i)
    {
      if (*(_QWORD *)v111 != v33)
        objc_enumerationMutation(v30);
      v35 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * i);
      objc_msgSend(v35, "time");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v36, "sampleTime") >= v93)
      {
        objc_msgSend(v35, "time");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "sampleTime");

        if (v38 > v92)
          continue;
        objc_msgSend(v35, "buffer");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "writeFromBuffer:error:", v36, 0);
      }

    }
    v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v110, v130, 16);
  }
  while (v32);
LABEL_32:
  v74 = v1;

  v39 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  objc_msgSend(a1[6], "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v129, 16);
  if (v88)
  {
    v87 = *(_QWORD *)v107;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v107 != v87)
          objc_enumerationMutation(obj);
        v89 = v40;
        v41 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * v40);
        objc_msgSend(a1[6], "objectForKey:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "content");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        v104 = 0u;
        v105 = 0u;
        v102 = 0u;
        v103 = 0u;
        v91 = v43;
        v44 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v102, v128, 16);
        if (v44)
        {
          v45 = v44;
          v46 = *(_QWORD *)v103;
          do
          {
            for (j = 0; j != v45; ++j)
            {
              if (*(_QWORD *)v103 != v46)
                objc_enumerationMutation(v91);
              v48 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * j);
              if (v48)
              {
                objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * j), "timeRange");
                v49 = v99;
              }
              else
              {
                v49 = 0;
                v100 = 0u;
                v101 = 0u;
                v99 = 0u;
              }
              v50 = v49 - v93;
              if (v49 >= v93 && v49 <= v92)
              {
                objc_msgSend(v39, "objectForKeyedSubscript:", v41);
                v52 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v52)
                {
                  objc_msgSend(a1[5], "getDictionaryForListenType");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "setValue:forKey:", v53, v41);

                }
                objc_msgSend(v48, "confidence");
                v55 = v54;
                objc_msgSend(v48, "confidence");
                if (v56 < 0.001)
                  v55 = 0.0;
                objc_msgSend(v39, "objectForKey:", v41);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "objectForKey:", CFSTR("confidence"));
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v55);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "addObject:", v59);

                objc_msgSend(v39, "objectForKey:", v41);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v60, "objectForKey:", CFSTR("timestamp"));
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v50);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "addObject:", v62);

              }
            }
            v45 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v102, v128, 16);
          }
          while (v45);
        }

        v40 = v89 + 1;
      }
      while (v89 + 1 != v88);
      v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v129, 16);
    }
    while (v88);
  }

  v63 = MGCopyAnswer();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v65, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  objc_msgSend(v65, "stringFromDate:", v64);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v85, "length");

  v68 = (void *)objc_opt_new();
  v94 = (void *)v63;
  objc_msgSend(v68, "setSafeObject:forKey:", v63, CFSTR("buildVersion"));
  objc_msgSend(v68, "setSafeObject:forKey:", &unk_24DDFEC80, CFSTR("ultronVersion"));
  objc_msgSend(v68, "setSafeObject:forKey:", v84, CFSTR("listenType"));
  objc_msgSend(v68, "setSafeObject:forKey:", v83, CFSTR("fileName"));
  objc_msgSend(v68, "setSafeObject:forKey:", v66, CFSTR("audioStringDate"));
  objc_msgSend(v68, "setSafeObject:forKey:", v39, CFSTR("confidenceValues"));
  objc_msgSend(v68, "setSafeObject:forKey:", &unk_24DDFEC98, CFSTR("userFeedback"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v67);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setSafeObject:forKey:", v69, CFSTR("numberOfSamples"));

  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v68, 1, 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = MEMORY[0x24BDAC760];
  if (v70)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__AXSDUltronInternalRecordingManager__recordResultToFile___block_invoke_62;
    block[3] = &unk_24DDF6B58;
    v72 = v76;
    v97 = v76;
    v98 = v70;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v73 = v97;
  }
  else
  {
    AXLogUltron();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      __58__AXSDUltronInternalRecordingManager__recordResultToFile___block_invoke_cold_1(v74, v73);
    v72 = v76;
  }

  v95[0] = v71;
  v95[1] = 3221225472;
  v95[2] = __58__AXSDUltronInternalRecordingManager__recordResultToFile___block_invoke_63;
  v95[3] = &unk_24DDF6AE0;
  v95[4] = a1[5];
  dispatch_async(MEMORY[0x24BDAC9B8], v95);

}

void __58__AXSDUltronInternalRecordingManager__recordResultToFile___block_invoke_62(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  void *v6;
  char v7;
  NSObject *v8;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = (uint64_t *)(a1 + 32);
  objc_msgSend(v2, "createFileAtPath:contents:attributes:", v3, v4, 0);

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", *v5);

  AXLogUltron();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __58__AXSDUltronInternalRecordingManager__recordResultToFile___block_invoke_62_cold_1(v7, v5, v8);

}

uint64_t __58__AXSDUltronInternalRecordingManager__recordResultToFile___block_invoke_63()
{
  return objc_msgSend((id)objc_opt_class(), "_reduceFileDirectorySize");
}

- (id)getDictionaryForListenType
{
  id v2;
  id v3;
  id v4;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v2, "setValue:forKey:", v3, CFSTR("timestamp"));

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v2, "setValue:forKey:", v4, CFSTR("confidence"));

  return v2;
}

- (id)audioFileSettings
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDB1788];
  v5[0] = *MEMORY[0x24BDB1780];
  v5[1] = v2;
  v6[0] = &unk_24DDFECB0;
  v6[1] = &unk_24DDFECC8;
  v3 = *MEMORY[0x24BDB17A0];
  v5[2] = *MEMORY[0x24BDB1790];
  v5[3] = v3;
  v6[2] = MEMORY[0x24BDBD1C8];
  v6[3] = &unk_24DDFECE0;
  v5[4] = *MEMORY[0x24BDB17B8];
  v6[4] = &unk_24DDFECF8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)_reduceFileDirectorySize
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_3_0(&dword_21ACD4000, a2, a3, "Sorting files by date failed; continuing but may have unpredictable results.\nLast failure: %@",
    (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

uint64_t __62__AXSDUltronInternalRecordingManager__reduceFileDirectorySize__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v20;
  id obj;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "stringByAppendingPathComponent:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v10 + 40);
  objc_msgSend(v9, "attributesOfItemAtPath:error:", v7, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v10 + 40), obj);

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v20 = *(id *)(v13 + 40);
  objc_msgSend(v12, "attributesOfItemAtPath:error:", v8, &v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v13 + 40), v20);

  v15 = *MEMORY[0x24BDD0C58];
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDD0C58]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "compare:", v16);

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDetections, 0);
  objc_storeStrong((id *)&self->_detectionResultCollection, 0);
  objc_storeStrong((id *)&self->_audioRingBuffer, 0);
  objc_storeStrong((id *)&self->_fileProcessingQueue, 0);
  objc_storeStrong((id *)&self->_cleanupTimer, 0);
}

+ (void)_directory
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_21ACD4000, v0, v1, "Creating Ultron Directory", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)listenEngineFailedToStartWithError:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_5_0();
  _os_log_error_impl(&dword_21ACD4000, v0, OS_LOG_TYPE_ERROR, "Ultron Internal Recording Controller: Listen Engine failed to start.", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)saveDetectionResult:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "confidence");
  v6 = 138412546;
  v7 = a1;
  v8 = 2048;
  v9 = v5;
  _os_log_debug_impl(&dword_21ACD4000, a3, OS_LOG_TYPE_DEBUG, "Beginning audio save for: %@ with confidence %f", (uint8_t *)&v6, 0x16u);
  OUTLINED_FUNCTION_2_1();
}

- (void)_recordResultToFile:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_21ACD4000, a2, v4, "Recording result %@ to file.", v5);

  OUTLINED_FUNCTION_2_1();
}

void __58__AXSDUltronInternalRecordingManager__recordResultToFile___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_21ACD4000, a2, v4, "Unalbe to create JSON to write file for detection %@", v5);

  OUTLINED_FUNCTION_2_1();
}

void __58__AXSDUltronInternalRecordingManager__recordResultToFile___block_invoke_62_cold_1(char a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4[0] = 67109378;
  v4[1] = a1 & 1;
  v5 = 2112;
  v6 = v3;
  _os_log_debug_impl(&dword_21ACD4000, log, OS_LOG_TYPE_DEBUG, "Wrote data %d at %@.", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_2();
}

@end
