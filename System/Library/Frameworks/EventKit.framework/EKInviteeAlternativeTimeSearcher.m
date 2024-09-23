@implementation EKInviteeAlternativeTimeSearcher

- (EKInviteeAlternativeTimeSearcher)initWithStateChangedCallback:(id)a3
{
  id v4;
  EKInviteeAlternativeTimeSearcher *v5;
  EKInviteeAlternativeTimeSearcher *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  const char *v16;
  dispatch_queue_t v17;
  id v18;
  const char *v19;
  dispatch_queue_t v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)EKInviteeAlternativeTimeSearcher;
  v5 = -[EKInviteeAlternativeTimeSearcher init](&v22, sel_init);
  v6 = v5;
  if (v5)
  {
    -[EKInviteeAlternativeTimeSearcher setStateChanged:](v5, "setStateChanged:", v4);
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[EKInviteeAlternativeTimeSearcher setParticipantAddressesToParticipants:](v6, "setParticipantAddressesToParticipants:", v7);

    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[EKInviteeAlternativeTimeSearcher setInternalTimesWhenAllAttendeesCanAttend:](v6, "setInternalTimesWhenAllAttendeesCanAttend:", v8);

    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[EKInviteeAlternativeTimeSearcher setInternalTimesWhenSomeAttendeesCanAttend:](v6, "setInternalTimesWhenSomeAttendeesCanAttend:", v9);

    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[EKInviteeAlternativeTimeSearcher setInternalOriginalConflictedParticipants:](v6, "setInternalOriginalConflictedParticipants:", v10);

    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[EKInviteeAlternativeTimeSearcher setInternalProposedTimes:](v6, "setInternalProposedTimes:", v11);

    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[EKInviteeAlternativeTimeSearcher setLeftoverSpans:](v6, "setLeftoverSpans:", v12);

    v13 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setName:", v14);

    -[EKInviteeAlternativeTimeSearcher setAvailabilityRequestsQueue:](v6, "setAvailabilityRequestsQueue:", v13);
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = (const char *)objc_msgSend(v15, "UTF8String");

    v17 = dispatch_queue_create(v16, 0);
    -[EKInviteeAlternativeTimeSearcher setProcessingQueue:](v6, "setProcessingQueue:", v17);

    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = (const char *)objc_msgSend(v18, "UTF8String");

    v20 = dispatch_queue_create(v19, 0);
    -[EKInviteeAlternativeTimeSearcher setCallbackQueue:](v6, "setCallbackQueue:", v20);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[EKInviteeAlternativeTimeSearcher availabilityRequestsQueue](self, "availabilityRequestsQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllOperations");

  v4.receiver = self;
  v4.super_class = (Class)EKInviteeAlternativeTimeSearcher;
  -[EKInviteeAlternativeTimeSearcher dealloc](&v4, sel_dealloc);
}

- (NSDate)originalStartDate
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  v12 = 0;
  -[EKInviteeAlternativeTimeSearcher processingQueue](self, "processingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__EKInviteeAlternativeTimeSearcher_originalStartDate__block_invoke;
  v6[3] = &unk_1E4785190;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

void __53__EKInviteeAlternativeTimeSearcher_originalStartDate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "internalOriginalStartDate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSDate)originalEndDate
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  v12 = 0;
  -[EKInviteeAlternativeTimeSearcher processingQueue](self, "processingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__EKInviteeAlternativeTimeSearcher_originalEndDate__block_invoke;
  v6[3] = &unk_1E4785190;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

void __51__EKInviteeAlternativeTimeSearcher_originalEndDate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "internalOriginalEndDate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)originalConflictedParticipants
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  v12 = 0;
  -[EKInviteeAlternativeTimeSearcher processingQueue](self, "processingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__EKInviteeAlternativeTimeSearcher_originalConflictedParticipants__block_invoke;
  v6[3] = &unk_1E4785190;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __66__EKInviteeAlternativeTimeSearcher_originalConflictedParticipants__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "internalOriginalConflictedParticipants");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)timesWhenAllAttendeesCanAttend
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  v12 = 0;
  -[EKInviteeAlternativeTimeSearcher processingQueue](self, "processingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__EKInviteeAlternativeTimeSearcher_timesWhenAllAttendeesCanAttend__block_invoke;
  v6[3] = &unk_1E4785190;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __66__EKInviteeAlternativeTimeSearcher_timesWhenAllAttendeesCanAttend__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "internalTimesWhenAllAttendeesCanAttend");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)timesWhenSomeAttendeesCanAttend
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  v12 = 0;
  -[EKInviteeAlternativeTimeSearcher processingQueue](self, "processingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__EKInviteeAlternativeTimeSearcher_timesWhenSomeAttendeesCanAttend__block_invoke;
  v6[3] = &unk_1E4785190;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __67__EKInviteeAlternativeTimeSearcher_timesWhenSomeAttendeesCanAttend__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "internalTimesWhenSomeAttendeesCanAttend");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)proposedTimes
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  v12 = 0;
  -[EKInviteeAlternativeTimeSearcher processingQueue](self, "processingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__EKInviteeAlternativeTimeSearcher_proposedTimes__block_invoke;
  v6[3] = &unk_1E4785190;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __49__EKInviteeAlternativeTimeSearcher_proposedTimes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "internalProposedTimes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)searchingForMoreTimesWhenAllAttendeesCanAttend
{
  EKInviteeAlternativeTimeSearcher *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[EKInviteeAlternativeTimeSearcher processingQueue](self, "processingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__EKInviteeAlternativeTimeSearcher_searchingForMoreTimesWhenAllAttendeesCanAttend__block_invoke;
  v5[3] = &unk_1E4785190;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __82__EKInviteeAlternativeTimeSearcher_searchingForMoreTimesWhenAllAttendeesCanAttend__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "internalSearchingForMoreTimesWhenAllAttendeesCanAttend");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)searchingForMoreTimesWhenSomeAttendeesCanAttend
{
  EKInviteeAlternativeTimeSearcher *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[EKInviteeAlternativeTimeSearcher processingQueue](self, "processingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__EKInviteeAlternativeTimeSearcher_searchingForMoreTimesWhenSomeAttendeesCanAttend__block_invoke;
  v5[3] = &unk_1E4785190;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __83__EKInviteeAlternativeTimeSearcher_searchingForMoreTimesWhenSomeAttendeesCanAttend__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "internalSearchingForMoreTimesWhenSomeAttendeesCanAttend");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)searchForMoreTimesWhenAllAttendeesCanAttend
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "A request to search for more times when all attendees can attend was made.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

uint64_t __79__EKInviteeAlternativeTimeSearcher_searchForMoreTimesWhenAllAttendeesCanAttend__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setInternalSearchingForMoreTimesWhenAllAttendeesCanAttend:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_resetSearchFallbackNumbers");
  return objc_msgSend(*(id *)(a1 + 32), "_attemptSearch");
}

- (void)searchForMoreTimesWhenSomeAttendeesCanAttend
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "A request to search for more times when some attendees can attend was made.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

uint64_t __80__EKInviteeAlternativeTimeSearcher_searchForMoreTimesWhenSomeAttendeesCanAttend__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setInternalSearchingForMoreTimesWhenSomeAttendeesCanAttend:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_resetSearchFallbackNumbers");
  return objc_msgSend(*(id *)(a1 + 32), "_attemptSearch");
}

- (void)resetWithEvent:(id)a3 organizerAddressForNewlyScheduledEvent:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[EKInviteeAlternativeTimeSearcher processingQueue](self, "processingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke;
  block[3] = &unk_1E4785400;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  int v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  _BOOL4 v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  EKRequestAvailabilityOperation *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t j;
  void *v75;
  EKRequestAvailabilityOperation *v76;
  void *v77;
  void *v78;
  void *v79;
  EKRequestAvailabilityOperation *v80;
  void *v81;
  void *v82;
  void *v83;
  int v84;
  _BOOL4 v85;
  id *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  EKRequestAvailabilityOperation *val;
  void *v93;
  id v94;
  void *v95;
  id obj;
  id v97;
  id v98;
  void *v99;
  id v100;
  int v101;
  _QWORD v103[4];
  id v104;
  id v105;
  void *v106;
  uint64_t v107;
  id v108;
  id v109[2];
  char v110;
  id from;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _QWORD v116[4];
  id v117;
  id v118;
  uint64_t v119;
  id v120;
  id v121;
  char v122;
  id location;
  _QWORD v124[4];
  id v125;
  id v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  uint8_t v131[128];
  uint8_t buf[4];
  void *v133;
  __int16 v134;
  void *v135;
  _BYTE v136[128];
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "availabilityRequestsQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancelAllOperations");

  v2 = EKUIAvailabilitySearchHandle;
  if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
    __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_16(a1, v2, v3);
  objc_msgSend(*(id *)(a1 + 32), "setAvailabilityRequestInProgress:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setInternalSearchingForMoreTimesWhenAllAttendeesCanAttend:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setInternalSearchingForMoreTimesWhenSomeAttendeesCanAttend:", 0);
  objc_msgSend(*(id *)(a1 + 32), "internalTimesWhenAllAttendeesCanAttend");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "internalTimesWhenSomeAttendeesCanAttend");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "internalProposedTimes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "internalOriginalConflictedParticipants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "participantAddressesToParticipants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "leftoverSpans");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "setNextAvailabilityRangeStartDate:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setInternalOriginalStartDate:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setInternalOriginalEndDate:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setOriginalRangeStartDate:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setSource:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setIgnoredEventID:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setOrganizerAddress:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_resetSearchFallbackNumbers");
  objc_msgSend(*(id *)(a1 + 32), "_sendStateChange:", 0);
  v10 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "constraints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "supportsAvailabilityRequests");

  if (*(_QWORD *)(a1 + 40))
  {
    if ((v12 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v10, "endDateUnadjustedForLegacyClients");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToDate:", v14);

      if (v15)
      {
        if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
          __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_2();
        return;
      }
      if (objc_msgSend(*v10, "isAllDay"))
      {
        if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
          __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_3();
        return;
      }
      v16 = objc_msgSend(*v10, "isDetached");
      v17 = *v10;
      if ((v16 & 1) != 0)
      {
        objc_msgSend(v17, "originalItem");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "uniqueId");
        v91 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v17, "uniqueId");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v19 = (void *)EKUIAvailabilitySearchHandle;
      if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
        __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_14(v10, v19, (uint64_t)v91);
      v87 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 40), "startDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setInternalOriginalStartDate:", v20);

      objc_msgSend(*(id *)(a1 + 40), "endDateUnadjustedForLegacyClients");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setInternalOriginalEndDate:", v21);

      v90 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "timeZone");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
        goto LABEL_22;
      objc_msgSend(v22, "timeZone");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v10, "timeZone");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqualToTimeZone:", v25);

      if ((v26 & 1) == 0)
      {
        v28 = (void *)objc_msgSend(v22, "copy");

        objc_msgSend(*v10, "timeZone");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setTimeZone:", v29);

        v27 = v28;
      }
      else
      {
LABEL_22:
        v27 = v22;
      }
      v89 = v27;
      objc_msgSend(v90, "dateByAddingHours:inCalendar:", 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "dateRoundedToNearestFifteenMinutesInCalendar:", v89);
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "setOriginalRangeStartDate:", v88);
      objc_msgSend(*(id *)(a1 + 32), "originalRangeStartDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setNextAvailabilityRangeStartDate:", v31);

      objc_msgSend(*(id *)(a1 + 32), "setIgnoredEventID:", v91);
      objc_msgSend(*(id *)(a1 + 40), "calendar");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "source");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setSource:", v33);

      if ((objc_msgSend(*(id *)(a1 + 40), "isStartDateDirty") & 1) != 0)
        v101 = 1;
      else
        v101 = objc_msgSend(*v10, "isEndDateDirty");
      v94 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v100 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
        __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_13();
      objc_msgSend(*v10, "organizer");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = 0u;
      v130 = 0u;
      v127 = 0u;
      v128 = 0u;
      objc_msgSend(*v10, "attendees");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v127, v136, 16);
      if (v35)
      {
        v36 = *(_QWORD *)v128;
        do
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v128 != v36)
              objc_enumerationMutation(v34);
            v38 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * i);
            if (objc_msgSend(v38, "participantType") != 2)
            {
              objc_msgSend(v38, "URL");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "absoluteString");
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              if (v41)
              {
                if ((objc_msgSend(v38, "isEqualToParticipant:", v95) & 1) == 0)
                {
                  if (v101)
                  {
                    v42 = EKUIAvailabilitySearchHandle;
                    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v133 = v38;
                      _os_log_debug_impl(&dword_1A2318000, v42, OS_LOG_TYPE_DEBUG, "The event has a dirty date property, so we'll forcibly request availability for this participant: [%@]", buf, 0xCu);
                    }
                    goto LABEL_52;
                  }
                  if (objc_msgSend(v38, "participantStatus") == 3)
                  {
                    v44 = EKUIAvailabilitySearchHandle;
                    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v133 = v38;
                      _os_log_debug_impl(&dword_1A2318000, v44, OS_LOG_TYPE_DEBUG, "Attendee has declined: [%@]", buf, 0xCu);
                    }
                    objc_msgSend(v94, "addObject:", v38);
                  }
                  else if (!EKUIAttendeeUtils_AttendeeHasResponded(v38))
                  {
                    v45 = EKUIAvailabilitySearchHandle;
                    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v133 = v38;
                      _os_log_debug_impl(&dword_1A2318000, v45, OS_LOG_TYPE_DEBUG, "Attendee needs to respond: [%@]", buf, 0xCu);
                    }
LABEL_52:
                    objc_msgSend(v100, "addObject:", v41);
                  }
                  v46 = EKUIAvailabilitySearchHandle;
                  if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    v133 = v41;
                    v134 = 2112;
                    v135 = v38;
                    _os_log_debug_impl(&dword_1A2318000, v46, OS_LOG_TYPE_DEBUG, "Adding participant with address [%@] to the list of attendees to be included in conflict resolution.  Participant: [%@]", buf, 0x16u);
                  }
                  objc_msgSend(*(id *)(a1 + 32), "participantAddressesToParticipants");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "setObject:forKey:", v38, v41);

                }
              }
              else
              {
                v43 = EKUIAvailabilitySearchHandle;
                if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v133 = v38;
                  _os_log_error_impl(&dword_1A2318000, v43, OS_LOG_TYPE_ERROR, "No participant address found for participant: [%@].  Will not search use this participant to search for alternative times.", buf, 0xCu);
                }
              }

              goto LABEL_57;
            }
            v39 = EKUIAvailabilitySearchHandle;
            if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v133 = v38;
              _os_log_debug_impl(&dword_1A2318000, v39, OS_LOG_TYPE_DEBUG, "Will not consider attendee for conflict detection because it is a room: [%@]", buf, 0xCu);
            }
LABEL_57:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v48 = v38;
              objc_msgSend(v48, "proposedStartDateForEvent:", *v10);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              if (v49)
              {
                objc_msgSend(*(id *)(a1 + 32), "internalProposedStarts");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "addObject:", v49);

              }
            }
          }
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v127, v136, 16);
        }
        while (v35);
      }

      objc_msgSend(v95, "URL");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "absoluteString");
      v93 = (void *)objc_claimAutoreleasedReturnValue();

      v52 = os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG);
      if (v93)
      {
        if (v52)
          __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_12();
        objc_msgSend(*(id *)(a1 + 32), "setOrganizerAddress:", v93);
        objc_msgSend(*(id *)(a1 + 32), "participantAddressesToParticipants");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setObject:forKey:", v95, v93);

      }
      else
      {
        if (v52)
          __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_11();
        v54 = a1;
        if (*(_QWORD *)(a1 + 48))
        {
          objc_msgSend(*(id *)(a1 + 32), "setOrganizerAddress:");
          objc_msgSend((id)objc_opt_class(), "_selfOrganizerForNewlyScheduledEventWithAddress:", *(_QWORD *)(a1 + 48));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "participantAddressesToParticipants");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKey:", v55, *(_QWORD *)(a1 + 48));

        }
        else
        {
          if (!os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
            goto LABEL_74;
          __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_10();
        }
      }
      v54 = a1;
LABEL_74:
      if ((v101 & 1) != 0 || (v54 = a1, objc_msgSend(v100, "count")))
      {
        objc_initWeak((id *)buf, *(id *)(v54 + 32));
        v57 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v124[0] = MEMORY[0x1E0C809B0];
        v124[1] = 3221225472;
        v124[2] = __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_16;
        v124[3] = &unk_1E4785BD8;
        objc_copyWeak(&v126, (id *)buf);
        v58 = v57;
        v125 = v58;
        v99 = (void *)MEMORY[0x1A85849D4](v124);
        if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
          __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_5();
        v59 = [EKRequestAvailabilityOperation alloc];
        objc_msgSend(*(id *)(a1 + 32), "source");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "internalOriginalStartDate");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "internalOriginalEndDate");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "ignoredEventID");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        val = -[EKRequestAvailabilityOperation initWithSource:startDate:endDate:ignoredEventID:addresses:resultsBlock:](v59, "initWithSource:startDate:endDate:ignoredEventID:addresses:resultsBlock:", v60, v61, v62, v63, v100, v99);

        objc_initWeak(&location, val);
        v116[0] = MEMORY[0x1E0C809B0];
        v116[1] = 3221225472;
        v116[2] = __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_19;
        v116[3] = &unk_1E4785C28;
        objc_copyWeak(&v120, (id *)buf);
        objc_copyWeak(&v121, &location);
        v98 = v58;
        v117 = v98;
        v122 = v101;
        v64 = v94;
        v65 = a1;
        v66 = *(_QWORD *)(a1 + 32);
        v97 = v64;
        v118 = v64;
        v119 = v66;
        -[EKRequestAvailabilityOperation setCompletionBlock:](val, "setCompletionBlock:", v116);
        if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
        {
          __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_4();
          v65 = a1;
        }
        objc_msgSend(*(id *)(v65 + 32), "setAvailabilityRequestInProgress:", 1, &v126);
        objc_msgSend(*(id *)(v65 + 32), "availabilityRequestsQueue");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addOperation:", val);

        objc_msgSend(*(id *)(a1 + 32), "internalOriginalEndDate");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "internalOriginalStartDate");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "timeIntervalSinceDate:", v69);
        v71 = v70;

        v114 = 0u;
        v115 = 0u;
        v112 = 0u;
        v113 = 0u;
        obj = v87;
        v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v131, 16);
        if (v72)
        {
          v73 = *(_QWORD *)v113;
          do
          {
            for (j = 0; j != v72; ++j)
            {
              if (*(_QWORD *)v113 != v73)
                objc_enumerationMutation(obj);
              v75 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * j);
              v76 = [EKRequestAvailabilityOperation alloc];
              objc_msgSend(*(id *)(a1 + 32), "source");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "dateByAddingTimeInterval:", *(double *)&v71);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "ignoredEventID");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              v80 = -[EKRequestAvailabilityOperation initWithSource:startDate:endDate:ignoredEventID:addresses:resultsBlock:](v76, "initWithSource:startDate:endDate:ignoredEventID:addresses:resultsBlock:", v77, v75, v78, v79, v100, v99);

              objc_initWeak(&from, v80);
              v103[0] = MEMORY[0x1E0C809B0];
              v103[1] = 3221225472;
              v103[2] = __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_24;
              v103[3] = &unk_1E4785C78;
              objc_copyWeak(&v108, (id *)buf);
              objc_copyWeak(v109, &from);
              v104 = v98;
              v110 = v101;
              v105 = v97;
              v106 = v75;
              v109[1] = v71;
              v107 = *(_QWORD *)(a1 + 32);
              -[EKRequestAvailabilityOperation setCompletionBlock:](v80, "setCompletionBlock:", v103);
              objc_msgSend(*(id *)(a1 + 32), "availabilityRequestsQueue");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "addOperation:", v80);

              objc_destroyWeak(v109);
              objc_destroyWeak(&v108);
              objc_destroyWeak(&from);

            }
            v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v131, 16);
          }
          while (v72);
        }

        objc_destroyWeak(&v121);
        objc_destroyWeak(&v120);
        objc_destroyWeak(&location);

        objc_destroyWeak(v86);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
          __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_9();
        if (objc_msgSend(v94, "count"))
        {
          v82 = (void *)EKUIAvailabilitySearchHandle;
          if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
            __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_8(v82, v94);
          objc_msgSend(*(id *)(a1 + 32), "internalOriginalConflictedParticipants");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "addObjectsFromArray:", v94);

          objc_msgSend(*(id *)(a1 + 32), "_transitionToConflictFoundStateAndSearch");
        }
        else
        {
          v84 = objc_msgSend(*(id *)(a1 + 32), "noConflictRequired");
          v85 = os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG);
          if (v84)
          {
            if (v85)
              __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_6();
            objc_msgSend(*(id *)(a1 + 32), "_transitionToConflictFoundStateAndSearch");
          }
          else if (v85)
          {
            __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_7();
          }
        }
      }

      return;
    }
    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
      __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_15();
  }
  else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
  {
    __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_1();
  }
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "processingQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_2;
    v7[3] = &unk_1E47853B0;
    v8 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_19(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  char v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = v3;
  if (WeakRetained)
  {
    if (v3)
    {
      if ((objc_msgSend(v3, "isCancelled") & 1) == 0)
      {
        objc_msgSend(v4, "error");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "processingQueue");
        v6 = objc_claimAutoreleasedReturnValue();
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_20;
        v10[3] = &unk_1E4785C00;
        v11 = v5;
        v12 = WeakRetained;
        v13 = *(id *)(a1 + 32);
        v16 = *(_BYTE *)(a1 + 72);
        v7 = *(id *)(a1 + 40);
        v8 = *(_QWORD *)(a1 + 48);
        v14 = v7;
        v15 = v8;
        v9 = v5;
        dispatch_async(v6, v10);

      }
    }
    else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
    {
      __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_19_cold_2();
    }
  }
  else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
  {
    __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_19_cold_1();
  }

}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_20(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t);
  void *v22;
  uint64_t v23;
  id v24;

  v2 = a1 + 32;
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = EKUIAvailabilitySearchHandle;
    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
      __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_20_cold_5(v2, v3, v4, v5, v6, v7, v8, v9);
    objc_msgSend(*(id *)(a1 + 40), "setAvailabilityRequestInProgress:", 0);
    objc_msgSend(*(id *)(a1 + 40), "_haltSearchWithError:", 1);
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_21;
    v22 = &unk_1E4784F08;
    v11 = *(void **)(a1 + 48);
    v23 = *(_QWORD *)(a1 + 40);
    v12 = v10;
    v24 = v12;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", &v19);
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v13, "addObjectsFromArray:", v12, v19, v20, v21, v22, v23);
    if (!*(_BYTE *)(a1 + 72))
    {
      if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
        __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_20_cold_4();
      objc_msgSend(v13, "addObjectsFromArray:", *(_QWORD *)(a1 + 56));
    }
    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
      __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_20_cold_3();
    objc_msgSend(*(id *)(a1 + 40), "internalOriginalConflictedParticipants");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObjectsFromArray:", v13);

    objc_msgSend(*(id *)(a1 + 40), "originalRangeStartDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setNextAvailabilityRangeStartDate:", v15);

    objc_msgSend(*(id *)(a1 + 40), "setAvailabilityRequestInProgress:", 0);
    v16 = objc_msgSend(v13, "count");
    v17 = objc_msgSend(*(id *)(a1 + 64), "noConflictRequired");
    v18 = os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG);
    if ((v17 & 1) != 0 || v16)
    {
      if (v18)
        __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_20_cold_1();
      objc_msgSend(*(id *)(a1 + 40), "_transitionToConflictFoundStateAndSearch");
    }
    else if (v18)
    {
      __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_20_cold_2();
    }

  }
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_21(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;

  v5 = a2;
  if (+[EKAvailabilityUtilities spansIncludeBusyPeriod:](EKAvailabilityUtilities, "spansIncludeBusyPeriod:", a3))
  {
    objc_msgSend(*(id *)(a1 + 32), "_participantforParticipantAddress:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
        __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_21_cold_2();
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    }
    else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
    {
      __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_21_cold_1();
    }

  }
  else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
  {
    __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_21_cold_3();
  }

}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_24(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  uint64_t v14;
  char v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = objc_loadWeakRetained((id *)(a1 + 72));
  v4 = v3;
  if (WeakRetained)
  {
    if (v3)
    {
      if ((objc_msgSend(v3, "isCancelled") & 1) == 0)
      {
        objc_msgSend(v4, "error");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "processingQueue");
        v6 = objc_claimAutoreleasedReturnValue();
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_25;
        v8[3] = &unk_1E4785C50;
        v9 = v5;
        v10 = WeakRetained;
        v11 = *(id *)(a1 + 32);
        v15 = *(_BYTE *)(a1 + 88);
        v12 = *(id *)(a1 + 40);
        v14 = *(_QWORD *)(a1 + 80);
        v13 = *(_OWORD *)(a1 + 48);
        v7 = v5;
        dispatch_async(v6, v8);

      }
    }
    else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
    {
      __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_19_cold_2();
    }
  }
  else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
  {
    __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_19_cold_1();
  }

}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_25(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  EKInviteeAlternativeTime *v14;
  void *v15;
  void *v16;
  EKInviteeAlternativeTime *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t);
  void *v22;
  uint64_t v23;
  id v24;

  v2 = a1 + 32;
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = EKUIAvailabilitySearchHandle;
    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
      __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_20_cold_5(v2, v3, v4, v5, v6, v7, v8, v9);
    objc_msgSend(*(id *)(a1 + 40), "setAvailabilityRequestInProgress:", 0);
    objc_msgSend(*(id *)(a1 + 40), "_haltSearchWithError:", 1);
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_26;
    v22 = &unk_1E4784F08;
    v11 = *(void **)(a1 + 48);
    v23 = *(_QWORD *)(a1 + 40);
    v12 = v10;
    v24 = v12;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", &v19);
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v13, "addObjectsFromArray:", v12, v19, v20, v21, v22, v23);
    if (!*(_BYTE *)(a1 + 88))
    {
      if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
        __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_20_cold_4();
      objc_msgSend(v13, "addObjectsFromArray:", *(_QWORD *)(a1 + 56));
    }
    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
      __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_20_cold_3();
    v14 = [EKInviteeAlternativeTime alloc];
    v15 = *(void **)(a1 + 64);
    objc_msgSend(v15, "dateByAddingTimeInterval:", *(double *)(a1 + 80));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[EKInviteeAlternativeTime initWithStartDate:endDate:conflictedParticipants:](v14, "initWithStartDate:endDate:conflictedParticipants:", v15, v16, v13);

    objc_msgSend(*(id *)(a1 + 72), "internalProposedTimes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v17);

    objc_msgSend(*(id *)(a1 + 72), "_sendStateChange:", 2);
    objc_msgSend(*(id *)(a1 + 40), "setAvailabilityRequestInProgress:", 0);

  }
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_26(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;

  v5 = a2;
  if (+[EKAvailabilityUtilities spansIncludeBusyPeriod:](EKAvailabilityUtilities, "spansIncludeBusyPeriod:", a3))
  {
    objc_msgSend(*(id *)(a1 + 32), "_participantforParticipantAddress:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
        __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_21_cold_2();
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    }
    else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
    {
      __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_26_cold_1();
    }

  }
  else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
  {
    __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_21_cold_3();
  }

}

+ (id)stateAsString:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Unknown");
  else
    return off_1E4785DA0[a3];
}

- (void)_attemptSearch
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "A search attempt was requested.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__EKInviteeAlternativeTimeSearcher__attemptSearch__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "processingQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__EKInviteeAlternativeTimeSearcher__attemptSearch__block_invoke_2;
    v7[3] = &unk_1E47853B0;
    v8 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __50__EKInviteeAlternativeTimeSearcher__attemptSearch__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));
}

void __50__EKInviteeAlternativeTimeSearcher__attemptSearch__block_invoke_3(id *a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v3 = objc_loadWeakRetained(a1 + 8);
  if (v3)
  {
    if (WeakRetained)
    {
      if (objc_msgSend(WeakRetained, "isCancelled"))
      {
        if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
          __50__EKInviteeAlternativeTimeSearcher__attemptSearch__block_invoke_3_cold_3();
      }
      else
      {
        objc_msgSend(WeakRetained, "error");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "processingQueue");
        v5 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __50__EKInviteeAlternativeTimeSearcher__attemptSearch__block_invoke_38;
        block[3] = &unk_1E4785CA0;
        block[4] = v3;
        v8 = v4;
        v9 = a1[4];
        v10 = a1[5];
        v11 = a1[6];
        v6 = v4;
        dispatch_async(v5, block);

      }
    }
    else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
    {
      __50__EKInviteeAlternativeTimeSearcher__attemptSearch__block_invoke_3_cold_2();
    }
  }
  else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
  {
    __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_19_cold_1();
  }

}

uint64_t __50__EKInviteeAlternativeTimeSearcher__attemptSearch__block_invoke_38(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "setAvailabilityRequestInProgress:", 0);
  if (*(_QWORD *)(a1 + 40))
  {
    v2 = EKUIAvailabilitySearchHandle;
    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
      __50__EKInviteeAlternativeTimeSearcher__attemptSearch__block_invoke_38_cold_1(a1 + 40, v2, v3, v4, v5, v6, v7, v8);
    return objc_msgSend(*(id *)(a1 + 32), "_attemptSearch");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setNextAvailabilityRangeStartDate:", *(_QWORD *)(a1 + 48));
    return objc_msgSend(*(id *)(a1 + 32), "_processResults:betweenStartDate:endDate:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
  }
}

- (void)_resetSearchFallbackNumbers
{
  NSObject *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_16(a1);
  objc_msgSend(v2, "numberWithUnsignedInteger:", OUTLINED_FUNCTION_21());
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15();
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_0(&dword_1A2318000, v1, v5, "Resetting search fallback numbers.  Current remaining search attempts: [%@].  Current availability search duration multiplier: [%@]", v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)_sendStateChange:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[EKInviteeAlternativeTimeSearcher callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__EKInviteeAlternativeTimeSearcher__sendStateChange___block_invoke;
  v6[3] = &unk_1E4785A88;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

void __53__EKInviteeAlternativeTimeSearcher__sendStateChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);

  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "stateChanged");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)EKUIAvailabilitySearchHandle;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
      __53__EKInviteeAlternativeTimeSearcher__sendStateChange___block_invoke_cold_2(v2, v4, a1);
    objc_msgSend(*(id *)(a1 + 32), "stateChanged");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, *(_QWORD *)(a1 + 40));

  }
  else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
  {
    __53__EKInviteeAlternativeTimeSearcher__sendStateChange___block_invoke_cold_1(v2, v4, a1);
  }
}

- (void)_transitionToConflictFoundStateAndSearch
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend((id)objc_opt_class(), "stateAsString:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A2318000, v1, v3, "Transitioning to the [%@] state and attempting a search.", v4);

  OUTLINED_FUNCTION_4_0();
}

- (id)_participantforParticipantAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[EKInviteeAlternativeTimeSearcher participantAddressesToParticipants](self, "participantAddressesToParticipants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    EKUtils_AdjustedAttendeeAddress(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKInviteeAlternativeTimeSearcher participantAddressesToParticipants](self, "participantAddressesToParticipants");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)_processResults:(id)a3 betweenStartDate:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  unint64_t v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = EKUIAvailabilitySearchHandle;
  if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v39 = v9;
    v40 = 2112;
    v41 = v10;
    v42 = 2112;
    v43 = v8;
    _os_log_debug_impl(&dword_1A2318000, v11, OS_LOG_TYPE_DEBUG, "Processing results - start date: [%@] end date: [%@] results: [%@]", buf, 0x20u);
  }
  v35 = v9;
  v36 = v8;
  v34 = v10;
  -[EKInviteeAlternativeTimeSearcher _generateTimeSpansForResults:betweenStartDate:endDate:](self, "_generateTimeSpansForResults:betweenStartDate:endDate:", v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKInviteeAlternativeTimeSearcher leftoverSpans](self, "leftoverSpans");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKInviteeAlternativeTimeSearcher _spliceLeftTimeSpans:andNewTimeSpans:](self, "_spliceLeftTimeSpans:andNewTimeSpans:", v13, v12);
  v14 = objc_claimAutoreleasedReturnValue();

  v33 = (void *)v14;
  -[EKInviteeAlternativeTimeSearcher _mergeAdjacentSpansWithSameConflictedParticipants:](self, "_mergeAdjacentSpansWithSameConflictedParticipants:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKInviteeAlternativeTimeSearcher _generateOpenFreeTimesFromTimeSpans:](self, "_generateOpenFreeTimesFromTimeSpans:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKInviteeAlternativeTimeSearcher _generateNonOptimalTimesFromTimeSpans:](self, "_generateNonOptimalTimesFromTimeSpans:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_findLeftoverSpans:usingFreeTimes:andNonOptimalTimes:", v12, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  -[EKInviteeAlternativeTimeSearcher leftoverSpans](self, "leftoverSpans");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)v18;
  objc_msgSend(v19, "setArray:", v18);

  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __77__EKInviteeAlternativeTimeSearcher__processResults_betweenStartDate_endDate___block_invoke;
  v37[3] = &unk_1E4785CF0;
  v37[4] = self;
  v20 = (void *)MEMORY[0x1A85849D4](v37);
  objc_msgSend(v16, "indexesOfObjectsPassingTest:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "indexesOfObjectsPassingTest:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKInviteeAlternativeTimeSearcher internalTimesWhenAllAttendeesCanAttend](self, "internalTimesWhenAllAttendeesCanAttend");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectsAtIndexes:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObjectsFromArray:", v24);

  -[EKInviteeAlternativeTimeSearcher internalTimesWhenSomeAttendeesCanAttend](self, "internalTimesWhenSomeAttendeesCanAttend");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectsAtIndexes:", v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObjectsFromArray:", v26);

  if (-[EKInviteeAlternativeTimeSearcher internalSearchingForMoreTimesWhenAllAttendeesCanAttend](self, "internalSearchingForMoreTimesWhenAllAttendeesCanAttend")&& objc_msgSend(v16, "count"))
  {
    -[EKInviteeAlternativeTimeSearcher setInternalSearchingForMoreTimesWhenAllAttendeesCanAttend:](self, "setInternalSearchingForMoreTimesWhenAllAttendeesCanAttend:", 0);
    v27 = 1;
  }
  else
  {
    v27 = 0;
  }
  if (-[EKInviteeAlternativeTimeSearcher internalSearchingForMoreTimesWhenSomeAttendeesCanAttend](self, "internalSearchingForMoreTimesWhenSomeAttendeesCanAttend")&& objc_msgSend(v17, "count"))
  {
    -[EKInviteeAlternativeTimeSearcher setInternalSearchingForMoreTimesWhenSomeAttendeesCanAttend:](self, "setInternalSearchingForMoreTimesWhenSomeAttendeesCanAttend:", 0);
  }
  else if (!v27)
  {
    goto LABEL_14;
  }
  v28 = (void *)EKUIAvailabilitySearchHandle;
  if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
    -[EKInviteeAlternativeTimeSearcher _processResults:betweenStartDate:endDate:].cold.4(v28, v16, v17);
  -[EKInviteeAlternativeTimeSearcher _sendStateChange:](self, "_sendStateChange:", 2);
  LOBYTE(v27) = 1;
LABEL_14:
  if (!-[EKInviteeAlternativeTimeSearcher internalSearchingForMoreTimesWhenAllAttendeesCanAttend](self, "internalSearchingForMoreTimesWhenAllAttendeesCanAttend")&& !-[EKInviteeAlternativeTimeSearcher internalSearchingForMoreTimesWhenSomeAttendeesCanAttend](self, "internalSearchingForMoreTimesWhenSomeAttendeesCanAttend"))
  {
    if ((v27 & 1) == 0)
    {
      CalAnalyticsSendEvent();
      if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
        -[EKInviteeAlternativeTimeSearcher _processResults:betweenStartDate:endDate:].cold.3();
    }
    goto LABEL_25;
  }
  v29 = -[EKInviteeAlternativeTimeSearcher remainingSearchAttempts](self, "remainingSearchAttempts");
  v30 = (void *)EKUIAvailabilitySearchHandle;
  v31 = os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG);
  if (!v29)
  {
    if (v31)
      -[EKInviteeAlternativeTimeSearcher _processResults:betweenStartDate:endDate:].cold.1();
LABEL_25:
    -[EKInviteeAlternativeTimeSearcher _haltSearchWithError:](self, "_haltSearchWithError:", 0);
    goto LABEL_26;
  }
  if (v31)
    -[EKInviteeAlternativeTimeSearcher _processResults:betweenStartDate:endDate:].cold.2(v30, self);
  -[EKInviteeAlternativeTimeSearcher _attemptSearch](self, "_attemptSearch");
LABEL_26:

}

uint64_t __77__EKInviteeAlternativeTimeSearcher__processResults_betweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(a2, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "originalRangeStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "CalIsBeforeDate:", v4);

  return v5 ^ 1u;
}

- (void)_haltSearchWithError:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;

  v3 = a3;
  if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
    -[EKInviteeAlternativeTimeSearcher _haltSearchWithError:].cold.1();
  -[EKInviteeAlternativeTimeSearcher setInternalSearchingForMoreTimesWhenAllAttendeesCanAttend:](self, "setInternalSearchingForMoreTimesWhenAllAttendeesCanAttend:", 0);
  -[EKInviteeAlternativeTimeSearcher setInternalSearchingForMoreTimesWhenSomeAttendeesCanAttend:](self, "setInternalSearchingForMoreTimesWhenSomeAttendeesCanAttend:", 0);
  if (v3)
    v5 = 3;
  else
    v5 = 2;
  -[EKInviteeAlternativeTimeSearcher _sendStateChange:](self, "_sendStateChange:", v5);
}

+ (id)_findLeftoverSpans:(id)a3 usingFreeTimes:(id)a4 andNonOptimalTimes:(id)a5
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;

  v7 = a3;
  v8 = (objc_class *)MEMORY[0x1E0C99DE8];
  v9 = a5;
  v10 = a4;
  v11 = objc_alloc_init(v8);
  objc_msgSend(v10, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v13;
  v17 = v16;
  if (v16)
  {
    v18 = v16;
    if (v15)
    {
      v18 = v16;
      if ((objc_msgSend(v16, "CalIsAfterDate:", v15) & 1) == 0)
      {
        v18 = v15;

      }
    }
  }
  else
  {
    v18 = v15;
    if (!v18)
      goto LABEL_12;
  }
  v19 = objc_msgSend((id)objc_opt_class(), "_binarySearchForIndexOfTimeSpanInArray:containingDate:", v7, v18);
  if (v19 == objc_msgSend((id)objc_opt_class(), "_invalidBinarySearchIndex"))
  {
    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
      +[EKInviteeAlternativeTimeSearcher _findLeftoverSpans:usingFreeTimes:andNonOptimalTimes:].cold.1();
  }
  else
  {
    objc_msgSend(v7, "objectAtIndex:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v21, "setStartDate:", v18);
    objc_msgSend(v11, "addObject:", v21);
    v22 = objc_msgSend(v7, "count") + ~v19;
    if (v22)
    {
      objc_msgSend(v7, "subarrayWithRange:", v19 + 1, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObjectsFromArray:", v23);

    }
  }
LABEL_12:
  +[EKDebugPreferences shared](EKDebugPreferences, "shared");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "verifyIntegrityOfAvailabilityTimeSearchTimelines");

  if (v25)
    objc_msgSend((id)objc_opt_class(), "_validateSpans:", v11);

  return v11;
}

+ (id)_addressesForParticipants:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (v3 && objc_msgSend(v3, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "participant", (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "URL");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "absoluteString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            objc_msgSend(v4, "addObject:", v12);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  return v4;
}

+ (BOOL)_span:(id)a3 hasSameConflictedParticipantsAsSpan:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  char v15;
  char v16;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_class();
  objc_msgSend(v6, "conflictedParticipants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_addressesForParticipants:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_class();
  objc_msgSend(v5, "conflictedParticipants");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_addressesForParticipants:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v13 = objc_msgSend(v9, "count") == 0;
    if (!v12)
      goto LABEL_14;
  }
  else
  {
    v13 = 1;
    if (!v12)
      goto LABEL_14;
  }
  v14 = objc_msgSend(v12, "count");
  if (v14)
    v15 = 0;
  else
    v15 = v13;
  if (v14)
    v16 = v13;
  else
    v16 = 1;
  if ((v16 & 1) != 0)
    v13 = v15;
  else
    v13 = objc_msgSend(v9, "isEqualToSet:", v12);
LABEL_14:

  return v13;
}

+ (id)_allButLastItemInArray:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "count");
    if (v5 > 1)
      objc_msgSend(v4, "subarrayWithRange:", 0, v5 - 1);
    else
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_allButFirstItemInArray:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "count");
    if (v5 > 1)
      objc_msgSend(v4, "subarrayWithRange:", 1, v5 - 1);
    else
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_spliceLeftTimeSpans:(id)a3 andNewTimeSpans:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  EKInviteeTimeSpan *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "conflictedParticipants");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    objc_msgSend(v9, "conflictedParticipants");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count") == 0;

    if ((((v11 != 0) ^ v13) & 1) != 0
      && (!v11 || objc_msgSend((id)objc_opt_class(), "_span:hasSameConflictedParticipantsAsSpan:", v8, v9)))
    {
      objc_msgSend((id)objc_opt_class(), "_allButLastItemInArray:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v14);
      v15 = objc_alloc_init(EKInviteeTimeSpan);
      objc_msgSend(v8, "startDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKInviteeTimeSpan setStartDate:](v15, "setStartDate:", v16);

      objc_msgSend(v9, "endDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKInviteeTimeSpan setEndDate:](v15, "setEndDate:", v17);

      objc_msgSend(v8, "conflictedParticipants");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKInviteeTimeSpan setConflictedParticipants:](v15, "setConflictedParticipants:", v18);

      objc_msgSend(v7, "addObject:", v15);
      objc_msgSend((id)objc_opt_class(), "_allButFirstItemInArray:", v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v19);

    }
    else
    {
      objc_msgSend(v7, "addObjectsFromArray:", v5);
      objc_msgSend(v7, "addObjectsFromArray:", v6);
    }

  }
  else
  {
    objc_msgSend(v7, "addObjectsFromArray:", v6);
  }
  +[EKDebugPreferences shared](EKDebugPreferences, "shared");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "verifyIntegrityOfAvailabilityTimeSearchTimelines");

  if (v21)
    objc_msgSend((id)objc_opt_class(), "_validateSpans:", v7);

  return v7;
}

- (id)_mergeAdjacentSpansWithSameConflictedParticipants:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v3 && objc_msgSend(v3, "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (v8
            && objc_msgSend((id)objc_opt_class(), "_span:hasSameConflictedParticipantsAsSpan:", v11, v8, (_QWORD)v17))
          {
            objc_msgSend(v11, "endDate");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setEndDate:", v12);

          }
          else
          {
            v13 = v11;

            objc_msgSend(v4, "addObject:", v13);
            v8 = v13;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }

  }
  +[EKDebugPreferences shared](EKDebugPreferences, "shared", (_QWORD)v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "verifyIntegrityOfAvailabilityTimeSearchTimelines");

  if (v15)
    objc_msgSend((id)objc_opt_class(), "_validateSpans:", v4);

  return v4;
}

- (id)_generateOpenFreeTimesFromTimeSpans:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  unint64_t v22;
  void *j;
  uint64_t v24;
  EKInviteeAlternativeTime *v25;
  void *v26;
  EKInviteeAlternativeTime *v27;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EKInviteeAlternativeTimeSearcher internalOriginalEndDate](self, "internalOriginalEndDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKInviteeAlternativeTimeSearcher internalOriginalStartDate](self, "internalOriginalStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v32;
    v29 = *(_QWORD *)v32;
    v30 = v10;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v15, "conflictedParticipants", v29, v30, (_QWORD)v31);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (!v17)
        {
          objc_msgSend(v15, "endDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "startDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "timeIntervalSinceDate:", v19);
          v21 = v20;

          if (v21 >= v9)
          {
            v22 = (unint64_t)(v21 / v9);
            objc_msgSend(v15, "startDate");
            for (j = (void *)objc_claimAutoreleasedReturnValue(); v22; --v22)
            {
              objc_msgSend(j, "dateByAddingTimeInterval:", v9);
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = [EKInviteeAlternativeTime alloc];
              objc_msgSend(v15, "conflictedParticipants");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = -[EKInviteeAlternativeTime initWithStartDate:endDate:conflictedParticipants:](v25, "initWithStartDate:endDate:conflictedParticipants:", j, v24, v26);

              objc_msgSend(v5, "addObject:", v27);
              j = (void *)v24;
            }

            v13 = v29;
            v10 = v30;
          }
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v12);
  }

  return v5;
}

+ (void)_insertUniqueParticipants:(id)a3 intoExistingParticipantsArray:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
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
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v13, "participant");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "URL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "absoluteString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
          objc_msgSend(v7, "setObject:forKey:", v13, v16);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v10);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = v6;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
        objc_msgSend(v22, "participant", (_QWORD)v27);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "URL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "absoluteString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
          objc_msgSend(v7, "setObject:forKey:", v22, v25);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v19);
  }

  objc_msgSend(v7, "allValues");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setArray:", v26);

}

- (id)_generateNonOptimalTimesFromTimeSpans:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  EKInviteeTimeSpan *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  unint64_t v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  EKInviteeAlternativeTime *v51;
  void *v52;
  void *v53;
  void *v54;
  EKInviteeAlternativeTime *v55;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  EKInviteeAlternativeTimeSearcher *v64;
  void *v65;
  void *v66;
  unint64_t v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v60 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EKInviteeAlternativeTimeSearcher internalOriginalEndDate](self, "internalOriginalEndDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = self;
  -[EKInviteeAlternativeTimeSearcher internalOriginalStartDate](self, "internalOriginalStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;

  objc_msgSend(v4, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v9;
  objc_msgSend(v9, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v10;
  objc_msgSend(v10, "endDate");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v11;
  v66 = v4;
  v67 = objc_msgSend(v4, "count");
  v59 = v13;
  v61 = (void *)v12;
  if (objc_msgSend(v13, "CalIsBeforeDate:", v12) && v67)
  {
    v14 = 0;
    v15 = v13;
    while (1)
    {
      objc_msgSend(v15, "dateByAddingTimeInterval:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "CalIsAfterDate:", v12))
      {

        v13 = v15;
        break;
      }
      v17 = objc_alloc_init(EKInviteeTimeSpan);
      -[EKInviteeTimeSpan setStartDate:](v17, "setStartDate:", v15);
      v18 = v16;
      -[EKInviteeTimeSpan setEndDate:](v17, "setEndDate:", v16);
      objc_msgSend(v66, "objectAtIndex:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v19, "conflictedParticipants");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v20, "initWithArray:", v21);

      -[EKInviteeTimeSpan endDate](v17, "endDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "endDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqualToDate:", v24);

      v62 = v19;
      if (v25)
      {
        ++v14;
      }
      else
      {
        -[EKInviteeTimeSpan endDate](v17, "endDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "endDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v28, "CalIsAfterDate:", v29);

        if (v30)
        {
          v31 = v14 + 1;
          if (v14 + 1 < v67)
          {
            v32 = v14;
            v33 = v14 + 1;
            v13 = v18;
            while (1)
            {
              objc_msgSend(v66, "objectAtIndex:", v31);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "startDate");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v35, "CalIsBeforeDate:", v13);

              if (!v36)
                break;
              v37 = (void *)objc_opt_class();
              objc_msgSend(v34, "conflictedParticipants");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "_insertUniqueParticipants:intoExistingParticipantsArray:", v38, v22);

              objc_msgSend(v34, "endDate");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v38) = objc_msgSend(v39, "isEqualToDate:", v13);

              if ((_DWORD)v38)
              {
                v31 = v32 + 2;
                break;
              }
              objc_msgSend(v34, "endDate");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v40, "CalIsAfterDate:", v13);

              v14 = v32 + 1;
              if ((v41 & 1) == 0)
              {
                v31 = v33++;
                v42 = v32 + 2;
                ++v32;
                if (v42 < v67)
                  continue;
              }
              goto LABEL_8;
            }

            v14 = v31;
            goto LABEL_8;
          }
        }
      }
      v13 = v18;
LABEL_8:
      -[EKInviteeTimeSpan setConflictedParticipants:](v17, "setConflictedParticipants:", v22);
      -[EKInviteeTimeSpan conflictedParticipants](v17, "conflictedParticipants");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

      if (v27)
        objc_msgSend(v60, "addObject:", v17);

      v12 = (uint64_t)v61;
      if (objc_msgSend(v13, "CalIsBeforeDate:", v61))
      {
        v15 = v13;
        if (v14 < v67)
          continue;
      }
      break;
    }
  }
  v68 = v13;
  -[EKInviteeAlternativeTimeSearcher _filterOutUnreasonableTimeSlots:](v64, "_filterOutUnreasonableTimeSlots:", v60);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_rankNonOptimalTimeSpans:", v63);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_findHighestRankedNonOptimalTimeSpans:", v65);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v45 = v43;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v70 != v48)
          objc_enumerationMutation(v45);
        v50 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        v51 = [EKInviteeAlternativeTime alloc];
        objc_msgSend(v50, "startDate");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "endDate");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "conflictedParticipants");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = -[EKInviteeAlternativeTime initWithStartDate:endDate:conflictedParticipants:](v51, "initWithStartDate:endDate:conflictedParticipants:", v52, v53, v54);

        objc_msgSend(v44, "addObject:", v55);
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
    }
    while (v47);
  }

  return v44;
}

- (id)_filterOutUnreasonableTimeSlots:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  if (!a3)
    return 0;
  v4 = a3;
  -[EKInviteeAlternativeTimeSearcher participantAddressesToParticipants](self, "participantAddressesToParticipants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__EKInviteeAlternativeTimeSearcher__filterOutUnreasonableTimeSlots___block_invoke;
  v11[3] = &__block_descriptor_40_e34_B32__0__EKInviteeTimeSpan_8Q16_B24l;
  v11[4] = v7;
  objc_msgSend(v4, "indexesOfObjectsPassingTest:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsAtIndexes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

BOOL __68__EKInviteeAlternativeTimeSearcher__filterOutUnreasonableTimeSlots___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _BOOL8 v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "conflictedParticipants", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "participant");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "URL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "absoluteString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = v13 != objc_msgSend(v4, "count");
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

+ (id)_findHighestRankedNonOptimalTimeSpans:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") <= 0x14)
  {
    v4 = v3;
LABEL_20:
    v17 = v4;
    goto LABEL_21;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v6)
  {

LABEL_19:
    objc_msgSend(v5, "subarrayWithRange:", 0, 20, (_QWORD)v25);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v7 = v6;
  v8 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v26;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v26 != v10)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      objc_msgSend(v12, "conflictedParticipants", (_QWORD)v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v8 == v14)
      {
        ++v9;
      }
      else if (v8)
      {
        goto LABEL_13;
      }
      objc_msgSend(v12, "conflictedParticipants");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v15, "count");

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  }
  while (v7);
LABEL_13:

  if (v9 <= 0x14)
    goto LABEL_19;
  v16 = (void *)objc_msgSend(v5, "mutableCopy");
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = -20;
  do
  {
    v19 = arc4random();
    v20 = v19 % objc_msgSend(v16, "count");
    objc_msgSend(v16, "objectAtIndex:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v21);
    objc_msgSend(v16, "removeObjectAtIndex:", v20);

  }
  while (!__CFADD__(v18++, 1));

LABEL_21:
  objc_msgSend(v17, "sortedArrayWithOptions:usingComparator:", 16, &__block_literal_global_28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

uint64_t __74__EKInviteeAlternativeTimeSearcher__findHighestRankedNonOptimalTimeSpans___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (id)_rankNonOptimalTimeSpans:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayWithOptions:usingComparator:", 16, &__block_literal_global_48);
}

uint64_t __61__EKInviteeAlternativeTimeSearcher__rankNonOptimalTimeSpans___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "conflictedParticipants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "conflictedParticipants");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(v5, "conflictedParticipants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v5, "conflictedParticipants");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

  }
  else
  {
    v11 = 0;
  }

  if (v8 >= v11)
  {
    if (v8 > v11)
    {
      v12 = 1;
    }
    else
    {
      objc_msgSend(v4, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v13, "compare:", v14);

    }
  }
  else
  {
    v12 = -1;
  }

  return v12;
}

- (id)_generateTimeSpansForResults:(id)a3 betweenStartDate:(id)a4 endDate:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  EKInviteeTimeSpan *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  EKInviteeAlternativeTimeSearcher *v23;
  id v24;

  v8 = (objc_class *)MEMORY[0x1E0C99DE8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(v8);
  v13 = objc_alloc_init(EKInviteeTimeSpan);
  -[EKInviteeTimeSpan setStartDate:](v13, "setStartDate:", v10);

  -[EKInviteeTimeSpan setEndDate:](v13, "setEndDate:", v9);
  objc_msgSend(v12, "addObject:", v13);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __90__EKInviteeAlternativeTimeSearcher__generateTimeSpansForResults_betweenStartDate_endDate___block_invoke;
  v22 = &unk_1E4784F08;
  v23 = self;
  v14 = v12;
  v24 = v14;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", &v19);

  +[EKDebugPreferences shared](EKDebugPreferences, "shared", v19, v20, v21, v22, v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v15, "verifyIntegrityOfAvailabilityTimeSearchTimelines");

  if ((_DWORD)v9)
    objc_msgSend((id)objc_opt_class(), "_validateSpans:", v14);
  v16 = v24;
  v17 = v14;

  return v17;
}

void __90__EKInviteeAlternativeTimeSearcher__generateTimeSpansForResults_betweenStartDate_endDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_participantforParticipantAddress:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[EKParticipantForSorting participantForSortingWithEKParticipant:](EKParticipantForSorting, "participantForSortingWithEKParticipant:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __90__EKInviteeAlternativeTimeSearcher__generateTimeSpansForResults_betweenStartDate_endDate___block_invoke_50;
    v10[3] = &unk_1E4785D58;
    v11 = *(id *)(a1 + 40);
    v12 = v8;
    v13 = *(_QWORD *)(a1 + 32);
    v9 = v8;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  }
  else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
  {
    __90__EKInviteeAlternativeTimeSearcher__generateTimeSpansForResults_betweenStartDate_endDate___block_invoke_cold_1();
  }

}

void __90__EKInviteeAlternativeTimeSearcher__generateTimeSpansForResults_betweenStartDate_endDate___block_invoke_50(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  EKInviteeTimeSpan *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  EKInviteeTimeSpan *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  EKInviteeTimeSpan *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  int v50;
  EKInviteeTimeSpan *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  unint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[2];

  v66[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToDate:", v5);

  if (v6)
  {
    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
      __90__EKInviteeAlternativeTimeSearcher__generateTimeSpansForResults_betweenStartDate_endDate___block_invoke_50_cold_1();
  }
  else if (+[EKAvailabilityUtilities showTypeAsBusy:](EKAvailabilityUtilities, "showTypeAsBusy:", objc_msgSend(v3, "type")))
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "CalIsBeforeDate:", v10);

    if (v11)
    {
      v12 = objc_alloc_init(EKInviteeTimeSpan);
      objc_msgSend(v3, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKInviteeTimeSpan setStartDate:](v12, "setStartDate:", v13);

      objc_msgSend(v7, "startDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKInviteeTimeSpan setEndDate:](v12, "setEndDate:", v14);

      -[EKInviteeTimeSpan conflictedParticipants](v12, "conflictedParticipants");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObjectsFromArray:", v16);

      objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v12, 0);
    }
    objc_msgSend(v3, "endDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "CalIsAfterDate:", v18);

    if (v19)
    {
      v20 = objc_alloc_init(EKInviteeTimeSpan);
      objc_msgSend(v8, "endDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKInviteeTimeSpan setStartDate:](v20, "setStartDate:", v21);

      objc_msgSend(v3, "endDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKInviteeTimeSpan setEndDate:](v20, "setEndDate:", v22);

      -[EKInviteeTimeSpan conflictedParticipants](v20, "conflictedParticipants");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObjectsFromArray:", v24);

      objc_msgSend(*(id *)(a1 + 32), "addObject:", v20);
    }
    v25 = (void *)objc_opt_class();
    v26 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "startDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v25, "_binarySearchForIndexOfTimeSpanInArray:containingDate:", v26, v27);

    if (v28 == objc_msgSend((id)objc_opt_class(), "_invalidBinarySearchIndex"))
    {
      v29 = (void *)EKUIAvailabilitySearchHandle;
      if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
        __90__EKInviteeAlternativeTimeSearcher__generateTimeSpansForResults_betweenStartDate_endDate___block_invoke_50_cold_2(v29, v3);
    }
    else
    {
      v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v30 = objc_msgSend(*(id *)(a1 + 32), "count");
      v61 = v30 - v28;
      v62 = a1;
      if (v30 <= v28)
      {
        v31 = 0;
      }
      else
      {
        v59 = v8;
        v60 = v7;
        v31 = 0;
        while (1)
        {
          objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v28 + v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "endDate");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "startDate");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v33, "CalIsBeforeOrSameAsDate:", v34);

          if (v35)
            break;
          objc_msgSend(v32, "startDate");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "endDate");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "startDate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "startDate");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v38, "CalIsAfterDate:", v39);

          if (v40)
          {
            v41 = objc_alloc_init(EKInviteeTimeSpan);
            objc_msgSend(v32, "startDate");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKInviteeTimeSpan setStartDate:](v41, "setStartDate:", v42);

            objc_msgSend(v3, "startDate");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKInviteeTimeSpan setEndDate:](v41, "setEndDate:", v43);

            -[EKInviteeTimeSpan conflictedParticipants](v41, "conflictedParticipants");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "conflictedParticipants");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "addObjectsFromArray:", v45);

            v46 = v63;
            objc_msgSend(v63, "addObject:", v41);
            objc_msgSend(v3, "startDate");
            v47 = objc_claimAutoreleasedReturnValue();

            v36 = (void *)v47;
          }
          else
          {
            v46 = v63;
          }
          objc_msgSend(v46, "addObject:", v32);
          objc_msgSend(v3, "endDate");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "endDate");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v48, "CalIsBeforeDate:", v49);

          if (v50)
          {
            v51 = objc_alloc_init(EKInviteeTimeSpan);
            objc_msgSend(v3, "endDate");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKInviteeTimeSpan setStartDate:](v51, "setStartDate:", v52);

            objc_msgSend(v32, "endDate");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKInviteeTimeSpan setEndDate:](v51, "setEndDate:", v53);

            -[EKInviteeTimeSpan conflictedParticipants](v51, "conflictedParticipants");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "conflictedParticipants");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "addObjectsFromArray:", v55);

            objc_msgSend(v46, "addObject:", v51);
            objc_msgSend(v3, "endDate");
            v56 = objc_claimAutoreleasedReturnValue();

            v37 = (void *)v56;
          }
          ++v31;
          objc_msgSend(v32, "setStartDate:", v36);
          objc_msgSend(v32, "setEndDate:", v37);
          objc_msgSend(v32, "conflictedParticipants");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          a1 = v62;
          v64 = *(_QWORD *)(v62 + 40);
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "addObjectsFromArray:", v58);

          if (v61 == v31)
          {
            v31 = v61;
            goto LABEL_24;
          }
        }

LABEL_24:
        v8 = v59;
        v7 = v60;
      }
      if (objc_msgSend(v63, "count"))
      {
        objc_msgSend(*(id *)(v62 + 32), "replaceObjectsInRange:withObjectsFromArray:", v28, v31, v63);
      }
      else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
      {
        __90__EKInviteeAlternativeTimeSearcher__generateTimeSpansForResults_betweenStartDate_endDate___block_invoke_50_cold_3();
      }

    }
  }

}

+ (int64_t)_binarySearchForIndexOfTimeSpanInArray:(id)a3 containingDate:(id)a4
{
  id v5;
  id v6;
  int64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend((id)objc_opt_class(), "_invalidBinarySearchIndex");
  v8 = objc_msgSend(v5, "count");
  if (v5 && v8)
  {
    v9 = 0;
    v10 = v8 - 1;
    do
    {
      v11 = v9 + ((v10 - v9) >> 1);
      objc_msgSend(v5, "objectAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "CalIsAfterOrSameAsDate:", v13) & 1) != 0)
      {
        objc_msgSend(v12, "endDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v6, "CalIsBeforeDate:", v14);

        if (v15)
        {

          v7 = v9 + ((v10 - v9) >> 1);
          break;
        }
      }
      else
      {

      }
      objc_msgSend(v12, "startDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v6, "CalIsBeforeDate:", v16);

      if (v17)
        v10 = v11 - 1;
      else
        v9 = v11 + 1;

    }
    while (v9 <= v10);
  }

  return v7;
}

+ (int64_t)_invalidBinarySearchIndex
{
  return -1;
}

+ (id)_selfOrganizerForNewlyScheduledEventWithAddress:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0D0C298];
  v4 = a3;
  objc_msgSend(v3, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "myFullName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "length"))
  {
    EKBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("You"), &stru_1E4789A58, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v4);

  +[EKOrganizer organizerWithName:emailAddress:phoneNumber:address:isCurrentUser:](EKOrganizer, "organizerWithName:emailAddress:phoneNumber:address:isCurrentUser:", v7, 0, 0, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (void)_validateSpans:(id)a3
{
  id v3;
  void *v4;
  _QWORD v5[10];
  _QWORD v6[5];
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v3 = a3;
  v4 = (void *)EKUIAvailabilitySearchHandle;
  if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
    +[EKInviteeAlternativeTimeSearcher _validateSpans:].cold.5(v4, v3);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__6;
  v8[4] = __Block_byref_object_dispose__6;
  v9 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__6;
  v6[4] = __Block_byref_object_dispose__6;
  v7 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__EKInviteeAlternativeTimeSearcher__validateSpans___block_invoke;
  v5[3] = &unk_1E4785D80;
  v5[4] = v8;
  v5[5] = &v22;
  v5[6] = &v18;
  v5[7] = &v14;
  v5[8] = v6;
  v5[9] = &v10;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);
  if (*((_BYTE *)v23 + 24) && os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
    +[EKInviteeAlternativeTimeSearcher _validateSpans:].cold.4();
  if (*((_BYTE *)v19 + 24) && os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
    +[EKInviteeAlternativeTimeSearcher _validateSpans:].cold.3();
  if (*((_BYTE *)v15 + 24) && os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
    +[EKInviteeAlternativeTimeSearcher _validateSpans:].cold.2();
  if (*((_BYTE *)v11 + 24) && os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
    +[EKInviteeAlternativeTimeSearcher _validateSpans:].cold.1();
  _Block_object_dispose(v6, 8);

  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

}

void __51__EKInviteeAlternativeTimeSearcher__validateSpans___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  uint64_t v18;
  void *v19;

  v3 = a2;
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40) && (objc_msgSend(v4, "isEqualToDate:") & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
      __51__EKInviteeAlternativeTimeSearcher__validateSpans___block_invoke_cold_4();
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  }
  objc_msgSend(v3, "endDate");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[4] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (objc_msgSend(v4, "isEqualToDate:", v5))
  {
    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
      __51__EKInviteeAlternativeTimeSearcher__validateSpans___block_invoke_cold_2();
    v9 = a1[6];
  }
  else
  {
    if (!objc_msgSend(v4, "CalIsAfterDate:", v5))
      goto LABEL_15;
    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
      __51__EKInviteeAlternativeTimeSearcher__validateSpans___block_invoke_cold_3();
    v9 = a1[7];
  }
  *(_BYTE *)(*(_QWORD *)(v9 + 8) + 24) = 1;
LABEL_15:
  v10 = a1 + 8;
  v11 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
  if (v11)
  {
    objc_msgSend(v11, "conflictedParticipants");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*v10 + 8) + 40), "conflictedParticipants");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count") != 0;

    }
    else
    {
      v14 = 0;
    }

    objc_msgSend(v3, "conflictedParticipants");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "conflictedParticipants");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count") != 0;

    }
    else
    {
      v17 = 0;
    }

    if (!v14 && !v17)
    {
      *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
      if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
        __51__EKInviteeAlternativeTimeSearcher__validateSpans___block_invoke_cold_1();
    }
  }
  v18 = *(_QWORD *)(*v10 + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v3;

}

- (BOOL)noConflictRequired
{
  return self->_noConflictRequired;
}

- (void)setNoConflictRequired:(BOOL)a3
{
  self->_noConflictRequired = a3;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processingQueue, a3);
}

- (NSDate)internalOriginalStartDate
{
  return self->_internalOriginalStartDate;
}

- (void)setInternalOriginalStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_internalOriginalStartDate, a3);
}

- (NSDate)internalOriginalEndDate
{
  return self->_internalOriginalEndDate;
}

- (void)setInternalOriginalEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_internalOriginalEndDate, a3);
}

- (NSDate)originalRangeStartDate
{
  return self->_originalRangeStartDate;
}

- (void)setOriginalRangeStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_originalRangeStartDate, a3);
}

- (NSMutableArray)internalProposedStarts
{
  return self->_internalProposedStarts;
}

- (void)setInternalProposedStarts:(id)a3
{
  objc_storeStrong((id *)&self->_internalProposedStarts, a3);
}

- (EKSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (NSString)ignoredEventID
{
  return self->_ignoredEventID;
}

- (void)setIgnoredEventID:(id)a3
{
  objc_storeStrong((id *)&self->_ignoredEventID, a3);
}

- (NSOperationQueue)availabilityRequestsQueue
{
  return self->_availabilityRequestsQueue;
}

- (void)setAvailabilityRequestsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_availabilityRequestsQueue, a3);
}

- (NSMutableDictionary)participantAddressesToParticipants
{
  return self->_participantAddressesToParticipants;
}

- (void)setParticipantAddressesToParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_participantAddressesToParticipants, a3);
}

- (NSString)organizerAddress
{
  return self->_organizerAddress;
}

- (void)setOrganizerAddress:(id)a3
{
  objc_storeStrong((id *)&self->_organizerAddress, a3);
}

- (BOOL)availabilityRequestInProgress
{
  return self->_availabilityRequestInProgress;
}

- (void)setAvailabilityRequestInProgress:(BOOL)a3
{
  self->_availabilityRequestInProgress = a3;
}

- (NSDate)nextAvailabilityRangeStartDate
{
  return self->_nextAvailabilityRangeStartDate;
}

- (void)setNextAvailabilityRangeStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_nextAvailabilityRangeStartDate, a3);
}

- (double)availabilitySearchDurationMultiplier
{
  return self->_availabilitySearchDurationMultiplier;
}

- (void)setAvailabilitySearchDurationMultiplier:(double)a3
{
  self->_availabilitySearchDurationMultiplier = a3;
}

- (unint64_t)remainingSearchAttempts
{
  return self->_remainingSearchAttempts;
}

- (void)setRemainingSearchAttempts:(unint64_t)a3
{
  self->_remainingSearchAttempts = a3;
}

- (NSMutableArray)leftoverSpans
{
  return self->_leftoverSpans;
}

- (void)setLeftoverSpans:(id)a3
{
  objc_storeStrong((id *)&self->_leftoverSpans, a3);
}

- (NSMutableArray)internalTimesWhenAllAttendeesCanAttend
{
  return self->_internalTimesWhenAllAttendeesCanAttend;
}

- (void)setInternalTimesWhenAllAttendeesCanAttend:(id)a3
{
  objc_storeStrong((id *)&self->_internalTimesWhenAllAttendeesCanAttend, a3);
}

- (NSMutableArray)internalTimesWhenSomeAttendeesCanAttend
{
  return self->_internalTimesWhenSomeAttendeesCanAttend;
}

- (void)setInternalTimesWhenSomeAttendeesCanAttend:(id)a3
{
  objc_storeStrong((id *)&self->_internalTimesWhenSomeAttendeesCanAttend, a3);
}

- (NSMutableArray)internalProposedTimes
{
  return self->_internalProposedTimes;
}

- (void)setInternalProposedTimes:(id)a3
{
  objc_storeStrong((id *)&self->_internalProposedTimes, a3);
}

- (NSMutableArray)internalOriginalConflictedParticipants
{
  return self->_internalOriginalConflictedParticipants;
}

- (void)setInternalOriginalConflictedParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_internalOriginalConflictedParticipants, a3);
}

- (BOOL)internalSearchingForMoreTimesWhenAllAttendeesCanAttend
{
  return self->_internalSearchingForMoreTimesWhenAllAttendeesCanAttend;
}

- (void)setInternalSearchingForMoreTimesWhenAllAttendeesCanAttend:(BOOL)a3
{
  self->_internalSearchingForMoreTimesWhenAllAttendeesCanAttend = a3;
}

- (BOOL)internalSearchingForMoreTimesWhenSomeAttendeesCanAttend
{
  return self->_internalSearchingForMoreTimesWhenSomeAttendeesCanAttend;
}

- (void)setInternalSearchingForMoreTimesWhenSomeAttendeesCanAttend:(BOOL)a3
{
  self->_internalSearchingForMoreTimesWhenSomeAttendeesCanAttend = a3;
}

- (id)stateChanged
{
  return self->_stateChanged;
}

- (void)setStateChanged:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateChanged, 0);
  objc_storeStrong((id *)&self->_internalOriginalConflictedParticipants, 0);
  objc_storeStrong((id *)&self->_internalProposedTimes, 0);
  objc_storeStrong((id *)&self->_internalTimesWhenSomeAttendeesCanAttend, 0);
  objc_storeStrong((id *)&self->_internalTimesWhenAllAttendeesCanAttend, 0);
  objc_storeStrong((id *)&self->_leftoverSpans, 0);
  objc_storeStrong((id *)&self->_nextAvailabilityRangeStartDate, 0);
  objc_storeStrong((id *)&self->_organizerAddress, 0);
  objc_storeStrong((id *)&self->_participantAddressesToParticipants, 0);
  objc_storeStrong((id *)&self->_availabilityRequestsQueue, 0);
  objc_storeStrong((id *)&self->_ignoredEventID, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_internalProposedStarts, 0);
  objc_storeStrong((id *)&self->_originalRangeStartDate, 0);
  objc_storeStrong((id *)&self->_internalOriginalEndDate, 0);
  objc_storeStrong((id *)&self->_internalOriginalStartDate, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "No event given.  Will not search for alternative times.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "The event's start date is the same as its end date.  Will not issue search for alternative times.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "The event is an all-day.  This is currently not supported.  Will not issue search for alternative times.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "Sending off availability request operation for execution: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "We need to figure out the availability status of some attendees in order to complete conflict detection.  Attendees: [%@].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "No conflicts detected, but noConflictFound flag set. Will attempt to perform conflict resolution.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "No conflicts detected.  Will not attempt to perform conflict resolution.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_8(void *a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A2318000, v4, v6, "Detected a conflict.  [%@] attendees have declined.  Will perform conflict resolution by searching for time slots in the future. ", v7);

  OUTLINED_FUNCTION_1_1();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "The event's dates have not been dirtied and there are no addresses collected for looking up availability information for the event's original time span.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "No 'organizerAddressForNewlyScheduledEvent' given.  The organizer for this event is unknown and conflict resolution will likely be incorrect and irrelevant.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "Could not find the organizer's address.  This can sometimes happen if the event is being scheduled for the first time.  Organizer: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_12()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_3_0(&dword_1A2318000, v0, (uint64_t)v0, "Adding organizer with address [%@] to the list of attendees to be included in conflict resolution.  Participant: [%@]", v1);
  OUTLINED_FUNCTION_1_0();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "Extracting attendees for original conflict detection.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_14(id *a1, void *a2, uint64_t a3)
{
  void *v3;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = OUTLINED_FUNCTION_20((uint64_t)a1, a2);
  objc_msgSend(v3, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "endDateUnadjustedForLegacyClients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "source");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138413058;
  v12 = v7;
  v13 = 2112;
  v14 = v8;
  v15 = 2112;
  v16 = a3;
  v17 = 2112;
  v18 = v10;
  _os_log_debug_impl(&dword_1A2318000, v6, OS_LOG_TYPE_DEBUG, "Starting original conflict detection - event start date: [%@] event end date: [%@] ignored event ID: [%@] source: [%@]", (uint8_t *)&v11, 0x2Au);

}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "The event's source does not support availability requests.  Will not issue search for alternative times.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_16(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  OUTLINED_FUNCTION_3_0(&dword_1A2318000, a2, a3, "Searching reset with organizerAddressForNewlyScheduledEvent [%@] and event [%@]", (uint8_t *)&v5);
  OUTLINED_FUNCTION_1_0();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_19_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "self went away.  Returning early.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_19_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "The availability operation went away.  Returning early.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_20_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "Participants with conflicts found.  Will search for other time slots.  Participants with conflicts: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_20_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "No participants with conflicts found.  Will not continue on by searching for other time slots.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_20_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "Conflict detection complete.  Conflicted participants: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_20_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "Including declined participants in the list of participants with conflicts.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_20_cold_5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1A2318000, a2, a3, "Error encountered while searching.  Error: [%@]", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_21_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Could not find participant.  Will not count as busy.  Address: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_21_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "This participant is busy during the event's time range: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_21_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "This participant is completely free during the event's time range: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_26_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Could not find participant.  Will not count as busy.  Address: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __50__EKInviteeAlternativeTimeSearcher__attemptSearch__block_invoke_3_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "The availability search operation went away.  Returning early.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__EKInviteeAlternativeTimeSearcher__attemptSearch__block_invoke_3_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "This availability search operation was cancelled: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __50__EKInviteeAlternativeTimeSearcher__attemptSearch__block_invoke_38_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1A2318000, a2, a3, "Operation resulted in an error.  Re-trying search.  Error: [%@]", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __53__EKInviteeAlternativeTimeSearcher__sendStateChange___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v3;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_20(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_19(), "stateAsString:", *(_QWORD *)(a3 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v3, v6, "No 'state changed' callback found.  Will not send state changed information.  State: [%@]", v7);

  OUTLINED_FUNCTION_1_1();
}

void __53__EKInviteeAlternativeTimeSearcher__sendStateChange___block_invoke_cold_2(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v3;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_20(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_19(), "stateAsString:", *(_QWORD *)(a3 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A2318000, v3, v6, "Sending state change.  State: [%@]", v7);

  OUTLINED_FUNCTION_1_1();
}

- (void)_processResults:betweenStartDate:endDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "Work remains, but there are no more remaining search attempts left.  Search exhausted.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_processResults:(void *)a1 betweenStartDate:(void *)a2 endDate:.cold.2(void *a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(a2, "remainingSearchAttempts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A2318000, v4, v6, "There are [%@] remaining search attempts left.  Continuing search.", v7);

  OUTLINED_FUNCTION_1_1();
}

- (void)_processResults:betweenStartDate:endDate:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "Search has not progressed and no more work remains.  This is an invalid state, as there should always be work to do until we've seen search results or there are no more search attempts left.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_processResults:(void *)a1 betweenStartDate:(void *)a2 endDate:(void *)a3 .cold.4(void *a1, void *a2, void *a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a1;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_0(&dword_1A2318000, v6, v9, "Found [%@] free times and [%@] non-free times.", v10);

}

- (void)_haltSearchWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "Halting search.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_findLeftoverSpans:usingFreeTimes:andNonOptimalTimes:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A2318000, v0, v1, "No leftover spans found for latest date: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __90__EKInviteeAlternativeTimeSearcher__generateTimeSpansForResults_betweenStartDate_endDate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "No participant found for participant with address: [%@].  Will not generate time spans for this participant's availability information.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __90__EKInviteeAlternativeTimeSearcher__generateTimeSpansForResults_betweenStartDate_endDate___block_invoke_50_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "This span's start date is equal to its end date: [%@].  Will not consider this span in alternative time calculations.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __90__EKInviteeAlternativeTimeSearcher__generateTimeSpansForResults_betweenStartDate_endDate___block_invoke_50_cold_2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v3, v5, "Could not find a time span that contains date: [%@]", v6);

  OUTLINED_FUNCTION_4_0();
}

void __90__EKInviteeAlternativeTimeSearcher__generateTimeSpansForResults_betweenStartDate_endDate___block_invoke_50_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, v0, v1, "No replacement spans found.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_validateSpans:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "At least two contiguous spans are marked as being free in the spans range: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_validateSpans:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "At least one span's start date comes after its end date in the spans range: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_validateSpans:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "A zero-duration span exists in the spans range: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_validateSpans:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Time gaps exist in the spans range: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_validateSpans:(void *)a1 .cold.5(void *a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A2318000, v4, v6, "Validating [%@] spans.", v7);

  OUTLINED_FUNCTION_1_1();
}

void __51__EKInviteeAlternativeTimeSearcher__validateSpans___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_18(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_13(&dword_1A2318000, v1, v2, "Contiguous free spans exist.  Last inspected span: [%@].  This span: [%@]", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

void __51__EKInviteeAlternativeTimeSearcher__validateSpans___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Span's start and end date is the same: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __51__EKInviteeAlternativeTimeSearcher__validateSpans___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_1A2318000, v0, v1, "Span's start date is after its end date: [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __51__EKInviteeAlternativeTimeSearcher__validateSpans___block_invoke_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_18(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_13(&dword_1A2318000, v1, v2, "Found span whose start date doesn't match previous span's end date.  Previous lastEndDate: [%@].  Cached span: [%@]", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

@end
