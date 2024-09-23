@implementation IDSCloudKitTransportLog

- (IDSCloudKitTransportLog)initWithDatabase:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  IDSCloudKitTransportLog *v9;
  IDSCloudKitTransportLog *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSCloudKitTransportLog;
  v9 = -[IDSCloudKitTransportLog init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
  }

  return v10;
}

- (id)_recordIDsToFetch
{
  id v2;
  const char *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  IDSCKRecordID *v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  const char *v22;
  double v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v6 = objc_msgSend_count(&unk_1E3C88800, v3, v4, v5);
  v9 = (void *)objc_msgSend_initWithCapacity_(v2, v7, v6, v8);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E3C88800, v10, (uint64_t)&v25, 0.0, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(&unk_1E3C88800);
        v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v14);
        v16 = [IDSCKRecordID alloc];
        v19 = (void *)objc_msgSend_initWithRecordName_(v16, v17, v15, v18);
        objc_msgSend_addObject_(v9, v20, (uint64_t)v19, v21);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E3C88800, v22, (uint64_t)&v25, v23, v29, 16);
    }
    while (v12);
  }
  return v9;
}

- (void)fetchChangesSinceToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  double v10;
  NSObject *v11;
  IDSCKFetchRecordsOperation *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  id v20;
  const char *v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  _QWORD v29[5];
  id v30;
  os_activity_scope_state_s state;
  NSObject *v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v32 = _os_activity_create(&dword_19B949000, "Fetching hard-coded transport log changes", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v32, &state);
  objc_msgSend_cloudKit(IDSFoundationLog, v8, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v6;
    _os_log_impl(&dword_19B949000, v11, OS_LOG_TYPE_DEFAULT, "!setState serverChangeToken=%@", buf, 0xCu);
  }

  v12 = [IDSCKFetchRecordsOperation alloc];
  objc_msgSend__recordIDsToFetch(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_initWithRecordIDs_(v12, v17, (uint64_t)v16, v18);

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_19BA4BAF8;
  v29[3] = &unk_1E3C20C48;
  v29[4] = self;
  v20 = v7;
  v30 = v20;
  objc_msgSend_setFetchRecordsCompletionBlock_(v19, v21, (uint64_t)v29, v22);
  objc_msgSend_database(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addOperation_(v26, v27, (uint64_t)v19, v28);

  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

- (void)createZone:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  NSObject *v8;
  IDSCKRecordZone *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  IDSCKModifyRecordZonesOperation *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  void *v23;
  id v24;
  const char *v25;
  double v26;
  const char *v27;
  uint64_t v28;
  double v29;
  void *v30;
  const char *v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *, uint64_t, void *);
  void *v36;
  IDSCloudKitTransportLog *v37;
  id v38;
  uint8_t buf[16];
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_cloudKit(IDSFoundationLog, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v8, OS_LOG_TYPE_DEFAULT, "TransportRecordZone - Create - Begin", buf, 2u);
  }

  v9 = [IDSCKRecordZone alloc];
  objc_msgSend__transportRecordZoneID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend_initWithZoneID_(v9, v14, (uint64_t)v13, v15);

  v17 = [IDSCKModifyRecordZonesOperation alloc];
  v40[0] = v16;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v40, v19, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_initWithRecordZonesToSave_recordZoneIDsToDelete_(v17, v21, (uint64_t)v20, v22, 0);

  v33 = MEMORY[0x1E0C809B0];
  v34 = 3221225472;
  v35 = sub_19BA4BFB4;
  v36 = &unk_1E3C1FAF0;
  v37 = self;
  v38 = v4;
  v24 = v4;
  objc_msgSend_setModifyRecordZonesCompletionBlock_(v23, v25, (uint64_t)&v33, v26);
  objc_msgSend_database(self, v27, v28, v29, v33, v34, v35, v36, v37);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addOperation_(v30, v31, (uint64_t)v23, v32);

}

- (void)dropZone:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  NSObject *v8;
  IDSCKModifyRecordZonesOperation *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  id v20;
  const char *v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, void *, void *);
  void *v32;
  IDSCloudKitTransportLog *v33;
  id v34;
  uint8_t buf[16];
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_cloudKit(IDSFoundationLog, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v8, OS_LOG_TYPE_DEFAULT, "TransportRecordZone - Drop - Begin", buf, 2u);
  }

  v9 = [IDSCKModifyRecordZonesOperation alloc];
  objc_msgSend__transportRecordZoneID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v14, (uint64_t)v36, v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_initWithRecordZonesToSave_recordZoneIDsToDelete_(v9, v17, 0, v18, v16);

  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = sub_19BA4C2A0;
  v32 = &unk_1E3C1FAF0;
  v33 = self;
  v34 = v4;
  v20 = v4;
  objc_msgSend_setModifyRecordZonesCompletionBlock_(v19, v21, (uint64_t)&v29, v22);
  objc_msgSend_database(self, v23, v24, v25, v29, v30, v31, v32, v33);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addOperation_(v26, v27, (uint64_t)v19, v28);

}

- (id)_transportRecordZoneID
{
  IDSCKRecordZoneID *v2;
  void *v3;
  const char *v4;
  double v5;
  void *v6;

  v2 = [IDSCKRecordZoneID alloc];
  sub_19BA18E94();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_initWithZoneName_ownerName_(v2, v4, (uint64_t)CFSTR("TransportZone"), v5, v3);

  return v6;
}

- (void)disabled_fetchChangesSinceToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  double v10;
  NSObject *v11;
  IDSCKRecordZoneID *v12;
  void *v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;
  IDSCKFetchRecordZoneChangesOptions *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  IDSCKFetchRecordZoneChangesOperation *v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  void *v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;
  id v37;
  uint64_t v38;
  id v39;
  const char *v40;
  double v41;
  id v42;
  id v43;
  const char *v44;
  double v45;
  const char *v46;
  uint64_t v47;
  double v48;
  void *v49;
  const char *v50;
  double v51;
  _QWORD v52[5];
  id v53;
  id v54;
  _QWORD v55[5];
  id v56;
  os_activity_scope_state_s state;
  NSObject *v58;
  void *v59;
  IDSCKFetchRecordZoneChangesOptions *v60;
  void *v61;
  uint8_t buf[4];
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v58 = _os_activity_create(&dword_19B949000, "Fetch transport log changes", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v58, &state);
  objc_msgSend_cloudKit(IDSFoundationLog, v8, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v63 = v6;
    _os_log_impl(&dword_19B949000, v11, OS_LOG_TYPE_DEFAULT, "!setState serverChangeToken=%@", buf, 0xCu);
  }

  v12 = [IDSCKRecordZoneID alloc];
  sub_19BA18E18();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19BA18E94();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend_initWithZoneName_ownerName_(v12, v15, (uint64_t)v13, v16, v14);

  v18 = objc_alloc_init(IDSCKFetchRecordZoneChangesOptions);
  objc_msgSend_ckToken(v6, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPreviousServerChangeToken_(v18, v23, (uint64_t)v22, v24);

  v25 = [IDSCKFetchRecordZoneChangesOperation alloc];
  v61 = v17;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v26, (uint64_t)&v61, v27, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v17;
  v60 = v18;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v29, (uint64_t)&v60, v30, &v59, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend_initWithRecordZoneIDs_optionsByRecordZoneID_(v25, v32, (uint64_t)v28, v33, v31);

  objc_msgSend_setFetchAllChanges_(v34, v35, 0, v36);
  v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v38 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = sub_19BA4C7A0;
  v55[3] = &unk_1E3C20C70;
  v55[4] = self;
  v39 = v37;
  v56 = v39;
  objc_msgSend_setRecordChangedBlock_(v34, v40, (uint64_t)v55, v41);
  v52[0] = v38;
  v52[1] = 3221225472;
  v52[2] = sub_19BA4C80C;
  v52[3] = &unk_1E3C20CC0;
  v52[4] = self;
  v42 = v7;
  v54 = v42;
  v43 = v39;
  v53 = v43;
  objc_msgSend_setRecordZoneFetchCompletionBlock_(v34, v44, (uint64_t)v52, v45);
  objc_msgSend_database(self, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addOperation_(v49, v50, (uint64_t)v34, v51);

  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

+ (id)_messageFromRecord:(id)a3
{
  id v3;
  IDSCloudKitTransportLogMessage *v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  const char *v25;
  double v26;
  const char *v27;
  void *v28;
  double v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  id v33;
  double v34;
  IDSCloudKitTransportLogMessage *v35;
  NSObject *v36;
  id v38;

  v3 = a3;
  v4 = objc_alloc_init(IDSCloudKitTransportLogMessage);
  objc_msgSend_objectForKey_(v3, v5, (uint64_t)CFSTR("secondary_id"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSecondaryID_(v4, v8, (uint64_t)v7, v9);

  objc_msgSend_objectForKey_(v3, v10, (uint64_t)CFSTR("payload"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPayload_(v4, v13, (uint64_t)v12, v14);

  objc_msgSend_objectForKey_(v3, v15, (uint64_t)CFSTR("encryption_type"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEncryptionType_(v4, v18, (uint64_t)v17, v19);

  objc_msgSend_objectForKey_(v3, v20, (uint64_t)CFSTR("device_id"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDeviceID_(v4, v23, (uint64_t)v22, v24);

  objc_msgSend_objectForKey_(v3, v25, (uint64_t)CFSTR("payload"), v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28)
    goto LABEL_4;
  v38 = 0;
  objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E0CB38B0], v27, (uint64_t)v28, v29, 0, 0, &v38);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v38;
  if (v30)
  {
    objc_msgSend_setPayload_(v4, v31, (uint64_t)v30, v34);

LABEL_4:
    v35 = v4;
    goto LABEL_8;
  }
  objc_msgSend_cloudKit(IDSFoundationLog, v31, v32, v34);
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
    sub_19BAF6FA8();

  v35 = 0;
LABEL_8:

  return v35;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (IDSCKDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
