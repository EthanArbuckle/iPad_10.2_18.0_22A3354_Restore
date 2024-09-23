@implementation ATXContactModeEntity

- (ATXContactModeEntity)initWithDisplayName:(id)a3 rawIdentifier:(id)a4 cnContactId:(id)a5
{
  return -[ATXContactModeEntity initWithDisplayName:rawIdentifier:cnContactId:stableContactIdentifier:](self, "initWithDisplayName:rawIdentifier:cnContactId:stableContactIdentifier:", a3, a4, a5, 0);
}

- (ATXContactModeEntity)initWithDisplayName:(id)a3 rawIdentifier:(id)a4 cnContactId:(id)a5 stableContactIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  ATXContactModeEntity *v16;
  uint64_t v17;
  NSString *displayName;
  uint64_t v19;
  NSString *rawIdentifier;
  uint64_t v21;
  NSString *cnContactId;
  uint64_t v23;
  NSString *stableContactIdentifier;
  void *v26;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (!v12 && !v13 && !v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXContactModeEntity.m"), 57, CFSTR("Attempted to initialize an ATXContactModeEntity without specifying a contact's rawIdentifier, cnContactId, or stableContactIdentifier. Terminating."));

  }
  v27.receiver = self;
  v27.super_class = (Class)ATXContactModeEntity;
  v16 = -[ATXContactModeEntity init](&v27, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v11, "copy");
    displayName = v16->_displayName;
    v16->_displayName = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    rawIdentifier = v16->_rawIdentifier;
    v16->_rawIdentifier = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    cnContactId = v16->_cnContactId;
    v16->_cnContactId = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    stableContactIdentifier = v16->_stableContactIdentifier;
    v16->_stableContactIdentifier = (NSString *)v23;

  }
  return v16;
}

- (id)identifier
{
  NSString *stableContactIdentifier;

  stableContactIdentifier = self->_stableContactIdentifier;
  if (!stableContactIdentifier)
  {
    stableContactIdentifier = self->_cnContactId;
    if (!stableContactIdentifier)
      stableContactIdentifier = self->_rawIdentifier;
  }
  return stableContactIdentifier;
}

- (id)jsonDict
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("displayName");
  -[ATXContactModeEntity displayName](self, "displayName");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v3;
  v19[0] = v3;
  v18[1] = CFSTR("rawIdentifier");
  -[ATXContactModeEntity rawIdentifier](self, "rawIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v5;
  v19[1] = v5;
  v18[2] = CFSTR("cnContactId");
  -[ATXContactModeEntity cnContactId](self, "cnContactId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[2] = v8;
  v18[3] = CFSTR("stableContactIdentifier");
  -[ATXContactModeEntity stableContactIdentifier](self, "stableContactIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[3] = v10;
  v18[4] = CFSTR("scoreMetadata");
  -[ATXContactModeEntity scoreMetadata](self, "scoreMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "jsonDict");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)

  if (!v9)
  if (!v7)

  if (!v6)
  if (!v4)

  return v14;
}

- (NSString)debugDescription
{
  void *v2;
  void *v3;

  -[ATXContactModeEntity jsonDict](self, "jsonDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)description
{
  id v3;
  void *v4;
  NSString *cnContactId;
  NSString *stableContactIdentifier;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXContactModeEntity identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_OWORD *)&self->_displayName;
  cnContactId = self->_cnContactId;
  stableContactIdentifier = self->_stableContactIdentifier;
  -[ATXContactModeEntity scoreMetadata](self, "scoreMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "score");
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("entityIdentifier: %@, displayName: %@, rawIdentifier: %@, cnContactId: %@, stableContactIdentifer: %@, score: %.3f"), v4, v11, cnContactId, stableContactIdentifier, v8);

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  ATXContactModeEntity *v4;
  ATXContactModeEntity *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (ATXContactModeEntity *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[ATXContactModeEntity identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXContactModeEntity identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToString:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ATXContactModeEntity identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (id)cnContactIdsOfFavoriteContactsWithContactStore:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C972F8]), "initWithContactStore:", v3, 0);
  objc_msgSend(v5, "entries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1A85A4F90]();
        objc_msgSend(v11, "contactProperty");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "contact");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v15);

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v4;
}

+ (id)vipContactEmailAddresses
{
  dispatch_semaphore_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  NSObject *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_semaphore_create(0);
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__16;
  v32 = __Block_byref_object_dispose__16;
  v33 = (id)objc_opt_new();
  v3 = (void *)objc_opt_new();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __48__ATXContactModeEntity_vipContactEmailAddresses__block_invoke;
  v25[3] = &unk_1E4D5BF08;
  v27 = &v28;
  v16 = v2;
  v26 = v16;
  objc_msgSend(v3, "getAllVIPsWithCompletion:", v25);

  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v16, 0, &__block_literal_global_73, 2.0);
  v4 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = (id)v29[5];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v35, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1A85A4F90]();
        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        objc_msgSend(v9, "emailAddresses");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v34, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v18;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v11);
              objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14++));
            }
            while (v12 != v14);
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v34, 16);
          }
          while (v12);
        }

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v35, 16);
    }
    while (v6);
  }

  _Block_object_dispose(&v28, 8);
  return v4;
}

void __48__ATXContactModeEntity_vipContactEmailAddresses__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[16];

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    __atxlog_handle_notification_management();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __48__ATXContactModeEntity_vipContactEmailAddresses__block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  }
  else
  {
    if (v6)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      goto LABEL_7;
    }
    __atxlog_handle_notification_management();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "EMVIPManager getAllVIPsWithCompletion returned nil VIP set", v15, 2u);
    }
  }

LABEL_7:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __48__ATXContactModeEntity_vipContactEmailAddresses__block_invoke_239()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __48__ATXContactModeEntity_vipContactEmailAddresses__block_invoke_239_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

+ (id)cnContactIdsOfEmergencyContacts
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  NSObject *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB6848]);
  v3 = objc_alloc_init(MEMORY[0x1E0CB6780]);
  v4 = (void *)objc_msgSend(v2, "initWithHealthStore:", v3);

  v5 = (void *)objc_opt_new();
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__16;
  v29 = __Block_byref_object_dispose__16;
  v30 = (id)objc_opt_new();
  v6 = dispatch_semaphore_create(0);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __55__ATXContactModeEntity_cnContactIdsOfEmergencyContacts__block_invoke;
  v22[3] = &unk_1E4D59238;
  v24 = &v25;
  v7 = v6;
  v23 = v7;
  objc_msgSend(v4, "fetchMedicalIDEmergencyContactsWithCompletion:", v22);
  v8 = v7;
  v9 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v8, v9);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = (id)v26[5];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v14, "nameContactIdentifier", (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v14, "nameContactIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v16);

        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
    }
    while (v11);
  }

  _Block_object_dispose(&v25, 8);
  return v5;
}

void __55__ATXContactModeEntity_cnContactIdsOfEmergencyContacts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[16];

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    __atxlog_handle_notification_management();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __55__ATXContactModeEntity_cnContactIdsOfEmergencyContacts__block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  }
  else
  {
    if (v6)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      goto LABEL_7;
    }
    __atxlog_handle_notification_management();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "HKMedicalIDStore fetchMedicalIDEmergencyContactsWithCompletion returned nil emergencyContacts array", v15, 2u);
    }
  }

LABEL_7:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (id)cnContactIdsOfICloudFamilyMembers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "fetchFamilyCircle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "members", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isMe") & 1) == 0)
        {
          objc_msgSend(v10, "contact");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v10, "contact");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "identifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v14);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)isVIPContactGivenVIPs:(id)a3 contactStore:(id)a4
{
  id v6;
  id v7;
  NSString *cnContactId;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  char v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  _BYTE v25[128];
  _QWORD v26[3];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  cnContactId = self->_cnContactId;
  if (cnContactId)
  {
    v26[0] = *MEMORY[0x1E0C966A8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v7, "unifiedContactWithIdentifier:keysToFetch:error:", cnContactId, v9, &v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v24;

    objc_msgSend(v10, "emailAddresses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      objc_msgSend(v10, "emailAddresses", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v21;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v21 != v15)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "value");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v6, "containsObject:", v17);

            if ((v18 & 1) != 0)
            {
              LOBYTE(v14) = 1;
              goto LABEL_14;
            }
          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          if (v14)
            continue;
          break;
        }
      }
LABEL_14:

    }
    else
    {
      LOBYTE(v14) = 0;
    }

  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[ATXContactModeEntity displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("codingKeyForDisplayName"));

  -[ATXContactModeEntity rawIdentifier](self, "rawIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("codingKeyForRawIdentifier"));

  -[ATXContactModeEntity cnContactId](self, "cnContactId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("codingKeyForCnContactId"));

  -[ATXContactModeEntity stableContactIdentifier](self, "stableContactIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("codingKeyForStableContactIdentifier"));

  -[ATXContactModeEntity scoreMetadata](self, "scoreMetadata");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("codingKeyForScoreMetadata"));

}

- (ATXContactModeEntity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXContactModeEntity *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_notification_management();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("codingKeyForDisplayName"), v4, 0, CFSTR("com.apple.proactive.decode.contactModeEntity"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_notification_management();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("codingKeyForRawIdentifier"), v4, 0, CFSTR("com.apple.proactive.decode.contactModeEntity"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v10 = 0;
LABEL_20:

      goto LABEL_21;
    }
    v16 = (void *)MEMORY[0x1E0D81610];
    v17 = objc_opt_class();
    __atxlog_handle_notification_management();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v17, CFSTR("codingKeyForCnContactId"), v4, 0, CFSTR("com.apple.proactive.decode.contactModeEntity"), -1, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v10 = 0;
LABEL_19:

      goto LABEL_20;
    }
    v21 = (void *)MEMORY[0x1E0D81610];
    v22 = objc_opt_class();
    __atxlog_handle_notification_management();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v22, CFSTR("codingKeyForStableContactIdentifier"), v4, 0, CFSTR("com.apple.proactive.decode.contactModeEntity"), -1, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v10 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v26 = (void *)MEMORY[0x1E0D81610];
    v27 = objc_opt_class();
    __atxlog_handle_notification_management();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v27, CFSTR("codingKeyForScoreMetadata"), v4, 0, CFSTR("com.apple.proactive.decode.contactModeEntity"), -1, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      if (v14 || v19 || v24)
      {
        self = -[ATXContactModeEntity initWithDisplayName:rawIdentifier:cnContactId:stableContactIdentifier:](self, "initWithDisplayName:rawIdentifier:cnContactId:stableContactIdentifier:", v8, v14, v19, v24);
        -[ATXContactModeEntity setScoreMetadata:](self, "setScoreMetadata:", v29);
        v10 = self;
        goto LABEL_17;
      }
      __atxlog_handle_notification_management();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[ATXContactModeEntity initWithCoder:].cold.1(v31, v32, v33, v34, v35, v36, v37, v38);

    }
    v10 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v10 = 0;
LABEL_21:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXContactModeEntity *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ATXContactModeEntity *v9;

  v4 = [ATXContactModeEntity alloc];
  -[ATXContactModeEntity displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXContactModeEntity rawIdentifier](self, "rawIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXContactModeEntity cnContactId](self, "cnContactId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXContactModeEntity stableContactIdentifier](self, "stableContactIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ATXContactModeEntity initWithDisplayName:rawIdentifier:cnContactId:stableContactIdentifier:](v4, "initWithDisplayName:rawIdentifier:cnContactId:stableContactIdentifier:", v5, v6, v7, v8);

  return v9;
}

- (ATXModeEntityScore)scoreMetadata
{
  return self->scoreMetadata;
}

- (void)setScoreMetadata:(id)a3
{
  objc_storeStrong((id *)&self->scoreMetadata, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)rawIdentifier
{
  return self->_rawIdentifier;
}

- (void)setRawIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_rawIdentifier, a3);
}

- (NSString)cnContactId
{
  return self->_cnContactId;
}

- (void)setCnContactId:(id)a3
{
  objc_storeStrong((id *)&self->_cnContactId, a3);
}

- (NSString)stableContactIdentifier
{
  return self->_stableContactIdentifier;
}

- (void)setStableContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_stableContactIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stableContactIdentifier, 0);
  objc_storeStrong((id *)&self->_cnContactId, 0);
  objc_storeStrong((id *)&self->_rawIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->scoreMetadata, 0);
}

void __48__ATXContactModeEntity_vipContactEmailAddresses__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a2, a3, "EMVIPManager getAllVIPsWithCompletion returned error: %@", a5, a6, a7, a8, 2u);
}

void __48__ATXContactModeEntity_vipContactEmailAddresses__block_invoke_239_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, a1, a3, "EMVIPManager getAllVIPsWithCompletion timed out", a5, a6, a7, a8, 0);
}

void __55__ATXContactModeEntity_cnContactIdsOfEmergencyContacts__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a2, a3, "HKMedicalIDStore fetchMedicalIDEmergencyContactsWithCompletion returned error: %@", a5, a6, a7, a8, 2u);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, a1, a3, "Unarchived ATXContactModeEntity with no rawIdentifier, cnContactId or stableContactIdentifier", a5, a6, a7, a8, 0);
}

@end
