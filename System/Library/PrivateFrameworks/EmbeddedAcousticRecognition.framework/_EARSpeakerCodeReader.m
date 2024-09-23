@implementation _EARSpeakerCodeReader

- (void)getTrainingSpeakerCode:(id *)a3 inferenceSpeakerCode:(id *)a4 accumulatedGradient:(id *)a5 nnetVersion:(id *)a6 numFrames:(id *)a7 trainingOffset:(id *)a8 recognitionOffset:(id *)a9 language:(id)a10
{
  NSString *v16;
  NSObject *v17;
  EARLogger *v18;
  NSObject *v19;
  void *v20;
  int v21;
  uint64_t v22;
  EARLogger *v23;
  NSObject *v24;
  NSObject *v25;
  EARLogger *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  NSObject *v41;
  void *v42;
  id v43;
  id v44;
  uint8_t buf[4];
  NSObject *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v16 = (NSString *)a10;
  if (-[NSString length](v16, "length"))
  {
    getSpeakerCodeFilePath(v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (EARLogger *)-[NSObject length](v17, "length");
    if (!v18)
    {
      EARLogger::QuasarOSLogger(0);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AD756000, v24, OS_LOG_TYPE_INFO, "Failed to read speaker code file, path is null or empty", buf, 2u);
      }
      goto LABEL_39;
    }
    EARLogger::QuasarOSLogger(v18);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v17;
      _os_log_impl(&dword_1AD756000, v19, OS_LOG_TYPE_INFO, "Reading speaker code file from disk, full path: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "fileExistsAtPath:", v17);

    if (v21)
    {
      v44 = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v17, 0, &v44);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (EARLogger *)v44;
      v24 = v23;
      v42 = (void *)v22;
      if (v22)
      {
        v43 = 0;
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v22, 0, 0, &v43);
        v25 = objc_claimAutoreleasedReturnValue();
        v41 = v43;

        if (v25)
        {
          -[NSObject valueForKey:](v25, "valueForKey:", CFSTR("trainingSpeakerCode"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[NSObject valueForKey:](v25, "valueForKey:", CFSTR("trainingSpeakerCode"));
            v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            *a3 = v28;

          }
          else
          {
            *a3 = 0;
          }

          -[NSObject valueForKey:](v25, "valueForKey:", CFSTR("inferenceSpeakerCode"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[NSObject valueForKey:](v25, "valueForKey:", CFSTR("inferenceSpeakerCode"));
            v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            *a4 = v31;

          }
          else
          {
            *a4 = 0;
          }

          -[NSObject valueForKey:](v25, "valueForKey:", CFSTR("accumulatedGradient"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[NSObject valueForKey:](v25, "valueForKey:", CFSTR("accumulatedGradient"));
            v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            *a5 = v33;

          }
          else
          {
            *a5 = 0;
          }

          -[NSObject valueForKey:](v25, "valueForKey:", CFSTR("numTrainedFrames"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[NSObject valueForKey:](v25, "valueForKey:", CFSTR("numTrainedFrames"));
            v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            *a7 = v35;

          }
          else
          {
            *a7 = 0;
          }

          -[NSObject valueForKey:](v25, "valueForKey:", CFSTR("trainingNnetVersion"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[NSObject valueForKey:](v25, "valueForKey:", CFSTR("trainingNnetVersion"));
            v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            *a6 = v37;

          }
          else
          {
            *a6 = 0;
          }

          -[NSObject valueForKey:](v25, "valueForKey:", CFSTR("trainingOffset"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[NSObject valueForKey:](v25, "valueForKey:", CFSTR("trainingOffset"));
            v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            *a8 = v39;

          }
          else
          {
            *a8 = 0;
          }

          -[NSObject valueForKey:](v25, "valueForKey:", CFSTR("recognitionOffset"));
          v29 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[NSObject valueForKey:](v25, "valueForKey:", CFSTR("recognitionOffset"));
            v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            *a9 = v40;

          }
          else
          {
            *a9 = 0;
          }
        }
        else
        {
          EARLogger::QuasarOSLogger(v26);
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v41;
            _os_log_impl(&dword_1AD756000, v29, OS_LOG_TYPE_INFO, "Failed to deserialize speaker code file, error: %@", buf, 0xCu);
          }
        }

        v24 = v41;
      }
      else
      {
        EARLogger::QuasarOSLogger(v23);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v24;
          _os_log_impl(&dword_1AD756000, v25, OS_LOG_TYPE_INFO, "Failed to read speaker code file, error: %@", buf, 0xCu);
        }
      }

LABEL_39:
    }
  }
  else
  {
    EARLogger::QuasarOSLogger(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AD756000, v17, OS_LOG_TYPE_INFO, "Failed to read speaker code file, language is null or empty", buf, 2u);
    }
  }

}

@end
