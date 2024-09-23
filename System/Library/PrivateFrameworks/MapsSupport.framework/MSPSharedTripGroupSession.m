@implementation MSPSharedTripGroupSession

- (MSPSharedTripGroupSession)initWithService:(id)a3 groupID:(id)a4 initiator:(BOOL)a5 initiatorIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  MSPSharedTripGroupSession *v14;
  MSPSharedTripGroupSession *v15;
  uint64_t v16;
  NSMutableSet *identifiers;
  uint64_t v18;
  NSMutableSet *liveModeParticipantIdentifiers;
  id v20;
  uint64_t v21;
  OS_os_transaction *transaction;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)MSPSharedTripGroupSession;
  v14 = -[MSPSharedTripGroupSession init](&v24, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_initiator = a5;
    objc_storeStrong((id *)&v14->_groupID, a4);
    objc_storeStrong((id *)&v15->_sharingIDSService, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    identifiers = v15->_identifiers;
    v15->_identifiers = (NSMutableSet *)v16;

    objc_storeStrong((id *)&v15->_initiatorIdentifier, a6);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v18 = objc_claimAutoreleasedReturnValue();
    liveModeParticipantIdentifiers = v15->_liveModeParticipantIdentifiers;
    v15->_liveModeParticipantIdentifiers = (NSMutableSet *)v18;

    if (!v15->_initiator)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.mapspushd.ETAReceiving.%@"), v15->_groupID);
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v20, "UTF8String");
      v21 = os_transaction_create();
      transaction = v15->_transaction;
      v15->_transaction = (OS_os_transaction *)v21;

    }
  }

  return v15;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  MSPSharedTripGroupSession *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MSPGetSharedTripLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_INFO, "[GS] group dealloc %@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MSPSharedTripGroupSession;
  -[MSPSharedTripGroupSession dealloc](&v4, sel_dealloc);
}

- (NSString)identifier
{
  return self->_groupID;
}

- (NSArray)accountIdentifiers
{
  void *v2;
  void *v3;

  -[IDSService aliases](self->_sharingIDSService, "aliases");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)joinLiveModeFromHandle:(id)a3 fromAccountID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  ++self->_nbClients;
  v8 = a4;
  v9 = a3;
  MSPGetSharedTripLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_nbClients);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v11;
    _os_log_impl(&dword_1B39C0000, v10, OS_LOG_TYPE_DEFAULT, "[GS] joinLiveMode nbClients %@", (uint8_t *)&v14, 0xCu);

  }
  v12 = -[MSPSharedTripGroupSession _joinLiveModeFromHandle:fromAccountID:error:](self, "_joinLiveModeFromHandle:fromAccountID:error:", v9, v8, a5);

  return v12;
}

- (BOOL)leaveLiveModeIfNeeded:(id *)a3
{
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  --self->_nbClients;
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_nbClients);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEFAULT, "[GS] leaveLiveModeIfNeeded nbClients %@", (uint8_t *)&v8, 0xCu);

  }
  return self->_nbClients || -[MSPSharedTripGroupSession leaveLiveModeForced:](self, "leaveLiveModeForced:", a3);
}

- (BOOL)leaveLiveModeForced:(id *)a3
{
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v8[16];

  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEFAULT, "[GS] leaveLiveModeForced", v8, 2u);
  }

  v6 = -[MSPSharedTripGroupSession _leaveLiveMode:](self, "_leaveLiveMode:", a3);
  if (v6)
    -[MSPSharedTripGroupSession _sharingEnded](self, "_sharingEnded");
  return v6;
}

- (BOOL)_joinLiveModeFromHandle:(id)a3 fromAccountID:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  NSObject *v11;
  BOOL v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!self->_joined)
  {
    if (!-[MSPSharedTripGroupSession sendCommand:fromHandle:fromAccountID:error:](self, "sendCommand:fromHandle:fromAccountID:error:", 0x1E6658C68, v9, v10, a5))
    {
      v12 = 0;
      goto LABEL_7;
    }
    self->_joined = 1;
    objc_storeStrong((id *)&self->_joinedFromHandle, a3);
    objc_storeStrong((id *)&self->_joinedFromAccountIdentifier, a4);
    MSPGetSharedTripLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v10;
      _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_DEFAULT, "[GS] _joinLiveMode from accountID %@", (uint8_t *)&v14, 0xCu);
    }

  }
  v12 = 1;
LABEL_7:

  return v12;
}

- (BOOL)_leaveLiveMode:(id *)a3
{
  _BOOL4 v4;
  NSObject *v5;
  NSString *joinedFromHandle;
  NSString *v7;
  int v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!self->_joined)
  {
LABEL_6:
    LOBYTE(v4) = 1;
    return v4;
  }
  v4 = -[MSPSharedTripGroupSession sendCommand:fromHandle:fromAccountID:error:](self, "sendCommand:fromHandle:fromAccountID:error:", 0x1E6658C88, self->_joinedFromHandle, self->_joinedFromAccountIdentifier, a3);
  if (v4)
  {
    MSPGetSharedTripLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      joinedFromHandle = self->_joinedFromHandle;
      v9 = 138412290;
      v10 = joinedFromHandle;
      _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEFAULT, "[GS] _leaveLivemode from handle %@", (uint8_t *)&v9, 0xCu);
    }

    self->_joined = 0;
    v7 = self->_joinedFromHandle;
    self->_joinedFromHandle = 0;

    goto LABEL_6;
  }
  return v4;
}

- (BOOL)inLiveMode
{
  return self->_joined;
}

- (void)addSharingWith:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEFAULT, "[GS] addSharingWith %@", (uint8_t *)&v6, 0xCu);
  }

  if (objc_msgSend(v4, "count"))
    -[NSMutableSet addObjectsFromArray:](self->_identifiers, "addObjectsFromArray:", v4);

}

- (BOOL)sessionIsAliveAfterRemovingSharingIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableSet *identifiers;
  void *v7;
  BOOL v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEFAULT, "[GS] removeSharingWith %@", (uint8_t *)&v10, 0xCu);
  }

  if (!-[NSMutableSet count](self->_identifiers, "count"))
    goto LABEL_8;
  if (objc_msgSend(v4, "count"))
  {
    identifiers = self->_identifiers;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet minusSet:](identifiers, "minusSet:", v7);

    if (!-[NSMutableSet count](self->_identifiers, "count"))
    {
      -[MSPSharedTripGroupSession _sharingEnded](self, "_sharingEnded");
LABEL_8:
      v8 = 0;
      goto LABEL_9;
    }
  }
  v8 = 1;
LABEL_9:

  return v8;
}

- (void)_sharingEnded
{
  -[MSPSharedTripGroupSession _sharingEndedWithError:](self, "_sharingEndedWithError:", 0);
}

- (void)_sharingEndedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableSet *liveModeParticipantIdentifiers;
  id WeakRetained;
  uint8_t v8[16];

  v4 = a3;
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEFAULT, "[GS] _sharingEnded", v8, 2u);
  }

  liveModeParticipantIdentifiers = self->_liveModeParticipantIdentifiers;
  self->_liveModeParticipantIdentifiers = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "groupSessionEnded:withError:", self, v4);

}

- (BOOL)sendCommand:(id)a3 fromHandle:(id)a4 fromAccountID:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  IDSService *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  id v25;
  id v26;
  _QWORD v27[2];
  _QWORD v28[2];
  __CFString *v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self->_initiatorIdentifier);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MSPGetSharedTripLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v32 = v9;
    v33 = 2112;
    v34 = v12;
    v35 = 2112;
    v36 = v11;
    v37 = 2112;
    v38 = v10;
    _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_DEFAULT, "[GS] sendCommand: %@ to destination: %@ (from account: %@, handle: %@)", buf, 0x2Au);
  }

  v14 = self->_sharingIDSService;
  v29 = CFSTR("commandKey");
  v30 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0D34178];
  v27[0] = *MEMORY[0x1E0D34120];
  v27[1] = v16;
  v28[0] = MEMORY[0x1E0C9AAB0];
  v28[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSService _msp_accountFromIdentifier:](v14, "_msp_accountFromIdentifier:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = 0;
  -[IDSService sendMessage:fromAccount:toDestinations:priority:options:identifier:error:](v14, "sendMessage:fromAccount:toDestinations:priority:options:identifier:error:", v15, v18, v12, 300, v17, &v26, &v25);
  v19 = v26;
  v20 = v25;

  MSPGetSharedTripLog();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v20)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v20;
      _os_log_impl(&dword_1B39C0000, v22, OS_LOG_TYPE_ERROR, "[GS] sendCommand error: %{public}@", buf, 0xCu);
    }

    if (a6)
      *a6 = objc_retainAutorelease(v20);
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v19;
      _os_log_impl(&dword_1B39C0000, v22, OS_LOG_TYPE_INFO, "[GS] sent command messageUUID: %{public}@", buf, 0xCu);
    }

  }
  return v20 == 0;
}

- (BOOL)sendChunkedMessage:(id)a3 to:(id)a4 error:(id *)a5
{
  return -[MSPSharedTripGroupSession sendChunkedMessage:to:options:error:](self, "sendChunkedMessage:to:options:error:", a3, a4, 0, a5);
}

- (BOOL)sendChunkedMessage:(id)a3 to:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSString *v12;
  void *v13;
  IDSService *sharingIDSService;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  unint64_t v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  _BOOL4 v36;
  const char *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  id *v44;
  id v45;
  NSString *v46;
  uint64_t v47;
  MSPSharedTripGroupSession *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  id v54;
  _QWORD v55[5];
  _QWORD v56[5];
  _BYTE buf[12];
  __int16 v58;
  unint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  double v63;
  __int16 v64;
  id v65;
  _QWORD v66[3];

  v66[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v49 = a5;
  v12 = self->_groupID;
  v13 = (void *)MEMORY[0x1E0C99E60];
  v48 = self;
  sharingIDSService = self->_sharingIDSService;
  objc_msgSend(v11, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSService _msp_removeSelfFrom:](sharingIDSService, "_msp_removeSelfFrom:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = v17;
  if (!objc_msgSend(v17, "count"))
  {
    v34 = objc_msgSend(v11, "count");
    MSPGetSharedTripLog();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (v34)
    {
      if (v36)
      {
        *(_WORD *)buf = 0;
        v37 = "[GS] trying to send message without destinations after removing self";
LABEL_33:
        _os_log_impl(&dword_1B39C0000, v35, OS_LOG_TYPE_ERROR, v37, buf, 2u);
      }
    }
    else if (v36)
    {
      *(_WORD *)buf = 0;
      v37 = "[GS] trying to send message without destinations";
      goto LABEL_33;
    }

    v66[0] = *MEMORY[0x1E0CB2938];
    *(_QWORD *)buf = CFSTR("No contact handles provided");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v66, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)MEMORY[0x1E0CB35C8];
    v41 = 11;
    goto LABEL_35;
  }
  if (!v12)
  {
    MSPGetSharedTripLog();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B39C0000, v38, OS_LOG_TYPE_ERROR, "[GS] trying to send message without a groupID", buf, 2u);
    }

    v66[0] = *MEMORY[0x1E0CB2938];
    *(_QWORD *)buf = CFSTR("No IDS group ID");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v66, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)MEMORY[0x1E0CB35C8];
    v41 = 15;
LABEL_35:
    objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.SharedTrip"), v41, v39);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    if (!a6)
      goto LABEL_38;
    goto LABEL_36;
  }
  if (!v10)
  {
    MSPGetSharedTripLog();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B39C0000, v42, OS_LOG_TYPE_ERROR, "[GS] trying to send message without any message data", buf, 2u);
    }

    v66[0] = *MEMORY[0x1E0CB2938];
    *(_QWORD *)buf = CFSTR("No data for IDS message");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v66, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)MEMORY[0x1E0CB35C8];
    v41 = 16;
    goto LABEL_35;
  }
  v44 = a6;
  v45 = v11;
  v18 = objc_msgSend(v10, "length");
  v53 = (v18 - 1) / 0x2710 + 1;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUIDString");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v18 - 1) >> 4 >= 0x271)
  {
    MSPGetSharedTripLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134219011;
      *(double *)&buf[4] = (float)((float)v18 * 0.00097656);
      v58 = 2048;
      v59 = (v18 - 1) / 0x2710 + 1;
      v60 = 2048;
      v61 = 0x4023880000000000;
      v62 = 2113;
      v63 = *(double *)&v50;
      v64 = 2114;
      v65 = v49;
      _os_log_impl(&dword_1B39C0000, v20, OS_LOG_TYPE_INFO, "[GS] will send %#.3lfkB message in %lu chunks (up to %#.1lfkB each)\n\tdestinations: %{private}@\n\toptions: %{public}@", buf, 0x34u);
    }

  }
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v47 = *MEMORY[0x1E0CB2938];
  v46 = v12;
  do
  {
    if (v18 >= 0x2710)
      v24 = 10000;
    else
      v24 = v18;
    objc_msgSend(v10, "subdataWithRange:", v21, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v52 = v22;
      v55[0] = 0x1E6658BA8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v53);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = v26;
      v55[1] = 0x1E6658BC8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v56[1] = v27;
      v56[2] = v25;
      v55[2] = 0x1E6658C28;
      v55[3] = 0x1E6658C08;
      v55[4] = 0x1E6658BE8;
      v56[3] = v12;
      v56[4] = v51;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 5);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "plistData");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      MSPGetSharedTripLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = objc_msgSend(v29, "length");
        *(_DWORD *)buf = 134218754;
        *(_QWORD *)&buf[4] = v23 + 1;
        v12 = v46;
        v58 = 2048;
        v59 = v53;
        v60 = 2114;
        v61 = (uint64_t)v51;
        v62 = 2048;
        v63 = (float)((float)v31 * 0.00097656);
        _os_log_impl(&dword_1B39C0000, v30, OS_LOG_TYPE_INFO, "[GS] - chunked-message %lu/%lu: UUID: %{public}@ data length %.3fkB", buf, 0x2Au);
      }

      v54 = v52;
      -[MSPSharedTripGroupSession _sendChunkMessage:to:packet:options:error:](v48, "_sendChunkMessage:to:packet:options:error:", v29, v50, v28, v49, &v54);
      v22 = v54;

    }
    else
    {
      v28 = v22;
      MSPGetSharedTripLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v23;
        _os_log_impl(&dword_1B39C0000, v32, OS_LOG_TYPE_ERROR, "[GS] - trying to send message chunk %lu without any packet data", buf, 0xCu);
      }

      v66[0] = v47;
      *(_QWORD *)buf = CFSTR("No data for IDS message");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v66, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.SharedTrip"), 16, v33);
      v22 = (id)objc_claimAutoreleasedReturnValue();

    }
    ++v23;
    v21 += 10000;
    v18 -= 10000;
  }
  while (v53 != v23);

  a6 = v44;
  v11 = v45;
  if (v44)
  {
LABEL_36:
    if (v22)
      *a6 = objc_retainAutorelease(v22);
  }
LABEL_38:

  return v22 == 0;
}

- (BOOL)_sendChunkMessage:(id)a3 to:(id)a4 packet:(id)a5 options:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  IDSService *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  id v31;
  id v32;
  id v33;
  _BYTE buf[12];
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  MSPGetSharedTripLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_sendChunkMessage", (const char *)&unk_1B3A3EAC5, buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D34358], "_msp_IDSIdentifierFor:", self->_initiatorIdentifier);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if (v14)
      v17 = (void *)objc_msgSend(v14, "mutableCopy");
    else
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    v22 = v17;
    objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D34120]);
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D34178]);
    MSPGetSharedTripLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0D341B0]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0D341B8]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v24;
      v35 = 2112;
      v36 = v25;
      v37 = 2112;
      v38 = v13;
      v39 = 2112;
      v40 = v12;
      _os_log_impl(&dword_1B39C0000, v23, OS_LOG_TYPE_INFO, "[GS] sendChunkMessage (requiring %@, lacking %@, packet %@, destinations %@)", buf, 0x2Au);

    }
    v26 = self->_sharingIDSService;
    -[IDSService _msp_currentAccount](v26, "_msp_currentAccount");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v33 = 0;
    -[IDSService sendData:fromAccount:toDestinations:priority:options:identifier:error:](v26, "sendData:fromAccount:toDestinations:priority:options:identifier:error:", v31, v27, v12, 300, v22, &v33, &v32);
    v21 = v33;
    v20 = v32;

  }
  else
  {
    MSPGetSharedTripLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v13;
      v35 = 2112;
      v36 = v12;
      _os_log_impl(&dword_1B39C0000, v18, OS_LOG_TYPE_ERROR, "[GS] sendChunkMessage failing on invalid account (packet: %@, destinations %@)", buf, 0x16u);
    }

    v41[0] = *MEMORY[0x1E0CB2938];
    *(_QWORD *)buf = CFSTR("Invalid account for sharing");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v41, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Maps.SharedTrip"), 5, v19);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    v21 = 0;
  }
  MSPGetSharedTripLog();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v20)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v20;
      _os_log_impl(&dword_1B39C0000, v29, OS_LOG_TYPE_ERROR, "[GS] sendChunkMessage error: %{public}@", buf, 0xCu);
    }

    if (a7)
      *a7 = objc_retainAutorelease(v20);
  }
  else
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v21;
      _os_log_impl(&dword_1B39C0000, v29, OS_LOG_TYPE_INFO, "[GS] sent chunk messageUUID: %{public}@", buf, 0xCu);
    }

  }
  return v20 == 0;
}

- (id)_currentRoutePath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[MSPMapsPaths mapsApplicationContainerPaths](MSPMapsPaths, "mapsApplicationContainerPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cacheDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("route.data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_isValidParticipant:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSMutableSet *identifiers;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  NSMutableSet *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(":"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MSPGetSharedTripLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    identifiers = self->_identifiers;
    *(_DWORD *)buf = 138412802;
    v26 = v4;
    v27 = 2112;
    v28 = v6;
    v29 = 2112;
    v30 = identifiers;
    _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_INFO, "[GS] _validParticipant %@ -> %@ in %@", buf, 0x20u);
  }

  if (objc_msgSend(v6, "length"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = (void *)-[NSMutableSet copy](self->_identifiers, "copy");
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v19 = v5;
      v12 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR(":"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "lastObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v6);

          if ((v16 & 1) != 0)
          {
            v17 = 1;
            goto LABEL_14;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v11)
          continue;
        break;
      }
      v17 = 0;
LABEL_14:
      v5 = v19;
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)participantDidJoin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *WeakRetained;
  const char *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MSPSharedTripGroupSession _isValidParticipant:](self, "_isValidParticipant:", v6))
  {
    v7 = -[NSMutableSet containsObject:](self->_liveModeParticipantIdentifiers, "containsObject:", v4);
    MSPGetSharedTripLog();
    v8 = objc_claimAutoreleasedReturnValue();
    WeakRetained = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v11 = 138412290;
        v12 = v4;
        v10 = "[GS] participant already present %@";
LABEL_7:
        _os_log_impl(&dword_1B39C0000, WeakRetained, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412290;
        v12 = v4;
        _os_log_impl(&dword_1B39C0000, WeakRetained, OS_LOG_TYPE_DEFAULT, "[GS] participantDidJoin %@", (uint8_t *)&v11, 0xCu);
      }

      -[NSMutableSet addObject:](self->_liveModeParticipantIdentifiers, "addObject:", v4);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      -[NSObject groupSession:participantDidJoin:](WeakRetained, "groupSession:participantDidJoin:", self, v4);
    }
  }
  else
  {
    MSPGetSharedTripLog();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v6;
      v10 = "[GS] participantDidJoin discard invalid %@";
      goto LABEL_7;
    }
  }

}

- (void)participantDidLeave:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *WeakRetained;
  const char *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[MSPSharedTripGroupSession _isValidParticipant:](self, "_isValidParticipant:", v6))
  {
    MSPGetSharedTripLog();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v11 = 138412290;
    v12 = v6;
    v10 = "[GS] participantDidLeave discard invalid %@";
LABEL_10:
    _os_log_impl(&dword_1B39C0000, WeakRetained, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v11, 0xCu);
    goto LABEL_11;
  }
  v7 = -[NSMutableSet containsObject:](self->_liveModeParticipantIdentifiers, "containsObject:", v4);
  MSPGetSharedTripLog();
  v8 = objc_claimAutoreleasedReturnValue();
  WeakRetained = v8;
  if ((v7 & 1) == 0)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v11 = 138412290;
    v12 = v4;
    v10 = "[GS] participant not present %@";
    goto LABEL_10;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1B39C0000, WeakRetained, OS_LOG_TYPE_DEFAULT, "[GS] participantDidLeave %@", (uint8_t *)&v11, 0xCu);
  }

  -[NSMutableSet removeObject:](self->_liveModeParticipantIdentifiers, "removeObject:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[NSObject groupSession:participantDidLeave:](WeakRetained, "groupSession:participantDidLeave:", self, v4);
LABEL_11:

}

- (NSString)initiatorIdentifier
{
  return self->_initiatorIdentifier;
}

- (NSString)initiatorDisplayName
{
  return self->_initiatorDisplayName;
}

- (void)setInitiatorDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (MSPSharedTripGroupSessionDelegate)delegate
{
  return (MSPSharedTripGroupSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_initiatorDisplayName, 0);
  objc_storeStrong((id *)&self->_initiatorIdentifier, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_sharingIDSService, 0);
  objc_storeStrong((id *)&self->_liveModeParticipantIdentifiers, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_joinedFromAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_joinedFromHandle, 0);
}

@end
