@implementation SGStructuredEventDissector

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  NSObject *v29;
  const char *v30;
  void *v31;
  _BOOL4 v32;
  int v33;
  const char *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  SGSimpleMailMessage *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  void *v60;
  NSObject *v61;
  _BOOL4 v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  NSObject *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  unsigned int v76;
  void *v77;
  unsigned int v78;
  void *v79;
  void *v80;
  void *context;
  _QWORD v83[5];
  _QWORD v84[2];
  _QWORD v85[2];
  _BYTE buf[24];
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  context = (void *)MEMORY[0x1C3BD4F6C]();
  v79 = (void *)mach_absolute_time();
  objc_msgSend(v7, "from");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emailAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    +[SGStructuredEventExtractionModel sharedInstance](SGStructuredEventExtractionModel, "sharedInstance");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(MEMORY[0x1E0D198F0], "detectStructuredEventsML");
    objc_msgSend(v7, "from");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "emailAddress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[NSObject isSenderSupportedForExtraction:](v12, "isSenderSupportedForExtraction:", v15);

    objc_msgSend(v7, "from");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "emailAddress");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = -[NSObject isSenderSupportedForShadowExtraction:](v12, "isSenderSupportedForShadowExtraction:", v18);

    objc_msgSend(v7, "from");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "emailAddress");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = -[NSObject isSenderSupportedForMLDefaultExtraction:](v12, "isSenderSupportedForMLDefaultExtraction:", v20);

    objc_msgSend(v7, "from");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "emailAddress");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[NSObject isSenderSupportedForPFLTraining:](v12, "isSenderSupportedForPFLTraining:", v22);

    sgEventsLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v15 & (v13 ^ 1);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v26 = CFSTR("NO");
      if (v16)
        v27 = CFSTR("YES");
      else
        v27 = CFSTR("NO");
      if ((_DWORD)v25)
        v28 = CFSTR("YES");
      else
        v28 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v28;
      if ((_DWORD)v23)
        v26 = CFSTR("YES");
      *(_WORD *)&buf[22] = 2112;
      v87 = (uint64_t (*)(uint64_t, uint64_t))v26;
      _os_log_impl(&dword_1C3607000, v24, OS_LOG_TYPE_DEFAULT, "SGStructuredEventDissector: extractionSupported: %@, shadowExtraction: %@, pflTraining: %@", buf, 0x20u);
    }

    if (((v13 | v16 | v25) & 1) != 0)
    {
      if (+[SGExtractionDissector emailIsForwardOrReply:](SGExtractionDissector, "emailIsForwardOrReply:", v7))
      {
        sgEventsLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
LABEL_20:

          goto LABEL_21;
        }
        *(_WORD *)buf = 0;
        v30 = "SGStructuredEventDissector: ignoring Forwarded / Reply email";
LABEL_16:
        _os_log_impl(&dword_1C3607000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 2u);
        goto LABEL_20;
      }
      objc_msgSend(v7, "htmlBody");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31 == 0;

      if (v32)
      {
        sgEventsLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C3607000, v29, OS_LOG_TYPE_ERROR, "SGStructuredEventDissector: Entity has no content", buf, 2u);
        }
        goto LABEL_20;
      }
      if (((objc_msgSend(v8, "hasEventEnrichment") ^ 1 | v78 | v25) & 1) != 0)
      {
        if (objc_msgSend(v9, "backpressureHazard") == 1)
          v33 = v25;
        else
          v33 = 0;
        if (v33 == 1)
        {
          sgEventsLogHandle();
          v29 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            goto LABEL_20;
          *(_WORD *)buf = 0;
          v30 = "SGStructuredEventDissector: skipping shadowLogging extraction for realtime dissection";
          goto LABEL_16;
        }
        objc_msgSend(v8, "sourceKey");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v35, "isEqualToString:", CFSTR("suggest_tool"));

        if (v76)
        {
          v36 = (void *)objc_opt_new();
          objc_msgSend(v36, "eventClassificationWithoutXPCForMailMessage:", v7);
          v29 = objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v37 = (void *)MEMORY[0x1C3BD4F6C]();
          v38 = (void *)objc_opt_new();
          objc_msgSend(v38, "eventClassificationForMailMessage:", v7);
          v29 = objc_claimAutoreleasedReturnValue();

          objc_autoreleasePoolPop(v37);
        }
        if (!v29)
        {
          sgEventsLogHandle();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1C3607000, v39, OS_LOG_TYPE_ERROR, "SGStructuredEventDissector: eventClassification is nil, bailing", buf, 2u);
          }
          goto LABEL_80;
        }
        if (!-[NSObject useCase](v29, "useCase")
          || -[NSObject useCase](v29, "useCase") == 1)
        {
          sgEventsLogHandle();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C3607000, v39, OS_LOG_TYPE_DEFAULT, "SGStructuredEventDissector: Not classified as event, bailing", buf, 2u);
          }
          goto LABEL_80;
        }
        sgEventsLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v29;
          _os_log_debug_impl(&dword_1C3607000, v40, OS_LOG_TYPE_DEBUG, "SGStructuredEventDissector eventClassification: %@", buf, 0xCu);
        }

        +[SGStructuredEventClassification describeCategory:](SGStructuredEventClassification, "describeCategory:", -[NSObject category](v29, "category"));
        v75 = objc_claimAutoreleasedReturnValue();
        if (_os_feature_enabled_impl())
        {
          v41 = [SGSimpleMailMessage alloc];
          -[SGSimpleMailMessage convertMailMessageToBMMailMessage:](v41, "convertMailMessageToBMMailMessage:", v7);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v42, "encodeAsProto");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = (void *)objc_opt_new();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v87 = __Block_byref_object_copy__13416;
          v88 = __Block_byref_object_dispose__13417;
          v89 = 0;
          v83[0] = MEMORY[0x1E0C809B0];
          v83[1] = 3221225472;
          v83[2] = __64__SGStructuredEventDissector_dissectMailMessage_entity_context___block_invoke;
          v83[3] = &unk_1E7DB0D40;
          v83[4] = buf;
          v44 = objc_msgSend(v43, "foundInEventResultWithSerializedDocument:documentType:completion:", v72, 0, v83);
          if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
          {
            v45 = (void *)MEMORY[0x1C3BD4F6C](v44);
            objc_msgSend((id)objc_opt_class(), "schemaOrgAndMissingEntitiesForDUFoundInEvent:eventClassification:fromSuggestTool:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v29, v76);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_autoreleasePoolPop(v45);
            objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("schema"));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v77 = 0;
            v46 = 0;
          }
          _Block_object_dispose(buf, 8);

        }
        else
        {
          if (v76)
          {
            v47 = (void *)objc_opt_class();
            objc_msgSend(v7, "htmlBody");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "subject");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "creationTimestamp");
            v50 = v49;
            objc_msgSend((id)objc_opt_class(), "labelsWithMatchingStringsForMailMessage:", v7);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "preprocessWithoutXPCForHTML:subject:epoch:category:labelsWithMatchingStrings:", v73, v48, v75, v51, v50);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v70 = (void *)MEMORY[0x1C3BD4F6C]();
            objc_msgSend(v7, "htmlBody");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "subject");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "creationTimestamp");
            v54 = v53;
            objc_msgSend((id)objc_opt_class(), "labelsWithMatchingStringsForMailMessage:", v7);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGStructuredEventDissector preprocessHTML:subject:epoch:category:labelsWithMatchingStrings:](self, "preprocessHTML:subject:epoch:category:labelsWithMatchingStrings:", v74, v52, v75, v55, v54);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            objc_autoreleasePoolPop(v70);
          }
          if (!v42)
          {
            sgEventsLogHandle();
            v67 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1C3607000, v67, OS_LOG_TYPE_ERROR, "SGStructuredEventDissector: Preprocessed document is nil", buf, 2u);
            }

            goto LABEL_79;
          }
          objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("crossTags"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v72, "count"))
          {
            sgEventsLogHandle();
            v68 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1C3607000, v68, OS_LOG_TYPE_ERROR, "SGStructuredEventDissector: Empty enrichedTaggedCharacterRanges", buf, 2u);
            }

            goto LABEL_79;
          }
          objc_msgSend(v8, "releaseDissectorLock");
          v56 = objc_msgSend(v8, "hasEventEnrichment");
          if ((v23 & v56) == 1)
            v23 = objc_msgSend((id)objc_opt_class(), "eventEnrichmentContainsReverseMappedTags:", v8);
          v71 = (void *)MEMORY[0x1C3BD4F6C]();
          objc_msgSend((id)objc_opt_class(), "schemaOrgAndMissingEntitiesForPreprocessed:eventClassification:fromSuggestTool:addressThreshold:pflTrainable:hasEvent:", v42, v29, v76, -[NSObject addressComponentThreshold](v12, "addressComponentThreshold"), v23, v56);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_autoreleasePoolPop(v71);
          objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("schema"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(v8, "acquireDissectorLock");
        v57 = mach_absolute_time();
        v58 = SGMachTimeToNanoseconds(v57 - (_QWORD)v79);
        v80 = (void *)MEMORY[0x1C3BD4F6C]();
        v59 = v58 / 0xF4240;
        if (v46)
        {
          v84[0] = CFSTR("mergedSchema");
          v84[1] = CFSTR("diff");
          v85[0] = v46;
          v85[1] = &stru_1E7DB83A8;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 2);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          sgEventsLogHandle();
          v61 = objc_claimAutoreleasedReturnValue();
          v62 = os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
          if ((_DWORD)v25)
          {
            if (v62)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C3607000, v61, OS_LOG_TYPE_DEFAULT, "SGStructuredEventDissector: Event found, adding shadow log", buf, 2u);
            }

            BYTE1(v69) = v78;
            LOBYTE(v69) = 1;
            objc_msgSend((id)objc_opt_class(), "logMLExtractionForSchema:mergedSchemaAndDiff:parentEntity:timingProcessingInMs:eventClassification:mailMessage:shadowExtraction:mlDefaultExtraction:", v46, v60, v8, v59, v29, v7, v69);
          }
          else
          {
            if (v62)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C3607000, v61, OS_LOG_TYPE_DEFAULT, "SGStructuredEventDissector: Event found, adding ML log and enrichment", buf, 2u);
            }

            if (v78)
            {
              objc_msgSend((id)objc_opt_class(), "mergeFallbackSchema:parentEntity:", v46, v8);
              v66 = objc_claimAutoreleasedReturnValue();

              v60 = (void *)v66;
            }
            BYTE1(v69) = v78;
            LOBYTE(v69) = 0;
            objc_msgSend((id)objc_opt_class(), "logMLExtractionForSchema:mergedSchemaAndDiff:parentEntity:timingProcessingInMs:eventClassification:mailMessage:shadowExtraction:mlDefaultExtraction:", v46, v60, v8, v59, v29, v7, v69);
            objc_msgSend((id)objc_opt_class(), "addSchemaAsEnrichment:inMessage:parentEntity:eventClassification:mlDefaultExtraction:", v60, v7, v8, v29, v78);
            objc_msgSend((id)objc_opt_class(), "logMLInteractions:context:mlDefaultExtraction:", v8, v9, v78);
          }

          objc_autoreleasePoolPop(v80);
        }
        else
        {
          v63 = (void *)objc_opt_class();
          objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("missingEntities"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("ml_summary"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "logFailedExtractionWithClassification:missingEntities:mlSummary:shadowExtraction:timingProcessingInMs:forMessage:parentEntity:", v29, v64, v65, v25, v59, v7, v8);

          objc_autoreleasePoolPop(v80);
        }
LABEL_79:
        v39 = v75;
LABEL_80:

        goto LABEL_20;
      }
      sgEventsLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        goto LABEL_20;
      *(_WORD *)buf = 0;
      v34 = "SGStructuredEventDissector: Previous dissector found event, bailing";
    }
    else
    {
      sgEventsLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        goto LABEL_20;
      *(_WORD *)buf = 0;
      v34 = "SGStructuredEventDissector: Skipping reverse template dissector: detectStructuredEventsML is OFF and provide"
            "r is not in whitelist";
    }
    _os_log_debug_impl(&dword_1C3607000, v29, OS_LOG_TYPE_DEBUG, v34, buf, 2u);
    goto LABEL_20;
  }
  sgEventsLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEFAULT, "SGStructuredEventDissector: No sender for mailMessage, bailing", buf, 2u);
  }
LABEL_21:

  objc_autoreleasePoolPop(context);
}

- (id)preprocessHTML:(id)a3 subject:(id)a4 epoch:(double)a5 category:(id)a6 labelsWithMatchingStrings:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "parseHTML:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "preprocessDomParserResult:subject:epoch:category:labelsWithMatchingStrings:", v16, v13, v12, v11, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)tagsWithModelOutputFromEnrichedTaggedCharacterRanges:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  v3 = a3;
  +[SGStructuredEventExtractionModel sharedInstance](SGStructuredEventExtractionModel, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelInferences:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[SGExtractionModel enrichTaggedCharacterRangesWithModelOutput:usingInputCharacterRanges:](SGStructuredEventExtractionModel, "enrichTaggedCharacterRangesWithModelOutput:usingInputCharacterRanges:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    sgEventsLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1C3607000, v7, OS_LOG_TYPE_ERROR, "SGStructuredEventDissector: no extraction model inferences.", v9, 2u);
    }

    objc_autoreleasePoolPop((void *)MEMORY[0x1C3BD4F6C]());
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

void __64__SGStructuredEventDissector_dissectMailMessage_entity_context___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint8_t v9[16];

  v5 = a2;
  if (a3)
  {
    sgEventsLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEFAULT, "SGStructuredEventsDissector: FoundInEvents DU XPC call error", v9, 2u);
    }

  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken3 != -1)
    dispatch_once(&sharedInstance__pasOnceToken3, &__block_literal_global_28);
  return (id)sharedInstance__pasExprOnceResult_13690;
}

+ (id)mergeFallbackSchema:(id)a3 parentEntity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  id v35;
  _BYTE v36[128];
  _QWORD v37[2];
  _QWORD v38[4];

  v38[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v37[0] = CFSTR("mergedSchema");
  v37[1] = CFSTR("diff");
  v38[0] = v6;
  v38[1] = &stru_1E7DB83A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hasEventEnrichment"))
  {
    objc_msgSend(a1, "eventEnrichmentFromEntity:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      objc_msgSend(v9, "tags");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v31;
LABEL_5:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v15);
          if ((objc_msgSend(v16, "isSchemaOrg") & 1) != 0)
            break;
          if (v13 == ++v15)
          {
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
            if (v13)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
        objc_msgSend(v16, "value");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
          goto LABEL_18;
        v18 = (void *)MEMORY[0x1E0CB36D8];
        objc_msgSend(v17, "dataUsingEncoding:", 4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0;
        objc_msgSend(v18, "JSONObjectWithData:options:error:", v19, 0, &v29);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v29;

        if (v20 && objc_msgSend(v20, "count"))
        {
          v28 = v21;
          v22 = (void *)objc_opt_new();
          v35 = v6;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "firstObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v24;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "mergeSchemas:withExpectedSchemas:", v23, v25);
          v27 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v27;
          v21 = v28;
        }

      }
      else
      {
LABEL_11:
        v17 = v11;
      }

    }
LABEL_18:

  }
  return v8;
}

+ (void)addSchemaAsEnrichment:(id)a3 inMessage:(id)a4 parentEntity:(id)a5 eventClassification:(id)a6 mlDefaultExtraction:(BOOL)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id obj;
  uint64_t v37;
  _BOOL4 v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  void *v49;
  _BYTE v50[128];
  _QWORD v51[3];

  v38 = a7;
  v51[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v40 = a6;
  v13 = (void *)objc_opt_new();
  v35 = v10;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("mergedSchema"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v13;
  v41 = v11;
  objc_msgSend(v13, "enrichmentsFromSchemas:inMessage:parentEntity:", v14, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v15;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (v42)
  {
    v37 = *(_QWORD *)v44;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v44 != v37)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(MEMORY[0x1E0D197F0], "extractedFromTemplateWithName:", CFSTR("ML"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addTag:", v19);

        objc_msgSend(MEMORY[0x1E0D197F0], "extractedFromTemplateWithShortName:", CFSTR("ML"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addTag:", v20);

        objc_msgSend(v41, "from");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "emailAddress");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        emailAddressDomain(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(MEMORY[0x1E0D197F0], "domain:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addTag:", v24);

        }
        objc_msgSend(v12, "duplicateKey");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "bundleId");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = objc_alloc(MEMORY[0x1E0D19818]);
        +[SGStructuredEventClassification describeCategory:](SGStructuredEventClassification, "describeCategory:", objc_msgSend(v40, "category"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v39;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v27, "initWithType:categoryDescription:originBundleId:confidence:schemaOrg:participants:eventActivities:", 1, v28, v26, v29, 0, 0, 1.0);

        objc_msgSend(v30, "toJsonString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          objc_msgSend(MEMORY[0x1E0D197F0], "eventMetadata:", v31);
          v32 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addTag:", v32);
        }
        else
        {
          sgLogHandle();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v48 = v30;
            _os_log_error_impl(&dword_1C3607000, v32, OS_LOG_TYPE_ERROR, "Failed to convert object to JSON: %@", buf, 0xCu);
          }
        }

        if (v38)
          objc_msgSend(v12, "addOrReplaceEventEnrichment:", v17);
        else
          objc_msgSend(v12, "addEnrichment:", v17);
        sgEventsLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C3607000, v33, OS_LOG_TYPE_DEFAULT, "SGStructuredEventDissector: Added enrichment", buf, 2u);
        }

        objc_autoreleasePoolPop(v18);
        ++v16;
      }
      while (v42 != v16);
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    }
    while (v42);
  }

}

+ (id)schemaOrgAndMissingEntitiesForPreprocessed:(id)a3 eventClassification:(id)a4 fromSuggestTool:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "schemaOrgAndMissingEntitiesForPreprocessed:eventClassification:fromSuggestTool:addressThreshold:pflTrainable:hasEvent:", v8, v7, v5, 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)schemaOrgAndMissingEntitiesForDUFoundInEvent:(id)a3 eventClassification:(id)a4 fromSuggestTool:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  uint64_t v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  uint64_t v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  __CFString *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  void *v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  const __CFString *v59;
  const __CFString *v60;
  const __CFString *v61;
  const __CFString *v62;
  void *v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  const __CFString *v67;
  const __CFString *v68;
  uint64_t v69;
  const __CFString *v70;
  const __CFString *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  const char *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  NSObject *v99;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  __CFString *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  __CFString *v115;
  uint64_t v116;
  void *v117;
  __CFString *v118;
  __CFString *v119;
  __CFString *v120;
  void *v121;
  void *v122;
  void *v123;
  __CFString *v124;
  __CFString *v125;
  __CFString *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  _QWORD v130[5];
  _QWORD v131[2];
  _QWORD v132[2];
  _QWORD v133[3];
  _QWORD v134[3];
  _QWORD v135[4];
  _QWORD v136[4];
  _QWORD v137[6];
  _QWORD v138[6];
  _QWORD v139[8];
  _QWORD v140[2];
  _QWORD v141[2];
  _QWORD v142[2];
  _QWORD v143[2];
  _QWORD v144[3];
  _QWORD v145[3];
  _QWORD v146[3];
  _QWORD v147[3];
  _QWORD v148[10];
  _QWORD v149[10];
  _QWORD v150[5];
  _QWORD v151[2];
  _QWORD v152[2];
  _QWORD v153[3];
  _QWORD v154[3];
  _QWORD v155[5];
  _QWORD v156[5];
  _QWORD v157[6];
  _QWORD v158[6];
  _QWORD v159[5];
  _QWORD v160[2];
  _QWORD v161[2];
  _QWORD v162[3];
  _QWORD v163[3];
  _QWORD v164[8];
  _QWORD v165[8];
  uint8_t buf[4];
  void *v167;
  _QWORD v168[4];
  _QWORD v169[2];
  _QWORD v170[2];
  _QWORD v171[3];
  _QWORD v172[3];
  _QWORD v173[7];
  _QWORD v174[10];

  v174[7] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  if ((objc_msgSend(v7, "detectedEventPolarity") & 1) == 0)
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E7E10818, CFSTR("missingEntities"));
    goto LABEL_151;
  }
  objc_msgSend(v7, "reservationIdError");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reservationId");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hotelName");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "movieName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startAddressError");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startAddressComponents");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startAddress");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endAddressError");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endAddressComponents");
  v120 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endAddress");
  v119 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startPlaceError");
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startPlace");
  v124 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endPlaceError");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endPlace");
  v118 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v129 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v126 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "guestName");
  v125 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v117 = (void *)v11;
  v123 = (void *)v15;
  v116 = v10;
  switch(objc_msgSend(v8, "category"))
  {
    case 4u:
      v114 = v12;
      v115 = v13;
      if (objc_msgSend(v8, "isCancelled") && v11 && v10 | v129 || v11 && v129 && v126 && !v128 && !v127)
      {
        v164[0] = CFSTR("@context");
        v164[1] = CFSTR("@type");
        v165[0] = CFSTR("http://schema.org");
        v165[1] = CFSTR("http://schema.org/LodgingReservation");
        v16 = (const __CFString *)v129;
        if (!v129)
          v16 = &stru_1E7DB83A8;
        v164[2] = CFSTR("checkinTime");
        v164[3] = CFSTR("checkoutTime");
        v17 = v126;
        if (!v126)
          v17 = &stru_1E7DB83A8;
        v165[2] = v16;
        v165[3] = v17;
        v164[4] = CFSTR("reservationStatus");
        objc_msgSend(a1, "schemaStringForReservationStatus:", objc_msgSend(v8, "isCancelled"));
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (v10)
          v20 = (const __CFString *)v10;
        else
          v20 = &stru_1E7DB83A8;
        v165[4] = v18;
        v165[5] = v20;
        v164[5] = CFSTR("reservationId");
        v164[6] = CFSTR("reservationFor");
        v162[0] = CFSTR("@type");
        v162[1] = CFSTR("name");
        v163[0] = CFSTR("http://schema.org/LodgingBusiness");
        v163[1] = v11;
        v162[2] = CFSTR("address");
        if (v14)
          v21 = v14;
        else
          v21 = &stru_1E7DB83A8;
        if (v13)
          v21 = v13;
        v163[2] = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v163, v162, 3);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v165[6] = v22;
        v164[7] = CFSTR("underName");
        v160[0] = CFSTR("@type");
        v160[1] = CFSTR("name");
        v23 = v125;
        if (!v125)
          v23 = &stru_1E7DB83A8;
        v161[0] = CFSTR("http://schema.org/Person");
        v161[1] = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v161, v160, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v165[7] = v24;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = v165;
        v27 = v164;
        v28 = 8;
        goto LABEL_133;
      }
      objc_msgSend(a1, "tupleWithError:label:", v128, CFSTR("reservationId"));
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v159[0] = v111;
      objc_msgSend(a1, "tupleWithEntity:label:", v11, CFSTR("hotelName"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v159[1] = v84;
      objc_msgSend(a1, "tupleWithError:label:", v127, CFSTR("address"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v159[2] = v85;
      objc_msgSend(a1, "tupleWithEntity:label:", v129, CFSTR("startDate"));
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v159[3] = v86;
      objc_msgSend(a1, "tupleWithEntity:label:", v126, CFSTR("endDate"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v159[4] = v87;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v159, 5);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "nilEntities:", v88);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      sgEventsLogHandle();
      v48 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        goto LABEL_146;
      objc_msgSend(v29, "_pas_componentsJoinedByString:", CFSTR(", "));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v167 = v77;
      v78 = "SGStructuredEventDissector: Missing entities for hotel extraction: %@";
      goto LABEL_145;
    case 5u:
      v114 = v12;
      if (objc_msgSend(v8, "isCancelled")
        && (objc_msgSend(v8, "providerName"), (v31 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
        && ((v31, !v128) || v129)
        || (objc_msgSend(v8, "providerName"), v32 = (void *)objc_claimAutoreleasedReturnValue(), v32, v32)
        && v129
        && v126
        && !v128
        && !v127
        && !v123
        && !v122
        && !v121)
      {
        v148[0] = CFSTR("@context");
        v148[1] = CFSTR("@type");
        v149[0] = CFSTR("http://schema.org");
        v149[1] = CFSTR("http://schema.org/RentalCarReservation");
        v33 = (const __CFString *)v10;
        if (!v10)
          v33 = &stru_1E7DB83A8;
        v149[2] = v33;
        v148[2] = CFSTR("reservationId");
        v148[3] = CFSTR("reservationStatus");
        objc_msgSend(a1, "schemaStringForReservationStatus:", objc_msgSend(v8, "isCancelled"));
        v34 = objc_claimAutoreleasedReturnValue();
        v105 = (void *)v34;
        v35 = (const __CFString *)v129;
        if (!v129)
          v35 = &stru_1E7DB83A8;
        v149[3] = v34;
        v149[4] = v35;
        v148[4] = CFSTR("pickupTime");
        v148[5] = CFSTR("pickupLocation");
        v146[0] = CFSTR("@type");
        v146[1] = CFSTR("address");
        if (v14)
          v36 = v14;
        else
          v36 = &stru_1E7DB83A8;
        if (v13)
          v36 = v13;
        v147[0] = CFSTR("http://schema.org/Place");
        v147[1] = v36;
        v146[2] = CFSTR("name");
        v37 = v124;
        if (!v124)
          v37 = &stru_1E7DB83A8;
        v147[2] = v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v147, v146, 3);
        v38 = objc_claimAutoreleasedReturnValue();
        v103 = (void *)v38;
        v39 = v126;
        if (!v126)
          v39 = &stru_1E7DB83A8;
        v149[5] = v38;
        v149[6] = v39;
        v148[6] = CFSTR("dropoffTime");
        v148[7] = CFSTR("dropoffLocation");
        v144[0] = CFSTR("@type");
        v144[1] = CFSTR("address");
        v40 = v119;
        if (!v119)
          v40 = &stru_1E7DB83A8;
        if (v120)
          v40 = v120;
        v145[0] = CFSTR("http://schema.org/Place");
        v145[1] = v40;
        v144[2] = CFSTR("name");
        v41 = v118;
        if (!v118)
          v41 = &stru_1E7DB83A8;
        v145[2] = v41;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v145, v144, 3);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v149[7] = v42;
        v148[8] = CFSTR("provider");
        v143[0] = CFSTR("http://schema.org/Organization");
        v142[0] = CFSTR("type");
        v142[1] = CFSTR("name");
        objc_msgSend(v8, "providerName");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v143[1] = v43;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v143, v142, 2);
        v109 = v14;
        v44 = v13;
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v149[8] = v45;
        v148[9] = CFSTR("underName");
        v140[0] = CFSTR("@type");
        v140[1] = CFSTR("name");
        v46 = v125;
        if (!v125)
          v46 = &stru_1E7DB83A8;
        v141[0] = CFSTR("http://schema.org/Person");
        v141[1] = v46;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v141, v140, 2);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v149[9] = v47;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v149, v148, 10);
        v48 = objc_claimAutoreleasedReturnValue();

        v13 = v44;
        v14 = v109;

        goto LABEL_134;
      }
      v115 = v13;
      objc_msgSend(a1, "tupleWithError:label:", v128, CFSTR("reservationId"));
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v139[0] = v110;
      objc_msgSend(a1, "tupleWithError:label:", v127, CFSTR("address"));
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v139[1] = v107;
      objc_msgSend(a1, "tupleWithError:label:", v121, CFSTR("endAddress"));
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v139[2] = v104;
      objc_msgSend(a1, "tupleWithError:label:", v123, CFSTR("place"));
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v139[3] = v102;
      objc_msgSend(a1, "tupleWithError:label:", v122, CFSTR("endPlace"));
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v139[4] = v101;
      objc_msgSend(a1, "tupleWithEntity:label:", v129, CFSTR("startDate"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v139[5] = v79;
      objc_msgSend(a1, "tupleWithEntity:label:", v126, CFSTR("endDate"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v139[6] = v80;
      objc_msgSend(v8, "providerName");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "tupleWithEntity:label:", v81, CFSTR("providerName"));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v139[7] = v82;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v139, 8);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "nilEntities:", v83);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      sgEventsLogHandle();
      v48 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        goto LABEL_146;
      objc_msgSend(v29, "_pas_componentsJoinedByString:", CFSTR(", "));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v167 = v77;
      v78 = "SGStructuredEventDissector: Missing entities for car extraction: %@";
      goto LABEL_145;
    case 6u:
      v115 = v13;
      v114 = v12;
      if (objc_msgSend(v8, "isCancelled") && v12 && (!v128 || v129)
        || v12 && v129 && !v128 && !v127 && !v15)
      {
        v157[0] = CFSTR("@context");
        v157[1] = CFSTR("@type");
        v158[0] = CFSTR("http://schema.org");
        v158[1] = CFSTR("http://schema.org/EventReservation");
        v157[2] = CFSTR("reservationStatus");
        objc_msgSend(a1, "schemaStringForReservationStatus:", objc_msgSend(v8, "isCancelled"));
        v49 = objc_claimAutoreleasedReturnValue();
        v106 = (void *)v49;
        if (v10)
          v50 = (const __CFString *)v10;
        else
          v50 = &stru_1E7DB83A8;
        v158[2] = v49;
        v158[3] = v50;
        v157[3] = CFSTR("reservationId");
        v157[4] = CFSTR("reservationFor");
        v155[0] = CFSTR("@type");
        v155[1] = CFSTR("name");
        v156[0] = CFSTR("http://schema.org/Event");
        v156[1] = v12;
        v51 = (const __CFString *)v129;
        if (!v129)
          v51 = &stru_1E7DB83A8;
        v155[2] = CFSTR("startDate");
        v155[3] = CFSTR("endDate");
        v52 = v126;
        if (!v126)
          v52 = &stru_1E7DB83A8;
        v156[2] = v51;
        v156[3] = v52;
        v155[4] = CFSTR("location");
        v153[0] = CFSTR("@type");
        v153[1] = CFSTR("name");
        v53 = v124;
        if (!v124)
          v53 = &stru_1E7DB83A8;
        v154[0] = CFSTR("http://schema.org/Place");
        v154[1] = v53;
        v153[2] = CFSTR("address");
        if (v14)
          v54 = v14;
        else
          v54 = &stru_1E7DB83A8;
        if (v13)
          v54 = v13;
        v154[2] = v54;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v154, v153, 3);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v156[4] = v55;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v156, v155, 5);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v158[4] = v56;
        v157[5] = CFSTR("underName");
        v151[0] = CFSTR("@type");
        v151[1] = CFSTR("name");
        v57 = v125;
        if (!v125)
          v57 = &stru_1E7DB83A8;
        v152[0] = CFSTR("http://schema.org/Person");
        v152[1] = v57;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v152, v151, 2);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v158[5] = v58;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v158, v157, 6);
        v48 = objc_claimAutoreleasedReturnValue();

        v13 = v115;
        v12 = v114;
        goto LABEL_111;
      }
      objc_msgSend(a1, "tupleWithError:label:", v128, CFSTR("reservationId"));
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v150[0] = v112;
      objc_msgSend(a1, "tupleWithEntity:label:", v12, CFSTR("movieName"));
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v150[1] = v89;
      objc_msgSend(a1, "tupleWithError:label:", v15, CFSTR("place"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v150[2] = v90;
      objc_msgSend(a1, "tupleWithError:label:", v127, CFSTR("address"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v150[3] = v91;
      objc_msgSend(a1, "tupleWithEntity:label:", v129, CFSTR("startDate"));
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v150[4] = v92;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v150, 5);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "nilEntities:", v93);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      sgEventsLogHandle();
      v48 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        goto LABEL_146;
      objc_msgSend(v29, "_pas_componentsJoinedByString:", CFSTR(", "));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v167 = v77;
      v78 = "SGStructuredEventDissector: Missing entities for ticket extraction: %@";
      goto LABEL_145;
    case 7u:
      v115 = v13;
      if (objc_msgSend(v8, "isCancelled") && v12 && (!v128 || v129)
        || v12 && v129 && !v128 && !v127 && !v15)
      {
        v137[0] = CFSTR("@context");
        v137[1] = CFSTR("@type");
        v138[0] = CFSTR("http://schema.org");
        v138[1] = CFSTR("http://schema.org/EventReservation");
        v59 = (const __CFString *)v10;
        if (!v10)
          v59 = &stru_1E7DB83A8;
        v138[2] = v59;
        v137[2] = CFSTR("reservationId");
        v137[3] = CFSTR("reservationStatus");
        objc_msgSend(a1, "schemaStringForEventStatus:", objc_msgSend(v8, "isCancelled"));
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        v138[3] = v106;
        v137[4] = CFSTR("reservationFor");
        v135[0] = CFSTR("@type");
        v135[1] = CFSTR("name");
        v136[0] = CFSTR("http://schema.org/ScreeningEvent");
        v136[1] = v12;
        v60 = (const __CFString *)v129;
        if (!v129)
          v60 = &stru_1E7DB83A8;
        v136[2] = v60;
        v135[2] = CFSTR("startDate");
        v135[3] = CFSTR("location");
        v133[0] = CFSTR("@type");
        v133[1] = CFSTR("name");
        v61 = v124;
        if (!v124)
          v61 = &stru_1E7DB83A8;
        v134[0] = CFSTR("http://schema.org/Place");
        v134[1] = v61;
        v133[2] = CFSTR("address");
        if (v14)
          v62 = v14;
        else
          v62 = &stru_1E7DB83A8;
        if (v13)
          v62 = v13;
        v134[2] = v62;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v134, v133, 3);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v136[3] = v55;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v136, v135, 4);
        v63 = v12;
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v138[4] = v64;
        v137[5] = CFSTR("underName");
        v131[0] = CFSTR("@type");
        v131[1] = CFSTR("name");
        v65 = v125;
        if (!v125)
          v65 = &stru_1E7DB83A8;
        v132[0] = CFSTR("http://schema.org/Person");
        v132[1] = v65;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v132, v131, 2);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v138[5] = v66;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v138, v137, 6);
        v48 = objc_claimAutoreleasedReturnValue();

        v13 = v115;
        v12 = v63;
LABEL_111:

        -[NSObject sg_deepCopyWithoutEmptySchemaObjects](v48, "sg_deepCopyWithoutEmptySchemaObjects");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0;
        goto LABEL_147;
      }
      v108 = (void *)objc_opt_class();
      objc_msgSend(a1, "tupleWithError:label:", v128, CFSTR("reservationId"));
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = v12;
      v130[0] = v113;
      objc_msgSend(a1, "tupleWithEntity:label:", v12, CFSTR("movieName"));
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v130[1] = v94;
      objc_msgSend(a1, "tupleWithError:label:", v127, CFSTR("address"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v130[2] = v95;
      objc_msgSend(a1, "tupleWithError:label:", v15, CFSTR("place"));
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v130[3] = v96;
      objc_msgSend(a1, "tupleWithEntity:label:", v129, CFSTR("startDate"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v130[4] = v97;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 5);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "nilEntities:", v98);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      sgEventsLogHandle();
      v48 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        goto LABEL_146;
      objc_msgSend(v29, "_pas_componentsJoinedByString:", CFSTR(", "));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v167 = v77;
      v78 = "SGStructuredEventDissector: Missing entities for movie extraction: %@";
      goto LABEL_145;
    case 8u:
      v114 = v12;
      v115 = v13;
      if (objc_msgSend(v8, "isCancelled") && v11)
      {
        if (!(v10 | v129))
          goto LABEL_135;
LABEL_120:
        v173[0] = CFSTR("@context");
        v173[1] = CFSTR("@type");
        v174[0] = CFSTR("http://schema.org");
        v174[1] = CFSTR("http://schema.org/FoodEstablishmentReservation");
        if (v10)
          v67 = (const __CFString *)v10;
        else
          v67 = &stru_1E7DB83A8;
        v174[2] = v67;
        v173[2] = CFSTR("reservationId");
        v173[3] = CFSTR("reservationStatus");
        objc_msgSend(a1, "schemaStringForReservationStatus:", objc_msgSend(v8, "isCancelled"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v174[3] = v19;
        v173[4] = CFSTR("reservationFor");
        v171[0] = CFSTR("@type");
        v171[1] = CFSTR("name");
        v172[0] = CFSTR("http://schema.org/FoodEstablishment");
        v172[1] = v11;
        v171[2] = CFSTR("address");
        if (v14)
          v68 = v14;
        else
          v68 = &stru_1E7DB83A8;
        if (v13)
          v68 = v13;
        v172[2] = v68;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v172, v171, 3);
        v69 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v69;
        v70 = (const __CFString *)v129;
        if (!v129)
          v70 = &stru_1E7DB83A8;
        v174[4] = v69;
        v174[5] = v70;
        v173[5] = CFSTR("startTime");
        v173[6] = CFSTR("underName");
        v169[0] = CFSTR("@type");
        v169[1] = CFSTR("name");
        v71 = v125;
        if (!v125)
          v71 = &stru_1E7DB83A8;
        v170[0] = CFSTR("http://schema.org/Person");
        v170[1] = v71;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v170, v169, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v174[6] = v24;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = v174;
        v27 = v173;
        v28 = 7;
LABEL_133:
        objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, v28);
        v48 = objc_claimAutoreleasedReturnValue();

LABEL_134:
        -[NSObject sg_deepCopyWithoutEmptySchemaObjects](v48, "sg_deepCopyWithoutEmptySchemaObjects");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0;
        v12 = v114;
        goto LABEL_147;
      }
      if (v11 && v129 && !v128 && !v127)
        goto LABEL_120;
LABEL_135:
      objc_msgSend(a1, "tupleWithEntity:label:", v11, CFSTR("hotelName"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v168[0] = v72;
      objc_msgSend(a1, "tupleWithError:label:", v127, CFSTR("address"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v168[1] = v73;
      objc_msgSend(a1, "tupleWithError:label:", v128, CFSTR("reservationId"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v168[2] = v74;
      objc_msgSend(a1, "tupleWithEntity:label:", v129, CFSTR("startDate"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v168[3] = v75;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v168, 4);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "nilEntities:", v76);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      sgEventsLogHandle();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v29, "_pas_componentsJoinedByString:", CFSTR(", "));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v167 = v77;
        v78 = "SGStructuredEventDissector: Missing entities for restaurant extraction: %@";
LABEL_145:
        _os_log_error_impl(&dword_1C3607000, v48, OS_LOG_TYPE_ERROR, v78, buf, 0xCu);

      }
LABEL_146:
      v30 = 0;
      v12 = v114;
      v13 = v115;
LABEL_147:

      v10 = v116;
LABEL_148:
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v30, CFSTR("schema"));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v29, CFSTR("missingEntities"));
      sgEventsLogHandle();
      v99 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v167 = v9;
        _os_log_impl(&dword_1C3607000, v99, OS_LOG_TYPE_DEFAULT, "SGStructuredEventDissector: foundInEventResult result schema %{private}@", buf, 0xCu);
      }

LABEL_151:
      return v9;
    default:
      v29 = 0;
      v30 = 0;
      goto LABEL_148;
  }
}

+ (id)schemaOrgAndMissingEntitiesForPreprocessed:(id)a3 eventClassification:(id)a4 fromSuggestTool:(BOOL)a5 addressThreshold:(unint64_t)a6 pflTrainable:(BOOL)a7 hasEvent:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SGStructuredEventDocument *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  SGStructuredEventDocument *v23;
  _BOOL4 v24;
  SGStructuredEventDocument *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  const __CFString *v62;
  const __CFString *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  void *v74;
  const __CFString *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  NSObject *v81;
  void *v82;
  const char *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  NSObject *v95;
  void *v96;
  const char *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  NSObject *v106;
  void *v107;
  const __CFString *v108;
  uint64_t v109;
  const __CFString *v110;
  __CFString *v111;
  const __CFString *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v119;
  void *v120;
  void *v121;
  int v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  uint64_t v133;
  id v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  _BOOL4 v147;
  _BOOL4 v148;
  void *v149;
  void *v150;
  id v151;
  void *v152;
  uint64_t v153;
  __CFString *v154;
  id v155;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  id v162;
  void *v163;
  void *v165;
  void *v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  void *v172;
  _QWORD v173[5];
  _QWORD v174[3];
  _QWORD v175[3];
  _QWORD v176[4];
  _QWORD v177[4];
  _QWORD v178[5];
  _QWORD v179[5];
  _QWORD v180[8];
  _QWORD v181[2];
  _QWORD v182[2];
  _QWORD v183[3];
  _QWORD v184[3];
  _QWORD v185[3];
  _QWORD v186[3];
  _QWORD v187[9];
  _QWORD v188[9];
  _QWORD v189[5];
  _QWORD v190[3];
  _QWORD v191[3];
  _QWORD v192[5];
  _QWORD v193[5];
  _QWORD v194[5];
  _QWORD v195[5];
  _QWORD v196[5];
  _QWORD v197[3];
  _QWORD v198[3];
  _QWORD v199[7];
  _QWORD v200[7];
  uint8_t buf[4];
  void *v202;
  _QWORD v203[4];
  _QWORD v204[3];
  _QWORD v205[3];
  _QWORD v206[6];
  _QWORD v207[9];

  v8 = a8;
  v9 = a7;
  v10 = a5;
  v207[6] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("crossTags"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGStructuredEventExtractionModel sharedInstance](SGStructuredEventExtractionModel, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "modelInferences:pflTraining:hasEvent:", v14, v9, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_opt_new();
  v18 = [SGStructuredEventDocument alloc];
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("plainText"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v12;
  v21 = objc_msgSend(v12, "category");
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ddSGDetections"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v18;
  v24 = v10;
  v25 = -[SGStructuredEventDocument initWithPlainText:category:dataDetectorMatches:enrichedTaggedCharacterRanges:modelOutput:fromSuggestTool:](v23, "initWithPlainText:category:dataDetectorMatches:enrichedTaggedCharacterRanges:modelOutput:fromSuggestTool:", v19, v21, v22, v14, v16, v10);

  if (!-[SGStructuredEventDocument detectedEventPolarity](v25, "detectedEventPolarity"))
  {
    objc_msgSend(v17, "setObject:forKeyedSubscript:", &unk_1E7E10830, CFSTR("missingEntities"));
    -[SGStructuredEventDocument modelOutputSummary](v25, "modelOutputSummary");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v35, CFSTR("ml_summary"));

    v29 = v20;
    goto LABEL_115;
  }
  v171 = 0;
  -[SGStructuredEventDocument detectedReservationIdWithError:](v25, "detectedReservationIdWithError:", &v171);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v171;
  -[SGStructuredEventDocument detectedEventName](v25, "detectedEventName");
  v28 = objc_claimAutoreleasedReturnValue();
  v170 = 0;
  -[SGStructuredEventDocument detectedStartAddressWithError:](v25, "detectedStartAddressWithError:", &v170);
  v153 = objc_claimAutoreleasedReturnValue();
  v162 = v170;
  v169 = 0;
  -[SGStructuredEventDocument detectedStartPlaceWithError:](v25, "detectedStartPlaceWithError:", &v169);
  v154 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v155 = v169;
  -[SGStructuredEventDocument detectedStartDateComponents](v25, "detectedStartDateComponents");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = (void *)v26;
  v163 = (void *)v28;
  v29 = v20;
  v151 = v27;
  switch(-[SGStructuredEventDocument category](v25, "category"))
  {
    case 0u:
    case 1u:
    case 2u:
    case 3u:
    case 9u:
      v30 = objc_alloc(MEMORY[0x1E0CB3940]);
      +[SGStructuredEventClassification describeCategory:](SGStructuredEventClassification, "describeCategory:", -[SGStructuredEventDocument category](v25, "category"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v30, "initWithFormat:", CFSTR("Unsupported category: %@"), v31);
      v172 = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v172, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = 0;
      goto LABEL_87;
    case 4u:
      v149 = v16;
      v147 = v24;
      -[SGStructuredEventDocument detectedEndDateComponents](v25, "detectedEndDateComponents");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "isCancelled") && v28)
      {
        if (v26)
          goto LABEL_44;
        objc_msgSend(v166, "date");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
          goto LABEL_44;
      }
      else if (!v28)
      {
        goto LABEL_78;
      }
      objc_msgSend(v166, "date");
      v51 = objc_claimAutoreleasedReturnValue();
      if (v51)
      {
        v52 = (void *)v51;
        objc_msgSend(v143, "date");
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (v53)
        {
          if (!v27 && !v162)
          {
LABEL_44:
            v199[0] = CFSTR("@context");
            v199[1] = CFSTR("@type");
            v200[0] = CFSTR("http://schema.org");
            v200[1] = CFSTR("http://schema.org/LodgingReservation");
            v199[2] = CFSTR("checkinTime");
            objc_msgSend(a1, "schemaStringForDateComponents:", v166);
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            v200[2] = v137;
            v199[3] = CFSTR("checkoutTime");
            v54 = (uint64_t)v143;
            objc_msgSend(a1, "schemaStringForDateComponents:", v143);
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            v200[3] = v140;
            v199[4] = CFSTR("reservationStatus");
            objc_msgSend(a1, "schemaStringForReservationStatus:", objc_msgSend(v20, "isCancelled"));
            v55 = objc_claimAutoreleasedReturnValue();
            v56 = v55;
            v57 = &stru_1E7DB83A8;
            if (v26)
              v57 = (const __CFString *)v26;
            v200[4] = v55;
            v200[5] = v57;
            v199[5] = CFSTR("reservationId");
            v199[6] = CFSTR("reservationFor");
            v197[0] = CFSTR("@type");
            v197[1] = CFSTR("name");
            v198[0] = CFSTR("http://schema.org/LodgingBusiness");
            v198[1] = v163;
            v197[2] = CFSTR("address");
            v36 = (void *)v153;
            objc_msgSend(a1, "schemaPostalAddressForPostalAddressExtraction:addressThreshold:", v153, a6);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v198[2] = v58;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v198, v197, 3);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v200[6] = v59;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v200, v199, 7);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_69;
          }
        }
      }
LABEL_78:
      objc_msgSend(a1, "tupleWithError:label:", v27, CFSTR("reservationId"));
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v196[0] = v157;
      objc_msgSend(a1, "tupleWithEntity:label:", v163, CFSTR("reservationName"));
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v196[1] = v141;
      objc_msgSend(a1, "tupleWithError:label:", v162, CFSTR("address"));
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v196[2] = v138;
      objc_msgSend(v166, "date");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "tupleWithEntity:label:", v136, CFSTR("startDate"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v196[3] = v77;
      objc_msgSend(v143, "date");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "tupleWithEntity:label:", v78, CFSTR("endDate"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v196[4] = v79;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v196, 5);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "nilEntities:", v80);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      sgEventsLogHandle();
      v81 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        goto LABEL_81;
      objc_msgSend(v33, "_pas_componentsJoinedByString:", CFSTR(", "));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v202 = v82;
      v83 = "SGStructuredEventDissector: Missing entities for hotel extraction: %@";
      goto LABEL_117;
    case 5u:
      v150 = v16;
      v148 = v24;
      -[SGStructuredEventDocument detectedEndDateComponents](v25, "detectedEndDateComponents");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v168 = 0;
      -[SGStructuredEventDocument detectedEndAddressWithError:](v25, "detectedEndAddressWithError:", &v168);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v168;
      v167 = 0;
      -[SGStructuredEventDocument detectedEndPlaceWithError:](v25, "detectedEndPlaceWithError:", &v167);
      v133 = objc_claimAutoreleasedReturnValue();
      v134 = v167;
      v137 = v38;
      if (!objc_msgSend(v20, "isCancelled"))
        goto LABEL_15;
      objc_msgSend(v20, "providerName");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v39)
        goto LABEL_15;
      v40 = v39;
      if (v27)
      {
        objc_msgSend(v166, "date");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v41)
        {
LABEL_15:
          objc_msgSend(v20, "providerName");
          v42 = objc_claimAutoreleasedReturnValue();
          if (v42)
          {
            v43 = (void *)v42;
            objc_msgSend(v166, "date");
            v44 = objc_claimAutoreleasedReturnValue();
            if (v44)
            {
              v45 = (void *)v44;
              objc_msgSend(v144, "date");
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              v29 = v20;
              if (!v46 || v27 || v162 || v155 || v134 || v38)
                goto LABEL_89;
              goto LABEL_93;
            }

            v29 = v20;
          }
LABEL_89:
          objc_msgSend(a1, "tupleWithError:label:", v27, CFSTR("reservationId"));
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          v180[0] = v161;
          objc_msgSend(a1, "tupleWithError:label:", v162, CFSTR("address"));
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          v180[1] = v131;
          objc_msgSend(a1, "tupleWithError:label:", v38, CFSTR("endAddress"));
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          v180[2] = v129;
          objc_msgSend(a1, "tupleWithError:label:", v155, CFSTR("place"));
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          v180[3] = v127;
          objc_msgSend(a1, "tupleWithError:label:", v134, CFSTR("endPlace"));
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          v180[4] = v125;
          objc_msgSend(v166, "date");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "tupleWithEntity:label:", v123, CFSTR("startDate"));
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          v180[5] = v121;
          objc_msgSend(v144, "date");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "tupleWithEntity:label:", v120, CFSTR("endDate"));
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v180[6] = v102;
          objc_msgSend(v29, "providerName");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "tupleWithEntity:label:", v103, CFSTR("providerName"));
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v180[7] = v104;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v180, 8);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "nilEntities:", v105);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          sgEventsLogHandle();
          v106 = objc_claimAutoreleasedReturnValue();
          v132 = v106;
          if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v33, "_pas_componentsJoinedByString:", CFSTR(", "));
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v202 = v119;
            _os_log_error_impl(&dword_1C3607000, v106, OS_LOG_TYPE_ERROR, "SGStructuredEventDissector: Missing entities for car extraction: %@", buf, 0xCu);

          }
          v34 = 0;
          v24 = v148;
          v29 = v20;
          v67 = v144;
          v107 = (void *)v133;
          goto LABEL_106;
        }
      }
      else
      {

      }
LABEL_93:
      v187[0] = CFSTR("@context");
      v187[1] = CFSTR("@type");
      v188[0] = CFSTR("http://schema.org");
      v188[1] = CFSTR("http://schema.org/RentalCarReservation");
      if (v26)
        v108 = (const __CFString *)v26;
      else
        v108 = &stru_1E7DB83A8;
      v188[2] = v108;
      v187[2] = CFSTR("reservationId");
      v187[3] = CFSTR("reservationStatus");
      objc_msgSend(a1, "schemaStringForReservationStatus:", objc_msgSend(v29, "isCancelled"));
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v188[3] = v132;
      v187[4] = CFSTR("pickupTime");
      objc_msgSend(a1, "schemaStringForDateComponents:", v166);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v188[4] = v130;
      v187[5] = CFSTR("pickupLocation");
      v186[0] = CFSTR("http://schema.org/Place");
      v185[0] = CFSTR("@type");
      v185[1] = CFSTR("address");
      objc_msgSend(a1, "schemaPostalAddressForPostalAddressExtraction:addressThreshold:", v153, a6);
      v109 = objc_claimAutoreleasedReturnValue();
      v185[2] = CFSTR("name");
      v110 = v154;
      if (!v154)
        v110 = &stru_1E7DB83A8;
      v128 = (void *)v109;
      v186[1] = v109;
      v186[2] = v110;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v186, v185, 3);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      v188[5] = v126;
      v187[6] = CFSTR("dropoffTime");
      objc_msgSend(a1, "schemaStringForDateComponents:", v144);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v188[6] = v124;
      v187[7] = CFSTR("dropoffLocation");
      v184[0] = CFSTR("http://schema.org/Place");
      v183[0] = CFSTR("@type");
      v183[1] = CFSTR("address");
      v122 = objc_msgSend(v140, "hasExtraction");
      if (v122)
      {
        objc_msgSend(a1, "schemaPostalAddressForPostalAddressExtraction:addressThreshold:", v140, a6);
        v111 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v112 = &stru_1E7DB83A8;
      }
      else
      {
        v112 = &stru_1E7DB83A8;
        v111 = &stru_1E7DB83A8;
      }
      v183[2] = CFSTR("name");
      v107 = (void *)v133;
      if (v133)
        v112 = (const __CFString *)v133;
      v184[1] = v111;
      v184[2] = v112;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v184, v183, 3);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v188[7] = v113;
      v187[8] = CFSTR("provider");
      v182[0] = CFSTR("http://schema.org/Organization");
      v181[0] = CFSTR("type");
      v181[1] = CFSTR("name");
      objc_msgSend(v20, "providerName");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v182[1] = v114;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v182, v181, 2);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v188[8] = v115;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v188, v187, 9);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v122)
      v33 = 0;
      v24 = v148;
      v29 = v20;
      v67 = v144;
LABEL_106:

      v16 = v150;
      v36 = (void *)v153;
      v68 = v134;
LABEL_107:

      if (v34)
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v34, CFSTR("schema"));
      goto LABEL_109;
    case 6u:
      v149 = v16;
      -[SGStructuredEventDocument detectedEndDateComponents](v25, "detectedEndDateComponents");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      v147 = v24;
      if (objc_msgSend(v20, "isCancelled") && v28)
      {
        if (!v27
          || (objc_msgSend(v166, "date"), v47 = (void *)objc_claimAutoreleasedReturnValue(), v47, v47))
        {
LABEL_52:
          v194[0] = CFSTR("@context");
          v194[1] = CFSTR("@type");
          v195[0] = CFSTR("http://schema.org");
          v195[1] = CFSTR("http://schema.org/EventReservation");
          v194[2] = CFSTR("reservationStatus");
          objc_msgSend(a1, "schemaStringForReservationStatus:", objc_msgSend(v20, "isCancelled"));
          v61 = objc_claimAutoreleasedReturnValue();
          if (v26)
            v62 = (const __CFString *)v26;
          else
            v62 = &stru_1E7DB83A8;
          v137 = (void *)v61;
          v195[2] = v61;
          v195[3] = v62;
          v194[3] = CFSTR("reservationId");
          v194[4] = CFSTR("reservationFor");
          v192[0] = CFSTR("@type");
          v192[1] = CFSTR("name");
          v193[0] = CFSTR("http://schema.org/Event");
          v193[1] = v163;
          v192[2] = CFSTR("startDate");
          objc_msgSend(a1, "schemaStringForDateComponents:", v166);
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          v193[2] = v140;
          v192[3] = CFSTR("endDate");
          objc_msgSend(a1, "schemaStringForDateComponents:", v143);
          v135 = objc_claimAutoreleasedReturnValue();
          v193[3] = v135;
          v192[4] = CFSTR("location");
          v190[0] = CFSTR("@type");
          v190[1] = CFSTR("name");
          v63 = v154;
          if (!v154)
            v63 = &stru_1E7DB83A8;
          v191[0] = CFSTR("http://schema.org/Place");
          v191[1] = v63;
          v190[2] = CFSTR("address");
          v36 = (void *)v153;
          objc_msgSend(a1, "schemaPostalAddressForPostalAddressExtraction:addressThreshold:", v153, a6);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v191[2] = v64;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v191, v190, 3);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v193[4] = v65;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v193, v192, 5);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v195[4] = v66;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v195, v194, 5);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          v67 = v143;
          v68 = (void *)v135;
          goto LABEL_70;
        }
      }
      else if (!v28)
      {
        goto LABEL_80;
      }
      objc_msgSend(v166, "date");
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      if (v60 && !v27 && !v162 && !v155)
        goto LABEL_52;
LABEL_80:
      objc_msgSend(a1, "tupleWithError:label:", v27, CFSTR("reservationId"));
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      v189[0] = v158;
      objc_msgSend(a1, "tupleWithEntity:label:", v163, CFSTR("reservationName"));
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v189[1] = v142;
      objc_msgSend(a1, "tupleWithError:label:", v155, CFSTR("place"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v189[2] = v84;
      objc_msgSend(a1, "tupleWithError:label:", v162, CFSTR("address"));
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v189[3] = v139;
      objc_msgSend(v166, "date");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "tupleWithEntity:label:", v85, CFSTR("startDate"));
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v189[4] = v86;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v189, 5);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "nilEntities:", v87);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      sgEventsLogHandle();
      v81 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        goto LABEL_81;
      objc_msgSend(v33, "_pas_componentsJoinedByString:", CFSTR(", "));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v202 = v82;
      v83 = "SGStructuredEventDissector: Missing entities for ticket extraction: %@";
LABEL_117:
      _os_log_error_impl(&dword_1C3607000, v81, OS_LOG_TYPE_ERROR, v83, buf, 0xCu);

LABEL_81:
      v24 = v147;
      v29 = v20;

      v34 = 0;
      goto LABEL_86;
    case 7u:
      v149 = v16;
      v147 = v24;
      if (objc_msgSend(v20, "isCancelled") && v28)
      {
        v48 = a1;
        if (!v27
          || (objc_msgSend(v166, "date"), v49 = (void *)objc_claimAutoreleasedReturnValue(), v49, v49))
        {
LABEL_63:
          v178[0] = CFSTR("@context");
          v178[1] = CFSTR("@type");
          v179[0] = CFSTR("http://schema.org");
          v179[1] = CFSTR("http://schema.org/EventReservation");
          if (v26)
            v70 = (const __CFString *)v26;
          else
            v70 = &stru_1E7DB83A8;
          v179[2] = v70;
          v178[2] = CFSTR("reservationId");
          v178[3] = CFSTR("reservationStatus");
          objc_msgSend(v48, "schemaStringForEventStatus:", objc_msgSend(v20, "isCancelled"));
          v71 = v48;
          v54 = objc_claimAutoreleasedReturnValue();
          v179[3] = v54;
          v178[4] = CFSTR("reservationFor");
          v176[0] = CFSTR("@type");
          v176[1] = CFSTR("name");
          v177[0] = CFSTR("http://schema.org/ScreeningEvent");
          v177[1] = v163;
          v176[2] = CFSTR("startDate");
          objc_msgSend(v71, "schemaStringForDateComponents:", v166);
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          v177[2] = v137;
          v176[3] = CFSTR("location");
          v174[0] = CFSTR("@type");
          v174[1] = CFSTR("name");
          v72 = v154;
          if (!v154)
            v72 = &stru_1E7DB83A8;
          v175[0] = CFSTR("http://schema.org/Place");
          v175[1] = v72;
          v174[2] = CFSTR("address");
          v73 = v71;
          v36 = (void *)v153;
          objc_msgSend(v73, "schemaPostalAddressForPostalAddressExtraction:addressThreshold:", v153, a6);
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          v175[2] = v140;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v175, v174, 3);
          v56 = objc_claimAutoreleasedReturnValue();
          v177[3] = v56;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v177, v176, 4);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v179[4] = v58;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v179, v178, 5);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_69:

          v68 = (void *)v56;
          v67 = (void *)v54;
LABEL_70:
          v33 = 0;
          v24 = v147;
          v16 = v149;
          goto LABEL_107;
        }
      }
      else
      {
        v48 = a1;
        if (!v28)
          goto LABEL_82;
      }
      objc_msgSend(v166, "date");
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      if (v69 && !v27 && !v162 && !v155)
        goto LABEL_63;
LABEL_82:
      v88 = objc_opt_class();
      v89 = v27;
      v90 = (void *)v88;
      objc_msgSend(v48, "tupleWithError:label:", v89, CFSTR("reservationId"));
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      v173[0] = v165;
      objc_msgSend(v48, "tupleWithEntity:label:", v163, CFSTR("reservationName"));
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      v173[1] = v159;
      objc_msgSend(v48, "tupleWithError:label:", v162, CFSTR("address"));
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v173[2] = v145;
      objc_msgSend(v48, "tupleWithError:label:", v155, CFSTR("place"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v173[3] = v91;
      objc_msgSend(v166, "date");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "tupleWithEntity:label:", v92, CFSTR("startDate"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v173[4] = v93;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v173, 5);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "nilEntities:", v94);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      sgEventsLogHandle();
      v95 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
        goto LABEL_85;
      objc_msgSend(v33, "_pas_componentsJoinedByString:", CFSTR(", "));
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v202 = v96;
      v97 = "SGStructuredEventDissector: Missing entities for movie extraction: %@";
      goto LABEL_119;
    case 8u:
      if (objc_msgSend(v20, "isCancelled") && v28)
      {
        if (v26)
          goto LABEL_75;
        objc_msgSend(v166, "date");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (v50)
          goto LABEL_75;
      }
      else if (!v28)
      {
        goto LABEL_84;
      }
      objc_msgSend(v166, "date");
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      if (v74 && !v27 && !v162)
      {
LABEL_75:
        v206[0] = CFSTR("@context");
        v206[1] = CFSTR("@type");
        v207[0] = CFSTR("http://schema.org");
        v207[1] = CFSTR("http://schema.org/FoodEstablishmentReservation");
        v75 = &stru_1E7DB83A8;
        if (v26)
          v75 = (const __CFString *)v26;
        v207[2] = v75;
        v206[2] = CFSTR("reservationId");
        v206[3] = CFSTR("reservationStatus");
        objc_msgSend(a1, "schemaStringForReservationStatus:", objc_msgSend(v20, "isCancelled"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v207[3] = v67;
        v206[4] = CFSTR("reservationFor");
        v204[0] = CFSTR("@type");
        v204[1] = CFSTR("name");
        v205[0] = CFSTR("http://schema.org/FoodEstablishment");
        v205[1] = v163;
        v204[2] = CFSTR("address");
        v36 = (void *)v153;
        objc_msgSend(a1, "schemaPostalAddressForPostalAddressExtraction:addressThreshold:", v153, a6);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        v205[2] = v137;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v205, v204, 3);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        v207[4] = v140;
        v206[5] = CFSTR("startTime");
        objc_msgSend(a1, "schemaStringForDateComponents:", v166);
        v76 = objc_claimAutoreleasedReturnValue();
        v207[5] = v76;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v207, v206, 6);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = (void *)v76;
        v33 = 0;
        goto LABEL_107;
      }
LABEL_84:
      v149 = v16;
      v147 = v24;
      objc_msgSend(a1, "tupleWithEntity:label:", v163, CFSTR("reservationName"));
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      v203[0] = v160;
      objc_msgSend(a1, "tupleWithError:label:", v162, CFSTR("address"));
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      v203[1] = v146;
      objc_msgSend(a1, "tupleWithError:label:", v27, CFSTR("reservationId"));
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v203[2] = v98;
      objc_msgSend(v166, "date");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "tupleWithEntity:label:", v99, CFSTR("startDate"));
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v203[3] = v100;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v203, 4);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "nilEntities:", v101);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      sgEventsLogHandle();
      v95 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
        goto LABEL_85;
      objc_msgSend(v33, "_pas_componentsJoinedByString:", CFSTR(", "));
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v202 = v96;
      v97 = "SGStructuredEventDissector: Missing entities for restaurant extraction: %@";
LABEL_119:
      _os_log_error_impl(&dword_1C3607000, v95, OS_LOG_TYPE_ERROR, v97, buf, 0xCu);

LABEL_85:
      v34 = 0;
      v24 = v147;
      v29 = v20;
LABEL_86:
      v16 = v149;
LABEL_87:
      v36 = (void *)v153;
LABEL_109:
      if (v33)
      {
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v33, CFSTR("missingEntities"));

      }
      v27 = v151;
LABEL_112:
      -[SGStructuredEventDocument modelOutputSummary](v25, "modelOutputSummary");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v116, CFSTR("ml_summary"));

      if (v24)
      {
        -[SGStructuredEventDocument predictedStringsFromModelOutput](v25, "predictedStringsFromModelOutput");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v117, CFSTR("ml_plaintext_prediction"));

      }
LABEL_115:

      return v17;
    default:
      v34 = 0;
      v29 = v20;
      v36 = (void *)v153;
      goto LABEL_112;
  }
}

+ (id)preprocessDomParserResult:(id)a3 subject:(id)a4 epoch:(double)a5 category:(id)a6 labelsWithMatchingStrings:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  SGTaggedCharacterRange *v34;
  unsigned int v35;
  __CFString *v36;
  __CFString *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  SGTaggedCharacterRange *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  SGTaggedCharacterRange *v49;
  void *v50;
  void *v51;
  SGTaggedCharacterRange *v52;
  uint64_t k;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t m;
  void *v60;
  void *v61;
  void *v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  id v71;
  id obj;
  uint64_t v73;
  uint64_t v74;
  id v75;
  id v76;
  void *context;
  void *contexta;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint8_t buf[8];
  _QWORD v96[4];
  _QWORD v97[4];
  _BYTE v98[128];
  _BYTE v99[128];
  void *v100;
  SGTaggedCharacterRange *v101;
  _BYTE v102[128];
  __CFString *v103;
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = v14;
  if (v11)
  {
    v70 = v14;
    v71 = v13;
    v68 = v12;
    objc_msgSend(v11, "insertSubject:", v12);
    objc_msgSend(v11, "plainText");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_opt_new();
    v69 = v11;
    objc_msgSend(v11, "taggedCharacterRanges");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v18);

    objc_msgSend(MEMORY[0x1E0D19EC0], "detectLanguageFromText:", v16);
    v19 = objc_claimAutoreleasedReturnValue();
    +[SGPOSTagger sharedInstance](SGPOSTagger, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGStructuredEventExtractionModel sharedInstance](SGStructuredEventExtractionModel, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "gazetteer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (void *)v19;
    objc_msgSend(v20, "tokenizeTextContent:languageHint:gazetteer:", v16, v19, v22);
    v23 = objc_claimAutoreleasedReturnValue();

    context = v17;
    v66 = (void *)v23;
    objc_msgSend(v17, "addObjectsFromArray:", v23);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", a5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGDataDetectorMatch detectionsInPlainText:baseDate:](SGDataDetectorMatch, "detectionsInPlainText:baseDate:", v16, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    obj = v25;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
    if (v26)
    {
      v27 = v26;
      v75 = *(id *)v92;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(id *)v92 != v75)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
          v30 = (void *)MEMORY[0x1C3BD4F6C]();
          v31 = objc_msgSend(v29, "valueRange");
          -[NSObject substringWithRange:](v16, "substringWithRange:", v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = [SGTaggedCharacterRange alloc];
          v35 = objc_msgSend(v29, "matchType");
          v36 = CFSTR("SGDDMatchOther");
          if (v35 <= 8)
            v36 = off_1E7DAE7C8[v35];
          v37 = v36;
          v103 = v37;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v103, 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v29, "valueRange");
          v41 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](v34, "initWithAnnotationType:tags:range:text:", 1, v38, v39, v40, v33);

          objc_msgSend(context, "addObject:", v41);
          objc_autoreleasePoolPop(v30);
        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v104, 16);
      }
      while (v27);
    }

    v42 = (void *)objc_opt_new();
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v43 = context;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v88;
      do
      {
        for (j = 0; j != v45; ++j)
        {
          if (*(_QWORD *)v88 != v46)
            objc_enumerationMutation(v43);
          v48 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * j);
          if (objc_msgSend(v48, "annotationType") == 3)
            objc_msgSend(v42, "addObject:", v48);
        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v87, v102, 16);
      }
      while (v45);
    }
    v65 = v42;

    v49 = [SGTaggedCharacterRange alloc];
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("cat_%@"), v71);
    v100 = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](v49, "initWithAnnotationType:tags:range:text:", 5, v51, 0, 0, &stru_1E7DB83A8);
    v101 = v52;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v76 = v70;
    v74 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
    if (v74)
    {
      v73 = *(_QWORD *)v84;
      do
      {
        for (k = 0; k != v74; ++k)
        {
          if (*(_QWORD *)v84 != v73)
            objc_enumerationMutation(v76);
          v54 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * k);
          contexta = (void *)MEMORY[0x1C3BD4F6C]();
          v79 = 0u;
          v80 = 0u;
          v81 = 0u;
          v82 = 0u;
          objc_msgSend(v76, "objectForKeyedSubscript:", v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v79, v98, 16);
          if (v56)
          {
            v57 = v56;
            v58 = *(_QWORD *)v80;
            do
            {
              for (m = 0; m != v57; ++m)
              {
                if (*(_QWORD *)v80 != v58)
                  objc_enumerationMutation(v55);
                objc_msgSend((id)objc_opt_class(), "annotateContent:withLabel:forMatchingString:", v16, v54, *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * m));
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v60, "count"))
                  objc_msgSend(v43, "addObjectsFromArray:", v60);

              }
              v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v79, v98, 16);
            }
            while (v57);
          }

          objc_autoreleasePoolPop(contexta);
        }
        v74 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
      }
      while (v74);
    }

    +[SGTaggedCharacterRange mergeTaggedCharacterRanges:usingBaseTaggedCharacterRanges:extraTags:tagOverrides:alignWithGroundTruth:](SGTaggedCharacterRange, "mergeTaggedCharacterRanges:usingBaseTaggedCharacterRanges:extraTags:tagOverrides:alignWithGroundTruth:", v43, v65, v64, 0, 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v96[0] = CFSTR("plainText");
    v96[1] = CFSTR("crossTags");
    v97[0] = v16;
    v97[1] = v61;
    v96[2] = CFSTR("tags");
    v96[3] = CFSTR("ddSGDetections");
    v97[2] = v43;
    v97[3] = obj;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, v96, 4);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v68;
    v11 = v69;
    v15 = v70;
    v13 = v71;
  }
  else
  {
    sgEventsLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v16, OS_LOG_TYPE_ERROR, "SGStructuredEventDissector: nil domParserResult", buf, 2u);
    }
    v62 = 0;
  }

  return v62;
}

+ (id)preprocessWithoutXPCForHTML:(id)a3 subject:(id)a4 epoch:(double)a5 category:(id)a6 labelsWithMatchingStrings:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "parseHTML:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "preprocessDomParserResult:subject:epoch:category:labelsWithMatchingStrings:", v17, v14, v13, v12, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)nilEntities:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v17;
  uint8_t buf[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17 = (id)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v9, "first");
        v10 = objc_claimAutoreleasedReturnValue();
        if (!v10)
          goto LABEL_9;
        v11 = v10;
        objc_msgSend(v9, "first");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "first");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "hasExtraction");

          if ((v14 & 1) != 0)
            continue;
LABEL_9:
          objc_msgSend(v9, "second");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v9, "second");
            v11 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v11);
          }
          else
          {
            sgEventsLogHandle();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1C3607000, v11, OS_LOG_TYPE_ERROR, "SGStructuredEventDissector: No name for missing entity", buf, 2u);
            }
          }
          goto LABEL_14;
        }

LABEL_14:
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  return v17;
}

+ (id)tupleWithEntity:(id)a3 label:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0D81638];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithFirst:second:", v7, v6);

  return v8;
}

+ (id)tupleWithError:(id)a3 label:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0D81638];
  v6 = a4;
  v7 = [v5 alloc];
  if (a3)
    v8 = 0;
  else
    v8 = MEMORY[0x1E0C9AAB0];
  v9 = (void *)objc_msgSend(v7, "initWithFirst:second:", v8, v6);

  return v9;
}

+ (id)annotationMatchingStringsForSubject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  +[SGPOSTagger sharedInstance](SGPOSTagger, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tokenizeTextContent:languageHint:", v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  if (objc_msgSend(v6, "count"))
  {
    v8 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "annotationType");

      if (v10 == 2)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "tags");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13
          && ((objc_msgSend(v13, "isEqualToString:", CFSTR("NN")) & 1) != 0
           || objc_msgSend(v13, "isEqualToString:", CFSTR("NNP"))))
        {
          objc_msgSend(v7, "addIndex:", v8);
        }

      }
      ++v8;
    }
    while (objc_msgSend(v6, "count") > v8);
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __66__SGStructuredEventDissector_annotationMatchingStringsForSubject___block_invoke;
  v20[3] = &unk_1E7DB50A8;
  v21 = v6;
  v22 = v3;
  v14 = v4;
  v23 = v14;
  v15 = v3;
  v16 = v6;
  objc_msgSend(v7, "enumerateRangesUsingBlock:", v20);
  v17 = v23;
  v18 = v14;

  return v18;
}

+ (id)labelsWithMatchingStringsForMailMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "from");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("is_sender_name"));

  }
  objc_msgSend(v6, "emailAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "emailAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("is_sender_email"));

    objc_msgSend(v6, "emailAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    emailAddressDomain(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v30 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("is_sender_domain"));

    }
  }
  objc_msgSend(v4, "to");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v17, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("is_recipient_name"));

  }
  objc_msgSend(v17, "emailAddress");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v17, "emailAddress");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("is_recipient_email"));

  }
  objc_msgSend(v4, "subject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v4, "subject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "annotationMatchingStringsForSubject:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v26, "count"))
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("is_present_in_subject"));

  }
  return v5;
}

+ (id)annotateContent:(id)a3 withLabel:(id)a4 forMatchingString:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SGTaggedCharacterRange *v15;
  void *v16;
  void *v17;
  SGTaggedCharacterRange *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  const char *v25;
  uint8_t v26[16];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  if (!objc_msgSend(v7, "length") || !objc_msgSend(v9, "length"))
  {
    sgEventsLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      v25 = "SGStructuredEventDissector: annotateContent: empty content or string passed";
      goto LABEL_19;
    }
LABEL_14:

    goto LABEL_15;
  }
  if (!v8)
  {
    sgEventsLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      v25 = "SGStructuredEventDissector: annotateContent: nil label passed";
LABEL_19:
      _os_log_error_impl(&dword_1C3607000, v23, OS_LOG_TYPE_ERROR, v25, v26, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  v11 = objc_msgSend(v7, "rangeOfString:options:range:", v9, 1, 0, objc_msgSend(v7, "length"));
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = v11;
    v14 = v12;
    do
    {
      v15 = [SGTaggedCharacterRange alloc];
      v27[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "substringWithRange:", v13, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](v15, "initWithAnnotationType:tags:range:text:", 6, v16, v13, v14, v17);

      if (v18)
      {
        objc_msgSend(v10, "addObject:", v18);
      }
      else
      {
        sgEventsLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v26 = 0;
          _os_log_error_impl(&dword_1C3607000, v19, OS_LOG_TYPE_ERROR, "SGStructuredEventDissector: annotateContent: Unable to create taggedCharacterRange from result", v26, 2u);
        }

      }
      v20 = v13 + v14;
      v21 = objc_msgSend(v7, "length") - (v13 + v14);

      v13 = objc_msgSend(v7, "rangeOfString:options:range:", v9, 1, v20, v21);
      v14 = v22;
    }
    while (v13 != 0x7FFFFFFFFFFFFFFFLL);
  }
LABEL_15:

  return v10;
}

+ (id)plainTextStringsByLabelInTaggedCharacterRanges:(id)a3 inPlainText:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25 = a4;
  v6 = (void *)objc_opt_new();
  if (objc_msgSend(v5, "count"))
  {
    v7 = 0;
    v26 = v5;
    do
    {
      v27 = v7;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      objc_msgSend(v8, "tags");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v29;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v29 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v13);
            v15 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v8, "annotationTypeUniqueIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("%@_%@"), v16, v14);

            objc_msgSend(v6, "objectForKeyedSubscript:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v18)
            {
              v19 = (void *)objc_opt_new();
              objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, v17);

            }
            objc_msgSend(v6, "objectForKeyedSubscript:", v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v8, "range");
            objc_msgSend(v20, "addIndexesInRange:", v21, v22);

            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v11);
      }

      v5 = v26;
      v7 = v27 + 1;
    }
    while (objc_msgSend(v26, "count") > (unint64_t)(v27 + 1));
  }
  +[SGExtractionDocument candidatesForLabelsWithPlainTextIndexSets:inPlainText:](SGStructuredEventDocument, "candidatesForLabelsWithPlainTextIndexSets:inPlainText:", v6, v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)schemaStringForDateComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;

  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "date"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    objc_msgSend(v4, "timeZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)objc_opt_new();
      objc_msgSend(v4, "timeZone");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTimeZone:", v8);

    }
    else
    {
      v7 = (void *)objc_opt_new();
      if (objc_msgSend(v4, "hour") == 0x7FFFFFFFFFFFFFFFLL
        && objc_msgSend(v4, "minute") == 0x7FFFFFFFFFFFFFFFLL
        && objc_msgSend(v4, "second") == 0x7FFFFFFFFFFFFFFFLL)
      {
        v10 = CFSTR("yyyy-MM-dd");
      }
      else
      {
        v10 = CFSTR("yyyy-MM-dd'T'HH:mm:ss");
      }
      objc_msgSend(v7, "setDateFormat:", v10);
    }
    objc_msgSend(v4, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromDate:", v11);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &stru_1E7DB83A8;
  }

  return v9;
}

+ (id)schemaStringForReservationStatus:(unsigned __int8)a3
{
  int v3;
  id v4;
  const __CFString *v5;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = CFSTR("Cancelled");
  if (!v3)
    v5 = CFSTR("Confirmed");
  return (id)objc_msgSend(v4, "initWithFormat:", CFSTR("%@%@"), CFSTR("http://schema.org/Reservation"), v5);
}

+ (id)schemaStringForEventStatus:(unsigned __int8)a3
{
  int v3;
  id v4;
  const __CFString *v5;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = CFSTR("Cancelled");
  if (!v3)
    v5 = CFSTR("Confirmed");
  return (id)objc_msgSend(v4, "initWithFormat:", CFSTR("%@%@"), CFSTR("http://schema.org/Event"), v5);
}

+ (id)schemaPostalAddressForPostalAddressExtraction:(id)a3 addressThreshold:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  __CFString *v15;

  v6 = a3;
  objc_msgSend(v6, "components");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "plainText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (!v8)
    {
      v15 = &stru_1E7DB83A8;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v8)
  {
    objc_msgSend(v6, "components");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(a1, "tokenCountForPostalAddressComponents:", v9);

    objc_msgSend(v6, "plainText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(a1, "tokenCount:", v11);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)a4 / 100.0 * (double)v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v13, "intValue");

    if (v10 < (int)v11)
    {
LABEL_6:
      objc_msgSend(v6, "plainText");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  objc_msgSend(v6, "components");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addressDictionaryForAddressComponents:", v14);
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v15;
}

+ (unint64_t)tokenCountForPostalAddressComponents:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "street");
  v5 = (char *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "street");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (char *)objc_msgSend(a1, "tokenCount:", v6);

  }
  objc_msgSend(v4, "city");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "city");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 += objc_msgSend(a1, "tokenCount:", v8);

  }
  objc_msgSend(v4, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 += objc_msgSend(a1, "tokenCount:", v10);

  }
  objc_msgSend(v4, "postalCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "postalCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5 += objc_msgSend(a1, "tokenCount:", v12);

  }
  objc_msgSend(v4, "country");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "country");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5 += objc_msgSend(a1, "tokenCount:", v14);

  }
  return (unint64_t)v5;
}

+ (unint64_t)tokenCount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  if (v3)
  {
    +[SGPOSTagger sharedInstance](SGPOSTagger, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tokenizeTextContent:languageHint:", v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count"))
    {
      v6 = 0;
      v7 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "annotationType");

        if (v9 == 3)
          ++v7;
        ++v6;
      }
      while (objc_msgSend(v5, "count") > v6);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)addressDictionaryForAddressComponents:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  _QWORD v20[6];
  _QWORD v21[7];

  v21[6] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("http://schema.org/PostalAddress");
  v20[0] = CFSTR("@type");
  v20[1] = CFSTR("streetAddress");
  v3 = a3;
  objc_msgSend(v3, "street");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_1E7DB83A8;
  v21[1] = v6;
  v20[2] = CFSTR("addressLocality");
  objc_msgSend(v3, "city");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = &stru_1E7DB83A8;
  v21[2] = v9;
  v20[3] = CFSTR("addressRegion");
  objc_msgSend(v3, "state");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = &stru_1E7DB83A8;
  v21[3] = v12;
  v20[4] = CFSTR("postalCode");
  objc_msgSend(v3, "postalCode");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = &stru_1E7DB83A8;
  v21[4] = v15;
  v20[5] = CFSTR("addressCountry");
  objc_msgSend(v3, "country");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = v16;
  else
    v17 = &stru_1E7DB83A8;
  v21[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)eventEnrichmentFromEntity:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  int IsEvent;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "enrichments", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v7, "duplicateKey");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "entityType");
        IsEvent = SGEntityTypeIsEvent();

        if (IsEvent)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (BOOL)eventEnrichmentContainsReverseMappedTags:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  int v21;
  char v22;
  char v23;
  char v24;
  id v26;
  char v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "eventEnrichmentFromEntity:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v26 = v3;
    objc_msgSend(v3, "tags");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v28 = 0;
      v27 = 0;
      v8 = 0;
      v9 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(v4);
          v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if (objc_msgSend(v11, "isFieldReverseMapped")
            && (objc_msgSend(v11, "value"),
                v12 = (void *)objc_claimAutoreleasedReturnValue(),
                v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("reverseMapped_EVENT_TIME__START_DATETIME")),
                v12,
                (v13 & 1) != 0))
          {
            v7 = 1;
          }
          else if (objc_msgSend(v11, "isFieldReverseMapped")
                 && (objc_msgSend(v11, "value"),
                     v14 = (void *)objc_claimAutoreleasedReturnValue(),
                     v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("reverseMapped_EVENT_LOCATION__START_ADDRESS")),
                     v14,
                     (v15 & 1) != 0))
          {
            BYTE4(v28) = 1;
          }
          else if (objc_msgSend(v11, "isFieldReverseMapped")
                 && (objc_msgSend(v11, "value"),
                     v16 = (void *)objc_claimAutoreleasedReturnValue(),
                     v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("reverseMapped_EVENT_LOCATION__START_PLACE")),
                     v16,
                     (v17 & 1) != 0))
          {
            LOBYTE(v28) = 1;
          }
          else if (objc_msgSend(v11, "isFieldReverseMapped")
                 && (objc_msgSend(v11, "value"),
                     v18 = (void *)objc_claimAutoreleasedReturnValue(),
                     v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("reverseMapped_TITLE__HOTEL_RESTAURANT_NAME")),
                     v18,
                     (v19 & 1) != 0))
          {
            v27 = 1;
          }
          else if (objc_msgSend(v11, "isFieldReverseMapped"))
          {
            objc_msgSend(v11, "value");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("reverseMapped_TITLE__MOVIE_TICKET_NAME"));

            if (v21)
              v8 = 1;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
      v28 = 0;
      v27 = 0;
      v8 = 0;
    }

    if ((v28 & 0x100000000) != 0)
      v23 = v7 & 1;
    else
      v23 = v27 | v8;
    if ((v28 & 1) != 0)
      v24 = v7 & 1;
    else
      v24 = v23;
    if ((v7 & 1) != 0)
      v22 = v24;
    else
      v22 = v7 & 1;
    v3 = v26;
  }
  else
  {
    v22 = 0;
  }

  return v22 & 1;
}

+ (void)logMLExtractionForSchema:(id)a3 mergedSchemaAndDiff:(id)a4 parentEntity:(id)a5 timingProcessingInMs:(unint64_t)a6 eventClassification:(id)a7 mailMessage:(id)a8 shadowExtraction:(BOOL)a9 mlDefaultExtraction:(BOOL)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t k;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  const __CFString *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v80;
  id obj;
  id obja;
  void *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _QWORD v97[4];
  id v98;
  _BYTE v99[128];
  _BYTE v100[128];
  id v101;
  void *v102;
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v80 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  objc_msgSend(a1, "jsMessageLogsDictionaryForMailMessage:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "outputLogsForClassification:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  v22 = CFSTR("fallbackExtraction");
  if (a10)
    v22 = CFSTR("mlDefaultExtraction");
  if (a9)
    v23 = CFSTR("shadowExtraction");
  else
    v23 = v22;
  objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v23);
  objc_msgSend(a1, "jsMessageLogsDictionaryForPrivacyAwareLogs:", v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v97[0] = MEMORY[0x1E0C809B0];
    v97[1] = 3221225472;
    v97[2] = __178__SGStructuredEventDissector_logMLExtractionForSchema_mergedSchemaAndDiff_parentEntity_timingProcessingInMs_eventClassification_mailMessage_shadowExtraction_mlDefaultExtraction___block_invoke;
    v97[3] = &unk_1E7DACE08;
    v98 = v21;
    objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v97);

  }
  v78 = v24;
  v25 = v16;
  objc_msgSend(a1, "eventEnrichmentFromEntity:", v16);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v26;
  if (!v26)
  {
    v63 = v21;
    objc_msgSend(v16, "tags");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D197F0], "templateException");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v64, "containsObject:", v65);

    v29 = v80;
    if (v66)
      v67 = CFSTR("Exception");
    else
      v67 = CFSTR("No Event");
    v68 = v63;
    objc_msgSend(v63, "setObject:forKeyedSubscript:", v67, CFSTR("templateExtractionOutput"));
    goto LABEL_53;
  }
  v83 = v21;
  v76 = v19;
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  objc_msgSend(v26, "tags");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
  v29 = v80;
  if (!v28)
  {
    v31 = 0;
    v32 = 0;
    goto LABEL_51;
  }
  v30 = v28;
  v73 = v18;
  v74 = v17;
  v31 = 0;
  v32 = 0;
  v33 = *(_QWORD *)v94;
  do
  {
    for (i = 0; i != v30; ++i)
    {
      if (*(_QWORD *)v94 != v33)
        objc_enumerationMutation(v27);
      v35 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
      if (objc_msgSend(v35, "isSchemaOrg"))
      {
        objc_msgSend(v35, "value");
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = v31;
        v31 = (void *)v36;
      }
      else
      {
        if (!objc_msgSend(v35, "isTemplateName"))
          continue;
        objc_msgSend(v35, "value");
        v38 = objc_claimAutoreleasedReturnValue();
        v37 = v32;
        v32 = (void *)v38;
      }

    }
    v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
  }
  while (v30);

  if (v32)
    objc_msgSend(v83, "setObject:forKeyedSubscript:", v32, CFSTR("extractionTemplate"));
  v18 = v73;
  v17 = v74;
  if (v31)
  {
    v39 = (void *)MEMORY[0x1E0CB36D8];
    objc_msgSend(v31, "dataUsingEncoding:", 4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = 0;
    objc_msgSend(v39, "JSONObjectWithData:options:error:", v40, 0, &v92);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v92;

    if (v41 && objc_msgSend(v41, "count"))
    {
      v72 = v15;
      v42 = objc_opt_new();
      v43 = v41;
      v44 = (void *)v42;
      v71 = v43;
      objc_msgSend(v43, "firstObject");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = v45;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = v80;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "diffSchemas:withExpectedSchemas:", v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      v70 = v48;
      objc_msgSend(v48, "allKeys");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
      if (v49)
      {
        v50 = v49;
        v51 = *(_QWORD *)v89;
        v52 = MEMORY[0x1E0C9AAB0];
        do
        {
          for (j = 0; j != v50; ++j)
          {
            if (*(_QWORD *)v89 != v51)
              objc_enumerationMutation(obj);
            v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("schemaDiff_%@"), *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * j));
            objc_msgSend(v83, "setObject:forKeyedSubscript:", v52, v54);

          }
          v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
        }
        while (v50);
      }

      if (a10)
      {
        objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("diff"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        v75 = v55;
        objc_msgSend(v55, "allKeys");
        obja = (id)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v84, v99, 16);
        if (v56)
        {
          v57 = v56;
          v58 = *(_QWORD *)v85;
          v59 = MEMORY[0x1E0C9AAB0];
          do
          {
            for (k = 0; k != v57; ++k)
            {
              if (*(_QWORD *)v85 != v58)
                objc_enumerationMutation(obja);
              v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("schemaFromTemplate_%@"), *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * k));
              objc_msgSend(v83, "setObject:forKeyedSubscript:", v59, v61);

            }
            v57 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v84, v99, 16);
          }
          while (v57);
        }

        v62 = v75;
        v29 = v80;
      }
      else
      {
        v29 = v80;
        v62 = v70;
      }

      v15 = v72;
      v18 = v73;
      v17 = v74;
      v41 = v71;
    }

LABEL_51:
    v19 = v76;

  }
  else
  {
    v19 = v76;
  }

  v68 = v83;
LABEL_53:
  +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "logEventExtractionForTemplateName:extractionStatus:outputExceptions:outputInfos:jsMessageLogs:jsOutputLogs:timingProcessing:", CFSTR("ML"), 0, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v19, v68, a6);

}

+ (void)logFailedExtractionWithClassification:(id)a3 missingEntities:(id)a4 mlSummary:(id)a5 shadowExtraction:(BOOL)a6 timingProcessingInMs:(unint64_t)a7 forMessage:(id)a8 parentEntity:(id)a9
{
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  id v39;
  id v40;
  _BOOL4 v41;
  void *v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v41 = a6;
  v57 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v39 = a4;
  v14 = a5;
  v43 = a8;
  v44 = a9;
  objc_msgSend(a1, "jsMessageLogsDictionaryForMailMessage:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v13;
  objc_msgSend(a1, "outputLogsForClassification:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v52 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v16, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("M_%@"), v21);
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, v23);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v18);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v41);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v24, CFSTR("shadowExtraction"));

  objc_msgSend(a1, "eventEnrichmentFromEntity:", v44);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v25, "tags");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v48;
LABEL_10:
    v30 = 0;
    while (1)
    {
      if (*(_QWORD *)v48 != v29)
        objc_enumerationMutation(v26);
      v31 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v30);
      if ((objc_msgSend(v31, "isTemplateName") & 1) != 0)
        break;
      if (v28 == ++v30)
      {
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        if (v28)
          goto LABEL_10;
        goto LABEL_16;
      }
    }
    objc_msgSend(v31, "value");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = v39;
    v33 = v40;
    v35 = a7;
    if (!v32)
      goto LABEL_22;
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v32, CFSTR("extractionTemplate"));
    objc_msgSend(a1, "jsMessageLogsDictionaryForPrivacyAwareLogs:", v43);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __156__SGStructuredEventDissector_logFailedExtractionWithClassification_missingEntities_mlSummary_shadowExtraction_timingProcessingInMs_forMessage_parentEntity___block_invoke;
      v45[3] = &unk_1E7DACE08;
      v46 = v15;
      objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", v45);

    }
  }
  else
  {
LABEL_16:
    v32 = v26;
    v34 = v39;
    v33 = v40;
    v35 = a7;
  }

LABEL_22:
  +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "logEventExtractionForTemplateName:extractionStatus:outputExceptions:outputInfos:jsMessageLogs:jsOutputLogs:timingProcessing:", CFSTR("ML"), 3, v34, MEMORY[0x1E0C9AA60], v42, v15, v35);

}

+ (id)jsMessageLogsDictionaryForMailMessage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("domain");
  objc_msgSend(a3, "from");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emailAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  emailAddressDomain(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v12[1] = CFSTR("assetVersion");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  +[SGAsset localeAsset](SGAsset, "localeAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "assetVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  v12[2] = CFSTR("assetIdentifier");
  +[SGAsset localeAssetIdentifier](SGAsset, "localeAssetIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)jsMessageLogsDictionaryForPrivacyAwareLogs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "privacyAwareLogsForMLExtractions:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__SGStructuredEventDissector_jsMessageLogsDictionaryForPrivacyAwareLogs___block_invoke;
  v9[3] = &unk_1E7DACE08;
  v7 = v6;
  v10 = v7;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);

  return v7;
}

+ (id)outputLogsForClassification:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("category");
  v3 = a3;
  +[SGStructuredEventClassification describeCategory:](SGStructuredEventClassification, "describeCategory:", objc_msgSend(v3, "category"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("usecase");
  v11[0] = v4;
  v5 = objc_msgSend(v3, "useCase");

  +[SGStructuredEventClassification describeUseCase:](SGStructuredEventClassification, "describeUseCase:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  return v8;
}

+ (void)logMLInteractions:(id)a3 context:(id)a4 mlDefaultExtraction:(BOOL)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v22 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v6, "enrichments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v13, "duplicateKey");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "entityType");
        if (SGEntityTypeIsEvent())
        {
          v16 = objc_msgSend(v13, "isNaturalLanguageEvent");

          if ((v16 & 1) != 0)
            goto LABEL_18;
          v17 = objc_msgSend(v7, "backpressureHazard");
          if (v17 == 1)
            v18 = 12;
          else
            v18 = 0;
          if (v17)
            v19 = v18;
          else
            v19 = 13;
          if (v22)
          {
            +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "resetInteractionsLogs");

            +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "resetInteractionsSummaryLogs");

          }
          +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "logEventInteractionForEntity:interface:actionType:", v13, 0, v19);
        }

LABEL_18:
        objc_autoreleasePoolPop(v14);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

}

void __73__SGStructuredEventDissector_jsMessageLogsDictionaryForPrivacyAwareLogs___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((os_variant_has_internal_diagnostics() & 1) == 0
    && objc_msgSend(v3, "rangeOfString:", CFSTR("privacyAwareSubject")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v3);
  }

}

uint64_t __156__SGStructuredEventDissector_logFailedExtractionWithClassification_missingEntities_mlSummary_shadowExtraction_timingProcessingInMs_forMessage_parentEntity___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

uint64_t __178__SGStructuredEventDissector_logMLExtractionForSchema_mergedSchemaAndDiff_parentEntity_timingProcessingInMs_eventClassification_mailMessage_shadowExtraction_mlDefaultExtraction___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

void __66__SGStructuredEventDissector_annotationMatchingStringsForSubject___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (a3 >= 2)
  {
    v4 = +[SGExtractionDocument textRangeForIndexRange:inTaggedCharacterRanges:](SGExtractionDocument, "textRangeForIndexRange:inTaggedCharacterRanges:", a2, a3, *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
      v6 = v7;
    }

  }
}

void __44__SGStructuredEventDissector_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_13690;
  sharedInstance__pasExprOnceResult_13690 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
