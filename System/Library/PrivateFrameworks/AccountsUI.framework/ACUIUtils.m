@implementation ACUIUtils

+ (void)filterAccounts:(id)a3 toTopLevel:(id)a4 grouped:(id)a5 ignoringGroups:(id)a6
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  _QWORD __b[8];
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id location[2];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v28 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = 0;
  objc_storeStrong(&v26, a4);
  v25 = 0;
  objc_storeStrong(&v25, a5);
  v24 = 0;
  objc_storeStrong(&v24, a6);
  memset(__b, 0, sizeof(__b));
  v18 = location[0];
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
  if (v19)
  {
    v12 = *(_QWORD *)__b[2];
    v13 = 0;
    v14 = v19;
    while (1)
    {
      v11 = v13;
      if (*(_QWORD *)__b[2] != v12)
        objc_enumerationMutation(v18);
      v23 = *(_QWORD *)(__b[1] + 8 * v13);
      v21 = (id)objc_msgSend(v28, "_accountGroupIdentifier:ignoringGroups:", v23, v24);
      if (v21)
      {
        v10 = (id)objc_msgSend(v25, "objectForKey:", v21);
        v20 = (id)objc_msgSend(v10, "mutableCopy");

        if (!v20)
        {
          v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v7 = v20;
          v20 = v6;

        }
        objc_msgSend(v20, "addObject:", v23);
        v8 = v25;
        v9 = (id)objc_msgSend(v20, "copy");
        objc_msgSend(v8, "setObject:forKey:");

        objc_storeStrong(&v20, 0);
      }
      else
      {
        objc_msgSend(v26, "addObject:", v23);
      }
      objc_storeStrong(&v21, 0);
      ++v13;
      if (v11 + 1 >= v14)
      {
        v13 = 0;
        v14 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
        if (!v14)
          break;
      }
    }
  }

  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

+ (id)_accountGroupIdentifier:(id)a3 ignoringGroups:(id)a4
{
  id v6;
  id v7;
  char v8;
  id v9;
  id location[3];
  id v11;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v7 = (id)objc_msgSend(location[0], "accountType");
  v6 = (id)objc_msgSend(v7, "identifier");
  v8 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8F140]);

  if ((v8 & 1) == 0 || (objc_msgSend(v9, "containsObject:", *MEMORY[0x1E0C8F140]) & 1) != 0)
    v11 = 0;
  else
    v11 = (id)*MEMORY[0x1E0C8F140];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v11;
}

+ (id)sortedAccountsFromAccounts:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(id *, void *, void *);
  void *v10;
  id v11;
  id v12;
  id v13;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = ACUISortedAccountTypes();
  v4 = location[0];
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __40__ACUIUtils_sortedAccountsFromAccounts___block_invoke;
  v10 = &unk_1E9A15B70;
  v11 = v13;
  v12 = (id)objc_msgSend(v4, "sortedArrayUsingComparator:");
  v5 = v12;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v5;
}

uint64_t __40__ACUIUtils_sortedAccountsFromAccounts___block_invoke(id *a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13[2];
  id v14;
  id location[2];
  uint64_t v16;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v14 = 0;
  objc_storeStrong(&v14, a3);
  v13[1] = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = (id)objc_msgSend(location[0], "accountType");
    v13[0] = (id)objc_msgSend(v4, "identifier");

    v5 = (id)objc_msgSend(v14, "accountType");
    v12 = (id)objc_msgSend(v5, "identifier");

    v11 = objc_msgSend(a1[4], "indexOfObject:", v13[0]);
    v10 = objc_msgSend(a1[4], "indexOfObject:", v12);
    v7 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
    v6 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
    v16 = objc_msgSend(v7, "compare:");

    objc_storeStrong(&v12, 0);
    objc_storeStrong(v13, 0);
  }
  else
  {
    v16 = 0;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v16;
}

+ (id)sortedDataclassesFrom:(id)a3
{
  id v4;
  id v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F430]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F430]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F3D8]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F3D8]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F3D0]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F3D0]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F388]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F388]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F378]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F378]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F400]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F400]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F368]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F368]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F3B8]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F3B8]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F3F8]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F3F8]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F3F0]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F3F0]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F3B0]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F3B0]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F418]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F418]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F3C0]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F3C0]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F3C8]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F3C8]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F360]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F360]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F3A8]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F3A8]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F3E8]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F3E8]);
  v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v4;
}

@end
