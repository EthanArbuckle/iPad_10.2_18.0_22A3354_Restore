@implementation HMUserCloudShareWithOwnerOperation

- (HMUserCloudShareWithOwnerOperation)initWithShare:(id)a3 container:(id)a4 ownerUser:(id)a5 allowWriteAccess:(BOOL)a6 currentUser:(id)a7
{
  return -[HMUserCloudShareWithOwnerOperation initWithShare:container:ownerUser:allowWriteAccess:currentUser:analyticsEventSender:](self, "initWithShare:container:ownerUser:allowWriteAccess:currentUser:analyticsEventSender:", a3, a4, a5, a6, a7, &__block_literal_global_34754);
}

- (HMUserCloudShareWithOwnerOperation)initWithShare:(id)a3 container:(id)a4 ownerUser:(id)a5 allowWriteAccess:(BOOL)a6 currentUser:(id)a7 analyticsEventSender:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HMUserCloudShareWithOwnerOperation *v18;
  uint64_t v19;
  OS_os_log *logger;
  uint64_t v21;
  NSUUID *operationID;
  void *v23;
  id analyticsEventSender;
  id v27;
  objc_super v28;

  v27 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)HMUserCloudShareWithOwnerOperation;
  v18 = -[HMUserCloudShareWithOwnerOperation init](&v28, sel_init);
  if (v18)
  {
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    logger = v18->_logger;
    v18->_logger = (OS_os_log *)v19;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v21 = objc_claimAutoreleasedReturnValue();
    operationID = v18->_operationID;
    v18->_operationID = (NSUUID *)v21;

    objc_storeStrong((id *)&v18->_share, a3);
    objc_storeStrong((id *)&v18->_container, a4);
    objc_storeStrong((id *)&v18->_ownerUser, a5);
    objc_storeStrong((id *)&v18->_currentUser, a7);
    v18->_allowWriteAccess = a6;
    v23 = _Block_copy(v17);
    analyticsEventSender = v18->_analyticsEventSender;
    v18->_analyticsEventSender = v23;

  }
  return v18;
}

- (void)fetchParticipantForLookupInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *logger;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl(&dword_19B1B0000, logger, OS_LOG_TYPE_DEFAULT, "Fetching Share Participant for %@", buf, 0xCu);
  }
  v9 = objc_alloc(MEMORY[0x1E0C94E50]);
  v24 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithUserIdentityLookupInfos:", v10);

  objc_msgSend(v11, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setQualityOfService:", 17);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __79__HMUserCloudShareWithOwnerOperation_fetchParticipantForLookupInfo_completion___block_invoke;
  v22[3] = &unk_1E3AB32A0;
  v15 = v13;
  v23 = v15;
  objc_msgSend(v11, "setShareParticipantFetchedBlock:", v22);
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __79__HMUserCloudShareWithOwnerOperation_fetchParticipantForLookupInfo_completion___block_invoke_2;
  v19[3] = &unk_1E3AB53A8;
  v20 = v15;
  v21 = v7;
  v19[4] = self;
  v16 = v15;
  v17 = v7;
  objc_msgSend(v11, "setFetchShareParticipantsCompletionBlock:", v19);
  -[HMUserCloudShareWithOwnerOperation container](self, "container");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addOperation:", v11);

}

- (void)saveShareAndObtainSavedOwner:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0C94F10]);
  -[HMUserCloudShareWithOwnerOperation share](self, "share");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithRecordsToSave:recordIDsToDelete:", v10, 0);

  objc_msgSend(v11, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setQualityOfService:", 17);

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__HMUserCloudShareWithOwnerOperation_saveShareAndObtainSavedOwner_completion___block_invoke;
  v17[3] = &unk_1E3AB32C8;
  v18 = v6;
  v19 = v7;
  v17[4] = self;
  v13 = v6;
  v14 = v7;
  objc_msgSend(v11, "setModifyRecordsCompletionBlock:", v17);
  -[HMUserCloudShareWithOwnerOperation container](self, "container");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "privateCloudDatabase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addOperation:", v11);

}

- (void)removeOwnerAsParticipant:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *, void *);
  void *v20;
  HMUserCloudShareWithOwnerOperation *v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[HMUserCloudShareWithOwnerOperation share](self, "share");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeParticipant:", v7);

  v9 = objc_alloc(MEMORY[0x1E0C94F10]);
  -[HMUserCloudShareWithOwnerOperation share](self, "share");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithRecordsToSave:recordIDsToDelete:", v11, 0);

  objc_msgSend(v12, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setQualityOfService:", 17);

  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __74__HMUserCloudShareWithOwnerOperation_removeOwnerAsParticipant_completion___block_invoke;
  v20 = &unk_1E3AB32F0;
  v21 = self;
  v22 = v6;
  v14 = v6;
  objc_msgSend(v12, "setModifyRecordsCompletionBlock:", &v17);
  -[HMUserCloudShareWithOwnerOperation container](self, "container", v17, v18, v19, v20, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "privateCloudDatabase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addOperation:", v12);

}

- (void)sendShareToOwner:(id)a3 from:(id)a4 savedOwnerAsParticipant:(id)a5 share:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, id);
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  NSObject *logger;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  void (**v35)(id, _QWORD, id);
  id v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, _QWORD, id))a7;
  v16 = a6;
  objc_msgSend(v16, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "invitationToken");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "containerID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "containerIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, &v36);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v36;
  if (!v21)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v22;
      _os_log_error_impl(&dword_19B1B0000, logger, OS_LOG_TYPE_ERROR, "Unable to encode share token. %@", buf, 0xCu);
      if (v22)
        goto LABEL_6;
    }
    else if (v22)
    {
LABEL_6:
      v15[2](v15, 0, v22);
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Got back nil encoded token"), CFSTR("Expected encoded token"), &stru_1E3AB7688);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __101__HMUserCloudShareWithOwnerOperation_sendShareToOwner_from_savedOwnerAsParticipant_share_completion___block_invoke;
  v31[3] = &unk_1E3AB3318;
  v31[4] = self;
  v32 = v12;
  v23 = v13;
  v30 = v22;
  v24 = v18;
  v25 = v13;
  v26 = v12;
  v27 = v23;
  v33 = v23;
  v34 = v14;
  v35 = v15;
  v28 = v27;
  v12 = v26;
  v13 = v25;
  v18 = v24;
  v22 = v30;
  objc_msgSend(v32, "sendClientShareURL:shareToken:containerID:fromUser:completion:", v17, v21, v20, v28, v31);

LABEL_7:
}

- (void)main
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  NSObject *logger;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _BYTE *v22;
  uint8_t v23[8];
  _QWORD aBlock[4];
  id v25;
  _BYTE *v26;
  id v27[2];
  id location;
  objc_super v29;
  _BYTE buf[24];
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)HMUserCloudShareWithOwnerOperation;
  -[HMUserCloudShareWithOwnerOperation main](&v29, sel_main);
  -[HMUserCloudShareWithOwnerOperation completion](self, "completion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Completion must be provided"), 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  -[HMUserCloudShareWithOwnerOperation completion](self, "completion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMUserCloudShareWithOwnerOperation setCompletion:](self, "setCompletion:", 0);
  logger = self->_logger;
  if (os_signpost_enabled(logger))
  {
    v7 = logger;
    -[HMUserCloudShareWithOwnerOperation operationID](self, "operationID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMUserCloudShareWithOwnerOperation currentUser](self, "currentUser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMUserCloudShareWithOwnerOperation ownerUser](self, "ownerUser");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v12 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    v31 = v12;
    _os_signpost_emit_with_name_impl(&dword_19B1B0000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MultiUser.Share.Operation", "OperationID=%{signpost.description:attribute}@ User=%{signpost.description:attribute}@ Owner=%{signpost.description:attribute}@ ", buf, 0x20u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v31 = __Block_byref_object_copy__34662;
  v32 = __Block_byref_object_dispose__34663;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__HMUserCloudShareWithOwnerOperation_main__block_invoke;
  aBlock[3] = &unk_1E3AB3340;
  objc_copyWeak(v27, &location);
  v26 = buf;
  v27[1] = (id)0xEEEEB0B5B2B2EEEELL;
  v14 = v5;
  v25 = v14;
  v15 = _Block_copy(aBlock);
  v16 = self->_logger;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "Fetching lookup info for owner user.", v23, 2u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setObject:forKeyedSubscript:", &unk_1E3B2E698, CFSTR("stage"));
  -[HMUserCloudShareWithOwnerOperation ownerUser](self, "ownerUser");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __42__HMUserCloudShareWithOwnerOperation_main__block_invoke_59;
  v20[3] = &unk_1E3AB33B8;
  v18 = v15;
  v20[4] = self;
  v21 = v18;
  v22 = buf;
  objc_msgSend(v17, "fetchShareLookupInfo:", v20);

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMUserCloudShareWithOwnerOperation currentUser](self, "currentUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSUUID)operationID
{
  return self->_operationID;
}

- (HMUser)currentUser
{
  return self->_currentUser;
}

- (HMUser)ownerUser
{
  return self->_ownerUser;
}

- (CKShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
  objc_storeStrong((id *)&self->_share, a3);
}

- (CKContainer)container
{
  return self->_container;
}

- (BOOL)allowWriteAccess
{
  return self->_allowWriteAccess;
}

- (id)analyticsEventSender
{
  return objc_getProperty(self, a2, 312, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_analyticsEventSender, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_ownerUser, 0);
  objc_storeStrong((id *)&self->_currentUser, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

void __42__HMUserCloudShareWithOwnerOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", &unk_1E3B2E698, CFSTR("result"));
    if (v6)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", &unk_1E3B2E6B0, CFSTR("result"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "code"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v9, CFSTR("errorCode"));

      objc_msgSend(v6, "domain");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10)
        v12 = (const __CFString *)v10;
      else
        v12 = CFSTR("<No Domain>");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v12, CFSTR("errorDomain"));

    }
    objc_msgSend(WeakRetained, "share");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "containerID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "containerIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v15, CFSTR("client"));

    objc_msgSend(WeakRetained, "analyticsEventSender");
    v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, _QWORD))v16)[2](v16, CFSTR("com.apple.HomeKit.MultiUserShareOperationResult"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    v17 = WeakRetained[31];
    v18 = v17;
    v19 = *(_QWORD *)(a1 + 56);
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      v20 = 138412290;
      v21 = v6;
      _os_signpost_emit_with_name_impl(&dword_19B1B0000, v18, OS_SIGNPOST_INTERVAL_END, v19, "MultiUser.Share.Operation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v20, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __42__HMUserCloudShareWithOwnerOperation_main__block_invoke_59(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    v7 = *(NSObject **)(a1[4] + 248);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "Fetch CKParticipant for Owner User.", buf, 2u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setObject:forKeyedSubscript:", &unk_1E3B2E6B0, CFSTR("stage"));
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __42__HMUserCloudShareWithOwnerOperation_main__block_invoke_60;
    v11[3] = &unk_1E3AB3390;
    v8 = (void *)a1[5];
    v12 = (id)a1[4];
    v9 = v8;
    v10 = a1[6];
    v13 = v9;
    v14 = v10;
    objc_msgSend(v12, "fetchParticipantForLookupInfo:completion:", v5, v11);

  }
}

void __42__HMUserCloudShareWithOwnerOperation_main__block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  HMHomeCloudShareResponse *v28;
  void *v29;
  HMHomeCloudShareResponse *v30;
  NSObject *v31;
  void *v32;
  id v33;
  uint64_t v34;
  _QWORD v35[5];
  id v36;
  uint64_t v37;
  _QWORD v38[5];
  id v39;
  id v40;
  uint64_t v41;
  _QWORD v42[5];
  id v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "allowWriteAccess"))
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 248);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "Setting permission to read/write.", buf, 2u);
    }
    objc_msgSend(v5, "setPermission:", 3);
  }
  if (v6)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 248);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v6;
      _os_log_error_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "Got error while fetching participant: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "share");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "participants");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (!v11)
      goto LABEL_17;
    v12 = v11;
    v13 = *(_QWORD *)v46;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v46 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        if (objc_msgSend(v15, "isEqual:", v5))
        {
          v16 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 248);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v51 = v15;
            _os_log_debug_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_DEBUG, "Found owner in share. %@", buf, 0xCu);
          }
          v17 = v15;

          if (!v17)
            goto LABEL_25;
          if (objc_msgSend(v17, "invitationTokenStatus") == 3)
          {
            v18 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 248);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_INFO, "Owner needs a new token resending invite.", buf, 2u);
            }
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", &unk_1E3B2E6C8, CFSTR("stage"));
            objc_msgSend(v17, "setWantsNewInvitationToken:", 1);
            v42[0] = MEMORY[0x1E0C809B0];
            v42[1] = 3221225472;
            v42[2] = __42__HMUserCloudShareWithOwnerOperation_main__block_invoke_62;
            v42[3] = &unk_1E3AB3390;
            v19 = *(void **)(a1 + 32);
            v20 = *(id *)(a1 + 40);
            v42[4] = *(_QWORD *)(a1 + 32);
            v43 = v20;
            v44 = *(_QWORD *)(a1 + 48);
            objc_msgSend(v19, "saveShareAndObtainSavedOwner:completion:", v5, v42);
            v21 = v43;
          }
          else
          {
            if (objc_msgSend(v17, "acceptanceStatus") == 2)
            {
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", &unk_1E3B2E6F8, CFSTR("stage"));
              v27 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 248);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_INFO, "Owner has already accepted the share.", buf, 2u);
              }
              v28 = [HMHomeCloudShareResponse alloc];
              objc_msgSend(*(id *)(a1 + 32), "ownerUser");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = -[HMHomeCloudShareResponse initWithOwnerUser:pariticipant:clientInfo:](v28, "initWithOwnerUser:pariticipant:clientInfo:", v29, v17, 0);

              (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
              goto LABEL_36;
            }
            v31 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 248);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B1B0000, v31, OS_LOG_TYPE_INFO, "Owner exists in the share participants remove and re-invite.", buf, 2u);
            }
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", &unk_1E3B2E710, CFSTR("stage"));
            v38[0] = MEMORY[0x1E0C809B0];
            v38[1] = 3221225472;
            v38[2] = __42__HMUserCloudShareWithOwnerOperation_main__block_invoke_67;
            v38[3] = &unk_1E3AB3368;
            v32 = *(void **)(a1 + 32);
            v33 = *(id *)(a1 + 40);
            v38[4] = *(_QWORD *)(a1 + 32);
            v34 = *(_QWORD *)(a1 + 48);
            v40 = v33;
            v41 = v34;
            v39 = v5;
            objc_msgSend(v32, "removeOwnerAsParticipant:completion:", v17, v38);

            v21 = v40;
          }

          goto LABEL_36;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (v12)
        continue;
      break;
    }
LABEL_17:

LABEL_25:
    v22 = *(_QWORD **)(a1 + 32);
    v23 = v22[31];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_INFO, "Owner not present on the share inviting.", buf, 2u);
      v22 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v22, "share");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addParticipant:", v5);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", &unk_1E3B2E728, CFSTR("stage"));
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __42__HMUserCloudShareWithOwnerOperation_main__block_invoke_71;
    v35[3] = &unk_1E3AB3390;
    v25 = *(void **)(a1 + 32);
    v26 = *(id *)(a1 + 40);
    v35[4] = *(_QWORD *)(a1 + 32);
    v36 = v26;
    v37 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v25, "saveShareAndObtainSavedOwner:completion:", v5, v35);
    v17 = v36;
LABEL_36:

  }
}

void __42__HMUserCloudShareWithOwnerOperation_main__block_invoke_62(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 248);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "Sending share after saving for token.", v12, 2u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", &unk_1E3B2E6E0, CFSTR("stage"));
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "ownerUser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentUser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "share");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendShareToOwner:from:savedOwnerAsParticipant:share:completion:", v9, v10, v5, v11, *(_QWORD *)(a1 + 40));

  }
}

void __42__HMUserCloudShareWithOwnerOperation_main__block_invoke_67(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  uint8_t buf[16];

  v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 248);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "Adding owner again after removing.", buf, 2u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", &unk_1E3B2E728, CFSTR("stage"));
    objc_msgSend(*(id *)(a1 + 32), "share");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addParticipant:", *(_QWORD *)(a1 + 40));

    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__HMUserCloudShareWithOwnerOperation_main__block_invoke_69;
    v9[3] = &unk_1E3AB3390;
    v8 = *(id *)(a1 + 48);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v8;
    v11 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v6, "saveShareAndObtainSavedOwner:completion:", v7, v9);

  }
}

void __42__HMUserCloudShareWithOwnerOperation_main__block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 248);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "Sending share to owner.", v12, 2u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", &unk_1E3B2E758, CFSTR("stage"));
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "ownerUser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentUser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "share");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendShareToOwner:from:savedOwnerAsParticipant:share:completion:", v9, v10, v5, v11, *(_QWORD *)(a1 + 40));

  }
}

void __42__HMUserCloudShareWithOwnerOperation_main__block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 248);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "Sending share after adding owner again.", v12, 2u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", &unk_1E3B2E740, CFSTR("stage"));
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "ownerUser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentUser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "share");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendShareToOwner:from:savedOwnerAsParticipant:share:completion:", v9, v10, v5, v11, *(_QWORD *)(a1 + 40));

  }
}

void __101__HMUserCloudShareWithOwnerOperation_sendShareToOwner_from_savedOwnerAsParticipant_share_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  HMHomeCloudShareResponse *v13;
  void *v14;
  HMHomeCloudShareResponse *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 248);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 40);
      v17 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v20 = v16;
      v21 = 2112;
      v22 = v17;
      v23 = 2112;
      v24 = v6;
      _os_log_error_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_ERROR, "Unable to complete share to owner %@ from %@. Error %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    if (v5)
    {
      v18 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v18;
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 248);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "Completed share to owner %@ from %@ nonce %@.", buf, 0x20u);
    }
    if (v9)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
    else
    {
      v13 = [HMHomeCloudShareResponse alloc];
      objc_msgSend(*(id *)(a1 + 32), "ownerUser");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[HMHomeCloudShareResponse initWithOwnerUser:pariticipant:clientInfo:](v13, "initWithOwnerUser:pariticipant:clientInfo:", v14, *(_QWORD *)(a1 + 56), v8);

      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

  }
}

void __74__HMUserCloudShareWithOwnerOperation_removeOwnerAsParticipant_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 248);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_error_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "Got error while saving share to remove owner.", (uint8_t *)&v18, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v7, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    v14 = *(_QWORD **)(a1 + 32);
    v15 = v14[31];
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "Successfully removed owner from share", (uint8_t *)&v18, 2u);
        v14 = *(_QWORD **)(a1 + 32);
      }
      objc_msgSend(v14, "setShare:", v13);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v18 = 138412290;
        v19 = v7;
        _os_log_error_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "Unable to find share in saved records: %@", (uint8_t *)&v18, 0xCu);
      }
      v16 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Unexpected result after saving share"), CFSTR("Couldn't get CKShare"), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);

    }
  }

}

void __78__HMUserCloudShareWithOwnerOperation_saveShareAndObtainSavedOwner_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    if (objc_msgSend(v7, "count") != 1)
    {
      v20 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 248);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v7;
        _os_log_error_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "Unexpected number of saved records: %@", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Unexpected result after saving share"), CFSTR("Unexpected number of records"), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      if (!v21)
        goto LABEL_34;
      goto LABEL_33;
    }
    objc_msgSend(v7, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    if (v13)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend(v13, "participants", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v33;
LABEL_12:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v18);
          if ((objc_msgSend(v19, "isEqual:", *(_QWORD *)(a1 + 40)) & 1) != 0)
            break;
          if (v16 == ++v18)
          {
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            if (v16)
              goto LABEL_12;
            goto LABEL_18;
          }
        }
        v22 = v19;

        if (!v22)
          goto LABEL_25;
        objc_msgSend(*(id *)(a1 + 32), "setShare:", v13);
        v21 = 0;
LABEL_32:

        if (!v21)
        {
LABEL_34:
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

          goto LABEL_35;
        }
LABEL_33:

        v22 = 0;
        goto LABEL_34;
      }
LABEL_18:

LABEL_25:
      v23 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 248);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v29 = *(void **)(a1 + 40);
        v30 = v23;
        objc_msgSend(v13, "participants");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v37 = v29;
        v38 = 2112;
        v39 = v31;
        _os_log_error_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_ERROR, "Couldn't find participant %@ in share: %@", buf, 0x16u);

      }
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = CFSTR("Unable to find participant in saved share");
      v26 = CFSTR("Couldn't find owner as participant");
      v27 = 2;
    }
    else
    {
      v28 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 248);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v7;
        _os_log_error_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, "Unable to find share in saved records: %@", buf, 0xCu);
      }
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = CFSTR("Unexpected result after saving share");
      v26 = CFSTR("Couldn't get CKShare");
      v27 = 3;
    }
    objc_msgSend(v24, "hmErrorWithCode:description:reason:suggestion:", v27, v25, v26, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    goto LABEL_32;
  }
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 248);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v9;
    _os_log_error_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "Got error while saving share to add owner. %@", buf, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_35:

}

uint64_t __79__HMUserCloudShareWithOwnerOperation_fetchParticipantForLookupInfo_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __79__HMUserCloudShareWithOwnerOperation_fetchParticipantForLookupInfo_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 248);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_error_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_ERROR, "Got error while fetching participant participant: %@", (uint8_t *)&v10, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v6, 0);

  }
  else
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 248);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_error_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_ERROR, "Could not find a single participant.", (uint8_t *)&v10, 2u);
    }
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Unable to determine participant"), CFSTR("Couldn't get participant for CKShare"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

  }
}

void __101__HMUserCloudShareWithOwnerOperation_initWithShare_container_ownerUser_allowWriteAccess_currentUser___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD *v9;
  void (*v10)(id, _QWORD *);
  _Unwind_Exception *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;

  v4 = a2;
  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __101__HMUserCloudShareWithOwnerOperation_initWithShare_container_ownerUser_allowWriteAccess_currentUser___block_invoke_2;
  v12[3] = &unk_1E3AB3278;
  v7 = v5;
  v13 = v7;
  v8 = v4;
  v9 = v12;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v10 = (void (*)(id, _QWORD *))getAnalyticsSendEventLazySymbolLoc_ptr_34755;
  v18 = getAnalyticsSendEventLazySymbolLoc_ptr_34755;
  if (!getAnalyticsSendEventLazySymbolLoc_ptr_34755)
  {
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __getAnalyticsSendEventLazySymbolLoc_block_invoke_34756;
    v14[3] = &unk_1E3AB4620;
    v14[4] = &v15;
    __getAnalyticsSendEventLazySymbolLoc_block_invoke_34756((uint64_t)v14);
    v10 = (void (*)(id, _QWORD *))v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v10)
  {
    dlerror();
    v11 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v15, 8);
    _Unwind_Resume(v11);
  }
  v10(v8, v9);

}

id __101__HMUserCloudShareWithOwnerOperation_initWithShare_container_ownerUser_allowWriteAccess_currentUser___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t32 != -1)
    dispatch_once(&logCategory__hmf_once_t32, &__block_literal_global_75_34763);
  return (id)logCategory__hmf_once_v33;
}

void __49__HMUserCloudShareWithOwnerOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v33;
  logCategory__hmf_once_v33 = v0;

}

@end
