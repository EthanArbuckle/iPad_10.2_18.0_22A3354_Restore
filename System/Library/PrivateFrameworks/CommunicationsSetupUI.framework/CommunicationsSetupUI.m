void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_2138BDEBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2138BE0CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2138BE850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2138BE9E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

uint64_t _CNFRegShouldLog()
{
  return DLCShouldLogLevel();
}

void _CNFRegLog(void *a1, void *a2)
{
  id v3;
  id v4;

  v3 = a1;
  v4 = a2;
  if (DLCShouldLogLevel())
    DLCLogWithLevelV();

}

void CNFRegLogBacktraceToDepth(uint64_t a1, size_t a2)
{
  void *v4;
  char *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[2];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  char *v20;
  __int16 v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (DLCShouldLogLevel())
  {
    CNFCopyBacktraceToDepth(a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v13;
    MEMORY[0x24BDAC7A8]();
    v5 = (char *)v13 - ((a2 + 16) & 0xFFFFFFFFFFFFFFF0);
    memset(v5, 32, a2);
    v5[a2] = 0;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v7)
    {
      v9 = *(_QWORD *)v16;
      *(_QWORD *)&v8 = 136315394;
      v14 = v8;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          OSLogHandleForIDSCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            v20 = v5;
            v21 = 2112;
            v22 = v11;
            _os_log_impl(&dword_2138BA000, v12, OS_LOG_TYPE_DEFAULT, "%s%@", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (IMShouldLog())
              IMLogString();
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v7);
    }

  }
}

void CNFRegLogBacktrace()
{
  CNFRegLogBacktraceToDepth(128, 0);
}

void CNFRegLogBacktraceWithMessage(void *a1)
{
  id v1;

  v1 = a1;
  if (DLCShouldLogLevel())
  {
    DLCLogWithLevelV();
    CNFRegLogBacktraceToDepth(128, 4uLL);
  }

}

void CNFRegLogIndent()
{
  ++sLogIndent;
}

void CNFRegLogOutdent()
{
  if (sLogIndent)
    --sLogIndent;
}

id _CNFRegLogCopySpace()
{
  id v0;
  id v1;
  unint64_t v2;

  if (sLogIndent)
  {
    v0 = objc_alloc(MEMORY[0x24BDD16A8]);
    v1 = (id)objc_msgSend(v0, "initWithCapacity:", 2 * sLogIndent);
    if (sLogIndent)
    {
      v2 = 0;
      do
      {
        objc_msgSend(v1, "appendString:", CFSTR("  "));
        ++v2;
      }
      while (v2 < sLogIndent);
    }
    objc_msgSend(v1, "appendString:", CFSTR("=> "));
  }
  else
  {
    v1 = objc_alloc_init(MEMORY[0x24BDD17C8]);
  }
  return v1;
}

BOOL CNFRegCurrentStringTableMatchesType(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v2;

  if (!a1)
  {
    v1 = sStringTableName;
    v2 = CFSTR("CNFRegistration");
    return v1 == (_QWORD)v2;
  }
  if (a1 == 1)
  {
    v1 = sStringTableName;
    v2 = CFSTR("MadridRegistration");
    return v1 == (_QWORD)v2;
  }
  return 0;
}

uint64_t CNFRegSetStringTableForServiceType(uint64_t a1)
{
  const __CFString *v1;
  void *v2;
  NSObject *v3;
  uint64_t result;
  uint8_t buf[4];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = CFSTR("CNFRegistration");
  v2 = (void *)sStringTableName;
  if (a1 == 1)
    v1 = CFSTR("MadridRegistration");
  sStringTableName = (uint64_t)v1;

  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = sStringTableName;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Setting string table name to: %@", buf, 0xCu);
  }

  result = os_log_shim_legacy_logging_enabled();
  if ((_DWORD)result)
  {
    result = IMShouldLog();
    if ((_DWORD)result)
      return IMLogString();
  }
  return result;
}

const __CFString *CNFRegStringTableNameForServiceType(uint64_t a1)
{
  if (a1 == 1)
    return CFSTR("MadridRegistration");
  else
    return CFSTR("CNFRegistration");
}

id CNFRegStringTableName()
{
  void *v0;

  v0 = (void *)sStringTableName;
  if (!sStringTableName)
  {
    sStringTableName = (uint64_t)CFSTR("CNFRegistration");

    v0 = (void *)sStringTableName;
  }
  return v0;
}

id CNFRegLoadSpecifiers(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  uint64_t i;
  char *v27;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = objc_alloc(MEMORY[0x24BDBCE70]);
  v32 = v11;
  objc_msgSend(v10, "pathForResource:ofType:", v11, CFSTR("plist"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithContentsOfFile:", v15);

  CNFRegStringTableName();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v30 = v13;
  v33 = v10;
  v34 = v9;
  v31 = v12;
  SpecifiersFromPlist();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v39;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v40, 16, &v39);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v36;
    v23 = *MEMORY[0x24BE75AA0];
    v24 = *MEMORY[0x24BE75A30];
    v25 = (int *)MEMORY[0x24BE75738];
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v36 != v22)
          objc_enumerationMutation(v19);
        v27 = *(char **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (!*(_QWORD *)&v27[*v25])
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "setProperty:forKey:", CFSTR("CNFRegTableHeaderLabel"), v23);
          objc_msgSend(v27, "setProperty:forKey:", CFSTR("CNFRegTableFooterLabel"), v24);
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v21);
  }

  return v19;
}

id CNFRegLoadSpecifiersFromPlist(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  objc_msgSend(v7, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegLoadSpecifiers(v8, v9, v6, v5, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setSpecifierID:", 0);
  objc_msgSend(v7, "setTitle:", 0);

  return v10;
}

__CFString *CNFRegNonLocStringForRegistrationFailure(unint64_t a1)
{
  NSObject *v3;
  uint8_t buf[4];
  unint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (a1 < 0x13)
    return off_24D075318[a1];
  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v5 = a1;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Unexpected IMAccountRegistrationFailureReason: %ld", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (IMShouldLog())
      IMLogString();
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected failure reason: %ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *CNFRegStringForRegistrationFailure(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = CNFShouldShowTechnicalFailureUI();
  switch(a1)
  {
    case 0:
      goto LABEL_41;
    case 1:
    case 2:
    case 3:
      if (objc_msgSend(v3, "length"))
      {
        v6 = (void *)MEMORY[0x24BDD17C8];
        CommunicationsSetupUIBundle();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        CNFRegStringTableName();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_ERROR_INVALID_CREDENTIALS_FOR_%@"), &stru_24D077260, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithFormat:", v9, v3);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        CommunicationsSetupUIBundle();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        CNFRegStringTableName();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_ERROR_BLANK_USERNAME"), &stru_24D077260, v8);
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_39:
        v5 = (__CFString *)v10;
      }

      if (!v5)
      {
LABEL_41:
        CommunicationsSetupUIBundle();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        CNFRegStringTableName();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_ERROR_GENERIC"), &stru_24D077260, v15);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      break;
    case 4:
      CommunicationsSetupUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_GENERIC"), &stru_24D077260, v8);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_39;
    case 5:
      if (!v4)
        goto LABEL_41;
      v5 = CFSTR("INTERNAL: Bad Device ID");
      break;
    case 6:
      if (!v4)
        goto LABEL_41;
      v5 = CFSTR("INTERNAL: Bad Push Token");
      break;
    case 7:
      if (!v4)
        goto LABEL_41;
      v5 = CFSTR("INTERNAL: Server denied");
      break;
    case 8:
      if (!v4)
        goto LABEL_41;
      v5 = CFSTR("INTERNAL: Too many registration attempts");
      break;
    case 9:
      if (!v4)
        goto LABEL_41;
      v5 = CFSTR("INTERNAL: Account updated needed");
      break;
    case 10:
      v11 = _os_feature_enabled_impl();
      CommunicationsSetupUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v11 & 1) != 0)
        objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_ERROR_ACCOUNT_NOT_AUTHORIZED_APPLEACCOUNT"), &stru_24D077260, v8);
      else
        objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_ERROR_ACCOUNT_NOT_AUTHORIZED"), &stru_24D077260, v8);
      goto LABEL_15;
    case 11:
      v12 = _os_feature_enabled_impl();
      CommunicationsSetupUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v12 & 1) != 0)
        objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_ERROR_NEW_PASSWORD_NEEDED_APPLEACCOUNT"), &stru_24D077260, v8);
      else
        objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_ERROR_NEW_PASSWORD_NEEDED"), &stru_24D077260, v8);
LABEL_15:
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_39;
    case 12:
      if (!v4)
        goto LABEL_41;
      v5 = CFSTR("INTERNAL: Account permanently blocked");
      break;
    case 13:
      if (!v4)
        goto LABEL_41;
      v5 = CFSTR("INTERNAL: Account temporarily blocked");
      break;
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
      if (!v4)
        goto LABEL_41;
      v5 = CFSTR("INTERNAL: Server Error");
      break;
    case 20:
      if (!v4)
        goto LABEL_41;
      v5 = CFSTR("INTERNAL: Server Denied/Disabled");
      break;
    case 21:
      CommunicationsSetupUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_ERROR_NO_VALID_ALIASES_MESSAGE"), &stru_24D077260, v8);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_39;
    case 26:
      if (!v4)
        goto LABEL_41;
      v5 = CFSTR("INTERNAL: Rejected by server (irreparable)");
      break;
    default:
      OSLogHandleForIDSCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v18 = a1;
        _os_log_impl(&dword_2138BA000, v13, OS_LOG_TYPE_DEFAULT, "Unexpected IMAccountRegistrationFailureReason: %ld", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();
      goto LABEL_41;
  }

  return v5;
}

id CNFRegStringForAliasValidationStatus(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  switch(a1)
  {
    case -1:
      CommunicationsSetupUIBundle();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALIAS_STATUS_FAILURE"), &stru_24D077260, v3);
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 0:
    case 1:
      CommunicationsSetupUIBundle();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALIAS_STATUS_DEFAULT"), &stru_24D077260, v3);
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2:
      CommunicationsSetupUIBundle();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALIAS_STATUS_VALIDATING"), &stru_24D077260, v3);
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v1 = (void *)v4;

      break;
    case 3:
      return v1;
    default:
      CommunicationsSetupUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALIAS_STATUS_DEFAULT"), &stru_24D077260, v7);
      v1 = (void *)objc_claimAutoreleasedReturnValue();

      OSLogHandleForIDSCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v11 = a1;
        _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "Unexpected IMAccountAliasValidationStatus: %ld", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();
      break;
  }
  return v1;
}

__CFString *CNFRegNonLocStringForAliasValidationStatus(uint64_t a1)
{
  NSObject *v3;
  uint8_t buf[4];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a1 + 1) < 5)
    return off_24D0753E8[a1 + 1];
  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v5 = a1;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Unexpected IMAccountAliasValidationStatus: %ld", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (IMShouldLog())
      IMLogString();
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Bad status (%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *CNFRegStringForAliasValidationFailure(uint64_t a1)
{
  BOOL v2;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = CNFShouldShowTechnicalFailureUI();
  switch(a1)
  {
    case 0:
      if (!v2)
        goto LABEL_18;
      return CFSTR("INTERNAL: Unknown Error");
    case 1:
      if (!v2)
        goto LABEL_18;
      return CFSTR("INTERNAL: Server Error");
    case 2:
      if (!v2)
        goto LABEL_18;
      return CFSTR("INTERNAL: Server Denied");
    case 3:
      if (!v2)
        goto LABEL_18;
      return CFSTR("INTERNAL: Server Alias Not Confirmed");
    case 4:
      CommunicationsSetupUIBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FACETIME_EMAIL_ERROR_IN_USE"), &stru_24D077260, v6);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 5:
      CommunicationsSetupUIBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FACETIME_EMAIL_ERROR_NOT_AVAILABLE"), &stru_24D077260, v6);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_17:
      v8 = (void *)v7;

      if (!v8)
        goto LABEL_18;
      return (__CFString *)v8;
    default:
      OSLogHandleForIDSCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v12 = a1;
        _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_DEFAULT, "Unexpected IMAccountAliasValidationErrorReason: %ld", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (IMShouldLog())
          IMLogString();
      }
LABEL_18:
      CommunicationsSetupUIBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FACETIME_EMAIL_ERROR_GENERIC"), &stru_24D077260, v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      return (__CFString *)v8;
  }
}

__CFString *CNFRegStringForAccount(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v9;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "login");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "uniqueID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("IMAccount<%p>(%@): [%@]{%@}"), v2, v6, v3, v4);
    else
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("IMAccount<%p>(%@): {%@}"), v2, v6, v4, v9);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("(No Account)");
  }

  return v7;
}

__CFString *CNFRegNonLocStringForRegistrationStatus(uint64_t a1)
{
  NSObject *v3;
  uint8_t buf[4];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a1 + 1) < 7)
    return off_24D0753B0[a1 + 1];
  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v5 = a1;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Unexpected IMAccountRegistrationStatus: %ld", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (IMShouldLog())
      IMLogString();
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Bad status (%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

const __CFString *CNFRegNonLocStringForProfileValidationStatus(uint64_t a1)
{
  NSObject *v3;
  uint8_t buf[4];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a1 + 1) < 5)
    return off_24D0753E8[a1 + 1];
  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v5 = a1;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Unexpected IMAccountProfileValidationStatus: %ld", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (IMShouldLog())
      IMLogString();
  }
  return CFSTR("Unknown");
}

__CFString *CNFRegStringForProfileValidationFailure(uint64_t a1)
{
  BOOL v2;
  __CFString *result;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = CNFShouldShowTechnicalFailureUI();
  switch(a1)
  {
    case -1:
      if (!v2)
        goto LABEL_14;
      result = CFSTR("INTERNAL: No Error");
      break;
    case 0:
      if (!v2)
        goto LABEL_14;
      result = CFSTR("INTERNAL: Unknown Error");
      break;
    case 1:
      if (!v2)
        goto LABEL_14;
      result = CFSTR("INTERNAL: Server Error");
      break;
    case 2:
      CommunicationsSetupUIBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FACETIME_LOCALE_ERROR_INVALID_PROFILE"), &stru_24D077260, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        goto LABEL_15;
      goto LABEL_14;
    default:
      OSLogHandleForIDSCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v11 = a1;
        _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_DEFAULT, "Unexpected IMAccountProfileValidationErrorReason: %ld", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (IMShouldLog())
          IMLogString();
      }
LABEL_14:
      CommunicationsSetupUIBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_GENERIC"), &stru_24D077260, v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
      result = v7;
      break;
  }
  return result;
}

id CNFRegFormattedPhoneNumberForString(void *a1)
{
  id v1;
  void *v2;
  void *active;

  v1 = a1;
  v2 = v1;
  if (objc_msgSend(v1, "_appearsToBePhoneNumber"))
  {
    active = (void *)CPPhoneNumberCopyActiveCountryCode();
    v2 = (void *)PNCopyFormattedStringWithCountry();

  }
  return v2;
}

id CNFRegLocalPhoneNumberString()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(MEMORY[0x24BE50288], "sharedInstance", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "activeAccounts");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v2)
  {

    v4 = 0;
LABEL_17:
    v10 = CTSettingCopyMyPhoneNumber();

    v4 = (void *)v10;
    return v4;
  }
  v3 = v2;
  v4 = 0;
  v5 = *(_QWORD *)v13;
  do
  {
    for (i = 0; i != v3; ++i)
    {
      if (*(_QWORD *)v13 != v5)
        objc_enumerationMutation(v1);
      v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
      if (objc_msgSend(v7, "accountType") == 2 && objc_msgSend(v7, "CNFRegSignInComplete"))
      {
        objc_msgSend(v7, "aliasesForType:", 2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count"))
        {
          objc_msgSend(v8, "objectAtIndex:", 0);
          v9 = objc_claimAutoreleasedReturnValue();

          v4 = (void *)v9;
        }

      }
    }
    v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  }
  while (v3);

  if (!v4 || !objc_msgSend(v4, "length"))
    goto LABEL_17;
  return v4;
}

id CNFRegLocalPhoneNumberDisplayString()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  CNFRegLocalPhoneNumberString();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (!v0 || !objc_msgSend(v0, "length"))
  {
    v3 = 0;
LABEL_7:
    CommunicationsSetupUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("YOUR_NUMBER_STRING"), &stru_24D077260, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  CNFRegFormattedPhoneNumberForString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    goto LABEL_7;
  v4 = v2;
  if (!objc_msgSend(v2, "length"))
    goto LABEL_7;
LABEL_8:

  return v4;
}

uint64_t CNFRegSupportsLocalPhoneNumberSentinelAlias()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BE4FE08], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "supportsIdentification");

  return v1;
}

id CNFRegLocalizedSplashScreenURL()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  CommunicationsSetupUIBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("FACETIME_SPLASH_LEARN_MORE_URL"), &stru_24D077260, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id CNFRegiForgotURL()
{
  void *v0;
  void *v1;
  NSObject *v2;
  const __CFString *v4;
  uint8_t buf[4];
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE30378], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "urlWithKey:", CFSTR("ds-iforgot-url"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
  {
    OSLogHandleForIDSCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v6 = CFSTR("https://iforgot.apple.com");
      _os_log_impl(&dword_2138BA000, v2, OS_LOG_TYPE_DEFAULT, "Could not obtain iForgot url from bag. Falling back to %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v4 = CFSTR("https://iforgot.apple.com");
      IMLogString();
    }
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://iforgot.apple.com"), v4);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

id CNFRegAppleIDLearnMoreURL()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  CNFRegStringTableName();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  CommunicationsSetupUIBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  CNFLocalizedStringFromTableInBundleWithFallback(CFSTR("FACETIME_APPLE_ID_LEARN_MORE_URL"), v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t CNFRegGlobalAppearanceStyle()
{
  uint64_t result;

  result = _sGlobalAppearanceStyle;
  if (!_sGlobalAppearanceStyle)
  {
    result = 1;
    _sGlobalAppearanceStyle = 1;
  }
  return result;
}

uint64_t CNFRegSetGlobalAppearanceStyle(uint64_t result)
{
  _sGlobalAppearanceStyle = result;
  return result;
}

id CNFRegGlobalAppearanceController()
{
  return +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
}

BOOL CNFRegShouldRotateToOrientation(uint64_t a1)
{
  return a1 == 1 || _sGlobalRotationSupport != 0;
}

uint64_t CNFRegSupportsAutoRotation()
{
  return _sGlobalRotationSupport;
}

uint64_t CNFRegSetSupportsAutoRotation(uint64_t result)
{
  _sGlobalRotationSupport = result;
  return result;
}

uint64_t FTCServiceTypeForService(void *a1)
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE302E0]) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE302F0]) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE302D8]))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_2138C3C84(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id MessagesSettingsLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  CommunicationsSetupUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, v1, CFSTR("Messages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_2138CC12C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    objc_end_catch();
    JUMPOUT(0x2138CBFD8);
  }
  _Unwind_Resume(exception_object);
}

void sub_2138D4F5C(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x2138D4E70);
  }
  _Unwind_Resume(a1);
}

const __CFString *CKStringFromCTLazuliToggleStateType(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 3)
    return CFSTR("???");
  else
    return off_24D075A00[a1 + 1];
}

id CNFRegGetSSAccountStoreClass()
{
  if (CNFRegControllerLoadStoreServicesLibraryIfNecessary_predicate != -1)
    dispatch_once(&CNFRegControllerLoadStoreServicesLibraryIfNecessary_predicate, &__block_literal_global_5);
  if (CNFRegControllerLoadStoreServicesLibraryIfNecessary___SSLibraryHandle)
    return (id)__SSAccountStoreClass;
  else
    return 0;
}

void sub_2138DF82C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _cacheSpecifierMatchingID(void *a1, void *a2, id *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  int v11;

  v6 = a2;
  v7 = v6;
  v8 = 0;
  if (a1 && v6 && a3)
  {
    v9 = a1;
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", v9);

    if (v11)
    {
      if (*a3 != v7)
        objc_storeStrong(a3, a2);
      v8 = 1;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

uint64_t _cacheSpecifierGroupMatchingID(void *a1, void *a2, void *a3, void **a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;

  v7 = a3;
  v8 = v7;
  v9 = 0;
  if (a1 && a2 && v7 && a4)
  {
    v10 = a1;
    objc_msgSend(a2, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", v10);

    if (v12)
    {
      if (*a4 != v8)
      {
        v13 = objc_msgSend(v8, "copy");
        v14 = *a4;
        *a4 = (void *)v13;

      }
      v9 = 1;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

void sub_2138E5E04(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x2138E59F0);
  }
  _Unwind_Resume(a1);
}

void sub_2138E67DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2138E6C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_2138E9E54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _parseKeyValuePair(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = a1;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length"))
  {
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("="));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") == 2)
    {
      objc_msgSend(v7, "objectAtIndex:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", 1);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length") && objc_msgSend(v9, "length"))
      {
        objc_msgSend(v8, "stringByRemovingPercentEncoding");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "stringByRemovingPercentEncoding");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (a2 && v10)
          *a2 = objc_retainAutorelease(v10);
        v12 = 1;
        if (a3 && v11)
        {
          v9 = objc_retainAutorelease(v11);
          *a3 = v9;
          v8 = v10;
        }
        else
        {
          v8 = v10;
          v9 = v11;
        }
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

__CFString *_queryStringFromCNFQueryDictionary(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  __CFString *v5;
  _QWORD v7[4];
  id v8;

  v1 = a1;
  v2 = v1;
  if (v1 && objc_msgSend(v1, "count"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v2, "count"));
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___queryStringFromCNFQueryDictionary_block_invoke;
    v7[3] = &unk_24D075E58;
    v8 = v3;
    v4 = v3;
    objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v7);
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR("&"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = &stru_24D077260;
  }

  return v5;
}

void ___queryStringFromCNFQueryDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = (void *)MEMORY[0x24BDD14A8];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "URLQueryAllowedCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@=%@"), v12, v10);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);

}

void _handleSIMSubscriptionsUpdateNotification(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  im_dispatch_after();

}

uint64_t ___handleSIMSubscriptionsUpdateNotification_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2138BA000, v2, OS_LOG_TYPE_DEFAULT, "Subscriptions changed. Resetting extension matching", v4, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  objc_msgSend(*(id *)(a1 + 32), "endMatchingExtensions");
  return objc_msgSend(*(id *)(a1 + 32), "findSpamExtensions");
}

void sub_2138FCBE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKSettingsHostingViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!MessagesSettingsUILibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D075F88;
    v5 = 0;
    MessagesSettingsUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MessagesSettingsUILibraryCore_frameworkLibrary)
    __getCKSettingsHostingViewControllerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("CKSettingsHostingViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCKSettingsHostingViewControllerClass_block_invoke_cold_2();
  getCKSettingsHostingViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t csui_log()
{
  if (csui_log_onceToken != -1)
    dispatch_once(&csui_log_onceToken, &__block_literal_global_11);
  return csui_log_sLog;
}

os_log_t __csui_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.CommunicationsSetupUI", "default");
  csui_log_sLog = (uint64_t)result;
  return result;
}

void sub_2139042B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_2139054E4(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x2139054B0);
  }
  _Unwind_Resume(a1);
}

void sub_2139058C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id MadridLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  CommunicationsSetupUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, v1, CFSTR("MadridRegistration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_213905CF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21390671C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213906840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21390A744(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21390A9CC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21390DA68(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x21390D7ECLL);
  }
  _Unwind_Resume(a1);
}

void sub_21391337C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_213917C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_213917D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213918C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21391B4B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

uint64_t _SMSRelayActiveDevicesChanged(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reload");
}

void sub_21391E260(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x21391E200);
  }
  _Unwind_Resume(a1);
}

void _TechnicalFailureUIPrefChangedCallback()
{
  gShouldShowTechnicalFailureUI = -1;
}

BOOL CNFShouldShowTechnicalFailureUI()
{
  int v0;
  __CFNotificationCenter *DarwinNotifyCenter;

  v0 = gShouldShowTechnicalFailureUI;
  if (gShouldShowTechnicalFailureUI == -1)
  {
    if ((CNFShouldShowTechnicalFailureUI_sIsObserving & 1) == 0)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_TechnicalFailureUIPrefChangedCallback, CFSTR("kCNFTechnicalFailureUIPrefChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      CNFShouldShowTechnicalFailureUI_sIsObserving = 1;
    }
    CNFSyncPreferences();
    v0 = CNFGetAppBooleanValueForKey(CFSTR("showDebugErrorDialogs"));
    gShouldShowTechnicalFailureUI = v0;
  }
  return v0 != 0;
}

CFIndex CNFiMessageLogLevel()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFIndex AppIntegerValue;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  _CNFiMessageDebugLoggingDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v1 = v0;
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v19;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v19 != v4)
            objc_enumerationMutation(v1);
          v6 = *(const __CFString **)(*((_QWORD *)&v18 + 1) + 8 * v5);
          v14 = 0u;
          v15 = 0u;
          v16 = 0u;
          v17 = 0u;
          objc_msgSend(v1, "objectForKey:", v6, 0);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v15;
            while (2)
            {
              v11 = 0;
              do
              {
                if (*(_QWORD *)v15 != v10)
                  objc_enumerationMutation(v7);
                if (!CFPreferencesGetAppBooleanValue(*(CFStringRef *)(*((_QWORD *)&v14 + 1) + 8 * v11), v6, 0))
                {

                  goto LABEL_19;
                }
                ++v11;
              }
              while (v9 != v11);
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
              if (v9)
                continue;
              break;
            }
          }

          ++v5;
        }
        while (v5 != v3);
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v3);
    }

    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("MadridLoggingLevel"), CFSTR("com.apple.logging"), 0);
  }
  else
  {
LABEL_19:
    AppIntegerValue = -1;
  }

  return AppIntegerValue;
}

id _CNFiMessageDebugLoggingDefaults()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)_CNFiMessageDebugLoggingDefaults_defaults;
  if (!_CNFiMessageDebugLoggingDefaults_defaults)
  {
    v1 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("MadridLogging"), 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setObject:forKey:", v2, CFSTR("com.apple.logging"));

    v3 = objc_msgSend(v1, "copy");
    v4 = (void *)_CNFiMessageDebugLoggingDefaults_defaults;
    _CNFiMessageDebugLoggingDefaults_defaults = v3;

    v0 = (void *)_CNFiMessageDebugLoggingDefaults_defaults;
  }
  return v0;
}

void CNFSetiMessageLogLevel(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v6;

  _CNFiMessageDebugLoggingDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _CNFSetDefaultsDictionary(a1 >= 0, v2);

  if (CNFSetiMessageLogLevel__pred_MMCSSetLogLevelMMCS == -1)
  {
    if ((a1 & 0x8000000000000000) == 0)
    {
LABEL_3:
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a1);
      CFPreferencesSetAppValue(CFSTR("MadridLoggingLevel"), v3, CFSTR("com.apple.logging"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      CFPreferencesSetAppValue(CFSTR("DebugLevel"), v4, CFSTR("com.apple.mmcs"));

      CFPreferencesSetAppValue(CFSTR("fig_notes"), CFSTR("public"), CFSTR("com.apple.coremedia"));
      if (CNFSetiMessageLogLevel__MMCSSetLogLevel)
        CNFSetiMessageLogLevel__MMCSSetLogLevel(7, 4);

      goto LABEL_9;
    }
  }
  else
  {
    dispatch_once(&CNFSetiMessageLogLevel__pred_MMCSSetLogLevelMMCS, &__block_literal_global_15);
    if ((a1 & 0x8000000000000000) == 0)
      goto LABEL_3;
  }
  CFPreferencesSetAppValue(CFSTR("MadridLoggingLevel"), 0, CFSTR("com.apple.logging"));
  CFPreferencesSetAppValue(CFSTR("DebugLevel"), 0, CFSTR("com.apple.mmcs"));
  CFPreferencesSetAppValue(CFSTR("fig_notes"), 0, CFSTR("com.apple.coremedia"));
  if (CNFSetiMessageLogLevel__MMCSSetLogLevel)
    CNFSetiMessageLogLevel__MMCSSetLogLevel(3, 3);
LABEL_9:
  CFPreferencesAppSynchronize(CFSTR("com.apple.coremedia"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.mmcs"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("kMarcoSyncLoggingPrefs"), 0, 0, 1u);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v6, CFSTR("PCLoggingSettingsDidChangeNotification"), 0, 0, 1u);
}

void _CNFSetDefaultsDictionary(int a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v3, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    if (a1)
      v7 = (const void *)*MEMORY[0x24BDBD270];
    else
      v7 = 0;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v9 = *(const __CFString **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v3, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v17;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v17 != v13)
                objc_enumerationMutation(v10);
              CFPreferencesSetAppValue(*(CFStringRef *)(*((_QWORD *)&v16 + 1) + 8 * v14++), v7, v9);
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v12);
        }

        CFPreferencesAppSynchronize(v9);
        ++v8;
      }
      while (v8 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }

}

void CNFDumpiMessageLogs(void *a1)
{
  const __CFString *v1;
  const __CFString *v2;
  __CFString *v3;

  v1 = a1;
  if (v1)
    v2 = v1;
  else
    v2 = CFSTR("CNFDumpiMessageLogs");
  v3 = (__CFString *)v2;
  MarcoAction();

}

uint64_t CNFRegistrationLogLevel()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  _CNFRegistrationLoggingDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v1 = v0;
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v19 != v4)
            objc_enumerationMutation(v1);
          v6 = *(const __CFString **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v14 = 0u;
          v15 = 0u;
          v16 = 0u;
          v17 = 0u;
          objc_msgSend(v1, "objectForKey:", v6, 0);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v15;
            while (2)
            {
              for (j = 0; j != v9; ++j)
              {
                if (*(_QWORD *)v15 != v10)
                  objc_enumerationMutation(v7);
                if (!CFPreferencesGetAppBooleanValue(*(CFStringRef *)(*((_QWORD *)&v14 + 1) + 8 * j), v6, 0))
                {

                  v12 = -1;
                  goto LABEL_21;
                }
              }
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
              if (v9)
                continue;
              break;
            }
          }

        }
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        v12 = 0;
      }
      while (v3);
    }
    else
    {
      v12 = 0;
    }
LABEL_21:

  }
  else
  {
    v12 = -1;
  }

  return v12;
}

id _CNFRegistrationLoggingDefaults()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)_CNFRegistrationLoggingDefaults_defaults;
  if (!_CNFRegistrationLoggingDefaults_defaults)
  {
    v1 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("RegistrationLogging"), 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setObject:forKey:", v2, CFSTR("com.apple.logging"));

    v3 = objc_msgSend(v1, "copy");
    v4 = (void *)_CNFRegistrationLoggingDefaults_defaults;
    _CNFRegistrationLoggingDefaults_defaults = v3;

    v0 = (void *)_CNFRegistrationLoggingDefaults_defaults;
  }
  return v0;
}

uint64_t CNFSetRegistrationLogLevel(uint64_t a1)
{
  void *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;

  _CNFRegistrationLoggingDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _CNFSetDefaultsDictionary(a1 >= 0, v2);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("kMarcoSyncLoggingPrefs"), 0, 0, 1u);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v4, CFSTR("PCLoggingSettingsDidChangeNotification"), 0, 0, 1u);
  return IMPerformSystem();
}

void CNFDumpRegistrationLogs(void *a1)
{
  const __CFString *v1;
  const __CFString *v2;
  __CFString *v3;

  v1 = a1;
  if (v1)
    v2 = v1;
  else
    v2 = CFSTR("CNFDumpRegistrationLogs");
  v3 = (__CFString *)v2;
  MarcoAction();

}

uint64_t CNFIsPushLoggingEnabled()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  _CNFPushLoggingDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v1 = v0;
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v19 != v4)
            objc_enumerationMutation(v1);
          v6 = *(const __CFString **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v14 = 0u;
          v15 = 0u;
          v16 = 0u;
          v17 = 0u;
          objc_msgSend(v1, "objectForKey:", v6, 0);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v15;
            while (2)
            {
              for (j = 0; j != v9; ++j)
              {
                if (*(_QWORD *)v15 != v10)
                  objc_enumerationMutation(v7);
                if (!CFPreferencesGetAppBooleanValue(*(CFStringRef *)(*((_QWORD *)&v14 + 1) + 8 * j), v6, 0))
                {

                  v12 = 0;
                  goto LABEL_21;
                }
              }
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
              if (v9)
                continue;
              break;
            }
          }

        }
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        v12 = 1;
      }
      while (v3);
    }
    else
    {
      v12 = 1;
    }
LABEL_21:

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id _CNFPushLoggingDefaults()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)_CNFPushLoggingDefaults_defaults;
  if (!_CNFPushLoggingDefaults_defaults)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Log"), CFSTR("PCWriteLogs"), CFSTR("APSFullNetworkLogging"), 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setObject:forKey:", v2, CFSTR("com.apple.persistentconnection"));

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_CNFPushLoggingDefaults_defaults;
    _CNFPushLoggingDefaults_defaults = v3;

    v0 = (void *)_CNFPushLoggingDefaults_defaults;
  }
  return v0;
}

void CNFSetPushLoggingEnabled(int a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v18;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!a1)
  {
    objc_msgSend(v18, "stringByAppendingPathComponent:", CFSTR("Preferences/com.apple.aps.tcpdump.en0.plist"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeItemAtPath:error:", v11, 0);

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingPathComponent:", CFSTR("Preferences/com.apple.aps.tcpdump.pdp_ip0.plist"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeItemAtPath:error:", v13, 0);

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingPathComponent:", CFSTR("Caches/com.apple.aps.tcpdump.en0.plist"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeItemAtPath:error:", v15, 0);

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingPathComponent:", CFSTR("Caches/com.apple.aps.tcpdump.pdp_ip0.plist"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeItemAtPath:error:", v10, 0);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v3, "fileExistsAtPath:", CFSTR("/usr/sbin/tcpdump"));

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingPathComponent:", CFSTR("Caches/com.apple.aps.tcpdump.en0.plist"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "writeToFile:options:error:", v7, 0, 0);

    objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v8, "supportsCellularData");

    if ((_DWORD)v7)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByAppendingPathComponent:", CFSTR("Caches/com.apple.aps.tcpdump.pdp_ip0.plist"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "writeToFile:options:error:", v10, 0, 0);
LABEL_6:

    }
  }
  _CNFPushLoggingDefaults();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _CNFSetDefaultsDictionary(a1, v16);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("PCLoggingSettingsDidChangeNotification"), 0, 0, 1u);

}

void CNFSetBasebandLoggingEnabled(uint64_t a1)
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  id v7;

  if ((_DWORD)a1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    CNFSetBasebandValue(v2);

    CNFSetBasebandValue(CFSTR("512"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    CNFSetBasebandValue(v3);

    CNFSetBasebandValue(CFSTR("1"));
    CNFSetBasebandValue(CFSTR("2"));
    CNFSetBasebandValue(CFSTR("512"));
    v4 = CFSTR("default");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CNFSetBasebandValue(v5);

    CNFSetBasebandValue(CFSTR("64"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CNFSetBasebandValue(v6);

    CNFSetBasebandValue(CFSTR("0"));
    v4 = CFSTR("0");
  }
  CNFSetBasebandValue(v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  CNFSetBasebandValue(v7);

}

void CNFSetBasebandValue(void *a1)
{
  __CFString *v1;
  uint64_t v2;
  const void *v3;
  char isKindOfClass;
  __CFString *v5;
  int v6;
  __CFString *v7;

  v1 = a1;
  v2 = _CTServerConnectionCreate();
  if (v2)
  {
    v3 = (const void *)v2;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = v1;
    if ((isKindOfClass & 1) == 0)
    {
      v6 = -[__CFString BOOLValue](v1, "BOOLValue", 0, 0, 0, 0, 0);
      v5 = CFSTR("false");
      if (v6)
        v5 = CFSTR("true");
    }
    v7 = v5;
    _CTServerConnectionSetTraceProperty();
    CFRelease(v3);

  }
}

void CNFSetIDSLoggingEnabled(int a1)
{
  const void *v1;
  __CFNotificationCenter *DarwinNotifyCenter;

  if (a1)
  {
    CFPreferencesSetAppValue(CFSTR("IDSLogging"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1), CFSTR("com.apple.logging"));
    v1 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  }
  else
  {
    CFPreferencesSetAppValue(CFSTR("IDSLogging"), 0, CFSTR("com.apple.logging"));
    v1 = 0;
  }
  CFPreferencesSetAppValue(CFSTR("IDSIDQuery"), v1, CFSTR("com.apple.logging"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("kMarcoSyncLoggingPrefs"), 0, 0, 1u);
}

void _reloadSpecifiersFromNotification(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "reloadSpecifiers");

}

void sub_213924CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  id *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void _removeSpecifiersWithIdentifiers(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "specifierForID:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "removeObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

void sub_21392CF4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21392D408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__559(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__560(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

uint64_t CNFGetSharedBooleanValueForKey(uint64_t a1, void *a2)
{
  __CFString *v2;
  __CFString *v3;
  BOOL v4;
  uint64_t v5;
  Boolean keyExistsAndHasValidFormat;

  v2 = a2;
  v3 = (__CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  if (v3)
  {
    keyExistsAndHasValidFormat = 0;
    if (CFPreferencesGetAppBooleanValue(v2, v3, &keyExistsAndHasValidFormat))
      v4 = keyExistsAndHasValidFormat == 0;
    else
      v4 = 1;
    v5 = !v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

BOOL CNFGetDomainBooleanValueForKey(CFStringRef applicationID, CFStringRef key)
{
  BOOL v2;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(key, applicationID, &keyExistsAndHasValidFormat))
    v2 = keyExistsAndHasValidFormat == 0;
  else
    v2 = 1;
  return !v2;
}

uint64_t CNFGetDomainBooleanValueForKeyDefaultValue(CFStringRef applicationID, CFStringRef key, unsigned int a3)
{
  _BOOL4 v4;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  v4 = CFPreferencesGetAppBooleanValue(key, applicationID, &keyExistsAndHasValidFormat) != 0;
  if (keyExistsAndHasValidFormat)
    return v4;
  else
    return a3;
}

uint64_t CNFGetAppBooleanValueForKey(void *a1)
{
  return CNFGetSharedBooleanValueForKey((uint64_t)CFSTR("com.apple.conference"), a1);
}

uint64_t CNFSetDomainBooleanForKey(void *a1, void *a2, uint64_t a3)
{
  void *v5;
  __CFString *v6;
  id v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a2;
  v7 = a1;
  objc_msgSend(v5, "numberWithBool:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _CNFSetDomainValueForKey(v7, v6, v8);

  return 1;
}

void _CNFSetDomainValueForKey(void *a1, const __CFString *a2, const void *a3)
{
  __CFString *applicationID;

  applicationID = a1;
  CFPreferencesSetAppValue(a2, a3, applicationID);
  CFPreferencesAppSynchronize(applicationID);

}

BOOL CNFSetSharedBooleanValueForKey(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a2;
  v5 = (void *)CPCopySharedResourcesPreferencesDomainForDomain();
  v6 = v5;
  if (v5)
    CNFSetDomainBooleanForKey(v5, v4, a3);

  return v6 != 0;
}

BOOL CNFSetAppBooleanValueForKey(void *a1, uint64_t a2)
{
  return CNFSetSharedBooleanValueForKey((uint64_t)CFSTR("com.apple.conference"), a1, a2);
}

CFPropertyListRef _CNFCopyDomainValueForKey(CFStringRef applicationID, CFStringRef key)
{
  return CFPreferencesCopyAppValue(key, applicationID);
}

double CNFGetDomainCGSizeForKey(CFStringRef applicationID, CFStringRef key, double a3)
{
  NSString *v4;
  NSString *v5;

  v4 = (NSString *)CFPreferencesCopyAppValue(key, applicationID);
  if (v4)
  {
    v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      *(_QWORD *)&a3 = *(_OWORD *)&CGSizeFromString(v5);
    CFRelease(v5);
  }
  return a3;
}

double CNFGetSharedCGSizeForKey(double a1, uint64_t a2, void *a3)
{
  __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v4 = a3;
  v5 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  if (v5)
  {
    v6 = v5;
    a1 = CNFGetDomainCGSizeForKey(v5, v4, a1);
    CFRelease(v6);
  }

  return a1;
}

double CNFGetAppCGSizeForKey(void *a1, double a2)
{
  return CNFGetSharedCGSizeForKey(a2, (uint64_t)CFSTR("com.apple.conference"), a1);
}

id CNFCopyDomainStringForKey(const __CFString *a1, const __CFString *a2, void *a3)
{
  id v5;
  CFPropertyListRef v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = CFPreferencesCopyAppValue(a2, a1);
  v7 = v5;
  if (v6)
  {
    v8 = (void *)v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v8;

    }
    else
    {
      CFRelease(v8);
      v7 = v5;
    }
  }

  return v7;
}

id CNFCopySharedStringForKey(uint64_t a1, void *a2, void *a3)
{
  __CFString *v4;
  id v5;
  __CFString *v6;
  id v7;
  void *v8;

  v4 = a2;
  v5 = a3;
  v6 = (__CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  v7 = v5;
  v8 = v7;
  if (v6)
  {
    CNFCopyDomainStringForKey(v6, v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

id CNFCopyAppStringForKey(void *a1, void *a2)
{
  return CNFCopySharedStringForKey((uint64_t)CFSTR("com.apple.conference"), a1, a2);
}

uint64_t CNFGetDomainIntegerForKey(CFStringRef applicationID, CFStringRef key, uint64_t a3)
{
  CFPropertyListRef v4;
  void *v5;

  v4 = CFPreferencesCopyAppValue(key, applicationID);
  if (v4)
  {
    v5 = (void *)v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      a3 = objc_msgSend(v5, "integerValue");
    CFRelease(v5);
  }
  return a3;
}

uint64_t CNFGetSharedIntegerForKey(uint64_t a1, void *a2, uint64_t a3)
{
  __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v4 = a2;
  v5 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  if (v5)
  {
    v6 = v5;
    a3 = CNFGetDomainIntegerForKey(v5, v4, a3);
    CFRelease(v6);
  }

  return a3;
}

uint64_t CNFGetAppIntegerForKey(void *a1, uint64_t a2)
{
  return CNFGetSharedIntegerForKey((uint64_t)CFSTR("com.apple.conference"), a1, a2);
}

uint64_t CNFSetDomainIntegerForKey(void *a1, void *a2, uint64_t a3)
{
  void *v5;
  __CFString *v6;
  id v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a2;
  v7 = a1;
  objc_msgSend(v5, "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _CNFSetDomainValueForKey(v7, v6, v8);

  return 1;
}

BOOL CNFSetSharedIntegerForKey(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  const void *v6;

  v4 = a2;
  v5 = (void *)CPCopySharedResourcesPreferencesDomainForDomain();
  v6 = v5;
  if (v5)
  {
    CNFSetDomainIntegerForKey(v5, v4, a3);
    CFRelease(v6);
  }

  return v6 != 0;
}

BOOL CNFSetAppIntegerForKey(void *a1, uint64_t a2)
{
  return CNFSetSharedIntegerForKey((uint64_t)CFSTR("com.apple.conference"), a1, a2);
}

double CNFGetDomainFloatForKey(CFStringRef applicationID, CFStringRef key, double a3)
{
  CFPropertyListRef v4;
  void *v5;
  float v6;

  v4 = CFPreferencesCopyAppValue(key, applicationID);
  if (v4)
  {
    v5 = (void *)v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v5, "floatValue");
      a3 = v6;
    }
    CFRelease(v5);
  }
  return a3;
}

double CNFGetSharedFloatForKey(double a1, uint64_t a2, void *a3)
{
  __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v4 = a3;
  v5 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  if (v5)
  {
    v6 = v5;
    a1 = CNFGetDomainFloatForKey(v5, v4, a1);
    CFRelease(v6);
  }

  return a1;
}

double CNFGetAppFloatForKey(void *a1, double a2)
{
  return CNFGetSharedFloatForKey(a2, (uint64_t)CFSTR("com.apple.conference"), a1);
}

void CNFAssert(char a1, uint64_t a2, void *a3)
{
  if ((a1 & 1) == 0)
    _CNFLogv(a2, a3);
}

void _CNFLogv(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (DLCSessionShouldLogLevel())
    DLCSessionLogWithLevelV();

}

id CNFCopyBacktraceToDepth(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  void **v5;
  size_t v6;
  int v7;
  char **v8;
  char **v9;
  uint64_t *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a1 + 1) < 0x80)
    v1 = a1 + 1;
  else
    v1 = 128;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v1);
  MEMORY[0x24BDAC7A8]();
  v5 = (void **)((char *)v16 - v4);
  if (v3 >= 0x200)
    v6 = 512;
  else
    v6 = v3;
  bzero((char *)v16 - v4, v6);
  v7 = backtrace(v5, v1);
  v8 = backtrace_symbols(v5, v7);
  v9 = v8;
  if (v7 >= 2)
  {
    v10 = (uint64_t *)(v8 + 1);
    v11 = v7 - 1;
    do
    {
      v12 = objc_alloc(MEMORY[0x24BDD17C8]);
      v13 = *v10++;
      v14 = (void *)objc_msgSend(v12, "initWithUTF8String:", v13);
      objc_msgSend(v2, "addObject:", v14);

      --v11;
    }
    while (v11);
  }
  free(v9);
  return v2;
}

void CNFLogBacktraceToDepth(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (DLCSessionShouldLogLevel())
  {
    CNFCopyBacktraceToDepth(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          _CNFLog(a1, *(void **)(*((_QWORD *)&v9 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

void _CNFLog(uint64_t a1, void *a2)
{
  _CNFLogv(a1, a2);
}

id CommunicationsSetupUIBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)CommunicationsSetupUIBundle___communicationsSetupUIBundle;
  if (!CommunicationsSetupUIBundle___communicationsSetupUIBundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)CommunicationsSetupUIBundle___communicationsSetupUIBundle;
    CommunicationsSetupUIBundle___communicationsSetupUIBundle = v1;

    v0 = (void *)CommunicationsSetupUIBundle___communicationsSetupUIBundle;
  }
  return v0;
}

BOOL CNFSyncDomainPreferences(const __CFString *a1)
{
  return CFPreferencesAppSynchronize(a1) != 0;
}

BOOL CNFSyncSharedPreferences()
{
  const __CFString *v0;
  __CFString *v1;
  _BOOL8 v2;

  v0 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  v1 = (__CFString *)v0;
  if (v0)
    v2 = CFPreferencesAppSynchronize(v0) != 0;
  else
    v2 = 0;

  return v2;
}

BOOL CNFSyncPreferences()
{
  return CNFSyncSharedPreferences();
}

uint64_t CNFSyncLoggingPrefs()
{
  CNFSyncSharedPreferences();
  CNFGetSharedBooleanValueForKey((uint64_t)CFSTR("com.apple.conference"), CFSTR("Log"));
  return CNFGetSharedBooleanValueForKey((uint64_t)CFSTR("com.apple.conference"), CFSTR("Log.Everything"));
}

id CNFStringKeyForProduct(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (CNFProductName_onceToken != -1)
    dispatch_once(&CNFProductName_onceToken, &__block_literal_global_17);
  v2 = v1;
  if (CNFProductName_sProductName)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v1, CNFProductName_sProductName);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id CNFStringKeyForIdiom(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (CNFIdiomName_onceToken != -1)
    dispatch_once(&CNFIdiomName_onceToken, &__block_literal_global_86);
  v2 = v1;
  if (CNFIdiomName_sIdiomName)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v1, CNFIdiomName_sIdiomName);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id CNFStringKeyForNetwork(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  int v4;
  const __CFString *v5;
  void *v6;

  v1 = (void *)MEMORY[0x24BE30338];
  v2 = a1;
  objc_msgSend(v1, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsWLAN");

  if (v4)
    v5 = CFSTR("%@_WLAN");
  else
    v5 = CFSTR("%@_WIFI");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id CNFStringKeyForNetworkAndProduct(void *a1)
{
  void *v1;
  void *v2;

  CNFStringKeyForNetwork(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  CNFStringKeyForProduct(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id CNFLocalizedStringFromTableInBundleWithFallback(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  CNFStringKeyForProduct(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CommunicationsSetupUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", v8, &stru_24D077260, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && (objc_msgSend(v11, "isEqualToString:", v8) & 1) == 0)
  {
    v16 = v11;
    v18 = v16;
  }
  else
  {
    csui_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      CNFLocalizedStringFromTableInBundleWithFallback_cold_1((uint64_t)v5, (uint64_t)v8, v12);

    CNFStringKeyForIdiom(v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", v13, &stru_24D077260, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && (objc_msgSend(v14, "isEqualToString:", v13) & 1) == 0)
    {
      NSLog(CFSTR("We did a fallback to this key: %@ from %@"), v13, v8);
      v16 = v14;
      v18 = v16;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v5, CFSTR("_iphone"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", v15, &stru_24D077260, v6);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      if (v16 && (objc_msgSend(v16, "isEqualToString:", v15) & 1) == 0)
      {
        NSLog(CFSTR("We did a fallback to this key: %@ from %@"), v15, v8);
        v18 = v16;
      }
      else
      {
        NSLog(CFSTR("ERROR! We are missing a string in our bundle for the key %@"), v5);
        CNFStringKeyForProduct(v5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedStringForKey:value:table:", v17, &stru_24D077260, v6);
        v18 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  return v18;
}

BOOL sub_2139329A0(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_2139329B0()
{
  return sub_2139358F0();
}

uint64_t sub_2139329D4()
{
  sub_2139358E4();
  sub_2139358F0();
  return sub_2139358FC();
}

BOOL sub_213932A18(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_213932A2C()
{
  sub_2139358E4();
  sub_2139358F0();
  return sub_2139358FC();
}

uint64_t sub_213932A70()
{
  return sub_2139358F0();
}

uint64_t sub_213932A98()
{
  sub_2139358E4();
  sub_2139358F0();
  return sub_2139358FC();
}

uint64_t sub_213932AD8()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList_view + 8);
}

id CKSettingsCheckInDevicesList.__allocating_init(fullDataSharing:)(char a1)
{
  objc_class *v1;
  id v3;
  char v4;
  void *v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  objc_super v12;

  v3 = objc_allocWithZone(v1);
  if ((a1 & 1) != 0)
    v4 = 1;
  else
    v4 = 2;
  v5 = (void *)objc_opt_self();
  v6 = (char *)v3;
  v7 = objc_msgSend(v5, sel_mainScreen);
  objc_msgSend(v7, sel_bounds);
  v9 = v8;

  v10 = &v6[OBJC_IVAR____TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList_view];
  *(_QWORD *)v10 = v9;
  v10[8] = v4;

  v12.receiver = v6;
  v12.super_class = v1;
  return objc_msgSendSuper2(&v12, sel_init);
}

id CKSettingsCheckInDevicesList.init(fullDataSharing:)(char a1)
{
  void *v1;
  char v2;
  void *v3;
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  objc_super v10;

  if ((a1 & 1) != 0)
    v2 = 1;
  else
    v2 = 2;
  v3 = (void *)objc_opt_self();
  v4 = v1;
  v5 = objc_msgSend(v3, sel_mainScreen);
  objc_msgSend(v5, sel_bounds);
  v7 = v6;

  v8 = &v4[OBJC_IVAR____TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList_view];
  *(_QWORD *)v8 = v7;
  v8[8] = v2;

  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for CKSettingsCheckInDevicesList();
  return objc_msgSendSuper2(&v10, sel_init);
}

uint64_t type metadata accessor for CKSettingsCheckInDevicesList()
{
  return objc_opt_self();
}

uint64_t sub_213932D40()
{
  id v0;
  uint64_t v1;

  sub_2139357DC();
  MEMORY[0x24BDAC7A8]();
  v0 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_254D0C218));
  v1 = sub_2139357AC();
  sub_2139357D0();
  sub_2139357A0();
  return v1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199B9024]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

id CKSettingsCheckInDevicesList.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CKSettingsCheckInDevicesList.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CKSettingsCheckInDevicesList.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CKSettingsCheckInDevicesList();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_213932F88@<X0>(char a1@<W0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v26[16];
  double v27;
  char v28;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D0C220);
  MEMORY[0x24BDAC7A8](v6);
  v8 = &v26[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D0C228);
  MEMORY[0x24BDAC7A8](v9);
  v11 = &v26[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(_QWORD *)v8 = sub_213935794();
  *((_QWORD *)v8 + 1) = 0x4024000000000000;
  v8[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D0C230);
  v27 = a3;
  v28 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D0C238);
  sub_213934B98(&qword_254D0C240, &qword_254D0C238, MEMORY[0x24BDF5428]);
  sub_21393589C();
  v12 = sub_2139357F4();
  sub_213935758();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  sub_2139332F8((uint64_t)v8, (uint64_t)v11, &qword_254D0C220);
  v21 = &v11[*(int *)(v9 + 36)];
  *v21 = v12;
  *((_QWORD *)v21 + 1) = v14;
  *((_QWORD *)v21 + 2) = v16;
  *((_QWORD *)v21 + 3) = v18;
  *((_QWORD *)v21 + 4) = v20;
  v21[40] = 0;
  sub_21393333C((uint64_t)v8, &qword_254D0C220);
  v22 = objc_msgSend((id)objc_opt_self(), sel_secondarySystemGroupedBackgroundColor);
  v23 = MEMORY[0x2199B84B4](v22);
  LOBYTE(v8) = sub_2139357F4();
  sub_2139332F8((uint64_t)v11, a2, &qword_254D0C228);
  v24 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254D0C248) + 36);
  *(_QWORD *)v24 = v23;
  *(_BYTE *)(v24 + 8) = (_BYTE)v8;
  return sub_21393333C((uint64_t)v11, &qword_254D0C228);
}

uint64_t sub_213933190@<X0>(char a1@<W0>, _BYTE *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  void (*v11)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v12;
  char *v13;
  void (*v14)(_BYTE *, uint64_t);
  _BYTE v16[14];
  char v17;
  char v18;

  v4 = sub_213935890();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v10 = &v16[-v9];
  sub_213935884();
  v18 = 0;
  v11 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 16);
  v11(v8, v10, v4);
  v17 = 1;
  *a2 = v18;
  a2[1] = a1;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D0C2F8);
  v11(&a2[*(int *)(v12 + 48)], v8, v4);
  v13 = &a2[*(int *)(v12 + 64)];
  *v13 = v17;
  v13[1] = a1;
  v14 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
  v14(v10, v4);
  return ((uint64_t (*)(_BYTE *, uint64_t))v14)(v8, v4);
}

uint64_t sub_2139332AC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;

  return sub_213933190(*(_BYTE *)(v1 + 24), a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199B9030](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2139332F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21393333C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_213933378(char a1, int a2)
{
  return a1 & 1 | (a2 << 8);
}

uint64_t sub_21393338C()
{
  return sub_213935854();
}

uint64_t sub_2139333A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_213932F88(*(_BYTE *)(v1 + 8), a1, *(double *)v1);
}

uint64_t sub_2139333B0(char a1)
{
  return a1 & 1;
}

uint64_t sub_2139333B8(__int16 a1)
{
  return HIBYTE(a1);
}

void *sub_2139333C0@<X0>(__int16 a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  _BYTE v6[392];
  _BYTE __src[395];

  v4 = sub_213935788();
  sub_21393343C(a1 & 0xFF01, (uint64_t)v6);
  memcpy(&__src[7], v6, 0x184uLL);
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  return memcpy((void *)(a2 + 17), __src, 0x18BuLL);
}

uint64_t sub_21393343C@<X0>(__int16 a1@<W0>, uint64_t a2@<X8>)
{
  __int16 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t KeyPath;
  _OWORD v60[20];
  _OWORD v61[20];
  _BYTE __dst[288];
  _OWORD v63[20];
  _OWORD __src[20];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _OWORD v83[10];

  v3 = a1 & 1;
  v4 = sub_213935878();
  v5 = sub_213935800();
  KeyPath = swift_getKeyPath();
  if ((a1 & 0xFF00) == 0x200)
  {
    *(_QWORD *)&__src[0] = sub_213933D18();
    *((_QWORD *)&__src[0] + 1) = v6;
    sub_213934DF4();
    v7 = sub_213935830();
    v9 = v8;
    v11 = v10;
    v13 = v12 & 1;
    v14 = sub_2139358A8();
    sub_213933EBC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)__src, 0.0, 1, 0.0, 1, v14, v15, v7, v9, v13, v11);
    sub_213934DE4(v7, v9, v13);
    swift_bridgeObjectRelease();
    v63[5] = __src[5];
    v63[6] = __src[6];
    v63[7] = __src[7];
    v63[8] = __src[8];
    v63[2] = __src[2];
    v63[3] = __src[3];
    v63[4] = __src[4];
    v63[0] = __src[0];
    v63[1] = __src[1];
    sub_213934E38((uint64_t)v63);
    sub_213934AEC((uint64_t)v63, (uint64_t)v61);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D0C2D0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D0C2D8);
    sub_213934B34();
    sub_213934B98(&qword_254D0C2E8, &qword_254D0C2D8, MEMORY[0x24BDF4700]);
  }
  else
  {
    v54 = sub_213935794();
    *(_QWORD *)&__src[0] = sub_213933D18();
    *((_QWORD *)&__src[0] + 1) = v16;
    sub_213934DF4();
    v56 = v5;
    v17 = sub_213935830();
    v19 = v18;
    v21 = v20;
    v23 = v22 & 1;
    v24 = sub_2139358A8();
    sub_213933EBC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)__src, 0.0, 1, 0.0, 1, v24, v25, v17, v19, v23, v21);
    sub_213934DE4(v17, v19, v23);
    swift_bridgeObjectRelease();
    v79 = __src[5];
    v80 = __src[6];
    v81 = __src[7];
    v82 = __src[8];
    v75 = __src[1];
    v76 = __src[2];
    v77 = __src[3];
    v78 = __src[4];
    v74 = __src[0];
    *(_QWORD *)&__src[0] = sub_21393409C(SHIBYTE(a1), v3);
    *((_QWORD *)&__src[0] + 1) = v26;
    v27 = sub_213935830();
    v29 = v28;
    v31 = v30 & 1;
    LODWORD(__src[0]) = sub_2139357C4();
    v32 = sub_213935818();
    v34 = v33;
    v57 = v4;
    v36 = v35 & 1;
    sub_213934DE4(v27, v29, v31);
    swift_bridgeObjectRelease();
    sub_21393580C();
    v37 = sub_213935824();
    v39 = v38;
    v41 = v40;
    v55 = v3;
    v43 = v42;
    swift_release();
    sub_213934DE4(v32, v34, v36);
    v5 = v56;
    swift_bridgeObjectRelease();
    v44 = sub_2139358A8();
    sub_213933EBC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)__src, 0.0, 1, 0.0, 1, v44, v45, v37, v39, v41 & 1, v43);
    sub_213934DE4(v37, v39, v41 & 1);
    swift_bridgeObjectRelease();
    v70 = __src[5];
    v71 = __src[6];
    v72 = __src[7];
    v73 = __src[8];
    v66 = __src[1];
    v67 = __src[2];
    v68 = __src[3];
    v69 = __src[4];
    v65 = __src[0];
    v83[5] = v79;
    v83[6] = v80;
    v83[7] = v81;
    v83[8] = v82;
    v83[1] = v75;
    v83[2] = v76;
    v83[3] = v77;
    v83[4] = v78;
    v83[0] = v74;
    v60[6] = __src[6];
    v60[7] = __src[7];
    v60[8] = __src[8];
    v60[2] = __src[2];
    v60[3] = __src[3];
    v60[4] = __src[4];
    v60[5] = __src[5];
    v60[0] = __src[0];
    v60[1] = __src[1];
    __src[5] = v79;
    __src[6] = v80;
    __src[7] = v81;
    __src[8] = v82;
    __src[1] = v75;
    __src[2] = v76;
    __src[3] = v77;
    __src[4] = v78;
    __src[0] = v74;
    __src[14] = v70;
    __src[15] = v71;
    __src[16] = v72;
    __src[17] = v73;
    __src[10] = v66;
    __src[11] = v67;
    __src[12] = v68;
    __src[13] = v69;
    __src[9] = v65;
    memcpy(__dst, __src, sizeof(__dst));
    v61[6] = v71;
    v61[7] = v72;
    v61[8] = v73;
    v61[2] = v67;
    v61[3] = v68;
    v61[4] = v69;
    v61[5] = v70;
    v61[0] = v65;
    v61[1] = v66;
    sub_213934E40((uint64_t)v83);
    sub_213934E40((uint64_t)v60);
    sub_213934E7C((uint64_t)v61);
    v63[5] = v79;
    v63[6] = v80;
    v63[7] = v81;
    v63[8] = v82;
    v63[2] = v76;
    v63[3] = v77;
    v63[4] = v78;
    v63[0] = v74;
    v63[1] = v75;
    sub_213934E7C((uint64_t)v63);
    LOBYTE(v83[0]) = 1;
    memcpy((char *)v60 + 7, __dst, 0x120uLL);
    v63[0] = (unint64_t)v54;
    LOBYTE(v63[1]) = 1;
    memcpy((char *)&v63[1] + 1, v60, 0x127uLL);
    sub_213934AE0((uint64_t)v63);
    sub_213934AEC((uint64_t)v63, (uint64_t)v61);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D0C2D0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D0C2D8);
    sub_213934B34();
    sub_213934B98(&qword_254D0C2E8, &qword_254D0C2D8, MEMORY[0x24BDF4700]);
    v4 = v57;
    v3 = v55;
  }
  sub_2139357B8();
  if (v3)
  {
    v46 = 0;
    v50 = 0;
    v48 = 0;
    v49 = 0;
  }
  else
  {
    v46 = sub_21393586C();
    v47 = sub_2139357C4();
    v48 = sub_21393586C();
    v49 = sub_2139357C4();
    v50 = v47;
  }
  v51 = sub_213935878();
  v52 = sub_2139357C4();
  memcpy(v60, __src, 0x139uLL);
  memcpy(v61, __src, 0x139uLL);
  memcpy((void *)(a2 + 24), __src, 0x139uLL);
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = KeyPath;
  *(_QWORD *)(a2 + 16) = v5;
  *(_QWORD *)(a2 + 344) = v46;
  *(_QWORD *)(a2 + 352) = v50;
  *(_QWORD *)(a2 + 360) = v48;
  *(_DWORD *)(a2 + 368) = v49;
  *(_QWORD *)(a2 + 376) = v51;
  *(_DWORD *)(a2 + 384) = v52;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_213934CC8((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_213934BD8);
  sub_213934C70(v46);
  sub_213934C9C(v46);
  memcpy(v63, v60, 0x139uLL);
  sub_213934CC8((uint64_t)v63, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_213934D5C);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_213933CD4(char a1)
{
  if ((a1 & 1) != 0)
    return 0x746177656C707061;
  else
    return 0x672E656E6F687069;
}

uint64_t sub_213933D18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;

  v0 = sub_213935728();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_2139358C0();
  MEMORY[0x24BDAC7A8](v1);
  sub_2139358B4();
  sub_213933E80();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_21393571C();
  return sub_2139358CC();
}

unint64_t sub_213933E80()
{
  unint64_t result;

  result = qword_254D0C250;
  if (!qword_254D0C250)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254D0C250);
  }
  return result;
}

uint64_t sub_213933EBC@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20;
  char v21;
  uint64_t v22;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  v20 = a19;
  v21 = a18;
  v22 = a17;
  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_2139358D8();
    v31 = (void *)sub_2139357E8();
    sub_21393574C();

    v21 = a18;
    v20 = a19;
    v22 = a17;
  }
  sub_213935764();
  *(_QWORD *)a9 = a16;
  *(_QWORD *)(a9 + 8) = v22;
  *(_BYTE *)(a9 + 16) = v21 & 1;
  *(_QWORD *)(a9 + 24) = v20;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 80) = v36;
  sub_213934C60(a16, v22, v21 & 1);
  return swift_bridgeObjectRetain();
}

uint64_t sub_21393409C(char a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjCClassFromMetadata;
  id v7;

  v4 = sub_213935728();
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_2139358C0();
  MEMORY[0x24BDAC7A8](v5);
  if ((a2 & 1) != 0)
  {
    if (a1 != 2)
      goto LABEL_3;
  }
  else if (a1 != 2)
  {
LABEL_3:
    sub_2139358B4();
    sub_213933E80();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v7 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    sub_21393571C();
    return sub_2139358CC();
  }
  return 0;
}

BOOL sub_213934230(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

unint64_t sub_213934240()
{
  return 0xD000000000000011;
}

void *sub_213934274@<X0>(uint64_t a1@<X8>)
{
  unsigned __int8 *v1;
  __int16 v3;
  __int16 v4;
  uint64_t v5;
  _BYTE v7[392];
  _BYTE __src[395];

  v3 = *v1;
  v4 = v1[1];
  v5 = sub_213935788();
  sub_21393343C(v3 | (v4 << 8), (uint64_t)v7);
  memcpy(&__src[7], v7, 0x184uLL);
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  return memcpy((void *)(a1 + 17), __src, 0x18BuLL);
}

uint64_t sub_2139342FC()
{
  return sub_2139358F0();
}

uint64_t sub_213934320()
{
  sub_2139358E4();
  sub_2139358F0();
  return sub_2139358FC();
}

BOOL sub_213934364(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_213934380()
{
  unint64_t result;

  result = qword_254D0C258;
  if (!qword_254D0C258)
  {
    result = MEMORY[0x2199B903C](&unk_2139476F0, &type metadata for DataSharingType);
    atomic_store(result, (unint64_t *)&qword_254D0C258);
  }
  return result;
}

uint64_t sub_2139343C4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2139343D4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2139343E8()
{
  unint64_t result;

  result = qword_254D0C260;
  if (!qword_254D0C260)
  {
    result = MEMORY[0x2199B903C](&unk_2139477F8, &type metadata for CKSettingsSampleDeviceData);
    atomic_store(result, (unint64_t *)&qword_254D0C260);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DataSharingType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for DataSharingType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_213934518 + 4 * byte_2139476D5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21393454C + 4 * byte_2139476D0[v4]))();
}

uint64_t sub_21393454C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213934554(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21393455CLL);
  return result;
}

uint64_t sub_213934568(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213934570);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_213934574(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21393457C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213934588(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_213934590(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DataSharingType()
{
  return &type metadata for DataSharingType;
}

uint64_t method lookup function for CKSettingsCheckInDevicesList()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CKSettingsCheckInDevicesList.__allocating_init(fullDataSharing:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of CKSettingsCheckInDevicesList.getView()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for CKSettingsDevicesListView(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 8);
  v4 = v3 >= 3;
  v5 = v3 - 3;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for CKSettingsDevicesListView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for CKSettingsDevicesListView()
{
  return &type metadata for CKSettingsDevicesListView;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CKSettingsSampleDeviceListRow(unsigned __int16 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 65281 <= 0xFFFEFFFF)
    v2 = 2;
  else
    v2 = 4;
  if (a2 + 65281 < 0xFF0000)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 16)) - 65281;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
      return (*a1 | (v4 << 16)) - 65281;
    }
    v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2))
      return (*a1 | (v4 << 16)) - 65281;
  }
LABEL_17:
  v6 = *(unsigned __int8 *)a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CKSettingsSampleDeviceListRow(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 65281 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 65281 < 0xFF0000)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_213934770 + 4 * byte_2139476DF[v4]))();
  *a1 = a2 - 255;
  return ((uint64_t (*)(void))((char *)sub_2139347A4 + 4 * byte_2139476DA[v4]))();
}

uint64_t sub_2139347A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_2139347AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x2139347B4);
  return result;
}

uint64_t sub_2139347C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x2139347C8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2139347CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_2139347D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CKSettingsSampleDeviceListRow()
{
  return &type metadata for CKSettingsSampleDeviceListRow;
}

uint64_t getEnumTagSinglePayload for CKSettingsSampleDeviceData(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CKSettingsSampleDeviceData(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_2139348CC + 4 * byte_2139476E9[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_213934900 + 4 * byte_2139476E4[v4]))();
}

uint64_t sub_213934900(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213934908(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213934910);
  return result;
}

uint64_t sub_21393491C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213934924);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_213934928(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213934930(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_21393493C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CKSettingsSampleDeviceData()
{
  return &type metadata for CKSettingsSampleDeviceData;
}

unint64_t sub_21393495C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D0C290;
  if (!qword_254D0C290)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D0C248);
    v2[0] = sub_2139349E0();
    v2[1] = sub_213934B98(&qword_254D0C2A8, &qword_254D0C2B0, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x2199B903C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D0C290);
  }
  return result;
}

unint64_t sub_2139349E0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D0C298;
  if (!qword_254D0C298)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D0C228);
    v2[0] = sub_213934B98(&qword_254D0C2A0, &qword_254D0C220, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2199B903C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D0C298);
  }
  return result;
}

uint64_t sub_213934A64()
{
  return sub_213934B98(&qword_254D0C2B8, &qword_254D0C2C0, MEMORY[0x24BDF4498]);
}

uint64_t sub_213934A90@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_213935770();
  *a1 = result;
  return result;
}

uint64_t sub_213934AB8()
{
  swift_retain();
  return sub_21393577C();
}

uint64_t sub_213934AE0(uint64_t result)
{
  *(_BYTE *)(result + 312) = 1;
  return result;
}

uint64_t sub_213934AEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D0C2C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_213934B34()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D0C2E0;
  if (!qword_254D0C2E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D0C2D0);
    v2[0] = MEMORY[0x24BDF1F80];
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x2199B903C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D0C2E0);
  }
  return result;
}

uint64_t sub_213934B98(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2199B903C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_213934BD8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  if ((a40 & 1) != 0)
  {
    sub_213934C60(a4, a5, a6 & 1);
    swift_bridgeObjectRetain();
    sub_213934C60(a22, a23, a24 & 1);
  }
  else
  {
    sub_213934C60(a1, a2, a3 & 1);
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_213934C60(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_213934C70(uint64_t result)
{
  if (result)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_213934C9C(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_213934CC8(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  char v8;

  v8 = *(_BYTE *)(a1 + 312);
  v6 = *(_OWORD *)(a1 + 272);
  v7 = *(_OWORD *)(a1 + 288);
  v4 = *(_OWORD *)(a1 + 240);
  v5 = *(_OWORD *)(a1 + 256);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    *(_QWORD *)(a1 + 200),
    *(_QWORD *)(a1 + 208),
    *(_QWORD *)(a1 + 216),
    *(_QWORD *)(a1 + 224),
    *(_QWORD *)(a1 + 232),
    v4,
    *((_QWORD *)&v4 + 1),
    v5,
    *((_QWORD *)&v5 + 1),
    v6,
    *((_QWORD *)&v6 + 1),
    v7,
    *((_QWORD *)&v7 + 1),
    *(_QWORD *)(a1 + 304),
    v8);
  return a1;
}

uint64_t sub_213934D5C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  if ((a40 & 1) != 0)
  {
    sub_213934DE4(a4, a5, a6 & 1);
    swift_bridgeObjectRelease();
    sub_213934DE4(a22, a23, a24 & 1);
  }
  else
  {
    sub_213934DE4(a1, a2, a3 & 1);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_213934DE4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

unint64_t sub_213934DF4()
{
  unint64_t result;

  result = qword_254D0C2F0;
  if (!qword_254D0C2F0)
  {
    result = MEMORY[0x2199B903C](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_254D0C2F0);
  }
  return result;
}

uint64_t sub_213934E38(uint64_t result)
{
  *(_BYTE *)(result + 312) = 0;
  return result;
}

uint64_t sub_213934E40(uint64_t a1)
{
  sub_213934C60(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_213934E7C(uint64_t a1)
{
  sub_213934DE4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_213934EBC()
{
  return swift_deallocClassInstance();
}

id sub_213934ECC()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for ResourceBundleClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_254D0C9D0 = (uint64_t)result;
  return result;
}

uint64_t sub_213934F1C(uint64_t a1)
{
  return sub_213934FB4(a1, qword_254D0C9E8);
}

uint64_t sub_213934F40()
{
  return sub_213935068(&qword_254D0C9D8, (uint64_t)qword_254D0C9E8);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_213934F74@<X0>(uint64_t a1@<X8>)
{
  return sub_2139350C4(&qword_254D0C9D8, (uint64_t)qword_254D0C9E8, a1);
}

uint64_t sub_213934F90(uint64_t a1)
{
  return sub_213934FB4(a1, qword_254D0CA00);
}

uint64_t sub_213934FB4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  id v4;

  v3 = sub_213935740();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_254D0C9C8 != -1)
    swift_once();
  v4 = (id)qword_254D0C9D0;
  return sub_213935734();
}

uint64_t sub_21393504C()
{
  return sub_213935068(&qword_254D0C9E0, (uint64_t)qword_254D0CA00);
}

uint64_t sub_213935068(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = sub_213935740();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_2139350A8@<X0>(uint64_t a1@<X8>)
{
  return sub_2139350C4(&qword_254D0C9E0, (uint64_t)qword_254D0CA00, a1);
}

uint64_t sub_2139350C4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_213935740();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void __getCKSettingsHostingViewControllerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MessagesSettingsUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CKModernSettingsViewController.m"), 10, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCKSettingsHostingViewControllerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCKSettingsHostingViewControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKModernSettingsViewController.m"), 12, CFSTR("Unable to find class %s"), "CKSettingsHostingViewController");

  __break(1u);
}

void CNFLocalizedStringFromTableInBundleWithFallback_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_2138BA000, log, OS_LOG_TYPE_FAULT, "ERROR! We are missing a string in our bundle for the key %@ for our current platform (key = %@). This means the user could be seeing the incorrect copy text.", (uint8_t *)&v3, 0x16u);
}

uint64_t sub_21393571C()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_213935728()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_213935734()
{
  return MEMORY[0x24BDC6D30]();
}

uint64_t sub_213935740()
{
  return MEMORY[0x24BDC6D48]();
}

uint64_t sub_21393574C()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_213935758()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_213935764()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_213935770()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_21393577C()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_213935788()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_213935794()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_2139357A0()
{
  return MEMORY[0x24BDEF188]();
}

uint64_t sub_2139357AC()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_2139357B8()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_2139357C4()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_2139357D0()
{
  return MEMORY[0x24BDF11E0]();
}

uint64_t sub_2139357DC()
{
  return MEMORY[0x24BDF1200]();
}

uint64_t sub_2139357E8()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_2139357F4()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_213935800()
{
  return MEMORY[0x24BDF1640]();
}

uint64_t sub_21393580C()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_213935818()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_213935824()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_213935830()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_21393583C()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_213935848()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_213935854()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_213935860()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_21393586C()
{
  return MEMORY[0x24BDF3F78]();
}

uint64_t sub_213935878()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_213935884()
{
  return MEMORY[0x24BDF4908]();
}

uint64_t sub_213935890()
{
  return MEMORY[0x24BDF4918]();
}

uint64_t sub_21393589C()
{
  return MEMORY[0x24BDF4AC8]();
}

uint64_t sub_2139358A8()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_2139358B4()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_2139358C0()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_2139358CC()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_2139358D8()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2139358E4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2139358F0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2139358FC()
{
  return MEMORY[0x24BEE4328]();
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x24BDBBAC0](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x24BDBBAD8]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x24BE1FA98]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x24BDBC690]();
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDCD0](c, x, y);
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDF20](c, x, y);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x24BDBE038](c, width);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBE0D0](c, color);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x24BDBE118](c);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGSize CGSizeFromString(NSString *string)
{
  double v1;
  double v2;
  CGSize result;

  MEMORY[0x24BEBD240](string);
  result.height = v2;
  result.width = v1;
  return result;
}

uint64_t CPCopySharedResourcesPreferencesDomainForDomain()
{
  return MEMORY[0x24BE04668]();
}

uint64_t CPPhoneNumberCopyActiveCountryCode()
{
  return MEMORY[0x24BE046F0]();
}

uint64_t CTSIMSupportGetSIMStatus()
{
  return MEMORY[0x24BDC26A0]();
}

uint64_t CTSettingCopyMyPhoneNumber()
{
  return MEMORY[0x24BDC26B0]();
}

uint64_t CUTWeakLinkClass()
{
  return MEMORY[0x24BE18E00]();
}

uint64_t CUTWeakLinkSymbol()
{
  return MEMORY[0x24BE18E08]();
}

uint64_t CreateDetailControllerInstanceWithClass()
{
  return MEMORY[0x24BE75420]();
}

uint64_t DLCLogWithLevelV()
{
  return MEMORY[0x24BE2CA68]();
}

uint64_t DLCSessionLogWithLevelV()
{
  return MEMORY[0x24BE2CA70]();
}

uint64_t DLCSessionShouldLogLevel()
{
  return MEMORY[0x24BE2CA78]();
}

uint64_t DLCShouldLogLevel()
{
  return MEMORY[0x24BE2CA80]();
}

uint64_t FTCServiceNameForServiceType()
{
  return MEMORY[0x24BE302E8]();
}

uint64_t IDSParseAuthDictionary()
{
  return MEMORY[0x24BE4FD78]();
}

uint64_t IDSRegistrationControlEnableRegistrationType()
{
  return MEMORY[0x24BE4FA40]();
}

uint64_t IDSRegistrationControlGetStateForRegistrationType()
{
  return MEMORY[0x24BE4FA48]();
}

uint64_t IMAreObjectsLogicallySame()
{
  return MEMORY[0x24BE50650]();
}

uint64_t IMGenerateLoginID()
{
  return MEMORY[0x24BE50690]();
}

uint64_t IMGetDomainBoolForKey()
{
  return MEMORY[0x24BE506B8]();
}

uint64_t IMGetDomainBoolForKeyWithDefaultValue()
{
  return MEMORY[0x24BE506C0]();
}

uint64_t IMGetDomainValueForKey()
{
  return MEMORY[0x24BE506C8]();
}

uint64_t IMLogHandleForCategory()
{
  return MEMORY[0x24BE50E50]();
}

uint64_t IMLogString()
{
  return MEMORY[0x24BE50780]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x24BE50790]();
}

uint64_t IMPerformSystem()
{
  return MEMORY[0x24BE50798]();
}

uint64_t IMPreferredAccountForService()
{
  return MEMORY[0x24BE501C0]();
}

uint64_t IMSetDomainBoolForKey()
{
  return MEMORY[0x24BE507C8]();
}

uint64_t IMSetPreferredAccountForService()
{
  return MEMORY[0x24BE50230]();
}

uint64_t IMSetUserLoginIntent()
{
  return MEMORY[0x24BE51028]();
}

uint64_t IMSharedHelperDeviceHasMultipleActiveSubscriptions()
{
  return MEMORY[0x24BE51030]();
}

uint64_t IMSharedHelperDeviceHasMultipleSubscriptions()
{
  return MEMORY[0x24BE51038]();
}

uint64_t IMSharedHelperNickNameEnabled()
{
  return MEMORY[0x24BE51048]();
}

uint64_t IMShouldLog()
{
  return MEMORY[0x24BE507D8]();
}

uint64_t IMSingleObjectArray()
{
  return MEMORY[0x24BE507F0]();
}

uint64_t IMStripFormattingFromAddress()
{
  return MEMORY[0x24BE50818]();
}

uint64_t IMStripLoginID()
{
  return MEMORY[0x24BE50820]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x24BE50840]();
}

uint64_t IMWeakLinkSymbol()
{
  return MEMORY[0x24BE50848]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MarcoAction()
{
  return MEMORY[0x24BE63FE0]();
}

uint64_t MarcoLogRegistration()
{
  return MEMORY[0x24BE64008]();
}

uint64_t MarcoShouldLogRegistration()
{
  return MEMORY[0x24BE64030]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t OSLogHandleForIDSCategory()
{
  return MEMORY[0x24BE508F8]();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x24BE50908]();
}

uint64_t ObjectAndOffsetForURLPair()
{
  return MEMORY[0x24BE757B8]();
}

uint64_t PNCopyFormattedStringWithCountry()
{
  return MEMORY[0x24BE1FAB8]();
}

uint64_t PSIsNanoMirroringDomain()
{
  return MEMORY[0x24BE75B10]();
}

uint64_t PreferencesTableViewCellLeftPad()
{
  return MEMORY[0x24BE75DB0]();
}

uint64_t PreferencesTableViewCellRightPad()
{
  return MEMORY[0x24BE75DB8]();
}

uint64_t PreferencesTableViewFooterColor()
{
  return MEMORY[0x24BE75DC0]();
}

uint64_t PreferencesTableViewFooterFont()
{
  return MEMORY[0x24BE75DC8]();
}

uint64_t PreferencesTableViewHeaderColor()
{
  return MEMORY[0x24BE75DD0]();
}

uint64_t PreferencesTableViewHeaderFont()
{
  return MEMORY[0x24BE75DD8]();
}

uint64_t SBGetApplicationNetworkFlags()
{
  return MEMORY[0x24BEB0B70]();
}

uint64_t SBSLaunchApplicationWithIdentifier()
{
  return MEMORY[0x24BEB0CA8]();
}

uint64_t SBSSpringBoardServerPort()
{
  return MEMORY[0x24BEB0D48]();
}

uint64_t SBSetApplicationNetworkFlags()
{
  return MEMORY[0x24BEB0DD0]();
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

uint64_t SpecifiersFromPlist()
{
  return MEMORY[0x24BE75DF8]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BEBE280](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BEBE2A8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BEBE2B0]();
}

uint64_t UIKeyboardDisableAutomaticAppearance()
{
  return MEMORY[0x24BEBE450]();
}

uint64_t UIKeyboardEnableAutomaticAppearance()
{
  return MEMORY[0x24BEBE458]();
}

uint64_t UIKeyboardIsAutomaticAppearanceEnabled()
{
  return MEMORY[0x24BEBE508]();
}

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x24BEBE768]();
}

uint64_t UserInterfaceIdiom()
{
  return MEMORY[0x24BE75E08]();
}

uint64_t _AXSFaceTimeCaptionsEnabled()
{
  return MEMORY[0x24BED21E0]();
}

uint64_t _AXSSetFaceTimeCaptionsEnabled()
{
  return MEMORY[0x24BED2468]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFGetProductName()
{
  return MEMORY[0x24BDBCFE8]();
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x24BDC2878]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x24BDC2888]();
}

uint64_t _CTServerConnectionSetCellularUsagePolicy()
{
  return MEMORY[0x24BDC2960]();
}

uint64_t _CTServerConnectionSetTraceProperty()
{
  return MEMORY[0x24BDC2980]();
}

uint64_t _IDSCopyMyPhoneNumbers()
{
  return MEMORY[0x24BE4FE98]();
}

uint64_t _IDSCopyOrderedAliasStrings()
{
  return MEMORY[0x24BE4FEA0]();
}

uint64_t _IDSCopyOrderedAliases()
{
  return MEMORY[0x24BE4FEA8]();
}

uint64_t _PNCopyFormattedNumberSuggestionForDigitsWithCountry()
{
  return MEMORY[0x24BE1FAD8]();
}

uint64_t _PNCreateStringByStrippingFormattingAndNotVisiblyAllowable()
{
  return MEMORY[0x24BE1FAF0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x24BDAD288](a1, *(_QWORD *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x24BDAD2A0](a1, *(_QWORD *)&a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t im_dispatch_after()
{
  return MEMORY[0x24BE509D0]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x24BEDD0F8](to, from);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

uint64_t os_log_shim_legacy_logging_enabled()
{
  return MEMORY[0x24BDAF388]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

