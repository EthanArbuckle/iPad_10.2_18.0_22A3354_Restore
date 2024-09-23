id AXLocalizedApplicationName(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD1488];
  v2 = a1;
  objc_msgSend(v1, "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_24DA1ABE0, CFSTR("FrontBoardUtilsStrings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id AXApplicationNameLabelForBundleIdentifier(uint64_t a1)
{
  void *v1;
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v8;
  id v9;

  if (!a1)
    return 0;
  v9 = 0;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithApplicationIdentifier:error:", a1, &v9);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v9;
  if (v2)
  {
    AXLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      AXApplicationNameLabelForBundleIdentifier_cold_1((uint64_t)v2, v3);

  }
  objc_msgSend(v1, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXSpokenNameLabelForBundleURL(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(v1, "localizedName");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v6;

  return v8;
}

id AXSpokenNameLabelForBundleURL(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (a1)
  {
    v1 = (objc_class *)MEMORY[0x24BE0BDC8];
    v2 = a1;
    v3 = (void *)objc_msgSend([v1 alloc], "initWithURL:", v2);

    objc_msgSend(v3, "localizedInfoDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("CFBundleSpokenName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v5, "length"))
    {
      objc_msgSend(v3, "infoDictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("CFBundleSpokenName"));
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

id AXFrontBoardSystemAppProcess()
{
  void *v0;
  void *v1;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("FBProcessManager")), "safeValueForKey:", CFSTR("sharedInstance"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safeValueForKey:", CFSTR("systemApplicationProcess"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id AXFrontBoardSystemAppPID()
{
  void *v0;
  void *v1;

  AXFrontBoardSystemAppProcess();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safeValueForKey:", CFSTR("pid"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t AXFrontBoardFBSceneManager()
{
  return -[objc_class safeValueForKey:](NSClassFromString(CFSTR("FBSceneManager")), "safeValueForKey:", CFSTR("sharedInstance"));
}

id AXFrontBoardSystemAppAlertWindow()
{
  id v0;
  id v1;
  id v2;
  uint64_t v3;
  void *i;
  void *v5;
  void *v6;
  void *v7;
  int isKindOfClass;
  int IsSpringBoard;
  uint64_t v10;
  double v11;
  int v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  void *v24;
  uint64_t *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  void *v38;
  uint64_t *v39;
  uint64_t v40;
  double *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_3;
  v40 = 0;
  v41 = (double *)&v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy_;
  v44 = __Block_byref_object_dispose_;
  v45 = 0;
  v35 = MEMORY[0x24BDAC760];
  v36 = 3221225472;
  v37 = __AXFrontBoardSystemAppAlertWindow_block_invoke;
  v38 = &unk_24DA1A940;
  v39 = &v40;
  AXPerformSafeBlock();
  v0 = *((id *)v41 + 5);
  _Block_object_dispose(&v40, 8);

  if (!v0)
  {
LABEL_3:
    v40 = 0;
    v41 = (double *)&v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy_;
    v44 = __Block_byref_object_dispose_;
    v45 = 0;
    v30 = MEMORY[0x24BDAC760];
    v31 = 3221225472;
    v32 = __AXFrontBoardSystemAppAlertWindow_block_invoke_2;
    v33 = &unk_24DA1A940;
    v34 = &v40;
    AXPerformSafeBlock();
    v0 = *((id *)v41 + 5);
    _Block_object_dispose(&v40, 8);

  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v1 = v0;
  v2 = (id)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v26, v46, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v5, "safeValueForKey:", CFSTR("rootViewController"), v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, (_QWORD)v26);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "safeValueForKey:", CFSTR("presentedViewController"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        NSClassFromString(CFSTR("UIAlertController"));
        isKindOfClass = objc_opt_isKindOfClass();
        IsSpringBoard = AXProcessIsSpringBoard();
        if (IsSpringBoard)
        {
          NSClassFromString(CFSTR("SBAlertItemWindow"));
          IsSpringBoard = objc_opt_isKindOfClass();
        }
        if (((isKindOfClass | IsSpringBoard) & 1) != 0)
        {
          v40 = 0;
          v41 = (double *)&v40;
          v42 = 0x2020000000;
          v43 = 0;
          v10 = MEMORY[0x24BDAC760];
          v20 = MEMORY[0x24BDAC760];
          v21 = 3221225472;
          v22 = __AXFrontBoardSystemAppAlertWindow_block_invoke_3;
          v23 = &unk_24DA1A968;
          v24 = v5;
          v25 = &v40;
          AXPerformSafeBlock();
          v11 = v41[3];
          _Block_object_dispose(&v40, 8);
          v40 = 0;
          v41 = (double *)&v40;
          v42 = 0x2020000000;
          LOBYTE(v43) = 0;
          v14 = v10;
          v15 = 3221225472;
          v16 = __AXFrontBoardSystemAppAlertWindow_block_invoke_4;
          v17 = &unk_24DA1A968;
          v18 = v5;
          v19 = &v40;
          AXPerformSafeBlock();
          v12 = *((unsigned __int8 *)v41 + 24);
          _Block_object_dispose(&v40, 8);
          if (v11 > 0.0 && !v12)
          {
            v2 = v5;

            goto LABEL_18;
          }
        }

      }
      v2 = (id)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v26, v46, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_18:

  return v2;
}

void sub_218DE148C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
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

BOOL AXFrontBoardIsSystemAppShowingAlert()
{
  return _AXFrontBoardIsSystemAppShowingAlertIgnoringServiceBundleIdentifiers(0);
}

BOOL _AXFrontBoardIsSystemAppShowingAlertIgnoringServiceBundleIdentifiers(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  AXFrontBoardSystemAppAlertWindow();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;
  if (v2)
  {
    AXLogUIA();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v2;
      _os_log_impl(&dword_218DDF000, v4, OS_LOG_TYPE_INFO, "System alert window: %@", (uint8_t *)&v12, 0xCu);
    }

  }
  if (AXProcessIsSpringBoard())
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBMainWorkspace")), "safeValueForKey:", CFSTR("_instanceIfExists"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("transientOverlayPresentationManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("topmostPresentedViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    NSClassFromString(CFSTR("SBInCallTransientOverlayViewController"));
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (NSClassFromString(CFSTR("SBSpotlightTransientOverlayViewController")), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v3 = 0;
LABEL_24:

      goto LABEL_25;
    }
    NSClassFromString(CFSTR("SBRemoteTransientOverlayViewController"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "safeValueForKeyPath:", CFSTR("_hostContentAdapter.serviceBundleIdentifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
LABEL_13:
        if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE00520]))
          goto LABEL_23;
      }
    }
    else
    {
      v8 = 0;
      if (!v7)
        goto LABEL_13;
    }
    if (!objc_msgSend(v1, "count")
      || (NSClassFromString(CFSTR("SBRemoteTransientOverlayViewController")), (objc_opt_isKindOfClass() & 1) == 0))
    {
      AXLogUIA();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v7;
        v10 = "top most alert controller: %@";
        goto LABEL_21;
      }
LABEL_22:

      v3 = 1;
      goto LABEL_23;
    }
    if ((objc_msgSend(v1, "containsObject:", v8) & 1) == 0)
    {
      AXLogUIA();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v8;
        v10 = "top most alert service identifier: %@";
LABEL_21:
        _os_log_impl(&dword_218DDF000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v12, 0xCu);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
LABEL_23:

    goto LABEL_24;
  }
LABEL_25:

  return v3;
}

id _AXFrontBoardFilterFrontmostAppProcessesAndScenesForSiri(char a1, void *a2)
{
  id v3;
  void *v4;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[7];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0x7FFFFFFFFFFFFFFFLL;
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___AXFrontBoardFilterFrontmostAppProcessesAndScenesForSiri_block_invoke;
  v9[3] = &unk_24DA1A990;
  v9[4] = &v18;
  v9[5] = &v10;
  v9[6] = &v14;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);
  if (v19[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((a1 & 1) == 0 && v15[3] == v11[3])
    {
      objc_msgSend(v4, "objectAtIndex:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "mutableCopy");

      v4 = (void *)v8;
    }
    else
    {
      objc_msgSend(v4, "removeObjectAtIndex:");
    }
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v4;
}

void sub_218DE19F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

id AXFrontBoardFocusedAppPID()
{
  void *v0;
  void *v1;
  void *v2;

  _AXFrontBoardFrontmostAppProcesses(0, 0, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "firstObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safeValueForKey:", CFSTR("pid"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id AXFrontBoardFocusedAppPIDs()
{
  void *v0;
  void *v1;
  void *v2;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
    _AXAssert();
  _AXFrontBoardFrontmostAppProcesses(0, 0, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safeValueForKey:", CFSTR("state"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safeValueForKey:", CFSTR("pid"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id _AXFrontBoardFrontmostAppProcesses(char a1, char a2, void *a3)
{
  id v3;
  void *v4;
  id v6;

  v6 = 0;
  _AXFrontBoardGetFrontmostAppProcessesAndScenes(a1, &v6, 0, a2, a3);
  v3 = v6;
  objc_msgSend(v3, "ax_arrayByRemovingDuplicates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id AXFrontBoardFocusedAppPIDsIgnoringSiri()
{
  void *v0;
  void *v1;
  void *v2;

  _AXFrontBoardFrontmostAppProcesses(1, 0, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safeValueForKey:", CFSTR("state"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safeValueForKey:", CFSTR("pid"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id AXFrontBoardFocusedApps()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _AXFrontBoardFrontmostAppProcesses(0, 1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "safeIntForKey:", CFSTR("pid"));
        objc_msgSend(v6, "safeStringForKey:", CFSTR("bundleIdentifier"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE00598], "appWithPID:bundleID:", v7, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "addObject:", v9);

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }

  return v0;
}

uint64_t AXFrontBoardPurpleBuddyPID()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BE00750], "setupProcessName");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = AXFrontBoardPIDForApplicationWithBundleID(v0);

  return v1;
}

uint64_t AXFrontBoardPIDForApplicationWithBundleID(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  AXFrontBoardRunningAppProcesses();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "safeValueForKey:", CFSTR("bundleIdentifier"), (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", v1);

        if (v9)
        {
          v10 = objc_msgSend(v7, "safeIntForKey:", CFSTR("pid"));
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0xFFFFFFFFLL;
LABEL_11:

  return v10;
}

id AXFrontBoardFocusedAppProcesses()
{
  return _AXFrontBoardFrontmostAppProcesses(0, 0, 0);
}

id AXFrontBoardFocusedAppProcessesExcludingSiri()
{
  return _AXFrontBoardFrontmostAppProcesses(1, 0, 0);
}

id AXFrontBoardFocusedAppProcessesForGuidedAccess(char a1)
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("com.apple.shortcuts.runtime");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _AXFrontBoardFrontmostAppProcesses(a1, 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id AXFrontBoardVisibleAppProcesses()
{
  return _AXFrontBoardFrontmostAppProcesses(1, 1, 0);
}

id AXFrontBoardFocusedAppProcess()
{
  void *v0;
  void *v1;

  _AXFrontBoardFrontmostAppProcesses(0, 0, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "firstObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id AXFrontBoardSpeakThisAppPIDs()
{
  void *v0;
  void *v1;

  _AXFrontBoardFrontmostAppProcesses(1, 0, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safeValueForKey:", CFSTR("pid"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id AXFrontBoardFocusedAppPidsForContinuity()
{
  void *v0;
  id v1;
  id v2;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  id v15;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = 0;
  _AXFrontBoardGetFrontmostAppProcessesAndScenes(0, &v15, &v14, 0, 0);
  v1 = v15;
  v2 = v14;
  if (objc_msgSend(v2, "count"))
  {
    v3 = 0;
    while (v3 < objc_msgSend(v1, "count"))
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "objectAtIndexedSubscript:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v1, "count") == 1)
      {
        AXFrontBoardSystemAppProcess();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v5, "isEqual:", v6);

        if (v7)
        {
          objc_msgSend(v0, "addObject:", v5);

          break;
        }
      }
      objc_msgSend(v4, "safeValueForKey:", CFSTR("parentScene"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        NSClassFromString(CFSTR("FBSScene"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v8, "accessibilityIsSceneOnContinuityDisplay"))
            objc_msgSend(v0, "addObject:", v5);
        }
      }

      if (++v3 >= objc_msgSend(v2, "count"))
        break;
    }
  }
  v9 = (id)objc_msgSend(v0, "ax_arrayByRemovingDuplicates");
  objc_msgSend(v0, "safeValueForKey:", CFSTR("state"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safeValueForKey:", CFSTR("pid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void _AXFrontBoardGetFrontmostAppProcessesAndScenes(char a1, _QWORD *a2, _QWORD *a3, char a4, void *a5)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char v16;
  int v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  char v28;
  int v29;
  void *v30;
  uint64_t v31;
  id v32;
  void (**v33)(_QWORD);
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  AXFBFakeProcess *v39;
  AXFBFakeProcessState *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  id *v47;
  AXFBFakeProcessState *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  AXFBFakeProcessState *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  int IsCarPlay;
  int v68;
  void *v69;
  int v70;
  NSObject *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  int v76;
  _QWORD v81[4];
  AXFBFakeProcessState *v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  _QWORD v89[4];
  id v90;
  uint64_t *v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t (*v96)(uint64_t, uint64_t);
  void (*v97)(uint64_t);
  id v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t (*v102)(uint64_t, uint64_t);
  void (*v103)(uint64_t);
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _QWORD v109[2];
  _QWORD v110[2];
  _QWORD v111[2];
  _QWORD v112[2];
  AXFBFakeProcessState *v113;
  AXFBFakeProcess *v114;
  id v115;
  AXFBFakeProcess *v116;
  AXFBFakeProcessState *v117;
  AXFBFakeProcess *v118;
  uint8_t buf[4];
  int v120;
  __int16 v121;
  int v122;
  __int16 v123;
  id v124;
  uint8_t v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x24BDAC8D0];
  v5 = a5;
  v99 = 0;
  v100 = &v99;
  v101 = 0x3032000000;
  v102 = __Block_byref_object_copy_;
  v103 = __Block_byref_object_dispose_;
  v104 = 0;
  v93 = 0;
  v94 = &v93;
  v95 = 0x3032000000;
  v96 = __Block_byref_object_copy_;
  v97 = __Block_byref_object_dispose_;
  v98 = 0;
  objc_msgSend(MEMORY[0x24BE38060], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "elements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v105, v125, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v106;
    v12 = *MEMORY[0x24BEB0C58];
    v13 = *MEMORY[0x24BEB0C60];
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v106 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * i), "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqualToString:", v12))
        {

          v18 = 0;
          v17 = 1;
          goto LABEL_14;
        }
        v16 = objc_msgSend(v15, "isEqualToString:", v13);

        if ((v16 & 1) != 0)
        {
          v17 = 0;
          v18 = 1;
          goto LABEL_14;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v105, v125, 16);
      v17 = 0;
      v18 = 0;
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v17 = 0;
    v18 = 0;
  }
LABEL_14:

  AXLogUIA();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    v120 = v18;
    v121 = 1024;
    v122 = v17;
    v123 = 2112;
    v124 = v9;
    _os_log_impl(&dword_218DDF000, v19, OS_LOG_TYPE_INFO, "Spotlight status: %d, %d %@", buf, 0x18u);
  }

  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  objc_msgSend(MEMORY[0x24BE38060], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "currentLayout");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "elements");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v105, v125, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v106;
    v25 = *MEMORY[0x24BE00520];
    while (2)
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v106 != v24)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * j), "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isEqualToString:", v25);

        if ((v28 & 1) != 0)
        {
          v29 = 0;
          goto LABEL_26;
        }
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v105, v125, 16);
      if (v23)
        continue;
      break;
    }
  }
  v29 = 1;
LABEL_26:

  objc_msgSend(MEMORY[0x24BE00720], "server");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = MEMORY[0x24BDAC760];
  v89[0] = MEMORY[0x24BDAC760];
  v89[1] = 3221225472;
  v89[2] = ___AXFrontBoardGetFrontmostAppProcessesAndScenes_block_invoke;
  v89[3] = &unk_24DA1AA08;
  v91 = &v93;
  v92 = &v99;
  v32 = v30;
  v90 = v32;
  v33 = (void (**)(_QWORD))MEMORY[0x219A233A4](v89);
  if (_AXFrontBoardIsSystemAppShowingAlertIgnoringServiceBundleIdentifiers(v5))
  {
    if (objc_msgSend((id)v94[5], "count"))
      goto LABEL_37;
    goto LABEL_36;
  }
  if ((AXProcessIsCarPlay() & 1) == 0 && (objc_msgSend(v32, "isAppSwitcherVisible") & 1) != 0
    || (AXProcessIsCarPlay() & 1) == 0 && (objc_msgSend(v32, "isControlCenterVisible") & 1) != 0
    || (AXProcessIsCarPlay() & 1) == 0 && (objc_msgSend(v32, "isNotificationCenterVisible") & 1) != 0
    || (objc_msgSend(v32, "isSoftwareUpdateUIVisible") & 1) != 0
    || (AXProcessIsCarPlay() & 1) == 0 && objc_msgSend(v32, "isPasscodeLockVisible"))
  {
LABEL_36:
    v33[2](v33);
    goto LABEL_37;
  }
  if ((v29 & (v17 ^ 1) & 1) == 0)
  {
    if ((v17 | v29 ^ 1) == 1)
    {
      v47 = (id *)MEMORY[0x24BE00548];
      if (!v17)
        v47 = (id *)MEMORY[0x24BE00520];
      v44 = *v47;
    }
    else
    {
      v44 = 0;
    }
    v87 = 0;
    v88 = 0;
    _AXFrontBoardGetTransientProcessAndSceneForBundleIdentifier(v44, &v88, &v87);
    v39 = (AXFBFakeProcess *)v88;
    v48 = (AXFBFakeProcessState *)v87;
    v40 = v48;
    if (v39 && v48)
    {
      v118 = v39;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v118, 1);
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = (void *)v94[5];
      v94[5] = v49;

      v117 = v40;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v117, 1);
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = (void *)v100[5];
      v100[5] = v51;

    }
    goto LABEL_87;
  }
  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("GAXSpringboard")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "safeValueForKey:", CFSTR("isInWorkspace"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "BOOLValue");

  if (!v38)
  {
    objc_msgSend(MEMORY[0x24BE006F0], "server");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v53, "isAppleWatchRemoteScreenActive") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BE006F0], "server");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "isScreenLockedWithPasscode:", 0);

      if ((v55 & 1) == 0)
      {
        v56 = (void *)*MEMORY[0x24BE00438];
        v85 = 0;
        v86 = 0;
        _AXFrontBoardGetTransientProcessAndSceneForBundleIdentifier(v56, &v86, &v85);
        v39 = (AXFBFakeProcess *)v86;
        v57 = (AXFBFakeProcessState *)v85;
        v40 = v57;
        if (!v39 || !v57)
          goto LABEL_88;
        v114 = v39;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v114, 1);
        v58 = objc_claimAutoreleasedReturnValue();
        v59 = (void *)v94[5];
        v94[5] = v58;

        v113 = v40;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v113, 1);
        v60 = objc_claimAutoreleasedReturnValue();
        goto LABEL_86;
      }
    }
    else
    {

    }
    _AXFrontBoardSortedNonSystemAppProcessesAndScenes(a4);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    _AXFrontBoardFilterFrontmostAppProcessesAndScenesForSiri(a1, v61);
    v39 = (AXFBFakeProcess *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v62 = (void *)*MEMORY[0x24BE00548];
      v83 = 0;
      v84 = 0;
      _AXFrontBoardGetTransientProcessAndSceneForBundleIdentifier(v62, &v84, &v83);
      v63 = v84;
      v64 = v83;
      v65 = v64;
      if (v63 && v64)
      {
        v111[0] = CFSTR("scene");
        v111[1] = CFSTR("process");
        v112[0] = v64;
        v112[1] = v63;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v112, v111, 2);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXFBFakeProcess addObject:](v39, "addObject:", v66);

      }
    }
    if ((AXProcessIsCarPlay() & 1) != 0)
      IsCarPlay = AXProcessIsCarPlay();
    else
      IsCarPlay = objc_msgSend(v32, "isNonExclusiveSystemUIFocusableIncludingPIPWindow:", 0);
    v68 = IsCarPlay;
    if (-[AXFBFakeProcess ax_containsObjectUsingBlock:](v39, "ax_containsObjectUsingBlock:", &__block_literal_global))
    {
      objc_msgSend(MEMORY[0x24BE006F0], "server");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v69, "isSpotlightVisible");

      if (v70)
      {
        AXLogUIA();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v125 = 0;
          _os_log_impl(&dword_218DDF000, v71, OS_LOG_TYPE_INFO, "Spotlight frontmost, but spotlight is not visible", v125, 2u);
        }

      }
      else
      {
        v68 = 1;
      }
    }
    if ((AXProcessIsCarPlay() & 1) != 0)
      goto LABEL_80;
    v76 = objc_msgSend(v32, "isSiriVisible");
    v40 = 0;
    if ((a1 & 1) != 0 || ((v76 ^ 1) & 1) != 0)
      goto LABEL_81;
    if ((AXDeviceIsPad() & 1) != 0)
    {
LABEL_80:
      v40 = 0;
    }
    else
    {
      AXFrontBoardSystemAppProcess();
      v81[0] = v31;
      v81[1] = 3221225472;
      v81[2] = ___AXFrontBoardGetFrontmostAppProcessesAndScenes_block_invoke_308;
      v81[3] = &unk_24DA1AA50;
      v40 = (AXFBFakeProcessState *)(id)objc_claimAutoreleasedReturnValue();
      v82 = v40;
      -[AXFBFakeProcess ax_removeObjectsFromArrayUsingBlock:](v39, "ax_removeObjectsFromArrayUsingBlock:", v81);

    }
LABEL_81:
    if (v68)
    {
      if (v40
        || (AXFrontBoardSystemAppProcess(), (v40 = (AXFBFakeProcessState *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v109[0] = CFSTR("scene");
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v109[1] = CFSTR("process");
        v110[0] = v72;
        v110[1] = v40;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v110, v109, 2);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXFBFakeProcess addObject:](v39, "addObject:", v73);

      }
    }
    -[AXFBFakeProcess valueForKey:](v39, "valueForKey:", CFSTR("process"));
    v74 = objc_claimAutoreleasedReturnValue();
    v75 = (void *)v94[5];
    v94[5] = v74;

    -[AXFBFakeProcess valueForKey:](v39, "valueForKey:", CFSTR("scene"));
    v60 = objc_claimAutoreleasedReturnValue();
LABEL_86:
    v44 = (id)v100[5];
    v100[5] = v60;
    goto LABEL_87;
  }
  v39 = objc_alloc_init(AXFBFakeProcess);
  v40 = objc_alloc_init(AXFBFakeProcessState);
  objc_msgSend(MEMORY[0x24BE005C0], "server");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXFBFakeProcessState setPid:](v40, "setPid:", objc_msgSend(v41, "accessibilityUIServicePID"));

  -[AXFBFakeProcess setState:](v39, "setState:", v40);
  -[AXFBFakeProcess setBundleIdentifier:](v39, "setBundleIdentifier:", *MEMORY[0x24BE00440]);
  v116 = v39;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v116, 1);
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)v94[5];
  v94[5] = v42;

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  v115 = v44;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v115, 1);
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v100[5];
  v100[5] = v45;

LABEL_87:
LABEL_88:

LABEL_37:
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "isRemoteAlertVisible");

  if (v35)
    v33[2](v33);
  if (!objc_msgSend((id)v94[5], "count"))
    v33[2](v33);
  if (a2)
    *a2 = objc_retainAutorelease((id)v94[5]);
  if (a3)
    *a3 = objc_retainAutorelease((id)v100[5]);

  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(&v99, 8);

}

void sub_218DE2DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

id AXFrontBoardSpeakThisAppPIDForPoint(void *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  const __CFString *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  CGPoint v42;
  CGRect v43;
  CGRect v44;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v35 = CFSTR("Finding the Speak Screen app for portrait-up coordinate: %@");
    v36 = v1;
    LOBYTE(v33) = 1;
    _AXLogWithFacility();
  }
  v39 = v2;
  v40 = 0;
  v41 = 0;
  _AXFrontBoardGetFrontmostAppProcessesAndScenes(1, &v41, &v40, 0, 0);
  v3 = v41;
  v4 = v40;
  v5 = objc_msgSend(v3, "count");
  if (v5 != objc_msgSend(v4, "count"))
  {
    v33 = objc_msgSend(v3, "count");
    v35 = (const __CFString *)objc_msgSend(v4, "count");
    _AXAssert();
  }
  v6 = objc_msgSend(v4, "count", v33, v35, v36);
  if (!v6)
  {
LABEL_18:
    LOBYTE(v34) = 1;
    _AXLogWithFacility();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", getpid(), v34, CFSTR("Using system app as Speak Screen app"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v30 = 0;
    goto LABEL_19;
  }
  v7 = v6;
  v8 = 0;
  v38 = 0;
  v9 = 0.0;
  while (1)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndexedSubscript:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v10 == (void *)v12)
    {
      v29 = v10;
      goto LABEL_14;
    }
    v13 = (void *)v12;
    objc_msgSend(v10, "accessibilitySceneIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("searchBar-todayView"));

    if ((v15 & 1) == 0)
      break;
LABEL_15:

    if (v7 == ++v8)
      goto LABEL_16;
  }
  objc_msgSend(v10, "accessibilitySceneFrame");
  v19 = v18;
  v21 = v20;
  v22 = v39;
  if (!v39)
    goto LABEL_11;
  v23 = v16;
  v24 = v17;
  objc_msgSend(v39, "CGPointValue");
  v42.x = v25;
  v42.y = v26;
  v43.origin.x = v23;
  v43.origin.y = v24;
  v43.size.width = v19;
  v43.size.height = v21;
  if (!CGRectContainsPoint(v43, v42))
  {
LABEL_11:
    v27 = v19 * v21;
    if (v27 > v9)
    {
      v28 = v11;
      v29 = v38;
      v38 = v28;
      v9 = v27;
LABEL_14:

      goto LABEL_15;
    }
    goto LABEL_15;
  }
  v44.origin.x = v23;
  v44.origin.y = v24;
  v44.size.width = v19;
  v44.size.height = v21;
  NSStringFromCGRect(v44);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v34) = 1;
  _AXLogWithFacility();

  if (v11)
  {
    objc_msgSend(v11, "safeValueForKey:", CFSTR("pid"), v34, CFSTR("Found app %@ which contained that point in its frame %@"), v11, v37);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v38;
    goto LABEL_20;
  }
LABEL_16:
  v30 = v38;
  if (!v38)
    goto LABEL_18;
  LOBYTE(v34) = 1;
  _AXLogWithFacility();
  objc_msgSend(v38, "safeValueForKey:", CFSTR("pid"), v34, CFSTR("Using app with largest area as Speak Screen app: %@"), v38);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
LABEL_19:
  v22 = v39;
LABEL_20:

  return v31;
}

uint64_t AXFrontBoardIsSystemAppUINonExclusive()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BE00720], "server");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isNonExclusiveSystemUIFocusableIncludingPIPWindow:", 1);

  return v1;
}

id AXFrontBoardRunningAppPIDs()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  AXFrontBoardRunningAppProcesses();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v5), "safeValueForKey:", CFSTR("pid"), (_QWORD)v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
          objc_msgSend(v0, "addObject:", v6);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

  return v0;
}

id AXFrontBoardRunningAppProcesses()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  AXFrontBoardSystemAppProcess();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    objc_msgSend(v0, "addObject:", v1);
  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("FBSceneManager")), "safeValueForKey:", CFSTR("sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v8 = v2;
  v3 = v0;
  v9 = v3;
  v4 = v2;
  AXPerformSafeBlock();
  if (!objc_msgSend(v3, "count", v7, 3221225472, __AXFrontBoardRunningAppProcesses_block_invoke, &unk_24DA1A9E0))
  {

    v3 = 0;
  }
  objc_msgSend(v3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t AXIsPurpleBuddyFrontmost()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;

  AXFrontBoardFocusedAppProcess();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safeValueForKey:", CFSTR("bundleIdentifier"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE00750], "setupProcessName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isEqualToString:", v2);

  return v3;
}

void AXFrontBoardRebootDevice()
{
  void *v0;
  id v1;

  v1 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE380E8]), "initWithReason:", CFSTR("Accessibility reboot"));
  objc_msgSend(v1, "setRebootType:", 1);
  objc_msgSend(v1, "setSource:", 1);
  objc_msgSend(MEMORY[0x24BE38118], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "shutdownUsingOptions:", v1);

}

void _AXFrontBoardGetTransientProcessAndSceneForBundleIdentifier(void *a1, _QWORD *a2, _QWORD *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;

  v5 = (void *)MEMORY[0x24BE38070];
  v6 = a1;
  objc_msgSend(v5, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "processesForBundleIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AXLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      _AXFrontBoardGetTransientProcessAndSceneForBundleIdentifier_cold_1(v12);

    v11 = 0;
  }
  v13 = objc_retainAutorelease(v9);
  *a2 = v13;
  v14 = objc_retainAutorelease(v11);
  *a3 = v14;

}

id _AXFrontBoardSortedNonSystemAppProcessesAndScenes(char a1)
{
  void *v2;
  id *v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  char v23;
  char v24;
  char v25;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id *)MEMORY[0x24BDF74F8];
  v4 = (id)*MEMORY[0x24BDF74F8];
  AXFrontBoardSystemAppProcess();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE00518]);
  v8 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = ___AXFrontBoardSortedNonSystemAppProcessesAndScenes_block_invoke;
  v20[3] = &unk_24DA1AA78;
  v23 = v7;
  v24 = a1;
  v25 = 0;
  v21 = v4;
  v9 = v2;
  v22 = v9;
  v10 = v4;
  v11 = (void *)MEMORY[0x219A233A4](v20);
  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("FBSceneManager")), "safeValueForKey:", CFSTR("sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = ___AXFrontBoardSortedNonSystemAppProcessesAndScenes_block_invoke_2;
  v18[3] = &unk_24DA1AAA0;
  v19 = v11;
  v13 = v11;
  objc_msgSend(v12, "enumerateScenesWithBlock:", v18);

  v14 = objc_msgSend(*v3, "activeInterfaceOrientation");
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = ___AXFrontBoardSortedNonSystemAppProcessesAndScenes_block_invoke_3;
  v17[3] = &__block_descriptor_40_e39_q24__0__NSDictionary_8__NSDictionary_16l;
  v17[4] = v14;
  objc_msgSend(v9, "sortUsingComparator:", v17);
  v15 = v9;

  return v15;
}

void sub_218DE4204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const char *_stringForValidationEvent()
{
  return "AXValidateFocusedAppsEventAppStateVisibilityDidChange";
}

void sub_218DE4E40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218DE4F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void AXApplicationNameLabelForBundleIdentifier_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_218DDF000, a2, OS_LOG_TYPE_ERROR, "Error fetching record: %@", (uint8_t *)&v2, 0xCu);
}

void _AXFrontBoardGetTransientProcessAndSceneForBundleIdentifier_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218DDF000, log, OS_LOG_TYPE_ERROR, "Could not get transient process", v1, 2u);
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x24BDFFF90]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x24BE00200]();
}

uint64_t AXLogUIA()
{
  return MEMORY[0x24BE00250]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x24BE002B0]();
}

uint64_t AXPidSuspend()
{
  return MEMORY[0x24BDFE928]();
}

uint64_t AXPidUnsuspend()
{
  return MEMORY[0x24BDFE930]();
}

uint64_t AXProcessIsCarPlay()
{
  return MEMORY[0x24BE002F8]();
}

uint64_t AXProcessIsSpringBoard()
{
  return MEMORY[0x24BE00330]();
}

uint64_t AXPushNotificationToSystemForBroadcast()
{
  return MEMORY[0x24BDFE938]();
}

uint64_t AXRuntimeLogPID()
{
  return MEMORY[0x24BE00348]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x24BE00360]();
}

uint64_t AXTentativePidSuspend()
{
  return MEMORY[0x24BDFE960]();
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BDF6670]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x24BDD1260]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

uint64_t _AXAssert()
{
  return MEMORY[0x24BE007F0]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x24BE00810]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x24BE00820]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x24BE00880]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

