@implementation _EARSpeakerCodeWriter

- (void)setTrainingSpeakerCode:(id)a3 inferenceSpeakerCode:(id)a4 accumulatedGradient:(id)a5 nnetVersion:(unint64_t)a6 numFrames:(unint64_t)a7 trainingOffset:(unint64_t)a8 recognitionOffset:(unint64_t)a9 language:(id)a10
{
  id v15;
  id v16;
  id v17;
  NSString *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  EARLogger *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  EARLogger *v28;
  EARLogger *v29;
  NSObject *v30;
  char v31;
  EARLogger *v32;
  EARLogger *v33;
  const char *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  id v38;
  NSObject *v39;
  EARLogger *v40;
  id v41;
  uint8_t buf[4];
  NSObject *v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  unint64_t v47;
  __int16 v48;
  unint64_t v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = (NSString *)a10;
  if (!objc_msgSend(v15, "length"))
  {
    EARLogger::QuasarOSLogger(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      goto LABEL_32;
    *(_WORD *)buf = 0;
    v34 = "Failed to write speaker code file, training speaker code is null or empty";
LABEL_21:
    _os_log_impl(&dword_1AD756000, v19, OS_LOG_TYPE_INFO, v34, buf, 2u);
    goto LABEL_32;
  }
  if (!objc_msgSend(v16, "length"))
  {
    EARLogger::QuasarOSLogger(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      goto LABEL_32;
    *(_WORD *)buf = 0;
    v34 = "Failed to write speaker code file, inference speaker code is null or empty";
    goto LABEL_21;
  }
  if (!objc_msgSend(v17, "length"))
  {
    EARLogger::QuasarOSLogger(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      goto LABEL_32;
    *(_WORD *)buf = 0;
    v34 = "Failed to write speaker code file, accumulated gradient is null or empty";
    goto LABEL_21;
  }
  if (-[NSString length](v18, "length"))
  {
    getSpeakerCodeFilePath(v18);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!-[NSObject length](v19, "length"))
    {
      EARLogger::QuasarOSLogger(0);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AD756000, v35, OS_LOG_TYPE_INFO, "Failed to write speaker code file, path is null or empty", buf, 2u);
      }
      goto LABEL_31;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v39 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v39, "setObject:forKey:", v15, CFSTR("trainingSpeakerCode"));
    -[NSObject setObject:forKey:](v39, "setObject:forKey:", v16, CFSTR("inferenceSpeakerCode"));
    -[NSObject setObject:forKey:](v39, "setObject:forKey:", v17, CFSTR("accumulatedGradient"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v39, "setObject:forKey:", v20, CFSTR("numTrainedFrames"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v39, "setObject:forKey:", v21, CFSTR("trainingNnetVersion"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v39, "setObject:forKey:", v22, CFSTR("trainingOffset"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v39, "setObject:forKey:", v23, CFSTR("recognitionOffset"));

    EARLogger::QuasarOSLogger(v24);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v15, "substringToIndex:", 64);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "substringToIndex:", 64);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "substringToIndex:", 64);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413826;
      v43 = v19;
      v44 = 2048;
      v45 = a7;
      v46 = 2048;
      v47 = a8;
      v48 = 2048;
      v49 = a9;
      v50 = 2112;
      v51 = v38;
      v52 = 2112;
      v53 = v37;
      v54 = 2112;
      v55 = v26;
      _os_log_impl(&dword_1AD756000, v25, OS_LOG_TYPE_INFO, "Saving speaker code file on disk, full path: %@, num trained frames: %zu, training offset: %zu, recognition offset: %zu, training speaker code: %@, inference speaker code: %@, accumulated gradient: %@", buf, 0x48u);

    }
    v41 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v39, 200, 0, &v41);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (EARLogger *)v41;
    v29 = v28;
    if (v27)
    {
      EARLogger::QuasarOSLogger(v28);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        -[_EARSpeakerCodeWriter setTrainingSpeakerCode:inferenceSpeakerCode:accumulatedGradient:nnetVersion:numFrames:trainingOffset:recognitionOffset:language:].cold.1((uint64_t)v19, v30);

      v40 = v29;
      v31 = objc_msgSend(v27, "writeToFile:options:error:", v19, 1073741825, &v40);
      v32 = v40;

      if ((v31 & 1) != 0)
      {
        v29 = v32;
LABEL_30:

        v35 = v39;
LABEL_31:

        goto LABEL_32;
      }
      EARLogger::QuasarOSLogger(v33);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v32;
        _os_log_impl(&dword_1AD756000, v36, OS_LOG_TYPE_INFO, "Failed to write speaker code data, error: %@", buf, 0xCu);
      }
      v29 = v32;
    }
    else
    {
      EARLogger::QuasarOSLogger(v28);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v29;
        _os_log_impl(&dword_1AD756000, v36, OS_LOG_TYPE_INFO, "Failed to serialize speaker code data, error: %@", buf, 0xCu);
      }
    }

    goto LABEL_30;
  }
  EARLogger::QuasarOSLogger(0);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v34 = "Failed to write speaker code file, language is null or empty";
    goto LABEL_21;
  }
LABEL_32:

}

- (void)setTrainingSpeakerCode:(uint64_t)a1 inferenceSpeakerCode:(NSObject *)a2 accumulatedGradient:nnetVersion:numFrames:trainingOffset:recognitionOffset:language:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1AD756000, a2, OS_LOG_TYPE_DEBUG, "Speaker code data is serialized, writing to file: %@", (uint8_t *)&v2, 0xCu);
}

@end
