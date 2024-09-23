@implementation ACUILocalization

+ (id)localizedTitleForLocalSourceOfDataclass:(id)a3 usedAtBeginningOfSentence:(BOOL)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v12;
  id v13;
  BOOL v14;
  id location[3];
  id v16;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = a4;
  v13 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  v12 = (id)objc_msgSend(v13, "tetheredSyncSourceTypeForDataclass:", location[0]);
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("OSX")) & 1) != 0)
  {
    if (v14)
    {
      v10 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v16 = (id)objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FROM_MY_COMPUTER_TYPE_MAC"), &stru_1E9A15E98, CFSTR("Localizable"));

    }
    else
    {
      v9 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v16 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FROM_MY_COMPUTER_TYPE_MAC_MID_SENTENCE"), &stru_1E9A15E98, CFSTR("Localizable"));

    }
  }
  else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Windows")) & 1) != 0)
  {
    if (v14)
    {
      v8 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v16 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FROM_MY_COMPUTER_TYPE_PC"), &stru_1E9A15E98, CFSTR("Localizable"));

    }
    else
    {
      v7 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v16 = (id)objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FROM_MY_COMPUTER_TYPE_PC_MID_SENTENCE"), &stru_1E9A15E98, CFSTR("Localizable"));

    }
  }
  else if (v14)
  {
    v6 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (id)objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ON_MY_DEVICE_TYPE"), &stru_1E9A15E98, CFSTR("Localizable"));

  }
  else
  {
    v5 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (id)objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ON_MY_DEVICE_TYPE_MID_SENTENCE"), &stru_1E9A15E98, CFSTR("Localizable"));

  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v16;
}

+ (id)localizedTextForDataclasses:(id)a3 usedAtBeginningOfSentence:(BOOL)a4
{
  id v6;
  id location[2];
  id v8;

  v8 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = (id)objc_msgSend(v8, "localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:", location[0], a4, 0);
  objc_storeStrong(location, 0);
  return v6;
}

+ (id)localizedTextForDataclasses:(id)a3 usedAtBeginningOfSentence:(BOOL)a4 forAccount:(id)a5
{
  id v5;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v27;
  uint64_t v28;
  id v29;
  _QWORD __b[8];
  void *v31;
  id v32;
  id v33;
  id v34;
  BOOL v35;
  id location[2];
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v37 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = a4;
  v34 = 0;
  objc_storeStrong(&v34, a5);
  v33 = (id)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v32 = location[0];
  memset(__b, 0, sizeof(__b));
  v27 = v32;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", __b, v38, 16);
  if (v28)
  {
    v22 = *(_QWORD *)__b[2];
    v23 = 0;
    v24 = v28;
    while (1)
    {
      v21 = v23;
      if (*(_QWORD *)__b[2] != v22)
        objc_enumerationMutation(v27);
      v31 = *(void **)(__b[1] + 8 * v23);
      v29 = CFSTR("WARNING");
      if (objc_msgSend(v33, "length"))
      {
        v19 = v31;
        v5 = (id)objc_msgSend(v32, "lastObject");
        v20 = v19 != v5;

        if (v20)
        {
          v13 = v33;
          v15 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v14 = (id)objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("MIDDLE_SEPARATOR"), &stru_1E9A15E98, CFSTR("Localizable"));
          objc_msgSend(v13, "appendString:");

        }
        else
        {
          v16 = v33;
          v18 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v17 = (id)objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("LAST_SEPARATOR"), &stru_1E9A15E98, CFSTR("Localizable"));
          objc_msgSend(v16, "appendString:");

        }
      }
      else if (v35)
      {
        objc_storeStrong(&v29, CFSTR("LABEL"));
      }
      v11 = v33;
      v12 = (id)objc_msgSend(v37, "localizedStringForDataclass:withSuffix:forAccount:", v31, v29);
      objc_msgSend(v11, "appendString:");

      objc_storeStrong(&v29, 0);
      ++v23;
      if (v21 + 1 >= v24)
      {
        v23 = 0;
        v24 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", __b, v38, 16);
        if (!v24)
          break;
      }
    }
  }

  if (!objc_msgSend(v33, "length"))
  {
    v8 = v33;
    v10 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (id)objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DATA"), &stru_1E9A15E98, CFSTR("Localizable"));
    objc_msgSend(v8, "appendString:");

  }
  v7 = v33;
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
  return v7;
}

+ (id)localizedTitleForDataclass:(id)a3
{
  id v4;
  id location[2];
  id v6;

  v6 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (id)objc_msgSend(v6, "localizedTitleForDataclass:forAccount:", location[0], 0);
  objc_storeStrong(location, 0);
  return v4;
}

+ (id)localizedTitleForDataclass:(id)a3 forAccount:(id)a4
{
  id v6;
  id v7;
  id location[2];
  id v9;

  v9 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v6 = (id)objc_msgSend(v9, "localizedStringForDataclass:withSuffix:forAccount:", location[0], CFSTR("TITLE"), v7);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6;
}

+ (id)localizedReferenceToLocalSourceOfDataclass:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id location[3];
  id v10;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  v7 = (id)objc_msgSend(v8, "tetheredSyncSourceTypeForDataclass:", location[0]);
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("OSX")) & 1) != 0)
  {
    v6 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (id)objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SYNCED_WITH_YOUR_COMPUTER_TYPE_MAC_MID_SENTENCE"), &stru_1E9A15E98, CFSTR("Localizable"));

  }
  else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Windows")) & 1) != 0)
  {
    v5 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (id)objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SYNCED_WITH_YOUR_COMPUTER_TYPE_PC_MID_SENTENCE"), &stru_1E9A15E98, CFSTR("Localizable"));

  }
  else
  {
    v4 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (id)objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ON_YOUR_DEVICE_TYPE_MID_SENTENCE"), &stru_1E9A15E98, CFSTR("Localizable"));

  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v10;
}

+ (id)localizedStringForDataclass:(id)a3 withSuffix:(id)a4 forAccount:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  void *v21;
  id v22;
  BOOL v23;
  ACUIAccountViewProvidersManager *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  int v33;
  id v34;
  id v35;
  id v36;
  id location[3];
  id v38;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v36 = 0;
  objc_storeStrong(&v36, a4);
  v35 = 0;
  objc_storeStrong(&v35, a5);
  v26 = +[ACUIAccountViewProvidersManager sharedInstance](ACUIAccountViewProvidersManager, "sharedInstance");
  v34 = -[ACUIAccountViewProvidersManager localizedStringForDataclass:withSuffix:forAccount:](v26, "localizedStringForDataclass:withSuffix:forAccount:", location[0], v36, v35);

  if (v34)
  {
    v38 = v34;
    v33 = 1;
  }
  else
  {
    if ((objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x1E0C8F390]) & 1) != 0)
      objc_storeStrong(location, (id)*MEMORY[0x1E0C8F388]);
    if ((objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x1E0C8F430]) & 1) != 0)
      objc_storeStrong(location, CFSTR("com.apple.Dataclass.CloudDrive"));
    v32 = 0;
    if ((objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x1E0C8F3A8]) & 1) != 0)
    {
      objc_storeStrong(&v32, CFSTR("FIND_MY"));
    }
    else if ((objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x1E0C8EEE0]) & 1) != 0)
    {
      v22 = (id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v23 = objc_msgSend(v22, "userInterfaceIdiom") != 0;

      if (v23)
      {
        v19 = (id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v20 = objc_msgSend(v19, "userInterfaceIdiom") != 4;

        if (v20)
          objc_storeStrong(&v32, CFSTR("FACETIME"));
        else
          objc_storeStrong(&v32, CFSTR("PHONE_AND_FACETIME"));
      }
      else
      {
        v31 = CFSTR("com.apple.facetime");
        v30 = 0;
        v5 = objc_alloc(MEMORY[0x1E0CA5870]);
        v28 = v30;
        v21 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:allowPlaceholder:error:", v31, 0, &v28);
        objc_storeStrong(&v30, v28);
        v29 = v21;
        if (v21)
          objc_storeStrong(&v32, CFSTR("PHONE_AND_FACETIME"));
        else
          objc_storeStrong(&v32, CFSTR("PHONE"));
        objc_storeStrong(&v29, 0);
        objc_storeStrong(&v30, 0);
        objc_storeStrong(&v31, 0);
      }
    }
    else
    {
      v27 = objc_msgSend(location[0], "rangeOfString:options:", CFSTR("."), 4);
      v6 = (id)objc_msgSend(location[0], "substringFromIndex:", v27 + 1);
      v7 = v32;
      v32 = v6;

      v8 = (id)objc_msgSend(v32, "uppercaseString");
      v9 = v32;
      v32 = v8;

    }
    if (objc_msgSend(v36, "length"))
    {
      v10 = (id)objc_msgSend(v32, "stringByAppendingFormat:", CFSTR("_%@"), v36);
      v11 = v32;
      v32 = v10;

    }
    v18 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (id)objc_msgSend(v18, "localizedStringForKey:value:table:", v32, &stru_1E9A15E98, CFSTR("Localizable"));
    v13 = v34;
    v34 = v12;

    if ((objc_msgSend(v34, "isEqualToString:", v32) & 1) != 0)
    {
      v17 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v14 = (id)objc_msgSend(v17, "localizedStringForKey:value:table:", v32, &stru_1E9A15E98, CFSTR("Payment_Localizable"));
      v15 = v34;
      v34 = v14;

    }
    v38 = v34;
    v33 = 1;
    objc_storeStrong(&v32, 0);
  }
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
  return v38;
}

@end
