@implementation ANProcessAudio

+ (BOOL)process:(id)a3 to:(id)a4 withOptions:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  BOOL v34;
  NSObject *v35;
  id v36;
  void *v37;
  NSObject *v38;
  id v39;
  void *v41;
  void *v42;
  _BYTE buf[22];
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDB1810]), "initForReading:error:", v9, a6);
    if (!v12)
    {
      ANLogHandleAudioProcessor();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = *a6;
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = &stru_24D370F00;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v9;
        v44 = 2112;
        v45 = v36;
        _os_log_impl(&dword_2156FF000, v35, OS_LOG_TYPE_ERROR, "%@Failed to open file %@, %@", buf, 0x20u);
      }

      v34 = 0;
      goto LABEL_33;
    }
    v13 = (void *)v12;
    +[ANProcessAudio _lookupComponent:](ANProcessAudio, "_lookupComponent:", 1);
    v14 = objc_alloc(MEMORY[0x24BDB18B8]);
    memset(buf, 0, 20);
    v15 = objc_msgSend(v14, "initWithAudioComponentDescription:", buf);
    if (v15)
    {
      v16 = v15;
      v17 = (void *)objc_opt_new();
      v18 = (void *)objc_opt_new();
      if (+[ANProcessAudio _configureEngine:player:effect:sourceFile:error:](ANProcessAudio, "_configureEngine:player:effect:sourceFile:error:", v18, v17, v16, v13, a6))
      {
        v41 = v17;
        v42 = v11;
        v19 = objc_alloc(MEMORY[0x24BDB1810]);
        objc_msgSend(v13, "fileFormat");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "settings");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v19, "initForWriting:settings:error:", v10, v21, a6);

        ANLogHandleAudioProcessor();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v22)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v25 = objc_msgSend(v22, "length");
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = &stru_24D370F00;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v25;
            _os_log_impl(&dword_2156FF000, v24, OS_LOG_TYPE_DEFAULT, "%@Ouput File Frames Before: %lld", buf, 0x16u);
          }

          +[ANProcessAudio _renderAudioTo:length:engine:error:](ANProcessAudio, "_renderAudioTo:length:engine:error:", v22, objc_msgSend(v13, "length"), v18, a6);
          ANLogHandleAudioProcessor();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138413058;
            *(_QWORD *)&buf[4] = &stru_24D370F00;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v9;
            v44 = 2112;
            v45 = v10;
            v46 = 2112;
            v47 = v18;
            _os_log_impl(&dword_2156FF000, v26, OS_LOG_TYPE_DEBUG, "%@Process file: %@ to %@ with engine %@", buf, 0x2Au);
          }

          ANLogHandleAudioProcessor();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x24BDBCE60], "date");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "timeIntervalSinceDate:", v42);
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = &stru_24D370F00;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "+[ANProcessAudio process:to:withOptions:error:]";
            v44 = 2048;
            v45 = v29;
            _os_log_impl(&dword_2156FF000, v27, OS_LOG_TYPE_INFO, "%@%s: took %f", buf, 0x20u);

          }
          objc_msgSend(v41, "stop");
          objc_msgSend(v18, "stop");
          objc_msgSend(v18, "detachNode:", v41);
          objc_msgSend(v18, "detachNode:", v16);

          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1810]), "initForReading:error:", v10, a6);
          ANLogHandleAudioProcessor();
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = v31;
          if (v30)
          {
            v11 = v42;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              v33 = objc_msgSend(v30, "length");
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = &stru_24D370F00;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v33;
              _os_log_impl(&dword_2156FF000, v32, OS_LOG_TYPE_DEFAULT, "%@Ouput File Frames After: %lld", buf, 0x16u);
            }

            v16 = 0;
            v34 = 1;
            goto LABEL_32;
          }
          v11 = v42;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = &stru_24D370F00;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = 0;
            _os_log_impl(&dword_2156FF000, v32, OS_LOG_TYPE_ERROR, "%@Failed to open output file for reading (post-processing) %@", buf, 0x16u);
          }

          v16 = 0;
        }
        else
        {
          v11 = v42;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = &stru_24D370F00;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = 0;
            _os_log_impl(&dword_2156FF000, v24, OS_LOG_TYPE_ERROR, "%@Failed to open output file %@", buf, 0x16u);
          }

        }
      }
      else
      {
        ANLogHandleAudioProcessor();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v39 = *a6;
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = &stru_24D370F00;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v39;
          _os_log_impl(&dword_2156FF000, v38, OS_LOG_TYPE_ERROR, "%@Could not configure the engine %@", buf, 0x16u);
        }

      }
    }
    else
    {

      ANLogHandleAudioProcessor();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        +[ANProcessAudio _ANAudioEffectToName:](ANProcessAudio, "_ANAudioEffectToName:", 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = &stru_24D370F00;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v37;
        _os_log_impl(&dword_2156FF000, v16, OS_LOG_TYPE_ERROR, "%@Could not find AudioUnit for %@", buf, 0x16u);

      }
    }
    v34 = 0;
LABEL_32:

LABEL_33:
    goto LABEL_34;
  }
  v34 = 0;
LABEL_34:

  return v34;
}

+ (BOOL)_configureEngine:(id)a3 player:(id)a4 effect:(id)a5 sourceFile:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  NSObject *v36;
  id v37;
  id v39;
  id *v40;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  const __CFString *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v14, "processingFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v11, "enableManualRenderingMode:format:maximumFrameCount:error:", 0, v15, 4096, a7);

  if ((v16 & 1) != 0)
  {
    v40 = a7;
    v41 = v14;
    objc_msgSend(v11, "attachNode:", v12);
    v42 = v12;
    v39 = v12;
    +[ANProcessAudio _lookupTunings:](ANProcessAudio, "_lookupTunings:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v44 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v17, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "floatValue");
          v25 = v24;
          objc_msgSend(v13, "AUAudioUnit");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "parameterTree");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "parameterWithAddress:", objc_msgSend(v22, "unsignedIntegerValue"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v29) = v25;
          objc_msgSend(v28, "setValue:", v29);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v19);
    }
    objc_msgSend(v11, "attachNode:", v13);
    v14 = v41;
    objc_msgSend(v41, "processingFormat");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "connect:to:format:", v39, v13, v30);

    v31 = v13;
    objc_msgSend(v11, "mainMixerNode");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "processingFormat");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "connect:to:format:", v31, v32, v33);

    objc_msgSend(v39, "scheduleFile:atTime:completionHandler:", v41, 0, 0);
    v34 = objc_msgSend(v11, "startAndReturnError:", v40);
    if ((v34 & 1) != 0)
    {
      objc_msgSend(v39, "play");
    }
    else
    {
      ANLogHandleAudioProcessor();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = *v40;
        *(_DWORD *)buf = 138412546;
        v49 = &stru_24D370F00;
        v50 = 2112;
        v51 = v37;
        _os_log_impl(&dword_2156FF000, v36, OS_LOG_TYPE_ERROR, "%@Could not start the engine %@", buf, 0x16u);
      }

    }
    v12 = v42;

  }
  else
  {
    ANLogHandleAudioProcessor();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v35 = *a7;
      *(_DWORD *)buf = 138412546;
      v49 = &stru_24D370F00;
      v50 = 2112;
      v51 = v35;
      _os_log_impl(&dword_2156FF000, v31, OS_LOG_TYPE_ERROR, "%@Failed to configure for offline render mode %@", buf, 0x16u);
    }
    v34 = 0;
  }

  return v34;
}

+ (AudioComponentDescription)_lookupComponent:(SEL)a3
{
  *(_QWORD *)&retstr->componentType = 0;
  *(_QWORD *)&retstr->componentManufacturer = 0;
  retstr->componentFlagsMask = 0;
  if (a4 == 1)
    qmemcpy(retstr, "xfuamndllppa", 12);
  return result;
}

+ (id)_lookupTunings:(unint64_t)a3
{
  void *v3;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (a3 == 1)
  {
    v5 = &unk_24D3797F0;
    v6[0] = &unk_24D379918;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)_ANAudioEffectToName:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("N/A");
  if (a3 == 1)
    v3 = CFSTR("AppleAUNormalizer");
  if (a3)
    return (id)v3;
  else
    return CFSTR("None");
}

+ (BOOL)_renderAudioTo:(id)a3 length:(int64_t)a4 engine:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  BOOL v21;
  uint64_t v22;
  NSObject *v23;
  id v25;
  id v26;
  uint8_t buf[4];
  const __CFString *v28;
  __int16 v29;
  int64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  ANLogHandleAudioProcessor();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v28 = &stru_24D370F00;
    v29 = 2048;
    v30 = a4;
    _os_log_impl(&dword_2156FF000, v11, OS_LOG_TYPE_DEFAULT, "%@Rendering Audio with length: %lld", buf, 0x16u);
  }

  v12 = objc_alloc(MEMORY[0x24BDB1838]);
  objc_msgSend(v10, "manualRenderingFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithPCMFormat:frameCapacity:", v13, objc_msgSend(v10, "manualRenderingMaximumFrameCount"));

  v15 = 0;
  while (1)
  {
    if (objc_msgSend(v10, "manualRenderingSampleTime") >= a4)
    {
      v21 = 1;
      goto LABEL_17;
    }
    v16 = a4 - objc_msgSend(v10, "manualRenderingSampleTime");
    v17 = objc_msgSend(v14, "frameCapacity");
    v18 = v17 >= v16 ? v16 : v17;
    v26 = v15;
    v19 = objc_msgSend(v10, "renderOffline:toBuffer:error:", v18, v14, &v26);
    v20 = v26;

    v21 = v19 != 0;
    if (v19)
      break;
    v25 = v20;
    v22 = objc_msgSend(v9, "writeFromBuffer:error:", v14, &v25);
    v15 = v25;

    if ((v22 & 1) == 0)
    {
      ANLogHandleAudioProcessor();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v28 = &stru_24D370F00;
        v29 = 2112;
        v30 = (int64_t)v15;
        _os_log_impl(&dword_2156FF000, v23, OS_LOG_TYPE_ERROR, "%@error when writing out audio to file: %@", buf, 0x16u);
      }
      v20 = v15;
      goto LABEL_16;
    }
  }
  ANLogHandleAudioProcessor();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v28 = &stru_24D370F00;
    v29 = 2112;
    v30 = (int64_t)v20;
    _os_log_impl(&dword_2156FF000, v23, OS_LOG_TYPE_ERROR, "%@error when rendering status: %@", buf, 0x16u);
  }
LABEL_16:

  v15 = v20;
LABEL_17:

  if (a6)
    *a6 = objc_retainAutorelease(v15);

  return v21;
}

@end
