@implementation CNUIDowntimeLogger

+ (CNUIDowntimeLogger)sharedLogger
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CNUIDowntimeLogger_sharedLogger__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedLogger_cn_once_token_1 != -1)
    dispatch_once(&sharedLogger_cn_once_token_1, block);
  return (CNUIDowntimeLogger *)(id)sharedLogger_cn_once_object_1;
}

void __34__CNUIDowntimeLogger_sharedLogger__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  os_log_t v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v4 = os_log_create("com.apple.contactsui", "downtime");
  v2 = objc_msgSend(v1, "initWithLog:", v4);
  v3 = (void *)sharedLogger_cn_once_object_1;
  sharedLogger_cn_once_object_1 = v2;

}

- (CNUIDowntimeLogger)init
{
  CNUIDowntimeLogger *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUIDowntimeLogger)initWithLog:(id)a3
{
  id v5;
  CNUIDowntimeLogger *v6;
  CNUIDowntimeLogger *v7;
  CNUIDowntimeLogger *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUIDowntimeLogger;
  v6 = -[CNUIDowntimeLogger init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_log, a3);
    v8 = v7;
  }

  return v7;
}

- (void)logResultOfFetchingContacts:(id)a3 ofFamilyMember:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v7, "isSuccess"))
  {
    objc_msgSend(v7, "value");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[CNUIDowntimeLogger logSuccessFetchingContacts:ofFamilyMember:](self, "logSuccessFetchingContacts:ofFamilyMember:", v8, v6);
  }
  else
  {
    objc_msgSend(v7, "error");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[CNUIDowntimeLogger logFailure:fetchingContactsOfFamilyMember:](self, "logFailure:fetchingContactsOfFamilyMember:", v8, v6);
  }

}

- (void)logSuccessFetchingContacts:(id)a3 ofFamilyMember:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  -[CNUIDowntimeLogger log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CNUIDowntimeLogger logSuccessFetchingContacts:ofFamilyMember:].cold.1();

}

- (void)logFailure:(id)a3 fetchingContactsOfFamilyMember:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  -[CNUIDowntimeLogger log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[CNUIDowntimeLogger logFailure:fetchingContactsOfFamilyMember:].cold.1();

}

- (void)logSuccessUpdatingContactListByAddingContacts:(id)a3 ofFamilyMember:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  -[CNUIDowntimeLogger log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CNUIDowntimeLogger logSuccessUpdatingContactListByAddingContacts:ofFamilyMember:].cold.1();

}

- (void)logFailure:(id)a3 updatingContactListByAddingContacts:(id)a4 ofFamilyMember:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CNUIDowntimeLogger log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = 138412802;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    _os_log_error_impl(&dword_1DD140000, v11, OS_LOG_TYPE_ERROR, "error: %@ adding contacts: %@ to contacts of family member: %@", (uint8_t *)&v12, 0x20u);
  }

}

- (void)logSuccessUpdatingContactListByRemovingContacts:(id)a3 ofFamilyMember:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  -[CNUIDowntimeLogger log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CNUIDowntimeLogger logSuccessUpdatingContactListByRemovingContacts:ofFamilyMember:].cold.1();

}

- (void)logFailure:(id)a3 updatingContactListByRemovingContacts:(id)a4 ofFamilyMember:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CNUIDowntimeLogger log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = 138412802;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    _os_log_error_impl(&dword_1DD140000, v11, OS_LOG_TYPE_ERROR, "error: %@ removing contacts: %@from contacts of family member: %@", (uint8_t *)&v12, 0x20u);
  }

}

- (void)logSuccessUpdatingContactWhitelistByAddingContacts:(id)a3 ofFamilyMember:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  -[CNUIDowntimeLogger log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CNUIDowntimeLogger logSuccessUpdatingContactWhitelistByAddingContacts:ofFamilyMember:].cold.1();

}

- (void)logFailure:(id)a3 updatingContactWhitelistByAddingContacts:(id)a4 ofFamilyMember:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CNUIDowntimeLogger log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = 138412802;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    _os_log_error_impl(&dword_1DD140000, v11, OS_LOG_TYPE_ERROR, "error: %@ whitelisting contacts: %@ of family member: %@", (uint8_t *)&v12, 0x20u);
  }

}

- (void)logSuccessUpdatingContactWhitelistByRemovingContacts:(id)a3 ofFamilyMember:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  -[CNUIDowntimeLogger log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CNUIDowntimeLogger logSuccessUpdatingContactWhitelistByRemovingContacts:ofFamilyMember:].cold.1();

}

- (void)logFailure:(id)a3 updatingContactWhitelistByRemovingContacts:(id)a4 ofFamilyMember:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CNUIDowntimeLogger log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = 138412802;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    _os_log_error_impl(&dword_1DD140000, v11, OS_LOG_TYPE_ERROR, "error: %@ clearing contacts: %@ from whitelist of family member: %@", (uint8_t *)&v12, 0x20u);
  }

}

- (void)logFetchingFamilyCircleError:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  -[CNUIDowntimeLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[CNUIDowntimeLogger logFetchingFamilyCircleError:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

}

- (void)logFetchingMeError:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  -[CNUIDowntimeLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[CNUIDowntimeLogger logFetchingMeError:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)logSuccessFetchingContacts:ofFamilyMember:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1DD140000, v0, v1, "success fetching contacts: %@ of family member: %@");
  OUTLINED_FUNCTION_2();
}

- (void)logFailure:fetchingContactsOfFamilyMember:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_1DD140000, v0, OS_LOG_TYPE_ERROR, "error: %@ fetching contacts of family member: %@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)logSuccessUpdatingContactListByAddingContacts:ofFamilyMember:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1DD140000, v0, v1, "success adding contacts: %@ to contacts of family member: %@");
  OUTLINED_FUNCTION_2();
}

- (void)logSuccessUpdatingContactListByRemovingContacts:ofFamilyMember:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1DD140000, v0, v1, "success removing contacts: %@ from contacts of family member: %@");
  OUTLINED_FUNCTION_2();
}

- (void)logSuccessUpdatingContactWhitelistByAddingContacts:ofFamilyMember:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1DD140000, v0, v1, "success whitelisting contacts: %@ of family member: %@");
  OUTLINED_FUNCTION_2();
}

- (void)logSuccessUpdatingContactWhitelistByRemovingContacts:ofFamilyMember:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1DD140000, v0, v1, "success clearing contacts: %@ from whitelist of family member: %@");
  OUTLINED_FUNCTION_2();
}

- (void)logFetchingFamilyCircleError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1DD140000, a2, a3, "error: %@ fetching family circle", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)logFetchingMeError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1DD140000, a2, a3, "error: %@ fetching me", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
