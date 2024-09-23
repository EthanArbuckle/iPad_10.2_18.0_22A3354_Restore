@implementation CHManagedHandleMigrationPolicy

- (id)normalizedValueForManagedHandle:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "normalizedValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    ch_framework_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 138412290;
      v25 = (uint64_t)v3;
      _os_log_impl(&dword_1B3FA4000, v5, OS_LOG_TYPE_DEFAULT, "Performing normalization migration policy for managed handle %@", (uint8_t *)&v24, 0xCu);
    }

    NSStringFromSelector(sel_type);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_msgSend(v7, "integerValue");
    }
    else
    {
      ch_framework_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[CHManagedHandleMigrationPolicy normalizedValueForManagedHandle:].cold.1((uint64_t)v7, (uint64_t)v6, v9);

      v8 = 0;
    }
    ch_framework_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 134217984;
      v25 = v8;
      _os_log_impl(&dword_1B3FA4000, v10, OS_LOG_TYPE_DEFAULT, "Comparing CHHandleType to managed handle type %ld", (uint8_t *)&v24, 0xCu);
    }

    switch(v8)
    {
      case 1:
        objc_msgSend(v3, "value");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[CHHandle normalizedGenericHandleForValue:](CHHandle, "normalizedGenericHandleForValue:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "normalizedValue");
        v13 = objc_claimAutoreleasedReturnValue();

        ch_framework_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v24 = 138412290;
          v25 = v13;
          v15 = "Normalized user name to %@";
          goto LABEL_18;
        }
        break;
      case 2:
        objc_msgSend(v3, "remoteParticipantCalls");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "anyObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "iso_country_code");
        v14 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "value");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[CHHandle normalizedPhoneNumberHandleForValue:isoCountryCode:](CHHandle, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v20, v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "normalizedValue");
        v13 = objc_claimAutoreleasedReturnValue();

        ch_framework_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v24 = 138412290;
          v25 = v13;
          _os_log_impl(&dword_1B3FA4000, v22, OS_LOG_TYPE_DEFAULT, "Normalized telephone number to %@", (uint8_t *)&v24, 0xCu);
        }

        break;
      case 3:
        objc_msgSend(v3, "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[CHHandle normalizedEmailAddressHandleForValue:](CHHandle, "normalizedEmailAddressHandleForValue:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "normalizedValue");
        v13 = objc_claimAutoreleasedReturnValue();

        ch_framework_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v24 = 138412290;
          v25 = v13;
          v15 = "Normalized email address to %@";
LABEL_18:
          _os_log_impl(&dword_1B3FA4000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v24, 0xCu);
        }
        break;
      default:
LABEL_23:

        goto LABEL_24;
    }

    v4 = (void *)v13;
    goto LABEL_23;
  }
LABEL_24:

  return v4;
}

- (id)valueForManagedHandle:(id)a3
{
  return (id)objc_msgSend(a3, "value");
}

- (void)normalizedValueForManagedHandle:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1B3FA4000, log, OS_LOG_TYPE_ERROR, "Unexpected data type found in value %@ for key %@", (uint8_t *)&v3, 0x16u);
}

@end
