@implementation CNUICoreContactStoreTestFacade

- (CNUICoreContactStoreTestFacade)init
{
  CNUICoreContactStoreTestFacade *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreContactStoreTestFacade)initWithSaveError:(id)a3 fetchError:(id)a4
{
  id v6;
  id v7;
  CNUICoreContactStoreTestFacade *v8;
  CNUICoreContactStoreTestFacade *v9;
  CNUICoreContactStoreTestFacade *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CNUICoreContactStoreTestFacade;
  v8 = -[CNUICoreContactStoreTestFacade init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[CNUICoreContactStoreTestFacade commonInitWithMeContact:contacts:saveError:fetchError:](v8, "commonInitWithMeContact:contacts:saveError:fetchError:", 0, 0, v6, v7);
    v10 = v9;
  }

  return v9;
}

- (CNUICoreContactStoreTestFacade)initWithContacts:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CNUICoreContactStoreTestFacade *v13;
  CNUICoreContactStoreTestFacade *v14;
  CNUICoreContactStoreTestFacade *v15;
  objc_super v17;

  v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_14 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_14, &__block_literal_global_117);
    v5 = CNGuardOSLog_cn_once_object_0_14;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_14, OS_LOG_TYPE_FAULT))
      -[CNUICoreContactStoreTestFacade initWithContacts:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v17.receiver = self;
  v17.super_class = (Class)CNUICoreContactStoreTestFacade;
  v13 = -[CNUICoreContactStoreTestFacade init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    -[CNUICoreContactStoreTestFacade commonInitWithMeContact:contacts:saveError:fetchError:](v13, "commonInitWithMeContact:contacts:saveError:fetchError:", 0, v4, 0, 0);
    v15 = v14;
  }

  return v14;
}

- (CNUICoreContactStoreTestFacade)initWithMeContact:(id)a3 contacts:(id)a4
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
  uint64_t v15;
  CNUICoreContactStoreTestFacade *v16;
  CNUICoreContactStoreTestFacade *v17;
  CNUICoreContactStoreTestFacade *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    if (CNGuardOSLog_cn_once_token_0_14 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_14, &__block_literal_global_117);
    v8 = CNGuardOSLog_cn_once_object_0_14;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_14, OS_LOG_TYPE_FAULT))
      -[CNUICoreContactStoreTestFacade initWithMeContact:contacts:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  v20.receiver = self;
  v20.super_class = (Class)CNUICoreContactStoreTestFacade;
  v16 = -[CNUICoreContactStoreTestFacade init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    -[CNUICoreContactStoreTestFacade commonInitWithMeContact:contacts:saveError:fetchError:](v16, "commonInitWithMeContact:contacts:saveError:fetchError:", v6, v7, 0, 0);
    v18 = v17;
  }

  return v17;
}

- (void)commonInitWithMeContact:(id)a3 contacts:(id)a4 saveError:(id)a5 fetchError:(id)a6
{
  CNContact *v10;
  NSArray *v11;
  NSError *v12;
  NSError *v13;
  CNContact *meContact;
  NSArray *contacts;
  NSArray *v16;
  NSError *saveError;
  NSError *v18;
  NSError *fetchError;
  NSError *v20;
  NSArray *v21;
  NSArray *executedSaveRequests;
  NSArray *v23;
  NSArray *executedFetchRequests;
  CNContact *v25;

  v10 = (CNContact *)a3;
  v11 = (NSArray *)a4;
  v12 = (NSError *)a5;
  v13 = (NSError *)a6;
  meContact = self->_meContact;
  self->_meContact = v10;
  v25 = v10;

  contacts = self->_contacts;
  self->_contacts = v11;
  v16 = v11;

  saveError = self->_saveError;
  self->_saveError = v12;
  v18 = v12;

  fetchError = self->_fetchError;
  self->_fetchError = v13;
  v20 = v13;

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
  executedSaveRequests = self->_executedSaveRequests;
  self->_executedSaveRequests = v21;

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
  executedFetchRequests = self->_executedFetchRequests;
  self->_executedFetchRequests = v23;

}

- (id)_crossPlatformUnifiedMeContactWithKeysToFetch:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[CNUICoreContactStoreTestFacade meContact](self, "meContact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CNUICoreContactStoreTestFacade meContact](self, "meContact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copyWithPropertyKeys:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D13720], 1, MEMORY[0x1E0C9AA70]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;
    v9 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }

  return v9;
}

- (BOOL)enumerateContactsWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  CNUICoreContactStoreTestFacade *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v8 = a3;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  -[CNUICoreContactStoreTestFacade fetchError](v10, "fetchError");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CNUICoreContactStoreTestFacade fetchError](v10, "fetchError");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      v12 = objc_retainAutorelease(v12);
      *a4 = v12;
    }
  }
  else
  {
    -[CNUICoreContactStoreTestFacade executedFetchRequests](v10, "executedFetchRequests");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayByAddingObject:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUICoreContactStoreTestFacade setExecutedFetchRequests:](v10, "setExecutedFetchRequests:", v14);

    -[CNUICoreContactStoreTestFacade contacts](v10, "contacts");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __85__CNUICoreContactStoreTestFacade_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke;
    v17[3] = &unk_1EA6049E0;
    v18 = v9;
    objc_msgSend(v15, "_cn_each:", v17);

    v12 = v18;
  }

  objc_sync_exit(v10);
  return v11 == 0;
}

uint64_t __85__CNUICoreContactStoreTestFacade_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  char v3;

  v3 = 0;
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, char *))(result + 16))(result, a2, &v3);
  return result;
}

- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4
{
  id v6;
  CNUICoreContactStoreTestFacade *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  -[CNUICoreContactStoreTestFacade saveError](v7, "saveError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CNUICoreContactStoreTestFacade saveError](v7, "saveError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a4)
    {
      v10 = objc_retainAutorelease(v9);
      *a4 = v10;
    }
  }
  else
  {
    -[CNUICoreContactStoreTestFacade executedSaveRequests](v7, "executedSaveRequests");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayByAddingObject:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUICoreContactStoreTestFacade setExecutedSaveRequests:](v7, "setExecutedSaveRequests:", v12);

    v13 = (void *)objc_opt_class();
    -[CNUICoreContactStoreTestFacade contacts](v7, "contacts");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contactsBySimulatingExecutionOfSaveRequest:onContacts:", v6, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUICoreContactStoreTestFacade setContacts:](v7, "setContacts:", v14);

  }
  objc_sync_exit(v7);

  return v8 == 0;
}

+ (id)contactsBySimulatingExecutionOfSaveRequest:(id)a3 onContacts:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  id (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "deletedContacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_cn_indexBy:", &__block_literal_global_44);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "updatedContacts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_cn_indexBy:", &__block_literal_global_44);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addedContactsByContainerIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_cn_flatten");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_cn_indexBy:", &__block_literal_global_44);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __88__CNUICoreContactStoreTestFacade_contactsBySimulatingExecutionOfSaveRequest_onContacts___block_invoke_2;
  v28[3] = &unk_1EA603568;
  v29 = v8;
  v16 = v8;
  objc_msgSend(v5, "_cn_filter:", v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v15;
  v24 = 3221225472;
  v25 = __88__CNUICoreContactStoreTestFacade_contactsBySimulatingExecutionOfSaveRequest_onContacts___block_invoke_3;
  v26 = &unk_1EA603540;
  v27 = v10;
  v18 = v10;
  objc_msgSend(v17, "_cn_map:", &v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allValues", v23, v24, v25, v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

uint64_t __88__CNUICoreContactStoreTestFacade_contactsBySimulatingExecutionOfSaveRequest_onContacts___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

BOOL __88__CNUICoreContactStoreTestFacade_contactsBySimulatingExecutionOfSaveRequest_onContacts___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

id __88__CNUICoreContactStoreTestFacade_contactsBySimulatingExecutionOfSaveRequest_onContacts___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = v3;
  v7 = v6;

  return v7;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (NSArray)executedSaveRequests
{
  return self->_executedSaveRequests;
}

- (void)setExecutedSaveRequests:(id)a3
{
  objc_storeStrong((id *)&self->_executedSaveRequests, a3);
}

- (NSArray)executedFetchRequests
{
  return self->_executedFetchRequests;
}

- (void)setExecutedFetchRequests:(id)a3
{
  objc_storeStrong((id *)&self->_executedFetchRequests, a3);
}

- (CNContact)meContact
{
  return self->_meContact;
}

- (void)setMeContact:(id)a3
{
  objc_storeStrong((id *)&self->_meContact, a3);
}

- (NSError)saveError
{
  return self->_saveError;
}

- (void)setSaveError:(id)a3
{
  objc_storeStrong((id *)&self->_saveError, a3);
}

- (NSError)fetchError
{
  return self->_fetchError;
}

- (void)setFetchError:(id)a3
{
  objc_storeStrong((id *)&self->_fetchError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchError, 0);
  objc_storeStrong((id *)&self->_saveError, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
  objc_storeStrong((id *)&self->_executedFetchRequests, 0);
  objc_storeStrong((id *)&self->_executedSaveRequests, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
}

- (void)initWithContacts:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘contacts’ must be nonnull", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMeContact:(uint64_t)a3 contacts:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘meContact’ must be nonnull", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
