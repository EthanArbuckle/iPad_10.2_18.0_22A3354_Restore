@implementation NSError(HealthRecordsServices)

- (BOOL)hrs_isReloginRequiredError
{
  unint64_t v2;
  _BOOL8 v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  if (objc_msgSend(a1, "hk_OAuth2_isOAuth2Error"))
  {
    v2 = objc_msgSend(a1, "code");
    if (v2 >= 0xB)
      return 0;
    else
      return (0x4A8u >> v2) & 1;
  }
  else
  {
    objc_msgSend(a1, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.healthkit.healthrecords.private"));

    if (v5)
    {
      return objc_msgSend(a1, "code") == 1;
    }
    else
    {
      objc_msgSend(a1, "hrs_accumulatedAuthorizationFailures");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hk_filter:", &__block_literal_global_2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v7, "count") != 0;

    }
  }
  return v3;
}

- (id)_hrs_accumulatedErrorsForUserInfoKey:()HealthRecordsServices
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("HRSAccumulatedIngestionErrorDomain")))
  {
    objc_msgSend(a1, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v12 = 0;
      goto LABEL_10;
    }
    objc_msgSend(a1, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    HKSafeObject();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "hk_filter:", &__block_literal_global_195);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

  }
  else
  {
    v12 = 0;
  }

LABEL_10:
  return v12;
}

- (uint64_t)hrs_accumulatedAuthorizationFailures
{
  return objc_msgSend(a1, "_hrs_accumulatedErrorsForUserInfoKey:", CFSTR("AuthorizationFailures"));
}

- (uint64_t)hrs_hasAuthorizationFailure
{
  _BOOL8 v2;
  void *v3;

  if ((objc_msgSend(a1, "hk_OAuth2_isOAuth2Error") & 1) != 0)
    return 1;
  objc_msgSend(a1, "hrs_accumulatedAuthorizationFailures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "count") != 0;

  return v2;
}

- (uint64_t)hrs_accumulatedResourceFetchFailures
{
  return objc_msgSend(a1, "_hrs_accumulatedErrorsForUserInfoKey:", CFSTR("ResourceFetchFailures"));
}

- (BOOL)hrs_hasResourceFetchFailure
{
  void *v2;
  int v3;
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD2ED8]);

  if (!v3)
  {
    objc_msgSend(a1, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.healthkit.healthrecords.private")))
    {
      v6 = objc_msgSend(a1, "code");

      if (v6 == 2)
        return 1;
    }
    else
    {

    }
    objc_msgSend(a1, "hrs_accumulatedResourceFetchFailures");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "count") != 0;

    return v4;
  }
  return objc_msgSend(a1, "code") > 399;
}

- (BOOL)hrs_hasResourceFetchErrorsIndicatingRateLimitation
{
  void *v2;
  int v3;
  _BOOL8 v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD2ED8]);

  if (v3)
  {
    return objc_msgSend(a1, "code") == 429 || objc_msgSend(a1, "code") == 425;
  }
  else
  {
    objc_msgSend(a1, "hrs_accumulatedResourceFetchFailures");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hk_filter:", &__block_literal_global_197);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "count") != 0;

  }
  return v4;
}

- (uint64_t)hrs_accumulatedOtherErrors
{
  return objc_msgSend(a1, "_hrs_accumulatedErrorsForUserInfoKey:", CFSTR("OtherErrors"));
}

- (uint64_t)hrs_completeDescription
{
  return objc_msgSend(a1, "hrs_completeDescriptionRedactingSensitiveItemsIfNecessary:", 0);
}

- (uint64_t)hrs_safelyLoggableDescription
{
  return objc_msgSend(a1, "hrs_completeDescriptionRedactingSensitiveItemsIfNecessary:", 1);
}

- (id)hrs_completeDescriptionRedactingSensitiveItemsIfNecessary:()HealthRecordsServices
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  char v44;

  objc_msgSend(a1, "localizedDescription");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if ((_DWORD)a3)
  {
    HKSensitiveLogItem();
    v7 = objc_claimAutoreleasedReturnValue();

    v37 = (void *)v7;
  }
  else
  {
    v37 = (void *)v5;
  }
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(a1, "hrs_userInfoValueForKey:prefixedWith:redactIfNecessary:", *MEMORY[0x24BDD1320], CFSTR("failing URL"), a3);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hrs_userInfoValueForKey:prefixedWith:redactIfNecessary:", *MEMORY[0x24BDD0BF8], CFSTR("failing URL"), a3);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hrs_userInfoValueForKey:prefixedWith:redactIfNecessary:", *MEMORY[0x24BDD2EE0], CFSTR("failing URL"), a3);
  v11 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)v11;
  v41 = (void *)v10;
  if (v10)
    v12 = v10;
  else
    v12 = v11;
  v42 = (void *)v9;
  if (v9)
    v13 = v9;
  else
    v13 = v12;
  objc_msgSend(v8, "hk_addNonNilObject:", v13);
  objc_msgSend(a1, "hrs_userInfoValueForKey:prefixedWith:redactIfNecessary:", *MEMORY[0x24BDD2EE8], CFSTR("response headers"), a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_addNonNilObject:", v14);

  objc_msgSend(a1, "hrs_userInfoValueForKey:prefixedWith:redactIfNecessary:", *MEMORY[0x24BDD3278], CFSTR("bearer auth error"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_addNonNilObject:", v15);

  objc_msgSend(a1, "hrs_userInfoValueForKey:prefixedWith:redactIfNecessary:", *MEMORY[0x24BDD3288], CFSTR("server error description"), a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_addNonNilObject:", v16);

  objc_msgSend(a1, "hrs_userInfoValueForKey:prefixedWith:redactIfNecessary:", *MEMORY[0x24BDD3290], CFSTR("server error name"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_addNonNilObject:", v17);

  objc_msgSend(a1, "hrs_userInfoValueForKey:prefixedWith:redactIfNecessary:", *MEMORY[0x24BDD3280], CFSTR("HTTP status"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_addNonNilObject:", v18);

  objc_msgSend(a1, "underlyingErrors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  objc_msgSend(a1, "hrs_accumulatedAuthorizationFailures");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "count"))
    objc_msgSend(v20, "addObjectsFromArray:", v21);
  objc_msgSend(a1, "hrs_accumulatedResourceFetchFailures");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count"))
    objc_msgSend(v20, "addObjectsFromArray:", v22);
  objc_msgSend(a1, "hrs_accumulatedOtherErrors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "count"))
    objc_msgSend(v20, "addObjectsFromArray:", v23);
  v38 = v22;
  v39 = v21;
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __92__NSError_HealthRecordsServices__hrs_completeDescriptionRedactingSensitiveItemsIfNecessary___block_invoke;
  v43[3] = &__block_descriptor_33_e17__16__0__NSError_8l;
  v44 = a3;
  objc_msgSend(v20, "hk_map:", v43);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v25 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR(", %@"), v26);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = &stru_24D54C670;
  }
  if (objc_msgSend(v24, "count"))
  {
    v28 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v24, "componentsJoinedByString:", CFSTR(", "));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR(", underlying errors: [%@]"), v29);
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v30 = &stru_24D54C670;
  }
  v31 = (void *)MEMORY[0x24BDD17C8];
  v32 = (objc_class *)objc_opt_class();
  NSStringFromClass(v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "domain");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringWithFormat:", CFSTR("<%@ %@: %ld, \"%@\"%@%@>"), v33, v34, objc_msgSend(a1, "code"), v37, v27, v30);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

+ (id)hrs_resourceParsingErrorWithUnderlyingError:()HealthRecordsServices
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v8 = *MEMORY[0x24BDD1398];
    v9[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.healthkit.healthrecords.private"), 2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)hrs_authorizationOrResourceFetchErrorFromError:()HealthRecordsServices
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSError+HealthRecordServices.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

  }
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("HRSAccumulatedIngestionErrorDomain"));

  if (v7)
  {
    v8 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    v9 = objc_msgSend(v5, "hk_OAuth2_isOAuth2Error");
    v10 = (void *)MEMORY[0x24BDD1540];
    if (v9)
    {
      v18[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v10;
      v13 = v11;
      v14 = 0;
    }
    else
    {
      v17 = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v10;
      v13 = 0;
      v14 = v11;
    }
    objc_msgSend(v12, "hrs_accumulatedErrorWithAuthorizationFailures:resourceFetchFailures:otherErrors:", v13, v14, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (id)hrs_errorWithAccumulatedErrors:()HealthRecordsServices
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v32 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v31 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    v9 = MEMORY[0x24BDBD1A8];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "domain");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("HRSAccumulatedIngestionErrorDomain"));

          if (v13)
          {
            objc_msgSend(v11, "hrs_accumulatedAuthorizationFailures");
            v14 = objc_claimAutoreleasedReturnValue();
            v15 = (void *)v14;
            if (v14)
              v16 = v14;
            else
              v16 = v9;
            objc_msgSend(v4, "addObjectsFromArray:", v16);

            objc_msgSend(v11, "hrs_accumulatedResourceFetchFailures");
            v17 = objc_claimAutoreleasedReturnValue();
            v18 = (void *)v17;
            if (v17)
              v19 = v17;
            else
              v19 = v9;
            objc_msgSend(v32, "addObjectsFromArray:", v19);

            objc_msgSend(v11, "hrs_accumulatedOtherErrors");
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = (void *)v20;
            if (v20)
              v22 = v20;
            else
              v22 = v9;
            objc_msgSend(v31, "addObjectsFromArray:", v22);

          }
          else
          {
            if (objc_msgSend(v11, "hrs_hasAuthorizationFailure"))
            {
              v26 = v4;
            }
            else if (objc_msgSend(v11, "hrs_hasResourceFetchFailure"))
            {
              v26 = v32;
            }
            else
            {
              v26 = v31;
            }
            objc_msgSend(v26, "addObject:", v11);
          }
        }
        else
        {
          _HKInitializeLogging();
          v23 = (void *)*MEMORY[0x24BDD2FF8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
          {
            v24 = v23;
            NSStringFromSelector(a2);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v38 = v25;
            v39 = 2114;
            v40 = v11;
            _os_log_error_impl(&dword_2163C4000, v24, OS_LOG_TYPE_ERROR, "%{public}@ only expecting NSError entries in the array but got %{public}@", buf, 0x16u);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v7);
  }

  objc_msgSend(a1, "hrs_accumulatedErrorWithAuthorizationFailures:resourceFetchFailures:otherErrors:", v4, v32, v31);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)hrs_accumulatedErrorWithAuthorizationFailures:()HealthRecordsServices resourceFetchFailures:otherErrors:
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (objc_msgSend(v7, "count"))
  {
    v11 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("AuthorizationFailures"));

  }
  if (objc_msgSend(v8, "count"))
  {
    v12 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("ResourceFetchFailures"));

  }
  if (objc_msgSend(v9, "count"))
  {
    v13 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("OtherErrors"));

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu authorization failures, %lu resource fetch failures, %lu other errors"), objc_msgSend(v7, "count"), objc_msgSend(v8, "count"), objc_msgSend(v9, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Accumulated errors: %@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDD0FC8]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HRSAccumulatedIngestionErrorDomain"), 0, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)hrs_userInfoValueForKey:()HealthRecordsServices prefixedWith:redactIfNecessary:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __89__NSError_HealthRecordsServices__hrs_userInfoValueForKey_prefixedWith_redactIfNecessary___block_invoke;
      v19[3] = &unk_24D549970;
      v20 = v12;
      v13 = v12;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v19);
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
      v14 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v14;
    }
    v15 = (void *)MEMORY[0x24BDD17C8];
    if ((a5 & 1) != 0)
    {
      HKSensitiveLogItem();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: %@"), v8, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %@"), v8, v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)hrs_cocoaErrorWithCode:()HealthRecordsServices
{
  id v4;

  v4 = objc_alloc(MEMORY[0x24BDD1540]);
  return (id)objc_msgSend(v4, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], a3, 0);
}

+ (uint64_t)hrs_cocoaValueNotFoundError
{
  return objc_msgSend(a1, "hrs_cocoaErrorWithCode:", 4865);
}

+ (uint64_t)hrs_cocoaInvalidValueError
{
  return objc_msgSend(a1, "hrs_cocoaErrorWithCode:", 4866);
}

@end
