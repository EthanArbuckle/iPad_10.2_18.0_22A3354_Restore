@implementation FBKDEDHelper

+ (id)bugSessionIDForAdoptingLocalFilesWithFilerForm:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[FBKGroupedDevice currentGroupedDevice](FBKGroupedDevice, "currentGroupedDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bugSessionIDForForm:device:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "adoptSessionIdWithExistingSessionId:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)adoptSessionIdWithExistingSessionId:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("adopt-%@"), a3);
}

+ (void)reconnectWithBugSessionWithIdentifier:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  dispatch_time_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  __int128 *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v29;
  char v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BE2CA50], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sessionForIdentifier:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[FBKLog ded](FBKLog, "ded");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_21D9A9000, v14, OS_LOG_TYPE_INFO, "Found existing session [%{public}@]. Will ping", (uint8_t *)&buf, 0xCu);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v29 = 0x2020000000;
    v15 = MEMORY[0x24BDAC760];
    v30 = 0;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __82__FBKDEDHelper_reconnectWithBugSessionWithIdentifier_deviceIdentifier_completion___block_invoke;
    v24[3] = &unk_24E1587C8;
    p_buf = &buf;
    v16 = v10;
    v26 = v16;
    v25 = v12;
    objc_msgSend(v25, "pingWithCallback:", v24);
    v17 = dispatch_time(0, 20000000000);
    v18[0] = v15;
    v18[1] = 3221225472;
    v18[2] = __82__FBKDEDHelper_reconnectWithBugSessionWithIdentifier_deviceIdentifier_completion___block_invoke_3;
    v18[3] = &unk_24E1587F0;
    v22 = &buf;
    v19 = v8;
    v23 = a1;
    v20 = v9;
    v21 = v16;
    dispatch_after(v17, MEMORY[0x24BDAC9B8], v18);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_21D9A9000, v14, OS_LOG_TYPE_DEFAULT, "Does not have existing bug session [%{public}@]. Will start lightweight session", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(a1, "reconnectBugSessionWithIdentifier:deviceIdentifier:completion:", v8, v9, v10);
  }

}

void __82__FBKDEDHelper_reconnectWithBugSessionWithIdentifier_deviceIdentifier_completion___block_invoke(uint64_t a1)
{
  id v2;
  __int128 v3;
  _QWORD block[4];
  id v5;
  __int128 v6;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__FBKDEDHelper_reconnectWithBugSessionWithIdentifier_deviceIdentifier_completion___block_invoke_2;
  block[3] = &unk_24E1587A0;
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v6 = v3;
  v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __82__FBKDEDHelper_reconnectWithBugSessionWithIdentifier_deviceIdentifier_completion___block_invoke_2(_QWORD *a1)
{
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], 0, a1[4]);
}

uint64_t __82__FBKDEDHelper_reconnectWithBugSessionWithIdentifier_deviceIdentifier_completion___block_invoke_3(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
  {
    v1 = result;
    +[FBKLog ded](FBKLog, "ded");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(v1 + 32);
      v4 = 138543362;
      v5 = v3;
      _os_log_impl(&dword_21D9A9000, v2, OS_LOG_TYPE_DEFAULT, "Ping bug session [%{public}@] timed out. Will start lightweight session", (uint8_t *)&v4, 0xCu);
    }

    return objc_msgSend(*(id *)(v1 + 64), "reconnectBugSessionWithIdentifier:deviceIdentifier:completion:", *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48));
  }
  return result;
}

+ (void)getStateOnSession:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  dispatch_time_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[3];
  char v18;

  v5 = a3;
  v6 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v7 = MEMORY[0x24BDAC760];
  v18 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __49__FBKDEDHelper_getStateOnSession_withCompletion___block_invoke;
  v14[3] = &unk_24E158840;
  v16 = v17;
  v8 = v6;
  v15 = v8;
  objc_msgSend(v5, "getStateWithCompletion:", v14);
  v9 = dispatch_time(0, 10000000000);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __49__FBKDEDHelper_getStateOnSession_withCompletion___block_invoke_3;
  v11[3] = &unk_24E158868;
  v12 = v8;
  v13 = v17;
  v10 = v8;
  dispatch_after(v9, MEMORY[0x24BDAC9B8], v11);

  _Block_object_dispose(v17, 8);
}

void __49__FBKDEDHelper_getStateOnSession_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  _QWORD block[4];
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;

  v7 = a3;
  v8 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__FBKDEDHelper_getStateOnSession_withCompletion___block_invoke_2;
  block[3] = &unk_24E158818;
  v12 = *(_OWORD *)(a1 + 32);
  v9 = (id)v12;
  v16 = v12;
  v17 = a2;
  v14 = v7;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __49__FBKDEDHelper_getStateOnSession_withCompletion___block_invoke_2(_QWORD *a1)
{
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[8], a1[4], a1[5]);
}

void __49__FBKDEDHelper_getStateOnSession_withCompletion___block_invoke_3(uint64_t a1)
{
  id v2;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.fbk.ded"), 105, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

+ (void)cleanupBugSessionDirectoriesForForm:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _UNKNOWN **v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  _UNKNOWN **v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  _QWORD v34[6];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  objc_msgSend(MEMORY[0x24BE2CA50], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKDeviceManager sharedInstance](FBKDeviceManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuredDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ded_selectItemsPassingTest:", &__block_literal_global_22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v7, "count") >= 0xB)
  {
    objc_msgSend(v7, "subarrayWithRange:", 0, 10);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  v26 = v7;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v30)
  {
    v28 = *(_QWORD *)v41;
    v9 = &off_24E155000;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v41 != v28)
          objc_enumerationMutation(obj);
        v32 = v10;
        v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "bugSessionIDForForm:device:", v29, v11);
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v13);
        if (objc_msgSend(v11, "isCurrentDevice"))
        {
          objc_msgSend(a1, "adoptSessionIdWithExistingSessionId:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v14);

        }
        v31 = (void *)v13;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v33 = v12;
        v15 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v37 != v17)
                objc_enumerationMutation(v33);
              v19 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
              objc_msgSend(v9[379], "ded");
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v11, "publicLogDescription");
                v21 = v4;
                v22 = a1;
                v23 = v9;
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v45 = v19;
                v46 = 2114;
                v47 = v24;
                _os_log_impl(&dword_21D9A9000, v20, OS_LOG_TYPE_INFO, "will cleanup session [%{public}@] on device [%{public}@]", buf, 0x16u);

                v9 = v23;
                a1 = v22;
                v4 = v21;
              }

              v25 = (void *)objc_opt_new();
              objc_msgSend(v25, "setFinishingMove:", 0);
              v34[0] = MEMORY[0x24BDAC760];
              v34[1] = 3221225472;
              v34[2] = __52__FBKDEDHelper_cleanupBugSessionDirectoriesForForm___block_invoke_46;
              v34[3] = &unk_24E1588B0;
              v34[4] = v19;
              v34[5] = v11;
              v35 = v4;
              objc_msgSend(a1, "_getSessionWithIdentifier:configuration:device:getDetails:shouldGetSessionStatus:completion:", v19, v25, v11, 0, 0, v34);

            }
            v16 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
          }
          while (v16);
        }

        v10 = v32 + 1;
      }
      while (v32 + 1 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v30);
  }

}

uint64_t __52__FBKDEDHelper_cleanupBugSessionDirectoriesForForm___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isVisibleToDED");
}

void __52__FBKDEDHelper_cleanupBugSessionDirectoriesForForm___block_invoke_46(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[FBKLog ded](FBKLog, "ded");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __52__FBKDEDHelper_cleanupBugSessionDirectoriesForForm___block_invoke_46_cold_1(a1);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "publicLogDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_21D9A9000, v7, OS_LOG_TYPE_INFO, "will abort session [%{public}@] on device [%{public}@]", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 48), "abortSession:", v5);
  }

}

+ (id)bugSessionIDForForm:(id)a3 device:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;

  v5 = a4;
  v6 = a3;
  v7 = submissionTypeForForm(v6);
  objc_msgSend(v6, "filerFormID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[FBKDEDHelper bugSessionIDForForm:device:].cold.1();

    v8 = &unk_24E18CAE8;
  }
  if (+[FBKSSharedConstants environment](FBKSharedConstants, "environment"))
  {
    +[FBKSSharedConstants environment](FBKSharedConstants, "environment");
    FBKSStringFromEnvironment();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "substringToIndex:", 1);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = &stru_24E15EAF8;
  }
  v12 = CFSTR("fr");
  if (v7 == 2)
    v12 = CFSTR("ffu");
  v13 = (void *)MEMORY[0x24BDD17C8];
  v14 = v12;
  objc_msgSend(v5, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@-%@-%@%@-%@"), CFSTR("fba"), v14, v11, v8, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (void)getSessionForForm:(id)a3 device:(id)a4 shouldGetSessionStatus:(BOOL)a5 completion:(id)a6
{
  objc_msgSend(a1, "_getSessionForForm:device:isAdoptingSession:shouldGetSessionStatus:completion:", a3, a4, 0, a5, a6);
}

+ (void)sendLocalFilesToDED:(id)a3 withForm:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  +[FBKGroupedDevice currentGroupedDevice](FBKGroupedDevice, "currentGroupedDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __60__FBKDEDHelper_sendLocalFilesToDED_withForm_withCompletion___block_invoke;
  v14[3] = &unk_24E1588D8;
  v15 = v8;
  v16 = v9;
  v12 = v8;
  v13 = v9;
  objc_msgSend(a1, "_getSessionForForm:device:isAdoptingSession:shouldGetSessionStatus:completion:", v10, v11, 1, 0, v14);

}

void __60__FBKDEDHelper_sendLocalFilesToDED_withForm_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 || !v6)
  {
    +[FBKLog ded](FBKLog, "ded");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __60__FBKDEDHelper_sendLocalFilesToDED_withForm_withCompletion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __60__FBKDEDHelper_sendLocalFilesToDED_withForm_withCompletion___block_invoke_58;
    v10[3] = &unk_24E157228;
    v8 = *(_QWORD *)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    v11 = v7;
    objc_msgSend(v11, "adoptFiles:withCompletion:", v8, v10);

  }
}

void __60__FBKDEDHelper_sendLocalFilesToDED_withForm_withCompletion___block_invoke_58(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void (*v5)(void);

  v3 = a2;
  if (v3)
  {
    +[FBKLog ded](FBKLog, "ded");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60__FBKDEDHelper_sendLocalFilesToDED_withForm_withCompletion___block_invoke_58_cold_1();

    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "commit");
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v5();

}

+ (void)_getSessionForForm:(id)a3 device:(id)a4 isAdoptingSession:(BOOL)a5 shouldGetSessionStatus:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  BOOL v32;
  BOOL v33;
  uint8_t buf[4];
  int v35;
  uint64_t v36;

  v9 = a5;
  v36 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  +[FBKLog ded](FBKLog, "ded");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v12, "filerFormID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109120;
    v35 = objc_msgSend(v16, "intValue");
    _os_log_impl(&dword_21D9A9000, v15, OS_LOG_TYPE_INFO, "will get session for filer form [%i]", buf, 8u);

  }
  objc_msgSend(v12, "filerFormID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "integerValue");

  objc_msgSend(a1, "bugSessionIDForForm:device:", v12, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(a1, "adoptSessionIdWithExistingSessionId:", v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v20;
  }
  v21 = !v9;
  v22 = submissionTypeForForm(v12);
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __94__FBKDEDHelper__getSessionForForm_device_isAdoptingSession_shouldGetSessionStatus_completion___block_invoke;
  v26[3] = &unk_24E158900;
  v29 = v14;
  v30 = v18;
  v31 = a1;
  v27 = v19;
  v28 = v13;
  v32 = v21;
  v33 = a6;
  v23 = v13;
  v24 = v19;
  v25 = v14;
  objc_msgSend(a1, "_getBugSessionConfigWithSubmissionType:formId:device:completion:", v22, v18, v23, v26);

}

void __94__FBKDEDHelper__getSessionForForm_device_isAdoptingSession_shouldGetSessionStatus_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    +[FBKLog ded](FBKLog, "ded");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 56);
      v8 = 134217984;
      v9 = v7;
      _os_log_impl(&dword_21D9A9000, v6, OS_LOG_TYPE_INFO, "did get configuration for filer form [%li]", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 64), "_getSessionWithIdentifier:configuration:device:getDetails:shouldGetSessionStatus:completion:", *(_QWORD *)(a1 + 32), v5, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72), *(unsigned __int8 *)(a1 + 73), *(_QWORD *)(a1 + 48));
  }

}

+ (void)_getBugSessionConfigWithSubmissionType:(int64_t)a3 formId:(int64_t)a4 device:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  int64_t v22;
  int64_t v23;
  id v24;
  uint8_t buf[4];
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  +[FBKLog ded](FBKLog, "ded");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v26 = a4;
    _os_log_impl(&dword_21D9A9000, v12, OS_LOG_TYPE_INFO, "will get device token for filer form [%li]", buf, 0xCu);
  }

  objc_msgSend(a1, "_seedPortal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __80__FBKDEDHelper__getBugSessionConfigWithSubmissionType_formId_device_completion___block_invoke;
  v19[3] = &unk_24E158928;
  v23 = a3;
  v24 = a1;
  v22 = a4;
  v20 = v10;
  v21 = v11;
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __80__FBKDEDHelper__getBugSessionConfigWithSubmissionType_formId_device_completion___block_invoke_72;
  v17[3] = &unk_24E157188;
  v18 = v21;
  v15 = v21;
  v16 = v10;
  objc_msgSend(v13, "getRemoteDeviceTokenWithSuccess:error:", v19, v17);

}

void __80__FBKDEDHelper__getBugSessionConfigWithSubmissionType_formId_device_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;

  v3 = a2;
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setFinishingMove:", 1);
    objc_msgSend(v4, "setSeedingDeviceToken:", v3);
    objc_msgSend(v4, "setSeedingEnvironment:", +[FBKSSharedConstants environment](FBKSharedConstants, "environment") + 1);
    objc_msgSend(v4, "setSeedingSubmissionID:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v4, "setSeedingSubmissionType:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 64), "_seedingHost");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSeedingHost:", v5);

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAllowsCellularUpload:", objc_msgSend(v6, "BOOLForKey:", CFSTR("allowCellUploads")));

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 4);
    v8 = *(void **)(a1 + 32);
    v9 = *MEMORY[0x24BE2C9B8];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BE2C9B8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v8, "hasCapabilities:", v10);

    if ((_DWORD)v8)
      objc_msgSend(v7, "addObject:", v9);
    if (+[FBKSharedConstants isEnhancedLoggingEnabled](FBKSharedConstants, "isEnhancedLoggingEnabled"))
    {
      v11 = *(void **)(a1 + 32);
      v12 = *MEMORY[0x24BE2C9B0];
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BE2C9B0]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = objc_msgSend(v11, "hasCapabilities:", v13);

      if ((_DWORD)v11)
      {
        objc_msgSend(v7, "addObject:", v12);
        objc_msgSend(v4, "setNotifyingMove:", 1);
        v14 = objc_alloc(MEMORY[0x24BE2CA58]);
        objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ENHANCED_LOGGING_COMPLETE_NOTIF_TITLE"), CFSTR("Enhanced Logging Complete"), 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ENHANCED_LOGGING_COMPLETE_NOTIF_BODY"), CFSTR("Review the collected logs before sending them to Apple."), 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v14, "initWithHostAppIdentifier:localizedNotificationTitle:localizedNotificationBody:", CFSTR("com.apple.appleseed.FeedbackAssistant"), v16, v18);

        objc_msgSend(v19, "setUserNotificationShouldPlaySound:", 1);
        objc_msgSend(v4, "setNotifierConfiguration:", v19);

      }
      v20 = *(void **)(a1 + 32);
      v21 = *MEMORY[0x24BE2C9A8];
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BE2C9A8]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v20) = objc_msgSend(v20, "hasCapabilities:", v22);

      if ((_DWORD)v20)
        objc_msgSend(v7, "addObject:", v21);
    }
    objc_msgSend(v4, "requestCapabilitiesSet:", v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    +[FBKLog ded](FBKLog, "ded");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __80__FBKDEDHelper__getBugSessionConfigWithSubmissionType_formId_device_completion___block_invoke_cold_1();

  }
}

void __80__FBKDEDHelper__getBugSessionConfigWithSubmissionType_formId_device_completion___block_invoke_72(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[FBKLog ded](FBKLog, "ded");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __80__FBKDEDHelper__getBugSessionConfigWithSubmissionType_formId_device_completion___block_invoke_72_cold_1(v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)didFailToPinPairOnDemandWithDevice:(id)a3 error:(int64_t)a4 identifier:(id)a5 observer:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = (void *)MEMORY[0x24BDD16D0];
  v14 = a7;
  v15 = a6;
  objc_msgSend(v13, "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObserver:", v15);

  v17 = (void *)onDemandObserver;
  onDemandObserver = 0;

  +[FBKLog ded](FBKLog, "ded");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138543618;
    v21 = v11;
    v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_21D9A9000, v18, OS_LOG_TYPE_DEFAULT, "On demand pairing failed for device [%{public}@] for session [%{public}@]", (uint8_t *)&v20, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.fbk.ded"), a4, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD, _QWORD, _QWORD, _QWORD))v14 + 2))(v14, v19, 0, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], 0);

}

+ (void)_startSessionByFirstPairingWithConfig:(id)a3 device:(id)a4 grouped:(id)a5 identifier:(id)a6 shouldGetDetails:(BOOL)a7 shouldGetSessionStatus:(BOOL)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  NSObject *v28;
  id v29;
  dispatch_time_t v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD block[4];
  id v40;
  _QWORD aBlock[4];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  BOOL v47;
  BOOL v48;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a9;
  v19 = (void *)MEMORY[0x24BDD16D0];
  v20 = a5;
  objc_msgSend(v19, "defaultCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "postNotificationName:object:", CFSTR("FBKDEDHelperNeedsDevicePairing"), v20);

  v22 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __131__FBKDEDHelper__startSessionByFirstPairingWithConfig_device_grouped_identifier_shouldGetDetails_shouldGetSessionStatus_completion___block_invoke;
  aBlock[3] = &unk_24E158950;
  v46 = a1;
  v23 = v16;
  v42 = v23;
  v24 = v17;
  v43 = v24;
  v25 = v18;
  v44 = v15;
  v45 = v25;
  v47 = a7;
  v48 = a8;
  v26 = v15;
  v27 = _Block_copy(aBlock);
  dispatch_get_global_queue(33, 0);
  v28 = objc_claimAutoreleasedReturnValue();
  block[0] = v22;
  block[1] = 3221225472;
  block[2] = __131__FBKDEDHelper__startSessionByFirstPairingWithConfig_device_grouped_identifier_shouldGetDetails_shouldGetSessionStatus_completion___block_invoke_75;
  block[3] = &unk_24E156F80;
  v40 = v27;
  v29 = v27;
  dispatch_sync(v28, block);

  v30 = dispatch_time(0, 60000000000);
  v34[0] = v22;
  v34[1] = 3221225472;
  v34[2] = __131__FBKDEDHelper__startSessionByFirstPairingWithConfig_device_grouped_identifier_shouldGetDetails_shouldGetSessionStatus_completion___block_invoke_2;
  v34[3] = &unk_24E158978;
  v35 = v23;
  v36 = v24;
  v37 = v25;
  v38 = a1;
  v31 = v25;
  v32 = v24;
  v33 = v23;
  dispatch_after(v30, MEMORY[0x24BDAC9B8], v34);

}

void __131__FBKDEDHelper__startSessionByFirstPairingWithConfig_device_grouped_identifier_shouldGetDetails_shouldGetSessionStatus_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[FBKLog ded](FBKLog, "ded");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v3;
      _os_log_impl(&dword_21D9A9000, v4, OS_LOG_TYPE_DEFAULT, "did get paired device [%{public}@]", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(v3, "dedSharingDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKLog ded](FBKLog, "ded");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_21D9A9000, v7, OS_LOG_TYPE_DEFAULT, "device is ready!", (uint8_t *)&v11, 2u);
      }

      objc_msgSend(*(id *)(a1 + 64), "_getSessionWithIdentifier:configuration:dedDevice:getDetails:shouldGetSessionStatus:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5, *(unsigned __int8 *)(a1 + 72), *(unsigned __int8 *)(a1 + 73), *(_QWORD *)(a1 + 56));
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObserver:", onDemandObserver);

      v9 = (void *)onDemandObserver;
      onDemandObserver = 0;

    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __131__FBKDEDHelper__startSessionByFirstPairingWithConfig_device_grouped_identifier_shouldGetDetails_shouldGetSessionStatus_completion___block_invoke_cold_1(a1, v7, v10);

      objc_msgSend(*(id *)(a1 + 64), "didFailToPinPairOnDemandWithDevice:error:identifier:observer:completion:", *(_QWORD *)(a1 + 32), 107, *(_QWORD *)(a1 + 40), onDemandObserver, *(_QWORD *)(a1 + 56));
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 64), "didFailToPinPairOnDemandWithDevice:error:identifier:observer:completion:", *(_QWORD *)(a1 + 32), 108, *(_QWORD *)(a1 + 40), onDemandObserver, *(_QWORD *)(a1 + 56));
  }

}

void __131__FBKDEDHelper__startSessionByFirstPairingWithConfig_device_grouped_identifier_shouldGetDetails_shouldGetSessionStatus_completion___block_invoke_75(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", CFSTR("FBKDEDHelperHereIsYourPairedDevice"), 0, v2, *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)onDemandObserver;
  onDemandObserver = v3;

}

uint64_t __131__FBKDEDHelper__startSessionByFirstPairingWithConfig_device_grouped_identifier_shouldGetDetails_shouldGetSessionStatus_completion___block_invoke_2(uint64_t result)
{
  if (onDemandObserver)
    return objc_msgSend(*(id *)(result + 56), "didFailToPinPairOnDemandWithDevice:error:identifier:observer:completion:", *(_QWORD *)(result + 32), 109, *(_QWORD *)(result + 40), onDemandObserver, *(_QWORD *)(result + 48));
  return result;
}

+ (void)_getSessionWithIdentifier:(id)a3 configuration:(id)a4 device:(id)a5 getDetails:(BOOL)a6 shouldGetSessionStatus:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[8];
  _QWORD aBlock[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40[2];
  BOOL v41;
  BOOL v42;
  id location[2];

  v9 = a7;
  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  objc_initWeak(location, a1);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__FBKDEDHelper__getSessionWithIdentifier_configuration_device_getDetails_shouldGetSessionStatus_completion___block_invoke;
  aBlock[3] = &unk_24E1589A0;
  objc_copyWeak(v40, location);
  v18 = v14;
  v36 = v18;
  v19 = v15;
  v37 = v19;
  v41 = v10;
  v42 = v9;
  v20 = v17;
  v39 = v20;
  v40[1] = a1;
  v21 = v16;
  v38 = v21;
  v22 = _Block_copy(aBlock);
  if (objc_msgSend(v21, "isCurrentDevice"))
  {
    +[FBKLog ded](FBKLog, "ded");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v23, OS_LOG_TYPE_DEFAULT, "starting bug session on current device", buf, 2u);
    }

    objc_msgSend(v21, "anyDEDDevice");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_getSessionWithIdentifier:configuration:dedDevice:getDetails:shouldGetSessionStatus:completion:", v18, v19, v24, v10, v9, v20);
  }
  else
  {
    +[FBKLog ded](FBKLog, "ded");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v25, OS_LOG_TYPE_DEFAULT, "starting bug session on remote device", buf, 2u);
    }

    objc_msgSend(v21, "dedIDSDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v26;
    if (v26 && objc_msgSend(v26, "status") == 1)
    {
      +[FBKLog ded](FBKLog, "ded");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21D9A9000, v27, OS_LOG_TYPE_DEFAULT, "will use IDS", buf, 2u);
      }

      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __108__FBKDEDHelper__getSessionWithIdentifier_configuration_device_getDetails_shouldGetSessionStatus_completion___block_invoke_78;
      v29[3] = &unk_24E1589C8;
      v32 = v20;
      v30 = v19;
      v33 = v22;
      v31 = v21;
      objc_msgSend(a1, "_getSessionWithIdentifier:configuration:dedDevice:getDetails:shouldGetSessionStatus:completion:", v18, v30, v24, v10, v9, v29);

      v28 = v32;
    }
    else
    {
      objc_msgSend(v21, "dedSharingDevice");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, void *))v22 + 2))(v22, v28);
    }

  }
  objc_destroyWeak(v40);
  objc_destroyWeak(location);

}

void __108__FBKDEDHelper__getSessionWithIdentifier_configuration_device_getDetails_shouldGetSessionStatus_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  id WeakRetained;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[FBKLog ded](FBKLog, "ded");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v3;
    _os_log_impl(&dword_21D9A9000, v4, OS_LOG_TYPE_DEFAULT, "no IDS device found for grouped device. Will try Sharing [%{public}@]", buf, 0xCu);
  }

  if (!v3)
  {
    +[FBKLog ded](FBKLog, "ded");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __108__FBKDEDHelper__getSessionWithIdentifier_configuration_device_getDetails_shouldGetSessionStatus_completion___block_invoke_cold_1(a1, v8, v9);

    v10 = *(_QWORD *)(a1 + 56);
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = 110;
    goto LABEL_18;
  }
  v5 = objc_msgSend(v3, "status");
  if (v5 != 2)
  {
    if (v5 == 1)
    {
      +[FBKLog ded](FBKLog, "ded");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21D9A9000, v6, OS_LOG_TYPE_DEFAULT, "will use Sharing", buf, 2u);
      }

      WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(WeakRetained, "_getSessionWithIdentifier:configuration:dedDevice:getDetails:shouldGetSessionStatus:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v3, *(unsigned __int8 *)(a1 + 80), *(unsigned __int8 *)(a1 + 81), *(_QWORD *)(a1 + 56));

      goto LABEL_19;
    }
    +[FBKLog ded](FBKLog, "ded");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v14, OS_LOG_TYPE_DEFAULT, "Sharing device is not ready", buf, 2u);
    }

    v10 = *(_QWORD *)(a1 + 56);
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = 106;
LABEL_18:
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.fbk.ded"), v12, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "requestedCapabilities");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD, _QWORD, void *))(v10 + 16))(v10, v15, 0, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], v16);

    goto LABEL_19;
  }
  +[FBKLog ded](FBKLog, "ded");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v3;
    _os_log_impl(&dword_21D9A9000, v13, OS_LOG_TYPE_DEFAULT, "Sharing device needs pairing [%{public}@]", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 72), "_startSessionByFirstPairingWithConfig:device:grouped:identifier:shouldGetDetails:shouldGetSessionStatus:completion:", *(_QWORD *)(a1 + 40), v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 80), *(unsigned __int8 *)(a1 + 81), *(_QWORD *)(a1 + 56));
LABEL_19:

}

void __108__FBKDEDHelper__getSessionWithIdentifier_configuration_device_getDetails_shouldGetSessionStatus_completion___block_invoke_78(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (a2)
  {
    +[FBKLog ded](FBKLog, "ded");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __108__FBKDEDHelper__getSessionWithIdentifier_configuration_device_getDetails_shouldGetSessionStatus_completion___block_invoke_78_cold_1();

    v13 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "dedSharingDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
  }
  else
  {
    v15 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "requestedCapabilities");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id, id, id, void *))(v15 + 16))(v15, 0, v9, v10, v11, v14);
  }

}

+ (void)_getSessionWithIdentifier:(id)a3 configuration:(id)a4 dedDevice:(id)a5 getDetails:(BOOL)a6 shouldGetSessionStatus:(BOOL)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  double v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  double v42;
  BOOL v43;
  BOOL v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[5];
  id v48;
  _QWORD v49[5];
  id v50;
  _QWORD v51[3];
  char v52;
  _QWORD v53[3];
  char v54;
  _QWORD v55[3];
  BOOL v56;
  _QWORD v57[3];
  BOOL v58;
  _QWORD v59[3];
  char v60;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a8;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  v60 = 0;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x2020000000;
  v58 = !a6;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  v56 = !a6;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  v54 = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  v52 = 0;
  +[FBKTimeIntervals sharedInstance](FBKTimeIntervals, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "willStartEvent:context:", 3, v13);
  objc_msgSend(v17, "willStartEvent:context:", 6, v13);
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__1;
  v49[4] = __Block_byref_object_dispose__1;
  v50 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__1;
  v47[4] = __Block_byref_object_dispose__1;
  v48 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__1;
  v45[4] = __Block_byref_object_dispose__1;
  v46 = 0;
  v18 = FBKBugSessionTimeoutForDevice(v15);
  v19 = FBKBugSessionTimeoutForDevice(v15);
  +[FBKLog ded](FBKLog, "ded");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v19 + 10.0;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    +[FBKDEDHelper _getSessionWithIdentifier:configuration:dedDevice:getDetails:shouldGetSessionStatus:completion:].cold.1(v20, v18, v21);

  objc_msgSend(v14, "setBugSessionStartTimeout:", v18);
  v22 = _os_activity_create(&dword_21D9A9000, "BugSession Start", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke;
  block[3] = &unk_24E158A90;
  v29 = v13;
  v30 = v14;
  v31 = v15;
  v32 = v17;
  v35 = v51;
  v36 = v59;
  v33 = v16;
  v34 = v49;
  v37 = v53;
  v38 = v47;
  v43 = a6;
  v39 = v45;
  v40 = v57;
  v44 = a7;
  v41 = v55;
  v42 = v21;
  v23 = v16;
  v24 = v17;
  v25 = v15;
  v26 = v14;
  v27 = v13;
  os_activity_apply(v22, block);

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(v47, 8);

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v51, 8);
  _Block_object_dispose(v53, 8);
  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v57, 8);
  _Block_object_dispose(v59, 8);
}

void __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  dispatch_time_t v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  int8x16_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int16 v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int16 v33;

  objc_msgSend(MEMORY[0x24BE2CA50], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_2;
  v22[3] = &unk_24E158A40;
  v28 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 48);
  v23 = *(id *)(a1 + 56);
  v24 = *(id *)(a1 + 32);
  v29 = *(_OWORD *)(a1 + 80);
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 96);
  v25 = v7;
  v30 = v8;
  v27 = *(id *)(a1 + 64);
  v26 = *(id *)(a1 + 48);
  v31 = *(_OWORD *)(a1 + 104);
  v33 = *(_WORD *)(a1 + 144);
  v32 = *(_OWORD *)(a1 + 120);
  objc_msgSend(v2, "startBugSessionWithIdentifier:configuration:target:completion:", v3, v4, v6, v22);
  v9 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 136) * 1000000000.0));
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_88;
  v12[3] = &unk_24E158A68;
  v16 = vextq_s8(*(int8x16_t *)(a1 + 88), *(int8x16_t *)(a1 + 88), 8uLL);
  v21 = *(_WORD *)(a1 + 144);
  v17 = *(_OWORD *)(a1 + 120);
  v18 = *(_QWORD *)(a1 + 80);
  v15 = *(id *)(a1 + 64);
  v13 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 72);
  v14 = v10;
  v19 = v11;
  v20 = *(_OWORD *)(a1 + 104);
  dispatch_after(v9, MEMORY[0x24BDAC9B8], v12);

}

void __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  uint8_t buf[4];
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "didEndEvent:context:", 3, *(_QWORD *)(a1 + 40));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
    +[FBKLog ded](FBKLog, "ded");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_2_cold_1(a1);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
      v12 = (id)objc_msgSend(*(id *)(a1 + 32), "didEndEvent:context:", 6, *(_QWORD *)(a1 + 40));
      v13 = *(_QWORD *)(a1 + 64);
      objc_msgSend(*(id *)(a1 + 48), "requestedCapabilities");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, _QWORD, _QWORD, _QWORD, void *))(v13 + 16))(v13, v6, 0, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], v14);

      v15 = (void *)MEMORY[0x24BE2CA48];
      objc_msgSend(*(id *)(a1 + 56), "productType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(*(id *)(a1 + 56), "isRemote");
      v18 = objc_msgSend(v6, "code");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "startTimeInterval");
      v20 = v19;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "endTimeInterval");
      v22 = v21;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "endTimeInterval");
      v24 = v23;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "endTimeInterval");
      v26 = v25;
      v27 = v15;
      v28 = v16;
      v29 = v17;
      v30 = 0;
      v31 = v18;
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v32 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v68 = v32;
        _os_log_impl(&dword_21D9A9000, v11, OS_LOG_TYPE_INFO, "did start bug session with identifier [%{public}@]", buf, 0xCu);
      }

      v33 = *(void **)(a1 + 32);
      v34 = *(_QWORD *)(a1 + 40);
      if (*(_BYTE *)(a1 + 136))
      {
        objc_msgSend(v33, "willStartEvent:context:", 4, v34);
        +[FBKLog ded](FBKLog, "ded");
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "identifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v68 = v36;
          _os_log_impl(&dword_21D9A9000, v35, OS_LOG_TYPE_DEFAULT, "will get details on bug session %{public}@", buf, 0xCu);

        }
        v53[0] = MEMORY[0x24BDAC760];
        v53[1] = 3221225472;
        v53[2] = __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_81;
        v53[3] = &unk_24E158A18;
        v60 = *(_QWORD *)(a1 + 104);
        v54 = *(id *)(a1 + 32);
        v37 = *(id *)(a1 + 40);
        v38 = *(_QWORD *)(a1 + 120);
        v55 = v37;
        v39 = *(_QWORD *)(a1 + 80);
        v61 = v38;
        v62 = v39;
        v66 = *(_BYTE *)(a1 + 137);
        v59 = *(id *)(a1 + 64);
        v56 = v5;
        v57 = *(id *)(a1 + 48);
        v40 = *(id *)(a1 + 56);
        v41 = *(_QWORD *)(a1 + 72);
        v58 = v40;
        v42 = *(_QWORD *)(a1 + 112);
        v43 = *(_QWORD *)(a1 + 128);
        v63 = v41;
        v64 = v42;
        v65 = v43;
        objc_msgSend(v56, "listDiagnosticExtensionsWithCompletion:", v53);

        v16 = v54;
        goto LABEL_13;
      }
      v44 = (id)objc_msgSend(v33, "didEndEvent:context:", 6, v34);
      v45 = *(_QWORD *)(a1 + 64);
      objc_msgSend(*(id *)(a1 + 48), "requestedCapabilities");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id, _QWORD, _QWORD, void *))(v45 + 16))(v45, 0, v5, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], v46);

      v47 = (void *)MEMORY[0x24BE2CA48];
      objc_msgSend(*(id *)(a1 + 56), "productType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(*(id *)(a1 + 56), "isRemote");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "startTimeInterval");
      v20 = v49;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "endTimeInterval");
      v22 = v50;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "endTimeInterval");
      v24 = v51;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "endTimeInterval");
      v26 = v52;
      v27 = v47;
      v28 = v16;
      v29 = v48;
      v30 = 1;
      v31 = 0;
    }
    objc_msgSend(v27, "logFBKBugSessionStartWithDeviceType:isRemote:success:errorCode:startedAt:getSessionEndedAt:showExtensionsEndedAt:getStatusEndedAt:", v28, v29, v30, v31, v20, v22, v24, v26);
LABEL_13:

  }
}

void __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_81(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t buf[4];
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "didEndEvent:context:", 4, *(_QWORD *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
  {
    +[FBKLog ded](FBKLog, "ded");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v44 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_21D9A9000, v7, OS_LOG_TYPE_INFO, "found %lu DEs", buf, 0xCu);
    }

    +[FBKLog ded](FBKLog, "ded");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_81_cold_1(v3, v8);

    if (*(_BYTE *)(a1 + 128))
    {
      objc_msgSend(*(id *)(a1 + 32), "willStartEvent:context:", 5, *(_QWORD *)(a1 + 40));
      v9 = *(void **)(a1 + 48);
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_84;
      v31[3] = &unk_24E1589F0;
      v38 = *(_QWORD *)(a1 + 112);
      v32 = *(id *)(a1 + 32);
      v10 = *(id *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 120);
      v33 = v10;
      v12 = *(_QWORD *)(a1 + 96);
      v39 = v11;
      v40 = v12;
      v37 = *(id *)(a1 + 72);
      v34 = *(id *)(a1 + 48);
      v35 = *(id *)(a1 + 56);
      v13 = *(id *)(a1 + 64);
      v14 = *(_QWORD *)(a1 + 104);
      v36 = v13;
      v15 = *(_QWORD *)(a1 + 80);
      v41 = v14;
      v42 = v15;
      objc_msgSend(v9, "getSessionStatusWithCompletion:", v31);

      v16 = v32;
    }
    else
    {
      +[FBKLog ded](FBKLog, "ded");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v44 = v18;
        _os_log_impl(&dword_21D9A9000, v17, OS_LOG_TYPE_INFO, "Not getting bug session status for session [%{public}@]", buf, 0xCu);
      }

      v19 = *(_QWORD *)(a1 + 72);
      v20 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "requestedCapabilities");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD, _QWORD, void *))(v19 + 16))(v19, 0, v20, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], v21);

      v22 = (void *)MEMORY[0x24BE2CA48];
      objc_msgSend(*(id *)(a1 + 64), "productType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(*(id *)(a1 + 64), "isRemote");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "startTimeInterval");
      v25 = v24;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "endTimeInterval");
      v27 = v26;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "endTimeInterval");
      v29 = v28;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "endTimeInterval");
      objc_msgSend(v22, "logFBKBugSessionStartWithDeviceType:isRemote:success:errorCode:startedAt:getSessionEndedAt:showExtensionsEndedAt:getStatusEndedAt:", v16, v23, 1, 0, v25, v27, v29, v30);
    }

  }
}

void __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "didEndEvent:context:", 5, *(_QWORD *)(a1 + 40));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
  {
    +[FBKLog ded](FBKLog, "ded");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_84_cold_2();

    +[FBKLog ded](FBKLog, "ded");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_84_cold_1();

    +[FBKLog ded](FBKLog, "ded");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 134218240;
      v28 = objc_msgSend(v6, "count");
      v29 = 2048;
      v30 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_21D9A9000, v12, OS_LOG_TYPE_DEFAULT, "bug session start: found %lu operations, %lu collected files", (uint8_t *)&v27, 0x16u);
    }

    v13 = (id)objc_msgSend(*(id *)(a1 + 32), "didEndEvent:context:", 6, *(_QWORD *)(a1 + 40));
    v14 = *(_QWORD *)(a1 + 72);
    v15 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "requestedCapabilities");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, uint64_t, id, id, void *))(v14 + 16))(v14, 0, v15, v5, v6, v16);

    v17 = (void *)MEMORY[0x24BE2CA48];
    objc_msgSend(*(id *)(a1 + 64), "productType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(*(id *)(a1 + 64), "isRemote");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "startTimeInterval");
    v21 = v20;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "endTimeInterval");
    v23 = v22;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "endTimeInterval");
    v25 = v24;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "endTimeInterval");
    objc_msgSend(v17, "logFBKBugSessionStartWithDeviceType:isRemote:success:errorCode:startedAt:getSessionEndedAt:showExtensionsEndedAt:getStatusEndedAt:", v18, v19, 1, 0, v21, v23, v25, v26);

  }
}

void __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_88(uint64_t a1)
{
  char v2;
  int v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    return;
  v2 = *(_BYTE *)(a1 + 120);
  if (v2)
  {
    v2 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) == 0;
    v3 = *(unsigned __int8 *)(a1 + 121);
    if (*(_BYTE *)(a1 + 121))
      v3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) == 0;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      goto LABEL_10;
LABEL_8:
    if ((v2 & 1) == 0 && !v3)
      return;
    goto LABEL_10;
  }
  v3 = 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    goto LABEL_8;
LABEL_10:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
  +[FBKLog ded](FBKLog, "ded");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_88_cold_1();

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.fbk.ded"), 105, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "requestedCapabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD, _QWORD, _QWORD, void *))(v6 + 16))(v6, v5, 0, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], v7);

  v8 = (void *)MEMORY[0x24BE2CA48];
  objc_msgSend(*(id *)(a1 + 40), "productType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(*(id *)(a1 + 40), "isRemote");
  v11 = objc_msgSend(v5, "code");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "startTimeInterval");
  v13 = v12;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "endTimeInterval");
  v15 = v14;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "endTimeInterval");
  v17 = v16;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "endTimeInterval");
  objc_msgSend(v8, "logFBKBugSessionStartWithDeviceType:isRemote:success:errorCode:startedAt:getSessionEndedAt:showExtensionsEndedAt:getStatusEndedAt:", v9, v10, 0, v11, v13, v15, v17, v18);

}

+ (void)reconnectBugSessionWithIdentifier:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[FBKDeviceManager sharedInstance](FBKDeviceManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "availableDevices");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __78__FBKDEDHelper_reconnectBugSessionWithIdentifier_deviceIdentifier_completion___block_invoke;
  v26[3] = &unk_24E156BD0;
  v14 = v9;
  v27 = v14;
  objc_msgSend(v12, "ded_findWithBlock:", v26);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[FBKLog ded](FBKLog, "ded");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v15, "publicLogDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v8;
      v30 = 2114;
      v31 = v18;
      _os_log_impl(&dword_21D9A9000, v17, OS_LOG_TYPE_INFO, "will reconnect to session [%{public}@] on device [%{public}@]", buf, 0x16u);

    }
    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "setFinishingMove:", 0);
    v20 = *MEMORY[0x24BE2C9B8];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BE2C9B8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v15, "hasCapabilities:", v21);

    if (v22)
      objc_msgSend(v19, "requestCapabilities:", v20, 0);
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __78__FBKDEDHelper_reconnectBugSessionWithIdentifier_deviceIdentifier_completion___block_invoke_90;
    v23[3] = &unk_24E158AB8;
    v24 = v8;
    v25 = v10;
    objc_msgSend(a1, "_getSessionWithIdentifier:configuration:device:getDetails:shouldGetSessionStatus:completion:", v24, v19, v15, 0, 0, v23);

  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v8;
      _os_log_impl(&dword_21D9A9000, v17, OS_LOG_TYPE_DEFAULT, "Could not find device for session [%{public}@]. Will not reconnect", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.fbk.ded"), 101, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, v19, 0);
  }

}

uint64_t __78__FBKDEDHelper_reconnectBugSessionWithIdentifier_deviceIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __78__FBKDEDHelper_reconnectBugSessionWithIdentifier_deviceIdentifier_completion___block_invoke_90(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[FBKLog ded](FBKLog, "ded");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_DEFAULT, "Could not reconnect to session [%{public}@]", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_INFO, "Reconnected [%{public}@]", (uint8_t *)&v11, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (void)fetchTextDataOnMatcherPredicates:(id)a3 fromSession:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD);
  dispatch_time_t v17;
  uint64_t v18;
  dispatch_time_t v19;
  NSObject *v20;
  _QWORD block[4];
  void (**v22)(_QWORD);
  _QWORD *v23;
  _QWORD *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[3];
  char v33;
  _QWORD v34[3];
  char v35;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  objc_msgSend(v8, "knownExtensions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    v35 = 0;
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v33 = 0;
    v12 = MEMORY[0x24BDAC760];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __72__FBKDEDHelper_fetchTextDataOnMatcherPredicates_fromSession_completion___block_invoke;
    v30[3] = &unk_24E158AE0;
    v31 = v10;
    objc_msgSend(v7, "ded_flatMapWithBlock:", v30);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = v12;
    v25[1] = 3221225472;
    v25[2] = __72__FBKDEDHelper_fetchTextDataOnMatcherPredicates_fromSession_completion___block_invoke_2;
    v25[3] = &unk_24E158B30;
    v28 = v32;
    v29 = v34;
    v26 = v7;
    v16 = v9;
    v27 = v16;
    objc_msgSend(v8, "loadTextDataForExtensions:localization:completion:", v13, v15, v25);
    v17 = dispatch_time(0, 15000000000);
    v18 = v12;
    v19 = v17;
    block[0] = v18;
    block[1] = 3221225472;
    block[2] = __72__FBKDEDHelper_fetchTextDataOnMatcherPredicates_fromSession_completion___block_invoke_4;
    block[3] = &unk_24E158B58;
    v23 = v34;
    v24 = v32;
    v22 = v16;
    dispatch_after(v19, MEMORY[0x24BDAC9B8], block);

    _Block_object_dispose(v32, 8);
    _Block_object_dispose(v34, 8);
  }
  else
  {
    +[FBKLog ded](FBKLog, "ded");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      +[FBKDEDHelper fetchTextDataOnMatcherPredicates:fromSession:completion:].cold.1();

    v9[2](v9);
  }

}

id __72__FBKDEDHelper_fetchTextDataOnMatcherPredicates_fromSession_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "deBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __72__FBKDEDHelper_fetchTextDataOnMatcherPredicates_fromSession_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    obj = *(id *)(a1 + 32);
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v15[0] = MEMORY[0x24BDAC760];
          v15[1] = 3221225472;
          v15[2] = __72__FBKDEDHelper_fetchTextDataOnMatcherPredicates_fromSession_completion___block_invoke_3;
          v15[3] = &unk_24E158B08;
          v15[4] = v8;
          objc_msgSend(v3, "ded_findWithBlock:", v15);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "localizedDataCollectedSummary");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "fileMatcher");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setLocalizedDataCollectedSummary:", v10);

          objc_msgSend(v9, "localizedDataCollectedExplanation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "fileMatcher");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setLocalizedDataCollectedExplanation:", v12);

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v5);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __72__FBKDEDHelper_fetchTextDataOnMatcherPredicates_fromSession_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "deBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __72__FBKDEDHelper_fetchTextDataOnMatcherPredicates_fromSession_completion___block_invoke_4(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v1 = result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) = 1;
    +[FBKLog ded](FBKLog, "ded");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __72__FBKDEDHelper_fetchTextDataOnMatcherPredicates_fromSession_completion___block_invoke_4_cold_1();

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

+ (void)completeEnhancedLoggingWithFollowup:(id)a3 devicesController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "deferredAttachmentCollections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ded_flatMapWithBlock:", &__block_literal_global_96);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v12, "count") >= 2)
  {
    +[FBKLog ded](FBKLog, "ded");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[FBKDEDHelper completeEnhancedLoggingWithFollowup:devicesController:completion:].cold.1();

  }
  objc_msgSend(v12, "anyObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __81__FBKDEDHelper_completeEnhancedLoggingWithFollowup_devicesController_completion___block_invoke_97;
  v18[3] = &unk_24E158C28;
  v20 = v14;
  v21 = v9;
  v19 = v8;
  v15 = v14;
  v16 = v8;
  v17 = v9;
  objc_msgSend(a1, "getSessionForForm:device:shouldGetSessionStatus:completion:", v10, v15, 0, v18);

}

uint64_t __81__FBKDEDHelper_completeEnhancedLoggingWithFollowup_devicesController_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "device");
}

void __81__FBKDEDHelper_completeEnhancedLoggingWithFollowup_devicesController_completion___block_invoke_97(id *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v9 = a2;
  v10 = a3;
  v11 = a6;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __81__FBKDEDHelper_completeEnhancedLoggingWithFollowup_devicesController_completion___block_invoke_2;
  v15[3] = &unk_24E158C00;
  v16 = v9;
  v21 = a1[6];
  v17 = v11;
  v18 = a1[4];
  v19 = v10;
  v20 = a1[5];
  v12 = v10;
  v13 = v11;
  v14 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v15);

}

void __81__FBKDEDHelper_completeEnhancedLoggingWithFollowup_devicesController_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id obj;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41;
  _BYTE v42[15];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  NSObject *v50;
  __int16 v51;
  void *v52;
  uint8_t v53[4];
  uint64_t v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 72);
    if (v2)
      (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
    return;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", *MEMORY[0x24BE2C9A8]) & 1) != 0)
  {
    v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 4);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(*(id *)(a1 + 48), "deferredAttachmentCollections");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v44;
      v30 = *(_QWORD *)v44;
      do
      {
        v6 = 0;
        v31 = v4;
        do
        {
          if (*(_QWORD *)v44 != v5)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v6), "allMatchers");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v7, "count"))
          {
            v39 = 0u;
            v40 = 0u;
            v37 = 0u;
            v38 = 0u;
            v8 = v7;
            v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v37, v55, 16);
            if (v9)
            {
              v10 = v9;
              v33 = v7;
              v34 = v6;
              v11 = *(_QWORD *)v38;
              do
              {
                for (i = 0; i != v10; ++i)
                {
                  if (*(_QWORD *)v38 != v11)
                    objc_enumerationMutation(v8);
                  v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
                  objc_msgSend(*(id *)(a1 + 56), "knownExtensions");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "fileMatcher");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "deBundleIdentifier");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "objectForKeyedSubscript:", v16);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v17)
                  {
                    +[FBKDECollector parametersForGatheringExtension:answers:session:givenParameters:](FBKDECollector, "parametersForGatheringExtension:answers:session:givenParameters:", v17, 0, *(_QWORD *)(a1 + 56), 0);
                    v18 = objc_claimAutoreleasedReturnValue();
                    v19 = (void *)MEMORY[0x24BDBCE60];
                    objc_msgSend(v13, "filePredicate");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "dateWithTimeIntervalSinceNow:", (double)objc_msgSend(v20, "enhancedLoggingDuration"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();

                    +[FBKLog ded](FBKLog, "ded");
                    v22 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543874;
                      v48 = v13;
                      v49 = 2114;
                      v50 = v18;
                      v51 = 2114;
                      v52 = v21;
                      _os_log_impl(&dword_21D9A9000, v22, OS_LOG_TYPE_DEFAULT, "Will collect deferred diagnostics for [%{public}@] parameters [%{public}@] on [%{public}@]", buf, 0x20u);
                    }

                    objc_msgSend(v35, "addObject:", v13);
                    v23 = *(void **)(a1 + 56);
                    objc_msgSend(v17, "identifier");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v25 = (id)objc_msgSend(v23, "startDiagnosticExtensionWithIdentifier:parameters:deferRunUntil:completion:", v24, v18, v21, &__block_literal_global_102);

                  }
                  else
                  {
                    +[FBKLog ded](FBKLog, "ded");
                    v18 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                      __81__FBKDEDHelper_completeEnhancedLoggingWithFollowup_devicesController_completion___block_invoke_2_cold_2(v53, v13, &v54, v18);
                  }

                }
                v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v37, v55, 16);
              }
              while (v10);
              v5 = v30;
              v4 = v31;
              v7 = v33;
              v6 = v34;
            }
          }
          else
          {
            +[FBKLog ded](FBKLog, "ded");
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
              __81__FBKDEDHelper_completeEnhancedLoggingWithFollowup_devicesController_completion___block_invoke_2_cold_1(&v41, v42, v8);
          }

          ++v6;
        }
        while (v6 != v4);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
      }
      while (v4);
    }

    if (objc_msgSend(v35, "count"))
    {
      objc_msgSend(*(id *)(a1 + 56), "scheduleNotification");
      v26 = *(_QWORD *)(a1 + 72);
      if (v26)
      {
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *(_QWORD *)(a1 + 64));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v26 + 16))(v26, v27, 0);
LABEL_36:

      }
    }
    else
    {
      v29 = *(_QWORD *)(a1 + 72);
      if (v29)
      {
        FBKErrorOfType(-1023);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v29 + 16))(v29, 0, v27);
        goto LABEL_36;
      }
    }

    return;
  }
  v28 = *(_QWORD *)(a1 + 72);
  if (v28)
  {
    FBKErrorOfType(-1022);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v28 + 16))(v28, 0);

  }
}

void __81__FBKDEDHelper_completeEnhancedLoggingWithFollowup_devicesController_completion___block_invoke_100(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  +[FBKLog ded](FBKLog, "ded");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_21D9A9000, v3, OS_LOG_TYPE_DEFAULT, "Finished deferred attachment collection with [%{public}@]", (uint8_t *)&v4, 0xCu);
  }

}

+ (id)_seedingHost
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__FBKDEDHelper__seedingHost__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_seedingHost_onceToken != -1)
    dispatch_once(&_seedingHost_onceToken, block);
  return (id)_seedingHost__host;
}

void __28__FBKDEDHelper__seedingHost__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_seedPortal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hostUrl");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("sp"), &stru_24E15EAF8);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_seedingHost__host;
  _seedingHost__host = v3;

}

+ (id)_seedPortal
{
  void *v2;
  void *v3;

  +[FBKData sharedInstance](FBKData, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "api");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __52__FBKDEDHelper_cleanupBugSessionDirectoriesForForm___block_invoke_46_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 40), "publicLogDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_1(&dword_21D9A9000, v1, v2, "could not create (to abort) session [%{public}@] on [%{public}@]", v3, v4, v5, v6, 2u);

}

+ (void)bugSessionIDForForm:device:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "could not get form response id for form response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__FBKDEDHelper_sendLocalFilesToDED_withForm_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "failed to get adopt session", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__FBKDEDHelper_sendLocalFilesToDED_withForm_withCompletion___block_invoke_58_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "failed to adopt files", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __80__FBKDEDHelper__getBugSessionConfigWithSubmissionType_formId_device_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "bug session device token is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __80__FBKDEDHelper__getBugSessionConfigWithSubmissionType_formId_device_completion___block_invoke_72_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a2, v4, "Error getting device token for bug session: [%{public}@]", v5);

  OUTLINED_FUNCTION_2_1();
}

void __131__FBKDEDHelper__startSessionByFirstPairingWithConfig_device_grouped_identifier_shouldGetDetails_shouldGetSessionStatus_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a2, a3, "failed to pin pair on demand for device [%{public}@]", (uint8_t *)&v4);
  OUTLINED_FUNCTION_7();
}

void __108__FBKDEDHelper__getSessionWithIdentifier_configuration_device_getDetails_shouldGetSessionStatus_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a2, a3, "Could not find DED device from grouped device [%{public}@]", (uint8_t *)&v4);
  OUTLINED_FUNCTION_7();
}

void __108__FBKDEDHelper__getSessionWithIdentifier_configuration_device_getDetails_shouldGetSessionStatus_completion___block_invoke_78_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "failed to start session with IDS, will try Sharing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_getSessionWithIdentifier:(double)a3 configuration:dedDevice:getDetails:shouldGetSessionStatus:completion:.cold.1(os_log_t log, double a2, double a3)
{
  int v3;
  double v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = a2;
  v5 = 2048;
  v6 = a3;
  _os_log_debug_impl(&dword_21D9A9000, log, OS_LOG_TYPE_DEBUG, "BugSession start timeout [%.2lf], FBK session start timeout [%.2lf]", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_7();
}

void __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(*(id *)(a1 + 48), "seedingSubmissionID");
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_1(&dword_21D9A9000, v1, v2, "Error starting bug session for form [%li] error: %{public}@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

void __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_81_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "valueForKeyPath:", CFSTR("identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_21D9A9000, a2, v4, "DEs: %@", v5);

  OUTLINED_FUNCTION_2_1();
}

void __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_84_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_21D9A9000, v0, v1, "BugSession status: collected %@", v2);
  OUTLINED_FUNCTION_7();
}

void __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_84_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_21D9A9000, v0, v1, "BugSession status: ongoing %@", v2);
  OUTLINED_FUNCTION_7();
}

void __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_88_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "start bug session sequence timed out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)fetchTextDataOnMatcherPredicates:fromSession:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, v0, v1, "[%{public}@] cannot fetch text data. Extensions are nil", v2);
  OUTLINED_FUNCTION_7();
}

void __72__FBKDEDHelper_fetchTextDataOnMatcherPredicates_fromSession_completion___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "loadTextDataForExtensions timed out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)completeEnhancedLoggingWithFollowup:devicesController:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "More than one target device found for EL. This is not supported yet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __81__FBKDEDHelper_completeEnhancedLoggingWithFollowup_devicesController_completion___block_invoke_2_cold_1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_21D9A9000, log, OS_LOG_TYPE_ERROR, "No Matcher Predicate found in Deferred Attachment Collection", buf, 2u);
}

void __81__FBKDEDHelper_completeEnhancedLoggingWithFollowup_devicesController_completion___block_invoke_2_cold_2(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;
  void *v8;

  objc_msgSend(a2, "fileMatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a3 = v8;
  _os_log_error_impl(&dword_21D9A9000, a4, OS_LOG_TYPE_ERROR, "No DEDExtension found for DE bundle identifier [%{public}@]", a1, 0xCu);

}

@end
