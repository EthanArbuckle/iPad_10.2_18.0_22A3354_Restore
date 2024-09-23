@implementation _INVocabularyValidator

- (id)validatedItemsFromVocabularyStrings:(id)a3 ofType:(int64_t)a4 loggingWarnings:(BOOL)a5
{
  return -[_INVocabularyValidator _validatedItemsFromVocabularyObject:ofType:loggingWarnings:withItemFactory:](self, "_validatedItemsFromVocabularyObject:ofType:loggingWarnings:withItemFactory:", a3, a4, a5, &__block_literal_global_61);
}

- (void)determineIfBundleID:(id)a3 canProvideVocabularyOfType:(int64_t)a4 completion:(id)a5
{
  void (**v8)(id, uint64_t);
  void *v9;
  id v10;

  v10 = a3;
  v8 = (void (**)(id, uint64_t))a5;
  if (v8)
  {
    if (-[_INVocabularyValidator _bundleID:isWhitelistedForVocabularyType:](self, "_bundleID:isWhitelistedForVocabularyType:", v10, a4))
    {
      v8[2](v8, 1);
    }
    else
    {
      -[_INVocabularyValidator _pathToAppWithBundleID:](self, "_pathToAppWithBundleID:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_INVocabularyValidator _determineIfBundleID:appPath:canProvideVocabularyOfType:completion:](self, "_determineIfBundleID:appPath:canProvideVocabularyOfType:completion:", v10, v9, a4, v8);

    }
  }

}

- (id)_validatedItemsFromVocabularyObject:(id)a3 ofType:(int64_t)a4 loggingWarnings:(BOOL)a5 withItemFactory:(id)a6
{
  _BOOL4 v7;
  id v10;
  void (**v11)(id, _QWORD);
  unint64_t v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v30;
  id v31;
  void (**v32)(id, _QWORD);
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v7 = a5;
  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, _QWORD))a6;
  v12 = -[_INVocabularyValidator maximumNumberOfVocabularyStringsForType:](self, "maximumNumberOfVocabularyStringsForType:", a4);
  v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v14 = objc_msgSend(v10, "count");
  if (v14 >= v12)
    v15 = v12;
  else
    v15 = v14;
  v16 = (void *)objc_msgSend(v13, "initWithCapacity:", v15);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v17 = v10;
  v33 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v33)
  {
    v18 = *(_QWORD *)v39;
    v31 = v17;
    v32 = v11;
    v30 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v17);
        v11[2](v11, *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (!v20 || !objc_msgSend(v20, "count"))
          goto LABEL_28;
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v21 = v21;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (!v22)
          goto LABEL_27;
        v23 = v22;
        v24 = *(_QWORD *)v35;
        while (2)
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v35 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
            v27 = objc_msgSend(v26, "validate");
            if (v27 == 1)
            {
              if (objc_msgSend(v16, "count") >= v12)
              {

                v17 = v31;
                v11 = v32;
                goto LABEL_32;
              }
              objc_msgSend(v16, "addObject:", v26);
            }
            else
            {
              if (!v7)
                continue;
              if (v27 == 4)
              {
                _INStringFromVocabularyStringType(a4);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                NSLog((NSString *)CFSTR("WARNING: ignoring a vocabulary item of type %@ because the vocabulary identifier is too long"), v28);
              }
              else
              {
                if (v27 != 3)
                  continue;
                _INStringFromVocabularyStringType(a4);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                NSLog((NSString *)CFSTR("WARNING: ignoring a vocabulary item of type %@ because the string is too long"), v28);
              }

            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v23)
            continue;
          break;
        }
LABEL_27:

        v17 = v31;
        v11 = v32;
        v18 = v30;
LABEL_28:

      }
      v33 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v33);
  }
LABEL_32:

  return v16;
}

- (unint64_t)maximumNumberOfVocabularyStringsForType:(int64_t)a3
{
  unint64_t result;

  if (a3 <= 499)
  {
    if (a3 > 199)
    {
      if ((unint64_t)(a3 - 300) >= 2)
      {
        if ((unint64_t)(a3 - 400) < 2 || a3 == 200)
          return 500;
        return 0;
      }
    }
    else
    {
      if ((unint64_t)(a3 - 100) < 2)
        return 500;
      if (a3 == 1)
        return 1500;
      if (a3 != 2)
        return 0;
    }
    return 1000;
  }
  if ((unint64_t)(a3 - 700) < 5)
    return 500;
  switch(a3)
  {
    case 50000:
      return 1000;
    case 50001:
      return 500;
    case 50002:
      result = 10;
      break;
    case 50003:
      result = 2000;
      break;
    default:
      if ((unint64_t)(a3 - 500) >= 2)
        return 0;
      result = 200;
      break;
  }
  return result;
}

- (id)_pathToAppWithBundleID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  if (!v4)
  {
    v6 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "-[_INVocabularyValidator _pathToAppWithBundleID:]";
      v14 = 2114;
      v15 = v3;
      v16 = 2114;
      v17 = v5;
      _os_log_error_impl(&dword_18BEBC000, v6, OS_LOG_TYPE_ERROR, "%s Could not get a bundle record for %{public}@ %{public}@", buf, 0x20u);
    }
  }
  objc_msgSend(v4, "if_containingAppRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_determineIfBundleID:(id)a3 appPath:(id)a4 canProvideVocabularyOfType:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, uint64_t);
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _INVocabularyValidator *v35;
  id v36;
  void (**v37)(id, uint64_t);
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[3];
  _QWORD v43[3];
  uint8_t v44[128];
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, uint64_t))a6;
  if (v12)
  {
    INPluginKitCompatiblePathFromPath(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[_INVocabularyValidator _intentsUsingVocabularyType:](self, "_intentsUsingVocabularyType:", a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "count"))
      {
        v30 = v13;
        v31 = v10;
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v10, 0, 0);
        +[INAppInfo appInfoWithApplicationRecord:](INAppInfo, "appInfoWithApplicationRecord:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v32 = v14;
        v16 = v14;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v39;
          while (2)
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v39 != v19)
                objc_enumerationMutation(v16);
              v21 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
              objc_msgSend(v15, "supportedIntents");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v21) = objc_msgSend(v22, "containsObject:", v21);

              if ((_DWORD)v21)
              {
                v12[2](v12, 1);
                v13 = v30;
                v10 = v31;
                goto LABEL_17;
              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
            if (v18)
              continue;
            break;
          }
        }

        v42[0] = *MEMORY[0x1E0CB2A28];
        v42[1] = CFSTR("IntentsSupported");
        v43[0] = CFSTR("com.apple.intents-service");
        v43[1] = v16;
        v42[2] = *MEMORY[0x1E0D7D448];
        v13 = v30;
        v43[2] = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 3);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x1E0CB35D8];
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __93___INVocabularyValidator__determineIfBundleID_appPath_canProvideVocabularyOfType_completion___block_invoke;
        v33[3] = &unk_1E228E7F8;
        v37 = v12;
        v10 = v31;
        v34 = v31;
        v35 = self;
        v36 = v16;
        objc_msgSend(v24, "extensionsWithMatchingAttributes:completion:", v23, v33);

        v16 = (id)v23;
LABEL_17:

        v14 = v32;
      }
      else
      {
        v26 = (void *)INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          v27 = v26;
          _INStringFromVocabularyStringType(a5);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v46 = "-[_INVocabularyValidator _determineIfBundleID:appPath:canProvideVocabularyOfType:completion:]";
          v47 = 2114;
          v48 = v28;
          _os_log_error_impl(&dword_18BEBC000, v27, OS_LOG_TYPE_ERROR, "%s No intents use user-vocabulary of type %{public}@", buf, 0x16u);

        }
        v12[2](v12, 0);
      }

    }
    else
    {
      v25 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v46 = "-[_INVocabularyValidator _determineIfBundleID:appPath:canProvideVocabularyOfType:completion:]";
        v47 = 2114;
        v48 = v10;
        v49 = 2114;
        v50 = v11;
        _os_log_error_impl(&dword_18BEBC000, v25, OS_LOG_TYPE_ERROR, "%s Couldn't get realpath() to %{public}@ %{public}@", buf, 0x20u);
      }
      v12[2](v12, 0);
    }

  }
}

- (id)_intentsUsingVocabularyType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (_intentsUsingVocabularyType__onceToken != -1)
    dispatch_once(&_intentsUsingVocabularyType__onceToken, &__block_literal_global_61301);
  v4 = (void *)_intentsUsingVocabularyType__sIntentsUsingSyncSlot;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_bundleID:(id)a3 isWhitelistedForVocabularyType:(int64_t)a4
{
  id v5;
  BOOL v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobileslideshow")))
  {
    v6 = (unint64_t)(a4 - 100) < 2 || a4 == 50003;
    v7 = (unint64_t)(a4 - 1) < 2 || v6;
    goto LABEL_23;
  }
  if (a4 == 301)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.passd")) & 1) == 0)
      goto LABEL_18;
LABEL_17:
    v7 = 1;
    goto LABEL_23;
  }
  if (a4 == 50003)
    goto LABEL_17;
  if (a4 != 50000)
  {
LABEL_18:
    v7 = 0;
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForIdentifier:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "bundleType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CA57E8])
      && (objc_msgSend(v9, "bundleURL"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v11, "path"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "hasPrefix:", CFSTR("/System/Library/")),
          v12,
          v11,
          (v13 & 1) != 0)
      || (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CA57F0]) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      v7 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CA5820]);
    }

  }
  else
  {
    v7 = 1;
  }

LABEL_23:
  return v7;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_66271);
}

- (id)validatedItemsFromVocabularySpeakables:(id)a3 ofType:(int64_t)a4 loggingWarnings:(BOOL)a5
{
  return -[_INVocabularyValidator _validatedItemsFromVocabularyObject:ofType:loggingWarnings:withItemFactory:](self, "_validatedItemsFromVocabularyObject:ofType:loggingWarnings:withItemFactory:", a3, a4, a5, &__block_literal_global_63_61296);
}

- (void)_confirmExistenceOfWatchAppForCompanionBundleID:(id)a3 handlingIntents:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 buf;
  Class (*v25)(uint64_t);
  void *v26;
  uint64_t *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    if (INSupportsPairedDevice_onceToken != -1)
      dispatch_once(&INSupportsPairedDevice_onceToken, &__block_literal_global_55_69005);
    if (INSupportsPairedDevice_supportsPairedDevice)
    {
      v20 = 0;
      v21 = &v20;
      v22 = 0x2050000000;
      v10 = (void *)getACXDeviceConnectionClass_softClass;
      v23 = getACXDeviceConnectionClass_softClass;
      v11 = MEMORY[0x1E0C809B0];
      if (!getACXDeviceConnectionClass_softClass)
      {
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v25 = __getACXDeviceConnectionClass_block_invoke;
        v26 = &unk_1E22953C0;
        v27 = &v20;
        __getACXDeviceConnectionClass_block_invoke((uint64_t)&buf);
        v10 = (void *)v21[3];
      }
      v12 = objc_retainAutorelease(v10);
      _Block_object_dispose(&v20, 8);
      objc_msgSend(v12, "sharedDeviceConnection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v11;
      v16[1] = 3221225472;
      v16[2] = __101___INVocabularyValidator__confirmExistenceOfWatchAppForCompanionBundleID_handlingIntents_completion___block_invoke;
      v16[3] = &unk_1E228E7D0;
      v19 = v9;
      v17 = v13;
      v18 = v8;
      v14 = v13;
      objc_msgSend(v14, "fetchWatchAppBundleIDForCompanionAppBundleID:completion:", v7, v16);

    }
    else
    {
      v15 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 136315138;
        *(_QWORD *)((char *)&buf + 4) = "-[_INVocabularyValidator _confirmExistenceOfWatchAppForCompanionBundleID:handlin"
                                        "gIntents:completion:]";
        _os_log_impl(&dword_18BEBC000, v15, OS_LOG_TYPE_INFO, "%s No watch pairing capability", (uint8_t *)&buf, 0xCu);
      }
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    }
  }

}

@end
