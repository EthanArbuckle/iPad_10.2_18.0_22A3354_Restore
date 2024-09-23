@implementation HFCameraClipExporter

+ (id)userFriendlyExportURLForCameraName:(id)a3 withStartDate:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0CB3578];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM-d-y-hh:mm:ss-a-z"));
  objc_msgSend(v9, "stringFromDate:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_exportableCameraName:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@.mp4"), v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("-"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR(","), &stru_1EA741FF8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("-"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x12uLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v15;
    _os_log_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_DEFAULT, "Attempt to generate export url using string:%@", buf, 0xCu);
  }

  v17 = (void *)MEMORY[0x1E0C99E98];
  +[HFUtilities cachesDirectoryURL](HFUtilities, "cachesDirectoryURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "URLWithString:relativeToURL:", v15, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (BOOL)hasCachedRecordingForCameraClip:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  BOOL v17;
  id v19;
  uint8_t buf[4];
  double v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[HFCameraUtilities videoDestinationURLForCameraClip:](HFCameraUtilities, "videoDestinationURLForCameraClip:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraClipExporter durationOfCachedRecordingForCameraClip:](HFCameraClipExporter, "durationOfCachedRecordingForCameraClip:", v3);
  if (v5 != 0.0)
  {
    v6 = v5;
    objc_msgSend(v3, "duration");
    if (v7 != 0.0)
    {
      objc_msgSend(v3, "duration");
      v9 = v6 / v8;
      HFLogForCategory(0x12uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "duration");
        *(_DWORD *)buf = 134218496;
        v21 = v6;
        v22 = 2048;
        v23 = v11;
        v24 = 2048;
        v25 = v9 * 100.0;
        _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "Cached recording duration (%0.2f/%0.2f) is %0.2f percent downloaded.", buf, 0x20u);
      }

      if (v9 >= 0.95)
      {
        v17 = 1;
        goto LABEL_14;
      }
      HFLogForCategory(0x12uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_ERROR, "Truncated video file detected. Removing.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      objc_msgSend(v13, "removeItemAtPath:error:", v14, &v19);
      v15 = v19;

      if (v15)
      {
        HFLogForCategory(0x12uLL);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v21 = *(double *)&v15;
          v22 = 2112;
          v23 = v4;
          _os_log_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_DEFAULT, "Error:%@ removing file:%@", buf, 0x16u);
        }

      }
    }
  }
  v17 = 0;
LABEL_14:

  return v17;
}

+ (double)durationOfCachedRecordingForCameraClip:(id)a3
{
  void *v3;
  double v4;
  double v5;

  +[HFCameraUtilities videoDestinationURLForCameraClip:](HFCameraUtilities, "videoDestinationURLForCameraClip:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraUtilities durationOfRecordingAtURL:](HFCameraUtilities, "durationOfRecordingAtURL:", v3);
  v5 = v4;

  return v5;
}

+ (id)_exportableCameraName:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v4);
  v7 = v6;

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", v5, v7, &stru_1EA741FF8);
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v8;
  }
  return v3;
}

@end
