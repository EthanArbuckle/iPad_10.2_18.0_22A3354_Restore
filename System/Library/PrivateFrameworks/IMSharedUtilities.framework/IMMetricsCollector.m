@implementation IMMetricsCollector

- (BOOL)trackEvent:(id)a3 withCount:(id)a4
{
  NSObject *v7;
  NSObject *metricsQueue;
  NSObject *v9;
  _QWORD block[7];
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v13 = a3;
      v14 = 2112;
      v15 = a4;
      _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "trackEvent %@ with count %@", buf, 0x16u);
    }
  }
  if (a4)
  {
    metricsQueue = self->_metricsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19E24ACFC;
    block[3] = &unk_1E3FB9CC0;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(metricsQueue, block);
  }
  else if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = a3;
      _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "IMMetricsCollector Nil count passed in for event %@", buf, 0xCu);
    }
  }
  return a4 != 0;
}

- (IMMetricsCollector)init
{
  IMMetricsCollector *v2;
  uint64_t *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMMetricsCollector;
  v2 = -[IMMetricsCollector init](&v6, sel_init);
  if (v2)
  {
    v2->_metricsQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.private.IMSharedUtilities.IMMetricsCollector", 0);
    v2->_diagnosticReporter = (SDRDiagnosticReporter *)objc_alloc_init((Class)MEMORY[0x1A1AE7D4C](CFSTR("SDRDiagnosticReporter"), CFSTR("SymptomDiagnosticReporter")));
    if (!qword_1ECFC7200)
    {
      v3 = (uint64_t *)MEMORY[0x1A1AE7D58]("kSymptomDiagnosticSignatureSubTypeContext", CFSTR("SymptomDiagnosticReporter"));
      if (v3)
        v4 = *v3;
      else
        v4 = 0;
      qword_1ECFC7200 = v4;
    }
  }
  return v2;
}

- (void)_trackEvent:(id)a3 withCount:(id)a4
{
  NSObject *v6;
  uint8_t v7[24];
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    if (qword_1ECFC70C0 != -1)
      dispatch_once(&qword_1ECFC70C0, &unk_1E3FB9DD8);
    if (off_1ECFC70B8)
    {
      ((void (*)(id, uint64_t))off_1ECFC70B8)(a3, objc_msgSend(a4, "integerValue"));
    }
    else if (IMOSLoggingEnabled())
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "IMMetricsCollector, Could not weak link AggdPushValueForDistributionKey", v7, 2u);
      }
    }
    v8 = CFSTR("count");
    v9[0] = a4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    AnalyticsSendEvent();
  }
}

+ (id)sharedInstance
{
  if (qword_1ECFC7690 != -1)
    dispatch_once(&qword_1ECFC7690, &unk_1E3FB9C70);
  return (id)qword_1ECFC75F0;
}

- (void)trackiMessageTranscodeWithReason:(unint64_t)a3 sourceFile:(id)a4 highQualityFile:(id)a5 lowQualityFile:(id)a6 sizeLimits:(id)a7 isSticker:(BOOL)a8 transcoded:(BOOL)a9 lowQualityModeEnabled:(BOOL)a10
{
  uint64_t v10;

  *(_WORD *)((char *)&v10 + 1) = __PAIR16__(a10, a9);
  LOBYTE(v10) = a8;
  -[IMMetricsCollector _trackTranscodeWithReason:messageType:sourceFile:highQualityFile:lowQualityFile:sizeLimits:isSticker:transcoded:lowQualityModeEnabled:](self, "_trackTranscodeWithReason:messageType:sourceFile:highQualityFile:lowQualityFile:sizeLimits:isSticker:transcoded:lowQualityModeEnabled:", a3, 1, a4, a5, a6, a7, v10);
}

- (void)trackiMessageTranscodeFailureWithReason:(unint64_t)a3 sourceFile:(id)a4 sizeLimits:(id)a5 isSticker:(BOOL)a6 lowQualityModeEnabled:(BOOL)a7
{
  MEMORY[0x1E0DE7D20](self, sel__trackTranscodeFailureWithReason_messageType_sourceFile_sizeLimits_isSticker_lowQualityModeEnabled_);
}

- (void)trackMMSTranscodeWithReason:(unint64_t)a3 sourceFile:(id)a4 highQualityFile:(id)a5 lowQualityFile:(id)a6 sizeLimits:(id)a7 transcoded:(BOOL)a8 lowQualityModeEnabled:(BOOL)a9
{
  uint64_t v9;

  BYTE2(v9) = a9;
  BYTE1(v9) = a8;
  LOBYTE(v9) = 0;
  -[IMMetricsCollector _trackTranscodeWithReason:messageType:sourceFile:highQualityFile:lowQualityFile:sizeLimits:isSticker:transcoded:lowQualityModeEnabled:](self, "_trackTranscodeWithReason:messageType:sourceFile:highQualityFile:lowQualityFile:sizeLimits:isSticker:transcoded:lowQualityModeEnabled:", a3, 2, a4, a5, a6, a7, v9);
}

- (void)trackMMSTranscodeFailureWithReason:(unint64_t)a3 sourceFile:(id)a4 sizeLimits:(id)a5 lowQualityModeEnabled:(BOOL)a6
{
  MEMORY[0x1E0DE7D20](self, sel__trackTranscodeFailureWithReason_messageType_sourceFile_sizeLimits_isSticker_lowQualityModeEnabled_);
}

- (void)trackRCSTranscodeWithReason:(unint64_t)a3 sourceFile:(id)a4 highQualityFile:(id)a5 lowQualityFile:(id)a6 sizeLimits:(id)a7 isSticker:(BOOL)a8 transcoded:(BOOL)a9 lowQualityModeEnabled:(BOOL)a10
{
  uint64_t v10;

  *(_WORD *)((char *)&v10 + 1) = __PAIR16__(a10, a9);
  LOBYTE(v10) = a8;
  -[IMMetricsCollector _trackTranscodeWithReason:messageType:sourceFile:highQualityFile:lowQualityFile:sizeLimits:isSticker:transcoded:lowQualityModeEnabled:](self, "_trackTranscodeWithReason:messageType:sourceFile:highQualityFile:lowQualityFile:sizeLimits:isSticker:transcoded:lowQualityModeEnabled:", a3, 3, a4, a5, a6, a7, v10);
}

- (void)trackRCSTranscodeFailureWithReason:(unint64_t)a3 sourceFile:(id)a4 sizeLimits:(id)a5 isSticker:(BOOL)a6 lowQualityModeEnabled:(BOOL)a7
{
  MEMORY[0x1E0DE7D20](self, sel__trackTranscodeFailureWithReason_messageType_sourceFile_sizeLimits_isSticker_lowQualityModeEnabled_);
}

- (void)_trackTranscodeWithReason:(unint64_t)a3 messageType:(unint64_t)a4 sourceFile:(id)a5 highQualityFile:(id)a6 lowQualityFile:(id)a7 sizeLimits:(id)a8 isSticker:(BOOL)a9 transcoded:(BOOL)a10 lowQualityModeEnabled:(BOOL)a11
{
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  __CFString *v36;
  __CFString *v37;
  BOOL IsSupportedAnimatedImage;
  __CFString *v39;
  _BOOL4 IsMovie;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;

  v61 = a5;
  v16 = a6;
  v17 = a7;
  v57 = a8;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0C99998];
  v20 = *MEMORY[0x1E0C998E0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0C99998], *MEMORY[0x1E0C998E0], 0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    objc_msgSend(v61, "resourceValuesForKeys:error:", v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
LABEL_3:
      objc_msgSend(v16, "resourceValuesForKeys:error:", v21, 0);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x1E0C9AA70];
    if (v16)
      goto LABEL_3;
  }
  v60 = (void *)MEMORY[0x1E0C9AA70];
LABEL_6:
  v58 = v17;
  v59 = v16;
  v56 = (void *)v21;
  if (v17)
  {
    objc_msgSend(v17, "resourceValuesForKeys:error:", v21, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = (void *)MEMORY[0x1E0C9AA70];
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v24, CFSTR("message_type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v25, CFSTR("transcode_reason"));

  objc_msgSend(v22, "objectForKey:", v20);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "objectForKey:", v20);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKey:", v20);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v22;
  objc_msgSend(v22, "objectForKey:", v19);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "objectForKey:", v19);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v23;
  objc_msgSend(v23, "objectForKey:", v19);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (a9)
    v31 = 3;
  else
    v31 = 0;
  objc_msgSend(v26, "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "length");

  if (!v33)
  {
    v35 = v57;
    v34 = v62;
    goto LABEL_26;
  }
  v34 = v62;
  if (a9)
  {
    v31 = 3;
  }
  else
  {
    objc_msgSend(v26, "identifier");
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!IMUTTypeIsImage(v36))
    {
      objc_msgSend(v26, "identifier");
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
      IsSupportedAnimatedImage = IMUTTypeIsSupportedAnimatedImage(v37);

      v35 = v57;
      if (IsSupportedAnimatedImage)
      {
        v31 = 1;
      }
      else
      {
        objc_msgSend(v26, "identifier");
        v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
        IsMovie = IMUTTypeIsMovie(v39);

        if (IsMovie)
          v31 = 2;
        else
          v31 = 0;
      }
      v34 = v62;
      goto LABEL_25;
    }

    v31 = 1;
  }
  v35 = v57;
LABEL_25:
  objc_msgSend(v26, "identifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v41, CFSTR("original_uttype"));

LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v42, CFSTR("attachment_type"));

  objc_msgSend(v34, "identifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "length");

  if (v44)
  {
    objc_msgSend(v34, "identifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v45, CFSTR("high_quality_uttype"));

  }
  objc_msgSend(v27, "identifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "length");

  if (v47)
  {
    objc_msgSend(v27, "identifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v48, CFSTR("low_quality_uttype"));

  }
  if (v28)
    objc_msgSend(v18, "setObject:forKey:", v28, CFSTR("original_size"));
  if (v29)
    objc_msgSend(v18, "setObject:forKey:", v29, CFSTR("high_quality_size_result"));
  if (v30)
    objc_msgSend(v18, "setObject:forKey:", v30, CFSTR("low_quality_size_result"));
  objc_msgSend(v35, "firstObject");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v35, "count") < 2)
  {
    v50 = 0;
  }
  else
  {
    objc_msgSend(v35, "objectAtIndex:", 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v49)
    objc_msgSend(v18, "setObject:forKey:", v49, CFSTR("high_quality_size_limit"));
  if (v50)
    objc_msgSend(v18, "setObject:forKey:", v50, CFSTR("low_quality_size_limit"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a11);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v51, CFSTR("low_quality_mode_enabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a10);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v52, CFSTR("was_transcoded"));

  -[IMMetricsCollector trackEvent:withDictionary:](self, "trackEvent:withDictionary:", CFSTR("com.apple.Messages.IMMetricsCollectorEventTranscodeAttachmentAttempt"), v18);
}

- (void)_trackTranscodeFailureWithReason:(unint64_t)a3 messageType:(unint64_t)a4 sourceFile:(id)a5 sizeLimits:(id)a6 isSticker:(BOOL)a7 lowQualityModeEnabled:(BOOL)a8
{
  _BOOL4 v8;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  __CFString *v25;
  __CFString *v26;
  BOOL IsSupportedAnimatedImage;
  __CFString *v28;
  _BOOL4 IsMovie;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  id v38;

  v35 = a8;
  v8 = a7;
  v38 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0C99998];
  v15 = *MEMORY[0x1E0C998E0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0C99998], *MEMORY[0x1E0C998E0], 0);
  v16 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v16;
  if (v38)
  {
    objc_msgSend(v38, "resourceValuesForKeys:error:", v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C9AA70];
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v18, CFSTR("message_type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v19, CFSTR("transcode_reason"));

  objc_msgSend(v17, "objectForKey:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v22 = 3;
  else
    v22 = 0;
  objc_msgSend(v20, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (v24)
  {
    if (v8)
    {
      v22 = 3;
    }
    else
    {
      objc_msgSend(v20, "identifier");
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (IMUTTypeIsImage(v25))
      {

      }
      else
      {
        objc_msgSend(v20, "identifier");
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        IsSupportedAnimatedImage = IMUTTypeIsSupportedAnimatedImage(v26);

        if (!IsSupportedAnimatedImage)
        {
          objc_msgSend(v20, "identifier");
          v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
          IsMovie = IMUTTypeIsMovie(v28);

          if (IsMovie)
            v22 = 2;
          else
            v22 = 0;
          goto LABEL_17;
        }
      }
      v22 = 1;
    }
LABEL_17:
    objc_msgSend(v20, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v30, CFSTR("original_uttype"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v31, CFSTR("attachment_type"));

  if (v21)
    objc_msgSend(v13, "setObject:forKey:", v21, CFSTR("original_size"));
  objc_msgSend(v12, "firstObject");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v12, "count") < 2)
  {
    v33 = 0;
    if (!v32)
      goto LABEL_25;
    goto LABEL_24;
  }
  objc_msgSend(v12, "objectAtIndex:", 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
LABEL_24:
    objc_msgSend(v13, "setObject:forKey:", v32, CFSTR("high_quality_size_limit"));
LABEL_25:
  if (v33)
    objc_msgSend(v13, "setObject:forKey:", v33, CFSTR("low_quality_size_limit"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v34, CFSTR("low_quality_mode_enabled"));

  -[IMMetricsCollector trackEvent:withDictionary:](self, "trackEvent:withDictionary:", CFSTR("com.apple.Messages.IMMetricsCollectorEventTranscodeAttachmentFailure"), v13);
}

- (void)trackAttachmentDownloadSuccess:(id)a3 limitType:(unint64_t)a4 limitSize:(id)a5 qualityType:(unint64_t)a6 isSticker:(BOOL)a7 lowQualityModeEnabled:(BOOL)a8
{
  _BOOL4 v8;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  __CFString *v25;
  __CFString *v26;
  BOOL IsSupportedAnimatedImage;
  __CFString *v28;
  _BOOL4 IsMovie;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  id v36;

  v34 = a8;
  v8 = a7;
  v36 = a3;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0C99998];
  v15 = *MEMORY[0x1E0C998E0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0C99998], *MEMORY[0x1E0C998E0], 0);
  v16 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v16;
  if (v36)
  {
    objc_msgSend(v36, "resourceValuesForKeys:error:", v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C9AA70];
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v18, CFSTR("limit_type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v19, CFSTR("quality_type"));

  objc_msgSend(v13, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("was_downloaded"));
  if (v12)
    objc_msgSend(v13, "setObject:forKey:", v12, CFSTR("size_limit"));
  objc_msgSend(v17, "objectForKey:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v22 = 3;
  else
    v22 = 0;
  objc_msgSend(v20, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (v24)
  {
    if (v8)
    {
      v22 = 3;
    }
    else
    {
      objc_msgSend(v20, "identifier");
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (IMUTTypeIsImage(v25))
      {

      }
      else
      {
        objc_msgSend(v20, "identifier");
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        IsSupportedAnimatedImage = IMUTTypeIsSupportedAnimatedImage(v26);

        if (!IsSupportedAnimatedImage)
        {
          objc_msgSend(v20, "identifier");
          v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
          IsMovie = IMUTTypeIsMovie(v28);

          if (IsMovie)
            v22 = 2;
          else
            v22 = 0;
          goto LABEL_19;
        }
      }
      v22 = 1;
    }
LABEL_19:
    objc_msgSend(v20, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v30, CFSTR("uttype"));

  }
  if (v21)
    objc_msgSend(v13, "setObject:forKey:", v21, CFSTR("attachment_size"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v31, CFSTR("attachment_type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v34);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v32, CFSTR("low_quality_mode_enabled"));

  -[IMMetricsCollector trackEvent:withDictionary:](self, "trackEvent:withDictionary:", CFSTR("com.apple.Messages.IMMetricsCollectorEventDownloadAttachmentAttempt"), v13);
}

- (void)trackAttachmentDownloadLimitExceeded:(unint64_t)a3 limitSize:(id)a4 fileSize:(id)a5 qualityType:(unint64_t)a6 isSticker:(BOOL)a7 lowQualityModeEnabled:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL4 v9;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v8 = a8;
  v9 = a7;
  v21 = a4;
  v14 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    objc_msgSend(v15, "setObject:forKey:", v21, CFSTR("size_limit"));
  if (v14)
    objc_msgSend(v15, "setObject:forKey:", v14, CFSTR("attachment_size"));
  if (v9)
    v16 = 3;
  else
    v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("attachment_type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v18, CFSTR("limit_type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v19, CFSTR("quality_type"));

  objc_msgSend(v15, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("was_downloaded"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v20, CFSTR("low_quality_mode_enabled"));

  -[IMMetricsCollector trackEvent:withDictionary:](self, "trackEvent:withDictionary:", CFSTR("com.apple.Messages.IMMetricsCollectorEventDownloadAttachmentAttempt"), v15);
}

- (void)trackAttachmentRenderingAttempt:(BOOL)a3 failureReason:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  __CFString *v10;

  v4 = a3;
  v10 = (__CFString *)a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("IsRenderingSuccessful"));
    v8 = &stru_1E3FBBA48;
    v9 = v7;
  }
  else
  {
    objc_msgSend(v6, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("IsRenderingSuccessful"));
    v9 = v7;
    v8 = v10;
  }
  objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("RenderingFailureReasons"));
  -[IMMetricsCollector trackEvent:withDictionary:](self, "trackEvent:withDictionary:", CFSTR("com.apple.Messages.IMMetricsCollectorEventRCSAttachmentRendering"), v7);

}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_metricsQueue);

  v3.receiver = self;
  v3.super_class = (Class)IMMetricsCollector;
  -[IMMetricsCollector dealloc](&v3, sel_dealloc);
}

- (void)_ADClientAddValueForScalarKeyApiInit
{
  if (qword_1ECFC7198 != -1)
    dispatch_once(&qword_1ECFC7198, &unk_1E3FB9D98);
  return off_1ECFC7190;
}

- (void)_ADClientPushValueForDistributionKeyApiInit
{
  if (qword_1ECFC7018 != -1)
    dispatch_once(&qword_1ECFC7018, &unk_1E3FB9DB8);
  return off_1ECFC7010;
}

- (void)_ADClientSetValueForScalarKeyApiInit
{
  if (qword_1ECFC70C0 != -1)
    dispatch_once(&qword_1ECFC70C0, &unk_1E3FB9DD8);
  return off_1ECFC70B8;
}

- (void)_trackEvent:(id)a3
{
  NSObject *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (qword_1ECFC7198 != -1)
      dispatch_once(&qword_1ECFC7198, &unk_1E3FB9D98);
    if (off_1ECFC7190)
    {
      off_1ECFC7190(a3, 1);
    }
    else if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "IMMetricsCollector, Could not weak link ADClientAddValueForScalarKey", v5, 2u);
      }
    }
    AnalyticsSendEvent();
  }
}

- (BOOL)trackEvent:(id)a3
{
  NSObject *v5;
  NSObject *metricsQueue;
  _QWORD v8[6];
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v10 = a3;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "trackEvent %@", buf, 0xCu);
    }
  }
  metricsQueue = self->_metricsQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_19E305A24;
  v8[3] = &unk_1E3FB9C98;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async(metricsQueue, v8);
  return 1;
}

- (void)_trackEvent:(id)a3 withStatistic:(id)a4
{
  void (*v6)(id);
  NSObject *v7;
  uint8_t v8[24];
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    if (qword_1ECFC7018 != -1)
      dispatch_once(&qword_1ECFC7018, &unk_1E3FB9DB8);
    v6 = (void (*)(id))off_1ECFC7010;
    if (off_1ECFC7010)
    {
      objc_msgSend(a4, "doubleValue");
      v6(a3);
    }
    else if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "IMMetricsCollector, Could not weak link AggdPushValueForDistributionKey", v8, 2u);
      }
    }
    v9 = CFSTR("statistic");
    v10[0] = a4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    AnalyticsSendEvent();
  }
}

- (BOOL)trackEvent:(id)a3 withStatistic:(id)a4
{
  NSObject *v7;
  int v8;
  NSObject *v9;
  NSObject *metricsQueue;
  _QWORD block[7];
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v14 = a3;
      v15 = 2112;
      v16 = a4;
      _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "trackEvent %@ withStatistic %@", buf, 0x16u);
    }
  }
  if (a4 && !objc_msgSend(a4, "isEqualToNumber:", objc_msgSend(MEMORY[0x1E0CB3598], "notANumber")))
  {
    metricsQueue = self->_metricsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19E305DD4;
    block[3] = &unk_1E3FB9CC0;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(metricsQueue, block);
    LOBYTE(v8) = 1;
  }
  else
  {
    v8 = IMOSLoggingEnabled();
    if (v8)
    {
      v9 = OSLogHandleForIMFoundationCategory();
      v8 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
      if (v8)
      {
        *(_DWORD *)buf = 138412290;
        v14 = a3;
        _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "IMMetricsCollector Nil statistic passed in for event %@", buf, 0xCu);
        LOBYTE(v8) = 0;
      }
    }
  }
  return v8;
}

- (BOOL)trackAction:(id)a3 extensionBundleID:(id)a4 isNotification:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v5 = a5;
  v12[3] = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(a4, "length");
  if (v9)
  {
    v9 = objc_msgSend(a3, "length");
    if (v9)
    {
      v11[0] = CFSTR("bundleID");
      v11[1] = CFSTR("action");
      v12[0] = a4;
      v12[1] = a3;
      v11[2] = CFSTR("isNotification");
      v12[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
      -[IMMetricsCollector _trackEvent:withDictionary:](self, "_trackEvent:withDictionary:", CFSTR("com.apple.Messages.IMMetricsCollectorMessageExtensionAction"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3));
      LOBYTE(v9) = 1;
    }
  }
  return v9;
}

- (void)_trackEvent:(id)a3 withDictionary:(id)a4
{
  if (a3)
  {
    if (a4)
      AnalyticsSendEvent();
  }
}

- (BOOL)trackEvent:(id)a3 withDictionary:(id)a4
{
  NSObject *v7;
  NSObject *metricsQueue;
  NSObject *v9;
  _QWORD block[7];
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v13 = a3;
      v14 = 2112;
      v15 = a4;
      _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "trackEvent %@ with dictionary %@", buf, 0x16u);
    }
  }
  if (a4)
  {
    metricsQueue = self->_metricsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19E306174;
    block[3] = &unk_1E3FB9CC0;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(metricsQueue, block);
  }
  else if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = a3;
      _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "IMMetricsCollector Nil dictionary passed in for event %@", buf, 0xCu);
    }
  }
  return a4 != 0;
}

- (void)autoBugCaptureWithSubType:(id)a3 errorPayload:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "*** Auto bug capture not supported ***", v5, 2u);
    }
  }
}

- (void)forceAutoBugCaptureWithSubType:(id)a3 errorPayload:(id)a4
{
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;

  v6 = (void *)objc_msgSend(a4, "userInfo");
  v7 = (__CFString *)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2938]);
  if (!-[__CFString length](v7, "length"))
    v7 = CFSTR("No context");
  if (v7 && (unint64_t)-[__CFString length](v7, "length") >= 0x37)
    v7 = (__CFString *)-[__CFString substringToIndex:](v7, "substringToIndex:", 54);
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = objc_msgSend(a4, "domain");
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%@-%@"), v9, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a4, "code")), v7);
  MEMORY[0x1E0DE7D20](self, sel_forceAutoBugCaptureWithSubType_errorPayload_type_context_);
}

- (void)forceAutoBugCaptureWithSubType:(id)a3 errorPayload:(id)a4 type:(id)a5 context:(id)a6
{
  MEMORY[0x1E0DE7D20](self, sel_forceAutoBugCaptureWithSubType_errorPayload_type_context_metadata_);
}

- (void)forceAutoBugCaptureWithSubType:(id)a3 errorPayload:(id)a4 type:(id)a5 context:(id)a6 metadata:(id)a7
{
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void (*v19)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  NSObject *metricsQueue;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD block[10];
  int buf;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKeyedSubscript:", CFSTR("__PPT_ForTesting"))&& objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance"), "isInternalInstall"))
  {
    v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D20C10], "sharedInstance"), "wiFiActiveAndReachable");
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = (void *)objc_msgSend(MEMORY[0x1E0D36B20], "sharedInstance");
    if (v13)
      v16 = 2;
    else
      v16 = 3;
    v25 = objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "linkQualityValueForInterfaceType:", v16));
    v17 = (void *)objc_msgSend(a4, "userInfo");
    v18 = (void *)objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0CB3388]);
    if (qword_1EE503BC0[0] != -1)
      dispatch_once(qword_1EE503BC0, &unk_1E3FB9CE0);
    v19 = (void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1EE503BB8;
    if (off_1EE503BB8)
    {
      v24 = objc_msgSend(a4, "domain");
      v23 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a4, "code"));
      v20 = objc_msgSend(v18, "domain");
      v19(a3, v24, v23, v20, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v18, "code")), v25);
    }
    if (self->_diagnosticReporter)
    {
      metricsQueue = self->_metricsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_19E306688;
      block[3] = &unk_1E3FB9D30;
      block[4] = self;
      block[5] = a5;
      block[6] = a3;
      block[7] = a6;
      block[8] = a4;
      block[9] = a7;
      dispatch_async(metricsQueue, block);
    }
    else if (IMOSLoggingEnabled())
    {
      v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19E239000, v22, OS_LOG_TYPE_INFO, "IMMetricsCollector could not get diagnostic reporter class", (uint8_t *)&buf, 2u);
      }
    }
  }
}

- (void)metricAttachmentValidation:(BOOL)a3 attachmentSize:(id)a4 operationalErrorDomain:(id)a5 operationalErrorCode:(id)a6 validationErrorDomain:(id)a7 validationErrorCode:(id)a8
{
  _BOOL8 v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint8_t buf[16];

  v13 = a3;
  v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D20C10], "sharedInstance"), "wiFiActiveAndReachable");
  if (v14)
    v15 = 2;
  else
    v15 = 3;
  v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D36B20], "sharedInstance"), "linkQualityValueForInterfaceType:", v15));
  if (qword_1EE5044F8 != -1)
    dispatch_once(&qword_1EE5044F8, &unk_1E3FB9D50);
  if (off_1EE5044F0)
  {
    if (v14)
      v17 = 2;
    else
      v17 = 1;
    ((void (*)(_BOOL8, id, id, id, id, id, uint64_t, uint64_t))off_1EE5044F0)(v13, a4, a5, a6, a7, a8, v16, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17));
  }
  else if (IMOSLoggingEnabled())
  {
    v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E239000, v18, OS_LOG_TYPE_INFO, "We failed to weak link FTAWDLogIMessageCloudKitValidatePurgeableAttachment to validate metric", buf, 2u);
    }
  }
}

- (void)trackSpamEvent:(unint64_t)a3
{
  MEMORY[0x1E0DE7D20](self, sel_trackSpamEvent_withDictionary_);
}

- (void)trackSpamEvent:(unint64_t)a3 withDictionary:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = -[IMMetricsCollector _stringForSpamType:](self, "_stringForSpamType:", a3);
  if (v6)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v6, CFSTR("type"));
    v8 = v7;
    if (a4)
      objc_msgSend(v7, "addEntriesFromDictionary:", a4);
    -[IMMetricsCollector trackEvent:withDictionary:](self, "trackEvent:withDictionary:", CFSTR("com.apple.Messages.IMMetricsCollectorEventInternationalSpam"), v8);
  }
}

- (id)_stringForSpamType:(unint64_t)a3
{
  if (a3 - 1 > 0x1F)
    return 0;
  else
    return off_1E3FB9DF8[a3 - 1];
}

- (void)trackiMessageJunkEvent:(unint64_t)a3
{
  MEMORY[0x1E0DE7D20](self, sel_trackiMessageJunkEvent_withDictionary_);
}

- (void)trackiMessageJunkEvent:(unint64_t)a3 withDictionary:(id)a4
{
  id v6;
  uint64_t v7;
  _QWORD v8[6];

  v6 = -[IMMetricsCollector _stringForiMessageJunkType:](self, "_stringForiMessageJunkType:", a3);
  if (v6)
  {
    v7 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v6, CFSTR("type"));
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_19E306D70;
    v8[3] = &unk_1E3FB9D78;
    v8[4] = self;
    v8[5] = v7;
    objc_msgSend(a4, "enumerateKeysAndObjectsUsingBlock:", v8);
    -[IMMetricsCollector trackEvent:withDictionary:](self, "trackEvent:withDictionary:", CFSTR("com.apple.Messages.IMMetricsCollectorEventOscar"), v7);
  }
}

- (id)_stringForiMessageJunkType:(unint64_t)a3
{
  if (a3 - 1 > 0xF)
    return 0;
  else
    return off_1E3FB9EF8[a3 - 1];
}

- (void)trackDeleteMessages:(id)a3 sourceType:(unint64_t)a4
{
  char v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a3, "isEqualToNumber:", &unk_1E3FFE6A8);
  if (a4 && (v7 & 1) == 0)
  {
    v14[0] = CFSTR("source_type");
    v14[1] = CFSTR("count_messages");
    v15[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v15[1] = a3;
    v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = 138412546;
        v11 = a3;
        v12 = 2112;
        v13 = -[IMMetricsCollector _stringForDeleteMessagesType:](self, "_stringForDeleteMessagesType:", a4);
        _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Delete Messages Metrics | Delete %@ messages from %@", (uint8_t *)&v10, 0x16u);
      }
    }
    -[IMMetricsCollector trackEvent:withDictionary:](self, "trackEvent:withDictionary:", CFSTR("com.apple.Messages.IMMetricsCollectorEventDeleteMessages"), v8);
  }
}

- (unint64_t)keepMessagesSourceTypeForDays:(int64_t)a3
{
  NSObject *v5;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3 == 30)
    return 2;
  if (a3 == 365)
    return 3;
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 134217984;
      v7 = a3;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Delete Messages Metrics | unknown type of keep messages days: %lld", (uint8_t *)&v6, 0xCu);
    }
  }
  return 0;
}

- (id)_stringForDeleteMessagesType:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return 0;
  else
    return off_1E3FB9F78[a3 - 1];
}

- (OS_dispatch_queue)metricsQueue
{
  return self->_metricsQueue;
}

- (void)setMetricsQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
