@implementation SGRTCLogging

- (SGRTCLogging)init
{
  SGRTCLogging *v2;
  SGRTCLogging *v3;
  NSString *path;
  id v5;
  void *v6;
  uint64_t v7;
  _PASLock *lock;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *interactionsWriteQueue;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_source_t v15;
  OS_dispatch_source *persistenceTimerSource;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SGRTCLogging;
  v2 = -[SGRTCLogging init](&v22, sel_init);
  v3 = v2;
  if (v2)
  {
    path = v2->_path;
    v2->_path = 0;

    v5 = objc_alloc(MEMORY[0x1E0D815F0]);
    v6 = (void *)objc_opt_new();
    v7 = objc_msgSend(v5, "initWithGuardedData:", v6);
    lock = v3->_lock;
    v3->_lock = (_PASLock *)v7;

    -[_PASLock runWithLockAcquired:](v3->_lock, "runWithLockAcquired:", &__block_literal_global_85);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.suggestd.interactions-write-queue", v9);
    interactionsWriteQueue = v3->_interactionsWriteQueue;
    v3->_interactionsWriteQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_BACKGROUND, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("rtc-persist", v13);

    v15 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v14);
    persistenceTimerSource = v3->_persistenceTimerSource;
    v3->_persistenceTimerSource = (OS_dispatch_source *)v15;

    location = 0;
    objc_initWeak(&location, v3);
    v17 = v3->_persistenceTimerSource;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __20__SGRTCLogging_init__block_invoke_2;
    v19[3] = &unk_1E7DB7010;
    objc_copyWeak(&v20, &location);
    dispatch_source_set_event_handler(v17, v19);
    dispatch_resume((dispatch_object_t)v3->_persistenceTimerSource);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
  return v3;
}

- (SGRTCLogging)initWithFilename:(id)a3
{
  id v5;
  SGRTCLogging *v6;
  SGRTCLogging *v7;

  v5 = a3;
  v6 = -[SGRTCLogging init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_path, a3);

  return v7;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEBUG, "SGRTCLogging going away now", buf, 2u);
  }

  dispatch_source_cancel((dispatch_source_t)self->_persistenceTimerSource);
  v4.receiver = self;
  v4.super_class = (Class)SGRTCLogging;
  -[SGRTCLogging dealloc](&v4, sel_dealloc);
}

- (id)loggedExtractions
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11369;
  v10 = __Block_byref_object_dispose__11370;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__SGRTCLogging_loggedExtractions__block_invoke;
  v5[3] = &unk_1E7DABB40;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)loggedInteractions
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11369;
  v10 = __Block_byref_object_dispose__11370;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__SGRTCLogging_loggedInteractions__block_invoke;
  v5[3] = &unk_1E7DABB40;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)loggedInteractionsSummary
{
  _PASLock *lock;
  void *v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__11369;
  v11 = __Block_byref_object_dispose__11370;
  v12 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__SGRTCLogging_loggedInteractionsSummary__block_invoke;
  v6[3] = &unk_1E7DABB40;
  v6[4] = &v7;
  v3 = (void *)MEMORY[0x1C3BD4F6C](-[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6));
  objc_msgSend((id)v8[5], "sortedArrayUsingComparator:", &__block_literal_global_93_11523);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v3);
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (unint64_t)loggedExtractionsEventsCount
{
  _PASLock *lock;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__SGRTCLogging_loggedExtractionsEventsCount__block_invoke;
  v5[3] = &unk_1E7DABB40;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (SGRTCLogging)initWithCoder:(id)a3
{
  id v5;
  SGRTCLogging *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _PASLock *lock;
  id v17;
  void *context;
  SEL v20;
  _QWORD v21[4];
  id v22;
  id v23;
  SGRTCLogging *v24;
  SEL v25;

  v5 = a3;
  v6 = -[SGRTCLogging init](self, "init");
  if (v6)
  {
    context = (void *)MEMORY[0x1C3BD4F6C]();
    v20 = a2;
    v7 = objc_alloc(MEMORY[0x1E0C99E60]);
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = (void *)objc_msgSend(v7, "initWithObjects:", v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
    objc_autoreleasePoolPop(context);
    lock = v6->_lock;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __30__SGRTCLogging_initWithCoder___block_invoke;
    v21[3] = &unk_1E7DABBA8;
    v22 = v5;
    v23 = v15;
    v25 = v20;
    v24 = v6;
    v17 = v15;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v21);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__SGRTCLogging_encodeWithCoder___block_invoke;
  v7[3] = &unk_1E7DABBD0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

- (void)updateAndScheduleDiskWrite
{
  NSObject *persistenceTimerSource;
  dispatch_time_t v3;

  persistenceTimerSource = self->_persistenceTimerSource;
  v3 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(persistenceTimerSource, v3, 0xFFFFFFFFFFFFFFFFLL, 0xB2D05E00uLL);
}

- (id)baseInteractionDictionaryForInterface:(unsigned __int16)a3 actionType:(unsigned __int16)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("interactionKey");
  -[SGRTCLogging interactionKeyForInterface:actionType:](self, "interactionKeyForInterface:actionType:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_interactionAttributesForTags:(id)a3 parentEntity:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  const __CFString *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  __CFString *v36;
  __CFString *v37;
  __CFString *v38;
  uint64_t i;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v57;
  unsigned int v58;
  unsigned int v59;
  const __CFString *v60;
  id v61;
  uint64_t v62;
  SGRTCLogging *v63;
  id obj;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[8];
  _QWORD v71[8];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v61 = a4;
  objc_msgSend(v61, "duplicateKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = self;
  -[SGRTCLogging descriptionForEntityType:](self, "descriptionForEntityType:", objc_msgSend(v7, "entityType"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D197F0], "extractedFlight");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "containsObject:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = CFSTR("flight");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D197F0], "extractedBus");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "containsObject:", v11);

    if ((v12 & 1) != 0)
    {
      v10 = CFSTR("bus");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D197F0], "extractedTrain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v6, "containsObject:", v13);

      if ((v14 & 1) != 0)
      {
        v10 = CFSTR("train");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D197F0], "extractedBoat");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v6, "containsObject:", v15);

        if ((v16 & 1) != 0)
        {
          v10 = CFSTR("boat");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D197F0], "extractedHotel");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v6, "containsObject:", v17);

          if ((v18 & 1) != 0)
          {
            v10 = CFSTR("hotel");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "extractedCarRental");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v6, "containsObject:", v19);

            if ((v20 & 1) != 0)
            {
              v10 = CFSTR("carRental");
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0D197F0], "extractedTicket");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v6, "containsObject:", v21);

              if ((v22 & 1) != 0)
              {
                v10 = CFSTR("ticket");
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0D197F0], "extractedMovie");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v6, "containsObject:", v23);

                if ((v24 & 1) != 0)
                {
                  v10 = CFSTR("movie");
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0D197F0], "extractedFood");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v6, "containsObject:", v25);

                  if ((v26 & 1) != 0)
                  {
                    v10 = CFSTR("food");
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0D197F0], "extractedSocial");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    v28 = objc_msgSend(v6, "containsObject:", v27);

                    v10 = CFSTR("unknown");
                    if (v28)
                      v10 = CFSTR("social");
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v60 = v10;
  objc_msgSend(MEMORY[0x1E0D197F0], "allDay");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v6, "containsObject:", v29);

  objc_msgSend(MEMORY[0x1E0D197F0], "extractedEventCancellation");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v6, "containsObject:", v30);

  objc_msgSend(MEMORY[0x1E0D197F0], "fromSync");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v57) = objc_msgSend(v6, "containsObject:", v31);

  LODWORD(v57) = objc_msgSend(MEMORY[0x1E0D198F0], "allowGeocode");
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v6;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
  if (v32)
  {
    v33 = v32;
    v34 = 0;
    v35 = *(_QWORD *)v67;
    v62 = *MEMORY[0x1E0D19D70];
    v36 = CFSTR("unknown");
    v37 = CFSTR("unknown");
    v38 = CFSTR("unknown");
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v67 != v35)
          objc_enumerationMutation(obj);
        v40 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        if (objc_msgSend(v40, "isTemplateName", v57))
        {
          objc_msgSend(v40, "value");
          v41 = objc_claimAutoreleasedReturnValue();

          v36 = (__CFString *)v41;
        }
        if (objc_msgSend(v40, "isDomain"))
        {
          objc_msgSend(v40, "value");
          v42 = objc_claimAutoreleasedReturnValue();

          v37 = (__CFString *)v42;
        }
        if (objc_msgSend(v40, "isEventMetadata"))
        {
          objc_msgSend(v40, "eventMetadata");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v43;
          if (v43)
          {
            objc_msgSend(v43, "objectForKeyedSubscript:", v62);
            v45 = objc_claimAutoreleasedReturnValue();

            -[SGRTCLogging _descriptionForBundleId:](v63, "_descriptionForBundleId:", v45);
            v46 = objc_claimAutoreleasedReturnValue();

            v65 = (void *)v46;
            v38 = (__CFString *)v45;
          }

        }
        objc_msgSend(MEMORY[0x1E0D197F0], "fromInteraction");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v40, "isEqualToEntityTag:", v47);

        v34 |= v48;
      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
    }
    while (v33);
  }
  else
  {
    v34 = 0;
    v36 = CFSTR("unknown");
    v37 = CFSTR("unknown");
    v38 = CFSTR("unknown");
  }

  v70[0] = CFSTR("eventCategory");
  v70[1] = CFSTR("documentType");
  v71[0] = v60;
  v71[1] = v65;
  v70[2] = CFSTR("templateName");
  v70[3] = CFSTR("domain");
  v71[2] = v36;
  v71[3] = v37;
  v70[4] = CFSTR("isAllDay");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v59);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v71[4] = v49;
  v70[5] = CFSTR("isCancelled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v58);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v71[5] = v50;
  v70[6] = CFSTR("isFromSync");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", HIDWORD(v57));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v71[6] = v51;
  v70[7] = CFSTR("isSplashScreenAcknowledged");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v57);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v71[7] = v52;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 8);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v53, "mutableCopy");

  if ((v34 & 1) != 0)
  {
    -[SGRTCLogging descriptionForEntityType:](v63, "descriptionForEntityType:", 16);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setObject:forKeyedSubscript:", v55, CFSTR("documentType"));

    if (v38)
    {
      if ((-[__CFString isEqualToString:](v38, "isEqualToString:", CFSTR("unknown")) & 1) == 0)
        objc_msgSend(v54, "setObject:forKeyedSubscript:", v38, CFSTR("bundleID"));
    }
  }

  return v54;
}

- (id)_interactionAttributesForRealtimeEvent:(id)a3 parentEntity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "event");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  sgMap();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v10);
  -[SGRTCLogging _interactionAttributesForTags:parentEntity:](self, "_interactionAttributesForTags:parentEntity:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[SGRTCLogging locationTypeForRealtimeEvent:](SGRTCLogging, "locationTypeForRealtimeEvent:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("locationType"));
  return v12;
}

- (id)_interactionAttributesForEntity:(id)a3 parentEntity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "tags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGRTCLogging _interactionAttributesForTags:parentEntity:](self, "_interactionAttributesForTags:parentEntity:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[SGRTCLogging locationTypeForEntity:](SGRTCLogging, "locationTypeForEntity:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("locationType"));
  return v9;
}

- (id)createInteractionSummaryForEventKey:(id)a3 expirationDate:(id)a4 interactionKey:(id)a5 interactionAttributes:(id)a6 rtcCategory:(unsigned __int16)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v13)
  {
    objc_msgSend((id)objc_opt_class(), "dateByAppendingDaysToCurrentDate:", 7.0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)objc_opt_new();
  v17 = +[SGRTCLogging numberOfDaysBetweenDate:andDate:](SGRTCLogging, "numberOfDaysBetweenDate:andDate:", v16, v13);

  if (v17 >= 366)
  {
    v18 = (void *)objc_opt_new();
    objc_msgSend(v18, "setYear:", 1);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_opt_new();
    objc_msgSend(v19, "dateByAddingComponents:toDate:options:", v18, v20, 0);
    v21 = objc_claimAutoreleasedReturnValue();

    v13 = (id)v21;
  }
  v22 = (void *)objc_msgSend(v15, "mutableCopy");
  -[SGRTCLogging descriptionForSGRTCCategory:](self, "descriptionForSGRTCCategory:", v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("categoryLog"));

  objc_msgSend(v22, "setObject:forKeyedSubscript:", v13, CFSTR("expirationDate"));
  v24 = (void *)objc_opt_new();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("creationDate"));

  objc_msgSend(v22, "setObject:forKeyedSubscript:", v12, CFSTR("eventKey"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", &unk_1E7E0C098, v14);

  return v22;
}

- (void)enrichReminderInteractionSummaryLog:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("creationDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "dateByAddingTimeInterval:", -1209600.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_class();
    v14[0] = *MEMORY[0x1E0D19A38];
    v9 = v14[0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "launchCountsForApps:afterDate:lowerBucket:bucketSize:bucketLimit:", v10, v7, 1, 10, 50);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("launchCountMessages"));

    -[SGRTCLogging bucketizedRemindersCreatedAfterDate:endDate:](self, "bucketizedRemindersCreatedAfterDate:endDate:", v7, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("remindersCountStats"));

  }
}

- (void)enrichAggregateSummaryLog:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _QWORD v34[5];
  _QWORD v35[7];

  v35[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("creationDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *MEMORY[0x1E0D19A38];
    v34[0] = *MEMORY[0x1E0D19A58];
    v34[1] = v6;
    v35[0] = CFSTR("launchCountReminders");
    v35[1] = CFSTR("launchCountMessages");
    v7 = *MEMORY[0x1E0D19A28];
    v34[2] = *MEMORY[0x1E0D19A08];
    v34[3] = v7;
    v35[2] = CFSTR("launchCountCalendar");
    v35[3] = CFSTR("launchCountMail");
    v34[4] = *MEMORY[0x1E0D19A30];
    v35[4] = CFSTR("launchCountMaps");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_class();
    objc_msgSend(v8, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "aggregateSummaryBucketizedLaunchCountsForApps:afterDate:", v10, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", v17, (_QWORD)v29);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, v19);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v14);
    }

    v20 = (void *)MEMORY[0x1E0CB37E8];
    v21 = (void *)objc_opt_class();
    v22 = (void *)objc_opt_new();
    objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "bucketizeIntegerForAggregateSummary:", +[SGRemindersAdapter remindersCreatedBetweenStartDate:endDate:](SGRemindersAdapter, "remindersCreatedBetweenStartDate:endDate:", v5, v22)));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("remindersCountStats"));

    objc_msgSend(MEMORY[0x1E0D19EC0], "defaultLanguage");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    if (v24)
      v26 = (const __CFString *)v24;
    else
      v26 = CFSTR("unknown");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("deviceLanguage"), (_QWORD)v29);

    v27 = (void *)objc_opt_new();
    -[SGRTCLogging cappedDeliveryEntityCountsCreatedBetweenStartDate:endDate:](self, "cappedDeliveryEntityCountsCreatedBetweenStartDate:endDate:", v5, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addEntriesFromDictionary:", v28);
  }

}

- (id)cappedDeliveryEntityCountsCreatedBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGRTCLogging cappedDeliveryEntityCountsCreatedBetweenStartDate:endDate:store:](self, "cappedDeliveryEntityCountsCreatedBetweenStartDate:endDate:store:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)cappedDeliveryEntityCountsCreatedBetweenStartDate:(id)a3 endDate:(id)a4 store:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  v29 = v9;
  v30 = v7;
  objc_msgSend(v9, "entityKeyCountsForEntityType:startDate:endDate:", 24, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "second");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "unsignedIntegerValue");

        if (v17 >= 0xA)
          v18 = 10;
        else
          v18 = v17;
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SGDelivery_ctNumSame_%lu"), v18);
        objc_msgSend(v10, "addObject:", v19);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v13);
  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v21 = v10;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "countForObject:", v26));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v27, v26);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v23);
  }

  return v20;
}

- (id)bucketizedRemindersCreatedAfterDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;

  v5 = a4;
  v6 = a3;
  v7 = +[SGRemindersAdapter remindersCreatedBetweenStartDate:endDate:](SGRemindersAdapter, "remindersCreatedBetweenStartDate:endDate:", v6, v5);
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v9 = v8;

  if (v7)
  {
    v10 = ceil((double)v7 / (v9 / 604800.0));
    if (v10 > 0.0 && v10 < 1.84467441e19)
    {
      v7 = (unint64_t)v10;
      if ((unint64_t)v10 >= 0xB)
        v7 = objc_msgSend((id)objc_opt_class(), "bucketizeInteger:withBucketSize:limit:", v7, 10, 50);
    }
    else
    {
      v7 = 0;
    }
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
}

- (void)enrichInteractionSummaryLog:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("creationDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = *MEMORY[0x1E0D19A30];
    v15[0] = *MEMORY[0x1E0D19A38];
    v5 = v15[0];
    v15[1] = v6;
    v8 = *MEMORY[0x1E0D19A28];
    v16 = *MEMORY[0x1E0D19A08];
    v7 = v16;
    v17 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "launchCountsForApps:afterDate:lowerBucket:bucketSize:bucketLimit:", v9, v4, 10, 3, 50);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("launchCountMaps"));

    objc_msgSend(v10, "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("launchCountCalendar"));

    objc_msgSend(v10, "objectForKeyedSubscript:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("launchCountMessages"));

    objc_msgSend(v10, "objectForKeyedSubscript:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("launchCountMail"));

  }
}

- (id)_mapsUsageLast2Weeks
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  NSObject *v9;
  void *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = *MEMORY[0x1E0D19A30];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", -1209600.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "launchCountForBundleId:afterDate:limit:", v3, v5, 5);

  v7 = CFSTR("low");
  if (v6 > 4)
    v7 = CFSTR("high");
  if (v6 - 1 >= 4)
    v8 = v7;
  else
    v8 = CFSTR("medium");
  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v11;
    _os_log_debug_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEBUG, "RTCLogging: usageMaps: %@, (%@ Maps launch in past 2 weeks)", (uint8_t *)&v12, 0x16u);

  }
  return (id)v8;
}

- (id)_calendarUsageLast2Weeks
{
  double v2;
  double v3;
  double v4;
  NSObject *v5;
  void *v6;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__SGRTCLogging__calendarUsageLast2Weeks__block_invoke;
  v10[3] = &unk_1E7DABC38;
  v10[4] = &v11;
  objc_msgSend(MEMORY[0x1E0CAA078], "sg_usingSharedStoreForReadingOnly:", v10);
  v2 = v12[3];
  if (v2 >= 1.0)
  {
    v4 = 50.0;
    if (v2 < 50.0)
      v4 = round(v2 + v2) * 0.5;
  }
  else
  {
    +[SGRTCLogging round:toSignificantFigures:](SGRTCLogging, "round:toSignificantFigures:", 1);
    v4 = v3;
  }
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12[3]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "RTCLogging: usageCalendar: %@, (%@ Calendar events found)", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v11, 8);
  return v6;
}

- (BOOL)incrementAndUpgradeInteractionSummaryForEventKey:(id)a3 interactionKey:(id)a4 parentEntity:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _PASLock *lock;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  BOOL v17;
  uint8_t v19[8];
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  SGRTCLogging *v24;
  _BYTE *v25;
  _BYTE buf[24];
  char v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  sgLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    _os_log_debug_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEBUG, "RTCLogging: log and increment interaction key: %@, for eventKey: %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v27 = 0;
  lock = self->_lock;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __93__SGRTCLogging_incrementAndUpgradeInteractionSummaryForEventKey_interactionKey_parentEntity___block_invoke;
  v20[3] = &unk_1E7DABC60;
  v13 = v8;
  v21 = v13;
  v14 = v9;
  v22 = v14;
  v15 = v10;
  v23 = v15;
  v24 = self;
  v25 = buf;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v20);
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    -[SGRTCLogging updateAndScheduleDiskWrite](self, "updateAndScheduleDiskWrite");
  }
  else
  {
    sgLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v19 = 0;
      _os_log_debug_impl(&dword_1C3607000, v16, OS_LOG_TYPE_DEBUG, "RTCLogging: can't find eventKey in loggedInteractionsSummary dictionary", v19, 2u);
    }

  }
  v17 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v17;
}

- (void)_updateLocationTypeFromInteractionsSummaryForEventKey:(id)a3 locationType:(id)a4
{
  id v6;
  id v7;
  _PASLock *lock;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__SGRTCLogging__updateLocationTypeFromInteractionsSummaryForEventKey_locationType___block_invoke;
  v11[3] = &unk_1E7DABC88;
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  v14 = &v15;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v11);
  if (*((_BYTE *)v16 + 24))
    -[SGRTCLogging updateAndScheduleDiskWrite](self, "updateAndScheduleDiskWrite");

  _Block_object_dispose(&v15, 8);
}

- (void)logAndIncrementEventCountForDictionary:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SGRTCLogging_logAndIncrementEventCountForDictionary___block_invoke;
  v7[3] = &unk_1E7DABBD0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  -[SGRTCLogging updateAndScheduleDiskWrite](self, "updateAndScheduleDiskWrite");

}

- (void)logNewInteractionSummaryWithDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  _PASLock *lock;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "RTCLogging: log new interaction summary: %@", buf, 0xCu);
  }

  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__SGRTCLogging_logNewInteractionSummaryWithDictionary___block_invoke;
  v8[3] = &unk_1E7DABBD0;
  v9 = v4;
  v7 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  -[SGRTCLogging updateAndScheduleDiskWrite](self, "updateAndScheduleDiskWrite");

}

- (void)logNewInteractionWithDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  _PASLock *lock;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "RTCLogging: log new interaction: %@", buf, 0xCu);
  }

  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__SGRTCLogging_logNewInteractionWithDictionary___block_invoke;
  v8[3] = &unk_1E7DABBD0;
  v9 = v4;
  v7 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  -[SGRTCLogging updateAndScheduleDiskWrite](self, "updateAndScheduleDiskWrite");

}

- (id)_eventExtractionDictionaryLogForTemplateName:(id)a3 extractionStatus:(unsigned __int16)a4 outputExceptions:(id)a5 outputInfos:(id)a6 jsMessageLogs:(id)a7 jsOutputLogs:(id)a8 timingProcessing:(unint64_t)a9
{
  uint64_t v12;
  id v15;
  id v16;
  id v17;
  id v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  __CFString *v27;
  const __CFString *v28;
  __CFString *v29;
  const __CFString *v30;
  void *v31;
  uint64_t v33;
  void *v34;
  _QWORD v35[6];
  _QWORD v36[7];

  v12 = a4;
  v36[6] = *MEMORY[0x1E0C80C00];
  v15 = a7;
  v16 = a8;
  v17 = a6;
  v18 = a5;
  v19 = (__CFString *)a3;
  v20 = (void *)objc_opt_new();
  v21 = v20;
  if (v15)
    objc_msgSend(v20, "addEntriesFromDictionary:", v15);
  v34 = v15;
  if (v16)
    objc_msgSend(v21, "addEntriesFromDictionary:", v16);
  v35[0] = CFSTR("categoryLog");
  -[SGRTCLogging descriptionForSGRTCCategory:](self, "descriptionForSGRTCCategory:", 5, a9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v22;
  v35[1] = CFSTR("extractionStatus");
  -[SGRTCLogging _descriptionForExtractionStatus:](self, "_descriptionForExtractionStatus:", v12);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v19)
    v25 = v19;
  else
    v25 = &stru_1E7DB83A8;
  v36[1] = v23;
  v36[2] = v25;
  v35[2] = CFSTR("templateName");
  v35[3] = CFSTR("timingProcessing");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v33);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v26;
  v35[4] = CFSTR("outputExceptions");
  objc_msgSend(v18, "_pas_componentsJoinedByString:", CFSTR(","));
  v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v27)
    v28 = v27;
  else
    v28 = &stru_1E7DB83A8;
  v36[4] = v28;
  v35[5] = CFSTR("outputInfos");
  objc_msgSend(v17, "_pas_componentsJoinedByString:", CFSTR(","));
  v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v29)
    v30 = v29;
  else
    v30 = &stru_1E7DB83A8;
  v36[5] = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 6);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "addEntriesFromDictionary:", v31);
  return v21;
}

- (void)logEventExtractionForTemplateName:(id)a3 extractionStatus:(unsigned __int16)a4 outputExceptions:(id)a5 outputInfos:(id)a6 jsMessageLogs:(id)a7 jsOutputLogs:(id)a8 timingProcessing:(unint64_t)a9
{
  uint64_t v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v13 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  sgLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    -[SGRTCLogging _descriptionForExtractionStatus:](self, "_descriptionForExtractionStatus:", v13);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v26 = v24;
    v27 = 2112;
    v28 = v15;
    v29 = 2048;
    v30 = a9;
    _os_log_debug_impl(&dword_1C3607000, v20, OS_LOG_TYPE_DEBUG, "RTCLogging: log extraction (%@) to RTC for templateName: %@ timingProcessing: %llu", buf, 0x20u);

  }
  -[SGRTCLogging _eventExtractionDictionaryLogForTemplateName:extractionStatus:outputExceptions:outputInfos:jsMessageLogs:jsOutputLogs:timingProcessing:](self, "_eventExtractionDictionaryLogForTemplateName:extractionStatus:outputExceptions:outputInfos:jsMessageLogs:jsOutputLogs:timingProcessing:", v15, v13, v19, v18, v17, v16, a9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_msgSend(v21, "mutableCopy");
  -[SGRTCLogging trialIdsForStructuredEvent](self, "trialIdsForStructuredEvent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addEntriesFromDictionary:", v23);

  -[SGRTCLogging logAndIncrementEventCountForDictionary:](self, "logAndIncrementEventCountForDictionary:", v22);
}

- (void)logMLMessageEventExtractionForTemplateName:(id)a3 extractionStatus:(unsigned __int16)a4 outputInfo:(id)a5 outputExceptions:(id)a6 timingProcessing:(unint64_t)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  unint64_t v33;
  uint64_t v34;

  v10 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  sgLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    -[SGRTCLogging _descriptionForMessageEventDissectorExtractionStatus:](self, "_descriptionForMessageEventDissectorExtractionStatus:", v10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v29 = v25;
    v30 = 2112;
    v31 = v12;
    v32 = 2048;
    v33 = a7;
    _os_log_debug_impl(&dword_1C3607000, v15, OS_LOG_TYPE_DEBUG, "RTCLogging: log extraction from Message Event Dissector (%@) to RTC for templateName: %@ timingProcessing: %llu", buf, 0x20u);

  }
  v16 = (void *)objc_opt_new();
  v17 = v16;
  if (v13)
    objc_msgSend(v16, "addEntriesFromDictionary:", v13);
  -[SGRTCLogging descriptionForSGRTCCategory:](self, "descriptionForSGRTCCategory:", 5, CFSTR("categoryLog"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v18;
  v26[1] = CFSTR("extractionStatus");
  -[SGRTCLogging _descriptionForMessageEventDissectorExtractionStatus:](self, "_descriptionForMessageEventDissectorExtractionStatus:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v19;
  v27[2] = v12;
  v26[2] = CFSTR("templateName");
  v26[3] = CFSTR("outputExceptions");
  objc_msgSend(v14, "_pas_componentsJoinedByString:", CFSTR(","));
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v21 = &stru_1E7DB83A8;
  if (v20)
    v21 = v20;
  v27[3] = v21;
  v26[4] = CFSTR("timingProcessing");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addEntriesFromDictionary:", v23);

  -[SGRTCLogging assetVersionsForMLMessageEvent](self, "assetVersionsForMLMessageEvent");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addEntriesFromDictionary:", v24);

  -[SGRTCLogging logAndIncrementEventCountForDictionary:](self, "logAndIncrementEventCountForDictionary:", v17);
}

- (void)logEventInteractionForEntity:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  id v8;
  NSObject *interactionsWriteQueue;
  id v10;
  _QWORD block[5];
  id v12;
  unsigned __int16 v13;
  unsigned __int16 v14;

  v8 = a3;
  interactionsWriteQueue = self->_interactionsWriteQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__SGRTCLogging_logEventInteractionForEntity_interface_actionType___block_invoke;
  block[3] = &unk_1E7DABCB0;
  block[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_async(interactionsWriteQueue, block);

}

- (void)logMLMessageEventInteractionForEntity:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  id v8;
  NSObject *interactionsWriteQueue;
  id v10;
  _QWORD block[5];
  id v12;
  unsigned __int16 v13;
  unsigned __int16 v14;

  v8 = a3;
  interactionsWriteQueue = self->_interactionsWriteQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__SGRTCLogging_logMLMessageEventInteractionForEntity_interface_actionType___block_invoke;
  block[3] = &unk_1E7DABCB0;
  block[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_async(interactionsWriteQueue, block);

}

- (id)interactionKeyForInterface:(unsigned __int16)a3 actionType:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v5 = a3;
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SGRTCLogging _descriptionForInterface:](self, "_descriptionForInterface:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGRTCLogging _descriptionForActionType:](self, "_descriptionForActionType:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@_%@"), v8, v9);

  return v10;
}

- (id)interactionKeyForCategory:(unsigned __int16)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SGRTCLogging descriptionForSGRTCCategory:](self, "descriptionForSGRTCCategory:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGRTCLogging interactionKeyForInterface:actionType:](self, "interactionKeyForInterface:actionType:", v6, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@_%@"), v10, v11);

  return v12;
}

- (void)logEventInteractionForEntitySync:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v5 = a5;
  v6 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (v8
    && (objc_msgSend(v8, "duplicateKey"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "duplicateKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "parentKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject loadEntityByKey:](v11, "loadEntityByKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[SGRTCLogging _interactionAttributesForEntity:parentEntity:](self, "_interactionAttributesForEntity:parentEntity:", v9, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGRTCLogging interactionKeyForInterface:actionType:](self, "interactionKeyForInterface:actionType:", v6, v5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "duplicateKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "entityKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "serialize");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    sgLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v31 = v29;
        v32 = 2112;
        v33 = v18;
        _os_log_debug_impl(&dword_1C3607000, v20, OS_LOG_TYPE_DEBUG, "RTCLogging: logging interaction to RTC for interactionKey: %@, eventKey: %@", buf, 0x16u);
      }

      v21 = -[SGRTCLogging incrementAndUpgradeInteractionSummaryForEventKey:interactionKey:parentEntity:](self, "incrementAndUpgradeInteractionSummaryForEventKey:interactionKey:parentEntity:", v18, v29, v14);
      +[SGRTCLogging locationTypeForEntity:](SGRTCLogging, "locationTypeForEntity:", v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGRTCLogging _updateLocationTypeFromInteractionsSummaryForEventKey:locationType:](self, "_updateLocationTypeFromInteractionsSummaryForEventKey:locationType:", v18, v22);

      if (!v21)
      {
        -[SGRTCLogging trialIdsForStructuredEvent](self, "trialIdsForStructuredEvent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addEntriesFromDictionary:", v23);

        objc_msgSend(v9, "timeRange");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "endDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGRTCLogging createInteractionSummaryForEventKey:expirationDate:interactionKey:interactionAttributes:rtcCategory:](self, "createInteractionSummaryForEventKey:expirationDate:interactionKey:interactionAttributes:rtcCategory:", v18, v25, v29, v15, 7);
        v28 = v14;
        v26 = v15;
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        -[SGRTCLogging logNewInteractionSummaryWithDictionary:](self, "logNewInteractionSummaryWithDictionary:", v27);
        v15 = v26;
        v14 = v28;
      }
      -[SGRTCLogging interactionKeyForCategory:interface:actionType:](self, "interactionKeyForCategory:interface:actionType:", 6, v6, v5, v28);
      v20 = objc_claimAutoreleasedReturnValue();
      -[SGRTCLogging logAggregateSummaryForInteraction:](self, "logAggregateSummaryForInteraction:", v20);
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v20, OS_LOG_TYPE_ERROR, "RTCLogging: entity.duplicateKey.entityKey serialization failed", buf, 2u);
    }

  }
  else
  {
    sgLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v11, OS_LOG_TYPE_ERROR, "RTCLogging: entity can't be found", buf, 2u);
    }
  }

}

- (void)logMLMessageEventExtractionForEntitySync:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v5 = a5;
  v6 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (v8
    && (objc_msgSend(v8, "duplicateKey"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "duplicateKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "parentKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject loadEntityByKey:](v11, "loadEntityByKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[SGRTCLogging _interactionAttributesForEntity:parentEntity:](self, "_interactionAttributesForEntity:parentEntity:", v9, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGRTCLogging interactionKeyForInterface:actionType:](self, "interactionKeyForInterface:actionType:", v6, v5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "duplicateKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "entityKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "serialize");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    sgLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v31 = v29;
        v32 = 2112;
        v33 = v18;
        _os_log_debug_impl(&dword_1C3607000, v20, OS_LOG_TYPE_DEBUG, "RTCLogging: logging interaction to RTC for interactionKey: %@, eventKey: %@", buf, 0x16u);
      }

      v21 = -[SGRTCLogging incrementAndUpgradeInteractionSummaryForEventKey:interactionKey:parentEntity:](self, "incrementAndUpgradeInteractionSummaryForEventKey:interactionKey:parentEntity:", v18, v29, v14);
      +[SGRTCLogging locationTypeForEntity:](SGRTCLogging, "locationTypeForEntity:", v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGRTCLogging _updateLocationTypeFromInteractionsSummaryForEventKey:locationType:](self, "_updateLocationTypeFromInteractionsSummaryForEventKey:locationType:", v18, v22);

      if (!v21)
      {
        -[SGRTCLogging assetVersionsForMLMessageEvent](self, "assetVersionsForMLMessageEvent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addEntriesFromDictionary:", v23);

        objc_msgSend(v9, "timeRange");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "endDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGRTCLogging createInteractionSummaryForEventKey:expirationDate:interactionKey:interactionAttributes:rtcCategory:](self, "createInteractionSummaryForEventKey:expirationDate:interactionKey:interactionAttributes:rtcCategory:", v18, v25, v29, v15, 7);
        v28 = v14;
        v26 = v15;
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        -[SGRTCLogging logNewInteractionSummaryWithDictionary:](self, "logNewInteractionSummaryWithDictionary:", v27);
        v15 = v26;
        v14 = v28;
      }
      -[SGRTCLogging interactionKeyForCategory:interface:actionType:](self, "interactionKeyForCategory:interface:actionType:", 6, v6, v5, v28);
      v20 = objc_claimAutoreleasedReturnValue();
      -[SGRTCLogging logAggregateSummaryForInteraction:](self, "logAggregateSummaryForInteraction:", v20);
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v20, OS_LOG_TYPE_ERROR, "RTCLogging: entity.duplicateKey.entityKey serialization failed", buf, 2u);
    }

  }
  else
  {
    sgLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v11, OS_LOG_TYPE_ERROR, "RTCLogging: entity can't be found", buf, 2u);
    }
  }

}

- (void)logEventInteractionForRealtimeEventSync:(id)a3 parentEntity:(id)a4 interface:(unsigned __int16)a5 actionType:(unsigned __int16)a6
{
  uint64_t v6;
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v6 = a6;
  v7 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[SGRTCLogging _interactionAttributesForRealtimeEvent:parentEntity:](self, "_interactionAttributesForRealtimeEvent:parentEntity:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SGRTCLogging _descriptionForInterface:](self, "_descriptionForInterface:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGRTCLogging _descriptionForActionType:](self, "_descriptionForActionType:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@_%@"), v14, v15);

  objc_msgSend(v10, "event");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "opaqueKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  sgLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v26 = v16;
    v27 = 2112;
    v28 = v18;
    _os_log_debug_impl(&dword_1C3607000, v19, OS_LOG_TYPE_DEBUG, "RTCLogging: logging interaction to RTC for interactionKey: %@, eventKey: %@", buf, 0x16u);
  }

  v20 = -[SGRTCLogging incrementAndUpgradeInteractionSummaryForEventKey:interactionKey:parentEntity:](self, "incrementAndUpgradeInteractionSummaryForEventKey:interactionKey:parentEntity:", v18, v16, v11);
  +[SGRTCLogging locationTypeForRealtimeEvent:](SGRTCLogging, "locationTypeForRealtimeEvent:", v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGRTCLogging _updateLocationTypeFromInteractionsSummaryForEventKey:locationType:](self, "_updateLocationTypeFromInteractionsSummaryForEventKey:locationType:", v18, v21);

  if (!v20)
  {
    objc_msgSend(v10, "event");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "end");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGRTCLogging createInteractionSummaryForEventKey:expirationDate:interactionKey:interactionAttributes:rtcCategory:](self, "createInteractionSummaryForEventKey:expirationDate:interactionKey:interactionAttributes:rtcCategory:", v18, v23, v16, v12, 7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[SGRTCLogging logNewInteractionSummaryWithDictionary:](self, "logNewInteractionSummaryWithDictionary:", v24);
  }

}

- (void)logEventInteractionForRealtimeEvent:(id)a3 parentEntity:(id)a4 interface:(unsigned __int16)a5 actionType:(unsigned __int16)a6
{
  id v10;
  id v11;
  NSObject *interactionsWriteQueue;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  unsigned __int16 v18;
  unsigned __int16 v19;

  v10 = a3;
  v11 = a4;
  interactionsWriteQueue = self->_interactionsWriteQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__SGRTCLogging_logEventInteractionForRealtimeEvent_parentEntity_interface_actionType___block_invoke;
  v15[3] = &unk_1E7DB6938;
  v15[4] = self;
  v16 = v10;
  v17 = v11;
  v18 = a5;
  v19 = a6;
  v13 = v11;
  v14 = v10;
  dispatch_async(interactionsWriteQueue, v15);

}

- (void)logAggregateSummaryForInteraction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[SGRTCLogging incrementAndUpgradeInteractionSummaryForEventKey:interactionKey:parentEntity:](self, "incrementAndUpgradeInteractionSummaryForEventKey:interactionKey:parentEntity:", CFSTR("aggregateSummary")))
  {
    objc_msgSend((id)objc_opt_class(), "dateByAppendingDaysToCurrentDate:", 28.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    -[SGRTCLogging createInteractionSummaryForEventKey:expirationDate:interactionKey:interactionAttributes:rtcCategory:](self, "createInteractionSummaryForEventKey:expirationDate:interactionKey:interactionAttributes:rtcCategory:", CFSTR("aggregateSummary"), v4, v7, v5, 11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[SGRTCLogging logNewInteractionSummaryWithDictionary:](self, "logNewInteractionSummaryWithDictionary:", v6);
  }

}

- (id)allowlistedLogFromLog:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("eventKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("eventDuplicateKey"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("expirationDate"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("creationDate"));
  v5 = objc_msgSend(v4, "count");
  if (v5 == objc_msgSend(v3, "count"))
    v6 = v3;
  else
    v6 = v4;
  v7 = v6;

  return v7;
}

- (id)logsToSend
{
  return -[SGRTCLogging logsToSendWithInteractionSummaryRange:](self, "logsToSendWithInteractionSummaryRange:", 0);
}

- (id)logsToSendWithInteractionSummaryRange:(_NSRange *)a3
{
  _PASLock *lock;
  id v5;
  _QWORD v7[7];
  uint64_t v8;
  _NSRange *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__11369;
  v18 = __Block_byref_object_dispose__11370;
  v19 = 0;
  v8 = 0;
  v9 = (_NSRange *)&v8;
  v10 = 0x3010000000;
  v12 = 0;
  v13 = 0;
  v11 = "";
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__SGRTCLogging_logsToSendWithInteractionSummaryRange___block_invoke;
  v7[3] = &unk_1E7DABCD8;
  v7[4] = self;
  v7[5] = &v14;
  v7[6] = &v8;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  if (a3)
    *a3 = v9[2];
  v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);

  return v5;
}

- (id)_createRTCReporting
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CFAbsoluteTimeGetCurrent());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGAsset asset](SGAsset, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assetVersion");

  v5 = *MEMORY[0x1E0D83880];
  v21[0] = &unk_1E7E0C0B0;
  v6 = *MEMORY[0x1E0D83888];
  v20[0] = v5;
  v20[1] = v6;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    v7 = 0;
  else
    v7 = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D838A8];
  v21[1] = v8;
  v21[2] = v2;
  v10 = *MEMORY[0x1E0D83870];
  v20[2] = v9;
  v20[3] = v10;
  v21[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *MEMORY[0x1E0D838B8];
  v18[0] = *MEMORY[0x1E0D838B0];
  v18[1] = v12;
  v13 = *MEMORY[0x1E0D19D88];
  v19[0] = CFSTR("Suggestions");
  v19[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0D83848]);
  v16 = (void *)objc_msgSend(v15, "initWithSessionInfo:userInfo:frameworksToCheck:", v11, v14, MEMORY[0x1E0C9AA60]);

  return v16;
}

- (void)sendRTCLogsWithCompletion:(id)a3
{
  -[SGRTCLogging sendRTCLogsWithShouldContinueBlock:completion:](self, "sendRTCLogsWithShouldContinueBlock:completion:", &__block_literal_global_196_11423, a3);
}

- (void)sendRTCLogsWithShouldContinueBlock:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSObject *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  SGRTCLogging *v18;
  id v19;
  void (**v20)(id, uint64_t, _QWORD);
  id v21;
  _BYTE *v22;
  _QWORD *v23;
  __int128 v24;
  _QWORD v25[3];
  char v26;
  __int128 v27;
  _BYTE buf[24];
  char v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_INFO, "RTCLogging: Sending privacy-aware suggestions log over the network", buf, 2u);
  }

  -[SGRTCLogging logAggregateSummaryForInteraction:](self, "logAggregateSummaryForInteraction:", CFSTR("rtcLogsSent"));
  v27 = 0uLL;
  -[SGRTCLogging logsToSendWithInteractionSummaryRange:](self, "logsToSendWithInteractionSummaryRange:", &v27);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count") == 0;
  sgLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_INFO, "RTCLogging: No RTC logs to send this time. Skipping.", buf, 2u);
    }

    v7[2](v7, 1, 0);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v15 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      _os_log_debug_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEBUG, "RTCLogging: Selected logs (%lu): %@", buf, 0x16u);
    }

    -[SGRTCLogging _createRTCReporting](self, "_createRTCReporting");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v29 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v26 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62__SGRTCLogging_sendRTCLogsWithShouldContinueBlock_completion___block_invoke;
    v16[3] = &unk_1E7DABD48;
    v20 = v7;
    v17 = v9;
    v21 = v6;
    v18 = self;
    v14 = v13;
    v19 = v14;
    v22 = buf;
    v23 = v25;
    v24 = v27;
    objc_msgSend(v14, "startConfigurationWithCompletionHandler:", v16);

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(buf, 8);

  }
}

- (BOOL)resetLogs
{
  return -[SGRTCLogging resetExtractionLogs](self, "resetExtractionLogs")
      && -[SGRTCLogging resetInteractionsLogs](self, "resetInteractionsLogs")
      && -[SGRTCLogging resetInteractionsSummaryLogs](self, "resetInteractionsSummaryLogs");
}

- (BOOL)resetExtractionLogs
{
  _PASLock *lock;
  BOOL v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__SGRTCLogging_resetExtractionLogs__block_invoke;
  v6[3] = &unk_1E7DABAD8;
  v6[4] = self;
  v6[5] = &v7;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  if (*((_BYTE *)v8 + 24))
    v4 = -[SGRTCLogging storeToDisk](self, "storeToDisk");
  else
    v4 = 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)resetInteractionsSummaryLogs
{
  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_210);
  return -[SGRTCLogging storeToDisk](self, "storeToDisk");
}

- (BOOL)resetInteractionsLogs
{
  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_211);
  return -[SGRTCLogging storeToDisk](self, "storeToDisk");
}

- (BOOL)removeInteractionsSummaryLogsFromLogs:(id)a3
{
  id v4;
  _PASLock *lock;
  BOOL v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    lock = self->_lock;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__SGRTCLogging_removeInteractionsSummaryLogsFromLogs___block_invoke;
    v8[3] = &unk_1E7DABBD0;
    v9 = v4;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
    v6 = -[SGRTCLogging storeToDisk](self, "storeToDisk");

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)storeToDisk
{
  void *v4;
  NSObject *v5;
  _PASLock *lock;
  uint8_t v7;
  _QWORD v9[7];
  uint8_t buf[8];
  uint8_t *v11;
  uint64_t v12;
  char v13;

  v4 = (void *)os_transaction_create();
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_INFO, "Persisting some logs to disk!", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v11 = buf;
  v12 = 0x2020000000;
  v13 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __27__SGRTCLogging_storeToDisk__block_invoke;
  v9[3] = &unk_1E7DABDB0;
  v9[5] = buf;
  v9[6] = a2;
  v9[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
  v7 = v11[24];
  _Block_object_dispose(buf, 8);

  return v7;
}

- (double)storeAge
{
  double v3;
  double v4;
  _PASLock *lock;
  double v6;
  _QWORD v8[5];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3;
  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __24__SGRTCLogging_storeAge__block_invoke;
  v8[3] = &unk_1E7DABB40;
  v8[4] = &v9;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v4 - v6;
}

- (id)loggedExtractionsDescription
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11369;
  v10 = __Block_byref_object_dispose__11370;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__SGRTCLogging_loggedExtractionsDescription__block_invoke;
  v5[3] = &unk_1E7DABB40;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)loggedInteractionsDescription
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11369;
  v10 = __Block_byref_object_dispose__11370;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__SGRTCLogging_loggedInteractionsDescription__block_invoke;
  v5[3] = &unk_1E7DABB40;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)loggedInteractionsSummaryDescription
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11369;
  v10 = __Block_byref_object_dispose__11370;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__SGRTCLogging_loggedInteractionsSummaryDescription__block_invoke;
  v5[3] = &unk_1E7DABB40;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)interactionsWriteQueue
{
  return self->_interactionsWriteQueue;
}

- (id)_descriptionForExtractionStatus:(unsigned __int16)a3
{
  if (a3 > 3u)
    return CFSTR("unknown");
  else
    return off_1E7DABDD0[a3];
}

- (id)_descriptionForMessageEventDissectorExtractionStatus:(unsigned __int16)a3
{
  const __CFString *v3;

  v3 = CFSTR("unknown");
  if (a3 == 1)
    v3 = CFSTR("fail");
  if (a3)
    return (id)v3;
  else
    return CFSTR("event");
}

- (id)_descriptionForInterface:(unsigned __int16)a3
{
  if (a3 > 0x1Au)
    return CFSTR("unknown");
  else
    return off_1E7DABDF0[a3];
}

- (id)_descriptionForActionType:(unsigned __int16)a3
{
  if (a3 > 0xDu)
    return CFSTR("unknown");
  else
    return off_1E7DABEC8[a3];
}

- (id)descriptionForSGRTCCategory:(unsigned __int16)a3
{
  if ((a3 - 5) > 6)
    return CFSTR("unknown");
  else
    return off_1E7DABF38[(unsigned __int16)(a3 - 5)];
}

- (id)descriptionForEntityType:(int64_t)a3
{
  if (a3 > 15)
  {
    if (a3 != 16)
    {
      if (a3 == 18)
        return CFSTR("webpage");
      return CFSTR("unknown");
    }
    return CFSTR("interaction");
  }
  else
  {
    if (a3 != 5)
    {
      if (a3 == 13)
        return CFSTR("sms");
      return CFSTR("unknown");
    }
    return CFSTR("email");
  }
}

- (id)_descriptionForBundleId:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D19A28]) & 1) != 0)
  {
    v4 = CFSTR("email");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D19A38]) & 1) != 0)
  {
    v4 = CFSTR("sms");
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D19A60]))
  {
    v4 = CFSTR("webpage");
  }
  else
  {
    v4 = CFSTR("unknown");
  }

  return (id)v4;
}

- (id)trialIdsForStructuredEvent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_new();
  +[SGStructuredEventTrialClientWrapper sharedInstance](SGStructuredEventTrialClientWrapper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "treatmentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deploymentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("trialTreatmentId"));
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("trialExperimentId"));
  if (v6)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("trialDeploymentId"));

  return v2;
}

- (id)assetVersionsForMLMessageEvent
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = (void *)objc_opt_new();
  if (!+[SGMessageEventDissector mobileAssetsEnabled](SGMessageEventDissector, "mobileAssetsEnabled"))
  {
    +[SGMessageEventDissectorTrialClientWrapper sharedInstance](SGMessageEventDissectorTrialClientWrapper, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "treatmentId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "experimentId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deploymentId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rolloutIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rolloutId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "rolloutIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rampId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "length"))
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("trialTreatmentId"));
    if (objc_msgSend(v7, "length"))
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("trialExperimentId"));
    if (v8)
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("trialDeploymentId"));
    if (objc_msgSend(v10, "length"))
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("trialRolloutId"));
    if (objc_msgSend(v12, "length"))
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("trialRampId"));

    goto LABEL_15;
  }
  +[SGAsset regionAsset](SGAsset, "regionAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assetVersion");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("mobileAssetsVersion"));
LABEL_15:

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionsWriteQueue, 0);
  objc_storeStrong((id *)&self->_persistenceTimerSource, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __52__SGRTCLogging_loggedInteractionsSummaryDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a2 + 24), "description");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __45__SGRTCLogging_loggedInteractionsDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a2 + 16), "description");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __44__SGRTCLogging_loggedExtractionsDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a2 + 8), "description");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

double __24__SGRTCLogging_storeAge__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 32);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __27__SGRTCLogging_storeToDisk__block_invoke(_QWORD *a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  const __CFString *v31;
  __int16 v32;
  id v33;
  _QWORD v34[4];
  _QWORD v35[5];

  v35[4] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1[4] + 16), "stringByAppendingPathExtension:", CFSTR("tmp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("SGRTCLogging.m"), 1227, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tmpPath"));

  }
  v5 = v3[1];
  v6 = v3[2];
  v34[0] = CFSTR("loggedExtractions");
  v34[1] = CFSTR("loggedInteractions");
  v35[0] = v5;
  v35[1] = v6;
  v35[2] = v3[3];
  v7 = (void *)MEMORY[0x1E0D815D0];
  v34[2] = CFSTR("loggedInteractionsSummary");
  v34[3] = CFSTR("storeAge");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)v3 + 4));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v7, "fileBackedDataWithPropertyList:writtenToPath:error:", v9, v4, &v29);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v29;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v10 != 0;
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(a1[4] + 16));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v11;
    v15 = objc_msgSend(v12, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v13, v14, 0, 0, 0, &v28);
    v16 = v28;

    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v15;
    if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    {
      objc_msgSend(MEMORY[0x1E0D815D0], "propertyListWithData:error:", v10, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("SGRTCLogging.m"), 1247, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("plp"));

      }
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("loggedExtractions"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "mutableCopy");
      v20 = (void *)v3[1];
      v3[1] = v19;

      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("loggedInteractions"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "mutableCopy");
      v23 = (void *)v3[2];
      v3[2] = v22;

      goto LABEL_11;
    }
  }
  else
  {
    v16 = v11;
  }
  sgLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
  {
    v25 = CFSTR("NULL");
    if (v10)
      v25 = CFSTR("nonnull");
    *(_DWORD *)buf = 138412546;
    v31 = v25;
    v32 = 2112;
    v33 = v16;
    _os_log_fault_impl(&dword_1C3607000, v24, OS_LOG_TYPE_FAULT, "Failure in -[SGRTCLogging storeToDisk] (plpData is %@), error: %@", buf, 0x16u);
  }

  if (_PASEvaluateLogFaultAndProbCrashCriteria())
    abort();
LABEL_11:

}

void __54__SGRTCLogging_removeInteractionsSummaryLogsFromLogs___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3[3], "removeObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

void __37__SGRTCLogging_resetInteractionsLogs__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v2 = a2;
  v3 = objc_opt_new();
  v4 = (id)v2[2];
  v2[2] = v3;

}

void __44__SGRTCLogging_resetInteractionsSummaryLogs__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v2 = a2;
  v3 = objc_opt_new();
  v4 = (id)v2[3];
  v2[3] = v3;

}

void __35__SGRTCLogging_resetExtractionLogs__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a2;
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v4[4] = v5;
  v6 = objc_opt_new();
  v7 = (void *)v4[1];
  v4[1] = v6;

  if ((objc_msgSend((id)objc_opt_class(), "_createEmptyFileAtPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)) & 1) == 0)
  {
    sgLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1C3607000, v8, OS_LOG_TYPE_ERROR, "Couldn't create the privacy-aware store for Suggestions.", v9, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
}

void __62__SGRTCLogging_sendRTCLogsWithShouldContinueBlock_completion___block_invoke(uint64_t a1, void *a2)
{
  __int128 v3;
  uint64_t v4;
  void *v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  char v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  _BOOL8 v54;
  uint64_t v55;
  __int128 v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id obj;
  char v63;
  uint64_t v64;
  uint64_t v65;
  void *context;
  id v67;
  id v68;
  _QWORD v69[5];
  _QWORD v70[5];
  _QWORD v71[6];
  uint8_t v72[8];
  uint8_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  const __CFString *v82;
  void *v83;
  __int128 buf;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v57 = a2;
  if (v57)
  {
    v61 = (void *)objc_opt_new();
    v60 = (void *)objc_opt_new();
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    obj = *(id *)(a1 + 32);
    v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
    if (v65)
    {
      v63 = 0;
      v64 = *(_QWORD *)v79;
      *(_QWORD *)&v3 = 138412290;
      v56 = v3;
LABEL_4:
      v4 = 0;
      while (1)
      {
        if (*(_QWORD *)v79 != v64)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v4);
        context = (void *)MEMORY[0x1C3BD4F6C]();
        if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))() & 1) == 0)
        {
          sgLogHandle();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v72 = 0;
            _os_log_impl(&dword_1C3607000, v52, OS_LOG_TYPE_INFO, "RTCLogging: Aborting sending of logs as shouldContinueBlock returned NO", v72, 2u);
          }

          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
          objc_autoreleasePoolPop(context);

          goto LABEL_60;
        }
        *(_QWORD *)v72 = 0;
        v73 = v72;
        v74 = 0x3032000000;
        v75 = __Block_byref_object_copy__11369;
        v76 = __Block_byref_object_dispose__11370;
        v77 = v5;
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v85 = 0x3032000000;
        v86 = __Block_byref_object_copy__11369;
        v87 = __Block_byref_object_dispose__11370;
        v88 = 0;
        v71[0] = MEMORY[0x1E0C809B0];
        v71[1] = 3221225472;
        v71[2] = __62__SGRTCLogging_sendRTCLogsWithShouldContinueBlock_completion___block_invoke_198;
        v71[3] = &unk_1E7DABD20;
        v71[4] = &buf;
        v71[5] = v72;
        v6 = (void (**)(_QWORD))MEMORY[0x1C3BD5158](v71);
        _Block_object_dispose(&buf, 8);

        objc_msgSend(*((id *)v73 + 5), "objectForKeyedSubscript:", CFSTR("categoryLog"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "descriptionForSGRTCCategory:", 5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqualToString:", v8);

        if ((v9 & 1) != 0)
        {
          v10 = 5;
          goto LABEL_28;
        }
        objc_msgSend(*(id *)(a1 + 40), "descriptionForSGRTCCategory:", 6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v7, "isEqualToString:", v11);

        if ((v12 & 1) != 0)
        {
          v10 = 6;
          goto LABEL_28;
        }
        objc_msgSend(*(id *)(a1 + 40), "descriptionForSGRTCCategory:", 7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v7, "isEqualToString:", v13);

        v15 = *(void **)(a1 + 40);
        if (v14)
        {
          v6[2](v6);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "enrichInteractionSummaryLog:", v16);

          v70[0] = MEMORY[0x1E0C809B0];
          v70[1] = 3221225472;
          v70[2] = __62__SGRTCLogging_sendRTCLogsWithShouldContinueBlock_completion___block_invoke_2;
          v70[3] = &unk_1E7DB15E8;
          v70[4] = *(_QWORD *)(a1 + 40);
          objc_msgSend(v61, "resultNonnullWithBlock:", v70);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v6[2](v6);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("usageMaps"));

          v69[0] = MEMORY[0x1E0C809B0];
          v69[1] = 3221225472;
          v69[2] = __62__SGRTCLogging_sendRTCLogsWithShouldContinueBlock_completion___block_invoke_3;
          v69[3] = &unk_1E7DB1610;
          v69[4] = *(_QWORD *)(a1 + 40);
          objc_msgSend(v60, "resultNonnullWithBlock:", v69);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v6[2](v6);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("usageCalendar"));

          v10 = 7;
          goto LABEL_28;
        }
        objc_msgSend(*(id *)(a1 + 40), "descriptionForSGRTCCategory:", 8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v7, "isEqualToString:", v21);

        if ((v22 & 1) != 0)
        {
          v10 = 8;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "descriptionForSGRTCCategory:", 9);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v7, "isEqualToString:", v23);

          if ((v24 & 1) != 0)
          {
            v10 = 9;
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 40), "descriptionForSGRTCCategory:", 10);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v7, "isEqualToString:", v25);

            v27 = *(void **)(a1 + 40);
            if (v26)
            {
              v6[2](v6);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "enrichReminderInteractionSummaryLog:", v28);
              v10 = 10;
            }
            else
            {
              objc_msgSend(*(id *)(a1 + 40), "descriptionForSGRTCCategory:", 11);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v7, "isEqualToString:", v29);

              if (!v30)
              {
                v10 = 0xFFFFLL;
                goto LABEL_28;
              }
              v31 = *(void **)(a1 + 40);
              v6[2](v6);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "enrichAggregateSummaryLog:", v28);
              v10 = 11;
            }

          }
        }
        +[SGAsset localeAsset](SGAsset, "localeAsset", v56, v57);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "assetVersion");
        v34 = &unk_1E7E0C0C8;
        if (v33 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v35 = (void *)MEMORY[0x1E0CB37E8];
          +[SGAsset localeAsset](SGAsset, "localeAsset");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "numberWithUnsignedInteger:", objc_msgSend(v59, "assetVersion"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v58;
        }
        v6[2](v6);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setObject:forKeyedSubscript:", v34, CFSTR("localeAssetVersion"));

        if (v33 != 0x7FFFFFFFFFFFFFFFLL)
        {

        }
LABEL_28:
        objc_msgSend(*(id *)(a1 + 40), "allowlistedLogFromLog:", *((_QWORD *)v73 + 5), v56);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = *(void **)(a1 + 48);
        v68 = 0;
        v39 = objc_msgSend(v38, "sendMessageWithCategory:type:payload:error:", v10, 0, v37, &v68);
        v40 = v68;
        if ((v39 & 1) == 0)
        {
          sgLogHandle();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = v56;
            *(_QWORD *)((char *)&buf + 4) = v40;
            _os_log_error_impl(&dword_1C3607000, v41, OS_LOG_TYPE_ERROR, "RTCLogging: Unable to send logs: %@", (uint8_t *)&buf, 0xCu);
          }
LABEL_38:

LABEL_39:
          v47 = v40;
          goto LABEL_40;
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
        if ((v63 & 1) != 0)
        {
          v63 = 1;
          goto LABEL_39;
        }
        v82 = CFSTR("storeAge");
        v42 = (void *)MEMORY[0x1E0CB37E8];
        v43 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 40), "storeAge");
        objc_msgSend(v42, "numberWithDouble:");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = v44;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v40;
        v46 = objc_msgSend(v43, "sendMessageWithCategory:type:payload:error:", 2, 0, v45, &v67);
        v47 = v67;

        if ((v46 & 1) == 0)
        {
          sgLogHandle();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = v56;
            *(_QWORD *)((char *)&buf + 4) = v47;
            _os_log_error_impl(&dword_1C3607000, v41, OS_LOG_TYPE_ERROR, "RTCLogging: Unable to send logs for storeAge: %@", (uint8_t *)&buf, 0xCu);
          }
          v63 = 1;
          v40 = v47;
          goto LABEL_38;
        }
        v63 = 1;
LABEL_40:

        _Block_object_dispose(v72, 8);
        objc_autoreleasePoolPop(context);
        if (v65 == ++v4)
        {
          v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
          v65 = v48;
          if (v48)
            goto LABEL_4;
          break;
        }
      }
    }

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      v49 = (void *)MEMORY[0x1C3BD4F6C]();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "flushMessages");
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
      {
        objc_msgSend(*(id *)(a1 + 40), "resetExtractionLogs");
        objc_msgSend(*(id *)(a1 + 40), "resetInteractionsLogs");
        v50 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96));
        v51 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "removeInteractionsSummaryLogsFromLogs:", v51);
      }
      else
      {
        sgLogHandle();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v72 = 0;
          _os_log_error_impl(&dword_1C3607000, v51, OS_LOG_TYPE_ERROR, "RTCLogging: Unable to flush logs", v72, 2u);
        }
      }

      objc_autoreleasePoolPop(v49);
      v55 = *(_QWORD *)(a1 + 56);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
        v54 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) != 0;
      else
        v54 = 0;
    }
    else
    {
      v54 = 0;
      v55 = *(_QWORD *)(a1 + 56);
    }
    (*(void (**)(uint64_t, _BOOL8, _QWORD))(v55 + 16))(v55, v54, 0);
LABEL_60:

  }
  else
  {
    sgLogHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v72 = 0;
      _os_log_impl(&dword_1C3607000, v53, OS_LOG_TYPE_DEFAULT, "RTCLogging: No RTC backends found, no logs will be sent at this time.", v72, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

id __62__SGRTCLogging_sendRTCLogsWithShouldContinueBlock_completion___block_invoke_198(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v2)
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "mutableCopy");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  return v2;
}

uint64_t __62__SGRTCLogging_sendRTCLogsWithShouldContinueBlock_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mapsUsageLast2Weeks");
}

uint64_t __62__SGRTCLogging_sendRTCLogsWithShouldContinueBlock_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_calendarUsageLast2Weeks");
}

uint64_t __42__SGRTCLogging_sendRTCLogsWithCompletion___block_invoke()
{
  return 1;
}

void __54__SGRTCLogging_logsToSendWithInteractionSummaryRange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id *v24;

  v24 = a2;
  v3 = objc_msgSend(v24[1], "mutableCopy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (v24[2])
    v6 = v24[2];
  else
    v6 = (id)MEMORY[0x1E0C9AA60];
  v7 = (void *)MEMORY[0x1C3BD4F6C](objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObjectsFromArray:", v6));
  v8 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(*(id *)(a1 + 32), "descriptionForSGRTCCategory:", 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "descriptionForSGRTCCategory:", 10);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "descriptionForSGRTCCategory:", 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithObjects:", v9, v10, v11, 0);

  objc_autoreleasePoolPop(v7);
  v13 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  *(_QWORD *)(v14 + 32) = v13;
  *(_QWORD *)(v14 + 40) = 0;
  if (objc_msgSend(v24[3], "count"))
  {
    v15 = 0;
    do
    {
      objc_msgSend(v24[3], "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("categoryLog"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "containsObject:", v17))
      {
        v18 = (void *)objc_opt_new();
        objc_msgSend(v24[3], "objectAtIndexedSubscript:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("expirationDate"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v18, "compare:", v20);

        if (v21 == 1)
        {
          objc_msgSend(v24[3], "objectAtIndexedSubscript:", v15);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGRTCLogging _deepCopy:](SGRTCLogging, "_deepCopy:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v23);
            ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          }

        }
      }

      ++v15;
    }
    while (v15 < objc_msgSend(v24[3], "count"));
  }

}

uint64_t __86__SGRTCLogging_logEventInteractionForRealtimeEvent_parentEntity_interface_actionType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logEventInteractionForRealtimeEventSync:parentEntity:interface:actionType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int16 *)(a1 + 56), *(unsigned __int16 *)(a1 + 58));
}

uint64_t __75__SGRTCLogging_logMLMessageEventInteractionForEntity_interface_actionType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logMLMessageEventExtractionForEntitySync:interface:actionType:", *(_QWORD *)(a1 + 40), *(unsigned __int16 *)(a1 + 48), *(unsigned __int16 *)(a1 + 50));
}

uint64_t __66__SGRTCLogging_logEventInteractionForEntity_interface_actionType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logEventInteractionForEntitySync:interface:actionType:", *(_QWORD *)(a1 + 40), *(unsigned __int16 *)(a1 + 48), *(unsigned __int16 *)(a1 + 50));
}

void __48__SGRTCLogging_logNewInteractionWithDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a2 + 16);
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __55__SGRTCLogging_logNewInteractionSummaryWithDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 24), "addObject:", *(_QWORD *)(a1 + 32));
}

void __55__SGRTCLogging_logAndIncrementEventCountForDictionary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id *v9;

  v9 = a2;
  if (objc_msgSend(v9[1], "count"))
  {
    v3 = 0;
    while (1)
    {
      objc_msgSend(v9[1], "objectAtIndexedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventsCount"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, CFSTR("eventsCount"));
      if (objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)))
        break;

      if (++v3 >= (unint64_t)objc_msgSend(v9[1], "count"))
        goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "unsignedIntegerValue") + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, CFSTR("eventsCount"));

    v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(v9[1], "setObject:atIndexedSubscript:", v8, v3);

  }
  else
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", &unk_1E7E0C098, CFSTR("eventsCount"));
    v6 = v9[1];
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(v6, "addObject:", v4);
  }

}

void __83__SGRTCLogging__updateLocationTypeFromInteractionsSummaryForEventKey_locationType___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  id *v12;

  v12 = a2;
  if (objc_msgSend(v12[3], "count"))
  {
    v3 = 0;
    while (1)
    {
      objc_msgSend(v12[3], "objectAtIndexedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventKey"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqual:", a1[4]);

      if (v6)
      {
        objc_msgSend(v12[3], "objectAtIndexedSubscript:", v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("locationType"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqual:", a1[5]);

        if ((v9 & 1) == 0)
          break;
      }
      if (++v3 >= (unint64_t)objc_msgSend(v12[3], "count"))
        goto LABEL_8;
    }
    v10 = a1[5];
    objc_msgSend(v12[3], "objectAtIndexedSubscript:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("locationType"));

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
LABEL_8:

}

void __93__SGRTCLogging_incrementAndUpgradeInteractionSummaryForEventKey_interactionKey_parentEntity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id *v21;

  v21 = a2;
  v3 = objc_msgSend(v21[3], "count");
  v4 = v21;
  if (v3)
  {
    v5 = 0;
    while (1)
    {
      objc_msgSend(v4[3], "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

      if (v8)
        break;
      ++v5;
      v9 = objc_msgSend(v21[3], "count");
      v4 = v21;
      if (v5 >= v9)
        goto LABEL_10;
    }
    objc_msgSend(v21[3], "objectAtIndexedSubscript:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "unsignedIntegerValue") + 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21[3], "objectAtIndexedSubscript:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, *(_QWORD *)(a1 + 40));

    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(v21[3], "objectAtIndexedSubscript:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("documentType"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqual:", CFSTR("unknown"));

      if (v16)
      {
        v17 = *(void **)(a1 + 56);
        objc_msgSend(*(id *)(a1 + 48), "duplicateKey");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "descriptionForEntityType:", objc_msgSend(v18, "entityType"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21[3], "objectAtIndexedSubscript:", v5);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("documentType"));

      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;

    v4 = v21;
  }
LABEL_10:

}

void __40__SGRTCLogging__calendarUsageLast2Weeks__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = (id)objc_opt_new();
  objc_msgSend(v3, "eventsPerWeekAroundDate:", v6);
  v5 = v4;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
}

uint64_t __68__SGRTCLogging__interactionAttributesForRealtimeEvent_parentEntity___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D197F0], "resolveName:", a2);
}

void __32__SGRTCLogging_encodeWithCoder___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  double *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2[1];
  v5 = a2;
  objc_msgSend(v3, "encodeObject:forKey:", v4, CFSTR("loggedExtractions"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *((_QWORD *)v5 + 2), CFSTR("loggedInteractions"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *((_QWORD *)v5 + 3), CFSTR("loggedInteractionsSummary"));
  v6 = *(void **)(a1 + 32);
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = v5[4];

  objc_msgSend(v7, "numberWithDouble:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("storeAge"));

}

void __30__SGRTCLogging_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
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
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClasses:forKey:", *(_QWORD *)(a1 + 40), CFSTR("loggedExtractions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_opt_new();
  v7 = (void *)*((_QWORD *)v3 + 1);
  *((_QWORD *)v3 + 1) = v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), CFSTR("SGRTCLogging.m"), 301, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[guardedData->_loggedExtractions isKindOfClass:NSMutableArray.class]"));

  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v8 = *((id *)v3 + 1);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v49 != v11)
          objc_enumerationMutation(v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), CFSTR("SGRTCLogging.m"), 303, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[loggedExtraction isKindOfClass:NSDictionary.class]"));

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClasses:forKey:", *(_QWORD *)(a1 + 40), CFSTR("loggedInteractions"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    v16 = v14;
  else
    v16 = (id)objc_opt_new();
  v17 = (void *)*((_QWORD *)v3 + 2);
  *((_QWORD *)v3 + 2) = v16;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), CFSTR("SGRTCLogging.m"), 306, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[guardedData->_loggedInteractions isKindOfClass:NSMutableArray.class]"));

  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v18 = *((id *)v3 + 2);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v45 != v21)
          objc_enumerationMutation(v18);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), CFSTR("SGRTCLogging.m"), 308, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[loggedInteraction isKindOfClass:NSDictionary.class]"));

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v20);
  }

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClasses:forKey:", *(_QWORD *)(a1 + 40), CFSTR("loggedInteractionsSummary"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
    v26 = v24;
  else
    v26 = (id)objc_opt_new();
  v27 = (void *)*((_QWORD *)v3 + 3);
  *((_QWORD *)v3 + 3) = v26;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), CFSTR("SGRTCLogging.m"), 311, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[guardedData->_loggedInteractionsSummary isKindOfClass:NSMutableArray.class]"));

  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v28 = *((id *)v3 + 3);
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v41;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v41 != v31)
          objc_enumerationMutation(v28);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), CFSTR("SGRTCLogging.m"), 313, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[loggedInteractionSummary isKindOfClass:NSMutableDictionary.class]"));

        }
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v30);
  }

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeAge"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "doubleValue");
  *((_QWORD *)v3 + 4) = v35;

  if (*((double *)v3 + 4) == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *((_QWORD *)v3 + 4) = v36;
  }

}

void __44__SGRTCLogging_loggedExtractionsEventsCount__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(a2 + 8);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "objectForKeyedSubscript:", CFSTR("eventsCount"), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v8, "integerValue");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

void __41__SGRTCLogging_loggedInteractionsSummary__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[SGRTCLogging _deepCopy:](SGRTCLogging, "_deepCopy:", *(_QWORD *)(a2 + 24));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __41__SGRTCLogging_loggedInteractionsSummary__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("categoryLog"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("categoryLog"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "compare:", v5);
  return v7;
}

void __34__SGRTCLogging_loggedInteractions__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[SGRTCLogging _deepCopy:](SGRTCLogging, "_deepCopy:", *(_QWORD *)(a2 + 16));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __33__SGRTCLogging_loggedExtractions__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(*(id *)(a2 + 8), "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __20__SGRTCLogging_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "storeToDisk");

}

void __20__SGRTCLogging_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;

  v9 = a2;
  v2 = objc_opt_new();
  v3 = (void *)v9[1];
  v9[1] = v2;

  v4 = objc_opt_new();
  v5 = (void *)v9[2];
  v9[2] = v4;

  v6 = objc_opt_new();
  v7 = (void *)v9[3];
  v9[3] = v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v9[4] = v8;

}

+ (id)_deepCopy:(id)a3
{
  id v3;
  void *v4;
  void *DeepCopy;

  v3 = a3;
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  DeepCopy = (void *)CFPropertyListCreateDeepCopy(0, v3, 0);
  objc_autoreleasePoolPop(v4);

  return DeepCopy;
}

+ (id)_deepMutableContainersCopy:(id)a3
{
  id v3;
  void *v4;
  void *DeepCopy;

  v3 = a3;
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  DeepCopy = (void *)CFPropertyListCreateDeepCopy(0, v3, 1uLL);
  objc_autoreleasePoolPop(v4);

  return DeepCopy;
}

+ (id)defaultLogger
{
  if (defaultLogger_onceToken != -1)
    dispatch_once(&defaultLogger_onceToken, &__block_literal_global_11539);
  return (id)defaultLogger_sharedLogger;
}

+ (BOOL)_createEmptyFileAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8 = *MEMORY[0x1E0CB2AD8];
  v9[0] = *MEMORY[0x1E0CB2AC0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "createFileAtPath:contents:attributes:", v3, 0, v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)descriptionForOriginType:(unint64_t)a3
{
  if (a3 - 1 > 6)
    return CFSTR("unknown");
  else
    return off_1E7DABF70[a3 - 1];
}

void __29__SGRTCLogging_defaultLogger__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  SGRTCLogging *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  SGRTCLogging *v17;
  void *v18;
  uint8_t v19[16];
  _QWORD v20[4];
  id v21;
  uint8_t *v22;
  uint8_t buf[8];
  uint8_t *v24;
  uint64_t v25;
  char v26;

  +[SGPaths suggestionsDirectoryFile:](SGPaths, "suggestionsDirectoryFile:", CFSTR("privacyAwareLogging.ser"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "fileExistsAtPath:", v0) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "attributesOfItemAtPath:error:", v0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "fileSize");

    if (v4)
    {
      *(_QWORD *)buf = 0;
      v24 = buf;
      v25 = 0x2020000000;
      v26 = 0;
      objc_msgSend(MEMORY[0x1E0D815D0], "dictionaryWithPath:error:", v0, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = -[SGRTCLogging initWithFilename:]([SGRTCLogging alloc], "initWithFilename:", v0);
        v7 = (void *)defaultLogger_sharedLogger;
        defaultLogger_sharedLogger = (uint64_t)v6;

        v8 = *(void **)(defaultLogger_sharedLogger + 8);
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __29__SGRTCLogging_defaultLogger__block_invoke_2;
        v20[3] = &unk_1E7DABAD8;
        v21 = v5;
        v22 = buf;
        objc_msgSend(v8, "runWithLockAcquired:", v20);

      }
      if (!v24[24])
      {
        v9 = (void *)defaultLogger_sharedLogger;
        defaultLogger_sharedLogger = 0;

        sgLogHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEFAULT, "Attempt to read stored logs using legacy fallback", v19, 2u);
        }

        v11 = objc_alloc(MEMORY[0x1E0CB3710]);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v0, 1, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initForReadingFromData:error:", v12, 0);

        objc_msgSend(v13, "setDecodingFailurePolicy:", 0);
        objc_msgSend(v13, "decodeTopLevelObjectOfClass:forKey:error:", objc_opt_class(), *MEMORY[0x1E0CB2CD0], 0);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)defaultLogger_sharedLogger;
        defaultLogger_sharedLogger = v14;

        if (defaultLogger_sharedLogger)
          objc_storeStrong((id *)(defaultLogger_sharedLogger + 16), v0);

      }
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {

  }
  if (!defaultLogger_sharedLogger)
  {
    sgLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v16, OS_LOG_TYPE_DEFAULT, "New logging store", buf, 2u);
    }

    v17 = -[SGRTCLogging initWithFilename:]([SGRTCLogging alloc], "initWithFilename:", v0);
    v18 = (void *)defaultLogger_sharedLogger;
    defaultLogger_sharedLogger = (uint64_t)v17;

  }
}

void __29__SGRTCLogging_defaultLogger__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;

  v20 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("loggedExtractions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((__29__SGRTCLogging_defaultLogger__block_invoke_3(v3) & 1) == 0)
    goto LABEL_8;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("loggedInteractions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((__29__SGRTCLogging_defaultLogger__block_invoke_3(v4) & 1) == 0)
  {
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("loggedInteractionsSummary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((__29__SGRTCLogging_defaultLogger__block_invoke_3(v5) & 1) == 0)
  {

    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("storeAge"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
LABEL_9:
  v8 = v20;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("loggedExtractions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "mutableCopy");
    v11 = (void *)v20[1];
    v20[1] = v10;

    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("loggedInteractions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "mutableCopy");
    v14 = (void *)v20[2];
    v20[2] = v13;

    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("loggedInteractionsSummary"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGRTCLogging _deepMutableContainersCopy:](SGRTCLogging, "_deepMutableContainersCopy:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v20[3];
    v20[3] = v16;

    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("storeAge"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20[4] = v19;

    v8 = v20;
  }

}

uint64_t __29__SGRTCLogging_defaultLogger__block_invoke_3(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v2 = v1;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v10;
      while (2)
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v2);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v7 = 0;
            goto LABEL_13;
          }
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          continue;
        break;
      }
    }
    v7 = 1;
LABEL_13:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (unint64_t)bucketizeInteger:(unint64_t)a3 withBucketSize:(unint64_t)a4 limit:(unint64_t)a5
{
  void *v11;

  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGRTCLogging+Helpers.m"), 26, CFSTR("bucketSize must be > 0"));

  }
  if (a3 <= a5)
    return (a3 + a4 - 1) / a4 * a4;
  return a5;
}

+ (unint64_t)bucketizeIntegerForAggregateSummary:(unint64_t)a3
{
  if (a3 >= 0xB)
    return objc_msgSend(a1, "bucketizeInteger:withBucketSize:limit:");
  else
    return a3;
}

+ (id)bucketizeIntegersForAggregateSummary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  id v16;

  v4 = a3;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0C99D80]);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __62__SGRTCLogging_Helpers__bucketizeIntegersForAggregateSummary___block_invoke;
  v14 = &unk_1E7DAD7A0;
  v15 = v4;
  v16 = a1;
  v7 = v4;
  objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v6, "initWithObjects:forKeys:", v8, v5, v11, v12, v13, v14);
  return v9;
}

+ (double)round:(double)a3 toSignificantFigures:(int64_t)a4
{
  double result;
  double v7;
  double v8;
  double v9;

  result = 0.0;
  if (a3 != 0.0)
  {
    v7 = -a3;
    if (a3 >= 0.0)
      v7 = a3;
    v8 = log10(v7);
    v9 = __exp10((double)(uint64_t)(a4 - vcvtpd_s64_f64(v8)));
    return (double)(uint64_t)llround(v9 * a3) / v9;
  }
  return result;
}

+ (unint64_t)numberOfDaysBetweenDate:(id)a3 andDate:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v5 = (objc_class *)MEMORY[0x1E0C99D48];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  v9 = (void *)objc_msgSend(v8, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v9, "components:fromDate:toDate:options:", 16, v7, v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "day");
  return v11;
}

+ (id)aggregateSummaryBucketizedLaunchCountsForApps:(id)a3 afterDate:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "launchCountsForApps:afterDate:limit:", a3, a4, 100);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bucketizeIntegersForAggregateSummary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)launchCountsForApps:(id)a3 afterDate:(id)a4 limit:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "launchCountsForBundleIds:afterDate:limit:", v8, v7, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0C99D80]);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__SGRTCLogging_Helpers__launchCountsForApps_afterDate_limit___block_invoke;
  v16[3] = &unk_1E7DB59B8;
  v17 = v10;
  v12 = v10;
  objc_msgSend(v8, "_pas_mappedArrayWithTransform:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v11, "initWithObjects:forKeys:", v13, v8);
  return v14;
}

+ (id)launchCountsForApps:(id)a3 afterDate:(id)a4 lowerBucket:(unint64_t)a5 bucketSize:(unint64_t)a6 bucketLimit:(unint64_t)a7
{
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  unint64_t v20;
  id v21;
  unint64_t v22;
  unint64_t v23;

  objc_msgSend(a1, "launchCountsForApps:afterDate:limit:", a3, a4, a7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0C99D80]);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __90__SGRTCLogging_Helpers__launchCountsForApps_afterDate_lowerBucket_bucketSize_bucketLimit___block_invoke;
  v18[3] = &unk_1E7DAD7C8;
  v19 = v11;
  v20 = a5;
  v21 = a1;
  v22 = a6;
  v23 = a7;
  v14 = v11;
  objc_msgSend(v12, "_pas_mappedArrayWithTransform:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v13, "initWithObjects:forKeys:", v15, v12);
  return v16;
}

+ (id)locationTypeForHandle:(id)a3 latitude:(double)a4 longitude:(double)a5 airportCode:(id)a6 address:(id)a7 label:(id)a8
{
  const __CFString *v9;
  const __CFString *v10;
  BOOL v11;
  const __CFString *v12;
  BOOL v13;

  if (a3)
    return CFSTR("geocoded");
  if (a4 == 0.0 && a5 == 0.0)
  {
    v9 = CFSTR("unknown");
    if (a8)
      v9 = CFSTR("label");
    v10 = CFSTR("address");
    if (a8)
      v11 = a7 == 0;
    else
      v11 = 1;
    if (!v11)
      v10 = CFSTR("addressWithLabel");
    if (a7)
      return (id)v10;
    else
      return (id)v9;
  }
  else
  {
    v12 = CFSTR("coordinates");
    if (a8)
      v13 = a7 == 0;
    else
      v13 = 1;
    if (!v13)
      v12 = CFSTR("addressWithCoordinatesWithLabel");
    if (a6)
      return CFSTR("airportCodeWithCoordinates");
    else
      return (id)v12;
  }
}

+ (id)locationTypeForEntity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;

  objc_msgSend(a3, "locations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "latitude");
    v9 = v8;
    objc_msgSend(v6, "longitude");
    v11 = v10;
    objc_msgSend(v6, "airportCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "address");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "label");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "locationTypeForHandle:latitude:longitude:airportCode:address:label:", v7, v12, v13, v14, v9, v11);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = CFSTR("unknown");
  }

  return v15;
}

+ (id)locationTypeForRealtimeEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;

  objc_msgSend(a3, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "latitude");
    v9 = v8;
    objc_msgSend(v6, "longitude");
    v11 = v10;
    objc_msgSend(v6, "airportCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "address");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "label");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "locationTypeForHandle:latitude:longitude:airportCode:address:label:", v7, v12, v13, v14, v9, v11);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = CFSTR("unknown");
  }

  return v15;
}

+ (id)dateByAppendingDaysToCurrentDate:(double)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "dateByAddingTimeInterval:", a3 * 86400.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __90__SGRTCLogging_Helpers__launchCountsForApps_afterDate_lowerBucket_bucketSize_bucketLimit___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  unint64_t v4;
  id v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  if (v4 <= *(_QWORD *)(a1 + 40))
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "bucketizeInteger:withBucketSize:limit:", v4, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64)));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

uint64_t __61__SGRTCLogging_Helpers__launchCountsForApps_afterDate_limit___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "countForObject:", a2));
}

id __62__SGRTCLogging_Helpers__bucketizeIntegersForAggregateSummary___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "bucketizeIntegerForAggregateSummary:", objc_msgSend(v4, "unsignedIntegerValue")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)logReminderInteractionFromEntity:(id)a3 usingStore:(id)a4 interface:(unsigned __int16)a5 actionType:(unsigned __int16)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  SGRTCLogging *v22;
  unsigned __int16 v23;
  unsigned __int16 v24;

  v10 = a3;
  v11 = a4;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __92__SGRTCLogging_Reminders__logReminderInteractionFromEntity_usingStore_interface_actionType___block_invoke;
  v19 = &unk_1E7DB6938;
  v20 = v10;
  v21 = v11;
  v22 = self;
  v23 = a5;
  v24 = a6;
  v12 = v11;
  v13 = v10;
  v14 = (void *)MEMORY[0x1C3BD5158](&v16);
  -[SGRTCLogging interactionsWriteQueue](self, "interactionsWriteQueue", v16, v17, v18, v19);
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v15, v14);

}

- (void)logReminderInteractionFromReminder:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];

  v5 = a5;
  v6 = a4;
  v8 = a3;
  sgRemindersLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v16 = 0;
    _os_log_debug_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEBUG, "SGRTCLogging+Reminders: logging interaction to RTC", v16, 2u);
  }

  -[SGRTCLogging baseInteractionDictionaryForInterface:actionType:](self, "baseInteractionDictionaryForInterface:actionType:", v6, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  -[SGRTCLogging trialIds](self, "trialIds");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addEntriesFromDictionary:", v12);

  -[SGRTCLogging descriptionForSGRTCCategory:](self, "descriptionForSGRTCCategory:", 9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("categoryLog"));

  -[SGRTCLogging logNewInteractionWithDictionary:](self, "logNewInteractionWithDictionary:", v11);
  -[SGRTCLogging interactionKeyForCategory:interface:actionType:](self, "interactionKeyForCategory:interface:actionType:", 9, v6, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGRTCLogging logAggregateSummaryForInteraction:](self, "logAggregateSummaryForInteraction:", v14);

  -[SGRTCLogging _logReminderInteractionSummaryForReminder:interface:actionType:](self, "_logReminderInteractionSummaryForReminder:interface:actionType:", v8, v6, v5);
  objc_msgSend(MEMORY[0x1E0D19EC0], "defaultLanguage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("en"), "isEqual:", v15))
    +[SGDPLogging logReminder:actionType:](SGDPLogging, "logReminder:actionType:", v8, v5);

}

- (void)_logReminderInteractionSummaryForReminder:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  id v12;

  v5 = a5;
  v6 = a4;
  v12 = a3;
  -[SGRTCLogging _eventKeyforReminder:](self, "_eventKeyforReminder:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGRTCLogging interactionKeyForInterface:actionType:](self, "interactionKeyForInterface:actionType:", v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SGRTCLogging incrementAndUpgradeInteractionSummaryForEventKey:interactionKey:parentEntity:](self, "incrementAndUpgradeInteractionSummaryForEventKey:interactionKey:parentEntity:", v8, v9, 0);

  if (!v10)
  {
    -[SGRTCLogging _interactionSummaryForReminder:interface:actionType:](self, "_interactionSummaryForReminder:interface:actionType:", v12, v6, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGRTCLogging logNewInteractionSummaryWithDictionary:](self, "logNewInteractionSummaryWithDictionary:", v11);

  }
}

- (void)logReminderExtractionFromEntity:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5 dueLocation:(id)a6 dueDateComponents:(id)a7 extractionStatus:(unsigned __int8)a8 timingProcessing:(double)a9
{
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  uint8_t v31[16];

  v9 = a8;
  if (a8 == 1)
  {
    v14 = a7;
    v15 = a6;
    v16 = a3;
    sgRemindersLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v31 = 0;
      _os_log_debug_impl(&dword_1C3607000, v17, OS_LOG_TYPE_DEBUG, "SGRTCLogging+Reminders: logging extraction to RTC", v31, 2u);
    }

    -[SGRTCLogging _interactionDictionaryForDueLocation:dueDateComponents:](self, "_interactionDictionaryForDueLocation:dueDateComponents:", v15, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[SGRTCLogging descriptionForSGRTCCategory:](self, "descriptionForSGRTCCategory:", 8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("categoryLog"));

    objc_msgSend((id)objc_opt_class(), "describeReminderExtractionStatus:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("remindersExtractionStatus"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a9);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = (const __CFString *)v21;
    else
      v23 = &stru_1E7DB83A8;
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, CFSTR("timingProcessing"));

    objc_msgSend(v16, "duplicateKey");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[SGRTCLogging descriptionForEntityType:](self, "descriptionForEntityType:", objc_msgSend(v24, "entityType"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, CFSTR("documentType"));

    objc_msgSend(MEMORY[0x1E0D19EC0], "defaultLanguage");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v26)
      v28 = (const __CFString *)v26;
    else
      v28 = CFSTR("unknown");
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v28, CFSTR("deviceLanguage"));

    -[SGRTCLogging trialIds](self, "trialIds");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addEntriesFromDictionary:", v29);

    -[SGRTCLogging logAndIncrementEventCountForDictionary:](self, "logAndIncrementEventCountForDictionary:", v18);
  }
  objc_msgSend((id)objc_opt_class(), "describeReminderExtractionStatus:", v9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGRTCLogging logAggregateSummaryForInteraction:](self, "logAggregateSummaryForInteraction:", v30);

}

- (id)_eventKeyforReminder:(id)a3
{
  id v3;
  SGDuplicateKey *v4;
  void *v5;
  SGDuplicateKey *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = [SGDuplicateKey alloc];
  objc_msgSend(v3, "uniqueKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SGDuplicateKey initWithSerialized:](v4, "initWithSerialized:", v5);
  -[SGDuplicateKey entityKey](v6, "entityKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serialize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_interactionSummaryForReminder:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  _QWORD v29[2];

  v5 = a5;
  v6 = a4;
  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "dueDateComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "dueDateComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[SGRTCLogging _baseInteractionAttributesForReminder:](self, "_baseInteractionAttributesForReminder:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGRTCLogging _eventKeyforReminder:](self, "_eventKeyforReminder:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGRTCLogging interactionKeyForInterface:actionType:](self, "interactionKeyForInterface:actionType:", v6, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGRTCLogging createInteractionSummaryForEventKey:expirationDate:interactionKey:interactionAttributes:rtcCategory:](self, "createInteractionSummaryForEventKey:expirationDate:interactionKey:interactionAttributes:rtcCategory:", v12, v9, v13, v11, 10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "dateByAppendingDaysToCurrentDate:", -14.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_class();
  v29[0] = *MEMORY[0x1E0D19A58];
  v17 = v29[0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "launchCountsForApps:afterDate:lowerBucket:bucketSize:bucketLimit:", v18, v15, 1, 10, 50);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, CFSTR("launchCountReminders"));

  -[SGRTCLogging trialIds](self, "trialIds");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addEntriesFromDictionary:", v21);

  v22 = (void *)objc_opt_class();
  objc_msgSend(v8, "origin");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "descriptionForOriginType:", objc_msgSend(v23, "type"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v24, CFSTR("documentType"));

  objc_msgSend(MEMORY[0x1E0D19EC0], "defaultLanguage");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v25)
    v27 = (const __CFString *)v25;
  else
    v27 = CFSTR("unknown");
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v27, CFSTR("deviceLanguage"));

  return v14;
}

- (id)_baseInteractionAttributesForReminder:(id)a3
{
  id v4;
  SGReminderDueLocation *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "dueLocation");
  v5 = (SGReminderDueLocation *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v5 = -[SGReminderDueLocation initWithLocationType:trigger:name:]([SGReminderDueLocation alloc], "initWithLocationType:trigger:name:", objc_msgSend(v4, "dueLocationType"), objc_msgSend(v4, "dueLocationTrigger"), 0);
  objc_msgSend(v4, "dueDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGRTCLogging _interactionDictionaryForDueLocation:dueDateComponents:](self, "_interactionDictionaryForDueLocation:dueDateComponents:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_interactionDictionaryForDueLocation:(id)a3 dueDateComponents:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  unint64_t v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D19928], "describeReminderDueLocationType:", objc_msgSend(v5, "locationType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("dueLocationType"));

    objc_msgSend(MEMORY[0x1E0D19928], "describeReminderDueLocationTrigger:", objc_msgSend(v5, "trigger"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("dueLocationTrigger"));

  }
  if (v6)
  {
    objc_msgSend(v6, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceNow");
    v12 = v11;

    if (v12 >= 0.0)
    {
      objc_msgSend(v6, "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceNow");
      v15 = +[SGRTCLogging bucketizeInteger:withBucketSize:limit:](SGRTCLogging, "bucketizeInteger:withBucketSize:limit:", (unint64_t)(v14 / 86400.0), 7, 56);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("daysUntilDue"));

    }
    else
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E7E0CCE0, CFSTR("daysUntilDue"));
    }
    if (objc_msgSend(v6, "hour") == 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(v6, "minute") == 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(v6, "second") == 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(v6, "nanosecond") == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E7E0CCF8, CFSTR("defaultDueDate"));
    }
  }

  return v7;
}

- (id)trialIds
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_new();
  +[SGReminderTrialClientWrapper sharedInstance](SGReminderTrialClientWrapper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "treatmentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deploymentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("trialTreatmentId"));
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("trialExperimentId"));
  if (v6)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("trialDeploymentId"));

  return v2;
}

void __92__SGRTCLogging_Reminders__logReminderInteractionFromEntity_usingStore_interface_actionType___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[SGStorageReminder storageReminderFromEntity:store:](SGStorageReminder, "storageReminderFromEntity:store:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "logReminderInteractionFromReminder:interface:actionType:", v2, *(unsigned __int16 *)(a1 + 56), *(unsigned __int16 *)(a1 + 58));
  }
  else
  {
    sgRemindersLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "recordId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_error_impl(&dword_1C3607000, v3, OS_LOG_TYPE_ERROR, "SGRTCLogging+Reminders: No reminder found for entity record Id: %@", (uint8_t *)&v5, 0xCu);

    }
  }

}

+ (id)describeReminderExtractionStatus:(unsigned __int8)a3
{
  if ((a3 - 1) > 5)
    return CFSTR("unknown");
  else
    return off_1E7DB6998[(a3 - 1)];
}

@end
