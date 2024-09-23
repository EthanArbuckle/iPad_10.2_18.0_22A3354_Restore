@implementation ANAnnouncementDataItem(AudioProcessing)

- (uint64_t)processAudioWithEffects:()AudioProcessing error:
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  double v20;
  char v21;
  NSObject *v22;
  NSObject *v23;
  double v24;
  double v25;
  NSObject *v26;
  void *v27;
  _BOOL8 v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  NSObject *v39;
  NSObject *v40;
  double v41;
  void *v42;
  char v43;
  int v45;
  const __CFString *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  double v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (objc_msgSend(a1, "type") == 1)
    {
      objc_msgSend(a1, "data");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = (void *)MEMORY[0x1E0CF7E48];
        objc_msgSend(a1, "data");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *MEMORY[0x1E0CF7C78];
        v11 = (void *)objc_opt_new();
        objc_msgSend(v11, "UUIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "createTemporaryFileWithData:extension:directory:", v9, v10, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v14 = (void *)MEMORY[0x1E0CF7E48];
          v15 = (void *)objc_opt_new();
          objc_msgSend(v15, "UUIDString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "createTemporaryURLWithFileExtension:directory:", v10, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            if (a4)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 1041, *MEMORY[0x1E0CF7C48]);
              v28 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v28 = 0;
            }
LABEL_48:

            return v28;
          }
          ANLogHandleAnnouncementDataItem_AudioProcessing();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v13, "audioDuration");
            objc_msgSend(v19, "numberWithDouble:");
            v20 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            v45 = 138412802;
            v46 = &stru_1E93913D0;
            v47 = 2112;
            v48 = v13;
            v49 = 2112;
            v50 = v20;
            _os_log_impl(&dword_1D23A0000, v18, OS_LOG_TYPE_DEFAULT, "%@Process Audio Input File: %@, Duration: %@", (uint8_t *)&v45, 0x20u);

          }
          v21 = objc_msgSend(MEMORY[0x1E0CF7E70], "process:to:withOptions:error:", v13, v17, a3, a4);
          ANLogHandleAnnouncementDataItem_AudioProcessing();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if ((v21 & 1) == 0)
          {
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              v33 = *a4;
              v45 = 138412546;
              v46 = &stru_1E93913D0;
              v47 = 2112;
              v48 = v33;
              _os_log_impl(&dword_1D23A0000, v23, OS_LOG_TYPE_ERROR, "%@Failed to process audio data. Error = %@", (uint8_t *)&v45, 0x16u);
            }

            +[ANAnalytics shared](ANAnalytics, "shared");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "error:", 5019);

            goto LABEL_30;
          }
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v45 = 138412290;
            v46 = &stru_1E93913D0;
            _os_log_impl(&dword_1D23A0000, v23, OS_LOG_TYPE_DEFAULT, "%@Audio Processed Succesfully", (uint8_t *)&v45, 0xCu);
          }

          objc_msgSend(v17, "audioDuration");
          v25 = v24;
          ANLogHandleAnnouncementDataItem_AudioProcessing();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v45 = 138412802;
            v46 = &stru_1E93913D0;
            v47 = 2112;
            v48 = v17;
            v49 = 2048;
            v50 = v25;
            _os_log_impl(&dword_1D23A0000, v26, OS_LOG_TYPE_DEFAULT, "%@Process Audio Output File: %@, Duration = %f seconds", (uint8_t *)&v45, 0x20u);
          }

          if (v25 > 0.0)
          {
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v17, 2, a4);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v27 != 0;
            if (v27)
            {
              objc_msgSend(a1, "setData:", v27);
            }
            else
            {
              ANLogHandleAnnouncementDataItem_AudioProcessing();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                v41 = *(double *)a4;
                v45 = 138412802;
                v46 = &stru_1E93913D0;
                v47 = 2112;
                v48 = v17;
                v49 = 2112;
                v50 = v41;
                _os_log_impl(&dword_1D23A0000, v40, OS_LOG_TYPE_ERROR, "%@Failed to load data from file: URL = %@, Error = %@", (uint8_t *)&v45, 0x20u);
              }

            }
            goto LABEL_46;
          }
          objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v35, "BOOLForDefault:", *MEMORY[0x1E0CF7BA8]))
          {
            v36 = objc_msgSend(MEMORY[0x1E0CF7E98], "isInternalBuild");

            if (!v36)
              goto LABEL_35;
            objc_msgSend(MEMORY[0x1E0CF7E88], "sharedUtil");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "speakText:", CFSTR("Audio Processing output file is empty. Please file a radar."));
          }

LABEL_35:
          objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "BOOLForDefault:", *MEMORY[0x1E0CF7C10]);

          if (v38)
          {
            ANLogHandleAnnouncementDataItem_AudioProcessing();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              v45 = 138412290;
              v46 = &stru_1E93913D0;
              _os_log_impl(&dword_1D23A0000, v39, OS_LOG_TYPE_ERROR, "%@Processed audio file is empty. Using original file.", (uint8_t *)&v45, 0xCu);
            }

            v28 = 1;
            goto LABEL_46;
          }
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 1044, *MEMORY[0x1E0CF7C48]);
            v28 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_46:
            objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "BOOLForDefault:", *MEMORY[0x1E0CF7B98]);

            if ((v43 & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CF7E48], "removeItem:", v13);
              objc_msgSend(MEMORY[0x1E0CF7E48], "removeItem:", v17);
            }
            goto LABEL_48;
          }
LABEL_30:
          v28 = 0;
          goto LABEL_46;
        }
      }
      if (a4)
      {
        v30 = (void *)MEMORY[0x1E0CB35C8];
        v31 = *MEMORY[0x1E0CF7C48];
        v32 = 5016;
        goto LABEL_23;
      }
    }
    else if (a4)
    {
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CF7C48];
      v32 = 1042;
LABEL_23:
      objc_msgSend(v30, "an_errorWithCode:component:", v32, v31);
      v28 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return v28;
    }
    return 0;
  }
  ANLogHandleAnnouncementDataItem_AudioProcessing();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v45 = 138412290;
    v46 = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v29, OS_LOG_TYPE_DEFAULT, "%@No effects set. Skipping Audio Processing.", (uint8_t *)&v45, 0xCu);
  }

  return 1;
}

@end
