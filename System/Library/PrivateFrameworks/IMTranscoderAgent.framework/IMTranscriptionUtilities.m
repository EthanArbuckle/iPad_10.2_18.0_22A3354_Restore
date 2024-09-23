@implementation IMTranscriptionUtilities

+ (void)transcribeAudioForAudioTransferURL:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  id v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  id v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[4];
  id v68;
  uint8_t *v69;
  _QWORD *v70;
  _QWORD *v71;
  _QWORD v72[4];
  _QWORD v73[4];
  uint8_t buf[8];
  uint8_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  __CFString *v79;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDE9E40]);
    if ((objc_msgSend_supportsOnDeviceRecognition(v7, v8, v9, v10, v11, v12, v13) & 1) != 0)
    {
      objc_msgSend_setDefaultTaskHint_(v7, v14, 1, v15, v16, v17, v18);
      if ((objc_msgSend_isAvailable(v7, v19, v20, v21, v22, v23, v24) & 1) != 0)
      {
        v25 = objc_alloc(MEMORY[0x24BDE9E48]);
        v31 = (void *)objc_msgSend_initWithURL_(v25, v26, (uint64_t)v5, v27, v28, v29, v30);
        objc_msgSend_setRequiresOnDeviceRecognition_(v31, v32, 1, v33, v34, v35, v36);
        objc_msgSend_setAddsPunctuation_(v31, v37, 1, v38, v39, v40, v41);
        objc_msgSend_setShouldReportPartialResults_(v31, v42, 0, v43, v44, v45, v46);
        *(_QWORD *)buf = 0;
        v75 = buf;
        v76 = 0x3032000000;
        v77 = sub_21DFC5DA4;
        v78 = sub_21DFC5DB4;
        v79 = &stru_24E2000B0;
        v73[0] = 0;
        v73[1] = v73;
        v73[2] = 0x2020000000;
        v73[3] = 0;
        v72[0] = 0;
        v72[1] = v72;
        v72[2] = 0x2020000000;
        v72[3] = 0;
        v67[0] = MEMORY[0x24BDAC760];
        v67[1] = 3221225472;
        v67[2] = sub_21DFC5DBC;
        v67[3] = &unk_24E1FF848;
        v68 = v6;
        v69 = buf;
        v70 = v73;
        v71 = v72;
        v51 = (id)objc_msgSend_recognitionTaskWithRequest_resultHandler_(v7, v47, (uint64_t)v31, (uint64_t)v67, v48, v49, v50);

        _Block_object_dispose(v72, 8);
        _Block_object_dispose(v73, 8);
        _Block_object_dispose(buf, 8);

LABEL_17:
        goto LABEL_18;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v62, OS_LOG_TYPE_INFO, "Speech recognizer is not available.", buf, 2u);
        }

      }
      v63 = objc_alloc(MEMORY[0x24BDD1540]);
      v61 = objc_msgSend_initWithDomain_code_userInfo_(v63, v64, (uint64_t)CFSTR("__kIMTranscriptionGenerationErrorDomain"), 2, 0, v65, v66);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFB1000, v56, OS_LOG_TYPE_INFO, "Speech recognizer does not support on device recognition. There are likely missing assets.", buf, 2u);
        }

      }
      v57 = objc_alloc(MEMORY[0x24BDD1540]);
      v61 = objc_msgSend_initWithDomain_code_userInfo_(v57, v58, (uint64_t)CFSTR("__kIMTranscriptionGenerationErrorDomain"), 1, 0, v59, v60);
    }
    v31 = (void *)v61;
    (*((void (**)(id, _QWORD, uint64_t))v6 + 2))(v6, 0, v61);
    goto LABEL_17;
  }
  v52 = objc_alloc(MEMORY[0x24BDD1540]);
  v7 = (id)objc_msgSend_initWithDomain_code_userInfo_(v52, v53, (uint64_t)CFSTR("__kIMTranscriptionGenerationErrorDomain"), 0, 0, v54, v55);
  (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v7);
LABEL_18:

}

+ (id)localizedSeparatorString
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;

  objc_msgSend_transcoderBundle(IMTranscriptionUtilities, a2, v2, v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_autoupdatingCurrentLocale(MEMORY[0x24BDBCEA0], v8, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localeIdentifier(v14, v15, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend_localizations(v7, v23, v24, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferredLanguages(MEMORY[0x24BDBCEA0], v30, v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferredLocalizationsFromArray_forPreferences_(v22, v37, (uint64_t)v29, (uint64_t)v36, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v41, v42, v43, v44, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
    objc_msgSend_localizedStringForKey_value_table_localization_(v7, v49, (uint64_t)CFSTR("SPEECH_PAUSE_SEPARATOR_BETWEEN_2_PARTS_OF_SENTENCE"), 0, (uint64_t)CFSTR("TranscriptionStrings"), (uint64_t)v48, v50);
  else
    objc_msgSend_localizedStringForKey_value_table_localization_(v7, v49, (uint64_t)CFSTR("SPEECH_PAUSE_SEPARATOR_BETWEEN_2_PARTS_OF_SENTENCE"), 0, (uint64_t)CFSTR("TranscriptionStrings"), (uint64_t)v21, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  return v51;
}

+ (id)transcoderBundle
{
  if (qword_2553B4018 != -1)
    dispatch_once(&qword_2553B4018, &unk_24E1FF658);
  return (id)qword_2553B4010;
}

+ (void)commitTranscriptionWithString:(id)a3 confidenceSum:(double)a4 numberOfSegments:(unint64_t)a5 completion:(id)a6
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (**v16)(id, id, _QWORD);
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  int v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v16 = (void (**)(id, id, _QWORD))a6;
  if (a5)
  {
    if (objc_msgSend_length(v9, v10, v11, v12, v13, v14, v15))
    {
      if (a4 / (double)a5 >= 0.6)
      {
        v16[2](v16, v9, 0);
        goto LABEL_20;
      }
      v17 = objc_alloc(MEMORY[0x24BDD1540]);
      v21 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v17, v18, (uint64_t)CFSTR("__kIMTranscriptionGenerationErrorDomain"), 4, 0, v19, v20);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v33 = 138412290;
          v34 = v21;
          _os_log_impl(&dword_21DFB1000, v22, OS_LOG_TYPE_INFO, "The transcription has a low confidence score, it is likely the audio was in a different language to the system language: %@", (uint8_t *)&v33, 0xCu);
        }

      }
    }
    else
    {
      v28 = objc_alloc(MEMORY[0x24BDD1540]);
      v21 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v28, v29, (uint64_t)CFSTR("__kIMTranscriptionGenerationErrorDomain"), 3, 0, v30, v31);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v33 = 138412290;
          v34 = v21;
          _os_log_impl(&dword_21DFB1000, v32, OS_LOG_TYPE_INFO, "The transcription has no text: %@", (uint8_t *)&v33, 0xCu);
        }

      }
    }
  }
  else
  {
    v23 = objc_alloc(MEMORY[0x24BDD1540]);
    v21 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v23, v24, (uint64_t)CFSTR("__kIMTranscriptionGenerationErrorDomain"), 5, 0, v25, v26);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v33 = 138412290;
        v34 = v21;
        _os_log_impl(&dword_21DFB1000, v27, OS_LOG_TYPE_INFO, "There are no segments to transcribe: %@", (uint8_t *)&v33, 0xCu);
      }

    }
  }
  ((void (**)(id, id, void *))v16)[2](v16, 0, v21);

LABEL_20:
}

@end
