@implementation ASDDSPGraphUtilities

+ (BOOL)startRecordingBoxes:(id)a3 inGraph:(id)a4 toDirectory:(id)a5 error:(id *)a6
{
  return objc_msgSend(a1, "startRecordingBoxes:inGraph:toDirectory:withMode:error:", a3, a4, a5, 0, a6);
}

+ (BOOL)startRecordingBoxes:(id)a3 inGraph:(id)a4 toDirectory:(id)a5 withMode:(int64_t)a6 error:(id *)a7
{
  id v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  BOOL v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v42;
  uint64_t v43;
  id obj;
  uint64_t v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  id v55;
  uint64_t v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v46 = a3;
  v11 = a4;
  v48 = a5;
  v49 = v11;
  +[ASDDSPGraphUtilities stopRecordingBoxesInGraph:](ASDDSPGraphUtilities, "stopRecordingBoxesInGraph:", v11);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v48, 1, 0, a7);

  if (v13)
  {
    v42 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v42, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmmss"));
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "stringFromDate:", v14);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = +[ASDDSPGraphUtilities getCapturerOptions:](ASDDSPGraphUtilities, "getCapturerOptions:", a6);
    v17 = v16;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = v46;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (!v18)
    {
      v35 = 1;
      v20 = 1;
      goto LABEL_28;
    }
    v45 = *(_QWORD *)v51;
    v19 = v17;
    v20 = 1;
    while (1)
    {
      v43 = v18;
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v51 != v45)
          objc_enumerationMutation(obj);
        objc_msgSend(v49, "boxWithName:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
        {
          v24 = objc_msgSend(v22, "numOutputs") ? objc_msgSend(v23, "numOutputs") : objc_msgSend(v23, "numInputs");
          v25 = v24;
          if (v24 >= 1)
          {
            v26 = 0;
            while (v19)
            {
              if ((v15 & 4) != 0)
              {
                v27 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(v49, "name");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "name");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "stringWithFormat:", CFSTR("%@/%@_%@_bus%d.caf"), v48, v28, v29, v26);
                v30 = (void *)objc_claimAutoreleasedReturnValue();

                v31 = objc_msgSend(v23, "startRecordingPort:toFile:withAudioCapturerOptions:", v26, v30, v15);
LABEL_17:
                v20 = v31;

              }
              if (a7 && (v20 & 1) == 0)
              {
                v56 = *MEMORY[0x24BDD0FC8];
                v37 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(v23, "name");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "stringWithFormat:", CFSTR("%@ startRecordingPort was unsuccessful"), v38);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = v39;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
                v40 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASDDSPGraphUtilities"), -1, v40);
                *a7 = (id)objc_claimAutoreleasedReturnValue();

                v35 = 0;
                goto LABEL_28;
              }
              if (v25 == ++v26)
                goto LABEL_21;
            }
            v32 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v49, "name");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "name");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "stringWithFormat:", CFSTR("%@/%@_%@_bus%d_%@.caf"), v48, v33, v34, v26, v47);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            v31 = objc_msgSend(v23, "startRecordingPort:toFile:", v26, v30);
            goto LABEL_17;
          }
        }
LABEL_21:

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      v35 = 1;
      if (!v18)
      {
LABEL_28:

        if ((v35 & 1) != 0)
        {
          v36 = v20 & 1;
          goto LABEL_31;
        }
LABEL_30:
        v36 = 0;
        goto LABEL_31;
      }
    }
  }
  v36 = 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v55 = v48;
    _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to create path at: %@ for audio DSP captures.", buf, 0xCu);
    goto LABEL_30;
  }
LABEL_31:

  return v36;
}

+ (BOOL)startRecordingAllBoxesInGraph:(id)a3 fromStream:(id)a4 toDirectory:(id)a5 withType:(int64_t)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;
  int64_t v21;
  id *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v21 = a6;
  v22 = a7;
  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v10, "boxes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v24;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v17), "name", v21, v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }

  v19 = objc_msgSend(a1, "startRecordingBoxes:inGraph:fromStream:toDirectory:withType:error:", v13, v10, v11, v12, v21, v22);
  return v19;
}

+ (BOOL)startRecordingBoxes:(id)a3 inGraph:(id)a4 fromStream:(id)a5 toDirectory:(id)a6 withType:(int64_t)a7 error:(id *)a8
{
  return objc_msgSend(a1, "startRecordingBoxes:inGraph:fromStream:toDirectory:withType:andMode:error:", a3, a4, a5, a6, a7, 0, a8);
}

+ (BOOL)startRecordingBoxes:(id)a3 inGraph:(id)a4 fromStream:(id)a5 toDirectory:(id)a6 withType:(int64_t)a7 andMode:(int64_t)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;
  int v20;
  int v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  if (a7 == 1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v39) = 0;
      _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Start Recording Boxes with AudioDebugTypeReinitializeGraph...", (uint8_t *)&v39, 2u);
    }
    v20 = objc_msgSend(v17, "isRunning");
    if (v20)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v39) = 0;
        _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DSP stream was running, suspend processing to reinitialize graph...", (uint8_t *)&v39, 2u);
      }
      objc_msgSend(v17, "suspendProcessing");
    }
    v21 = objc_msgSend(v16, "initialized");
    if (v21)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v39) = 0;
        _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Uninitializing graph", (uint8_t *)&v39, 2u);
      }
      objc_msgSend(v16, "uninitialize");
    }
    v19 = objc_msgSend(a1, "startRecordingBoxes:inGraph:toDirectory:withMode:error:", v15, v16, v18, a8, a9);
    if (v21)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v39) = 0;
        _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Reinitializing graph", (uint8_t *)&v39, 2u);
      }
      if (objc_msgSend(v16, "initialize"))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v39 = 138412290;
          v40 = v15;
          _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Started recording %@", (uint8_t *)&v39, 0xCu);
        }
      }
      else
      {
        v22 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v22)
          +[ASDDSPGraphUtilities startRecordingBoxes:inGraph:fromStream:toDirectory:withType:andMode:error:].cold.3(v22, v23, v24, v25, v26, v27, v28, v29);
        +[ASDDSPGraphUtilities stopRecordingBoxesInGraph:](ASDDSPGraphUtilities, "stopRecordingBoxesInGraph:", v16);
        if ((objc_msgSend(v16, "initialize") & 1) == 0)
        {
          v30 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v30)
            +[ASDDSPGraphUtilities startRecordingBoxes:inGraph:fromStream:toDirectory:withType:andMode:error:].cold.2(v30, v31, v32, v33, v34, v35, v36, v37);
        }
      }
    }
    if (v20)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v39) = 0;
        _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DSP stream was running, resume processing after reinitialized graph...", (uint8_t *)&v39, 2u);
      }
      objc_msgSend(v17, "resumeProcessing");
    }
  }
  else if (a7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[ASDDSPGraphUtilities startRecordingBoxes:inGraph:fromStream:toDirectory:withType:andMode:error:].cold.1(a7);
    v19 = 0;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v39) = 0;
      _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Start Recording Boxes with AudioDebugTypeKeepGraphInitialized...", (uint8_t *)&v39, 2u);
    }
    v19 = objc_msgSend(a1, "startRecordingBoxes:inGraph:toDirectory:error:", v15, v16, v18, a9);
  }

  return v19;
}

+ (BOOL)stopRecordingBoxesInGraph:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a3, "boxes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v7, "numOutputs"))
          v8 = objc_msgSend(v7, "numOutputs");
        else
          v8 = objc_msgSend(v7, "numInputs");
        v9 = v8;
        if (v8 >= 1)
        {
          v10 = 0;
          do
            objc_msgSend(v7, "stopRecordingPort:", v10++);
          while (v9 != v10);
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  return 1;
}

+ (BOOL)startInjectingBoxes:(id)a3 inGraph:(id)a4 error:(id *)a5
{
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  __int128 v25;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  int v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v27 = a4;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v29;
    v10 = MEMORY[0x24BDACB70];
    *(_QWORD *)&v8 = 136315138;
    v25 = v8;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR(":"), v25);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v12, "count") >= 3)
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "intValue");

          objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count") == 4)
          {
            objc_msgSend(v12, "objectAtIndexedSubscript:", 3);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "BOOLValue");

          }
          else
          {
            v18 = 0;
          }
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v27, "name");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v33 = (uint64_t)v19;
            v34 = 2112;
            v35 = v13;
            v36 = 1024;
            v37 = v15;
            v38 = 2112;
            v39 = v16;
            v40 = 1024;
            v41 = v18;
            _os_log_impl(&dword_219C60000, v10, OS_LOG_TYPE_DEFAULT, "Injecting file to DSP graph: %@, box: %@, bus: %d, filePath: %@, shouldLoop: %d", buf, 0x2Cu);

          }
          objc_msgSend(v27, "boxWithName:", v13);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v20)
          {
            if ((objc_msgSend(v20, "startInjectingPort:toFile:shouldLoop:", v15, v16, v18) & 1) == 0)
            {

              v23 = 0;
              goto LABEL_21;
            }
          }
          else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v22 = objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
            *(_DWORD *)buf = v25;
            v33 = v22;
            _os_log_impl(&dword_219C60000, v10, OS_LOG_TYPE_DEFAULT, "Box %s doesn't exist in graph", buf, 0xCu);
          }

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
    }
    while (v7);
  }
  v23 = 1;
LABEL_21:

  return v23;
}

+ (BOOL)stopInjectingBoxesInGraph:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a3, "boxes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v7, "numOutputs"))
          v8 = objc_msgSend(v7, "numOutputs");
        else
          v8 = objc_msgSend(v7, "numInputs");
        v9 = v8;
        if (v8 >= 1)
        {
          v10 = 0;
          do
            objc_msgSend(v7, "stopInjectingPort:", v10++);
          while (v9 != v10);
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  return 1;
}

+ (optional<AudioCapturerOptions>)getCapturerOptions:(int64_t)a3
{
  uint64_t v3;
  _BOOL8 v4;
  optional<AudioCapturerOptions> result;

  if ((unint64_t)(a3 - 1) > 2)
  {
    v4 = 0;
    v3 = 0;
  }
  else
  {
    v3 = qword_219CC13D0[a3 - 1] | 4;
    v4 = 1;
  }
  result.var1 = v4;
  result.var0 = ($9006752AC5E43A2541EABBA7F54003FC)v3;
  return result;
}

+ (void)startRecordingBoxes:(uint64_t)a1 inGraph:fromStream:toDirectory:withType:andMode:error:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 134217984;
  v2 = a1;
  _os_log_error_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "The ASDDSPGraphAudioDebugType provided: %ld was invalid!", (uint8_t *)&v1, 0xCu);
}

+ (void)startRecordingBoxes:(uint64_t)a3 inGraph:(uint64_t)a4 fromStream:(uint64_t)a5 toDirectory:(uint64_t)a6 withType:(uint64_t)a7 andMode:(uint64_t)a8 error:.cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_219C60000, MEMORY[0x24BDACB70], a3, "Failed reinitialization again after disabling recording of boxes", a5, a6, a7, a8, 0);
}

+ (void)startRecordingBoxes:(uint64_t)a3 inGraph:(uint64_t)a4 fromStream:(uint64_t)a5 toDirectory:(uint64_t)a6 withType:(uint64_t)a7 andMode:(uint64_t)a8 error:.cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_219C60000, MEMORY[0x24BDACB70], a3, "Failed reinitialization with recording of boxes enabled", a5, a6, a7, a8, 0);
}

@end
