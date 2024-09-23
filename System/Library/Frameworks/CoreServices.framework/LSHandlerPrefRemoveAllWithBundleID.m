@implementation LSHandlerPrefRemoveAllWithBundleID

void ___LSHandlerPrefRemoveAllWithBundleID_block_invoke(uint64_t a1)
{
  _LSDServiceDomain *v2;
  void **v3;
  _LSDatabase *StringForCFString;
  NSObject *v5;
  uint64_t v6;
  _LSDServiceDomain *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  _LSDServiceDomain *v16;
  uint64_t v17;
  id v18;
  void **v19;
  id v20;
  char v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v2 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v3 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v19, v2, 0);

  if (!v3)
  {
    _LSDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 32);
      +[_LSDServiceDomain defaultServiceDomain]();
      v16 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v17 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v19, v16, 0);

      if (v17)
        v18 = 0;
      else
        v18 = v22;
      *(_DWORD *)buf = 138412546;
      v24 = v15;
      v25 = 2112;
      v26 = v18;
      _os_log_error_impl(&dword_182882000, v5, OS_LOG_TYPE_ERROR, "Error getting the database context when removing handler prefs for %@: %@", buf, 0x16u);

    }
    v6 = *(_QWORD *)(a1 + 48);
    +[_LSDServiceDomain defaultServiceDomain]();
    v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v8 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v19, v7, 0);

    if (v8)
      v9 = 0;
    else
      v9 = v22;
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v9);
    goto LABEL_12;
  }
  StringForCFString = (_LSDatabase *)_LSDatabaseGetStringForCFString(*v3, *(const __CFString **)(a1 + 32), 0);
  if (!(_DWORD)StringForCFString)
  {
    _LSDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v24 = v11;
      _os_log_impl(&dword_182882000, v10, OS_LOG_TYPE_INFO, "Unable to remove all prefs with bundleID %{public}@, returning kLSApplicationNotFoundErr", buf, 0xCu);
    }

    v12 = *(_QWORD *)(a1 + 48);
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10814, (uint64_t)"_LSHandlerPrefRemoveAllWithBundleID_block_invoke", 1088, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, 0, v9);
LABEL_12:

    goto LABEL_13;
  }
  LSHandlerPref::RemoveRoleHandlersMatchingBundleID((LSHandlerPref *)*v3, StringForCFString);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_13:
  if (v19 && v21)
    _LSContextDestroy(v19);
  v13 = v20;
  v19 = 0;
  v20 = 0;

  v21 = 0;
  v14 = v22;
  v22 = 0;

}

uint64_t ___LSHandlerPrefRemoveAllWithBundleID_block_invoke_31(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void ___LSHandlerPrefRemoveAllWithBundleID_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _LSDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    ___LSHandlerPrefRemoveAllWithBundleID_block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void ___LSHandlerPrefRemoveAllWithBundleID_block_invoke_35(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _LSDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      ___LSHandlerPrefRemoveAllWithBundleID_block_invoke_35_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void ___LSHandlerPrefRemoveAllWithBundleID_block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v0, v1, "XPC error removing handler prefs for %@: %@");
  OUTLINED_FUNCTION_1();
}

void ___LSHandlerPrefRemoveAllWithBundleID_block_invoke_35_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v0, v1, "Error removing handler prefs for %@: %@");
  OUTLINED_FUNCTION_1();
}

@end
