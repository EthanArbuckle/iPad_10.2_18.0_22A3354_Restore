@implementation MSASPhoneInvitations

- (MSASPhoneInvitations)init
{
  MSASPhoneInvitations *v2;
  uint64_t v3;
  IDSService *idsService;
  uint64_t v5;
  NSMutableDictionary *sendMessageIdentifierToPhone;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSASPhoneInvitations;
  v2 = -[MSASPhoneInvitations init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", CFSTR("com.apple.private.alloy.photostream"));
    idsService = v2->_idsService;
    v2->_idsService = (IDSService *)v3;

    -[IDSService addDelegate:queue:](v2->_idsService, "addDelegate:queue:", v2, MEMORY[0x1E0C80D38]);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    sendMessageIdentifierToPhone = v2->_sendMessageIdentifierToPhone;
    v2->_sendMessageIdentifierToPhone = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)addPendingPhoneInvitations:(id)a3 toOwnedAlbum:(id)a4 inStateMachin:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  MSASPhoneInvitations *v19;

  v9 = a4;
  objc_storeStrong((id *)&self->_stateMachine, a5);
  v15 = a5;
  v10 = a3;
  objc_storeStrong((id *)&self->_album, a4);
  -[IDSService accounts](self->_idsService, "accounts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "anyObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__MSASPhoneInvitations_addPendingPhoneInvitations_toOwnedAlbum_inStateMachin___block_invoke;
  v16[3] = &unk_1E95BA8D8;
  v17 = v9;
  v18 = v12;
  v19 = self;
  v13 = v12;
  v14 = v9;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v16);

}

- (void)removeSharingRelationships:(id)a3 forAlbum:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  IDSService *idsService;
  id v27;
  id v28;
  MSASPhoneInvitations *v29;
  id v30;
  void *v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  void *v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  id v55;
  _QWORD v56[2];
  _QWORD v57[2];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = self;
  v30 = a4;
  -[IDSService accounts](self->_idsService, "accounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v6;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
  if (v34)
  {
    v33 = *(_QWORD *)v43;
    v9 = MEMORY[0x1E0C81028];
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v43 != v33)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        objc_msgSend(v11, "phones");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v58, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v39;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v39 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
              v18 = (void *)MEMORY[0x1D82558D8](v17, 0, 1);
              if (v18)
              {
                objc_msgSend(v8, "addObject:", v18);
              }
              else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v49 = v17;
                _os_log_error_impl(&dword_1D3E94000, v9, OS_LOG_TYPE_ERROR, "IDS: Failed to create IDS identifier from %@", buf, 0xCu);
              }

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v58, 16);
          }
          while (v14);
        }

      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
    }
    while (v34);
  }

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "valueForKey:", CFSTR("MSASPhoneInvitationDebugFakeAlbumUUID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v20, "length"))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v20;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Using debugFakeAlbumGUID %@", buf, 0xCu);
      }
      objc_msgSend(v30, "setGUID:", v20);
    }
    v37 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v30, 1, &v37);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v37;
    if (v21)
    {
      v56[0] = CFSTR("albumData");
      v56[1] = CFSTR("type");
      v57[0] = v21;
      v57[1] = CFSTR("delete");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138544130;
        v49 = v23;
        v50 = 2112;
        v51 = v31;
        v52 = 2112;
        v53 = v8;
        v54 = 2114;
        v55 = v30;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "IDS: Send message %{public}@ from %@ to %@ for album %{public}@", buf, 0x2Au);
      }
      v46 = *MEMORY[0x1E0D341C8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D34090]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      idsService = v29->_idsService;
      v35 = 0;
      v36 = 0;
      LODWORD(v24) = -[IDSService sendMessage:fromAccount:toDestinations:priority:options:identifier:error:](idsService, "sendMessage:fromAccount:toDestinations:priority:options:identifier:error:", v23, v31, v8, 300, v25, &v36, &v35);
      v27 = v36;
      v28 = v35;
      if ((_DWORD)v24)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v49 = v27;
          _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "IDS: Send message with identifier %{public}@", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v49 = v28;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "IDS: Failed to send message. Error: %{public}@", buf, 0xCu);
      }

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v49 = v22;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to archive an album object: %{public}@", buf, 0xCu);
    }

  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  MSASAlbum *v12;
  MSASAlbum *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  MSASAlbum *album;
  void *v19;
  MSASAlbum *v20;
  void *v21;
  MSASAlbum *v22;
  void *v23;
  uint8_t buf[4];
  MSASAlbum *v25;
  __int16 v26;
  MSASAlbum *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v8 = a6;
  v36 = *MEMORY[0x1E0C80C00];
  v12 = (MSASAlbum *)a3;
  v13 = (MSASAlbum *)a4;
  v14 = a5;
  v15 = a7;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v15, "userInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v25 = v12;
    v26 = 2112;
    v27 = v13;
    v28 = 2114;
    v29 = v14;
    v30 = 1024;
    v31 = v8;
    v32 = 2114;
    v33 = v15;
    v34 = 2114;
    v35 = v23;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "IDS: Get send message callback for service %{public}@ account %@ identifier %{public}@ success %d error %{public}@ info %{public}@", buf, 0x3Au);

    if (!v14)
      goto LABEL_11;
  }
  else if (!v14)
  {
    goto LABEL_11;
  }
  -[NSMutableDictionary objectForKey:](self->_sendMessageIdentifierToPhone, "objectForKey:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_sendMessageIdentifierToPhone, "removeObjectForKey:", v14);
    -[MSASStateMachine delegate](self->_stateMachine, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "MSASStateMachine:didFinishSendingInvitationByPhone:toOwnedAlbum:info:error:", self->_stateMachine, v16, self->_album, 0, v15);

    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        album = self->_album;
        *(_DWORD *)buf = 138412802;
        v25 = v13;
        v26 = 2114;
        v27 = album;
        v28 = 2114;
        v29 = v14;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "IDS: Successfully send message from %@ for album %{public}@ with IDS identifier %{public}@.", buf, 0x20u);
      }
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      v20 = self->_album;
      objc_msgSend(v15, "userInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("IDS: Failed to send message from %@ for album %@ with identifier %@. Error: %@ Info: %@"), v13, v20, v14, v15, v21);
      v22 = (MSASAlbum *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v25 = v22;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

    }
  }

LABEL_11:
}

- (MSASStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (MSASAlbum)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_album, a3);
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
  objc_storeStrong((id *)&self->_idsService, a3);
}

- (NSMutableDictionary)sendMessageIdentifierToPhone
{
  return self->_sendMessageIdentifierToPhone;
}

- (void)setSendMessageIdentifierToPhone:(id)a3
{
  objc_storeStrong((id *)&self->_sendMessageIdentifierToPhone, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendMessageIdentifierToPhone, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
}

void __78__MSASPhoneInvitations_addPendingPhoneInvitations_toOwnedAlbum_inStateMachin___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[2];
  _QWORD v27[2];
  uint8_t buf[4];
  id v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  _QWORD v36[2];
  _QWORD v37[4];

  v37[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setMetadataValue:forKey:", a3, CFSTR("phoneInvitationToken"));
    v6 = *(_QWORD *)(a1 + 32);
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v25;
    if (v7)
    {
      v9 = (void *)MEMORY[0x1D82558D8](v5, 0, 1);
      if (v9)
      {
        v22 = v8;
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
        v10 = objc_claimAutoreleasedReturnValue();
        v36[0] = CFSTR("albumData");
        v36[1] = CFSTR("type");
        v37[0] = v7;
        v37[1] = CFSTR("new");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v13 = *(_QWORD *)(a1 + 32);
          v12 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138544130;
          v29 = v11;
          v30 = 2112;
          v31 = v12;
          v32 = 2112;
          v33 = v10;
          v34 = 2114;
          v35 = v13;
          _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "IDS: Send message %{public}@ from %@ to %@ for album %{public}@", buf, 0x2Au);
        }
        v26[0] = *MEMORY[0x1E0D341C8];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D34090]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v26[1] = *MEMORY[0x1E0D34150];
        v27[0] = v14;
        v27[1] = MEMORY[0x1E0C9AAA0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = *(_QWORD *)(a1 + 40);
        v17 = *(void **)(*(_QWORD *)(a1 + 48) + 24);
        v23 = 0;
        v24 = 0;
        v18 = (void *)v10;
        v19 = objc_msgSend(v17, "sendMessage:fromAccount:toDestinations:priority:options:identifier:error:", v11, v16, v10, 300, v15, &v24, &v23);
        v20 = v24;
        v21 = v23;
        if (v19)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v29 = v20;
            _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "IDS: Send message with identifier %{public}@", buf, 0xCu);
          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "setObject:forKey:", v5, v20);
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v29 = v21;
          _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "IDS: Failed to send message. Error: %{public}@", buf, 0xCu);
        }

        v8 = v22;
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v5;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "IDS: Failed to create IDS identifier from %@", buf, 0xCu);
      }

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v8;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to archive an album object: %{public}@", buf, 0xCu);
    }

  }
}

@end
