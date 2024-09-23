@implementation SGReminderDissector

- (SGReminderDissector)init
{
  void *v3;
  void *v4;
  id v5;
  SEL v6;
  void *v7;
  NSObject *v8;
  SGReminderDissector *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = (void *)objc_opt_new();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v4 = (void *)getRTRoutineManagerClass_softClass;
  v15 = getRTRoutineManagerClass_softClass;
  if (!getRTRoutineManagerClass_softClass)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getRTRoutineManagerClass_block_invoke;
    v11[3] = &unk_1E7DB7220;
    v11[4] = &v12;
    __getRTRoutineManagerClass_block_invoke((uint64_t)v11);
    v4 = (void *)v13[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v12, 8);
  if (v5)
  {
    v6 = NSSelectorFromString((NSString *)CFSTR("defaultManager"));
    ((void (*)(id, SEL))objc_msgSend(v5, "methodForSelector:", v6))(v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    sgRemindersLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11[0]) = 0;
      _os_log_error_impl(&dword_1C3607000, v8, OS_LOG_TYPE_ERROR, "Suggestions failed to dlopen CoreRoutine.", (uint8_t *)v11, 2u);
    }

    v7 = 0;
  }
  v9 = -[SGReminderDissector initWithConversations:rtRoutineManager:](self, "initWithConversations:rtRoutineManager:", v3, v7);

  return v9;
}

- (SGReminderDissector)initWithConversations:(id)a3 rtRoutineManager:(id)a4
{
  id v7;
  id v8;
  SGReminderDissector *v9;
  SGReminderDissector *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SGReminderDissector;
  v9 = -[SGReminderDissector init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conversations, a3);
    objc_storeStrong((id *)&v10->_rtRoutineManager, a4);
  }

  return v10;
}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  SGReminderDissector *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1C3BD4F6C]();
  if ((objc_msgSend(MEMORY[0x1E0D198F0], "detectReminders") & 1) == 0)
  {
    sgRemindersLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v33) = 0;
      v16 = "SGReminderDissector: detectReminders is OFF";
LABEL_10:
      _os_log_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v33, 2u);
    }
LABEL_11:

    objc_autoreleasePoolPop(v11);
    goto LABEL_12;
  }
  if ((objc_msgSend(MEMORY[0x1E0D198F0], "detectRemindersInMail") & 1) == 0)
  {
    sgRemindersLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v33) = 0;
      v16 = "SGReminderDissector: Reminder detection for mail is off";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  +[SGAsset localeAsset](SGAsset, "localeAsset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "assetVersion");

  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    sgRemindersLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "loggingIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543362;
      v34 = v15;
      _os_log_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEFAULT, "SGReminderDissector: Not processing due to a missing localeAsset. [SGEntity (%{public}@)]", (uint8_t *)&v33, 0xCu);

    }
    goto LABEL_11;
  }
  if (objc_msgSend(v9, "hasEventEnrichment"))
  {
    sgRemindersLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    LOWORD(v33) = 0;
    v16 = "SGReminderDissector: Not processing since PseudoEvent found";
    goto LABEL_10;
  }
  objc_msgSend(v8, "allRecipients");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18 >= 2)
  {
    sgRemindersLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    LOWORD(v33) = 0;
    v16 = "SGReminderDissector: Mail has multiple recipients, skipping";
    goto LABEL_10;
  }
  if (objc_msgSend(v9, "isInhuman"))
  {
    sgRemindersLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    LOWORD(v33) = 0;
    v16 = "SGReminderDissector: Mail is inhuman, skipping";
    goto LABEL_10;
  }
  objc_msgSend(v8, "mailingList");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    sgRemindersLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    LOWORD(v33) = 0;
    v16 = "SGReminderDissector: Mail is from mailing list, skipping";
    goto LABEL_10;
  }
  if (objc_msgSend(v8, "isPartiallyDownloaded"))
  {
    sgRemindersLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    LOWORD(v33) = 0;
    v16 = "SGReminderDissector: Mail is partially downloaded, skipping";
    goto LABEL_10;
  }
  if (objc_msgSend(v8, "isSent"))
  {
    sgRemindersLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    LOWORD(v33) = 0;
    v16 = "SGReminderDissector: Mail is sent, skipping";
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSinceDate:", v21);
  v23 = v22;

  if (v23 > 604800.0)
  {
    sgRemindersLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    LOWORD(v33) = 0;
    v16 = "SGReminderDissector: Mail is older than one week, skipping";
    goto LABEL_10;
  }
  objc_msgSend(v8, "from");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "asCSPerson");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serviceContext");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "store");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v25, "sg_isSignificantWithStore:", v27);

  if ((v28 & 1) == 0)
  {
    sgRemindersLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    LOWORD(v33) = 0;
    v16 = "SGReminderDissector: Mail is from insignificant sender, skipping";
    goto LABEL_10;
  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v9, "releaseDissectorLock");
  v29 = self;
  v30 = objc_sync_enter(v29);
  v31 = (void *)MEMORY[0x1C3BD4F6C](v30);
  -[SGReminderDissector extractReminderFromMailMessage:entity:](v29, "extractReminderFromMailMessage:entity:", v8, v9);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v31);
  objc_sync_exit(v29);

  objc_msgSend(v9, "acquireDissectorLock");
  if (v32)
    objc_msgSend(v9, "addEnrichment:", v32);

LABEL_12:
}

- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  SGReminderDissector *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1C3BD4F6C]();
  if ((objc_msgSend(MEMORY[0x1E0D198F0], "detectReminders") & 1) == 0)
  {
    sgRemindersLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      v13 = "SGReminderDissector: detectReminders is OFF";
      goto LABEL_7;
    }
LABEL_8:

    objc_autoreleasePoolPop(v11);
    goto LABEL_9;
  }
  if (objc_msgSend(v9, "hasEventEnrichment"))
  {
    sgRemindersLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      v13 = "SGReminderDissector: Not processing since PseudoEvent found";
LABEL_7:
      _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v23, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  +[SGAsset localeAsset](SGAsset, "localeAsset");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "assetVersion");

  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    sgRemindersLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "loggingIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v16;
      _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEFAULT, "SGReminderDissector: Not processing due to a missing localeAsset. [SGEntity (%{public}@)]", (uint8_t *)&v23, 0xCu);

    }
    goto LABEL_8;
  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v9, "releaseDissectorLock");
  v17 = self;
  v18 = objc_sync_enter(v17);
  v19 = (void *)MEMORY[0x1C3BD4F6C](v18);
  objc_msgSend(v10, "serviceContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "store");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGReminderDissector extractReminderFromTextMessage:entity:store:](v17, "extractReminderFromTextMessage:entity:store:", v8, v9, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v19);
  objc_sync_exit(v17);

  objc_msgSend(v9, "acquireDissectorLock");
  if (v22)
    objc_msgSend(v9, "addEnrichment:", v22);

LABEL_9:
}

- (id)reminderTitleForContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[SGReminderDissector processingLanguageForContent:](self, "processingLanguageForContent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (unint64_t)objc_msgSend(v4, "length") <= 0x3E8)
  {
    v6 = 0;
    if (objc_msgSend(v4, "length") && v5)
    {
      +[SGPOSTagger sharedInstance](SGPOSTagger, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tokenizeTextContent:languageHint:", v4, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "enrichedTaggedCharacterRangesFromTaggedCharacterRanges:messageIsSent:", v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count"))
      {
        +[SGReminderExtractionModel sharedInstance](SGReminderExtractionModel, "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "modelInferences:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          +[SGReminderMessage detectedTitleInModelOutput:enrichedTaggedCharacterRanges:textContent:language:](SGReminderMessage, "detectedTitleInModelOutput:enrichedTaggedCharacterRanges:textContent:language:", v12, v10, v4, v5);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v6 = 0;
        }

      }
      else
      {
        v6 = 0;
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)extractReminderFromMailMessage:(id)a3 entity:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1593;
  v20 = __Block_byref_object_dispose__1594;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__SGReminderDissector_extractReminderFromMailMessage_entity___block_invoke;
  v12[3] = &unk_1E7DB4620;
  v15 = &v16;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  objc_msgSend(v9, "runWithDissectorLock:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (id)extractReminderFromOwnedMailMessage:(id)a3 entity:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  SGReminderDissector *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v7 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1593;
  v30 = __Block_byref_object_dispose__1594;
  v31 = 0;
  v8 = mach_absolute_time();
  +[SGReminderExtractionModel sharedInstance](SGReminderExtractionModel, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textContent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "whitelistedRangesInContent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "textContent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGReminderDissector processingLanguageForContent:](self, "processingLanguageForContent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __66__SGReminderDissector_extractReminderFromOwnedMailMessage_entity___block_invoke;
  v19[3] = &unk_1E7DA8330;
  v14 = v7;
  v20 = v14;
  v15 = v6;
  v21 = v15;
  v16 = v13;
  v22 = v16;
  v23 = self;
  v24 = &v26;
  v25 = v8;
  objc_msgSend(v11, "enumerateRangesUsingBlock:", v19);
  v17 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v17;
}

- (id)_detectedReminderEnrichmentFromReminderMessage:(id)a3 parentEntity:(id)a4 language:(id)a5 parentMessage:(id)a6 startTimeProcessing:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char isKindOfClass;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  if (!a5)
  {
    v25 = 0;
    goto LABEL_31;
  }
  objc_msgSend(v12, "detectedTitleForLanguage:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGReminderTrialClientWrapper sharedInstance](SGReminderTrialClientWrapper, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v16;
  if (objc_msgSend(v12, "isProposal")
    && ((objc_msgSend(v12, "hasTrigger") & 1) != 0
     || (objc_msgSend(v12, "isTriggerOptional") & 1) != 0
     || objc_msgSend(v16, "triggerOptional"))
    && v15)
  {
    objc_msgSend(v12, "detectedDueDateComponents");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v17;
    if (objc_msgSend(v17, "count") == 1)
    {
      objc_msgSend(v17, "firstObject");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((unint64_t)objc_msgSend(v17, "count") < 2)
      {
        v26 = 0;
        goto LABEL_21;
      }
      +[SGExtractionDocument mergeDetectedDateComponents:](SGExtractionDocument, "mergeDetectedDateComponents:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v26 = (void *)v18;
LABEL_21:
    objc_msgSend(v12, "dueLocation");
    v21 = objc_claimAutoreleasedReturnValue();
    -[SGReminderDissector storageLocationFromDueLocation:](self, "storageLocationFromDueLocation:", v21);
    v27 = objc_claimAutoreleasedReturnValue();
    v49[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)v27;
    -[SGReminderDissector _validateDueDateComponents:dueLocation:forReminderMessages:](self, "_validateDueDateComponents:dueLocation:forReminderMessages:", v26, v27, v28);
    v22 = objc_claimAutoreleasedReturnValue();

    if (v22 | v21)
    {
      objc_msgSend(v12, "message");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      v44 = (void *)MEMORY[0x1E0D197D8];
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v12, "message");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "uniqueIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "urlForEKEventFromTextMessageWithUniqueIdentifier:", v32);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v13, "duplicateKey");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "emailKey");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "messageId");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "urlForMailMessageWithId:", v34);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = v43;
      }

      v35 = objc_msgSend((id)v21, "locationType");
      v36 = objc_msgSend((id)v21, "trigger");
      LOBYTE(v42) = -[SGReminderDissector isAllDay:](self, "isAllDay:", v22);
      LOBYTE(v41) = 2;
      v37 = v35;
      v33 = v46;
      -[SGReminderDissector _reminderEnrichmentWithTitle:dueDateComponents:dueLocationType:dueLocation:dueLocationTrigger:sourceURL:reminderStatus:parentEntity:parentMessage:allDay:](self, "_reminderEnrichmentWithTitle:dueDateComponents:dueLocationType:dueLocation:dueLocationTrigger:sourceURL:reminderStatus:parentEntity:parentMessage:allDay:", v15, v22, v37, v46, v36, v45, v41, v13, v14, v42);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = 1;
    }
    else
    {
      v24 = 0;
      v23 = 4;
      v33 = v46;
    }

    goto LABEL_28;
  }
  v19 = objc_msgSend(v12, "isProposal");
  if (v15)
    v20 = 0;
  else
    v20 = 5;
  v21 = 0;
  v22 = 0;
  if (v19)
    v23 = v20;
  else
    v23 = 2;
  v24 = 0;
LABEL_28:
  +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = mach_absolute_time() - a7;
  if (SGMachTimeToNanoseconds_onceToken != -1)
    dispatch_once(&SGMachTimeToNanoseconds_onceToken, &__block_literal_global_13797);
  objc_msgSend(v38, "logReminderExtractionFromEntity:interface:actionType:dueLocation:dueDateComponents:extractionStatus:timingProcessing:", v13, 0, 0, v21, v22, v23, (double)(v39 * SGMachTimeToNanoseconds_machTimebaseInfo / *(unsigned int *)algn_1ED52979C / 0xF4240));
  v25 = v24;

LABEL_31:
  return v25;
}

- (id)extractReminderFromTextMessage:(id)a3 entity:(id)a4 store:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSMutableDictionary *conversations;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  BOOL v23;
  void *v24;
  char v25;
  double v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSMutableDictionary *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  SGReminderMessage *v44;
  NSMutableDictionary *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  NSMutableDictionary *v52;
  void *v53;
  NSMutableDictionary *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  uint64_t *v60;
  char v61;
  NSObject *v62;
  void *v63;
  int v64;
  NSMutableDictionary *v65;
  void *v66;
  id v67;
  NSMutableDictionary *v68;
  uint64_t v69;
  double v70;
  void *v71;
  NSObject *v72;
  NSMutableDictionary *v73;
  NSObject *v75;
  void *v76;
  _BOOL4 v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  uint64_t v89;
  NSObject *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  double v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  double v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v115;
  void *v116;
  id v117;
  _QWORD v118[4];
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  __int128 *p_buf;
  uint64_t *v125;
  id v126;
  _QWORD v127[3];
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  char v131;
  uint8_t v132[4];
  double v133;
  _QWORD v134[2];
  __int128 buf;
  uint64_t v136;
  uint64_t (*v137)(uint64_t, uint64_t);
  void (*v138)(uint64_t);
  id v139;
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v117 = a5;
  sgRemindersLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_INFO, "Dissecting Text Message to find reminder", (uint8_t *)&buf, 2u);
  }

  v128 = 0;
  v129 = &v128;
  v130 = 0x2020000000;
  v131 = 0;
  conversations = self->_conversations;
  objc_msgSend(v8, "conversationIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](conversations, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[SGReminderDissector _isTestMessage:](self, "_isTestMessage:", v8))
  {
    objc_msgSend(v9, "duplicateKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "entityKey");
    v116 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v116, "source");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("suggest_tool_preprocess"));

    if ((v17 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D19EC0], "defaultLanguage");
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    if (-[SGReminderDissector isValidTextMessageForProcessing:](self, "isValidTextMessageForProcessing:", v8))
    {
      if (objc_msgSend(v8, "isSent"))
      {
        if (v13)
        {
          v28 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v13, "message");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "textContent");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "textContent");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)objc_msgSend(v28, "initWithFormat:", CFSTR("%@ %@"), v30, v31);

          -[SGReminderDissector processingLanguageForContent:](self, "processingLanguageForContent:", v32);
          v33 = objc_claimAutoreleasedReturnValue();

          v18 = v33;
          if (v33)
          {
LABEL_7:
            sgRemindersLogHandle();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v18;
              _os_log_debug_impl(&dword_1C3607000, v19, OS_LOG_TYPE_DEBUG, "SGReminderDissector: ProcessingLanguage: %@", (uint8_t *)&buf, 0xCu);
            }
            v113 = (void *)v18;

            v127[2] = 0;
            v127[0] = CFSTR("ReminderDissector full extraction");
            v109 = mach_absolute_time();
            v127[1] = v109;
            +[SGReminderExtractionModel sharedInstance](SGReminderExtractionModel, "sharedInstance");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGReminderDissector _reminderMessageForTextMessage:withEntity:extractionModel:processingLanguage:preprocessing:](self, "_reminderMessageForTextMessage:withEntity:extractionModel:processingLanguage:preprocessing:", v8, v9);
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v115)
            {
              v35 = self->_conversations;
              objc_msgSend(v8, "conversationIdentifier");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary removeObjectForKey:](v35, "removeObjectForKey:", v36);

              v37 = 0;
LABEL_63:

              SGRecordMeasurementState(v127);
              v14 = v37;
LABEL_64:

LABEL_67:
              goto LABEL_68;
            }
            *(_QWORD *)&buf = 0;
            *((_QWORD *)&buf + 1) = &buf;
            v136 = 0x3032000000;
            v137 = __Block_byref_object_copy__1593;
            v138 = __Block_byref_object_dispose__1594;
            v139 = 0;
            if (v13)
            {
              if (objc_msgSend(v115, "isConfirmation")
                && (objc_msgSend(v13, "extractedReminderDuplicateKey"),
                    v20 = (void *)objc_claimAutoreleasedReturnValue(),
                    v21 = v20 == 0,
                    v20,
                    v21))
              {
                sgRemindersLogHandle();
                v75 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)v132 = 0;
                  _os_log_debug_impl(&dword_1C3607000, v75, OS_LOG_TYPE_DEBUG, "SGReminderDissector: Message with confirmation found", v132, 2u);
                }

                objc_msgSend(v13, "modelOutput");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                v77 = v76 == 0;

                if (v77)
                {
                  objc_msgSend(v13, "entity");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v78, "acquireDissectorLock");

                  objc_msgSend(v13, "entity");
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  +[SGPOSTagger sharedInstance](SGPOSTagger, "sharedInstance");
                  v111 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "message");
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v80, "textContent");
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v111, "tokenizeTextContent:languageHint:", v81, v113);
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v79, "addTaggedCharacterRanges:", v82);

                  v83 = (void *)objc_opt_class();
                  objc_msgSend(v13, "entity");
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "message");
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v83, "enrichedTaggedCharacterRangesFromEntity:forMessage:", v84, v85);
                  v110 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v13, "entity");
                  v86 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v86, "releaseDissectorLock");

                  objc_msgSend(v112, "modelInferences:", v110);
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v87)
                  {
                    sgRemindersLogHandle();
                    v40 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)v132 = 0;
                      _os_log_error_impl(&dword_1C3607000, (os_log_t)v40, OS_LOG_TYPE_ERROR, "SGReminderDissector: No modelOutput for previousMessage", v132, 2u);
                    }
                    v37 = 0;
                    goto LABEL_62;
                  }
                  objc_msgSend(v13, "setEnrichedTaggedCharacterRanges:", v110);
                  objc_msgSend(v13, "setModelOutput:", v87);

                }
                if (objc_msgSend(v13, "isProposal"))
                {
                  sgRemindersLogHandle();
                  v88 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)v132 = 0;
                    _os_log_debug_impl(&dword_1C3607000, v88, OS_LOG_TYPE_DEBUG, "SGReminderDissector: Previous message has proposal and question", v132, 2u);
                  }

                  v134[0] = v13;
                  v134[1] = v115;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 2);
                  v89 = objc_claimAutoreleasedReturnValue();
                  -[SGReminderDissector reminderTitleFromMessages:forLanguage:](self, "reminderTitleFromMessages:forLanguage:", v89, v113);
                  v108 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                  v107 = (void *)v89;
                  if (v108 == 0.0)
                  {
                    v100 = *(void **)(*((_QWORD *)&buf + 1) + 40);
                    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = CFSTR("No title found for message");

                    v39 = 0;
                    v110 = 0;
                    v40 = 0;
                    *((_BYTE *)v129 + 24) = 5;
                  }
                  else
                  {
                    sgPrivateLogHandle();
                    v90 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)v132 = 138412290;
                      v133 = v108;
                      _os_log_debug_impl(&dword_1C3607000, v90, OS_LOG_TYPE_DEBUG, "SGReminderDissector: Found title for reminder %@", v132, 0xCu);
                    }

                    -[SGReminderDissector dueDateComponentsFromMessages:](self, "dueDateComponentsFromMessages:", v89);
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SGReminderDissector dueLocationFromMessages:](self, "dueLocationFromMessages:", v89);
                    v110 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SGReminderDissector storageLocationFromDueLocation:](self, "storageLocationFromDueLocation:");
                    v92 = objc_claimAutoreleasedReturnValue();
                    -[SGReminderDissector _validateDueDateComponents:dueLocation:forReminderMessages:](self, "_validateDueDateComponents:dueLocation:forReminderMessages:", v91, v92, v89);
                    v40 = objc_claimAutoreleasedReturnValue();
                    v106 = (void *)v92;

                    if (v40 | v92)
                    {
                      v93 = (void *)MEMORY[0x1E0D197D8];
                      objc_msgSend(v13, "message");
                      v94 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v94, "uniqueIdentifier");
                      v95 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v93, "urlForEKEventFromTextMessageWithUniqueIdentifier:", v95);
                      v105 = (void *)objc_claimAutoreleasedReturnValue();

                      v96 = objc_msgSend(v110, "locationType");
                      v97 = objc_msgSend(v110, "trigger");
                      LOBYTE(v104) = -[SGReminderDissector isAllDay:](self, "isAllDay:", v40);
                      LOBYTE(v103) = 2;
                      -[SGReminderDissector _reminderEnrichmentWithTitle:dueDateComponents:dueLocationType:dueLocation:dueLocationTrigger:sourceURL:reminderStatus:parentEntity:parentMessage:allDay:](self, "_reminderEnrichmentWithTitle:dueDateComponents:dueLocationType:dueLocation:dueLocationTrigger:sourceURL:reminderStatus:parentEntity:parentMessage:allDay:", *(_QWORD *)&v108, v40, v96, v106, v97, v105, v103, v9, v8, v104);
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      *((_BYTE *)v129 + 24) = 1;

                    }
                    else
                    {
                      v101 = *(void **)(*((_QWORD *)&buf + 1) + 40);
                      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = CFSTR("No dueDate nor dueLocation found in message");

                      v39 = 0;
                      *((_BYTE *)v129 + 24) = 4;
                    }

                  }
                  goto LABEL_42;
                }
                v98 = *(void **)(*((_QWORD *)&buf + 1) + 40);
                *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = CFSTR("No proposal found");

                v39 = 0;
                v110 = 0;
                v40 = 0;
                v60 = v129;
                v61 = 2;
              }
              else
              {
                if (objc_msgSend(v115, "isRejection"))
                {
                  objc_msgSend(v13, "extractedReminderDuplicateKey");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = v22 == 0;

                  if (!v23)
                  {
                    objc_msgSend(v13, "extractedReminderDuplicateKey");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v126 = 0;
                    v25 = objc_msgSend(v117, "rejectReminderByKey:error:", v24, &v126);
                    v26 = COERCE_DOUBLE(v126);

                    if ((v25 & 1) == 0)
                    {
                      sgRemindersLogHandle();
                      v27 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v132 = 138412290;
                        v133 = v26;
                        _os_log_error_impl(&dword_1C3607000, v27, OS_LOG_TYPE_ERROR, "SGReminderDissector: Couldn't reject reminder: %@", v132, 0xCu);
                      }

                    }
LABEL_31:
                    v39 = 0;
                    v110 = 0;
                    v40 = 0;
LABEL_42:
                    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
                    {
                      sgRemindersLogHandle();
                      v62 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
                      {
                        v99 = *(double *)(*((_QWORD *)&buf + 1) + 40);
                        *(_DWORD *)v132 = 138412290;
                        v133 = v99;
                        _os_log_debug_impl(&dword_1C3607000, v62, OS_LOG_TYPE_DEBUG, "SGReminderDissector: %@", v132, 0xCu);
                      }

                    }
                    objc_msgSend(v116, "source");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    v64 = objc_msgSend(v63, "hasPrefix:", CFSTR("suggest_tool"));

                    if (v64)
                    {
                      if (v17 && (objc_msgSend(v8, "isSent") & 1) == 0)
                      {
                        v65 = self->_conversations;
                        objc_msgSend(v8, "conversationIdentifier");
                        v66 = (void *)objc_claimAutoreleasedReturnValue();
                        -[NSMutableDictionary setObject:forKeyedSubscript:](v65, "setObject:forKeyedSubscript:", v115, v66);

                      }
                      v118[0] = MEMORY[0x1E0C809B0];
                      v118[1] = 3221225472;
                      v118[2] = __67__SGReminderDissector_extractReminderFromTextMessage_entity_store___block_invoke;
                      v118[3] = &unk_1E7DA8358;
                      v119 = v9;
                      v120 = v115;
                      p_buf = &buf;
                      v121 = v13;
                      v125 = &v128;
                      v122 = v112;
                      v123 = v113;
                      objc_msgSend(v119, "runWithDissectorLock:", v118);

                      v67 = v119;
                    }
                    else
                    {
                      if ((objc_msgSend(v8, "isSent") & 1) == 0)
                      {
                        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                        v102 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v102, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGReminderDissector.m"), 648, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("textMessage.isSent"));

                      }
                      v68 = self->_conversations;
                      objc_msgSend(v8, "conversationIdentifier");
                      v67 = (id)objc_claimAutoreleasedReturnValue();
                      -[NSMutableDictionary removeObjectForKey:](v68, "removeObjectForKey:", v67);
                    }

                    v69 = mach_absolute_time() - v109;
                    if (SGMachTimeToNanoseconds_onceToken != -1)
                      dispatch_once(&SGMachTimeToNanoseconds_onceToken, &__block_literal_global_13797);
                    v70 = (double)(v69
                                 * SGMachTimeToNanoseconds_machTimebaseInfo
                                 / *(unsigned int *)algn_1ED52979C)
                        * 0.000001;
                    if (v39 || *(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
                    {
                      +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
                      v71 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v71, "logReminderExtractionFromEntity:interface:actionType:dueLocation:dueDateComponents:extractionStatus:timingProcessing:", v9, 0, 0, v110, v40, *((unsigned __int8 *)v129 + 24), v70);

                    }
                    sgRemindersLogHandle();
                    v72 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)v132 = 134217984;
                      v133 = v70;
                      _os_log_debug_impl(&dword_1C3607000, v72, OS_LOG_TYPE_DEBUG, "SGReminderDissector: timing(ms): %f", v132, 0xCu);
                    }

                    v37 = v39;
LABEL_62:

                    _Block_object_dispose(&buf, 8);
                    goto LABEL_63;
                  }
                }
                v59 = *(void **)(*((_QWORD *)&buf + 1) + 40);
                *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = CFSTR("No confirmation found");

                v39 = 0;
                v110 = 0;
                v40 = 0;
                v60 = v129;
                v61 = 3;
              }
              *((_BYTE *)v60 + 24) = v61;
              goto LABEL_42;
            }
            sgRemindersLogHandle();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v132 = 0;
              _os_log_debug_impl(&dword_1C3607000, v38, OS_LOG_TYPE_DEBUG, "SGReminderDissector: No previous message", v132, 2u);
            }

            goto LABEL_31;
          }
        }
LABEL_39:
        v14 = 0;
LABEL_68:

        goto LABEL_69;
      }
      +[SGReminderExtractionModel sharedInstance](SGReminderExtractionModel, "sharedInstance");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textContent");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v41, "hasWhitelistedVerbInContent:", v42);

      if (v43)
      {
        v44 = -[SGReminderMessage initWithMessage:entity:enrichedTaggedCharacterRanges:modelOutput:]([SGReminderMessage alloc], "initWithMessage:entity:enrichedTaggedCharacterRanges:modelOutput:", v8, v9, 0, 0);
        v45 = self->_conversations;
        objc_msgSend(v8, "conversationIdentifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v45, "setObject:forKeyedSubscript:", v44, v46);

        objc_msgSend(v8, "textContent");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v44) = +[SGReminderMessage isConfirmationOptionalForContent:](SGReminderMessage, "isConfirmationOptionalForContent:", v47);

        if (!(_DWORD)v44)
          goto LABEL_39;
        objc_msgSend(v8, "sender");
        v37 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v37, "sg_isSignificantWithStore:", v117))
        {
          v48 = mach_absolute_time();
          objc_msgSend(v8, "textContent");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGReminderDissector processingLanguageForContent:](self, "processingLanguageForContent:", v49);
          v113 = (void *)objc_claimAutoreleasedReturnValue();

          +[SGReminderExtractionModel sharedInstance](SGReminderExtractionModel, "sharedInstance");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGReminderDissector _reminderMessageForTextMessage:withEntity:extractionModel:processingLanguage:preprocessing:](self, "_reminderMessageForTextMessage:withEntity:extractionModel:processingLanguage:preprocessing:", v8, v9, v50, v113, 0);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (v51)
          {
            v52 = self->_conversations;
            objc_msgSend(v8, "conversationIdentifier");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v52, "setObject:forKeyedSubscript:", v51, v53);

            -[SGReminderDissector _detectedReminderEnrichmentFromReminderMessage:parentEntity:language:parentMessage:startTimeProcessing:](self, "_detectedReminderEnrichmentFromReminderMessage:parentEntity:language:parentMessage:startTimeProcessing:", v51, v9, v113, v8, v48);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              v54 = self->_conversations;
              objc_msgSend(v8, "conversationIdentifier");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKeyedSubscript:](v54, "objectForKeyedSubscript:", v55);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "duplicateKey");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "setExtractedReminderDuplicateKey:", v57);

              v58 = v14;
            }

            v37 = v14;
          }
          else
          {
            v14 = 0;
          }
          goto LABEL_64;
        }
LABEL_66:
        v14 = 0;
        goto LABEL_67;
      }
    }
    else
    {
      objc_msgSend(v8, "conversationIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v34)
        goto LABEL_39;
    }
    v73 = self->_conversations;
    objc_msgSend(v8, "conversationIdentifier");
    v37 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v73, "removeObjectForKey:", v37);
    goto LABEL_66;
  }
  -[SGReminderDissector _testReminder:entity:](self, "_testReminder:entity:", v8, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_69:

  _Block_object_dispose(&v128, 8);
  return v14;
}

- (BOOL)isValidTextMessageForProcessing:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  BOOL v7;
  void *v9;
  void *v10;
  unint64_t v11;
  const char *v12;
  uint8_t *v13;
  __int16 v14;
  uint8_t buf[2];

  v3 = a3;
  objc_msgSend(v3, "textContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
    goto LABEL_4;
  objc_msgSend(v3, "textContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "length") >= 0x3E9)
  {

LABEL_4:
LABEL_5:
    sgRemindersLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_6;
    *(_WORD *)buf = 0;
    v12 = "SGReminderDissector: Message too short or too long to process or missing conversationIdentifier, bailing";
    v13 = buf;
LABEL_14:
    _os_log_debug_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEBUG, v12, v13, 2u);
    goto LABEL_6;
  }
  objc_msgSend(v3, "conversationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_5;
  objc_msgSend(v3, "recipients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 < 3)
  {
    v7 = 1;
    goto LABEL_7;
  }
  sgRemindersLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v14 = 0;
    v12 = "SGReminderDissector: Message is a group chat, bailing";
    v13 = (uint8_t *)&v14;
    goto LABEL_14;
  }
LABEL_6:

  v7 = 0;
LABEL_7:

  return v7;
}

- (id)processingLanguageForContent:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  BOOL v6;
  id v8;

  objc_msgSend(MEMORY[0x1E0D19EC0], "detectLanguageFromText:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19EC0], "defaultLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6 || v5 == 0)
    v8 = 0;
  else
    v8 = v3;

  return v8;
}

- (BOOL)mailAddressIsAccountOwner:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[SGContactStoreFactory contactStore](SGContactStoreFactory, "contactStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGCuratedContactMatcher fetchMeContactFromContactStore:](SGCuratedContactMatcher, "fetchMeContactFromContactStore:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v5, "emailAddresses", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v3, "emailAddress");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        SGNormalizeEmailAddress();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v10) = objc_msgSend(v10, "isEqualToString:", v12);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)reminderTitleFromMessages:(id)a3 forLanguage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "detectedTitleForLanguage:", v6, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)dueDateComponentsFromMessages:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    v10 = 1;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "dueDateDataDetectorMatches");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "first");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v12, "first");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v14);

          objc_msgSend(v12, "second");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "BOOLValue");

          v10 &= v16 ^ 1;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 1;
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = v5;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    v21 = v10 & 1;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        +[SGExtractionDocument dateComponentsFromDataDetectorMatch:inferDates:approximateTime:partialDate:useEndForDurations:](SGExtractionDocument, "dateComponentsFromDataDetectorMatch:inferDates:approximateTime:partialDate:useEndForDurations:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j), v21, 1, 1, 0, (_QWORD)v27);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend(v4, "addObject:", v23);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v19);
  }

  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "anyObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    v24 = 0;
  }
  else
  {
    objc_msgSend(v4, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGExtractionDocument mergeDetectedDateComponents:](SGExtractionDocument, "mergeDetectedDateComponents:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v24;
}

- (id)dueLocationFromMessages:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "dueLocation", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "anyObject");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((unint64_t)objc_msgSend(v4, "count") < 2)
    {
      v12 = 0;
      goto LABEL_16;
    }
    +[SGReminderDueLocation mergeDueLocations:](SGReminderDueLocation, "mergeDueLocations:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
LABEL_16:

  return v12;
}

- (id)defaultDueDateComponentsFromMessages:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
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
  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v8, "hasTrigger", (_QWORD)v11) & 1) != 0)
        {
          v4 = 0;
          goto LABEL_12;
        }
        v5 |= objc_msgSend(v8, "isTriggerOptional");
      }
      v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }

    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SGExtractionDocument allDayDateComponentsFromDate:](SGReminderMessage, "allDayDateComponentsFromDate:", v9);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    v4 = 0;
  }
  else
  {
LABEL_12:
    v9 = v3;
LABEL_13:

  }
  return v4;
}

- (BOOL)isAllDay:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  v4 = v3;
  v5 = v3
    && objc_msgSend(v3, "hour") == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v4, "minute") == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v4, "second") == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v4, "nanosecond") == 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (id)_validateDueDateComponents:(id)a3 dueLocation:(id)a4 forReminderMessages:(id)a5
{
  uint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  uint8_t v19[16];

  v8 = (uint64_t)a3;
  v9 = (unint64_t)a4;
  v10 = a5;
  if (!(v8 | v9))
  {
    -[SGReminderDissector defaultDueDateComponentsFromMessages:](self, "defaultDueDateComponentsFromMessages:", v10);
    v8 = objc_claimAutoreleasedReturnValue();
    +[SGReminderTrialClientWrapper sharedInstance](SGReminderTrialClientWrapper, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v8)
    {
      if (objc_msgSend(v11, "triggerOptional"))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[SGExtractionDocument allDayDateComponentsFromDate:](SGReminderMessage, "allDayDateComponentsFromDate:", v13);
        v8 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = 0;
      }
    }

  }
  if (v8)
  {
    v14 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isReminderDueDateComponentsInPast:givenReferenceDate:allDay:", v8, v15, -[SGReminderDissector isAllDay:](self, "isAllDay:", v8)) & 1) != 0)
    {
      v16 = objc_msgSend(MEMORY[0x1E0D198F0], "showPastEvents");

      if ((v16 & 1) == 0)
      {
        sgRemindersLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_1C3607000, v17, OS_LOG_TYPE_DEFAULT, "SGReminderDissector: Date is in the past, skipping", v19, 2u);
        }

        v8 = 0;
      }
    }
    else
    {

    }
  }

  return (id)v8;
}

- (id)_reminderMessageForTextMessage:(id)a3 withEntity:(id)a4 extractionModel:(id)a5 processingLanguage:(id)a6 preprocessing:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  SGReminderMessage *v23;
  NSMutableDictionary *conversations;
  SGReminderMessage *v25;
  uint8_t v27[8];
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  SGReminderDissector *v32;
  uint8_t *v33;
  uint8_t buf[8];
  uint8_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = v15;
  if (!v14)
  {
    sgRemindersLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v22 = "SGReminderDissector: ExtractionModel is nil";
LABEL_19:
    _os_log_debug_impl(&dword_1C3607000, v21, OS_LOG_TYPE_DEBUG, v22, buf, 2u);
    goto LABEL_12;
  }
  if (v15)
  {
    *(_QWORD *)buf = 0;
    v35 = buf;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__1593;
    v38 = __Block_byref_object_dispose__1594;
    v39 = 0;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __114__SGReminderDissector__reminderMessageForTextMessage_withEntity_extractionModel_processingLanguage_preprocessing___block_invoke;
    v28[3] = &unk_1E7DACA70;
    v17 = v13;
    v29 = v17;
    v18 = v12;
    v30 = v18;
    v32 = self;
    v33 = buf;
    v31 = v16;
    objc_msgSend(v17, "runWithDissectorLock:", v28);
    if (objc_msgSend(*((id *)v35 + 5), "count"))
    {
      objc_msgSend(v14, "modelInferences:", *((_QWORD *)v35 + 5));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19 || a7)
      {
        v25 = [SGReminderMessage alloc];
        v23 = -[SGReminderMessage initWithMessage:entity:enrichedTaggedCharacterRanges:modelOutput:](v25, "initWithMessage:entity:enrichedTaggedCharacterRanges:modelOutput:", v18, v17, *((_QWORD *)v35 + 5), v19);
        goto LABEL_16;
      }
      sgRemindersLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v27 = 0;
        _os_log_error_impl(&dword_1C3607000, v20, OS_LOG_TYPE_ERROR, "SGReminderDissector: No model output, bailing", v27, 2u);
      }

      v19 = 0;
    }
    else
    {
      conversations = self->_conversations;
      objc_msgSend(v18, "conversationIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](conversations, "removeObjectForKey:", v19);
    }
    v23 = 0;
LABEL_16:

    _Block_object_dispose(buf, 8);
    goto LABEL_17;
  }
  sgRemindersLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    v22 = "SGReminderDissector: Processinglanguage is nil";
    goto LABEL_19;
  }
LABEL_12:

  v23 = 0;
LABEL_17:

  return v23;
}

- (id)conversations
{
  return self->_conversations;
}

- (BOOL)_isTestMessage:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;

  v3 = a3;
  objc_msgSend(v3, "textContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "textContent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("SG_QA_REMINDER_TEST"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_testReminder:(id)a3 entity:(id)a4
{
  void *v6;
  id v7;
  id v8;
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
  uint64_t v20;
  uint64_t v21;

  v6 = (void *)MEMORY[0x1E0C99D48];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "dateByAddingTimeInterval:", 172800.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsInTimeZone:fromDate:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SGReminderDissector fetchLocationOfInterestByType:name:](self, "fetchLocationOfInterestByType:name:", 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0D197D8];
  objc_msgSend(v8, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "urlForEKEventFromTextMessageWithUniqueIdentifier:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = 0;
  LOBYTE(v20) = 2;
  -[SGReminderDissector _reminderEnrichmentWithTitle:dueDateComponents:dueLocationType:dueLocation:dueLocationTrigger:sourceURL:reminderStatus:parentEntity:parentMessage:allDay:](self, "_reminderEnrichmentWithTitle:dueDateComponents:dueLocationType:dueLocation:dueLocationTrigger:sourceURL:reminderStatus:parentEntity:parentMessage:allDay:", CFSTR("TEST REMINDER"), v13, 1, v14, 1, v17, v20, v7, v8, v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_reminderEnrichmentWithTitle:(id)a3 dueDateComponents:(id)a4 dueLocationType:(unsigned __int8)a5 dueLocation:(id)a6 dueLocationTrigger:(unsigned __int8)a7 sourceURL:(id)a8 reminderStatus:(unsigned __int8)a9 parentEntity:(id)a10 parentMessage:(id)a11 allDay:(BOOL)a12
{
  id v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  NSObject *v27;
  NSObject *v28;
  SGPipelineEnrichment *v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v67;
  void *v68;
  id v69;
  unint64_t v70;
  id v71;
  unsigned int v72;
  unsigned int v73;
  void *v74;
  _QWORD v75[4];
  _QWORD v76[4];
  unint64_t v77;
  uint8_t buf[4];
  id v79;
  __int16 v80;
  unint64_t v81;
  __int16 v82;
  unint64_t v83;
  uint64_t v84;

  v72 = a7;
  v73 = a5;
  v84 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = (unint64_t)a4;
  v17 = (unint64_t)a6;
  v18 = a8;
  v19 = a10;
  v20 = a11;
  v74 = v20;
  if (v16 | v17)
  {
    v21 = v20;
    v71 = v18;
    if (v16)
    {
      objc_msgSend(v20, "date");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)v22;
        v24 = (void *)objc_opt_class();
        objc_msgSend(v21, "date");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v24, "isReminderDueDateComponentsInPast:givenReferenceDate:allDay:", v16, v25, a12) & 1) != 0)
        {
          v26 = objc_msgSend(MEMORY[0x1E0D198F0], "showPastEvents");

          v18 = v71;
          if ((v26 & 1) == 0)
          {
            sgRemindersLogHandle();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C3607000, v27, OS_LOG_TYPE_DEFAULT, "SGReminderDissector: DueDate in past, bailing", buf, 2u);
            }

          }
        }
        else
        {

          v18 = v71;
        }
      }
    }
    sgPrivateLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v79 = v15;
      v80 = 2112;
      v81 = v16;
      v82 = 2112;
      v83 = v17;
      _os_log_debug_impl(&dword_1C3607000, v30, OS_LOG_TYPE_DEBUG, "Creating enrichment for Reminder: %@, dueTime: %@, dueLocation: %@", buf, 0x20u);
    }

    sgRemindersLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v31, OS_LOG_TYPE_INFO, "Creating Reminder enrichment", buf, 2u);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = v21;
      if ((objc_msgSend(v32, "isSent") & 1) != 0)
      {
        objc_msgSend(v32, "recipients");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "firstObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "contactIdentifier");
        v35 = (const __CFString *)objc_claimAutoreleasedReturnValue();

        v18 = v71;
      }
      else
      {
        objc_msgSend(v32, "sender");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "contactIdentifier");
        v35 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        sgRemindersLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C3607000, v39, OS_LOG_TYPE_ERROR, "SGReminderDissector - Unknown object encountered while resolving contactId", buf, 2u);
        }

LABEL_29:
        sgRemindersLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C3607000, v36, OS_LOG_TYPE_DEFAULT, "SGReminderDissector - Could not resolve Contact. Nil contactIdentifier", buf, 2u);
        }
        v28 = 0;
        v35 = &stru_1E7DB83A8;
        goto LABEL_32;
      }
      v36 = v21;
      -[NSObject from](v36, "from");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "asCSPerson");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "contactIdentifier");
      v35 = (const __CFString *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        v28 = v35;
        v18 = v71;
LABEL_32:

LABEL_33:
        v70 = v17;
        v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), v15);
        if (!v45)
        {
          sgRemindersLogHandle();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v79 = v19;
            _os_log_error_impl(&dword_1C3607000, v57, OS_LOG_TYPE_ERROR, "No groupId found for entity %@", buf, 0xCu);
          }
          v29 = 0;
          goto LABEL_48;
        }
        objc_msgSend(v19, "creationTimestamp");
        v47 = v46;
        objc_msgSend(v19, "duplicateKey");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        +[SGDuplicateKey duplicateKeyForPseudoReminderWithGroupId:withCreationTime:parentKey:](SGDuplicateKey, "duplicateKeyForPseudoReminderWithGroupId:withCreationTime:parentKey:", v45, v48, v47);
        v49 = objc_claimAutoreleasedReturnValue();

        v67 = v49;
        v68 = v19;
        v29 = -[SGPipelineEnrichment initWithDuplicateKey:title:parent:]([SGPipelineEnrichment alloc], "initWithDuplicateKey:title:parent:", v49, v15, v19);
        v69 = v15;
        if (v16)
        {
          v50 = (void *)MEMORY[0x1E0D19940];
          objc_msgSend((id)v16, "date");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v16, "timeZone");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v16, "date");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v16, "timeZone");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "rangeWithStartDate:startTimeZone:endDate:endTimeZone:", v51, v52, v53, v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGEntity setTimeRange:](v29, "setTimeRange:", v55);

          v56 = v72;
        }
        else
        {
          v56 = v72;
          if (!v70 || !v72)
            goto LABEL_43;
          v58 = objc_alloc(MEMORY[0x1E0C99E20]);
          v77 = v70;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = (void *)objc_msgSend(v58, "initWithArray:", v51);
          -[SGEntity setLocations:](v29, "setLocations:", v52);
        }

LABEL_43:
        v59 = (void *)MEMORY[0x1E0D197F0];
        v75[0] = *MEMORY[0x1E0D19D58];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a9);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v76[0] = v60;
        v75[1] = *MEMORY[0x1E0D19D48];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v56);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v76[1] = v61;
        v75[2] = *MEMORY[0x1E0D19D50];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v73);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v75[3] = *MEMORY[0x1E0D19D40];
        v76[2] = v62;
        v76[3] = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 4);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "reminderMetadata:", v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = v68;
        objc_msgSend(v68, "creationTimestamp");
        -[SGPipelineEnrichment setCreationTimestamp:](v29, "setCreationTimestamp:");
        if (v64)
          -[SGEntity addTag:](v29, "addTag:", v64);
        v18 = v71;
        if (a12)
        {
          objc_msgSend(MEMORY[0x1E0D197F0], "allDay");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGEntity addTag:](v29, "addTag:", v65);

        }
        v15 = v69;
        v57 = v67;
LABEL_48:

        v17 = v70;
        goto LABEL_49;
      }
      v40 = (void *)objc_opt_class();
      -[NSObject from](v36, "from");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "name");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject from](v36, "from");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "emailAddress");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "getContactIdentifierForName:andEmail:ifMatchingPredicate:", v42, v44, &__block_literal_global_87);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "identifier");
      v35 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      v18 = v71;
      v21 = v74;
    }

    v28 = v35;
    if (v35)
      goto LABEL_33;
    goto LABEL_29;
  }
  sgRemindersLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C3607000, v28, OS_LOG_TYPE_DEBUG, "No dueLocation or dueDate, bailing", buf, 2u);
  }
  v29 = 0;
LABEL_49:

  return v29;
}

- (id)storageLocationFromDueLocation:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "locationType");
  v6 = 0;
  v7 = 0;
  switch(v5)
  {
    case 0:
      goto LABEL_9;
    case 1:
      goto LABEL_7;
    case 2:
      v6 = 0;
      v7 = 1;
      goto LABEL_7;
    case 3:
      v6 = 0;
      v7 = 2;
      goto LABEL_7;
    case 4:
      objc_msgSend(v4, "name", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v8;
      if (!v8)
        goto LABEL_8;
      v7 = -1;
LABEL_7:
      -[SGReminderDissector fetchLocationOfInterestByType:name:](self, "fetchLocationOfInterestByType:name:", v7, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v9 = v8;

      v6 = v9;
LABEL_9:

      return v6;
    default:
      v8 = 0;
      goto LABEL_8;
  }
}

- (id)fetchLocationOfInterestByType:(int64_t)a3 name:(id)a4
{
  id v6;
  dispatch_semaphore_t v7;
  RTRoutineManager *rtRoutineManager;
  NSObject *v9;
  SGStorageLocation *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  SGStorageLocation *v26;
  NSObject *v27;
  NSObject *v28;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  NSObject *v34;
  uint8_t *v35;
  int64_t v36;
  uint8_t buf[8];
  uint8_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v6 = a4;
  v7 = dispatch_semaphore_create(0);
  rtRoutineManager = self->_rtRoutineManager;
  if (rtRoutineManager)
  {
    *(_QWORD *)buf = 0;
    v38 = buf;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__1593;
    v41 = __Block_byref_object_dispose__1594;
    v42 = 0;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __58__SGReminderDissector_fetchLocationOfInterestByType_name___block_invoke;
    v32[3] = &unk_1E7DA83A0;
    v36 = a3;
    v33 = v6;
    v35 = buf;
    v9 = v7;
    v34 = v9;
    -[RTRoutineManager fetchLocationsOfInterestOfType:withHandler:](rtRoutineManager, "fetchLocationsOfInterestOfType:withHandler:", a3, v32);
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    if (*((_QWORD *)v38 + 5))
    {
      v10 = [SGStorageLocation alloc];
      objc_msgSend(*((id *)v38 + 5), "preferredName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)v38 + 5), "mapItem");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "location");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "latitude");
      v13 = v12;
      objc_msgSend(*((id *)v38 + 5), "mapItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "location");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "longitude");
      v17 = v16;
      objc_msgSend(*((id *)v38 + 5), "mapItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "location");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "horizontalUncertainty");
      v21 = v20;
      objc_msgSend(*((id *)v38 + 5), "confidence");
      v23 = v22;
      objc_msgSend(*((id *)v38 + 5), "mapItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "geoMapItemHandle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[SGStorageLocation initWithType:label:address:airportCode:latitude:longitude:accuracy:quality:handle:](v10, "initWithType:label:address:airportCode:latitude:longitude:accuracy:quality:handle:", 1, v30, 0, 0, v25, v13, v17, v21, v23);

    }
    else
    {
      v26 = 0;
    }
    v27 = v26;

    _Block_object_dispose(buf, 8);
    v28 = v27;
  }
  else
  {
    sgRemindersLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v27, OS_LOG_TYPE_ERROR, "Unable to load RTRoutineManager", buf, 2u);
    }
    v28 = 0;
  }

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtRoutineManager, 0);
  objc_storeStrong((id *)&self->_conversations, 0);
}

void __58__SGReminderDissector_fetchLocationOfInterestByType_name___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint8_t v38[128];
  uint8_t buf[4];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    sgRemindersLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v6;
      _os_log_error_impl(&dword_1C3607000, v7, OS_LOG_TYPE_ERROR, "Unable to get LocationsOfInterest: %@", buf, 0xCu);
    }

  }
  if (*(_QWORD *)(a1 + 56) != -1)
  {
    if (objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(v5, "firstObject");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v10 = *(id *)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;
LABEL_31:

      goto LABEL_32;
    }
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v10 = v5;
    v19 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (!v19)
      goto LABEL_31;
    v20 = v19;
    v28 = v6;
    v21 = 0;
    v22 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(v10);
        v24 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v24, "visits");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "count");

        if (v26 > v21)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v24);
          objc_msgSend(v24, "visits");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v27, "count");

        }
      }
      v20 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v20);
LABEL_30:
    v6 = v28;
    goto LABEL_31;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (!v11)
      goto LABEL_31;
    v12 = v11;
    v28 = v6;
    v13 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        objc_msgSend(v15, "preferredName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "length"))
        {
          objc_msgSend(v15, "preferredName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "caseInsensitiveCompare:", *(_QWORD *)(a1 + 32));

          if (!v18)
          {
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v15);
            goto LABEL_30;
          }
        }
        else
        {

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v12);
    goto LABEL_30;
  }
LABEL_32:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

uint64_t __176__SGReminderDissector__reminderEnrichmentWithTitle_dueDateComponents_dueLocationType_dueLocation_dueLocationTrigger_sourceURL_reminderStatus_parentEntity_parentMessage_allDay___block_invoke()
{
  return 1;
}

void __114__SGReminderDissector__reminderMessageForTextMessage_withEntity_extractionModel_processingLanguage_preprocessing___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v2 = *(void **)(a1 + 32);
  +[SGPOSTagger sharedInstance](SGPOSTagger, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "textContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tokenizeTextContent:languageHint:", v4, *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addTaggedCharacterRanges:", v5);

  objc_msgSend((id)objc_opt_class(), "enrichedTaggedCharacterRangesFromEntity:forMessage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __67__SGReminderDissector_extractReminderFromTextMessage_entity_store___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "modelOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "enrichedTaggedCharacterRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGReminderExtractionModel enrichTaggedCharacterRangesWithModelOutput:usingInputCharacterRanges:](SGReminderExtractionModel, "enrichTaggedCharacterRangesWithModelOutput:usingInputCharacterRanges:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addTaggedCharacterRanges:", v5);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v26[0] = *(_QWORD *)(a1 + 48);
    v26[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v8 = +[SGReminderMessage validModelOutput:error:](SGReminderMessage, "validModelOutput:error:", v7, &v23);
    v9 = v23;

    if (!v8)
    {
      if (v9)
      {
        objc_msgSend(v9, "userInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "description");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v13 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 6;
    }

  }
  objc_msgSend(*(id *)(a1 + 56), "modelDescription");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0D197F0];
  v24[0] = CFSTR("extractionStatus");
  +[SGRTCLogging describeReminderExtractionStatus:](SGRTCLogging, "describeReminderExtractionStatus:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v24[1] = CFSTR("errorMessage");
  v18 = *(_QWORD *)(a1 + 64);
  v19 = *(const __CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (!v19)
    v19 = &stru_1E7DB83A8;
  v25[0] = v16;
  v25[1] = v19;
  v24[2] = CFSTR("processingLanguage");
  v24[3] = CFSTR("modelDescription");
  if (v14)
    v20 = v14;
  else
    v20 = &stru_1E7DB83A8;
  v25[2] = v18;
  v25[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reminderMetadata:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    objc_msgSend(*(id *)(a1 + 32), "addTag:", v22);

}

void __66__SGReminderDissector_extractReminderFromOwnedMailMessage_entity___block_invoke(uint64_t a1, NSUInteger a2, NSUInteger a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger length;
  NSUInteger location;
  uint64_t i;
  void *v14;
  NSUInteger v15;
  NSUInteger v16;
  NSRange v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  NSRange v26;
  BOOL v27;
  SGTaggedCharacterRange *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSUInteger v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  SGTaggedCharacterRange *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  SGMessage *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  SGReminderMessage *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v67;
  NSUInteger v68;
  void *v69;
  void *v70;
  id obj;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  void *v83;
  _QWORD v84[2];
  _QWORD v85[2];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;
  NSRange v89;
  NSRange v90;
  NSRange v91;
  NSRange v92;
  NSRange v93;
  NSRange v94;
  NSRange v95;
  NSRange v96;

  v88 = *MEMORY[0x1E0C80C00];
  v70 = (void *)objc_opt_new();
  v67 = a1;
  objc_msgSend(*(id *)(a1 + 32), "taggedCharacterRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v77;
    length = a3;
    location = a2;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v77 != v10)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        v93.location = objc_msgSend(v14, "range");
        v93.length = v15;
        v89.location = a2;
        v89.length = a3;
        if (NSIntersectionRange(v89, v93).length)
        {
          v94.location = objc_msgSend(v14, "range");
          v94.length = v16;
          v90.location = location;
          v90.length = length;
          v17 = NSUnionRange(v90, v94);
          location = v17.location;
          length = v17.length;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
    }
    while (v9);
  }
  else
  {
    length = a3;
    location = a2;
  }
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = v7;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v73;
    v68 = length;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v73 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
        v95.location = objc_msgSend(v22, "range");
        v95.length = v23;
        v91.location = location;
        v91.length = length;
        v24 = NSIntersectionRange(v91, v95).length;
        v96.location = objc_msgSend(v22, "range");
        v96.length = v25;
        v92.location = location;
        v92.length = length;
        v26 = NSUnionRange(v92, v96);
        if (v24)
          v27 = v26.location == location;
        else
          v27 = 0;
        if (v27 && v26.length == length)
        {
          v29 = [SGTaggedCharacterRange alloc];
          v30 = objc_msgSend(v22, "annotationType");
          objc_msgSend(v22, "tags");
          v31 = v19;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v22, "range") - location;
          objc_msgSend(v22, "range");
          v35 = v34;
          objc_msgSend(v22, "text");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](v29, "initWithAnnotationType:tags:range:text:", v30, v32, v33, v35, v36);

          v19 = v31;
          length = v68;
          objc_msgSend(v70, "addObject:", v37);

        }
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
    }
    while (v19);
  }

  objc_msgSend(*(id *)(v67 + 40), "quotedRegions");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v38, "intersectsIndexesInRange:", location, length) & 1) != 0)
    goto LABEL_31;
  objc_msgSend(*(id *)(v67 + 40), "htmlParser");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "tabularRegions");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v40, "intersectsIndexesInRange:", location, length))
  {

LABEL_31:
    goto LABEL_32;
  }
  objc_msgSend(*(id *)(v67 + 40), "htmlParser");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "signatureRegions");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "intersectsIndexesInRange:", location, length);

  if ((v44 & 1) != 0)
  {
LABEL_32:
    sgRemindersLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v41, OS_LOG_TYPE_INFO, "SGReminderDissector: Skipping parts of content that are identified as not plain text", buf, 2u);
    }
    goto LABEL_46;
  }
  v45 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(v67 + 40), "textContent");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "substringWithRange:", location, length);
  v41 = objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v45);
  objc_msgSend(*(id *)(v67 + 40), "date");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGDataDetectorMatch detectionsInPlainText:baseDate:](SGDataDetectorMatch, "detectionsInPlainText:baseDate:", v41, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  +[SGPOSTagger sharedInstance](SGPOSTagger, "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "tokenizeTextContent:languageHint:", v41, *(_QWORD *)(v67 + 48));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "addObjectsFromArray:", v50);

  objc_msgSend((id)objc_opt_class(), "enrichedTaggedCharacterRangesFromTaggedCharacterRanges:messageIsSent:", v70, 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v51, "count"))
  {
    +[SGReminderExtractionModel sharedInstance](SGReminderExtractionModel, "sharedInstance");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "modelInferences:", v51);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      v65 = v52;
      v54 = [SGMessage alloc];
      v84[0] = CFSTR("isSent");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(v67 + 40), "isSent"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v84[1] = CFSTR("body");
      v85[0] = v55;
      v85[1] = v41;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 2);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = -[SGMessage initWithMessageDictionary:](v54, "initWithMessageDictionary:", v56);

      v69 = v48;
      v58 = -[SGReminderMessage initWithMessage:plainTextDetectedData:enrichedTaggedCharacterRanges:modelOutput:]([SGReminderMessage alloc], "initWithMessage:plainTextDetectedData:enrichedTaggedCharacterRanges:modelOutput:", v57, v48, v51, v53);
      objc_msgSend(*(id *)(v67 + 56), "_detectedReminderEnrichmentFromReminderMessage:parentEntity:language:parentMessage:startTimeProcessing:", v58, *(_QWORD *)(v67 + 32), *(_QWORD *)(v67 + 48), *(_QWORD *)(v67 + 40), *(_QWORD *)(v67 + 72));
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = *(_QWORD *)(*(_QWORD *)(v67 + 64) + 8);
      v61 = *(void **)(v60 + 40);
      *(_QWORD *)(v60 + 40) = v59;

      sgRemindersLogHandle();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(v67 + 32), "loggingIdentifier");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v67 + 64) + 8) + 40), "loggingIdentifier");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v81 = v63;
        v82 = 2114;
        v83 = v64;
        _os_log_impl(&dword_1C3607000, v62, OS_LOG_TYPE_DEFAULT, "SGEntity: %{public}@ -> SGPipelineEnrichment: %{public}@", buf, 0x16u);

      }
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v67 + 64) + 8) + 40))
        *a4 = 1;

      v48 = v69;
      v52 = v65;
    }
    else
    {
      sgRemindersLogHandle();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C3607000, v57, OS_LOG_TYPE_ERROR, "SGReminderDissector: Not model output, bailing", buf, 2u);
      }
    }

  }
LABEL_46:

}

void __61__SGReminderDissector_extractReminderFromMailMessage_entity___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "extractReminderFromOwnedMailMessage:entity:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken4 != -1)
    dispatch_once(&sharedInstance__pasOnceToken4, &__block_literal_global_1672);
  return (id)sharedInstance__pasExprOnceResult;
}

+ (id)enrichedTaggedCharacterRangesFromTaggedCharacterRanges:(id)a3 messageIsSent:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  SGTaggedCharacterRange *v24;
  void *v25;
  void *v26;
  SGTaggedCharacterRange *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v33;
  uint8_t buf[16];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  void *v39;
  SGTaggedCharacterRange *v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v4 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "mutableCopy");
  v6 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (objc_msgSend(v12, "annotationType") == 3)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v9);
  }

  +[SGReminderExtractionModel sharedInstance](SGReminderExtractionModel, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "enrichments");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("polarityEmojisMapping"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v42 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[SGTaggedCharacterRange enrichAndFilterTaggedCharacterRanges:usingMapping:withAnnotationType:](SGTaggedCharacterRange, "enrichAndFilterTaggedCharacterRanges:usingMapping:withAnnotationType:", v6, v17, 3);
      v18 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("verbsMapping"));
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if (v19)
      {
        v41 = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[SGTaggedCharacterRange enrichAndFilterTaggedCharacterRanges:usingMapping:withAnnotationType:](SGTaggedCharacterRange, "enrichAndFilterTaggedCharacterRanges:usingMapping:withAnnotationType:", v6, v21, 7);
        v33 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "addObjectsFromArray:", v18);
        objc_msgSend(v7, "addObjectsFromArray:", v33);
        v22 = CFSTR("CONTACT");
        if (v4)
          v22 = CFSTR("ACCOUNT_OWNER");
        v23 = v22;
        v24 = [SGTaggedCharacterRange alloc];
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("IS_%@"), v23);

        v39 = v25;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](v24, "initWithAnnotationType:tags:range:text:", 5, v26, 0, 0, &stru_1E7DB83A8);
        v40 = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
        v28 = v18;
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        +[SGTaggedCharacterRange mergeTaggedCharacterRanges:usingBaseTaggedCharacterRanges:extraTags:tagOverrides:alignWithGroundTruth:](SGTaggedCharacterRange, "mergeTaggedCharacterRanges:usingBaseTaggedCharacterRanges:extraTags:tagOverrides:alignWithGroundTruth:", v7, v6, v29, 0, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = v28;
        v31 = v33;
      }
      else
      {
        sgRemindersLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C3607000, v31, OS_LOG_TYPE_ERROR, "SGReminderDissector: Unable to load verb mapping", buf, 2u);
        }
        v30 = (void *)MEMORY[0x1E0C9AA60];
      }

    }
    else
    {
      sgRemindersLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C3607000, v18, OS_LOG_TYPE_ERROR, "SGReminderDissector: Unable to load emoji assets", buf, 2u);
      }
      v30 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    sgRemindersLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v16, OS_LOG_TYPE_ERROR, "SGReminderDissector: Unable to load model assets", buf, 2u);
    }
    v30 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v30;
}

+ (id)enrichedTaggedCharacterRangesFromEntity:(id)a3 forMessage:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a3, "taggedCharacterRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isSent");

  objc_msgSend(a1, "enrichedTaggedCharacterRangesFromTaggedCharacterRanges:messageIsSent:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)isReminderDueDateComponentsInPast:(id)a3 givenReferenceDate:(id)a4 allDay:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;

  v5 = a5;
  v7 = a3;
  objc_msgSend(a4, "timeIntervalSinceReferenceDate");
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateFromComponents:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = v12;

  if (v5)
  {
    v14 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v14, "setHour:", 23);
    objc_msgSend(v14, "setMinute:", 59);
    objc_msgSend(v14, "setSecond:", 59);
    objc_msgSend(v14, "timeZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTimeZone:", v16);

    }
    objc_msgSend(v14, "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceReferenceDate");
    v13 = v18;

  }
  return v9 > v13;
}

+ (id)getContactIdentifierForName:(id)a3 andEmail:(id)a4 ifMatchingPredicate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  char v28;
  id v29;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _QWORD v54[4];

  v54[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  +[SGContactStoreFactory contactStore](SGContactStoreFactory, "contactStore");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0C966A8];
  v54[0] = *MEMORY[0x1E0C966E8];
  v54[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __80__SGReminderDissector_getContactIdentifierForName_andEmail_ifMatchingPredicate___block_invoke;
  v48[3] = &unk_1E7DB1FF0;
  v36 = v9;
  v50 = v36;
  v14 = v10;
  v49 = v14;
  v39 = v7;
  v37 = (void *)v11;
  +[SGContactsInterface enumerateContactsMatchingName:withKeysToFetch:usingContactStore:error:usingBlock:](SGContactsInterface, "enumerateContactsMatchingName:withKeysToFetch:usingContactStore:error:usingBlock:", v7, v13, v11, &v51, v48);
  v35 = v51;

  objc_msgSend(v14, "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v8;
  SGNormalizeEmailAddress();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v17 = v15;
  v33 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v33)
  {
    v18 = *(_QWORD *)v45;
    v31 = *(_QWORD *)v45;
    v32 = v14;
    v34 = v17;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v45 != v18)
          objc_enumerationMutation(v17);
        v20 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        objc_msgSend(v20, "emailAddresses");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v41;
          while (2)
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v41 != v24)
                objc_enumerationMutation(v21);
              objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "value");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              SGNormalizeEmailAddress();
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v16, "isEqualToString:", v27);

              if ((v28 & 1) != 0)
              {
                v29 = v20;

                v14 = v32;
                v17 = v34;
                goto LABEL_19;
              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
            if (v23)
              continue;
            break;
          }
        }

        v17 = v34;
        v18 = v31;
      }
      v29 = 0;
      v14 = v32;
      v33 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v33);
  }
  else
  {
    v29 = 0;
  }
LABEL_19:

  return v29;
}

void __80__SGReminderDissector_getContactIdentifierForName_andEmail_ifMatchingPredicate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __37__SGReminderDissector_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
