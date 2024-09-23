@implementation IDSFamilyService

- (BOOL)isValidDestination:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  const __CFString *v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];
  uint64_t v36;
  _QWORD v37[3];

  v37[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[IDSFamilyService familyHandles](self, "familyHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v10)
    {
      v11 = v10;
      v26 = a4;
      v12 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          -[IDSFamilyService familyHandles](self, "familyHandles");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_stripFZIDPrefix");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "containsObject:", v16);

          if ((v17 & 1) == 0)
          {
            +[IDSLogging IDSService](IDSLogging, "IDSService");
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v14, "_stripFZIDPrefix");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v34 = v20;
              _os_log_impl(&dword_1906E0000, v19, OS_LOG_TYPE_DEFAULT, "Handle: %@ is not in family.", buf, 0xCu);

            }
            if (v26)
            {
              v31 = *MEMORY[0x1E0CB2D50];
              v32 = CFSTR("Could not send to non family member.");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 50, v21);
              *v26 = (id)objc_claimAutoreleasedReturnValue();

            }
            v18 = 0;
            goto LABEL_21;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        v18 = 1;
        if (v11)
          continue;
        break;
      }
    }
    else
    {
      v18 = 1;
    }
  }
  else
  {
    +[IDSLogging IDSService](IDSLogging, "IDSService");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "There are currently no family handles on service. Failing message, will try to fetch members.", buf, 2u);
    }

    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "blockUntilConnected");

    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "tryForceFamilyFetch");

    if (!a4)
    {
      v18 = 0;
      goto LABEL_22;
    }
    v36 = *MEMORY[0x1E0CB2D50];
    v37[0] = CFSTR("Family handles not loaded on service.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 52, v9);
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_21:

LABEL_22:
  return v18;
}

- (BOOL)sendMessage:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  BOOL v17;
  objc_super v19;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  if (-[IDSFamilyService isValidDestination:error:](self, "isValidDestination:error:", v15, a8))
  {
    v19.receiver = self;
    v19.super_class = (Class)IDSFamilyService;
    v17 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](&v19, sel_sendMessage_toDestinations_priority_options_identifier_error_, v14, v15, a5, v16, a7, a8);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)sendData:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  BOOL v17;
  objc_super v19;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  if (-[IDSFamilyService isValidDestination:error:](self, "isValidDestination:error:", v15, a8))
  {
    v19.receiver = self;
    v19.super_class = (Class)IDSFamilyService;
    v17 = -[IDSService sendData:toDestinations:priority:options:identifier:error:](&v19, sel_sendData_toDestinations_priority_options_identifier_error_, v14, v15, a5, v16, a7, a8);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)sendResourceAtURL:(id)a3 metadata:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  objc_super v21;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  if (-[IDSFamilyService isValidDestination:error:](self, "isValidDestination:error:", v17, a9))
  {
    v21.receiver = self;
    v21.super_class = (Class)IDSFamilyService;
    v19 = -[IDSService sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:](&v21, sel_sendResourceAtURL_metadata_toDestinations_priority_options_identifier_error_, v15, v16, v17, a6, v18, a8, a9);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)sendProtobuf:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  BOOL v17;
  objc_super v19;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  if (-[IDSFamilyService isValidDestination:error:](self, "isValidDestination:error:", v15, a8))
  {
    v19.receiver = self;
    v19.super_class = (Class)IDSFamilyService;
    v17 = -[IDSService sendProtobuf:toDestinations:priority:options:identifier:error:](&v19, sel_sendProtobuf_toDestinations_priority_options_identifier_error_, v14, v15, a5, v16, a7, a8);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)familyHandles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableSet *v10;
  NSMutableSet *familyHandles;
  NSMutableSet *v12;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blockUntilConnected");

  -[IDSService accounts](self, "accounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "listener");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "familyInfoForService:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D34708]);
  v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  familyHandles = self->familyHandles;
  self->familyHandles = v10;

  v12 = self->familyHandles;
  return v12;
}

- (void)fetchFamilyMembersWithDevices:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *listenerID;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blockUntilConnected");

  if (!self->listenerID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    listenerID = self->listenerID;
    self->listenerID = v6;

  }
  -[IDSService accounts](self, "accounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceName");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "listener");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "familyDevicesForService:listenerID:withCompletion:", v12, self->listenerID, v4);

}

- (NSDictionary)dsidToFamilyMember
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSDictionary *dsidToFamilyMember;
  NSDictionary *v19;
  NSDictionary *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blockUntilConnected");

  -[IDSService accounts](self, "accounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceName");
  v6 = objc_claimAutoreleasedReturnValue();

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "listener");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)v6;
  objc_msgSend(v8, "familyInfoForService:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D34728]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34D38]), "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v15));
        objc_msgSend(v16, "DSID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKey:](v10, "setObject:forKey:", v16, v17);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

  dsidToFamilyMember = self->_dsidToFamilyMember;
  self->_dsidToFamilyMember = v10;
  v19 = v10;

  v20 = self->_dsidToFamilyMember;
  return v20;
}

- (NSSet)familyMembers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSSet *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSSet *familyMembers;
  NSSet *v18;
  NSSet *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blockUntilConnected");

  -[IDSService accounts](self, "accounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "listener");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "familyInfoForService:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D34728], 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34D38]), "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15));
        -[NSSet addObject:](v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  familyMembers = self->_familyMembers;
  self->_familyMembers = v10;
  v18 = v10;

  v19 = self->_familyMembers;
  return v19;
}

- (void)service:(id)a3 familyInfoUpdated:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSSet *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSSet *familyMembers;
  NSSet *v21;
  NSMutableSet *v22;
  NSMutableSet *familyHandles;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[IDSService accounts](self, "accounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "isEqualToString:", v10);

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "accountEnabled");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v6;
      _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "Service received %@ familyInfoUpdated", buf, 0xCu);
    }

    v13 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D34728], 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34D38]), "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v18));
          -[NSSet addObject:](v13, "addObject:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v16);
    }

    familyMembers = self->_familyMembers;
    self->_familyMembers = v13;
    v21 = v13;

    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D34708]);
    v22 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    familyHandles = self->familyHandles;
    self->familyHandles = v22;

  }
}

- (void)setFamilyMembers:(id)a3
{
  objc_storeStrong((id *)&self->_familyMembers, a3);
}

- (void)setDsidToFamilyMember:(id)a3
{
  objc_storeStrong((id *)&self->_dsidToFamilyMember, a3);
}

- (NSDictionary)dsidToDeviceList
{
  return self->_dsidToDeviceList;
}

- (void)setDsidToDeviceList:(id)a3
{
  objc_storeStrong((id *)&self->_dsidToDeviceList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsidToDeviceList, 0);
  objc_storeStrong((id *)&self->_dsidToFamilyMember, 0);
  objc_storeStrong((id *)&self->_familyMembers, 0);
  objc_storeStrong((id *)&self->listenerID, 0);
  objc_storeStrong((id *)&self->familyHandles, 0);
}

@end
