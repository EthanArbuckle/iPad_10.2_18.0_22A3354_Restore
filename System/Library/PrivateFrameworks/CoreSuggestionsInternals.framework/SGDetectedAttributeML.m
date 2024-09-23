@implementation SGDetectedAttributeML

- (SGDetectedAttributeML)initWithTraining:(id)a3
{
  id v5;
  SGDetectedAttributeML *v6;
  SGDetectedAttributeML *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGDetectedAttributeML;
  v6 = -[SGDetectedAttributeML init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_localTraining, a3);

  return v7;
}

- (SGDetectedAttributeML)init
{
  void *v3;
  void *v4;
  void *v5;
  SGDetectedAttributeML *v6;

  v3 = (void *)MEMORY[0x1E0D81080];
  +[SGPaths suggestionsDirectory](SGPaths, "suggestionsDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedSingletonWithDirectory:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SGDetectedAttributeML initWithTraining:](self, "initWithTraining:", v5);
  return v6;
}

- (void)addSessionForTrainingWithSource:(id)a3 label:(int64_t)a4 language:(id)a5 objective:(unint64_t)a6 spotlightRef:(id)a7 embeddedFeaturizer:(id)a8
{
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD);
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a5;
  v17 = a7;
  v18 = (void (**)(_QWORD))a8;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDetectedAttributeML.m"), 249, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source"));

  }
  +[SGModel transformerInstanceForLanguage:withObjective:](SGModel, "transformerInstanceForLanguage:withObjective:", v16, a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "sessionDescriptor");
    v21 = objc_claimAutoreleasedReturnValue();
    v18[2](v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "vector");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      __assert_rtn("-[SGDetectedAttributeML addSessionForTrainingWithSource:label:language:objective:spotlightRef:embeddedFeaturizer:]", "SGDetectedAttributeML.m", 259, "[vector isKindOfClass:[PMLSparseVector class]]");
    if (v23)
    {
      if (v21)
      {
        -[PMLTrainingProtocol addSessionWithCovariates:label:sessionDescriptor:spotlightReference:isInternal:](self->_localTraining, "addSessionWithCovariates:label:sessionDescriptor:spotlightReference:isInternal:", v23, a4, v21, v17, 0);
LABEL_14:

        goto LABEL_15;
      }
      sgLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
LABEL_13:

        goto LABEL_14;
      }
      *(_WORD *)buf = 0;
      v25 = "SGDetectedAttributeML - failed to get training descriptor.";
    }
    else
    {
      sgLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      *(_WORD *)buf = 0;
      v25 = "SGDetectedAttributeML: failed to generate vector.";
    }
    _os_log_error_impl(&dword_1C3607000, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
    goto LABEL_13;
  }
  sgLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v16;
    v29 = 2048;
    v30 = a6;
    _os_log_error_impl(&dword_1C3607000, v21, OS_LOG_TYPE_ERROR, "SGDetectedAttributeML - Failed to load transformer instance for language: %@, %lu", buf, 0x16u);
  }
LABEL_15:

}

- (id)detectionFromMessage:(id)a3 ddMatch:(id)a4 matchedContext:(id)a5 withSupervision:(id)a6 inConversation:(id)a7 entityLanguage:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  char isKindOfClass;
  id v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  BOOL v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id *v39;
  NSObject *v40;
  const char *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  BOOL v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  BOOL v60;
  _BOOL4 v62;
  void *v63;
  id v64;
  NSObject *v65;
  void *v66;
  SGDetectedAttributeML *v67;
  uint64_t v68;
  id v69;
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  SGDetectedAttributeML *v74;
  id v75;
  id v76;
  id v77;
  uint64_t *v78;
  _QWORD v79[4];
  id v80;
  NSObject *v81;
  _QWORD *v82;
  uint64_t v83;
  _QWORD v84[4];
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[5];
  id v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  _QWORD v98[3];
  _QWORD v99[3];
  _QWORD v100[4];
  _QWORD v101[4];
  uint8_t buf[4];
  id v103;
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v71 = a5;
  v70 = a6;
  v16 = a7;
  v17 = a8;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (objc_msgSend(v15, "matchType") || (isKindOfClass & 1) == 0)
  {
    v67 = self;
    v92 = 0;
    v93 = &v92;
    v94 = 0x3032000000;
    v95 = __Block_byref_object_copy__29077;
    v96 = __Block_byref_object_dispose__29078;
    v97 = 0;
    v20 = objc_msgSend(v15, "matchType");
    v21 = v20;
    if ((isKindOfClass & 1) != 0)
    {
      if (v20 == 1)
      {
        v22 = 6;
        goto LABEL_12;
      }
      if (v20 == 2)
      {
        v22 = 5;
LABEL_12:
        v68 = v22;
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SGModelObjective convertSGDDMatchToModelObjective(SGDataDetectorMatchType, BOOL)");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("SGDetectedAttributeML.m"), 62, CFSTR("Unknown model objective for SGDataDetectorMatchType = %lu and SGTextMessage"), v21);

    }
    else
    {
      if (v20 < 3)
      {
        v22 = qword_1C3859C80[v20];
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SGModelObjective convertSGDDMatchToModelObjective(SGDataDetectorMatchType, BOOL)");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("SGDetectedAttributeML.m"), 71, CFSTR("Unknown model objective for SGDataDetectorMatchType = %lu for non SGTextMessage"), v21);

    }
    v68 = 0;
LABEL_15:
    objc_msgSend(v16, "likelyLanguage");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    if (v27)
      v29 = (void *)v27;
    else
      v29 = v17;
    v69 = v29;

    if (!v69)
    {
      v19 = 0;
LABEL_64:

      _Block_object_dispose(&v92, 8);
      goto LABEL_65;
    }
    v90[0] = 0;
    v90[1] = v90;
    v90[2] = 0x3032000000;
    v90[3] = __Block_byref_object_copy__29077;
    v90[4] = __Block_byref_object_dispose__29078;
    v91 = 0;
    if ((unint64_t)(v68 - 5) > 1)
    {
      v98[0] = CFSTR("INPUT_TEXT");
      objc_msgSend(v14, "textContent");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v99[0] = v30;
      v98[1] = CFSTR("DD_MATCHES");
      objc_msgSend(v14, "plainTextDetectedData");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v98[2] = CFSTR("TARGET_MATCH");
      v99[1] = v42;
      v99[2] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 3);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      objc_msgSend(v16, "messages");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v86, v104, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v87;
        while (2)
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v87 != v32)
              objc_enumerationMutation(v30);
            objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * i), "text");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (unint64_t)objc_msgSend(v34, "length") > 0x8C;

            if (v35)
            {
              v19 = 0;
              goto LABEL_63;
            }
          }
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v86, v104, 16);
          if (v31)
            continue;
          break;
        }
      }

      objc_msgSend(v14, "uniqueIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "messages");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v84[0] = MEMORY[0x1E0C809B0];
      v84[1] = 3221225472;
      v84[2] = __115__SGDetectedAttributeML_detectionFromMessage_ddMatch_matchedContext_withSupervision_inConversation_entityLanguage___block_invoke;
      v84[3] = &unk_1E7DB4AB8;
      v30 = v36;
      v85 = v30;
      v38 = objc_msgSend(v37, "indexOfObjectWithOptions:passingTest:", 2, v84);

      v39 = &v85;
      if (v38 == 0x7FFFFFFFFFFFFFFFLL)
      {
        sgLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v103 = v30;
          v41 = "Couldn't find uniqueIdentifier %@ in conversation -- aborting detectionFromEntity";
LABEL_50:
          _os_log_impl(&dword_1C3607000, v40, OS_LOG_TYPE_DEFAULT, v41, buf, 0xCu);
          goto LABEL_51;
        }
        goto LABEL_51;
      }
      objc_msgSend(v16, "messages");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v38 == objc_msgSend(v52, "count") - 1;

      if (!v53)
      {
        sgLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v103 = v30;
          v41 = "Target message (uniqueIdentifier=%@) not the last in conversation -- aborting detectionFromEntity";
          goto LABEL_50;
        }
LABEL_51:
        v19 = 0;
        goto LABEL_62;
      }
      v100[0] = CFSTR("INPUT_CONVERSATION");
      objc_msgSend(v16, "messages");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v101[0] = v54;
      v100[1] = CFSTR("SG_MODEL_INPUT_TARGET_MESSAGE_INDEX");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v38);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v101[1] = v55;
      v100[2] = CFSTR("DD_MATCHES");
      objc_msgSend(v14, "plainTextDetectedData");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v100[3] = CFSTR("TARGET_MATCH");
      v101[2] = v56;
      v101[3] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v100, 4);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = v85;
    }

    v44 = MEMORY[0x1E0C809B0];
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __115__SGDetectedAttributeML_detectionFromMessage_ddMatch_matchedContext_withSupervision_inConversation_entityLanguage___block_invoke_117;
    v79[3] = &unk_1E7DB4AE0;
    v82 = v90;
    v30 = v43;
    v80 = v30;
    v65 = v69;
    v81 = v65;
    v83 = v68;
    v66 = (void *)MEMORY[0x1C3BD5158](v79);
    if (!objc_msgSend(MEMORY[0x1E0D198F0], "useMLModelForContacts"))
    {
LABEL_57:
      if ((unint64_t)objc_msgSend(v71, "length") < 0x46)
        goto LABEL_59;
      v57 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "componentsSeparatedByCharactersInSet:", v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v57);
      v60 = (unint64_t)objc_msgSend(v59, "count") < 0xF;

      if (v60)
LABEL_59:
        v19 = 0;
      else
        v19 = (id)v93[5];

      v39 = &v80;
      v40 = v81;
LABEL_62:

LABEL_63:
      _Block_object_dispose(v90, 8);

      goto LABEL_64;
    }
    v72[0] = v44;
    v72[1] = 3221225472;
    v72[2] = __115__SGDetectedAttributeML_detectionFromMessage_ddMatch_matchedContext_withSupervision_inConversation_entityLanguage___block_invoke_2;
    v72[3] = &unk_1E7DB4B08;
    v78 = &v92;
    v64 = v30;
    v73 = v64;
    v74 = v67;
    v75 = v15;
    v45 = v14;
    v76 = v45;
    v46 = v70;
    v77 = v46;
    +[SGModelRules loadBinaryClassificationModelFromMobileAssetForObjective:language:withBlock:](SGModelRules, "loadBinaryClassificationModelFromMobileAssetForObjective:language:withBlock:", v68, v65, v72);
    if (((objc_msgSend(v46, "isThirdPerson") & 1) != 0
       || (objc_msgSend(v46, "isFirstPerson") & 1) != 0
       || objc_msgSend(v46, "isUnlikelyPhone"))
      && v45
      && v67->_localTraining)
    {
      objc_msgSend(v45, "author");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "displayName");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v48, "length"))
      {
        objc_msgSend(v45, "author");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "displayName");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v49, "rangeOfString:", CFSTR("@")) == 0x7FFFFFFFFFFFFFFFLL;

        if (!v62
          || !+[SGModelRules shouldCollectTrainingDataForObjective:language:](SGModelRules, "shouldCollectTrainingDataForObjective:language:", v68, v65))
        {
          goto LABEL_56;
        }
        objc_msgSend(v45, "spotlightReference");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (v50)
        {
          if (objc_msgSend(v46, "isFirstPerson"))
            v51 = objc_msgSend(v46, "isUnlikelyPhone") ^ 1;
          else
            v51 = 0;
          -[SGDetectedAttributeML addSessionForTrainingWithSource:label:language:objective:spotlightRef:embeddedFeaturizer:](v67, "addSessionForTrainingWithSource:label:language:objective:spotlightRef:embeddedFeaturizer:", v64, v51, v65, v68, v50, v66);
        }
      }
      else
      {

        v50 = v47;
      }

    }
LABEL_56:

    goto LABEL_57;
  }
  v19 = 0;
LABEL_65:

  return v19;
}

- (id)detectionFromMatch:(id)a3 plainTextContent:(id)a4 extractionInfo:(id)a5 isUnlikelyPhone:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_msgSend(v11, "matchType");
  if (v12 == 2)
    v13 = 2;
  else
    v13 = v12 == 1;
  v14 = objc_msgSend(v11, "valueRange");
  v16 = v15;
  objc_msgSend(v11, "valueString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "labelRange");
  v19 = v18;

  LOBYTE(v23) = a6;
  LOBYTE(v22) = v19 != 0;
  +[SGDetection detectionWithType:text:matchRange:matchString:label:hasPhoneLabel:extractionInfo:isUnlikelyPhone:](SGDetection, "detectionWithType:text:matchRange:matchString:label:hasPhoneLabel:extractionInfo:isUnlikelyPhone:", v13, v10, v14, v16, v17, 0, v22, v9, v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)selfIdDetectionWithTextMessage:(id)a3 inConversation:(id)a4 withSupervision:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  unint64_t i;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  unint64_t v42;
  NSObject *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  void *v59;
  BOOL v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  char v72;
  char v73;
  void *v74;
  _BOOL4 v75;
  unsigned int v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  int v85;
  NSObject *v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  _QWORD v92[4];
  id v93;
  NSObject *v94;
  id v95;
  _BYTE *v96;
  _QWORD v97[4];
  id v98;
  id v99;
  _QWORD *v100;
  _QWORD v101[5];
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _QWORD v111[4];
  id v112;
  _QWORD v113[4];
  _QWORD v114[4];
  _BYTE buf[32];
  void (*v116)(uint64_t);
  id v117;
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v90 = a4;
  v9 = a5;
  v89 = v8;
  if (objc_msgSend(MEMORY[0x1E0D198F0], "useMLModelForSelfId"))
  {
    v87 = v9;
    objc_msgSend(v8, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "messages");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v111[0] = MEMORY[0x1E0C809B0];
    v111[1] = 3221225472;
    v111[2] = __87__SGDetectedAttributeML_selfIdDetectionWithTextMessage_inConversation_withSupervision___block_invoke;
    v111[3] = &unk_1E7DB4AB8;
    v88 = v10;
    v112 = v88;
    v13 = objc_msgSend(v11, "indexOfObjectWithOptions:passingTest:", 2, v111);

    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      sgLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v88;
        _os_log_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEFAULT, "Couldn't find uniqueIdentifier %@ in conversation -- aborting selfIdDetectionWithEntity", buf, 0xCu);
      }
      v15 = 0;
      goto LABEL_35;
    }
    objc_msgSend(v90, "messages");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", v13);
    v86 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v90, "messages");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastObject");
    v18 = objc_claimAutoreleasedReturnValue();

    if (v86 != v18)
    {
      sgLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v88;
        _os_log_impl(&dword_1C3607000, v19, OS_LOG_TYPE_INFO, "Target message (uniqueIdentifier=%@) not the last in conversation -- aborting selfIdDetectionWithEntity", buf, 0xCu);
      }

LABEL_33:
      v15 = 0;
LABEL_34:
      v14 = v86;
LABEL_35:

      v9 = v87;
      goto LABEL_36;
    }
    -[NSObject text](v86, "text");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "textContent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqualToString:", v21);

    v85 = v22;
    if (!v22)
      goto LABEL_14;
    if (objc_msgSend(v87, "candidateNameRange") == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_14;
    v23 = objc_msgSend(v87, "candidateNameRange");
    objc_msgSend(v87, "candidateNameRange");
    v25 = v24;
    -[NSObject text](v86, "text");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v25 + v23;
    v28 = objc_msgSend(v26, "length");

    if (v27 > v28)
    {
LABEL_14:
      objc_msgSend(v90, "messages");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count");

      if (v30)
      {
        for (i = 0; i < v42; ++i)
        {
          sgLogHandle();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v90, "messages");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "objectAtIndexedSubscript:", i);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "message");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "uniqueIdentifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "messages");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "objectAtIndexedSubscript:", i);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "text");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "length");
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)&buf[4] = i;
            *(_WORD *)&buf[8] = 2112;
            *(_QWORD *)&buf[10] = v36;
            *(_WORD *)&buf[18] = 2048;
            *(_QWORD *)&buf[20] = v40;
            _os_log_impl(&dword_1C3607000, v32, OS_LOG_TYPE_INFO, "Conversation message %d with id %@ and content length %lu", buf, 0x1Cu);

          }
          objc_msgSend(v90, "messages");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "count");

        }
      }
      sgLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v89, "uniqueIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "textContent");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "length");
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v44;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v46;
        _os_log_impl(&dword_1C3607000, v43, OS_LOG_TYPE_INFO, "Entity message with id %@, content length %lu", buf, 0x16u);

      }
      v109 = 0u;
      v110 = 0u;
      v107 = 0u;
      v108 = 0u;
      objc_msgSend(v89, "plainTextDetectedData");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v107, v119, 16);
      if (v48)
      {
        v49 = *(_QWORD *)v108;
        do
        {
          for (j = 0; j != v48; ++j)
          {
            if (*(_QWORD *)v108 != v49)
              objc_enumerationMutation(v47);
            v51 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * j);
            sgLogHandle();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v51;
              _os_log_impl(&dword_1C3607000, v52, OS_LOG_TYPE_INFO, "Entity message with detected data item %@", buf, 0xCu);
            }

          }
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v107, v119, 16);
        }
        while (v48);
      }

      sgLogHandle();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v85;
        _os_log_fault_impl(&dword_1C3607000, v53, OS_LOG_TYPE_FAULT, "Target message unrecoverable state with matching content = %d", buf, 8u);
      }

      if (_PASEvaluateLogFaultAndProbCrashCriteria())
        abort();
      goto LABEL_33;
    }
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    objc_msgSend(v90, "messages");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v103, v118, 16);
    if (v56)
    {
      v57 = *(_QWORD *)v104;
      while (2)
      {
        for (k = 0; k != v56; ++k)
        {
          if (*(_QWORD *)v104 != v57)
            objc_enumerationMutation(v55);
          objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * k), "text");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = (unint64_t)objc_msgSend(v59, "length") > 0x8C;

          if (v60)
          {

            goto LABEL_33;
          }
        }
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v103, v118, 16);
        if (v56)
          continue;
        break;
      }
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__29077;
    v116 = __Block_byref_object_dispose__29078;
    v117 = 0;
    v113[0] = CFSTR("INPUT_CONVERSATION");
    objc_msgSend(v90, "messages");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v114[0] = v61;
    v113[1] = CFSTR("SG_MODEL_INPUT_TARGET_RANGE");
    v62 = (void *)MEMORY[0x1E0CB3B18];
    v63 = objc_msgSend(v87, "candidateNameRange");
    objc_msgSend(v62, "valueWithRange:", v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v114[1] = v65;
    v113[2] = CFSTR("SG_MODEL_INPUT_TARGET_MESSAGE_INDEX");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v114[2] = v66;
    v113[3] = CFSTR("DD_MATCHES");
    objc_msgSend(v89, "plainTextDetectedData");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v114[3] = v67;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 4);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    v101[0] = 0;
    v101[1] = v101;
    v101[2] = 0x3032000000;
    v101[3] = __Block_byref_object_copy__29077;
    v101[4] = __Block_byref_object_dispose__29078;
    v102 = 0;
    v97[0] = v12;
    v97[1] = 3221225472;
    v97[2] = __87__SGDetectedAttributeML_selfIdDetectionWithTextMessage_inConversation_withSupervision___block_invoke_131;
    v97[3] = &unk_1E7DB4B30;
    v100 = v101;
    v69 = v68;
    v98 = v69;
    v70 = v90;
    v99 = v70;
    v91 = (void *)MEMORY[0x1C3BD5158](v97);
    objc_msgSend(v89, "spotlightReference");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_localTraining)
    {
      if ((objc_msgSend(v87, "isPositiveExample") & 1) != 0)
      {
        if (!v71)
          goto LABEL_56;
      }
      else
      {
        v72 = objc_msgSend(v87, "isNegativeExample");
        if (v71)
          v73 = v72;
        else
          v73 = 0;
        if ((v73 & 1) == 0)
          goto LABEL_56;
      }
      objc_msgSend(v70, "likelyLanguage");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = +[SGModelRules shouldCollectTrainingDataForObjective:language:](SGModelRules, "shouldCollectTrainingDataForObjective:language:", 3, v74);

      if (v75)
      {
        v76 = objc_msgSend(v87, "isPositiveExample");
        objc_msgSend(v70, "likelyLanguage");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGDetectedAttributeML addSessionForTrainingWithSource:label:language:objective:spotlightRef:embeddedFeaturizer:](self, "addSessionForTrainingWithSource:label:language:objective:spotlightRef:embeddedFeaturizer:", v69, v76, v77, 3, v71, v91);

      }
    }
LABEL_56:
    objc_msgSend(v70, "messages");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v78, "count") == 1)
    {
      objc_msgSend(v70, "messages");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "firstObject");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "text");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v81, "length");
      objc_msgSend(v87, "candidateNameRange");
      LOBYTE(v82) = (unint64_t)(v82 - v83) < 4;

      if ((v82 & 1) != 0)
      {
        v15 = 0;
LABEL_61:

        _Block_object_dispose(v101, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_34;
      }
    }
    else
    {

    }
    objc_msgSend(v70, "likelyLanguage");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v92[0] = v12;
    v92[1] = 3221225472;
    v92[2] = __87__SGDetectedAttributeML_selfIdDetectionWithTextMessage_inConversation_withSupervision___block_invoke_2;
    v92[3] = &unk_1E7DB4B58;
    v93 = v69;
    v96 = buf;
    v94 = v86;
    v95 = v87;
    +[SGModelRules loadBinaryClassificationModelFromMobileAssetForObjective:language:withBlock:](SGModelRules, "loadBinaryClassificationModelFromMobileAssetForObjective:language:withBlock:", 3, v84, v92);

    v15 = *(id *)(*(_QWORD *)&buf[8] + 40);
    goto LABEL_61;
  }
  v15 = 0;
LABEL_36:

  return v15;
}

- (void)handleTextMessageContactSharing:(id)a3 andMatch:(id)a4 andContext:(id)a5 andLanguage:(id)a6 withSupervision:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  unint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void (**v29)(_QWORD, _QWORD, _QWORD);
  void *v30;
  uint64_t PersonContactSharingLabelFromMatchType;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  SGNameDetector *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  NSUInteger v53;
  NSUInteger v54;
  NSUInteger v55;
  void *v56;
  NSUInteger v57;
  NSUInteger length;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  _BOOL4 v64;
  uint64_t matched;
  SGNameDetector *v66;
  NSObject *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  SGNameDetector *v72;
  void (**v73)(_QWORD, _QWORD, _QWORD);
  id v74;
  NSObject *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  int v79;
  void *v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  id v85;
  id v86;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD v92[4];
  id v93;
  id v94;
  id v95;
  SGDetectedAttributeML *v96;
  NSObject *v97;
  _BYTE v98[128];
  _QWORD v99[3];
  _QWORD v100[3];
  _QWORD v101[2];
  _QWORD v102[2];
  uint8_t buf[4];
  uint64_t v104;
  __int16 v105;
  uint64_t v106;
  __int16 v107;
  uint64_t v108;
  __int16 v109;
  uint64_t v110;
  uint64_t v111;
  NSRange v112;
  NSRange v113;

  v111 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (objc_msgSend(MEMORY[0x1E0D198F0], "useMLModelForContactSharing"))
  {
    objc_msgSend(v12, "conversationIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (!v18)
    {
      sgLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C3607000, v19, OS_LOG_TYPE_ERROR, "ContactMLSharing: Text message has no conversation identifier", buf, 2u);
      }
      goto LABEL_16;
    }
    if (self->_localTraining
      && ((objc_msgSend(v16, "isFirstPerson") & 1) != 0 || objc_msgSend(v16, "isThirdPerson")))
    {
      objc_msgSend(v12, "spotlightReference");
      v19 = objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
LABEL_16:

        goto LABEL_17;
      }
      objc_msgSend(v12, "textContent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20
        || !objc_msgSend(v16, "ignoreAfter")
        || (v21 = objc_msgSend(v16, "ignoreAfter"), v21 > objc_msgSend(v20, "length"))
        || objc_msgSend(v13, "range") == 0x7FFFFFFFFFFFFFFFLL)
      {
        sgLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v87 = objc_msgSend(v20, "length");
          v67 = v22;
          v68 = v20;
          v69 = objc_msgSend(v16, "ignoreAfter");
          v70 = objc_msgSend(v13, "range");
          objc_msgSend(v13, "range");
          *(_DWORD *)buf = 134218752;
          v104 = v87;
          v105 = 2048;
          v106 = v69;
          v20 = v68;
          v22 = v67;
          v107 = 2048;
          v108 = v70;
          v109 = 2048;
          v110 = v71;
          _os_log_error_impl(&dword_1C3607000, v67, OS_LOG_TYPE_ERROR, "ContactMLSharing: Invalid contact detail range plainTextContent.length %tu supervision.ignoreAfter %tu match.range [%tu, %tu]", buf, 0x2Au);
        }
        goto LABEL_13;
      }
      v85 = v14;
      v23 = (void *)MEMORY[0x1C3BD4F6C]();
      v84 = v20;
      objc_msgSend(v20, "substringWithRange:", 0, objc_msgSend(v16, "ignoreAfter"));
      v24 = objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v23);
      v101[0] = CFSTR("INPUT_TEXT");
      v101[1] = CFSTR("TARGET_MATCH");
      v102[0] = v24;
      v102[1] = v13;
      v86 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, v101, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v99[0] = CFSTR("INPUT_TEXT");
      v99[1] = CFSTR("TARGET_MATCH");
      v22 = v24;
      v100[0] = v24;
      v100[1] = v13;
      v99[2] = CFSTR("NEGATIVE_SAMPLE_CHOPPABLE_START");
      v100[2] = &unk_1E7E0CB30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, v99, 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v92[0] = MEMORY[0x1E0C809B0];
      v92[1] = 3221225472;
      v92[2] = __105__SGDetectedAttributeML_handleTextMessageContactSharing_andMatch_andContext_andLanguage_withSupervision___block_invoke;
      v92[3] = &unk_1E7DB4B80;
      v83 = v25;
      v93 = v83;
      v27 = v15;
      v94 = v27;
      v28 = v26;
      v95 = v28;
      v96 = self;
      v97 = v19;
      v29 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BD5158](v92);
      v81 = v27;
      if (!+[SGModelRules shouldCollectTrainingDataForObjective:language:](SGModelRules, "shouldCollectTrainingDataForObjective:language:", 4, v27))
      {
LABEL_45:

        v20 = v84;
        v14 = v85;
LABEL_13:

        goto LABEL_16;
      }
      v30 = (void *)MEMORY[0x1C3BD4F6C]();
      v79 = objc_msgSend(v16, "isFirstPerson");
      if (v79)
      {
        PersonContactSharingLabelFromMatchType = firstPersonContactSharingLabelFromMatchType(objc_msgSend(v13, "matchType"));
        v29[2](v29, 4, PersonContactSharingLabelFromMatchType);
      }
      v80 = v13;
      v32 = (void *)objc_opt_new();
      objc_msgSend(v16, "matchingContacts");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v33)
      {
LABEL_44:

        objc_autoreleasePoolPop(v30);
        v13 = v80;
        goto LABEL_45;
      }
      v77 = v30;
      v78 = v22;
      v73 = v29;
      v74 = v28;
      v75 = v19;
      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      v34 = v33;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v89;
        do
        {
          for (i = 0; i != v36; ++i)
          {
            if (*(_QWORD *)v89 != v37)
              objc_enumerationMutation(v34);
            v39 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
            objc_msgSend(v39, "givenName");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "length");

            if (v41)
            {
              objc_msgSend(v39, "givenName");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "lowercaseString");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "addObject:", v43);

            }
            objc_msgSend(v39, "familyName");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v44, "length");

            if (v45)
            {
              objc_msgSend(v39, "familyName");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "lowercaseString");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "addObject:", v47);

            }
          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
        }
        while (v36);
      }

      v48 = -[SGNameDetector initWithLanguage:]([SGNameDetector alloc], "initWithLanguage:", v81);
      v22 = v78;
      -[SGNameDetector detectNames:withNameSet:](v48, "detectNames:withNameSet:", v78, v32);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v48;
      -[SGNameDetector detectNames:algorithm:](v48, "detectNames:algorithm:", v78, 2);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v50;
      v82 = v49;
      if (objc_msgSend(v49, "count") != 1)
        goto LABEL_40;
      if (objc_msgSend(v50, "count"))
      {
        v51 = objc_msgSend(v49, "count");
        if (v51 != objc_msgSend(v50, "count"))
          goto LABEL_40;
        objc_msgSend(v49, "firstObject");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "range");
        v55 = v54;
        objc_msgSend(v50, "firstObject");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v113.location = objc_msgSend(v56, "range");
        v113.length = v57;
        v112.location = v53;
        v112.length = v55;
        length = NSIntersectionRange(v112, v113).length;

        if (!length)
          goto LABEL_40;
      }
      if (!objc_msgSend(v16, "isThirdPerson"))
        goto LABEL_40;
      v59 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v49, "firstObject");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "range");
      -[NSObject substringWithRange:](v78, "substringWithRange:", v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v59);
      v64 = +[SGContactPipelineHelper personExistsInContacts:name:handle:](SGContactPipelineHelper, "personExistsInContacts:name:handle:", v34, v63, 0);

      if (v64)
      {
        matched = thirdPersonContactSharingLabelFromMatchType(objc_msgSend(v80, "matchType"));
        v15 = v86;
        v28 = v74;
        v19 = v75;
        v66 = v72;
        v29 = v73;
      }
      else
      {
LABEL_40:
        v15 = v86;
        v28 = v74;
        v19 = v75;
        v66 = v72;
        v29 = v73;
        if ((v79 & 1) != 0)
        {
LABEL_43:

          v30 = v77;
          goto LABEL_44;
        }
        matched = 0;
      }
      v29[2](v29, 4, matched);
      goto LABEL_43;
    }
  }
LABEL_17:

}

- (id)birthdayCongratsTextMessage:(id)a3 andLanguage:(id)a4 andHealthStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v20;
  id v21;
  void *v22;
  BOOL v23;
  id v24;
  NSObject *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint8_t *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  uint8_t *v42;
  uint8_t v43[8];
  uint8_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint8_t buf[4];
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(MEMORY[0x1E0D198F0], "useMLModelForContacts"))
  {
    objc_msgSend(v8, "conversationIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v12)
    {
      objc_msgSend(v8, "textContent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v13, "length") >= 0x119)
      {

      }
      else
      {
        objc_msgSend(v8, "textContent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "length");

        if (v15 >= 5)
        {
          objc_msgSend(v8, "textContent");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "isSent"))
          {
            *(_QWORD *)v43 = 0;
            v44 = v43;
            v45 = 0x3032000000;
            v46 = __Block_byref_object_copy__29077;
            v47 = __Block_byref_object_dispose__29078;
            v48 = 0;
            v40[0] = MEMORY[0x1E0C809B0];
            v40[1] = 3221225472;
            v40[2] = __80__SGDetectedAttributeML_birthdayCongratsTextMessage_andLanguage_andHealthStore___block_invoke;
            v40[3] = &unk_1E7DB4BA8;
            v41 = v16;
            v42 = v43;
            +[SGModelRules loadBinaryClassificationModelFromMobileAssetForObjective:language:withBlock:](SGModelRules, "loadBinaryClassificationModelFromMobileAssetForObjective:language:withBlock:", 7, v9, v40);
            v17 = *((id *)v44 + 5);

            _Block_object_dispose(v43, 8);
LABEL_30:

            goto LABEL_12;
          }
          v39 = 0;
          objc_msgSend(v10, "dateOfBirthComponentsWithError:", &v39);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v39;
          if (!self->_localTraining
            || (objc_msgSend(v8, "spotlightReference"),
                v22 = (void *)objc_claimAutoreleasedReturnValue(),
                v23 = v22 == 0,
                v22,
                v23)
            || !+[SGModelRules shouldCollectTrainingDataForObjective:language:](SGModelRules, "shouldCollectTrainingDataForObjective:language:", 7, v9))
          {
LABEL_29:

            v17 = 0;
            goto LABEL_30;
          }
          *(_QWORD *)v43 = 0;
          v44 = v43;
          v45 = 0x3032000000;
          v46 = __Block_byref_object_copy__29077;
          v47 = __Block_byref_object_dispose__29078;
          v48 = 0;
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __80__SGDetectedAttributeML_birthdayCongratsTextMessage_andLanguage_andHealthStore___block_invoke_2;
          v35[3] = &unk_1E7DB4B30;
          v38 = v43;
          v33 = v16;
          v36 = v33;
          v24 = v9;
          v37 = v24;
          v34 = (void *)MEMORY[0x1C3BD5158](v35);
          if (v21)
          {
            sgLogHandle();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v50 = v21;
              _os_log_error_impl(&dword_1C3607000, v25, OS_LOG_TYPE_ERROR, "Error fetching user DOB: %@", buf, 0xCu);
            }
            goto LABEL_27;
          }
          if (!v20)
          {
LABEL_28:

            _Block_object_dispose(v43, 8);
            goto LABEL_29;
          }
          v26 = objc_alloc(MEMORY[0x1E0C99D48]);
          v25 = objc_msgSend(v26, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
          objc_msgSend(v8, "date");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject components:fromDate:](v25, "components:fromDate:", 24, v27);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = objc_msgSend(v32, "day");
          if (v28 == objc_msgSend(v20, "day") && (v29 = objc_msgSend(v32, "month"), v29 == objc_msgSend(v20, "month")))
          {
            objc_msgSend(v8, "spotlightReference", 1);
          }
          else
          {
            if ((float)((float)arc4random_uniform(0xFFFFFFFF) * 2.3283e-10) > 0.0027397)
            {
LABEL_26:

LABEL_27:
              goto LABEL_28;
            }
            objc_msgSend(v8, "spotlightReference", 0);
          }
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGDetectedAttributeML addSessionForTrainingWithSource:label:language:objective:spotlightRef:embeddedFeaturizer:](self, "addSessionForTrainingWithSource:label:language:objective:spotlightRef:embeddedFeaturizer:", v33, v31, v24, 7, v30, v34);

          goto LABEL_26;
        }
      }
    }
    else
    {
      sgLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v43 = 0;
        _os_log_error_impl(&dword_1C3607000, v18, OS_LOG_TYPE_ERROR, "BirthdayMLExtraction: Text message has no conversation identifier", v43, 2u);
      }

    }
  }
  v17 = 0;
LABEL_12:

  return v17;
}

- (void)handleTextMessageContactSharingWithNegativeSample:(id)a3 andLanguage:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  unsigned int (**v18)(_QWORD);
  float v19;
  float v20;
  uint32_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t *v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[3];
  char v33;
  uint8_t buf[8];
  uint8_t *v35;
  uint64_t v36;
  char v37;
  _QWORD v38[4];
  id v39;
  id v40;
  SGDetectedAttributeML *v41;
  NSObject *v42;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_msgSend(v8, "conversationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
    sgLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v16, OS_LOG_TYPE_ERROR, "ContactMLSharing: Text message has no conversation identifier", buf, 2u);
    }
    goto LABEL_15;
  }
  if (self->_localTraining)
  {
    objc_msgSend(v8, "spotlightReference");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v16 = 0;
LABEL_15:

      goto LABEL_16;
    }
    v12 = (void *)v11;
    v13 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __87__SGDetectedAttributeML_handleTextMessageContactSharingWithNegativeSample_andLanguage___block_invoke;
    v38[3] = &unk_1E7DB4BD0;
    v14 = v8;
    v39 = v14;
    v15 = v7;
    v40 = v15;
    v41 = self;
    v16 = v12;
    v42 = v16;
    v17 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BD5158](v38);
    *(_QWORD *)buf = 0;
    v35 = buf;
    v36 = 0x2020000000;
    v37 = 0;
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v33 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __87__SGDetectedAttributeML_handleTextMessageContactSharingWithNegativeSample_andLanguage___block_invoke_3;
    v22[3] = &unk_1E7DB4BF8;
    v25 = buf;
    v23 = v15;
    v24 = v14;
    v26 = v32;
    v27 = &v28;
    v18 = (unsigned int (**)(_QWORD))MEMORY[0x1C3BD5158](v22);
    objc_msgSend(MEMORY[0x1E0D198F0], "contactSharingNegativeSamplingRate");
    v20 = v19;
    if (v19 == 1.0 || (v21 = arc4random_uniform(2u)) == 0)
    {
      v17[2](v17, 4, 0);
      if (v20 == 1.0)
        goto LABEL_12;
    }
    else if (v21 == 1)
    {
LABEL_12:
      if (v18[2](v18))
        v17[2](v17, 4, v29[3]);
    }

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(v32, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_15;
  }
LABEL_16:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localTraining, 0);
}

void __87__SGDetectedAttributeML_handleTextMessageContactSharingWithNegativeSample_andLanguage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v22[0] = CFSTR("INPUT_TEXT");
  v6 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "textContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v7;
  v22[1] = CFSTR("DD_MATCHES");
  objc_msgSend(*v6, "plainTextDetectedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v8;
  v22[2] = CFSTR("NEGATIVE_SAMPLE_CHOPPABLE_START");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__29077;
  v20[4] = __Block_byref_object_dispose__29078;
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __87__SGDetectedAttributeML_handleTextMessageContactSharingWithNegativeSample_andLanguage___block_invoke_2;
  v15[3] = &unk_1E7DB4AE0;
  v18 = v20;
  v11 = v10;
  v16 = v11;
  v17 = *(id *)(a1 + 40);
  v19 = a2;
  v12 = (void (**)(_QWORD))MEMORY[0x1C3BD5158](v15);
  if (+[SGModelRules shouldCollectTrainingDataForObjective:language:](SGModelRules, "shouldCollectTrainingDataForObjective:language:", a2, *(_QWORD *)(a1 + 40)))
  {
    v12[2](v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "vector");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "numberOfNonZeroValues"))
      objc_msgSend(*(id *)(a1 + 48), "addSessionForTrainingWithSource:label:language:objective:spotlightRef:embeddedFeaturizer:", v11, 0, *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 56), v12);

  }
  _Block_object_dispose(v20, 8);

}

uint64_t __87__SGDetectedAttributeML_handleTextMessageContactSharingWithNegativeSample_andLanguage___block_invoke_3(uint64_t a1)
{
  SGNameDetector *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  unsigned int v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v2 = -[SGNameDetector initWithLanguage:]([SGNameDetector alloc], "initWithLanguage:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "textContent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGNameDetector detectNames:algorithm:](v2, "detectNames:algorithm:", v3, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "count") == 1)
    {
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "confidence");

      if (v6 >= 0)
        v7 = v6;
      else
        v7 = -v6;
      v8 = v7 > 9;
    }
    else
    {
      v8 = 0;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v8;
    objc_msgSend(v4, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "range");
    objc_msgSend(v4, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "range");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v12 + v10;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
}

id __87__SGDetectedAttributeML_handleTextMessageContactSharingWithNegativeSample_andLanguage___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (!v2)
  {
    +[SGModel trainingFeaturesOf:inLanguage:withObjective:](SGModel, "trainingFeaturesOf:inLanguage:withObjective:", a1[4], a1[5], a1[7]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  }
  return v2;
}

void __80__SGDetectedAttributeML_birthdayCongratsTextMessage_andLanguage_andHealthStore___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(a2, "predictLabelForInput:", *(_QWORD *)(a1 + 32));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0D19820];
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0D19EC8], "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "assetVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "second");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extractionInfoWithExtractionType:modelVersion:confidence:", 2, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

id __80__SGDetectedAttributeML_birthdayCongratsTextMessage_andLanguage_andHealthStore___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (!v2)
  {
    +[SGModel trainingFeaturesOf:inLanguage:withObjective:](SGModel, "trainingFeaturesOf:inLanguage:withObjective:", a1[4], a1[5], 7);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  }
  return v2;
}

void __105__SGDetectedAttributeML_handleTextMessageContactSharing_andMatch_andContext_andLanguage_withSupervision___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(_QWORD *);
  void *v12;
  id v13;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__29077;
  v24[4] = __Block_byref_object_dispose__29078;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__29077;
  v22[4] = __Block_byref_object_dispose__29078;
  v23 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __105__SGDetectedAttributeML_handleTextMessageContactSharing_andMatch_andContext_andLanguage_withSupervision___block_invoke_2;
  v17[3] = &unk_1E7DB4AE0;
  v20 = v24;
  v18 = *(id *)(a1 + 32);
  v19 = *(id *)(a1 + 40);
  v21 = a2;
  v7 = (void *)MEMORY[0x1C3BD5158](v17);
  v9 = v6;
  v10 = 3221225472;
  v11 = __105__SGDetectedAttributeML_handleTextMessageContactSharing_andMatch_andContext_andLanguage_withSupervision___block_invoke_3;
  v12 = &unk_1E7DB4AE0;
  v15 = v22;
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 40);
  v16 = a2;
  v8 = (void *)MEMORY[0x1C3BD5158](&v9);
  objc_msgSend(*(id *)(a1 + 56), "addSessionForTrainingWithSource:label:language:objective:spotlightRef:embeddedFeaturizer:", *(_QWORD *)(a1 + 32), a3, *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 64), v7, v9, v10, v11, v12);
  if (a3)
    objc_msgSend(*(id *)(a1 + 56), "addSessionForTrainingWithSource:label:language:objective:spotlightRef:embeddedFeaturizer:", *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 64), v8);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

}

id __105__SGDetectedAttributeML_handleTextMessageContactSharing_andMatch_andContext_andLanguage_withSupervision___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (!v2)
  {
    +[SGModel trainingFeaturesOf:inLanguage:withObjective:](SGModel, "trainingFeaturesOf:inLanguage:withObjective:", a1[4], a1[5], a1[7]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  }
  return v2;
}

id __105__SGDetectedAttributeML_handleTextMessageContactSharing_andMatch_andContext_andLanguage_withSupervision___block_invoke_3(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (!v2)
  {
    +[SGModel trainingFeaturesOf:inLanguage:withObjective:](SGModel, "trainingFeaturesOf:inLanguage:withObjective:", a1[4], a1[5], a1[7]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  }
  return v2;
}

uint64_t __87__SGDetectedAttributeML_selfIdDetectionWithTextMessage_inConversation_withSupervision___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isEqual:", v4);

  return v5;
}

id __87__SGDetectedAttributeML_selfIdDetectionWithTextMessage_inConversation_withSupervision___block_invoke_131(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "likelyLanguage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGModel trainingFeaturesOf:inLanguage:withObjective:](SGModel, "trainingFeaturesOf:inLanguage:withObjective:", v3, v4, 3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  return v2;
}

void __87__SGDetectedAttributeML_selfIdDetectionWithTextMessage_inConversation_withSupervision___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a2;
  objc_msgSend(v24, "predictLabelForInput:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "BOOLValue"))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);

    if (!v5)
    {
      v6 = (void *)MEMORY[0x1C3BD4F6C]();
      v7 = objc_opt_new();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v10 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(*(id *)(a1 + 40), "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(*(id *)(a1 + 48), "candidateNameRange");
      objc_msgSend(v11, "substringWithRange:", v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v10);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setName:", v14);

      objc_msgSend(*(id *)(a1 + 40), "text");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setContext:", v15);

      v16 = objc_msgSend(*(id *)(a1 + 48), "candidateNameRange");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setContextRange:", v16, v17);
      v18 = (void *)MEMORY[0x1E0D19820];
      v19 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0D19EC8], "asset");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "assetVersion"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "second");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "extractionInfoWithExtractionType:modelVersion:confidence:", 2, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setExtractionInfo:", v23);

      objc_autoreleasePoolPop(v6);
    }
  }
  else
  {

  }
}

uint64_t __115__SGDetectedAttributeML_detectionFromMessage_ddMatch_matchedContext_withSupervision_inConversation_entityLanguage___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isEqual:", v4);

  return v5;
}

id __115__SGDetectedAttributeML_detectionFromMessage_ddMatch_matchedContext_withSupervision_inConversation_entityLanguage___block_invoke_117(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (!v2)
  {
    +[SGModel trainingFeaturesOf:inLanguage:withObjective:](SGModel, "trainingFeaturesOf:inLanguage:withObjective:", a1[4], a1[5], a1[7]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  }
  return v2;
}

void __115__SGDetectedAttributeML_detectionFromMessage_ddMatch_matchedContext_withSupervision_inConversation_entityLanguage___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  objc_msgSend(a2, "predictLabelForInput:", *(_QWORD *)(a1 + 32));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0D19820];
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0D19EC8], "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "assetVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "second");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extractionInfoWithExtractionType:modelVersion:confidence:", 2, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *(void **)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "textContent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "detectionFromMatch:plainTextContent:extractionInfo:isUnlikelyPhone:", v12, v13, v10, objc_msgSend(*(id *)(a1 + 64), "isUnlikelyPhone"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
}

@end
