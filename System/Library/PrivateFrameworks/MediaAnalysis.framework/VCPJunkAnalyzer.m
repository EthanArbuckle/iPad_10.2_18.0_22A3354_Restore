@implementation VCPJunkAnalyzer

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  uint64_t (**v8)(_QWORD);
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _DWORD v27[2];
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v8 = (uint64_t (**)(_QWORD))a6;
  *a5 = 0;
  v9 = objc_alloc(MEMORY[0x1E0CEDF70]);
  v10 = (void *)objc_msgSend(v9, "initWithCVPixelBuffer:options:", a3, MEMORY[0x1E0C9AA70]);
  if (v10)
  {
    if (v8 && (v8[2](v8) & 1) != 0)
    {
      v11 = 0;
      v12 = -128;
    }
    else
    {
      v13 = objc_alloc_init(MEMORY[0x1E0CEDF48]);
      v11 = v13;
      if (v13
        && (objc_msgSend(v13, "setPreferBackgroundProcessing:", 1),
            v35[0] = v11,
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = objc_msgSend(v10, "performRequests:error:", v14, 0),
            v14,
            (v15 & 1) != 0))
      {
        objc_msgSend(v11, "results");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count") == 1;

        if (v17)
        {
          objc_msgSend(v11, "results");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v33 = CFSTR("JunkResults");
          v30 = CFSTR("attributes");
          v28 = CFSTR("junk");
          v20 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v19, "confidence");
          objc_msgSend(v20, "numberWithFloat:");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v22;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v23;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "results");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = 67109120;
          v27[1] = objc_msgSend(v25, "count");
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Junk analayzer - unexpected %d VNObservations", (uint8_t *)v27, 8u);

        }
        v12 = 0;
      }
      else
      {
        v12 = -18;
      }
    }
  }
  else
  {
    v11 = 0;
    v12 = -108;
  }

  return v12;
}

@end
