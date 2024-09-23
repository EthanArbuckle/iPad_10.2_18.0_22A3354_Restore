@implementation HDCloudSyncPipelineStageSharedSummaryAddParticipant

- (HDCloudSyncPipelineStageSharedSummaryAddParticipant)initWithConfiguration:(id)a3 cloudState:(id)a4 codableEntry:(id)a5 authorizationIdentifiers:(id)a6
{
  id v10;
  id v11;
  HDCloudSyncPipelineStageSharedSummaryAddParticipant *v12;
  uint64_t v13;
  HDCodableSummarySharingEntry *codableEntry;
  uint64_t v15;
  NSArray *authorizationIdentifiers;
  objc_super v18;

  v10 = a5;
  v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HDCloudSyncPipelineStageSharedSummaryAddParticipant;
  v12 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](&v18, sel_initWithConfiguration_cloudState_, a3, a4);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    codableEntry = v12->_codableEntry;
    v12->_codableEntry = (HDCodableSummarySharingEntry *)v13;

    v15 = objc_msgSend(v11, "copy");
    authorizationIdentifiers = v12->_authorizationIdentifiers;
    v12->_authorizationIdentifiers = (NSArray *)v15;

  }
  return v12;
}

- (void)main
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  -[HDCloudSyncOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "repository");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCodableSummarySharingEntry primaryContactIdentifier](self->_codableEntry, "primaryContactIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "_appearsToBeEmail"))
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95218]), "initWithEmailAddress:", v6);
LABEL_5:
    v8 = (void *)v7;
    goto LABEL_7;
  }
  if (objc_msgSend(v6, "_appearsToBePhoneNumber"))
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95218]), "initWithPhoneNumber:", v6);
    goto LABEL_5;
  }
  v8 = 0;
LABEL_7:

  if (v8)
  {
    objc_msgSend(v5, "primaryCKContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__HDCloudSyncPipelineStageSharedSummaryAddParticipant_main__block_invoke;
    v11[3] = &unk_1E6D01A28;
    v11[4] = self;
    v12 = v8;
    objc_msgSend(v9, "fetchFullNameAndPrimaryEmailOnAccountWithCompletionHandler:", v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("_codableEntry.primaryContactIdentifier"), objc_opt_class(), a2, CFSTR("Unable to create lookup info from contact identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v10);

  }
}

void __59__HDCloudSyncPipelineStageSharedSummaryAddParticipant_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HDCloudSyncCompoundOperation *v12;
  void *v13;
  HDCloudSyncCompoundOperation *v14;
  HDCloudSyncDiscoverUserIdentityOperation *v15;
  void *v16;
  HDCloudSyncDiscoverUserIdentityOperation *v17;
  HDCloudSyncSharedSummaryValidateOutgoingInvitationOperation *v18;
  void *v19;
  uint64_t v20;
  HDCloudSyncLookupParticipantOperation *v21;
  void *v22;
  HDCloudSyncLookupParticipantOperation *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HDCloudSyncCreateZonesOperation *v35;
  void *v36;
  void *v37;
  void *v38;
  HDCloudSyncRemoveInvalidShareParticipantsOperation *v39;
  void *v40;
  void *v41;
  HDCloudSyncLookupParticipantOperation *v42;
  HDCloudSyncAddSharingParticipantOperation *v43;
  void *v44;
  HDCloudSyncAddSharingParticipantOperation *v45;
  id v46;
  id v47;
  HDCloudSyncSharedSummaryUpdateParticipantOperation *v48;
  void *v49;
  HDCloudSyncSharedSummaryUpdateParticipantOperation *v50;
  id v51;
  id v52;
  HDCloudSyncAddSharingParticipantOperation *v53;
  HDCloudSyncSharedSummaryUpdateParticipantOperation *v54;
  HDCloudSyncDiscoverUserIdentityOperation *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  HDCloudSyncLookupParticipantOperation *v61;
  void *v62;
  id v63;
  id v64;
  HDCloudSyncDiscoverUserIdentityOperation *v65;
  HDCloudSyncRemoveInvalidShareParticipantsOperation *v66;
  HDCloudSyncCreateZonesOperation *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  _QWORD v75[5];
  _QWORD v76[5];
  HDCloudSyncDiscoverUserIdentityOperation *v77;
  _QWORD *v78;
  _QWORD v79[4];
  id v80;
  id v81;
  HDCloudSyncAddSharingParticipantOperation *v82;
  id v83;
  uint64_t v84;
  HDCloudSyncSharedSummaryUpdateParticipantOperation *v85;
  _QWORD *v86;
  _QWORD v87[5];
  id v88;
  _QWORD v89[4];
  HDCloudSyncLookupParticipantOperation *v90;
  id v91;
  id v92;
  _QWORD v93[4];
  HDCloudSyncLookupParticipantOperation *v94;
  _QWORD v95[4];
  HDCloudSyncDiscoverUserIdentityOperation *v96;
  _QWORD v97[4];

  v97[2] = *MEMORY[0x1E0C80C00];
  v74 = a2;
  v7 = a3;
  v8 = a4;
  v9 = v8;
  v71 = v7;
  if (v7)
  {
    v63 = v8;
    v10 = *(_QWORD *)(a1 + 32);
    v72 = *(id *)(a1 + 40);
    v64 = v74;
    v68 = v7;
    if (v10)
    {
      objc_msgSend((id)v10, "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "repository");
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = [HDCloudSyncCompoundOperation alloc];
      objc_msgSend((id)v10, "configuration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v12, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v13, 0, CFSTR("Add Summary Sharing Participant"), 0);

      v15 = [HDCloudSyncDiscoverUserIdentityOperation alloc];
      objc_msgSend((id)v10, "configuration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[HDCloudSyncDiscoverUserIdentityOperation initWithConfiguration:identityLookupInfo:](v15, "initWithConfiguration:identityLookupInfo:", v16, v72);

      -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v14, "addOperation:transitionHandler:", v17, 0);
      v18 = [HDCloudSyncSharedSummaryValidateOutgoingInvitationOperation alloc];
      objc_msgSend((id)v10, "configuration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[HDCloudSyncSharedSummaryValidateOutgoingInvitationOperation initWithConfiguration:cloudState:](v18, "initWithConfiguration:cloudState:", v19, 0);

      v95[0] = MEMORY[0x1E0C809B0];
      v95[1] = 3221225472;
      v95[2] = __106__HDCloudSyncPipelineStageSharedSummaryAddParticipant__addParticipantWithLookupInfo_ownerName_ownerEmail___block_invoke;
      v95[3] = &unk_1E6CFEDE8;
      v65 = v17;
      v96 = v65;
      v62 = (void *)v20;
      -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v14, "addOperation:transitionHandler:", v20, v95);
      v21 = [HDCloudSyncLookupParticipantOperation alloc];
      objc_msgSend((id)v10, "configuration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[HDCloudSyncLookupParticipantOperation initWithConfiguration:cloudState:identityLookupInfo:](v21, "initWithConfiguration:cloudState:identityLookupInfo:", v22, 0, v72);

      -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v14, "addOperation:transitionHandler:", v23, 0);
      v24 = objc_alloc(MEMORY[0x1E0C95088]);
      v25 = (void *)MEMORY[0x1E0C95098];
      objc_msgSend((id)v10, "configuration");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "syncContainerPrefix");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "hd_privateMetadataZoneIDForSyncCircleIdentifier:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = (void *)objc_msgSend(v24, "initWithZoneID:", v28);

      v29 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(*(id *)(v10 + 128), "uuid");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v29, "initWithUUIDString:", v30);

      v32 = (void *)MEMORY[0x1E0C95098];
      objc_msgSend(v73, "syncCircleIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "hd_sharedSummaryZoneIDWithSyncCircleIdentifier:userIdentifier:", v33, v31);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v34);
      v35 = [HDCloudSyncCreateZonesOperation alloc];
      objc_msgSend((id)v10, "configuration");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v97[0] = v70;
      v97[1] = v69;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "primaryCKContainer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = -[HDCloudSyncCreateZonesOperation initWithConfiguration:cloudState:zones:container:](v35, "initWithConfiguration:cloudState:zones:container:", v36, 0, v37, v38);

      -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v14, "addOperation:transitionHandler:", v67, 0);
      v39 = [HDCloudSyncRemoveInvalidShareParticipantsOperation alloc];
      objc_msgSend((id)v10, "configuration");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v10, "cloudState");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = -[HDCloudSyncRemoveInvalidShareParticipantsOperation initWithConfiguration:cloudState:](v39, "initWithConfiguration:cloudState:", v40, v41);

      v93[0] = MEMORY[0x1E0C809B0];
      v93[1] = 3221225472;
      v93[2] = __106__HDCloudSyncPipelineStageSharedSummaryAddParticipant__addParticipantWithLookupInfo_ownerName_ownerEmail___block_invoke_2;
      v93[3] = &unk_1E6CFEDE8;
      v42 = v23;
      v94 = v42;
      -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v14, "addOperation:transitionHandler:", v66, v93);
      v43 = [HDCloudSyncAddSharingParticipantOperation alloc];
      objc_msgSend((id)v10, "configuration");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[HDCloudSyncAddSharingParticipantOperation initWithConfiguration:cloudState:](v43, "initWithConfiguration:cloudState:", v44, 0);

      v89[0] = MEMORY[0x1E0C809B0];
      v89[1] = 3221225472;
      v89[2] = __106__HDCloudSyncPipelineStageSharedSummaryAddParticipant__addParticipantWithLookupInfo_ownerName_ownerEmail___block_invoke_3;
      v89[3] = &unk_1E6D003D0;
      v61 = v42;
      v90 = v61;
      v46 = v34;
      v91 = v46;
      v47 = v73;
      v92 = v47;
      -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v14, "addOperation:transitionHandler:", v45, v89);
      v87[0] = 0;
      v87[1] = v87;
      v87[2] = 0x3032000000;
      v87[3] = __Block_byref_object_copy__152;
      v87[4] = __Block_byref_object_dispose__152;
      v88 = 0;
      v48 = [HDCloudSyncSharedSummaryUpdateParticipantOperation alloc];
      objc_msgSend((id)v10, "configuration");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = -[HDCloudSyncSharedSummaryUpdateParticipantOperation initWithConfiguration:codableEntry:authorizationIdentifiersToAdd:authorizationIdentifiersToDelete:](v48, "initWithConfiguration:codableEntry:authorizationIdentifiersToAdd:authorizationIdentifiersToDelete:", v49, *(_QWORD *)(v10 + 128), *(_QWORD *)(v10 + 136), MEMORY[0x1E0C9AA60]);

      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __106__HDCloudSyncPipelineStageSharedSummaryAddParticipant__addParticipantWithLookupInfo_ownerName_ownerEmail___block_invoke_208;
      v79[3] = &unk_1E6D01A50;
      v86 = v87;
      v51 = v47;
      v80 = v51;
      v52 = v31;
      v81 = v52;
      v53 = v45;
      v82 = v53;
      v83 = v68;
      v84 = v10;
      v54 = v50;
      v85 = v54;
      -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v14, "addOperation:transitionHandler:", v54, v79);
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = 3221225472;
      v76[2] = __106__HDCloudSyncPipelineStageSharedSummaryAddParticipant__addParticipantWithLookupInfo_ownerName_ownerEmail___block_invoke_211;
      v76[3] = &unk_1E6D01A78;
      v76[4] = v10;
      v78 = v87;
      v55 = v65;
      v77 = v55;
      -[HDCloudSyncOperation setOnSuccess:](v14, "setOnSuccess:", v76);
      v75[0] = MEMORY[0x1E0C809B0];
      v75[1] = 3221225472;
      v75[2] = __106__HDCloudSyncPipelineStageSharedSummaryAddParticipant__addParticipantWithLookupInfo_ownerName_ownerEmail___block_invoke_2_213;
      v75[3] = &unk_1E6CE77A0;
      v75[4] = v10;
      -[HDCloudSyncOperation setOnError:](v14, "setOnError:", v75);
      -[HDCloudSyncOperation progress](v14, "progress");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "totalUnitCount");

      objc_msgSend((id)v10, "progress");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setTotalUnitCount:", objc_msgSend(v58, "totalUnitCount") + v57);

      objc_msgSend((id)v10, "progress");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncOperation progress](v14, "progress");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "addChild:withPendingUnitCount:", v60, v57);

      -[HDCloudSyncCompoundOperation start](v14, "start");
      _Block_object_dispose(v87, 8);

    }
    v9 = v63;
  }
  else
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 124, CFSTR("Failed to fetch account info but recieved no error."));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v9);
  }

}

void __106__HDCloudSyncPipelineStageSharedSummaryAddParticipant__addParticipantWithLookupInfo_ownerName_ownerEmail___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  objc_msgSend(v3, "userIdentity");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserIdentity:", v5);

}

void __106__HDCloudSyncPipelineStageSharedSummaryAddParticipant__addParticipantWithLookupInfo_ownerName_ownerEmail___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "participant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "participant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setParticipantsToCheck:", v7);

  }
  else
  {
    objc_msgSend(v4, "setParticipantsToCheck:", MEMORY[0x1E0C9AA60]);
  }

}

void __106__HDCloudSyncPipelineStageSharedSummaryAddParticipant__addParticipantWithLookupInfo_ownerName_ownerEmail___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "participant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setParticipant:", v6);

  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "primaryCKContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncZoneIdentifier identifierForZone:container:scope:](HDCloudSyncZoneIdentifier, "identifierForZone:container:scope:", v7, v9, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setZoneIdentifiers:", v11);

}

void __106__HDCloudSyncPipelineStageSharedSummaryAddParticipant__addParticipantWithLookupInfo_ownerName_ownerEmail___block_invoke_208(uint64_t a1)
{
  HDCloudSyncShareSetupMetadata *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = [HDCloudSyncShareSetupMetadata alloc];
  objc_msgSend(*(id *)(a1 + 32), "syncCircleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6A10], "_profileWithUUID:type:", *(_QWORD *)(a1 + 40), 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "shareURLs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 48), "participant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "invitationTokensByShareURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HDCloudSyncShareSetupMetadata initWithSyncCircleIdentifier:profileIdentifier:shareURLs:ownerCloudKitEmailAddress:shareParticipant:invitationTokensByShareURL:](v2, "initWithSyncCircleIdentifier:profileIdentifier:shareURLs:ownerCloudKitEmailAddress:shareParticipant:invitationTokensByShareURL:", v3, v4, v5, v6, v7, v8);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  v18 = 0;
  objc_msgSend(v12, "codableSharingSetupMetadataWithError:", &v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v18;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 128), "setSharingSetupMetadata:", v13);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 128), "sharingSetupMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    _HKInitializeLogging();
    HKLogSharing();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138543618;
      v20 = v17;
      v21 = 2114;
      v22 = v14;
      _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Failed to create codable sharing setup metadata: %{public}@", buf, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 72), "setEntry:", *(_QWORD *)(*(_QWORD *)(a1 + 64) + 128));

}

uint64_t __106__HDCloudSyncPipelineStageSharedSummaryAddParticipant__addParticipantWithLookupInfo_ownerName_ownerEmail___block_invoke_211(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 144), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 40), "userIdentity");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 152);
  *(_QWORD *)(v3 + 152) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);
}

uint64_t __106__HDCloudSyncPipelineStageSharedSummaryAddParticipant__addParticipantWithLookupInfo_ownerName_ownerEmail___block_invoke_2_213(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, a3);
}

- (HDCloudSyncShareSetupMetadata)shareSetupMetadata
{
  return (HDCloudSyncShareSetupMetadata *)objc_getProperty(self, a2, 144, 1);
}

- (CKUserIdentity)participantIdentity
{
  return (CKUserIdentity *)objc_getProperty(self, a2, 152, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantIdentity, 0);
  objc_storeStrong((id *)&self->_shareSetupMetadata, 0);
  objc_storeStrong((id *)&self->_authorizationIdentifiers, 0);
  objc_storeStrong((id *)&self->_codableEntry, 0);
}

@end
