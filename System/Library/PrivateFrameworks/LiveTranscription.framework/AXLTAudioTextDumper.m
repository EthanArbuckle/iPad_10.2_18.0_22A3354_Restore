@implementation AXLTAudioTextDumper

+ (AXLTAudioTextDumper)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_4);
  return (AXLTAudioTextDumper *)(id)sharedInstance__shared_0;
}

void __37__AXLTAudioTextDumper_sharedInstance__block_invoke()
{
  AXLTAudioTextDumper *v0;
  void *v1;

  v0 = objc_alloc_init(AXLTAudioTextDumper);
  v1 = (void *)sharedInstance__shared_0;
  sharedInstance__shared_0 = (uint64_t)v0;

}

- (AXLTAudioTextDumper)init
{
  id v2;
  void *v3;
  int v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AXLTAudioTextDumper;
  v2 = -[AXLTAudioTextDumper init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("saveTranscribedTextAndAudio"));
    if (v4)
      LOBYTE(v4) = +[AXLTAudioTextDumper isInternalInstall](AXLTAudioTextDumper, "isInternalInstall");
    *((_BYTE *)v2 + 8) = v4;

    AXLogLiveTranscription();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[AXLTAudioTextDumper init].cold.2((unsigned __int8 *)v2 + 8, v5);

    if (*((_BYTE *)v2 + 8))
    {
      v6 = dispatch_queue_create("com.apple.accessibility.LiveTranscriptione.audioOutTranscriberSaveQueue", 0);
      v7 = (void *)*((_QWORD *)v2 + 5);
      *((_QWORD *)v2 + 5) = v6;

      NSTemporaryDirectory();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)*((_QWORD *)v2 + 4);
      *((_QWORD *)v2 + 4) = v8;

      AXLogLiveTranscription();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[AXLTAudioTextDumper init].cold.1((uint64_t *)v2 + 4, v10, v11);

    }
  }
  return (AXLTAudioTextDumper *)v2;
}

- (void)saveAudioBuffer:(id)a3 appName:(id)a4 sessionStartTime:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *saveQueue;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_dumpTestData)
  {
    saveQueue = self->_saveQueue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __64__AXLTAudioTextDumper_saveAudioBuffer_appName_sessionStartTime___block_invoke;
    v12[3] = &unk_24F8750D8;
    v12[4] = self;
    v13 = v8;
    v14 = v9;
    v15 = v10;
    dispatch_async(saveQueue, v12);

  }
}

void __64__AXLTAudioTextDumper_saveAudioBuffer_appName_sessionStartTime___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;

  objc_msgSend(*(id *)(a1 + 32), "audioFile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = 0;
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd_HH-mm-ss"));
    objc_msgSend(*(id *)(a1 + 40), "format");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "settings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1463899717);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDB1588]);

    objc_msgSend(*(id *)(a1 + 32), "filePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v4, "stringFromDate:", *(_QWORD *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("audio_%@_%@.wav"), v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    AXLogLiveTranscription();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __64__AXLTAudioTextDumper_saveAudioBuffer_appName_sessionStartTime___block_invoke_cold_2();

    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x24BDB1810]);
    objc_msgSend(*(id *)(a1 + 40), "format");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "commonFormat");
    objc_msgSend(*(id *)(a1 + 40), "format");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v21 = (void *)objc_msgSend(v17, "initForWriting:settings:commonFormat:interleaved:error:", v16, v7, v19, objc_msgSend(v20, "isInterleaved"), &v27);
    v3 = v27;
    objc_msgSend(*(id *)(a1 + 32), "setAudioFile:", v21);

    if (v3)
    {
      AXLogLiveTranscription();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        __64__AXLTAudioTextDumper_saveAudioBuffer_appName_sessionStartTime___block_invoke_cold_1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "audioFile");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *(_QWORD *)(a1 + 40);
  v26 = v3;
  objc_msgSend(v23, "writeFromBuffer:error:", v24, &v26);
  v25 = v26;

}

- (void)saveTranscribedText:(id)a3 appName:(id)a4 sessionStartTime:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *saveQueue;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_dumpTestData && objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    saveQueue = self->_saveQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68__AXLTAudioTextDumper_saveTranscribedText_appName_sessionStartTime___block_invoke;
    block[3] = &unk_24F875100;
    block[4] = self;
    v15 = v9;
    v16 = v10;
    v17 = v11;
    v18 = v8;
    v13 = v11;
    dispatch_async(saveQueue, block);

  }
}

void __68__AXLTAudioTextDumper_saveTranscribedText_appName_sessionStartTime___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "textFileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd_HH-mm-ss"));
    objc_msgSend(*(id *)(a1 + 32), "filePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDD17C8];
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "stringFromDate:", *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("transcribed_text_%@_%@.txt"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTextFileName:", v10);

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "textFileName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createFileAtPath:contents:attributes:", v12, 0, 0);

    AXLogLiveTranscription();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __68__AXLTAudioTextDumper_saveTranscribedText_appName_sessionStartTime___block_invoke_cold_1(v2, v13);

  }
  v14 = (void *)MEMORY[0x24BDD1578];
  objc_msgSend(*(id *)(a1 + 32), "textFileName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fileHandleForUpdatingAtPath:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "seekToEndOfFile");
  v17 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v17, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  objc_msgSend(v17, "stringFromDate:", *(_QWORD *)(a1 + 56));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@ %@ %@\n"), v18, CFSTR("Speech"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dataUsingEncoding:", 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "writeData:", v20);
  objc_msgSend(v16, "closeFile");

}

- (void)cleanUp
{
  NSObject *saveQueue;
  _QWORD block[5];

  if (self->_dumpTestData)
  {
    saveQueue = self->_saveQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __30__AXLTAudioTextDumper_cleanUp__block_invoke;
    block[3] = &unk_24F874E30;
    block[4] = self;
    dispatch_async(saveQueue, block);
  }
}

uint64_t __30__AXLTAudioTextDumper_cleanUp__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTextFileName:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setAudioFile:", 0);
}

+ (BOOL)isInternalInstall
{
  if (isInternalInstall__AXIsInternalInstallOnceToken != -1)
    dispatch_once(&isInternalInstall__AXIsInternalInstallOnceToken, &__block_literal_global_24);
  return isInternalInstall__AXIsInternalInstall;
}

uint64_t __40__AXLTAudioTextDumper_isInternalInstall__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_ui();
  isInternalInstall__AXIsInternalInstall = result;
  return result;
}

- (AVAudioFile)audioFile
{
  return self->_audioFile;
}

- (void)setAudioFile:(id)a3
{
  objc_storeStrong((id *)&self->_audioFile, a3);
}

- (NSString)textFileName
{
  return self->_textFileName;
}

- (void)setTextFileName:(id)a3
{
  objc_storeStrong((id *)&self->_textFileName, a3);
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_filePath, a3);
}

- (OS_dispatch_queue)saveQueue
{
  return self->_saveQueue;
}

- (void)setSaveQueue:(id)a3
{
  objc_storeStrong((id *)&self->_saveQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveQueue, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_textFileName, 0);
  objc_storeStrong((id *)&self->_audioFile, 0);
}

- (void)init
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22D27A000, a2, v4, "Should dump test data: %@", v5);

  OUTLINED_FUNCTION_9();
}

void __64__AXLTAudioTextDumper_saveAudioBuffer_appName_sessionStartTime___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_22D27A000, v0, OS_LOG_TYPE_ERROR, "error %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __64__AXLTAudioTextDumper_saveAudioBuffer_appName_sessionStartTime___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22D27A000, v0, v1, "Audio file path is %@", v2);
  OUTLINED_FUNCTION_1();
}

void __68__AXLTAudioTextDumper_saveTranscribedText_appName_sessionStartTime___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "textFileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22D27A000, a2, v4, "Text log file path is %@", v5);

  OUTLINED_FUNCTION_9();
}

@end
