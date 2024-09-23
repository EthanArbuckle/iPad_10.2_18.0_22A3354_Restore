@implementation UIAlertController(DigitalSeparation)

+ (id)ds_alertControllerWithStopSharingError:()DigitalSeparation
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  uint64_t v30;

  v4 = a3;
  objc_msgSend(v4, "ds_underlyingErrorsBySource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE2CC38]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE2CC08]);

  if (v8)
  {
    objc_msgSend(v6, "underlyingErrors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }
  objc_msgSend(v6, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("HMDigitalSeparationErrorDomain")))
  {
    v12 = objc_msgSend(v6, "code");

    if (v12 == 1)
    {
      DSUILocStringForKey(CFSTR("STOP_SHARING_FAILED_WITH_PIN_CODE_ERROR_MESSAGE"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      DSUILocStringForKey(CFSTR("STOP_SHARING_FAILED_WITH_PIN_CODE_ERROR_TITLE"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", v14, v13, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "ds_localizedAppNames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count") == 1)
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    DSUILocStringForKey(CFSTR("STOP_SHARING_FAILED_TITLE_WITH_APP_NAME"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "underlyingErrors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (__79__UIAlertController_DigitalSeparation__ds_alertControllerWithStopSharingError___block_invoke((uint64_t)v20, v20))v21 = CFSTR("STOP_SHARING_SOURCE_FAILED_RESTRICTIONS_SINGLE_APP");
    else
      v21 = CFSTR("STOP_SHARING_FAILED_WITH_APP_NAME");
    DSUILocStringForKey(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v13, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", v22, v24);
  }
  else
  {
    v25 = objc_msgSend(v13, "count");
    DSUILocStringForKey(CFSTR("STOP_SHARING_FAILED_TITLE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 < 2)
    {
      DSUILocStringForKey(CFSTR("STOP_SHARING_FAILED"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x24BDD1640], "localizedStringByJoiningStrings:", v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "underlyingErrors");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (__79__UIAlertController_DigitalSeparation__ds_alertControllerWithStopSharingError___block_invoke((uint64_t)v26, v26))v27 = CFSTR("STOP_SHARING_SOURCE_FAILED_RESTRICTIONS_MULTIPLE_APPS");
    else
      v27 = CFSTR("STOP_SHARING_FAILED_WITH_MULTIPLE_APPS");
    DSUILocStringForKey(v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v24, v22);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
  if (os_variant_has_internal_content())
  {
    v28 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "ds_underlyingErrorsBySource");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%@\n\nInternal Only: %@"), v14, v29);
    v30 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v30;
  }
  objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", v19, v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
  return v15;
}

+ (id)ds_alertControllerWithFetchSharingError:()DigitalSeparation
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
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v4 = a3;
  objc_msgSend(v4, "ds_localizedAppNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    DSUILocStringForKey(CFSTR("FETCH_SHARING_FAILED_TITLE_WITH_APP_NAME"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDD17C8];
    DSUILocStringForKey(CFSTR("FETCH_SHARING_FAILED_WITH_APP_NAME"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v11, v12);
LABEL_5:
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  v13 = objc_msgSend(v5, "count");
  DSUILocStringForKey(CFSTR("FETCH_SHARING_FAILED_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 >= 2)
  {
    objc_msgSend(MEMORY[0x24BDD1640], "localizedStringByJoiningStrings:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("FETCH_SHARING_FAILED_WITH_MULTIPLE_APPS"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v12, v11);
    goto LABEL_5;
  }
  DSUILocStringForKey(CFSTR("FETCH_SHARING_FAILED"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  if (os_variant_has_internal_content())
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "ds_underlyingErrorsBySource");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@\n\nInternal Only: %@"), v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)v16;
  }
  else
  {
    DSUILocStringForKey(CFSTR("FETCH_SHARING_FAILED"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", v9, v17, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)ds_alertControllerWithAppDeletionError:()DigitalSeparation
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

  v4 = a3;
  if (objc_msgSend(v4, "code") == 8)
  {
    objc_msgSend(v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE2CC10]);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x24BDD17C8];
    DSUILocStringForKey(CFSTR("DELETE_APP_FAILED_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BDD17C8];
    DSUILocStringForKey(CFSTR("DELETE_APP_FAILED_RESTRICTIONS"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", v8, v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    NSLog(CFSTR("Encountered an unhandled error while trying to delete an app: %@"), v4);
    v12 = 0;
  }

  return v12;
}

+ (id)ds_alertControllerWithStopPermissionSharingError:()DigitalSeparation
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "ds_localizedPermissionNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD1640];
  objc_msgSend(v5, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringByJoiningStrings:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v4, "underlyingErrors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v10)
  {

    goto LABEL_12;
  }
  v11 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v27;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v27 != v13)
        objc_enumerationMutation(v9);
      v12 |= objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "code") == 7;
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  }
  while (v11);

  if ((v12 & 1) == 0)
    goto LABEL_12;
  if (objc_msgSend(v5, "count") != 1)
  {
    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      v24 = (void *)MEMORY[0x24BDD17C8];
      DSUILocStringForKey(CFSTR("RESET_APP_PERMISSIONS_FAILED_RESTRICTIONS_MULTIPLE_APPS"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", v25, v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x24BDD17C8];
      goto LABEL_13;
    }
LABEL_12:
    DSUILocStringForKey(CFSTR("RESET_APP_PERMISSIONS_FAILED"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BDD17C8];
LABEL_13:
    v19 = CFSTR("RESET_APP_PERMISSIONS_FAILED_TITLE_MULTIPLE_APPS");
    goto LABEL_14;
  }
  v15 = (void *)MEMORY[0x24BDD17C8];
  DSUILocStringForKey(CFSTR("RESET_APP_PERMISSIONS_FAILED_RESTRICTIONS_SINGLE_APP"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", v16, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BDD17C8];
  v19 = CFSTR("RESET_APP_PERMISSIONS_FAILED_TITLE_SINGLE_APP");
LABEL_14:
  DSUILocStringForKey(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", v20, v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", v21, v17, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)ds_alertControllerContinuityUnpairError:()DigitalSeparation
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  DSUILocStringForKey(CFSTR("CONTINUITY_DISCONNECT_ERROR_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("CONTINUITY_DISCONNECT_ERROR_DETAIL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_variant_has_internal_content())
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n\nInternal Only: %@"), v6, v4);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
