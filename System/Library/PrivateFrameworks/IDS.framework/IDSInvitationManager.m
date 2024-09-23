@implementation IDSInvitationManager

- (IDSInvitationManager)initWithServiceIdentifier:(id)a3
{
  id v4;
  IDSInvitationManager *v5;
  void *v6;
  _QWORD v8[4];
  IDSInvitationManager *v9;
  id v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSInvitationManager;
  v5 = -[IDSInvitationManager init](&v11, sel_init);
  if (v5)
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_190712798;
    v8[3] = &unk_1E2C607A8;
    v9 = v5;
    v10 = v4;
    objc_msgSend(v6, "performBlock:waitUntilDone:", v8, 1);

  }
  return v5;
}

- (NSSet)pendingInvitations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_190712944;
  v8[3] = &unk_1E2C60550;
  v8[4] = self;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v8, 1);

  v4 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allValues](self->_pendingInvitations, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v6;
}

- (NSSet)receivedInvitations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_190712A5C;
  v8[3] = &unk_1E2C60550;
  v8[4] = self;
  objc_msgSend(v3, "performBlock:waitUntilDone:", v8, 1);

  v4 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allValues](self->_receivedInvitations, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v6;
}

- (void)setupInvitationsForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  NSObject *v41;
  id v42;
  id obj;
  id obja;
  IDSInvitationManager *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  id v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_invitationsLoadedFromDisk)
  {
    v45 = self;
    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "blockUntilConnected");

    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "listener");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pendingInvitationsForService:", v4);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "listener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "receivedInvitationsForService:", v4);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    +[IDSLogging IDSService](IDSLogging, "IDSService");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v47, "allKeys");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v62 = v11;
      _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "setupInvitationsForService: Fetched pending invitations from daemon: %@", buf, 0xCu);

    }
    +[IDSLogging IDSService](IDSLogging, "IDSService");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v46, "allKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v62 = v13;
      _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "setupInvitationsForService: Fetched received invitations from daemon: %@", buf, 0xCu);

    }
    v42 = v4;

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    objc_msgSend(v47, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v57;
      v17 = *MEMORY[0x1E0CB2CD0];
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v57 != v16)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v18);
          v20 = objc_alloc(MEMORY[0x1E0CB3710]);
          objc_msgSend(v47, "objectForKey:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = 0;
          v22 = (void *)objc_msgSend(v20, "initForReadingFromData:error:", v21, &v55);
          v23 = v55;

          objc_msgSend(v22, "_enableStrictSecureDecodingMode");
          objc_msgSend(v22, "setDecodingFailurePolicy:", 0);
          v24 = objc_opt_class();
          v54 = v23;
          objc_msgSend(v22, "decodeTopLevelObjectOfClass:forKey:error:", v24, v17, &v54);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v54;

          if (v26)
          {
            +[IDSLogging IDSService](IDSLogging, "IDSService");
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v62 = v19;
              v63 = 2112;
              v64 = v26;
              _os_log_error_impl(&dword_1906E0000, v27, OS_LOG_TYPE_ERROR, "setupInvitationsForService: Failed to unarchive pending invitation {%@} with error {%@}", buf, 0x16u);
            }

          }
          else
          {
            -[NSMutableDictionary setObject:forKey:](v45->_pendingInvitations, "setObject:forKey:", v25, v19);
          }

          ++v18;
        }
        while (v15 != v18);
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      }
      while (v15);
    }

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(v46, "allKeys");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v51;
      v31 = *MEMORY[0x1E0CB2CD0];
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v51 != v30)
            objc_enumerationMutation(obja);
          v33 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v32);
          v34 = objc_alloc(MEMORY[0x1E0CB3710]);
          objc_msgSend(v46, "objectForKey:", v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = 0;
          v36 = (void *)objc_msgSend(v34, "initForReadingFromData:error:", v35, &v49);
          v37 = v49;

          objc_msgSend(v36, "_enableStrictSecureDecodingMode");
          objc_msgSend(v36, "setDecodingFailurePolicy:", 0);
          v38 = objc_opt_class();
          v48 = v37;
          objc_msgSend(v36, "decodeTopLevelObjectOfClass:forKey:error:", v38, v31, &v48);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v48;

          if (v40)
          {
            +[IDSLogging IDSService](IDSLogging, "IDSService");
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v62 = v33;
              v63 = 2112;
              v64 = v40;
              _os_log_error_impl(&dword_1906E0000, v41, OS_LOG_TYPE_ERROR, "setupInvitationsForService: Failed to unarchive received invitation {%@} with error {%@}", buf, 0x16u);
            }

          }
          else
          {
            -[NSMutableDictionary setObject:forKey:](v45->_receivedInvitations, "setObject:forKey:", v39, v33);
          }

          ++v32;
        }
        while (v29 != v32);
        v29 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
      }
      while (v29);
    }

    v45->_invitationsLoadedFromDisk = 1;
    v4 = v42;
  }

}

- (id)validateStrictDecodingForSentInvitation:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  id v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v24);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v24;
  if (v5)
  {
    v6 = v5;
    v7 = v3;
  }
  else
  {
    v23 = 0;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v4, &v23);
    v9 = v23;
    objc_msgSend(v8, "_enableStrictSecureDecodingMode");
    objc_msgSend(v8, "setDecodingFailurePolicy:", 0);
    v10 = objc_opt_class();
    v11 = *MEMORY[0x1E0CB2CD0];
    v22 = v9;
    objc_msgSend(v8, "decodeTopLevelObjectOfClass:forKey:error:", v10, v11, &v22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v22;

    if (!v6)
    {
      v20 = 0;
      goto LABEL_7;
    }
  }
  +[IDSLogging IDSService](IDSLogging, "IDSService");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    sub_1907E8BD4();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to validate strict decoding for invitation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v15 = *MEMORY[0x1E0CB2D50];
  v26[0] = v13;
  v16 = *MEMORY[0x1E0CB3388];
  v25[0] = v15;
  v25[1] = v16;
  objc_msgSend(v6, "userInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0CB2938]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v14, "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 55, v19);

LABEL_7:
  return v20;
}

- (void)sendInvitationToDestination:(id)a3 expirationDate:(id)a4 context:(id)a5 serverAcknowledgedBlock:(id)a6
{
  MEMORY[0x1E0DE7D20](self, sel_sendInvitationToDestination_expirationDate_context_options_serverAcknowledgedBlock_);
}

- (void)sendInvitationToDestination:(id)a3 expirationDate:(id)a4 context:(id)a5 options:(id)a6 serverAcknowledgedBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  IDSSentInvitation *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  IDSSentInvitation *v26;
  NSObject *v27;
  const __CFString *v28;
  uint64_t v29;
  NSMutableDictionary *pendingInvitations;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *delegateQueue;
  id v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  uint64_t *v40;
  _QWORD v41[5];
  IDSSentInvitation *v42;
  id v43;
  id v44;
  id v45;
  _QWORD *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  _QWORD block[4];
  id v54;
  id v55;
  _QWORD v56[5];
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint8_t buf[4];
  const __CFString *v65;
  __int16 v66;
  uint64_t v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v35 = a4;
  v37 = a5;
  v13 = a6;
  v14 = a7;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "blockUntilConnected");

  v16 = -[IDSSentInvitation initWithDestination:state:expirationDate:uniqueID:context:]([IDSSentInvitation alloc], "initWithDestination:state:expirationDate:uniqueID:context:", v12, 1, v35, 0, v37);
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = sub_1906EE1E4;
  v62 = sub_1906EE0C4;
  v63 = 0;
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = sub_1906EE1E4;
  v56[4] = sub_1906EE0C4;
  v57 = (id)0xAAAAAAAAAAAAAAAALL;
  -[IDSInvitation uniqueID](v16, "uniqueID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v57 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v18 = (id)objc_msgSend(v13, "mutableCopy");

  }
  else
  {
    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  -[IDSInvitation uniqueID](v16, "uniqueID", v35);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  IDSGetUUIDData();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValue:forKey:", v21, CFSTR("IDSSendMessageOptionUUID"));

  objc_msgSend(v18, "setValue:forKey:", &unk_1E2CAE198, CFSTR("IDSSendMessageOptionCommand"));
  -[IDSInvitationManager validateStrictDecodingForSentInvitation:](self, "validateStrictDecodingForSentInvitation:", v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v52 = -86;
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = sub_190713828;
    v41[3] = &unk_1E2C61570;
    v46 = v56;
    v25 = v14;
    v45 = v25;
    v41[4] = self;
    v47 = &v49;
    v26 = v16;
    v42 = v26;
    v43 = v12;
    v44 = v18;
    v48 = &v58;
    objc_msgSend(v24, "performBlock:waitUntilDone:", v41, 1);

    +[IDSLogging IDSService](IDSLogging, "IDSService");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      if (*((_BYTE *)v50 + 24))
        v28 = CFSTR("YES");
      else
        v28 = CFSTR("NO");
      v29 = v59[5];
      *(_DWORD *)buf = 138412546;
      v65 = v28;
      v66 = 2112;
      v67 = v29;
      _os_log_impl(&dword_1906E0000, v27, OS_LOG_TYPE_DEFAULT, "sendInvitationToDestination: received %@ from IDSService with error {%@}", buf, 0x16u);
    }

    if (*((_BYTE *)v50 + 24))
    {
      pendingInvitations = self->_pendingInvitations;
      -[IDSInvitation uniqueID](v26, "uniqueID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "UUIDString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](pendingInvitations, "setObject:forKey:", v26, v32);

    }
    else
    {
      +[IDSLogging IDSService](IDSLogging, "IDSService");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        sub_1907E8C34();

      if (!v25)
        goto LABEL_19;
      delegateQueue = self->_delegateQueue;
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = sub_19071393C;
      v38[3] = &unk_1E2C61598;
      v39 = v25;
      v40 = &v58;
      dispatch_async(delegateQueue, v38);
      v31 = v39;
    }

LABEL_19:
    _Block_object_dispose(&v49, 8);
    goto LABEL_20;
  }
  if (v14)
  {
    v23 = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_190713814;
    block[3] = &unk_1E2C60E00;
    v55 = v14;
    v54 = v22;
    dispatch_async(v23, block);

  }
LABEL_20:

  _Block_object_dispose(v56, 8);
  _Block_object_dispose(&v58, 8);

}

- (void)cancelInvitation:(id)a3 serverAcknowledgedBlock:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_cancelInvitation_options_serverAcknowledgedBlock_);
}

- (void)cancelInvitation:(id)a3 options:(id)a4 serverAcknowledgedBlock:(id)a5
{
  MEMORY[0x1E0DE7D20](self, sel_cancelInvitation_withContext_options_serverAcknowledgedBlock_);
}

- (void)cancelInvitation:(id)a3 withContext:(id)a4 options:(id)a5 serverAcknowledgedBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  const __CFString *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *delegateQueue;
  _QWORD block[4];
  id v32;
  uint64_t *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  _QWORD v45[5];
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint8_t buf[4];
  const __CFString *v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "blockUntilConnected");

  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = sub_1906EE1E4;
  v51 = sub_1906EE0C4;
  v52 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = sub_1906EE1E4;
  v45[4] = sub_1906EE0C4;
  v46 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(v10, "uniqueID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v46 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v16 = (id)objc_msgSend(v12, "mutableCopy");

  }
  else
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  objc_msgSend(v10, "uniqueID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  IDSGetUUIDData();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setValue:forKey:", v19, CFSTR("IDSSendMessageOptionUUID"));

  objc_msgSend(v16, "setValue:forKey:", &unk_1E2CAE1B0, CFSTR("IDSSendMessageOptionCommand"));
  objc_msgSend(v10, "setState:", 3);
  v20 = v11;
  if (!v11)
  {
    objc_msgSend(v10, "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "setContext:", v20);
  if (!v11)

  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_190713DC4;
  v34[3] = &unk_1E2C615C0;
  v38 = v45;
  v23 = v13;
  v37 = v23;
  v34[4] = self;
  v39 = &v41;
  v24 = v10;
  v35 = v24;
  v25 = v16;
  v36 = v25;
  v40 = &v47;
  objc_msgSend(v21, "performBlock:waitUntilDone:", v34, 1);

  +[IDSLogging IDSService](IDSLogging, "IDSService");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    if (*((_BYTE *)v42 + 24))
      v27 = CFSTR("YES");
    else
      v27 = CFSTR("NO");
    v28 = v48[5];
    *(_DWORD *)buf = 138412546;
    v54 = v27;
    v55 = 2112;
    v56 = v28;
    _os_log_impl(&dword_1906E0000, v26, OS_LOG_TYPE_DEFAULT, "cancelInvitation: received %@ from IDSService with error {%@}", buf, 0x16u);
  }

  if (!*((_BYTE *)v42 + 24))
  {
    +[IDSLogging IDSService](IDSLogging, "IDSService");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_1907E8C94();

    if (v23)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = v22;
      block[1] = 3221225472;
      block[2] = sub_190713F08;
      block[3] = &unk_1E2C61598;
      v32 = v23;
      v33 = &v47;
      dispatch_async(delegateQueue, block);

    }
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(v45, 8);

  _Block_object_dispose(&v47, 8);
}

- (void)acceptInvitation:(id)a3 withContext:(id)a4 serverAcknowledgedBlock:(id)a5
{
  MEMORY[0x1E0DE7D20](self, sel_acceptInvitation_withContext_options_serverAcknowledgedBlock_);
}

- (void)acceptInvitation:(id)a3 withContext:(id)a4 options:(id)a5 serverAcknowledgedBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  NSObject *v29;
  const __CFString *v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *delegateQueue;
  _QWORD v34[4];
  id v35;
  uint64_t *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  _QWORD v49[5];
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint8_t buf[4];
  const __CFString *v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "blockUntilConnected");

  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = sub_1906EE1E4;
  v55 = sub_1906EE0C4;
  v56 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = sub_1906EE1E4;
  v49[4] = sub_1906EE0C4;
  v50 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(v10, "uniqueID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v50 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v16 = (id)objc_msgSend(v12, "mutableCopy");

  }
  else
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  objc_msgSend(v10, "uniqueID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  IDSGetUUIDData();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setValue:forKey:", v19, CFSTR("IDSSendMessageOptionUUID"));

  objc_msgSend(v16, "setValue:forKey:", &unk_1E2CAE1C8, CFSTR("IDSSendMessageOptionCommand"));
  objc_msgSend(v10, "setState:", 4);
  objc_msgSend(v10, "setContext:", v11);
  v20 = (void *)MEMORY[0x1E0D34D18];
  objc_msgSend(v10, "fromID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "destinationWithURI:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = sub_1907143A8;
  v37[3] = &unk_1E2C61570;
  v42 = v49;
  v25 = v13;
  v41 = v25;
  v37[4] = self;
  v43 = &v45;
  v26 = v10;
  v38 = v26;
  v27 = v22;
  v39 = v27;
  v28 = v16;
  v40 = v28;
  v44 = &v51;
  objc_msgSend(v23, "performBlock:waitUntilDone:", v37, 1);

  +[IDSLogging IDSService](IDSLogging, "IDSService");
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    if (*((_BYTE *)v46 + 24))
      v30 = CFSTR("YES");
    else
      v30 = CFSTR("NO");
    v31 = v52[5];
    *(_DWORD *)buf = 138412546;
    v58 = v30;
    v59 = 2112;
    v60 = v31;
    _os_log_impl(&dword_1906E0000, v29, OS_LOG_TYPE_DEFAULT, "acceptInvitation: received %@ from IDSService with error {%@}", buf, 0x16u);
  }

  if (!*((_BYTE *)v46 + 24))
  {
    +[IDSLogging IDSService](IDSLogging, "IDSService");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      sub_1907E8CF4();

    if (v25)
    {
      delegateQueue = self->_delegateQueue;
      v34[0] = v24;
      v34[1] = 3221225472;
      v34[2] = sub_1907144C4;
      v34[3] = &unk_1E2C61598;
      v35 = v25;
      v36 = &v51;
      dispatch_async(delegateQueue, v34);

    }
  }

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(v49, 8);

  _Block_object_dispose(&v51, 8);
}

- (void)declineInvitation:(id)a3 serverAcknowledgedBlock:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_declineInvitation_options_serverAcknowledgedBlock_);
}

- (void)declineInvitation:(id)a3 options:(id)a4 serverAcknowledgedBlock:(id)a5
{
  MEMORY[0x1E0DE7D20](self, sel_declineInvitation_withContext_options_serverAcknowledgedBlock_);
}

- (void)declineInvitation:(id)a3 withContext:(id)a4 serverAcknowledgedBlock:(id)a5
{
  MEMORY[0x1E0DE7D20](self, sel_declineInvitation_withContext_options_serverAcknowledgedBlock_);
}

- (void)declineInvitation:(id)a3 withContext:(id)a4 options:(id)a5 serverAcknowledgedBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  NSObject *v30;
  const __CFString *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *delegateQueue;
  _QWORD v35[4];
  id v36;
  uint64_t *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  _QWORD v50[5];
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint8_t buf[4];
  const __CFString *v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "blockUntilConnected");

  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = sub_1906EE1E4;
  v56 = sub_1906EE0C4;
  v57 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = sub_1906EE1E4;
  v50[4] = sub_1906EE0C4;
  v51 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(v10, "uniqueID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v51 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v16 = (id)objc_msgSend(v12, "mutableCopy");

  }
  else
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  objc_msgSend(v10, "uniqueID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  IDSGetUUIDData();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setValue:forKey:", v19, CFSTR("IDSSendMessageOptionUUID"));

  objc_msgSend(v16, "setValue:forKey:", &unk_1E2CAE1E0, CFSTR("IDSSendMessageOptionCommand"));
  objc_msgSend(v10, "setState:", 5);
  v20 = v11;
  if (!v11)
  {
    objc_msgSend(v10, "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "setContext:", v20);
  if (!v11)

  v21 = (void *)MEMORY[0x1E0D34D18];
  objc_msgSend(v10, "fromID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "destinationWithURI:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = -86;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = sub_1907149A0;
  v38[3] = &unk_1E2C61570;
  v43 = v50;
  v26 = v13;
  v42 = v26;
  v38[4] = self;
  v44 = &v46;
  v27 = v10;
  v39 = v27;
  v28 = v23;
  v40 = v28;
  v29 = v16;
  v41 = v29;
  v45 = &v52;
  objc_msgSend(v24, "performBlock:waitUntilDone:", v38, 1);

  +[IDSLogging IDSService](IDSLogging, "IDSService");
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    if (*((_BYTE *)v47 + 24))
      v31 = CFSTR("YES");
    else
      v31 = CFSTR("NO");
    v32 = v53[5];
    *(_DWORD *)buf = 138412546;
    v59 = v31;
    v60 = 2112;
    v61 = v32;
    _os_log_impl(&dword_1906E0000, v30, OS_LOG_TYPE_DEFAULT, "declineInvitation: received %@ from IDSService with error {%@}", buf, 0x16u);
  }

  if (!*((_BYTE *)v47 + 24))
  {
    +[IDSLogging IDSService](IDSLogging, "IDSService");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_1907E8D54();

    if (v26)
    {
      delegateQueue = self->_delegateQueue;
      v35[0] = v25;
      v35[1] = 3221225472;
      v35[2] = sub_190714ABC;
      v35[3] = &unk_1E2C61598;
      v36 = v26;
      v37 = &v52;
      dispatch_async(delegateQueue, v35);

    }
  }

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(v50, 8);

  _Block_object_dispose(&v52, 8);
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v7 = a4;
  objc_storeWeak((id *)&self->_delegate, a3);
  if (v7)
    objc_storeStrong((id *)&self->_delegateQueue, a4);
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "blockUntilConnected");

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_190714BA0;
  v10[3] = &unk_1E2C60550;
  v10[4] = self;
  objc_msgSend(v9, "performBlock:waitUntilDone:", v10, 1);

}

- (BOOL)validateReceivedInvitation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *pendingInvitations;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  BOOL v26;
  _QWORD v28[5];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = sub_190714F84;
  v28[3] = &unk_1E2C60550;
  v28[4] = self;
  objc_msgSend(v5, "performBlock:waitUntilDone:", v28, 1);

  if (!v4)
  {
    +[IDSLogging IDSService](IDSLogging, "IDSService");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907E8DB4();
    goto LABEL_28;
  }
  objc_msgSend(v4, "expirationDate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v4, "expirationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "compare:", v9);

    if (v10 == -1)
    {
      +[IDSLogging IDSService](IDSLogging, "IDSService");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1907E8F94(v4, v12);
      goto LABEL_28;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    pendingInvitations = self->_pendingInvitations;
  else
    pendingInvitations = self->_receivedInvitations;
  objc_msgSend(v4, "uniqueID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](pendingInvitations, "objectForKey:", v14);
  v12 = objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "state") != 1)
  {
    if (!v12)
    {
      +[IDSLogging IDSService](IDSLogging, "IDSService");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_1907E8DE0(v4, v19);
      goto LABEL_27;
    }
    if (_os_feature_enabled_impl())
    {
      -[NSObject senderMergeID](v12, "senderMergeID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[NSObject senderMergeID](v12, "senderMergeID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "senderMergeID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqualToString:", v17);

        if ((v18 & 1) == 0)
        {
          +[IDSLogging IDSService](IDSLogging, "IDSService");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            sub_1907E8F04(v4);
LABEL_27:

LABEL_28:
          v26 = 0;
          goto LABEL_29;
        }
      }
      else
      {
        +[IDSLogging IDSService](IDSLogging, "IDSService");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject senderMergeID](v12, "senderMergeID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "senderMergeID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v30 = v21;
          v31 = 2112;
          v32 = v22;
          _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "Validating Invitation: Stored invitation's sender mergeId {%@} is invalid. Could not compare to received invitation's sender mergeId {%@}", buf, 0x16u);

        }
      }
    }
    objc_msgSend(v4, "uniqueID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject uniqueID](v12, "uniqueID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if ((v25 & 1) == 0)
    {
      +[IDSLogging IDSService](IDSLogging, "IDSService");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_1907E8E74(v4);
      goto LABEL_27;
    }
  }
  v26 = 1;
LABEL_29:

  return v26;
}

- (void)service:(id)a3 account:(id)a4 incomingInvitation:(id)a5 withContext:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSMutableDictionary *receivedInvitations;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "blockUntilConnected");

  if (-[IDSInvitationManager validateReceivedInvitation:](self, "validateReceivedInvitation:", v7))
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "state");
    if (v10 == 3)
    {
      +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uniqueID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "UUIDString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[IDSService accounts](self->_internal, "accounts");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "anyObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "serviceName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "removeReceivedInvitation:forService:", v33, v36);

      receivedInvitations = self->_receivedInvitations;
      objc_msgSend(v7, "uniqueID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "UUIDString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](receivedInvitations, "removeObjectForKey:", v39);

      -[IDSInvitationManager delegate](self, "delegate");
      v40 = objc_claimAutoreleasedReturnValue();
      if (!v40
        || (v41 = (void *)v40,
            -[IDSInvitationManager delegate](self, "delegate"),
            v42 = (void *)objc_claimAutoreleasedReturnValue(),
            v43 = objc_opt_respondsToSelector(),
            v42,
            v41,
            (v43 & 1) == 0))
      {
        +[IDSLogging IDSService](IDSLogging, "IDSService");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_1907E90E0();
        goto LABEL_19;
      }
      -[IDSInvitationManager delegate](self, "delegate");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "manager:senderDidCancelInvitation:", self, v7);

      +[IDSLogging IDSService](IDSLogging, "IDSService");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v45 = objc_msgSend(v7, "state");
        objc_msgSend(v7, "uniqueID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "UUIDString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v48 = v45;
        v49 = 2112;
        v50 = v28;
        v29 = "IncomingInvitation: Invitation state %ld. Delivered {%@} to delegate senderDidCancelInvitation";
        goto LABEL_12;
      }
    }
    else
    {
      if (v10 != 1)
      {
        +[IDSLogging IDSService](IDSLogging, "IDSService");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_1907E901C(v7);
        goto LABEL_19;
      }
      +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[IDSService accounts](self->_internal, "accounts");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "anyObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "serviceName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uniqueID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "persistReceivedInvitation:forService:withUniqueID:", v9, v14, v16);

      v17 = self->_receivedInvitations;
      objc_msgSend(v7, "uniqueID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "UUIDString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v7, v19);

      -[IDSInvitationManager delegate](self, "delegate");
      v20 = objc_claimAutoreleasedReturnValue();
      if (!v20
        || (v21 = (void *)v20,
            -[IDSInvitationManager delegate](self, "delegate"),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = objc_opt_respondsToSelector(),
            v22,
            v21,
            (v23 & 1) == 0))
      {
        +[IDSLogging IDSService](IDSLogging, "IDSService");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_1907E90B4();
        goto LABEL_19;
      }
      -[IDSInvitationManager delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "manager:incomingInvitation:", self, v7);

      +[IDSLogging IDSService](IDSLogging, "IDSService");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_msgSend(v7, "state");
        objc_msgSend(v7, "uniqueID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "UUIDString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v48 = v26;
        v49 = 2112;
        v50 = v28;
        v29 = "IncomingInvitation: Invitation state %ld. Delivered {%@} to delegate incomingInvitation";
LABEL_12:
        _os_log_impl(&dword_1906E0000, v25, OS_LOG_TYPE_DEFAULT, v29, buf, 0x16u);

      }
    }
LABEL_19:

  }
}

- (void)service:(id)a3 account:(id)a4 incomingInvitationUpdate:(id)a5 withContext:(id)a6
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSMutableDictionary *pendingInvitations;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  void *v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "blockUntilConnected");

  if (-[IDSInvitationManager validateReceivedInvitation:](self, "validateReceivedInvitation:", v7))
  {
    v9 = objc_msgSend(v7, "state");
    if (v9 == 5)
    {
      +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uniqueID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "UUIDString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[IDSService accounts](self->_internal, "accounts");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "anyObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "serviceName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "removePendingInvitation:forService:", v33, v36);

      pendingInvitations = self->_pendingInvitations;
      objc_msgSend(v7, "uniqueID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "UUIDString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](pendingInvitations, "removeObjectForKey:", v39);

      -[IDSInvitationManager delegate](self, "delegate");
      v40 = objc_claimAutoreleasedReturnValue();
      if (!v40
        || (v41 = (void *)v40,
            -[IDSInvitationManager delegate](self, "delegate"),
            v42 = (void *)objc_claimAutoreleasedReturnValue(),
            v43 = objc_opt_respondsToSelector(),
            v42,
            v41,
            (v43 & 1) == 0))
      {
        +[IDSLogging IDSService](IDSLogging, "IDSService");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_1907E91D0();
        goto LABEL_19;
      }
      -[IDSInvitationManager delegate](self, "delegate");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "manager:receiverDidDeclineInvitation:", self, v7);

      +[IDSLogging IDSService](IDSLogging, "IDSService");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v45 = objc_msgSend(v7, "state");
        objc_msgSend(v7, "uniqueID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "UUIDString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v48 = v45;
        v49 = 2112;
        v50 = v28;
        v29 = "IncomingInvitationUpdate: Invitation state %ld. Delivered {%@} to delegate receiverDidDeclineInvitation";
        goto LABEL_12;
      }
    }
    else
    {
      if (v9 != 4)
      {
        +[IDSLogging IDSService](IDSLogging, "IDSService");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_1907E910C(v7);
        goto LABEL_19;
      }
      +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uniqueID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[IDSService accounts](self->_internal, "accounts");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "anyObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "serviceName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removePendingInvitation:forService:", v13, v16);

      v17 = self->_pendingInvitations;
      objc_msgSend(v7, "uniqueID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "UUIDString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v17, "removeObjectForKey:", v19);

      -[IDSInvitationManager delegate](self, "delegate");
      v20 = objc_claimAutoreleasedReturnValue();
      if (!v20
        || (v21 = (void *)v20,
            -[IDSInvitationManager delegate](self, "delegate"),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = objc_opt_respondsToSelector(),
            v22,
            v21,
            (v23 & 1) == 0))
      {
        +[IDSLogging IDSService](IDSLogging, "IDSService");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_1907E91A4();
        goto LABEL_19;
      }
      -[IDSInvitationManager delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "manager:receiverDidAcceptInvitation:", self, v7);

      +[IDSLogging IDSService](IDSLogging, "IDSService");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_msgSend(v7, "state");
        objc_msgSend(v7, "uniqueID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "UUIDString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v48 = v26;
        v49 = 2112;
        v50 = v28;
        v29 = "IncomingInvitationUpdate: Invitation state %ld. Delivered {%@} to delegate receiverDidAcceptInvitation";
LABEL_12:
        _os_log_impl(&dword_1906E0000, v25, OS_LOG_TYPE_DEFAULT, v29, buf, 0x16u);

      }
    }
LABEL_19:

  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  _BOOL4 v10;
  id v14;
  void *v15;
  NSObject *v16;
  const __CFString *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSMutableDictionary *receivedInvitations;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *delegateQueue;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSMutableDictionary *pendingInvitations;
  NSObject *v54;
  uint64_t v55;
  NSObject *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  _QWORD v62[4];
  NSObject *v63;
  uint64_t *v64;
  _QWORD block[4];
  NSObject *v66;
  NSObject *v67;
  _BYTE *v68;
  _QWORD v69[5];
  id v70;
  _BYTE *v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  void *v79;
  void *v80;
  uint8_t v81[4];
  id v82;
  __int16 v83;
  uint64_t v84;
  _BYTE buf[24];
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  uint64_t v89;

  v10 = a6;
  v89 = *MEMORY[0x1E0C80C00];
  v58 = a3;
  v59 = a4;
  v14 = a5;
  v61 = (uint64_t (*)(uint64_t, uint64_t))a7;
  v60 = a8;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "blockUntilConnected");

  +[IDSLogging IDSService](IDSLogging, "IDSService");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    if (v10)
      v17 = CFSTR("YES");
    *(_QWORD *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2112;
    v86 = v61;
    _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "InvitationManager didSendWithSuccess: Identifier {%@}. didSendWithSuccess {%@} with error %@", buf, 0x20u);
  }

  -[NSMutableDictionary objectForKey:](self->_pendingInvitations, "objectForKey:", v14);
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18
    || (-[NSMutableDictionary objectForKey:](self->_receivedInvitations, "objectForKey:", v14),
        (v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v86 = sub_1907161C8;
    v87 = sub_1907161F0;
    v88 = 0;
    v73 = 0;
    v74 = &v73;
    v75 = 0x3032000000;
    v76 = sub_1907161C8;
    v77 = sub_1907161F0;
    v78 = 0;
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = sub_1907161F8;
    v69[3] = &unk_1E2C615E8;
    v71 = buf;
    v69[4] = self;
    v57 = v14;
    v70 = v57;
    v72 = &v73;
    objc_msgSend(v19, "performBlock:waitUntilDone:", v69, 1);

    if (-[NSObject state](v18, "state") == 1)
    {
      if (v61)
      {
        -[NSMutableDictionary removeObjectForKey:](self->_pendingInvitations, "removeObjectForKey:", v57);
      }
      else
      {
        objc_msgSend(v60, "destinationCorrelationIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setSenderMergeID:](v18, "setSenderMergeID:", v31);

        objc_msgSend(v60, "fromID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "_stripFZIDPrefix");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "_bestGuessURI");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setSelfHandle:](v18, "setSelfHandle:", v34);

        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[IDSService accounts](self->_internal, "accounts");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "anyObject");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "serviceName");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject uniqueID](v18, "uniqueID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "UUIDString");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "persistPendingInvitation:forService:withUniqueID:", v35, v39, v41);

      }
      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        +[IDSLogging IDSService](IDSLogging, "IDSService");
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v43 = -[NSObject state](v18, "state");
          *(_DWORD *)v81 = 138412546;
          v82 = v57;
          v83 = 2048;
          v84 = v43;
          _os_log_impl(&dword_1906E0000, v42, OS_LOG_TYPE_DEFAULT, "InvitationManager didSendWithSuccess: Calling block for invitation with identifier {%@} and state {%ld}", v81, 0x16u);
        }

        delegateQueue = self->_delegateQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_190716288;
        block[3] = &unk_1E2C60C78;
        v66 = v61;
        v68 = buf;
        v67 = v18;
        dispatch_async(delegateQueue, block);

        v45 = v66;
        goto LABEL_32;
      }
      +[IDSLogging IDSService](IDSLogging, "IDSService");
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v81 = 138412290;
        v82 = v57;
LABEL_31:
        _os_log_impl(&dword_1906E0000, v45, OS_LOG_TYPE_DEFAULT, "InvitationManager didSendWithSuccess: No invitation ack block found with identifier {%@}", v81, 0xCu);
        goto LABEL_32;
      }
      goto LABEL_32;
    }
    if (!v61)
    {
      v20 = -[NSObject state](v18, "state");
      if ((unint64_t)(v20 - 4) >= 2)
      {
        if (v20 != 3)
          goto LABEL_25;
        +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject uniqueID](v18, "uniqueID");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "UUIDString");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = v48;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[IDSService accounts](self->_internal, "accounts");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "anyObject");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "serviceName");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "removePendingInvitation:forService:", v49, v52);

        pendingInvitations = self->_pendingInvitations;
        -[NSObject uniqueID](v18, "uniqueID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "UUIDString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](pendingInvitations, "removeObjectForKey:", v30);
      }
      else
      {
        +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject uniqueID](v18, "uniqueID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "UUIDString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[IDSService accounts](self->_internal, "accounts");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "anyObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "serviceName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeReceivedInvitation:forService:", v24, v27);

        receivedInvitations = self->_receivedInvitations;
        -[NSObject uniqueID](v18, "uniqueID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "UUIDString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](receivedInvitations, "removeObjectForKey:", v30);
      }

    }
LABEL_25:
    if (v74[5])
    {
      +[IDSLogging IDSService](IDSLogging, "IDSService");
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v55 = -[NSObject state](v18, "state");
        *(_DWORD *)v81 = 138412546;
        v82 = v57;
        v83 = 2048;
        v84 = v55;
        _os_log_impl(&dword_1906E0000, v54, OS_LOG_TYPE_DEFAULT, "InvitationManager didSendWithSuccess: Calling block for invitation with identifier {%@} and state {%ld}", v81, 0x16u);
      }

      v56 = self->_delegateQueue;
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = sub_1907162B8;
      v62[3] = &unk_1E2C60308;
      v64 = &v73;
      v63 = v61;
      dispatch_async(v56, v62);
      v45 = v63;
      goto LABEL_32;
    }
    +[IDSLogging IDSService](IDSLogging, "IDSService");
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v81 = 138412290;
      v82 = v57;
      goto LABEL_31;
    }
LABEL_32:

    _Block_object_dispose(&v73, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_33;
  }
  +[IDSLogging IDSService](IDSLogging, "IDSService");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    sub_1907E91FC();
LABEL_33:

}

- (void)removePendingInvitation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blockUntilConnected");

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSService accounts](self->_internal, "accounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removePendingInvitation:forService:", v9, v8);

  -[NSMutableDictionary removeObjectsForKeys:](self->_pendingInvitations, "removeObjectsForKeys:", v9);
}

- (void)removeReceivedInvitation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blockUntilConnected");

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSService accounts](self->_internal, "accounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeReceivedInvitation:forService:", v9, v8);

  -[NSMutableDictionary removeObjectsForKeys:](self->_receivedInvitations, "removeObjectsForKeys:", v9);
}

- (IDSService)internal
{
  return self->_internal;
}

- (IDSInvitationManagerDelegate)delegate
{
  return (IDSInvitationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_receivedInvitations, 0);
  objc_storeStrong((id *)&self->_pendingInvitations, 0);
  objc_storeStrong((id *)&self->_serverAcknowledgedBlockWithInvitationMap, 0);
  objc_storeStrong((id *)&self->_serverAcknowledgedBlockMap, 0);
}

@end
