@implementation SGDetectedAttributeDissector

- (SGDetectedAttributeDissector)initWithML:(id)a3 withMLQR:(id)a4 andHealthStore:(id)a5
{
  id v9;
  id v10;
  id v11;
  SGDetectedAttributeDissector *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  SGContactPipelineHelper *contactsHelper;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  float v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSSet *hmmTrustedLanguages;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSSet *ddTrustedLanguages;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSSet *coreNLPTrustedLanguages;
  objc_super v38;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v38.receiver = self;
  v38.super_class = (Class)SGDetectedAttributeDissector;
  v12 = -[SGDetectedAttributeDissector init](&v38, sel_init);
  if (v12)
  {
    +[SGDetectedAttributeDissector patterns](SGDetectedAttributeDissector, "patterns");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "rawValueForKey:", CFSTR("SelfIdentMsgCount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_selfIdentificationMessageCount = objc_msgSend(v14, "unsignedIntegerValue");

    objc_storeStrong((id *)&v12->_ml, a3);
    objc_storeStrong((id *)&v12->_mlQR, a4);
    +[SGContactPipelineHelper sharedInstance](SGContactPipelineHelper, "sharedInstance");
    v15 = objc_claimAutoreleasedReturnValue();
    contactsHelper = v12->_contactsHelper;
    v12->_contactsHelper = (SGContactPipelineHelper *)v15;

    +[SGDetectedAttributeDissector patterns](SGDetectedAttributeDissector, "patterns");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "rawValueForKey:", CFSTR("FilterWithAddressBook"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_filterWithAddressBook = objc_msgSend(v18, "BOOLValue");

    +[SGDetectedAttributeDissector patterns](SGDetectedAttributeDissector, "patterns");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "rawValueForKey:", CFSTR("UnlikelyPhoneSampling"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatValue");
    v12->_unlikelyPhoneSamplingRate = v21;

    objc_storeStrong((id *)&v12->_healthStore, a5);
    v22 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(MEMORY[0x1E0D19EC8], "signatureRules");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D19DD8]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v22, "initWithArray:", v24);
    hmmTrustedLanguages = v12->_hmmTrustedLanguages;
    v12->_hmmTrustedLanguages = (NSSet *)v25;

    v27 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(MEMORY[0x1E0D19EC8], "signatureRules");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x1E0D19DD0]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v27, "initWithArray:", v29);
    ddTrustedLanguages = v12->_ddTrustedLanguages;
    v12->_ddTrustedLanguages = (NSSet *)v30;

    v32 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(MEMORY[0x1E0D19EC8], "nameDetectorRules");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", *MEMORY[0x1E0D19DC8]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v32, "initWithArray:", v34);
    coreNLPTrustedLanguages = v12->_coreNLPTrustedLanguages;
    v12->_coreNLPTrustedLanguages = (NSSet *)v35;

  }
  return v12;
}

- (SGDetectedAttributeDissector)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SGQuickResponsesML *v8;
  NSObject *v9;
  SGDetectedAttributeDissector *v10;
  uint8_t v12[16];

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)MEMORY[0x1E0D81080];
  +[SGPaths suggestionsDirectory](SGPaths, "suggestionsDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharedSingletonWithDirectory:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = -[SGQuickResponsesML initWithTraining:]([SGQuickResponsesML alloc], "initWithTraining:", v7);
  }
  else
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_fault_impl(&dword_1C3607000, v9, OS_LOG_TYPE_FAULT, "Failed to retrieve PMLTraining singleton", v12, 2u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria())
      abort();
    v8 = 0;
  }
  v10 = -[SGDetectedAttributeDissector initWithML:withMLQR:andHealthStore:](self, "initWithML:withMLQR:andHealthStore:", v3, v8, v4);

  return v10;
}

- (id)detectionFromSignatureDDMatch:(id)a3 message:(id)a4 detectedLabelRange:(_NSRange *)a5 lastClaimedLabelRange:(_NSRange)a6 isUnlikelyPhone:(BOOL)a7
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  unint64_t v35;
  id v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  void *v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  __int128 *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v64;
  uint64_t v65;
  id v66;
  NSUInteger v67;
  NSUInteger v68;
  SGDetectedAttributeDissector *v69;
  void *context;
  _NSRange *v71;
  BOOL v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  uint64_t v80;
  NSRange v81;

  length = a6.length;
  location = a6.location;
  v80 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = 0;
  v16 = objc_msgSend(v13, "matchType");
  switch((int)v16)
  {
    case 0:
      v71 = a5;
      v72 = a7;
      context = (void *)MEMORY[0x1C3BD4F6C]();
      v77 = xmmword_1C385A570;
      v78 = xmmword_1C385A570;
      v17 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v14, "textContent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v13, "range");
      objc_msgSend(v18, "substringWithRange:", v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v17);
      v69 = self;
      -[SGDetectedAttributeDissector detailTypeFromPrefix:detectedLabelPointer:](self, "detailTypeFromPrefix:detectedLabelPointer:", v21, &v78);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if ((_QWORD)v78 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v22 = objc_msgSend(v13, "range");
        *(_QWORD *)&v78 = v78 + v22;
      }
      v23 = objc_msgSend(v13, "range");
      v25 = v23 + v24;
      objc_msgSend(v14, "textContent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "length");

      if (v25 >= v27)
      {
        a5 = v71;
      }
      else
      {
        v66 = v15;
        v67 = location;
        v68 = length;
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        objc_msgSend(v14, "plainTextDetectedData");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
        if (v29)
        {
          v30 = v29;
          v31 = 0;
          v32 = *(_QWORD *)v74;
          do
          {
            for (i = 0; i != v30; ++i)
            {
              if (*(_QWORD *)v74 != v32)
                objc_enumerationMutation(v28);
              v34 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
              if (objc_msgSend(v34, "range") >= v25)
              {
                if (!v31 || (v35 = objc_msgSend(v34, "range"), v35 < objc_msgSend(v31, "range")))
                {
                  v36 = v34;

                  v31 = v36;
                }
              }
            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
          }
          while (v30);
        }
        else
        {
          v31 = 0;
        }

        objc_msgSend(v14, "textContent");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "textContent");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v37, "rangeOfString:options:range:", CFSTR("\n"), 0, v25 - 1, objc_msgSend(v38, "length") - (v25 - 1));

        objc_msgSend(v14, "textContent");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "length");

        if (v39 >= v41)
          v42 = v41;
        else
          v42 = v39;
        if (v31)
        {
          length = v68;
          v43 = v66;
          if (objc_msgSend(v31, "valueRange") == 0x7FFFFFFFFFFFFFFFLL)
            v44 = objc_msgSend(v31, "range");
          else
            v44 = objc_msgSend(v31, "valueRange");
          location = v67;
          if (v44 < v42)
            v42 = v44;
        }
        else
        {
          location = v67;
          length = v68;
          v43 = v66;
        }
        v45 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v14, "textContent");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "substringWithRange:", v25, v42 - v25);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v45);
        -[SGDetectedAttributeDissector detailTypeFromPrefix:detectedLabelPointer:](v69, "detailTypeFromPrefix:detectedLabelPointer:", v47, &v77);
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = (void *)v48;
        if (v48)
          v50 = (void *)v48;
        else
          v50 = v43;
        v51 = v50;
        v52 = v43;
        v15 = v51;

        if ((_QWORD)v77 != 0x7FFFFFFFFFFFFFFFLL)
          *(_QWORD *)&v77 = v77 + v25;

        a5 = v71;
        if ((_QWORD)v77 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v53 = &v77;
          goto LABEL_39;
        }
      }
      v53 = &v78;
LABEL_39:
      *a5 = (_NSRange)*v53;
      objc_autoreleasePoolPop(context);
      goto LABEL_40;
    case 1:
    case 2:
      v72 = a7;
      v15 = 0;
      goto LABEL_41;
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
      goto LABEL_45;
    default:
      v72 = a7;
LABEL_40:
      v16 = 0;
LABEL_41:
      v81.location = location;
      v81.length = length;
      if (NSIntersectionRange(v81, *a5).length)
        v54 = 0;
      else
        v54 = v15;
      v55 = v54;

      objc_msgSend(MEMORY[0x1E0D19820], "extractionInfoWithExtractionType:modelVersion:confidence:", 1, 0, 0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "textContent");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v13, "valueRange");
      v60 = v59;
      objc_msgSend(v13, "valueString");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "labelRange");
      LOBYTE(v65) = v72;
      LOBYTE(v64) = v62 != 0;
      +[SGDetection detectionWithType:text:matchRange:matchString:label:hasPhoneLabel:extractionInfo:isUnlikelyPhone:](SGDetection, "detectionWithType:text:matchRange:matchString:label:hasPhoneLabel:extractionInfo:isUnlikelyPhone:", v16, v57, v58, v60, v61, v55, v64, v56, v65);
      v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_45:
      return v15;
  }
}

- (id)detectionFromBodyDDMatch:(id)a3 message:(id)a4 withSupervisionToFill:(id)a5 isUnlikelyPhone:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  const __CFString *v19;
  __CFString *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  void *context;
  uint8_t buf[8];
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  SGDetectedAttributeDissector *v37;
  uint64_t *v38;
  BOOL v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__20702;
  v44 = __Block_byref_object_dispose__20703;
  v45 = 0;
  v13 = objc_msgSend(v10, "valueRange");
  objc_msgSend(v10, "valueRange");
  v15 = v14;
  objc_msgSend(v11, "textContent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  textToMatch(v13, v15 + v13, v16, objc_msgSend(v10, "matchType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v10, "matchType")
    || objc_msgSend(v10, "matchType") == 1
    || objc_msgSend(v10, "matchType") == 3)
  {
    context = (void *)MEMORY[0x1C3BD4F6C]();
    v18 = objc_msgSend(v10, "matchType");
    v19 = CFSTR("MyAddress/F");
    if (v18 == 3)
      v19 = CFSTR("BirthdayDate/F");
    if (v18)
      v20 = (__CFString *)v19;
    else
      v20 = CFSTR("MyPhone/F");
    regex2ForKey(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "matchType"))
      v22 = CFSTR("NotMyAddress/F");
    else
      v22 = CFSTR("NotMyPhone/F");
    regex2ForKey(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __103__SGDetectedAttributeDissector_detectionFromBodyDDMatch_message_withSupervisionToFill_isUnlikelyPhone___block_invoke;
    v31[3] = &unk_1E7DAF860;
    v24 = v12;
    v32 = v24;
    v25 = v23;
    v33 = v25;
    v34 = v17;
    v35 = v10;
    v38 = &v40;
    v36 = v11;
    v37 = self;
    v39 = a6;
    objc_msgSend(v21, "enumerateMatchesInString:ngroups:block:", v34, 0, v31);
    if ((objc_msgSend(v24, "regexBelongsToSender") & 1) == 0)
    {
      sgLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C3607000, v26, OS_LOG_TYPE_DEBUG, "DataDetector is not a definitive match: Not in definitive phrase.", buf, 2u);
      }

    }
    objc_autoreleasePoolPop(context);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    +[SGDetectedAttributeMetrics recordSentContactDetailWithMessage:match:found:](SGDetectedAttributeMetrics, "recordSentContactDetailWithMessage:match:found:", v11, v10, objc_msgSend(v12, "metricsContactDetailFoundIn"));
  v27 = (id)v41[5];

  _Block_object_dispose(&v40, 8);
  return v27;
}

- (id)filterDangerousSigPhoneDetections:(id)a3 message:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  int v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v31;
  id v32;
  id v33;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[16];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (!v7)
    goto LABEL_15;
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v42;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v42 != v10)
        objc_enumerationMutation(v5);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "hasPhoneLabel"))
        v12 = 1;
      else
        v12 = 2;
      v9 += v12;
    }
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  }
  while (v8);
  if (v9 >= 7)
  {
    sgLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEBUG, "Ignoring DataDetector match: Too many phones in signature.", buf, 2u);
    }
    v33 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
LABEL_15:
    v33 = (id)objc_opt_new();
    v31 = v6;
    objc_msgSend(v6, "textContent");
    v13 = objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v32 = v5;
    obj = v5;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v37 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          v19 = (void *)MEMORY[0x1C3BD4F6C]();
          v20 = (void *)MEMORY[0x1C3BD4F6C]();
          v21 = objc_msgSend(v18, "match");
          -[NSObject substringWithRange:](v13, "substringWithRange:", v21, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_autoreleasePoolPop(v20);
          if (_PASIsAllDigits() && (objc_msgSend(v18, "hasPhoneLabel") & 1) == 0)
          {
            sgLogHandle();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1C3607000, v26, OS_LOG_TYPE_DEBUG, "Ignoring DataDetector match: All-digit phone without label in signature.", buf, 2u);
            }
          }
          else
          {
            v24 = objc_msgSend(v18, "match");
            -[SGDetectedAttributeDissector getLineContaining:inText:](self, "getLineContaining:inText:", v24, v25, v13);
            v26 = objc_claimAutoreleasedReturnValue();
            regex2ForKey(CFSTR("LogLine"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "existsInString:", v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28)
            {
              sgLogHandle();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1C3607000, v29, OS_LOG_TYPE_DEBUG, "Ignoring DataDetector match: Log line in signature.", buf, 2u);
              }

            }
            else
            {
              objc_msgSend(v33, "addObject:", v18);
            }
          }

          objc_autoreleasePoolPop(v19);
        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v15);
    }

    v6 = v31;
    v5 = v32;
  }

  return v33;
}

- (id)filterDangerousSigAddressDetections:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint8_t v7[16];

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") < 3)
  {
    v5 = v3;
  }
  else
  {
    sgLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "Ignoring DataDetector match: Too many postal addresses in signature.", v7, 2u);
    }

    v5 = (id)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (id)_extractEmailishTokenFromMailHeader:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D19938], "namedEmailAddressWithFieldValue:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "emailAddress");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v7);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v9, "reverseObjectEnumerator", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v15, "containsString:", CFSTR("<"))
            && (objc_msgSend(v15, "containsString:", CFSTR(">")) & 1) != 0)
          {
            v6 = v15;

            goto LABEL_16;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v12)
          continue;
        break;
      }
    }

    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 1);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
LABEL_16:

  }
  return v6;
}

- (id)_makeAlnum:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
  _PASKeepOnlyCharacterSet();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_makeSimplifiedListIdEmail:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "headersDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("list-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGDetectedAttributeDissector _extractEmailishTokenFromMailHeader:](self, "_extractEmailishTokenFromMailHeader:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[SGDetectedAttributeDissector _makeAlnum:](self, "_makeAlnum:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v8, "length") >= 8)
        v9 = v8;
      else
        v9 = 0;

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)filterDangerousSigEmailDetections:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _UNKNOWN **v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  _UNKNOWN **v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  SGDetectedAttributeDissector *v41;
  id v42;
  void *v43;
  uint64_t v44;
  id obj;
  void *v46;
  uint8_t buf[16];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  v41 = self;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SGDetectedAttributeDissector _makeSimplifiedListIdEmail:](self, "_makeSimplifiedListIdEmail:", v7);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = 0;
  }
  v42 = (id)objc_opt_new();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v8)
  {
    v9 = v8;
    v10 = &off_1E7DA5000;
    v11 = *(_QWORD *)v49;
    v44 = *(_QWORD *)v49;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v49 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1C3BD4F6C]();
        v15 = v10[401];
        objc_msgSend(v7, "textContent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v13, "match");
        objc_msgSend(v16, "substringWithRange:", v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v15) = objc_msgSend(v15, "isInhumanEmailAddress:", v19);

        if ((_DWORD)v15)
        {
          sgLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1C3607000, v20, OS_LOG_TYPE_DEBUG, "Ignoring DataDetector match: Inhuman email address in signature.", buf, 2u);
          }
        }
        else
        {
          v46 = v14;
          v21 = v7;
          v22 = v9;
          v23 = v10;
          objc_msgSend(v21, "textContent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v21;
          objc_msgSend(v21, "textContent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v13, "match");
          v29 = objc_msgSend(v26, "lineRangeForRange:", v27, v28);
          objc_msgSend(v24, "substringWithRange:", v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "stringByTrimmingCharactersInSet:", v32);
          v20 = objc_claimAutoreleasedReturnValue();

          v33 = -[NSObject characterAtIndex:](v20, "characterAtIndex:", -[NSObject length](v20, "length") - 1);
          if (v33 == 65306 || v33 == 58)
          {
            sgLogHandle();
            v34 = objc_claimAutoreleasedReturnValue();
            v9 = v22;
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1C3607000, v34, OS_LOG_TYPE_DEBUG, "Ignoring DataDetector match: Email address with colon at end of line in signature.", buf, 2u);
            }

            v10 = v23;
            v7 = v25;
LABEL_17:
            v11 = v44;
            v14 = v46;
            goto LABEL_18;
          }
          v9 = v22;
          if (+[SGDataDetectorMatch stringHasDatesOrTimes:](SGDataDetectorMatch, "stringHasDatesOrTimes:", v20))
          {
            sgLogHandle();
            v35 = objc_claimAutoreleasedReturnValue();
            v10 = v23;
            v7 = v25;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1C3607000, v35, OS_LOG_TYPE_DEBUG, "Ignoring DataDetector match: Email address with date or time in line in signature.", buf, 2u);
            }

            goto LABEL_17;
          }
          v10 = v23;
          v7 = v25;
          v11 = v44;
          v14 = v46;
          if (!v43)
            goto LABEL_27;
          objc_msgSend(v13, "extraction");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGDetectedAttributeDissector _makeAlnum:](v41, "_makeAlnum:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v37, "compare:options:", v43, 1))
          {

LABEL_27:
            objc_msgSend(v42, "addObject:", v13, v41);
            goto LABEL_18;
          }
          sgLogHandle();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1C3607000, v38, OS_LOG_TYPE_DEBUG, "Ignoring DataDetector match: Email address in signature is close match to List-Id header.", buf, 2u);
          }

        }
LABEL_18:

        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v9 != v12);
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      v9 = v39;
    }
    while (v39);
  }

  return v42;
}

- (id)filterDangerousSigDetections:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "type", (_QWORD)v24);
        v18 = v8;
        if (!v17)
          goto LABEL_11;
        if (v17 == 1)
        {
          v18 = v9;
LABEL_11:
          objc_msgSend(v18, "addObject:", v16);
          continue;
        }
        v18 = v10;
        if (v17 == 2)
          goto LABEL_11;
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  -[SGDetectedAttributeDissector filterDangerousSigPhoneDetections:message:](self, "filterDangerousSigPhoneDetections:message:", v8, v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDetectedAttributeDissector filterDangerousSigAddressDetections:](self, "filterDangerousSigAddressDetections:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDetectedAttributeDissector filterDangerousSigEmailDetections:message:](self, "filterDangerousSigEmailDetections:message:", v10, v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v20, "count") + objc_msgSend(v19, "count") + objc_msgSend(v21, "count"));
  objc_msgSend(v22, "addObjectsFromArray:", v19);
  objc_msgSend(v22, "addObjectsFromArray:", v20);
  objc_msgSend(v22, "addObjectsFromArray:", v21);

  return v22;
}

- (id)processTextMessageConversation:(id)a3 threadLength:(unint64_t)a4
{
  return +[SGSelfIdentification processConversation:threadLength:options:](SGSelfIdentification, "processConversation:threadLength:options:", a3, a4, 3);
}

- (void)logBirthdayExtractionMetricForPerson:(id)a3 forDate:(id)a4 isFromCongratulation:(unsigned __int8)a5 withModelVersion:(id)a6 didRegexTrigger:(unsigned __int8)a7 didResponseKitTrigger:(unsigned __int8)a8
{
  unsigned int v8;
  unsigned int v9;
  unsigned int v11;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  __CFString *v35;
  const __CFString *v36;
  NSObject *v37;
  const __CFString *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  unint64_t v42;
  __CFString *v43;
  id v44;
  void *v45;
  void *v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  id v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  NSObject *v54;
  _QWORD v55[2];

  v8 = a8;
  v9 = a7;
  v11 = a5;
  v55[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a6;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDetectedAttributeDissector.m"), 639, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetPerson"));

    if (v16)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDetectedAttributeDissector.m"), 640, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("birthdayDate"));

LABEL_3:
  objc_msgSend(v15, "contactIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = *MEMORY[0x1E0C96670];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v48 = v11;
    v49 = v9;
    +[SGContactStoreFactory contactStoreWithDonatedContacts](SGContactStoreFactory, "contactStoreWithDonatedContacts");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0;
    +[SGContactsInterface unifiedContactWithIdentifier:keysToFetch:usingContactStore:error:](SGContactsInterface, "unifiedContactWithIdentifier:keysToFetch:usingContactStore:error:", v18, v19, v20, &v50);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v50;

    if (!v21 || v22)
    {
      sgLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v52 = v18;
        v53 = 2112;
        v54 = v22;
        _os_log_debug_impl(&dword_1C3607000, v23, OS_LOG_TYPE_DEBUG, "unifiedContactWithIdentifier for %@ failed with error %@", buf, 0x16u);
      }
      goto LABEL_36;
    }
    v47 = v8;
    -[NSObject birthday](v21, "birthday");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = objc_alloc(MEMORY[0x1E0C99D48]);
    v25 = (void *)objc_msgSend(v24, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    objc_msgSend(v25, "components:fromDate:", 2097180, v16);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (!v23 || !v26)
    {
LABEL_35:

LABEL_36:
      goto LABEL_37;
    }
    -[NSObject setYear:](v23, "setYear:", objc_msgSend(v26, "year"));
    objc_msgSend(v25, "dateFromComponents:", v23);
    v28 = objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v44 = v17;
      v46 = (void *)v28;
      objc_msgSend(v25, "components:fromDate:toDate:options:", 16, v16, v28, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v29;
      if (objc_msgSend(v29, "day"))
      {
        v30 = objc_msgSend(v29, "day");
        if (v30 >= 0)
          v31 = v30;
        else
          v31 = -v30;
        if (v31 <= 7)
        {
          v32 = objc_msgSend(v29, "day");
          if (v32 >= 0)
            v33 = v32;
          else
            v33 = -v32;
          v42 = v33;
          v34 = objc_msgSend(v29, "day");
          v35 = CFSTR("SGM2BirthdayPreviousDay");
          if (v34 > 0)
            v35 = CFSTR("SGM2BirthdayNextDay");
          v36 = CFSTR("SGM2BirthdayNextWeek");
          if (v34 <= 0)
            v36 = CFSTR("SGM2BirthdayPreviousWeek");
          if (v42 > 1)
            v35 = (__CFString *)v36;
          v43 = v35;
          v17 = v44;
          +[SGDetectedAttributeMetrics recordBirthdayExtractionAccuracy:withOffset:withModelVersion:isFromCongratulation:didRegexTrigger:didResponseKitTrigger:](SGDetectedAttributeMetrics, "recordBirthdayExtractionAccuracy:withOffset:withModelVersion:isFromCongratulation:didRegexTrigger:didResponseKitTrigger:", 0, v43, v44, v48, v49, v47);

          goto LABEL_34;
        }
        v38 = CFSTR("SGM2BirthdayWrongDay");
        v39 = 0;
      }
      else
      {
        v38 = CFSTR("SGM2BirthdaySameDay");
        v39 = 1;
      }
      v17 = v44;
      +[SGDetectedAttributeMetrics recordBirthdayExtractionAccuracy:withOffset:withModelVersion:isFromCongratulation:didRegexTrigger:didResponseKitTrigger:](SGDetectedAttributeMetrics, "recordBirthdayExtractionAccuracy:withOffset:withModelVersion:isFromCongratulation:didRegexTrigger:didResponseKitTrigger:", v39, v38, v44, v48, v49, v47);
LABEL_34:

      goto LABEL_35;
    }
    sgLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v37, OS_LOG_TYPE_ERROR, "unifiedContactWithIdentifier failed to generate date for birthday.", buf, 2u);
    }

    v22 = v21;
  }
  else
  {
    sgLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v15;
      _os_log_debug_impl(&dword_1C3607000, v22, OS_LOG_TYPE_DEBUG, "No contact identifier for %@", buf, 0xCu);
    }
  }
LABEL_37:

}

- (void)handleTextMessageBirthdayCongratulation:(id)a3 entity:(id)a4 withConversationHistory:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  char v22;
  const char *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  SGDetectedAttributeML *ml;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _BOOL4 v56;
  void *v57;
  SGLabeledValue *v58;
  void *context;
  SGPipelineEnrichment *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  unsigned int v65;
  void *v66;
  void *v67;
  id v69;
  id v70;
  NSObject *oslog;
  void *v72;
  _QWORD v73[5];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 buf;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v70 = a4;
  v69 = a5;
  v72 = v7;
  objc_msgSend(v7, "conversationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
  {
    sgLogHandle();
    oslog = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    LOWORD(buf) = 0;
    v23 = "Birthday: Text message has no conversation identifier";
LABEL_19:
    _os_log_error_impl(&dword_1C3607000, oslog, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&buf, 2u);
    goto LABEL_54;
  }
  objc_msgSend(v7, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    sgLogHandle();
    oslog = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    LOWORD(buf) = 0;
    v23 = "Birthday: Entity with type SGEntityTextMessage has invalid message date";
    goto LABEL_19;
  }
  if (+[SGDetectedAttributeDissector isTwoPersonConversation:](SGDetectedAttributeDissector, "isTwoPersonConversation:", v7))
  {
    objc_msgSend(v69, "likelyLanguage");
    oslog = objc_claimAutoreleasedReturnValue();
    -[SGDetectedAttributeDissector getResponsesForBirthdayExtractionFromMessage:withLanguage:](self, "getResponsesForBirthdayExtractionFromMessage:withLanguage:", v7, oslog);
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
    if (v12)
    {
      v13 = 0;
      v14 = *(_QWORD *)v75;
      v15 = *MEMORY[0x1E0D87C28];
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v75 != v14)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
          objc_msgSend(v17, "attributes");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18 == 0;

          if (!v19)
          {
            objc_msgSend(v17, "attributes");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKey:", CFSTR("subtype"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "isEqualToString:", v15);

            v13 |= v22;
          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
      }
      while (v12);

      if ((v13 & 1) != 0)
      {
        v65 = 1;
        goto LABEL_26;
      }
    }
    else
    {

    }
    sgLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v72, "uniqueIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v25;
      _os_log_impl(&dword_1C3607000, v24, OS_LOG_TYPE_DEFAULT, "RKAttributedTokenBirthdayType not found for message: %@", (uint8_t *)&buf, 0xCu);

    }
    v65 = 0;
LABEL_26:
    objc_msgSend(v72, "textContent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    _PASNormalizeUnicodeString();
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    regex2ForKey(CFSTR("Birthday/F"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "existsInString:", v67);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      +[SGAggregateLogging reMatched:](SGAggregateLogging, "reMatched:", v27);
      v28 = v27;
    }
    v29 = v28 != 0;
    ml = self->_ml;
    objc_msgSend(v69, "likelyLanguage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGDetectedAttributeML birthdayCongratsTextMessage:andLanguage:andHealthStore:](ml, "birthdayCongratsTextMessage:andLanguage:andHealthStore:", v72, v31, self->_healthStore);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (((v65 | v29) & 1) == 0 && !v32)
      goto LABEL_53;
    context = (void *)MEMORY[0x1C3BD4F6C]();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v79 = 0x3010000000;
    v81 = 0;
    v82 = 0;
    v80 = "";
    if ((v65 | (v32 != 0)) == 1)
    {
      objc_msgSend(v72, "textContent");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "length");
      v35 = *((_QWORD *)&buf + 1);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 32) = 0;
      *(_QWORD *)(v35 + 40) = v34;

    }
    else
    {
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __103__SGDetectedAttributeDissector_handleTextMessageBirthdayCongratulation_entity_withConversationHistory___block_invoke;
      v73[3] = &unk_1E7DAF888;
      v73[4] = &buf;
      objc_msgSend(v27, "enumerateMatchesInString:ngroups:block:", v67, 0, v73);
    }
    objc_msgSend(v72, "date");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "recipients");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "firstObject");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    +[SGIdentityKey keyForPersonHandle:](SGIdentityKey, "keyForPersonHandle:", v64);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v61)
    {

LABEL_52:
      _Block_object_dispose(&buf, 8);
      objc_autoreleasePoolPop(context);
LABEL_53:

      goto LABEL_54;
    }
    v37 = objc_msgSend(v72, "isSent");
    objc_msgSend(v64, "displayName");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789+-()"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "handleIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v38;
    if ((objc_msgSend(v63, "isEqual:", v39) & 1) != 0 || (objc_msgSend(v63, "containsString:", CFSTR("@")) & 1) != 0)
    {

    }
    else
    {
      objc_msgSend(v38, "invertedSet");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v63, "rangeOfCharacterFromSet:", v55) == 0x7FFFFFFFFFFFFFFFLL;

      if (!v56)
        goto LABEL_38;
    }

    v63 = 0;
LABEL_38:
    v60 = -[SGPipelineEnrichment initWithPseudoContactWithKey:parent:name:]([SGPipelineEnrichment alloc], "initWithPseudoContactWithKey:parent:name:", v61, v70, v63);
    objc_msgSend(v64, "displayName");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = +[SGNames isDifficultName:](SGNames, "isDifficultName:", v40);

    if (v41)
    {
      objc_msgSend(MEMORY[0x1E0D197F0], "hardName");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGEntity addTag:](v60, "addTag:", v42);

    }
    v43 = v37 ^ 1;
    __103__SGDetectedAttributeDissector_handleTextMessageBirthdayCongratulation_entity_withConversationHistory___block_invoke_2(v60, v37 ^ 1);
    objc_msgSend(v70, "acquireDissectorLock");
    objc_msgSend(v70, "addEnrichment:", v60);
    v44 = (void *)objc_opt_new();
    objc_msgSend(v44, "setDateFormat:", CFSTR("dd-MM"));
    objc_msgSend(v44, "stringFromDate:", v62);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)*MEMORY[0x1E0D19D80];
    v47 = v45;
    v48 = v46;
    v49 = v47;
    v58 = -[SGLabeledValue initWithLabel:value:]([SGLabeledValue alloc], "initWithLabel:value:", v48, v47);

    objc_msgSend(v72, "textContent");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = *((_QWORD *)&buf + 1);
    if (v32)
    {
      v52 = v32;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D19820], "extractionInfoWithExtractionType:modelVersion:confidence:", 2, 0, 0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v70, "birthday:forIdentity:context:contextRangeOfInterest:extractionInfo:", v58, v61, v50, *(_QWORD *)(v51 + 32), *(_QWORD *)(v51 + 40), v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)

    __103__SGDetectedAttributeDissector_handleTextMessageBirthdayCongratulation_entity_withConversationHistory___block_invoke_2(v53, v43);
    objc_msgSend(v70, "addBirthdayEnrichment:", v53);
    objc_msgSend(v70, "setContactInformationExtracted:", 1);
    objc_msgSend(v70, "releaseDissectorLock");
    if (v32)
    {
      objc_msgSend(v32, "modelVersion");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v54 = 0;
    }
    -[SGDetectedAttributeDissector logBirthdayExtractionMetricForPerson:forDate:isFromCongratulation:withModelVersion:didRegexTrigger:didResponseKitTrigger:](self, "logBirthdayExtractionMetricForPerson:forDate:isFromCongratulation:withModelVersion:didRegexTrigger:didResponseKitTrigger:", v64, v62, 1, v54, v27 != 0, v65);
    if (v32)

    goto LABEL_52;
  }
  sgLogHandle();
  oslog = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    _os_log_debug_impl(&dword_1C3607000, oslog, OS_LOG_TYPE_DEBUG, "Birthday: processing is disabled for group messages", (uint8_t *)&buf, 2u);
  }
LABEL_54:

}

- (id)getResponsesForBirthdayExtractionFromMessage:(id)a3 withLanguage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "textContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D87C10], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "responsesForMessage:maximumResponses:forContext:withLanguage:options:", v7, 0, 0, v6, 544);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      sgLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "uniqueIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = v11;
        _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEFAULT, "No responses found for message: %@", (uint8_t *)&v16, 0xCu);

      }
    }
    v12 = v9;

    v13 = v12;
  }
  else
  {
    sgLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "uniqueIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v14;
      _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEFAULT, "SGDetectedAttributeDissector: getResponsesForBirthdayExtractionFromMessage: text message has nil textContent: %@", (uint8_t *)&v16, 0xCu);

    }
    v13 = 0;
  }

  return v13;
}

- (void)handleTextMessageSelfIdentification:(id)a3 entity:(id)a4 withConversationHistory:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  SGNameDetector *v18;
  void *v19;
  SGNameDetector *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  NSObject *v26;
  uint32_t v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSSet *coreNLPTrustedLanguages;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  float v40;
  uint64_t i;
  void *v42;
  void *v43;
  SGSelfIDSupervision *v44;
  uint64_t v45;
  uint64_t v46;
  SGSelfIDSupervision *v47;
  void *v48;
  void *v49;
  void *v50;
  float v51;
  float v52;
  id v53;
  void *v54;
  NSObject *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  NSObject *v70;
  void *v71;
  id v72;
  void *v73;
  NSObject *v74;
  void *v75;
  uint64_t v76;
  os_signpost_id_t spid;
  void *v78;
  void *context;
  SGNameDetector *v80;
  unint64_t v81;
  NSObject *v82;
  int v83;
  id obj;
  id v85;
  id v87;
  void *v88;
  _QWORD v89[4];
  id v90;
  NSObject *v91;
  _QWORD v92[4];
  id v93;
  __int128 *p_buf;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  int ptr;
  uint8_t v100[4];
  uint64_t v101;
  __int128 buf;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v85 = a4;
  v87 = a5;
  v88 = v7;
  objc_msgSend(v7, "conversationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
  {
    sgLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1C3607000, v10, OS_LOG_TYPE_ERROR, "Self-id: Text message has no conversation identifier", (uint8_t *)&buf, 2u);
    }
    goto LABEL_9;
  }
  if (+[SGDetectedAttributeDissector isTwoPersonConversation:](SGDetectedAttributeDissector, "isTwoPersonConversation:", v7))
  {
    if (objc_msgSend(v7, "senderIsBusinessChat"))
    {
      sgLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        v11 = "Self-id: processing is disabled for business chat";
LABEL_21:
        v26 = v10;
        v27 = 2;
        goto LABEL_22;
      }
      goto LABEL_9;
    }
    objc_msgSend(v7, "domainIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      sgLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      v10 = v23;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v88, "uniqueIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v24;
        _os_log_error_impl(&dword_1C3607000, v23, OS_LOG_TYPE_ERROR, "Self-id: No domain identifier found for message: %@", (uint8_t *)&buf, 0xCu);

        v10 = v23;
      }
      goto LABEL_9;
    }
    +[SGChatLengthEstimator sharedInstance](SGChatLengthEstimator, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "domainIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "estimateMessagesInChat:", v14);

    v16 = -[SGDetectedAttributeDissector selfIdentificationMessageCount](self, "selfIdentificationMessageCount");
    v81 = v15;
    if (v15 >= v16)
    {
      v25 = v16;
      sgLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 67109376;
        DWORD1(buf) = v81;
        WORD4(buf) = 1024;
        *(_DWORD *)((char *)&buf + 10) = v25;
        v11 = "Self-id: ignoring message far in thread (position: %i >= %i)";
        v26 = v10;
        v27 = 14;
LABEL_22:
        _os_log_debug_impl(&dword_1C3607000, v26, OS_LOG_TYPE_DEBUG, v11, (uint8_t *)&buf, v27);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    objc_msgSend(v88, "textContent");
    v82 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "likelyLanguage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if ((unint64_t)-[NSObject length](v82, "length") <= 0x8C)
      {
        context = (void *)MEMORY[0x1C3BD4F6C]();
        v18 = [SGNameDetector alloc];
        objc_msgSend(v87, "likelyLanguage");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[SGNameDetector initWithLanguage:](v18, "initWithLanguage:", v19);

        v80 = v20;
        -[SGNameDetector detectNames:algorithm:](v20, "detectNames:algorithm:", v82, 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (objc_msgSend(v21, "count"))
        {
          v83 = 0;
        }
        else
        {
          v32 = (void *)MEMORY[0x1C3BD4F6C]();
          -[SGNameDetector detectNames:algorithm:](v80, "detectNames:algorithm:", v82, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          coreNLPTrustedLanguages = self->_coreNLPTrustedLanguages;
          objc_msgSend(v87, "likelyLanguage");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = !-[NSSet containsObject:](coreNLPTrustedLanguages, "containsObject:", v34);

          objc_autoreleasePoolPop(v32);
        }
        if (objc_msgSend(v22, "count") && (unint64_t)objc_msgSend(v22, "count") <= 4)
        {
          v78 = v22;
          sgSignpostHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          ptr = 7;
          spid = os_signpost_id_make_with_pointer(v35, &ptr);

          sgSignpostHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = v36;
          if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
          {
            LOWORD(buf) = 0;
            _os_signpost_emit_with_name_impl(&dword_1C3607000, v37, OS_SIGNPOST_INTERVAL_BEGIN, spid, "SelfIdFeaturizations", "Start", (uint8_t *)&buf, 2u);
          }

          v97 = 0u;
          v98 = 0u;
          v95 = 0u;
          v96 = 0u;
          obj = v22;
          v30 = 0;
          v31 = 0;
          v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
          if (v38)
          {
            v39 = *(_QWORD *)v96;
            v40 = 0.0;
            do
            {
              for (i = 0; i != v38; ++i)
              {
                if (*(_QWORD *)v96 != v39)
                  objc_enumerationMutation(obj);
                v42 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
                v43 = (void *)MEMORY[0x1C3BD4F6C]();
                v44 = [SGSelfIDSupervision alloc];
                v45 = objc_msgSend(v42, "range");
                v47 = -[SGSelfIDSupervision initWithMessage:candidateName:](v44, "initWithMessage:candidateName:", v88, v45, v46);
                -[SGDetectedAttributeML selfIdDetectionWithTextMessage:inConversation:withSupervision:](self->_ml, "selfIdDetectionWithTextMessage:inConversation:withSupervision:", v88, v87, v47);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "extractionInfo");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "confidence");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "floatValue");
                v52 = v51;

                if (v48 && v52 >= v40)
                {
                  v53 = v48;
                  if (v83)
                    v54 = v31;
                  else
                    v54 = v30;
                  if (v83)
                    v31 = v53;
                  else
                    v30 = v53;

                  v40 = v52;
                }

                objc_autoreleasePoolPop(v43);
              }
              v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
            }
            while (v38);
          }

          sgSignpostHandle();
          v55 = objc_claimAutoreleasedReturnValue();
          v56 = v55;
          if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v55))
          {
            LOWORD(buf) = 0;
            _os_signpost_emit_with_name_impl(&dword_1C3607000, v56, OS_SIGNPOST_INTERVAL_END, spid, "SelfIdFeaturizations", "Completed", (uint8_t *)&buf, 2u);
          }

          v22 = v78;
        }
        else
        {
          v30 = 0;
          v31 = 0;
        }

        objc_autoreleasePoolPop(context);
LABEL_58:
        objc_msgSend(v87, "messages");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (v57)
        {
          -[SGDetectedAttributeDissector processTextMessageConversation:threadLength:](self, "processTextMessageConversation:threadLength:", v57, v81);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v58;
          if ((v30 != 0) != (v58 != 0))
          {
            if (v58)
            {
              objc_msgSend(v58, "name");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_64:
              objc_msgSend(v88, "recipients");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "firstObject");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "displayName");
              v63 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v63, "containsString:", v60))
              {

                v30 = 0;
                v59 = 0;
              }

              goto LABEL_68;
            }
LABEL_63:
            objc_msgSend(v30, "name");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = 0;
            goto LABEL_64;
          }
        }
        else
        {
          if (v30)
            goto LABEL_63;
          v59 = 0;
        }
LABEL_68:
        +[SGDetectedAttributeDissector _logSelfIDForMessage:detection:modelType:modelVersion:](SGDetectedAttributeDissector, "_logSelfIDForMessage:detection:modelType:modelVersion:", v88, v59, *MEMORY[0x1E0D19CD8], 0);
        objc_msgSend(MEMORY[0x1E0D19EC8], "asset");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v64, "assetVersion");
        +[SGDetectedAttributeDissector _logSelfIDForMessage:detection:modelType:modelVersion:](SGDetectedAttributeDissector, "_logSelfIDForMessage:detection:modelType:modelVersion:", v88, v30, *MEMORY[0x1E0D19CD0], v65);

        objc_msgSend(MEMORY[0x1E0D19EC8], "asset");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v66, "assetVersion");
        +[SGDetectedAttributeDissector _logSelfIDForMessage:detection:modelType:modelVersion:](SGDetectedAttributeDissector, "_logSelfIDForMessage:detection:modelType:modelVersion:", v88, v31, *MEMORY[0x1E0D19CC8], v67);

        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v103 = 0x3032000000;
        v104 = __Block_byref_object_copy__20702;
        v105 = __Block_byref_object_dispose__20703;
        v106 = 0;
        v68 = MEMORY[0x1E0C809B0];
        v92[0] = MEMORY[0x1E0C809B0];
        v92[1] = 3221225472;
        v92[2] = __99__SGDetectedAttributeDissector_handleTextMessageSelfIdentification_entity_withConversationHistory___block_invoke;
        v92[3] = &unk_1E7DB78A0;
        v69 = v85;
        v93 = v69;
        p_buf = &buf;
        objc_msgSend(v69, "runWithDissectorLock:", v92);
        if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
        {
          sgLogHandle();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v100 = 0;
            _os_log_debug_impl(&dword_1C3607000, v70, OS_LOG_TYPE_DEBUG, "Self-id: doesn't look for self id if message has a display name", v100, 2u);
          }
        }
        else
        {
          if (v59)
            v71 = v59;
          else
            v71 = v30;
          v72 = v71;
          if (v72)
          {
            v73 = v72;
            sgLogHandle();
            v74 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v73, "name");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              v76 = objc_msgSend(v75, "length");
              *(_DWORD *)v100 = 134217984;
              v101 = v76;
              _os_log_debug_impl(&dword_1C3607000, v74, OS_LOG_TYPE_DEBUG, "Self-id: updating pseudo-contact entity with name length: %tu", v100, 0xCu);

            }
            v89[0] = v68;
            v89[1] = 3221225472;
            v89[2] = __99__SGDetectedAttributeDissector_handleTextMessageSelfIdentification_entity_withConversationHistory___block_invoke_119;
            v89[3] = &unk_1E7DB6A30;
            v90 = v69;
            v70 = v73;
            v91 = v70;
            objc_msgSend(v90, "runWithDissectorLock:", v89);

          }
          else
          {
            v70 = 0;
          }
        }

        _Block_object_dispose(&buf, 8);
        v10 = v82;
        goto LABEL_9;
      }
    }
    else
    {
      sgLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1C3607000, v28, OS_LOG_TYPE_DEFAULT, "Self-id: No likely language prediction for conversation", (uint8_t *)&buf, 2u);
      }

      if ((unint64_t)-[NSObject length](v82, "length") < 0x8D)
        goto LABEL_29;
    }
    sgLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_debug_impl(&dword_1C3607000, v29, OS_LOG_TYPE_DEBUG, "Self-id: text length too long", (uint8_t *)&buf, 2u);
    }

LABEL_29:
    v30 = 0;
    v31 = 0;
    goto LABEL_58;
  }
  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    v11 = "Self-id: processing is disabled for group messages";
    goto LABEL_21;
  }
LABEL_9:

}

- (void)_addAuthorContactForMessage:(id)a3 entity:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SGPipelineEnrichment *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  id v20;

  v20 = a3;
  v5 = a4;
  objc_msgSend(v20, "author");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v20, "author");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGIdentityKey keyForPersonHandle:](SGIdentityKey, "keyForPersonHandle:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
LABEL_12:

      goto LABEL_13;
    }
    v9 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v20, "author");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v9);
    v12 = (void *)MEMORY[0x1C3BD4F6C]();
    v13 = -[SGPipelineEnrichment initWithPseudoContactWithKey:parent:name:]([SGPipelineEnrichment alloc], "initWithPseudoContactWithKey:parent:name:", v8, v5, v11);
    objc_autoreleasePoolPop(v12);
    if (+[SGNames isDifficultName:](SGNames, "isDifficultName:", v11))
    {
      objc_msgSend(MEMORY[0x1E0D197F0], "hardName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGEntity addTag:](v13, "addTag:", v14);

    }
    if (objc_msgSend(v8, "hasEmailAddress"))
    {
      objc_msgSend(v8, "emailAddress");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = +[SGInhumans isInhumanEmailAddress:](SGInhumans, "isInhumanEmailAddress:", v15);

      if (!v16)
        goto LABEL_11;
    }
    else
    {
      if (!objc_msgSend(v8, "hasPhone"))
        goto LABEL_11;
      objc_msgSend(v8, "phone");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = +[SGInhumans isInhumanPhoneNumber:](SGInhumans, "isInhumanPhoneNumber:", v17);

      if (!v18)
        goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0D197F0], "inhuman");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGEntity addTag:](v13, "addTag:", v19);

LABEL_11:
    objc_msgSend(v5, "addEnrichment:", v13);

    goto LABEL_12;
  }
LABEL_13:

}

- (void)_removeUnwantedContactDetails:(id)a3 entity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "duplicateKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "entityType") == 13)
  {
    v9 = objc_msgSend(v6, "contactInformationExtracted");

    if ((v9 & 1) == 0)
      goto LABEL_17;
  }
  else
  {

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v5, "senderIsAccountOwner"))
  {
    v21 = 0;
    goto LABEL_19;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v6, "enrichments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v15, "duplicateKey");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "entityType");

        if (v17 == 20)
        {
          objc_msgSend(v15, "duplicateKey");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "contactDetailKey");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "identityKey");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v20);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v12);
  }

LABEL_17:
  v21 = 1;
LABEL_19:
  if ((objc_msgSend(v6, "isInhuman") & 1) != 0 || objc_msgSend(v6, "isFromForwardedMessage"))
  {
    objc_msgSend(v7, "removeAllObjects");
  }
  else if (!v21)
  {
    goto LABEL_23;
  }
  objc_msgSend(v6, "enrichments");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v25 = v7;
  v26 = v6;
  sgFilter();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setEnrichments:", v23, v24, 3221225472, __69__SGDetectedAttributeDissector__removeUnwantedContactDetails_entity___block_invoke, &unk_1E7DAF8B0);

LABEL_23:
}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1C3BD4F6C]();
  -[SGDetectedAttributeDissector _addAuthorContactForMessage:entity:](self, "_addAuthorContactForMessage:entity:", v11, v8);
  -[SGDetectedAttributeDissector _dissectMessage:entity:](self, "_dissectMessage:entity:", v11, v8);
  -[SGDetectedAttributeDissector _removeUnwantedContactDetails:entity:](self, "_removeUnwantedContactDetails:entity:", v11, v8);
  objc_autoreleasePoolPop(v10);

}

- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1C3BD4F6C]();
  -[SGDetectedAttributeDissector _addAuthorContactForMessage:entity:](self, "_addAuthorContactForMessage:entity:", v11, v8);
  -[SGDetectedAttributeDissector _dissectMessage:entity:](self, "_dissectMessage:entity:", v11, v8);
  -[SGDetectedAttributeDissector _removeUnwantedContactDetails:entity:](self, "_removeUnwantedContactDetails:entity:", v11, v8);
  objc_autoreleasePoolPop(v10);

}

- (void)_dissectMessage:(id)a3 entity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  int v15;
  NSObject *v16;
  const char *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  SGTextMessageItem *v24;
  void *v25;
  SGTextMessageItem *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  int v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  NSUInteger length;
  int v42;
  _BOOL4 v43;
  int v44;
  int v45;
  int v46;
  int v47;
  _BOOL4 v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  os_signpost_id_t v52;
  float v53;
  NSObject *v54;
  NSObject *v55;
  SGDetectedAttributeML *ml;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  uint64_t v60;
  int *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  unint64_t v66;
  NSObject *v67;
  NSUInteger v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  NSObject *v72;
  int v73;
  void *v74;
  int v75;
  SGContactPipelineHelper *contactsHelper;
  void *v77;
  uint64_t v78;
  float v79;
  float unlikelyPhoneSamplingRate;
  NSObject *v81;
  _BOOL4 v82;
  double v83;
  float v84;
  SGContactDetailSupervision *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  NSObject *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  int v99;
  void *v100;
  NSObject *v101;
  void *v102;
  char v103;
  char v104;
  uint64_t v105;
  _BOOL8 v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  _BOOL8 v111;
  uint64_t v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  NSObject *v117;
  os_signpost_id_t v118;
  NSObject *v119;
  NSObject *v120;
  SGDetectedAttributeML *v121;
  void *v122;
  SGDetectedAttributeML *v123;
  NSObject *v124;
  NSObject *v125;
  _BOOL8 v126;
  void *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t j;
  uint64_t v139;
  void *v140;
  void *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t k;
  uint64_t v148;
  void *v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  uint64_t v156;
  _BOOL4 v157;
  uint64_t v158;
  void *v159;
  void *v160;
  char v161;
  char v162;
  uint64_t v163;
  void *v164;
  int v165;
  void *v166;
  uint64_t v167;
  id v168;
  NSObject *log;
  id v170;
  void *v171;
  SGContactDetailSupervision *v172;
  void *v173;
  id v174;
  id obj;
  void *v176;
  uint64_t v177;
  void *v178;
  uint64_t v179;
  int v180;
  void *v181;
  void *v183;
  void *v184;
  uint64_t v185;
  NSUInteger v186;
  NSUInteger v187;
  int v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  int v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  int ptr;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  _BYTE v209[128];
  uint8_t v210[128];
  uint8_t v211[4];
  void *v212;
  __int128 buf;
  int v214;
  int v215;
  int v216;
  _BYTE v217[128];
  _BYTE v218[128];
  uint64_t v219;
  NSRange v220;
  NSRange v221;
  NSRange v222;
  NSRange v223;

  v219 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "textContent");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v178)
    goto LABEL_209;
  objc_msgSend(v5, "author");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    sgLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      v17 = "Skipping DetectedAttribute dissection: No author.";
      goto LABEL_58;
    }
LABEL_12:

    goto LABEL_209;
  }
  v8 = objc_msgSend(v6, "plainTextSigRange");
  v186 = v9;
  v187 = v8;
  v185 = objc_msgSend(v5, "detectedDataSignatureRange");
  objc_msgSend(v6, "tags");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    v12 = objc_msgSend(v6, "isInhuman");

    if (v12)
    {
      sgLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_debug_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEBUG, "Skipping DetectedAttribute dissection: Inhuman sender.", (uint8_t *)&buf, 2u);
      }

      +[SGDetectedAttributeMetrics recordExtractionOutcome:forDetectionsInMessage:signatureRange:isDDSignature:](SGDetectedAttributeMetrics, "recordExtractionOutcome:forDetectionsInMessage:signatureRange:isDDSignature:", *MEMORY[0x1E0D19B30], v5, v187, v186, v185 != 0x7FFFFFFFFFFFFFFFLL);
      goto LABEL_209;
    }
  }
  objc_msgSend(v5, "source");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqual:", CFSTR("warmUpSuggestions"));

  if (v15)
  {
    sgLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      v17 = "Skipping DetectedAttribute dissection: warm up message.";
LABEL_58:
      _os_log_debug_impl(&dword_1C3607000, v16, OS_LOG_TYPE_DEBUG, v17, (uint8_t *)&buf, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = v5;
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "conversationIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "length");

      if (v21)
      {
        v22 = (void *)MEMORY[0x1C3BD4F6C]();
        +[SGTextMessageConversationTracker instance](SGTextMessageConversationTracker, "instance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = [SGTextMessageItem alloc];
        objc_msgSend(v19, "plainTextDetectedData");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[SGTextMessageItem initWithTextMessage:detectedData:](v24, "initWithTextMessage:detectedData:", v19, v25);
        objc_msgSend(v23, "addTextMessageItem:", v26);
        v166 = (void *)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v22);
        v165 = 0;
        v27 = 0;
      }
      else
      {
        v165 = 0;
        v27 = 0;
        v166 = 0;
      }
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = 0;
LABEL_20:
    v27 = 0;
    goto LABEL_21;
  }
  v27 = v5;
  v19 = 0;
LABEL_21:
  v166 = 0;
  v165 = 1;
LABEL_22:
  if ((objc_msgSend(MEMORY[0x1E0D198F0], "detectContacts") & 1) == 0)
  {
    sgLogHandle();
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_debug_impl(&dword_1C3607000, log, OS_LOG_TYPE_DEBUG, "Skipping DetectedAttribute dissector: detectContacts is OFF", (uint8_t *)&buf, 2u);
    }
    goto LABEL_208;
  }
  v154 = v27;
  objc_msgSend(v5, "author");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGIdentityKey keyForPersonHandle:](SGIdentityKey, "keyForPersonHandle:", v28);
  v29 = objc_claimAutoreleasedReturnValue();

  log = v29;
  if (!v29)
  {
    log = 0;
    goto LABEL_207;
  }
  objc_msgSend(v5, "plainTextDetectedData");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v154)
  {
    objc_msgSend(v154, "quotedRegions");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = (void *)objc_opt_new();
  }
  v174 = v31;

  objc_msgSend(v6, "releaseDissectorLock");
  sgLogHandle();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v30;
    _os_log_debug_impl(&dword_1C3607000, v32, OS_LOG_TYPE_DEBUG, "Detections: %@", (uint8_t *)&buf, 0xCu);
  }

  v207 = 0u;
  v208 = 0u;
  v205 = 0u;
  v206 = 0u;
  v33 = v30;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v205, v218, 16);
  obj = v33;
  v176 = v6;
  if (v34)
  {
    v35 = v34;
    v36 = v5;
    memset(&v189, 0, 12);
    v188 = 0;
    v37 = 0;
    v38 = *(_QWORD *)v206;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v206 != v38)
          objc_enumerationMutation(obj);
        v40 = *(void **)(*((_QWORD *)&v205 + 1) + 8 * i);
        v220.location = objc_msgSend(v40, "range");
        v222.length = v186;
        v222.location = v187;
        length = NSIntersectionRange(v220, v222).length;
        v42 = objc_msgSend(v40, "matchType");
        v43 = v42 == 0;
        if (v42)
          v44 = DWORD2(v189);
        else
          v44 = DWORD2(v189) + 1;
        DWORD2(v189) = v44;
        v45 = objc_msgSend(v40, "matchType");
        v46 = v45 == 1;
        v47 = DWORD1(v189);
        if (v45 == 1)
          v47 = DWORD1(v189) + 1;
        DWORD1(v189) = v47;
        if (length)
          v48 = v43;
        else
          v48 = 0;
        LODWORD(v189) = v189 + v48;
        if (!length)
          v46 = 0;
        v188 += v46;
        if (objc_msgSend(v40, "matchType") == 2)
          ++v37;
      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v205, v218, 16);
    }
    while (v35);

    if (SDWORD2(v189) >= 6)
    {
      sgLogHandle();
      v49 = objc_claimAutoreleasedReturnValue();
      v6 = v176;
      v5 = v36;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 67109376;
        DWORD1(buf) = DWORD2(v189);
        WORD4(buf) = 1024;
        *(_DWORD *)((char *)&buf + 10) = 5;
        _os_log_debug_impl(&dword_1C3607000, v49, OS_LOG_TYPE_DEBUG, "Skipping DetectedAttribute dissection: too many phone numbers (%i, limit %i)", (uint8_t *)&buf, 0xEu);
      }

      objc_msgSend(v176, "acquireDissectorLock");
      goto LABEL_206;
    }
    v6 = v176;
    v5 = v36;
  }
  else
  {

    v37 = 0;
    memset(&v189, 0, 12);
    v188 = 0;
  }
  if ((v165 & 1) == 0)
  {
    v50 = (void *)MEMORY[0x1C3BD4F6C]();
    sgSignpostHandle();
    v51 = objc_claimAutoreleasedReturnValue();
    ptr = 7;
    v52 = os_signpost_id_make_with_pointer(v51, &ptr);

    if (!*(_QWORD *)((char *)&v189 + 4) && !v37)
    {
      if (objc_msgSend(MEMORY[0x1E0D198F0], "useMLModelForContactSharing"))
      {
        objc_msgSend(MEMORY[0x1E0D198F0], "contactSharingNegativeSamplingRate");
        if ((float)((float)arc4random_uniform(0xFFFFFFFF) * 2.3283e-10) < v53)
        {
          sgSignpostHandle();
          v54 = objc_claimAutoreleasedReturnValue();
          v55 = v54;
          if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
          {
            LOWORD(buf) = 0;
            _os_signpost_emit_with_name_impl(&dword_1C3607000, v55, OS_SIGNPOST_INTERVAL_BEGIN, v52, "ContactSharingNegativeExample", "Start", (uint8_t *)&buf, 2u);
          }

          ml = self->_ml;
          objc_msgSend(v166, "likelyLanguage");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGDetectedAttributeML handleTextMessageContactSharingWithNegativeSample:andLanguage:](ml, "handleTextMessageContactSharingWithNegativeSample:andLanguage:", v19, v57);

          sgSignpostHandle();
          v58 = objc_claimAutoreleasedReturnValue();
          v59 = v58;
          if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
          {
            LOWORD(buf) = 0;
            _os_signpost_emit_with_name_impl(&dword_1C3607000, v59, OS_SIGNPOST_INTERVAL_END, v52, "ContactSharingNegativeExample", "Completed", (uint8_t *)&buf, 2u);
          }

        }
      }
    }
    objc_autoreleasePoolPop(v50);
  }
  objc_msgSend(MEMORY[0x1E0D19EC0], "detectLanguageFromText:", v178);
  v60 = objc_claimAutoreleasedReturnValue();
  v164 = (void *)v60;
  if (v60)
  {
    v61 = &OBJC_IVAR___SGDetectedAttributeDissector__hmmTrustedLanguages;
    if (v185 != 0x7FFFFFFFFFFFFFFFLL)
      v61 = &OBJC_IVAR___SGDetectedAttributeDissector__ddTrustedLanguages;
    v161 = objc_msgSend(*(id *)((char *)&self->super.super.isa + *v61), "containsObject:", v60);
  }
  else
  {
    v161 = 0;
  }
  v160 = v19;
  v159 = (void *)objc_opt_new();
  v199 = 0u;
  v200 = 0u;
  v201 = 0u;
  v202 = 0u;
  v203 = xmmword_1C385A570;
  objc_msgSend(obj, "reverseObjectEnumerator");
  v168 = (id)objc_claimAutoreleasedReturnValue();
  v184 = v5;
  v179 = objc_msgSend(v168, "countByEnumeratingWithState:objects:count:", &v199, v217, 16);
  if (!v179)
  {
    v162 = 0;
    goto LABEL_181;
  }
  v162 = 0;
  v177 = *(_QWORD *)v200;
  v163 = *MEMORY[0x1E0D19B10];
  v155 = *MEMORY[0x1E0D19B38];
  v156 = *MEMORY[0x1E0D19B08];
  v158 = *MEMORY[0x1E0D19B20];
  v167 = *MEMORY[0x1E0D19B28];
  do
  {
    v62 = 0;
    do
    {
      if (*(_QWORD *)v200 != v177)
        objc_enumerationMutation(v168);
      v63 = *(void **)(*((_QWORD *)&v199 + 1) + 8 * v62);
      v64 = (void *)MEMORY[0x1C3BD4F6C]();
      if (objc_msgSend(v63, "matchType") == 1
        || !objc_msgSend(v63, "matchType")
        || objc_msgSend(v63, "matchType") == 2
        || objc_msgSend(v63, "matchType") == 3)
      {
        if (!objc_msgSend(v63, "matchType"))
        {
          v65 = objc_msgSend(v63, "range");
          if (SGIsPhoneNumberWithRangeBlocked(v178, v65, v66))
          {
            sgLogHandle();
            v67 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(buf) = 0;
              _os_log_debug_impl(&dword_1C3607000, v67, OS_LOG_TYPE_DEBUG, "Ignoring DataDetector match: Blocked phone number.", (uint8_t *)&buf, 2u);
            }

            goto LABEL_174;
          }
        }
        v183 = v64;
        v221.location = objc_msgSend(v63, "range");
        v223.length = v186;
        v223.location = v187;
        v68 = NSIntersectionRange(v221, v223).length;
        v69 = objc_msgSend(v63, "range");
        if (objc_msgSend(v174, "intersectsIndexesInRange:", v69, v70))
        {
          v71 = (void *)MEMORY[0x1C3BD4F6C]();
          sgLogHandle();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
          {
            LOWORD(buf) = 0;
            _os_log_debug_impl(&dword_1C3607000, v72, OS_LOG_TYPE_DEBUG, "Ignoring DataDetector match: Quoted region.", (uint8_t *)&buf, 2u);
          }

          LOBYTE(v152) = 0;
          +[SGDetectedAttributeMetrics recordExtractionOutcome:fromMessage:foundInSignature:isDDSignature:match:modelVersion:isUnlikelyPhone:](SGDetectedAttributeMetrics, "recordExtractionOutcome:fromMessage:foundInSignature:isDDSignature:match:modelVersion:isUnlikelyPhone:", v167, v5, v68 != 0, v185 != 0x7FFFFFFFFFFFFFFFLL, v63, &unk_1E7E0C680, v152);
          objc_autoreleasePoolPop(v71);
LABEL_123:
          v64 = v183;
          goto LABEL_174;
        }
        if (objc_msgSend(v63, "matchType"))
        {
          v73 = 0;
        }
        else
        {
          objc_msgSend(v63, "valueString");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = objc_msgSend(v74, "containsString:", CFSTR(","));

        }
        if (self->_filterWithAddressBook && !objc_msgSend(v63, "matchType"))
        {
          contactsHelper = self->_contactsHelper;
          objc_msgSend(v63, "valueString");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = !-[SGContactPipelineHelper numberMatchesContactsForm:](contactsHelper, "numberMatchesContactsForm:", v77);

        }
        else
        {
          v75 = 0;
        }
        v78 = v73 | v75;
        if ((_DWORD)v78 == 1)
        {
          v79 = (float)arc4random_uniform(0xFFFFFFFF) * 2.3283e-10;
          unlikelyPhoneSamplingRate = self->_unlikelyPhoneSamplingRate;
          sgLogHandle();
          v81 = objc_claimAutoreleasedReturnValue();
          v82 = os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG);
          if (v79 >= unlikelyPhoneSamplingRate)
          {
            if (v82)
            {
              LOWORD(buf) = 0;
              _os_log_debug_impl(&dword_1C3607000, v81, OS_LOG_TYPE_DEBUG, "Ignoring DataDetector match: Low quality phone number match.", (uint8_t *)&buf, 2u);
            }

            goto LABEL_123;
          }
          if (v82)
          {
            LOWORD(buf) = 0;
            _os_log_debug_impl(&dword_1C3607000, v81, OS_LOG_TYPE_DEBUG, "Processing low quality phone number match for ML supervision and metrics; detections to be discarded.",
              (uint8_t *)&buf,
              2u);
          }

        }
        *(_QWORD *)&buf = 261887;
        HIDWORD(buf) = v189;
        v214 = DWORD2(v189);
        v215 = v188;
        v216 = DWORD1(v189);
        BYTE4(buf) = objc_msgSend(v63, "matchType") == 0;
        BYTE5(buf) = objc_msgSend(v63, "matchType") == 1;
        v83 = (double)(unint64_t)objc_msgSend(v63, "range");
        v84 = v83 / (double)(unint64_t)objc_msgSend(v178, "length");
        *((float *)&buf + 2) = v84;
        v85 = -[SGContactDetailSupervision initWithMessage:ddMatch:isUnlikelyPhone:]([SGContactDetailSupervision alloc], "initWithMessage:ddMatch:isUnlikelyPhone:", v5, v63, v78);
        v86 = (void *)MEMORY[0x1C3BD4F6C]();
        v180 = v78;
        if (v68)
        {
          -[SGDetectedAttributeDissector detectionFromSignatureDDMatch:message:detectedLabelRange:lastClaimedLabelRange:isUnlikelyPhone:](self, "detectionFromSignatureDDMatch:message:detectedLabelRange:lastClaimedLabelRange:isUnlikelyPhone:", v63, v5, &v203, v203, v78);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          if (v87)
          {
            sgLogHandle();
            v88 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v87, "extraction");
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v211 = 138412290;
              v212 = v127;
              _os_log_debug_impl(&dword_1C3607000, v88, OS_LOG_TYPE_DEBUG, "Detected attribute (sig/*): '%@'", v211, 0xCu);

              v6 = v176;
            }

            if (v185 == 0x7FFFFFFFFFFFFFFFLL)
              BYTE6(buf) = 1;
            else
              BYTE7(buf) = 1;
            objc_msgSend(v159, "addObject:", v87);
            SGFeatureVectorLog((uint64_t)&buf);
          }
        }
        else
        {
          SGFeatureVectorLog((uint64_t)&buf);
          -[SGDetectedAttributeDissector detectionFromBodyDDMatch:message:withSupervisionToFill:isUnlikelyPhone:](self, "detectionFromBodyDDMatch:message:withSupervisionToFill:isUnlikelyPhone:", v63, v5, v85, v78);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          if (v87)
          {
            sgLogHandle();
            v89 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v87, "extraction");
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v211 = 138412290;
              v212 = v128;
              _os_log_debug_impl(&dword_1C3607000, v89, OS_LOG_TYPE_DEBUG, "Detected attribute (body): '%@'", v211, 0xCu);

            }
            if ((objc_msgSend(v87, "isUnlikelyPhone") & 1) != 0
              || (objc_msgSend(v176, "acquireDissectorLock"),
                  objc_msgSend(v87, "extractionInfo"),
                  v90 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v176, "addDetection:forIdentity:extractionInfo:", v87, log, v90),
                  v90,
                  objc_msgSend(v176, "releaseDissectorLock"),
                  objc_msgSend(v87, "type") != 3))
            {
              v5 = v184;
            }
            else
            {
              v5 = v184;
              objc_msgSend(v184, "author");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "detectedDate");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGDetectedAttributeDissector logBirthdayExtractionMetricForPerson:forDate:isFromCongratulation:withModelVersion:didRegexTrigger:didResponseKitTrigger:](self, "logBirthdayExtractionMetricForPerson:forDate:isFromCongratulation:withModelVersion:didRegexTrigger:didResponseKitTrigger:", v91, v92, 0, 0, 0, 1);

            }
            v6 = v176;
          }
        }
        objc_autoreleasePoolPop(v86);
        objc_msgSend(v6, "acquireDissectorLock");
        v93 = objc_msgSend(v63, "valueRange");
        objc_msgSend(v63, "valueRange");
        textToMatch(v93, v94 + v93, v178, objc_msgSend(v63, "matchType"));
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v173 = v95;
        if (objc_msgSend(v63, "matchType") == 1
          || !objc_msgSend(v63, "matchType")
          || objc_msgSend(v63, "matchType") == 2)
        {
          v96 = (void *)MEMORY[0x1C3BD4F6C]();
          -[SGDetectedAttributeML detectionFromMessage:ddMatch:matchedContext:withSupervision:inConversation:entityLanguage:](self->_ml, "detectionFromMessage:ddMatch:matchedContext:withSupervision:inConversation:entityLanguage:", v5, v63, v95, v85, v166, v164);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = v87;
          if (v97)
          {
            v99 = v180;
            if (!v98)
            {
              if (-[SGContactDetailSupervision isThirdPerson](v85, "isThirdPerson")
                || -[SGContactDetailSupervision isFirstPerson](v85, "isFirstPerson"))
              {
                v98 = 0;
              }
              else
              {
                v100 = v6;
                v98 = v97;
                sgLogHandle();
                v101 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v98, "extraction");
                  v171 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v211 = 138412290;
                  v212 = v171;
                  _os_log_debug_impl(&dword_1C3607000, v101, OS_LOG_TYPE_DEBUG, "Detected attribute (ml): '%@'", v211, 0xCu);

                }
                if ((objc_msgSend(v98, "isUnlikelyPhone") & 1) == 0)
                {
                  objc_msgSend(v98, "extractionInfo");
                  v102 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v100, "addDetection:forIdentity:extractionInfo:", v98, log, v102);

                }
                v6 = v100;
                v95 = v173;
              }
            }
          }
          else
          {
            v99 = v180;
          }
          objc_autoreleasePoolPop(v96);
        }
        else
        {
          v97 = 0;
          v98 = v87;
          v99 = v180;
        }
        if (v98)
          v103 = v99;
        else
          v103 = 1;
        if ((v103 & 1) == 0)
        {
          v104 = v68 ? v161 : 0;
          if ((v104 & 1) != 0 || !v68)
          {
            v162 |= v104;
            objc_msgSend(v6, "setContactInformationExtracted:", 1);
          }
        }
        v105 = objc_msgSend(v6, "releaseDissectorLock");
        v170 = v98;
        v172 = v85;
        if (v97)
        {
          v106 = v68 != 0;
          v107 = (void *)MEMORY[0x1C3BD4F6C](v105);
          v108 = -[SGContactDetailSupervision metricsContactDetailOwner](v85, "metricsContactDetailOwner");
          objc_msgSend(v97, "extractionInfo");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "modelVersion");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v153) = v180;
          v99 = v180;
          v6 = v176;
          +[SGDetectedAttributeMetrics recordExtractionOutcome:fromMessage:foundInSignature:isDDSignature:match:foundInCNContact:modelVersion:isUnlikelyPhone:](SGDetectedAttributeMetrics, "recordExtractionOutcome:fromMessage:foundInSignature:isDDSignature:match:foundInCNContact:modelVersion:isUnlikelyPhone:", v163, v184, v106, v185 != 0x7FFFFFFFFFFFFFFFLL, v63, v108, v110, v153);

          goto LABEL_161;
        }
        if (-[SGContactDetailSupervision regexDoesNotBelongToSender](v85, "regexDoesNotBelongToSender"))
        {
          v111 = v68 != 0;
          v107 = (void *)MEMORY[0x1C3BD4F6C]();
          v112 = -[SGContactDetailSupervision metricsContactDetailOwner](v85, "metricsContactDetailOwner");
          objc_msgSend(v98, "extractionInfo");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "modelVersion");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v153) = v180;
          +[SGDetectedAttributeMetrics recordExtractionOutcome:fromMessage:foundInSignature:isDDSignature:match:foundInCNContact:modelVersion:isUnlikelyPhone:](SGDetectedAttributeMetrics, "recordExtractionOutcome:fromMessage:foundInSignature:isDDSignature:match:foundInCNContact:modelVersion:isUnlikelyPhone:", v158, v184, v111, v185 != 0x7FFFFFFFFFFFFFFFLL, v63, v112, v114, v153);
          goto LABEL_160;
        }
        if (-[SGContactDetailSupervision regexBelongsToSender](v85, "regexBelongsToSender"))
        {
          v157 = v68 != 0;
          v107 = (void *)MEMORY[0x1C3BD4F6C]();
          v115 = -[SGContactDetailSupervision metricsContactDetailOwner](v85, "metricsContactDetailOwner");
          objc_msgSend(v98, "extractionInfo");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "modelVersion");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v153) = v180;
          +[SGDetectedAttributeMetrics recordExtractionOutcome:fromMessage:foundInSignature:isDDSignature:match:foundInCNContact:modelVersion:isUnlikelyPhone:](SGDetectedAttributeMetrics, "recordExtractionOutcome:fromMessage:foundInSignature:isDDSignature:match:foundInCNContact:modelVersion:isUnlikelyPhone:", v156, v184, v157, v185 != 0x7FFFFFFFFFFFFFFFLL, v63, v115, v114, v153);
LABEL_160:

          v99 = v180;
          v6 = v176;
LABEL_161:
          objc_autoreleasePoolPop(v107);
          v98 = v170;
          v95 = v173;
        }
        else if (!v98)
        {
          v126 = v68 != 0;
          v107 = (void *)MEMORY[0x1C3BD4F6C]();
          LOBYTE(v153) = v99;
          +[SGDetectedAttributeMetrics recordExtractionOutcome:fromMessage:foundInSignature:isDDSignature:match:foundInCNContact:modelVersion:isUnlikelyPhone:](SGDetectedAttributeMetrics, "recordExtractionOutcome:fromMessage:foundInSignature:isDDSignature:match:foundInCNContact:modelVersion:isUnlikelyPhone:", v155, v184, v126, v185 != 0x7FFFFFFFFFFFFFFFLL, v63, -[SGContactDetailSupervision metricsContactDetailOwner](v85, "metricsContactDetailOwner"), 0, v153);
          goto LABEL_161;
        }
        if (((v165 | v99) & 1) == 0
          && (objc_msgSend(v63, "matchType") == 1
           || !objc_msgSend(v63, "matchType")
           || objc_msgSend(v63, "matchType") == 2))
        {
          v181 = v97;
          v116 = (void *)MEMORY[0x1C3BD4F6C]();
          sgSignpostHandle();
          v117 = objc_claimAutoreleasedReturnValue();
          v198 = 7;
          v118 = os_signpost_id_make_with_pointer(v117, &v198);

          sgSignpostHandle();
          v119 = objc_claimAutoreleasedReturnValue();
          v120 = v119;
          if (v118 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v119))
          {
            *(_WORD *)v211 = 0;
            _os_signpost_emit_with_name_impl(&dword_1C3607000, v120, OS_SIGNPOST_INTERVAL_BEGIN, v118, "ContactSharingPositiveExample", "Start", v211, 2u);
          }

          v121 = self->_ml;
          objc_msgSend(v166, "likelyLanguage");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          v123 = v121;
          v95 = v173;
          -[SGDetectedAttributeML handleTextMessageContactSharing:andMatch:andContext:andLanguage:withSupervision:](v123, "handleTextMessageContactSharing:andMatch:andContext:andLanguage:withSupervision:", v160, v63, v173, v122, v172);

          sgSignpostHandle();
          v124 = objc_claimAutoreleasedReturnValue();
          v125 = v124;
          if (v118 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v124))
          {
            *(_WORD *)v211 = 0;
            _os_signpost_emit_with_name_impl(&dword_1C3607000, v125, OS_SIGNPOST_INTERVAL_END, v118, "ContactSharingPositiveExample", "Completed", v211, 2u);
          }

          objc_autoreleasePoolPop(v116);
          v98 = v170;
          v97 = v181;
        }

        v64 = v183;
        v5 = v184;
      }
LABEL_174:
      objc_autoreleasePoolPop(v64);
      ++v62;
    }
    while (v179 != v62);
    v129 = objc_msgSend(v168, "countByEnumeratingWithState:objects:count:", &v199, v217, 16);
    v179 = v129;
  }
  while (v129);
LABEL_181:

  if ((v165 & 1) == 0)
  {
    v130 = (void *)MEMORY[0x1C3BD4F6C]();
    -[SGDetectedAttributeDissector handleTextMessageSelfIdentification:entity:withConversationHistory:](self, "handleTextMessageSelfIdentification:entity:withConversationHistory:", v160, v6, v166);
    -[SGDetectedAttributeDissector handleTextMessageBirthdayCongratulation:entity:withConversationHistory:](self, "handleTextMessageBirthdayCongratulation:entity:withConversationHistory:", v160, v6, v166);
    objc_autoreleasePoolPop(v130);
  }
  objc_msgSend(v6, "acquireDissectorLock");
  if (objc_msgSend(v159, "count"))
  {
    v131 = (id)objc_opt_new();

  }
  else
  {
    v131 = 0;
  }
  if ((v162 & 1) != 0)
  {
    v132 = (void *)MEMORY[0x1C3BD4F6C]();
    v194 = 0u;
    v195 = 0u;
    v196 = 0u;
    v197 = 0u;
    -[SGDetectedAttributeDissector filterDangerousSigDetections:message:](self, "filterDangerousSigDetections:message:", v159, v184);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "reverseObjectEnumerator");
    v134 = (void *)objc_claimAutoreleasedReturnValue();

    v135 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v194, v210, 16);
    if (v135)
    {
      v136 = v135;
      v137 = *(_QWORD *)v195;
      do
      {
        for (j = 0; j != v136; ++j)
        {
          if (*(_QWORD *)v195 != v137)
            objc_enumerationMutation(v134);
          v139 = *(_QWORD *)(*((_QWORD *)&v194 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0D19820], "extractionInfoWithExtractionType:modelVersion:confidence:", 1, 0, 0);
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v176, "addDetection:forIdentity:extractionInfo:", v139, log, v140);

          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v139);
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v131, "addObject:", v141);

        }
        v136 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v194, v210, 16);
      }
      while (v136);
    }

    objc_autoreleasePoolPop(v132);
  }
  v192 = 0u;
  v193 = 0u;
  v190 = 0u;
  v191 = 0u;
  *((_QWORD *)&v189 + 1) = v159;
  v142 = objc_msgSend(*((id *)&v189 + 1), "countByEnumeratingWithState:objects:count:", &v190, v209, 16);
  if (v142)
  {
    v143 = v142;
    v144 = *(_QWORD *)v191;
    v145 = *MEMORY[0x1E0D19B08];
    v146 = *MEMORY[0x1E0D19B18];
    do
    {
      for (k = 0; k != v143; ++k)
      {
        if (*(_QWORD *)v191 != v144)
          objc_enumerationMutation(*((id *)&v189 + 1));
        v148 = *(_QWORD *)(*((_QWORD *)&v190 + 1) + 8 * k);
        v149 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v148);
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v131, "containsObject:", v150))
          v151 = v145;
        else
          v151 = v146;
        +[SGDetectedAttributeMetrics recordExtractionOutcome:fromMessage:foundInSignature:isDDSignature:detection:](SGDetectedAttributeMetrics, "recordExtractionOutcome:fromMessage:foundInSignature:isDDSignature:detection:", v151, v184, 1, v185 != 0x7FFFFFFFFFFFFFFFLL, v148);

        objc_autoreleasePoolPop(v149);
      }
      v143 = objc_msgSend(*((id *)&v189 + 1), "countByEnumeratingWithState:objects:count:", &v190, v209, 16);
    }
    while (v143);
  }

  v5 = v184;
  v6 = v176;
  v19 = v160;
LABEL_206:

LABEL_207:
  v27 = v154;
LABEL_208:

LABEL_209:
}

- (id)getLineContaining:(_NSRange)a3 inText:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  length = a3.length;
  location = a3.location;
  v6 = a4;
  v7 = objc_msgSend(v6, "rangeOfString:options:range:", CFSTR("\n"), 6, 0, location);
  v9 = v8;
  v10 = objc_msgSend(v6, "rangeOfString:options:range:", CFSTR("\n"), 2, location + length, objc_msgSend(v6, "length") - (location + length));
  if (!v11)
    v10 = objc_msgSend(v6, "length");
  v12 = v10;
  if (v9)
    v13 = v7 + 1;
  else
    v13 = 0;
  v14 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v6, "substringWithRange:", v13, v12 - v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v14);

  return v15;
}

- (id)detailTypeFromPrefix:(id)a3 detectedLabelPointer:(_NSRange *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  _NSRange *v18;
  uint64_t v19;
  const char *v20;
  __int128 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v5 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__20702;
  v26 = __Block_byref_object_dispose__20703;
  v27 = 0;
  v17 = 0;
  v18 = (_NSRange *)&v17;
  v19 = 0x3010000000;
  v20 = "";
  v21 = xmmword_1C385A570;
  +[SGDetectedAttributeDissector patterns](SGDetectedAttributeDissector, "patterns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rawValueForKey:", CFSTR("DetailTypes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  regex2ForKey(CFSTR("DetailType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "count");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__SGDetectedAttributeDissector_detailTypeFromPrefix_detectedLabelPointer___block_invoke;
  v13[3] = &unk_1E7DAF8D8;
  v10 = v7;
  v14 = v10;
  v15 = &v22;
  v16 = &v17;
  objc_msgSend(v8, "enumerateMatchesInString:ngroups:block:", v5, v9, v13);

  if (a4)
    *a4 = v18[2];
  v11 = (id)v23[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v22, 8);

  return v11;
}

- (id)detailTypeFromPrefix:(id)a3
{
  return -[SGDetectedAttributeDissector detailTypeFromPrefix:detectedLabelPointer:](self, "detailTypeFromPrefix:detectedLabelPointer:", a3, 0);
}

- (unint64_t)selfIdentificationMessageCount
{
  return self->_selfIdentificationMessageCount;
}

- (void)setSelfIdentificationMessageCount:(unint64_t)a3
{
  self->_selfIdentificationMessageCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreNLPTrustedLanguages, 0);
  objc_storeStrong((id *)&self->_ddTrustedLanguages, 0);
  objc_storeStrong((id *)&self->_hmmTrustedLanguages, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_contactsHelper, 0);
  objc_storeStrong((id *)&self->_mlQR, 0);
  objc_storeStrong((id *)&self->_ml, 0);
}

uint64_t __74__SGDetectedAttributeDissector_detailTypeFromPrefix_detectedLabelPointer___block_invoke(uint64_t a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = -1;
  v5 = 24;
  while (objc_msgSend(*(id *)(a1 + 32), "count") > (unint64_t)++v4)
  {
    v6 = *(_QWORD *)((char *)a2 + v5);
    v5 += 24;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = *a2;
      return 0;
    }
  }
  return 0;
}

uint64_t __69__SGDetectedAttributeDissector__removeUnwantedContactDetails_entity___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v5;
  void *v6;
  int IsContact;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  int IsContactDetail;
  NSObject *v18;
  uint64_t v19;
  void *v21;
  void *v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "duplicateKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entityType");
  IsContact = SGEntityTypeIsContact();
  if (IsContact)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v5, "duplicateKey");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "identityKey");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "containsObject:", v3))
    {

LABEL_18:
      v19 = 1;
      goto LABEL_19;
    }
  }
  objc_msgSend(v5, "duplicateKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "entityType") == 20)
  {
    v23 = a1;
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v5, "duplicateKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contactDetailKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identityKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "containsObject:", v13);

    if ((IsContact & 1) != 0)
    {

    }
    a1 = v23;
    if ((v14 & 1) != 0)
      goto LABEL_18;
  }
  else
  {

    if (IsContact)
    {

    }
  }
  objc_msgSend(v5, "duplicateKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "entityType");
  if (SGEntityTypeIsContact())
  {

  }
  else
  {
    objc_msgSend(v5, "duplicateKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "entityType");
    IsContactDetail = SGEntityTypeIsContactDetail();

    if (!IsContactDetail)
      goto LABEL_18;
  }
  sgLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 40), "duplicateKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "duplicateKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v21;
    v26 = 2112;
    v27 = v22;
    _os_log_debug_impl(&dword_1C3607000, v18, OS_LOG_TYPE_DEBUG, "Unexpected Contact detail found in forwarded or inhuman text message: %@ %@", buf, 0x16u);

  }
  v19 = 0;
LABEL_19:

  return v19;
}

void __99__SGDetectedAttributeDissector_handleTextMessageSelfIdentification_entity_withConversationHistory___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint8_t v16[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "enrichments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v7, "duplicateKey");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "entityType") == 4)
        {
          objc_msgSend(v7, "title");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "length");

          if (v10)
          {
            sgLogHandle();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v16 = 0;
              _os_log_debug_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEBUG, "Self-id: doesn't look for self id if message has a display name", v16, 2u);
            }

            objc_msgSend(v7, "title");
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v15 = *(void **)(v14 + 40);
            *(_QWORD *)(v14 + 40) = v13;

            goto LABEL_16;
          }
        }
        else
        {

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_16:

}

void __99__SGDetectedAttributeDissector_handleTextMessageSelfIdentification_entity_withConversationHistory___block_invoke_119(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id obj;
  uint8_t buf[16];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "author");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGIdentityKey keyForPersonHandle:](SGIdentityKey, "keyForPersonHandle:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v22 = a1;
  objc_msgSend(*(id *)(a1 + 32), "enrichments");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v4)
  {
LABEL_15:

LABEL_18:
    sgLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v15, OS_LOG_TYPE_DEFAULT, "Self-id: Could not find author-pseudocontact to augment with text message self-identification.", buf, 2u);
    }
    goto LABEL_20;
  }
  v5 = v4;
  v6 = *(_QWORD *)v26;
LABEL_3:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v26 != v6)
      objc_enumerationMutation(obj);
    v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v7);
    objc_msgSend(v8, "duplicateKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "entityType") == 4 && v3 != 0)
      break;

LABEL_13:
    if (v5 == ++v7)
    {
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v5)
        goto LABEL_3;
      goto LABEL_15;
    }
  }
  objc_msgSend(v8, "duplicateKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pseudoContactKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identityKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToIdentityKey:", v3);

  if ((v14 & 1) == 0)
    goto LABEL_13;
  v15 = v8;

  if (!v15)
    goto LABEL_18;
  objc_msgSend(*(id *)(v22 + 40), "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setTitle:](v15, "setTitle:", v16);

  objc_msgSend(*(id *)(v22 + 40), "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setContent:](v15, "setContent:", v17);

  v18 = objc_msgSend(*(id *)(v22 + 40), "contextRange");
  -[NSObject setContentRangeOfInterest:](v15, "setContentRangeOfInterest:", v18, v19);
  objc_msgSend(*(id *)(v22 + 40), "extractionInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setExtractionInfo:](v15, "setExtractionInfo:", v20);

  objc_msgSend(MEMORY[0x1E0D197F0], "fromTextMessage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject addTag:](v15, "addTag:", v21);

  objc_msgSend(*(id *)(v22 + 32), "setContactInformationExtracted:", 1);
LABEL_20:

}

uint64_t __103__SGDetectedAttributeDissector_handleTextMessageBirthdayCongratulation_entity_withConversationHistory___block_invoke(uint64_t a1, _OWORD *a2)
{
  *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = *a2;
  return 0;
}

void __103__SGDetectedAttributeDissector_handleTextMessageBirthdayCongratulation_entity_withConversationHistory___block_invoke_2(void *a1, int a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D197F0];
  v4 = a1;
  objc_msgSend(v3, "isSent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (a2)
    objc_msgSend(v4, "addTag:", v5);
  else
    objc_msgSend(v4, "removeTag:", v5);

}

uint64_t __103__SGDetectedAttributeDissector_detectionFromBodyDDMatch_message_withSupervisionToFill_isUnlikelyPhone___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void *context;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "setRegexBelongsToSender:", 1);
  if ((objc_msgSend(*(id *)(a1 + 40), "isTrivial") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "existsInString:", *(_QWORD *)(a1 + 48)),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    v6 = objc_msgSend(*(id *)(a1 + 56), "matchType");
    v7 = v6;
    if ((_DWORD)v6)
    {
      if ((_DWORD)v6 == 3)
      {
        v8 = (id)*MEMORY[0x1E0D19D80];
      }
      else
      {
        v8 = 0;
        v7 = 1;
      }
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(MEMORY[0x1E0D19820], "extractionInfoWithExtractionType:modelVersion:confidence:", 2, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "textContent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(a1 + 56), "valueRange");
    v13 = v12;
    objc_msgSend(*(id *)(a1 + 56), "valueString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v8;
    if (!v8)
    {
      context = (void *)MEMORY[0x1C3BD4F6C]();
      v16 = *(void **)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", *a2, a2[1]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "detailTypeFromPrefix:", v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(context);
    }
    objc_msgSend(*(id *)(a1 + 56), "labelRange");
    LOBYTE(v24) = *(_BYTE *)(a1 + 88);
    LOBYTE(v23) = v18 != 0;
    +[SGDetection detectionWithType:text:matchRange:matchString:label:hasPhoneLabel:extractionInfo:isUnlikelyPhone:](SGDetection, "detectionWithType:text:matchRange:matchString:label:hasPhoneLabel:extractionInfo:isUnlikelyPhone:", v7, v10, v11, v13, v14, v15, v23, v9, v24);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    if (!v8)
  }
  else
  {
    sgLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "DataDetector is not a definitive match: Anti-pattern.", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setRegexDoesNotBelongToSender:", 1);
  }
  return 0;
}

+ (id)dissectorWithMockedMLTrainingForTests
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithML:withMLQR:andHealthStore:", 0, 0, 0);
}

+ (BOOL)isTwoPersonConversation:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  BOOL v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  unint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 <= 2)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v3, "sender");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v7, "initWithArray:", v9);

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v3, "recipients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v11)
    {
      v12 = v11;
      v25 = v5;
      v13 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v15, "handleIdentifier", v25);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "sender");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v16, "isEqualToString:", v18);

          if (v19)
          {
            v20 = objc_alloc(MEMORY[0x1E0C99E60]);
            objc_msgSend(v15, "handles");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)objc_msgSend(v20, "initWithArray:", v21);
            v23 = objc_msgSend(v22, "isEqual:", v26);

            if (v23)
            {
              v5 = v25 - 1;
              goto LABEL_14;
            }
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v12)
          continue;
        break;
      }
      v5 = v25;
    }
LABEL_14:

    v6 = v5 == 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)_logSelfIDForMessage:(id)a3 detection:(id)a4 modelType:(SGMSelfIdModelType_)a5 modelVersion:(unint64_t)a6
{
  id v8;
  SGSelfIDSupervision *v9;
  uint64_t v10;
  uint64_t v11;
  SGSelfIDSupervision *v12;
  unsigned int *v13;
  _BOOL4 v14;
  id v15;

  v15 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = [SGSelfIDSupervision alloc];
    v10 = objc_msgSend(v8, "contextRange");
    v12 = -[SGSelfIDSupervision initWithMessage:candidateName:](v9, "initWithMessage:candidateName:", v15, v10, v11);
    if (-[SGSelfIDSupervision isPositiveExample](v12, "isPositiveExample"))
    {
      v13 = (unsigned int *)MEMORY[0x1E0D19CF0];
    }
    else
    {
      v14 = -[SGSelfIDSupervision isNegativeExample](v12, "isNegativeExample");
      v13 = (unsigned int *)MEMORY[0x1E0D19CE8];
      if (v14)
        v13 = (unsigned int *)MEMORY[0x1E0D19CE0];
    }
    +[SGDetectedAttributeMetrics recordSelfIdModelScore:model:supervision:](SGDetectedAttributeMetrics, "recordSelfIdModelScore:model:supervision:", 1, a5.var0, *v13);

  }
  else
  {
    +[SGDetectedAttributeMetrics recordSelfIdModelScore:model:supervision:](SGDetectedAttributeMetrics, "recordSelfIdModelScore:model:supervision:", 0, a5.var0, *MEMORY[0x1E0D19CE8]);
  }

}

+ (BOOL)isAddressContext:(id)a3
{
  return attributionPatternMatches(a3, CFSTR("MyAddress/F"), CFSTR("NotMyAddress/F"), (uint64_t)CFSTR("%ADDRESS%"), 1u);
}

+ (BOOL)isPhoneContext:(id)a3
{
  return attributionPatternMatches(a3, CFSTR("MyPhone/F"), CFSTR("NotMyPhone/F"), (uint64_t)CFSTR("%PHONE%"), 0);
}

+ (BOOL)isMaybeNameContext:(id)a3
{
  void *v3;
  BOOL v4;

  _PASNormalizeUnicodeStringMinimally();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = attributionRegexpMatches(CFSTR("MyName/F"), v3);

  return v4;
}

+ (BOOL)isNameRequest:(id)a3
{
  void *v3;
  BOOL v4;

  _PASNormalizeUnicodeString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = attributionRegexpMatches(CFSTR("NameRequest/F"), v3);

  return v4;
}

+ (BOOL)isBirthdayContext:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("%DATE%"), 2);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    _PASNormalizeUnicodeString();
  else
    textToMatch(v4, v4 + v5, v3, 3u);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = attributionRegexpMatches(CFSTR("BirthdayDate/F"), v6) || attributionRegexpMatches(CFSTR("Birthday/F"), v6);
  return v7;
}

+ (id)patterns
{
  if (patterns_onceToken_20897 != -1)
    dispatch_once(&patterns_onceToken_20897, &__block_literal_global_135_20898);
  return (id)patterns_patterns_20899;
}

+ (id)currentPatterns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "patterns");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "regex2ForKey:", CFSTR("MyAddress/F"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(v2, "regex2ForKey:", CFSTR("NotMyAddress/F"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  objc_msgSend(v2, "regex2ForKey:", CFSTR("MyPhone/F"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  objc_msgSend(v2, "regex2ForKey:", CFSTR("NotMyPhone/F"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  objc_msgSend(v2, "regex2ForKey:", CFSTR("MyName/F"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(v2, "regex2ForKey:", CFSTR("NameRequest/F"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)clearConversationCache
{
  id v2;

  +[SGTextMessageConversationTracker instance](SGTextMessageConversationTracker, "instance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clear");

}

void __40__SGDetectedAttributeDissector_patterns__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[SGPatterns patternsForClass:](SGPatterns, "patternsForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)patterns_patterns_20899;
  patterns_patterns_20899 = v0;

}

@end
