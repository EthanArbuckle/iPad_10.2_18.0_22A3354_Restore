@implementation AAContactsManager

- (id)contactIDForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getCNContactStoreClass();
  v5 = (void *)objc_opt_new();
  -[AAContactsManager _predicateForHandle:](self, "_predicateForHandle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  getCNContactIdentifierKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  objc_msgSend(v5, "unifiedContactsMatchingPredicate:keysToFetch:error:", v6, v8, &v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v20;
  if (v10)
  {
    _AALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AAContactsManager contactIDForHandle:].cold.1((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
    v18 = 0;
  }
  else
  {
    if (!objc_msgSend(v9, "count"))
    {
      v18 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v9, "firstObject");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject identifier](v11, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_8:
  return v18;
}

- (id)contactForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v25;
  _QWORD v26[7];

  v26[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getCNContactStoreClass();
  v5 = (void *)objc_opt_new();
  -[AAContactsManager _predicateForHandle:](self, "_predicateForHandle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  getCNContactIdentifierKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v7;
  getCNContactGivenNameKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v8;
  getCNContactFamilyNameKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v9;
  getCNContactThumbnailImageDataKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v10;
  getCNContactPhoneNumbersKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v11;
  getCNContactEmailAddressesKey();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  objc_msgSend(v5, "unifiedContactsMatchingPredicate:keysToFetch:error:", v6, v13, &v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v25;
  if (v15)
  {
    _AALogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[AAContactsManager contactForHandle:].cold.1((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);

  }
  objc_msgSend(v14, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)contactForMe
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[15];

  v28[13] = *MEMORY[0x1E0C80C00];
  getCNContactStoreClass();
  v22 = (void *)objc_opt_new();
  getCNContactIdentifierKey();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v26;
  getCNContactGivenNameKey();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v25;
  getCNContactFamilyNameKey();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v24;
  getCNContactThumbnailImageDataKey();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v23;
  getCNContactPhoneNumbersKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v2;
  getCNContactEmailAddressesKey();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28[5] = v3;
  getCNContactNamePrefixKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28[6] = v4;
  getCNContactMiddleNameKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[7] = v5;
  getCNContactNicknameKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[8] = v6;
  getCNContactTypeKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[9] = v7;
  getCNContactImageDataKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[10] = v8;
  getCNContactCropRectKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[11] = v9;
  getCNContactMemojiMetadataKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[12] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0;
  objc_msgSend(v22, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v11, &v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v27;
  if (v13)
  {
    _AALogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[AAContactsManager contactForMe].cold.1((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);

  }
  return v12;
}

- (id)_predicateForHandle:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "aa_appearsToBeEmail"))
  {
    objc_msgSend(getCNContactClass(), "predicateForContactsMatchingEmailAddress:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v6 = (void *)v4;
    goto LABEL_7;
  }
  if (!objc_msgSend(v3, "aa_appearsToBePhoneNumber"))
  {
    objc_msgSend(getCNContactClass(), "predicateForContactsMatchingName:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(getCNPhoneNumberClass(), "phoneNumberWithStringValue:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getCNContactClass(), "predicateForContactsMatchingPhoneNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v6;
}

- (void)fetchIDSStatusForHandle:(id)a3
{
  id v4;
  AAMessagingDestination *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  v5 = -[AAMessagingDestination initWithHandle:]([AAMessagingDestination alloc], "initWithHandle:", v4);
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__AAContactsManager_fetchIDSStatusForHandle___block_invoke;
  v7[3] = &unk_1E416ED00;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[AAMessagingDestination isRegisteredToiMessageWithCompletion:](v5, "isRegisteredToiMessageWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __45__AAContactsManager_fetchIDSStatusForHandle___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reachabilityForHandle:isReachable:", *(_QWORD *)(a1 + 32), a2);

}

- (void)idsStatusForHandle:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  AAMessagingDestination *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = -[AAMessagingDestination initWithHandle:]([AAMessagingDestination alloc], "initWithHandle:", v6);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__AAContactsManager_idsStatusForHandle_completion___block_invoke;
  v9[3] = &unk_1E416ED28;
  v10 = v5;
  v8 = v5;
  -[AAMessagingDestination isRegisteredToiMessageWithCompletion:](v7, "isRegisteredToiMessageWithCompletion:", v9);

}

uint64_t __51__AAContactsManager_idsStatusForHandle_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (AAContactsIDSStatusDelegate)delegate
{
  return (AAContactsIDSStatusDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)contactIDForHandle:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, a2, a3, "Error fetching contact ID: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)contactForHandle:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, a2, a3, "Error fetching contact: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)contactForMe
{
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, a2, a3, "Error fetching me card: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
