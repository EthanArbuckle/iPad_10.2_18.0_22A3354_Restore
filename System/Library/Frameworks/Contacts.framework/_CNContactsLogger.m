@implementation _CNContactsLogger

- (void)fetchingContacts:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "FetchingContacts", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __38___CNContactsLogger_fetchingContacts___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __38___CNContactsLogger_fetchingContacts___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)fetchEncodedContactsMatchingPredicate:(id)a3 unifyResults:(BOOL)a4 keysToFetch:(id)a5
{
  -[_CNContactsLogger _commonFetchContactsMatchingPredicate:fetchType:unifyResults:keysToFetch:](self, "_commonFetchContactsMatchingPredicate:fetchType:unifyResults:keysToFetch:", a3, "encoded ", a4, a5);
}

- (void)_commonFetchContactsMatchingPredicate:(id)a3 fetchType:(const char *)a4 unifyResults:(BOOL)a5 keysToFetch:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *ClassName;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v7 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if (os_variant_has_internal_diagnostics())
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "shortDebugDescription");
    else
      objc_msgSend(v10, "description");
    v12 = objc_claimAutoreleasedReturnValue();
    -[_CNContactsLogger log](self, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = 136316162;
      v15 = a4;
      v16 = 2112;
      ClassName = (const char *)v12;
      v18 = 1024;
      v19 = v7;
      v20 = 2048;
      v21 = objc_msgSend(v11, "count");
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_18F8BD000, v13, OS_LOG_TYPE_INFO, "Fetching contacts %smatching predicate %@, unifyResults: %d, keysToFetch(%ld):%@", (uint8_t *)&v14, 0x30u);
    }

  }
  else
  {
    -[_CNContactsLogger log](self, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 136446978;
      v15 = a4;
      v16 = 2082;
      ClassName = object_getClassName(v10);
      v18 = 1024;
      v19 = v7;
      v20 = 2048;
      v21 = objc_msgSend(v11, "count");
      _os_log_impl(&dword_18F8BD000, v12, OS_LOG_TYPE_INFO, "Fetching contacts %{public}smatching predicate of class %{public}s, unifyResults: %d, keysToFetch: %ld", (uint8_t *)&v14, 0x26u);
    }
  }

}

- (void)fetchingContactsBatch:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "FetchingNextContactsBatch", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43___CNContactsLogger_fetchingContactsBatch___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __43___CNContactsLogger_fetchingContactsBatch___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)SPIUsageLackingEntitlementGrantedForPID:(int)a3
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(_QWORD *)&a3;
  -[_CNContactsLogger log](self, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[_CNContactsLogger SPIUsageLackingEntitlementGrantedForPID:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)SPIUsageLackingEntitlementGrantedForPID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18F8BD000, a2, a3, "Unauthorized Contacts SPI usage! Allowing it, please file a radar for pid %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)didFetchContacts:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_CNContactsLogger log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 134217984;
      v11 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_18F8BD000, v9, OS_LOG_TYPE_INFO, "Did fetch %ld contacts", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[_CNContactsLogger didFetchContacts:error:].cold.1();
  }

}

- (void)contactsAccessWasGranted
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNContactsLogger log](self, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18F8BD000, v2, OS_LOG_TYPE_INFO, "Contacts access was granted", v3, 2u);
  }

}

- (void)didFetchEncodedContacts:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_CNContactsLogger log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 134217984;
      v11 = objc_msgSend(v6, "length");
      _os_log_impl(&dword_18F8BD000, v9, OS_LOG_TYPE_INFO, "Did fetch contacts data, length: %ld", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[_CNContactsLogger didFetchEncodedContacts:error:].cold.1();
  }

}

- (OS_os_log)log
{
  return self->_log;
}

- (_CNContactsLogger)init
{
  _CNContactsLogger *v2;
  os_log_t v3;
  OS_os_log *log;
  _CNContactsLogger *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_CNContactsLogger;
  v2 = -[_CNContactsLogger init](&v7, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.contacts", "Contacts");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)fetchingContactCount:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "FetchingContactCount", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42___CNContactsLogger_fetchingContactCount___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __42___CNContactsLogger_fetchingContactCount___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)fetchingMeContactIdentifier:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "FetchingMeContactIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49___CNContactsLogger_fetchingMeContactIdentifier___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __49___CNContactsLogger_fetchingMeContactIdentifier___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)servicingContactsRequest:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "ServicingContactsRequest", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46___CNContactsLogger_servicingContactsRequest___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __46___CNContactsLogger_servicingContactsRequest___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)requestingAccessForContacts:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "RequestAccessForContacts", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49___CNContactsLogger_requestingAccessForContacts___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __49___CNContactsLogger_requestingAccessForContacts___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)fetchingContactWithUserActivity:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "FetchingContactWithUserActivity", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53___CNContactsLogger_fetchingContactWithUserActivity___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __53___CNContactsLogger_fetchingContactWithUserActivity___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)fetchingContactSectionCounts:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "FetchingContactSectionCount", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50___CNContactsLogger_fetchingContactSectionCounts___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __50___CNContactsLogger_fetchingContactSectionCounts___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)fetchingContainers:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "FetchingContainers", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40___CNContactsLogger_fetchingContainers___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __40___CNContactsLogger_fetchingContainers___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)XPCConnectionWasInvalidatedForService:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_CNContactsLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_INFO, "Service connection to %@ was invalidated", (uint8_t *)&v6, 0xCu);
  }

}

- (void)changingMeContact:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "ChangingMeContact", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39___CNContactsLogger_changingMeContact___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __39___CNContactsLogger_changingMeContact___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)fetchingContactIdentifierWithMatchingDictionary:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "FetchingContactIdentifierWithMatchingDictionary", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69___CNContactsLogger_fetchingContactIdentifierWithMatchingDictionary___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __69___CNContactsLogger_fetchingContactIdentifierWithMatchingDictionary___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)fetchingGroups:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "FetchingGroups", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36___CNContactsLogger_fetchingGroups___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __36___CNContactsLogger_fetchingGroups___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)fetchingDefaultContainerIdentifier:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "FetchingDefaultContainerID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56___CNContactsLogger_fetchingDefaultContainerIdentifier___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __56___CNContactsLogger_fetchingDefaultContainerIdentifier___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)saving:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "Saving", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __28___CNContactsLogger_saving___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __28___CNContactsLogger_saving___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)registeringForChangeHistory:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "RegisteringForChangeHistory", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49___CNContactsLogger_registeringForChangeHistory___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __49___CNContactsLogger_registeringForChangeHistory___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)unregisteringForChangeHistory:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "UnregisteringForChangeHistory", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51___CNContactsLogger_unregisteringForChangeHistory___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __51___CNContactsLogger_unregisteringForChangeHistory___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)fetchingChangeHistory:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "FetchingChangeHistory", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43___CNContactsLogger_fetchingChangeHistory___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __43___CNContactsLogger_fetchingChangeHistory___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)clearingChangeHistory:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "ClearingChangeHistory", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43___CNContactsLogger_clearingChangeHistory___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __43___CNContactsLogger_clearingChangeHistory___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)resettingSortDataIfNeeded:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "ResettingSortDataIfNeeded", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47___CNContactsLogger_resettingSortDataIfNeeded___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __47___CNContactsLogger_resettingSortDataIfNeeded___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)settingDefaultAccount:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "SettingDefaultAccount", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43___CNContactsLogger_settingDefaultAccount___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __43___CNContactsLogger_settingDefaultAccount___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)postingNotification:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "PostingContactsNotification", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41___CNContactsLogger_postingNotification___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __41___CNContactsLogger_postingNotification___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)requestingProviderDomainCommand:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "RequestingProviderDomainCommand", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53___CNContactsLogger_requestingProviderDomainCommand___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __53___CNContactsLogger_requestingProviderDomainCommand___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)gettingBackgroundColor:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "GettingBackgroundColor", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44___CNContactsLogger_gettingBackgroundColor___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __44___CNContactsLogger_gettingBackgroundColor___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)accessAuthorizationStatusWasDenied
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNContactsLogger log](self, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18F8BD000, v2, OS_LOG_TYPE_INFO, "Contacts TCC acccess status was denied", v3, 2u);
  }

}

- (void)requestAuthorizationWasDenied
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18F8BD000, log, OS_LOG_TYPE_ERROR, "Contacts TCC acccess request was denied", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)contactsAccessWasDeniedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_CNContactsLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_INFO, "Contacts access was denied, error: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)fetchContactsMatchingPredicate:(id)a3 unifyResults:(BOOL)a4 keysToFetch:(id)a5
{
  -[_CNContactsLogger _commonFetchContactsMatchingPredicate:fetchType:unifyResults:keysToFetch:](self, "_commonFetchContactsMatchingPredicate:fetchType:unifyResults:keysToFetch:", a3, ", a4, a5);
}

- (void)fetchContactsProgressivelyMatchingPredicate:(id)a3 unifyResults:(BOOL)a4 keysToFetch:(id)a5
{
  -[_CNContactsLogger _commonFetchContactsMatchingPredicate:fetchType:unifyResults:keysToFetch:](self, "_commonFetchContactsMatchingPredicate:fetchType:unifyResults:keysToFetch:", a3, "progressive ", a4, a5);
}

- (void)saveRequestInvalid:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNContactsLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNContactsLogger saveRequestInvalid:].cold.1();

}

- (void)saveRequestFailed:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNContactsLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNContactsLogger saveRequestFailed:].cold.1();

}

- (void)addingContacts:(id)a3 toContainerWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "_cn_map:", &__block_literal_global_128);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNContactsLogger log](self, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 134218498;
    v11 = objc_msgSend(v6, "count");
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_18F8BD000, v9, OS_LOG_TYPE_INFO, "Adding %ld contacts to container with identifier %@: contact identifiers %@", (uint8_t *)&v10, 0x20u);
  }

}

- (void)deletingContact:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_CNContactsLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_INFO, "Deleting contact with identifier: %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)updatingContact:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_CNContactsLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_INFO, "Updating contact with identifier: %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)changedMeContact:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_CNContactsLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_INFO, "Changed me contact: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)serviceError:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNContactsLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNContactsLogger serviceError:].cold.1();

}

- (void)SPIUsageLackingEntitlementRejectedForPID:(int)a3
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(_QWORD *)&a3;
  -[_CNContactsLogger log](self, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[_CNContactsLogger SPIUsageLackingEntitlementRejectedForPID:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)internalError:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNContactsLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNContactsLogger internalError:].cold.1();

}

- (void)errorWhenQueryingTetheredSyncData:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNContactsLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNContactsLogger errorWhenQueryingTetheredSyncData:].cold.1();

}

- (void)XPCConnectionWasInterruptedForService:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNContactsLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNContactsLogger XPCConnectionWasInterruptedForService:].cold.1();

}

- (void)postingNotificationWithName:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_CNContactsLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_INFO, "Posting notification %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)applyContactUpdateOfKind:(const char *)a3 value:(id)a4 property:(id)a5
{
  id v8;
  id v9;
  char v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const char *ClassName;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = objc_opt_respondsToSelector();
  -[_CNContactsLogger log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if ((v10 & 1) != 0)
  {
    if (v12)
    {
      v14 = 136446722;
      v15 = a3;
      v16 = 2114;
      v17 = v9;
      v18 = 2048;
      ClassName = (const char *)objc_msgSend(v8, "length");
      v13 = "Updating contact %{public}s, key: '%{public}@', value length %ld";
LABEL_7:
      _os_log_debug_impl(&dword_18F8BD000, v11, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v14, 0x20u);
    }
  }
  else if (v12)
  {
    v14 = 136446722;
    v15 = a3;
    v16 = 2114;
    v17 = v9;
    v18 = 2082;
    ClassName = object_getClassName(v8);
    v13 = "Updating contact %{public}s, key: '%{public}@', value class <%{public}s>";
    goto LABEL_7;
  }

}

- (void)setContactImageData:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_CNContactsLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = objc_msgSend(v4, "length");
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_DEFAULT, "[Likeness Update] Setting image data: %ld bytes with no cropRect specified", (uint8_t *)&v6, 0xCu);
  }

}

- (void)removeContactImageData
{
  NSObject *v2;
  uint8_t v3[16];

  -[_CNContactsLogger log](self, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18F8BD000, v2, OS_LOG_TYPE_DEFAULT, "[Likeness Update] Removing image data", v3, 2u);
  }

}

- (void)setContactImageData:(id)a3 format:(const char *)a4 cropRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  CGFloat v16;
  __int16 v17;
  CGFloat v18;
  __int16 v19;
  CGFloat v20;
  __int16 v21;
  CGFloat v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v25 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  -[_CNContactsLogger log](self, "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134219266;
    v14 = objc_msgSend(v11, "length");
    v15 = 2048;
    v16 = x;
    v17 = 2048;
    v18 = y;
    v19 = 2048;
    v20 = width;
    v21 = 2048;
    v22 = height;
    v23 = 2082;
    v24 = a4;
    _os_log_impl(&dword_18F8BD000, v12, OS_LOG_TYPE_DEFAULT, "[Likeness Update] Setting image data: %ld bytes with cropRect: {%.2f, %.2f, %.2f, %.2f}, %{public}s format", (uint8_t *)&v13, 0x3Eu);
  }

}

- (void)setContactImageDataZeroCropRect:(id)a3 format:(const char *)a4
{
  id v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_CNContactsLogger log](self, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218242;
    v9 = objc_msgSend(v6, "length");
    v10 = 2082;
    v11 = a4;
    _os_log_impl(&dword_18F8BD000, v7, OS_LOG_TYPE_DEFAULT, "[Likeness Update] Setting image data: %ld bytes with zero cropRect, %{public}s format", (uint8_t *)&v8, 0x16u);
  }

}

- (void)deleteImageRecentsMetadataRequestFailed:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNContactsLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNContactsLogger deleteImageRecentsMetadataRequestFailed:].cold.1();

}

- (void)deletePosterRecentsMetadataRequestFailed:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNContactsLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNContactsLogger deletePosterRecentsMetadataRequestFailed:].cold.1();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)didFetchContacts:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Unable to fetch contacts, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)didFetchEncodedContacts:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Unable to fetch contacts data, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)saveRequestInvalid:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Save request was invalid with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)saveRequestFailed:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Save request failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)serviceError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Error communicating with XPC Service: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)SPIUsageLackingEntitlementRejectedForPID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18F8BD000, a2, a3, "Unauthorized Contacts SPI usage! Rejecting it, please file a radar for pid %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)internalError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Unexpected internal error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)errorWhenQueryingTetheredSyncData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Error querying Tethered Sync data: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)XPCConnectionWasInterruptedForService:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Error: service connection to %@ was interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)deleteImageRecentsMetadataRequestFailed:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Save request to delete contact image recents metadata failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)deletePosterRecentsMetadataRequestFailed:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "Save request to delete contact poster recents metadata failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
