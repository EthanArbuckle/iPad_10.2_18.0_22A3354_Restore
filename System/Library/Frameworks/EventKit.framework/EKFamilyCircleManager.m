@implementation EKFamilyCircleManager

+ (void)requestFamilyShareesWithCompletion:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D20EB0]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__EKFamilyCircleManager_requestFamilyShareesWithCompletion___block_invoke;
  v6[3] = &unk_1E4786828;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "startRequestWithCompletionHandler:", v6);

}

void __60__EKFamilyCircleManager_requestFamilyShareesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v23;
  id v24;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v23 = a3;
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v4, "members");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v11, "fullName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "appleID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[EKSharee shareeWithName:emailAddress:](EKSharee, "shareeWithName:emailAddress:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "firstName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setFirstName:", v15);

        objc_msgSend(v11, "lastName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setLastName:", v16);

        objc_msgSend(v11, "appleIDAliases");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setFamilyEmailAddressAliases:", v17);

        if (objc_msgSend(v11, "isMe"))
        {
          v18 = v14;

          v8 = v18;
        }
        else
        {
          objc_msgSend(v24, "addObject:", v14);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__EKFamilyCircleManager_requestFamilyShareesWithCompletion___block_invoke_2;
  block[3] = &unk_1E4786800;
  v19 = *(id *)(a1 + 32);
  v27 = v8;
  v28 = v19;
  v26 = v24;
  v20 = v8;
  v21 = v24;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __60__EKFamilyCircleManager_requestFamilyShareesWithCompletion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)isFamilyCalendar:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isPrimaryAppleAccount");

  if ((v9 & 1) != 0)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__EKFamilyCircleManager_isFamilyCalendar_completion___block_invoke;
    v10[3] = &unk_1E4786850;
    v11 = v6;
    v13 = a1;
    v12 = v7;
    objc_msgSend(a1, "requestFamilyShareesWithCompletion:", v10);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __53__EKFamilyCircleManager_isFamilyCalendar_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "sharees");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "isFamilyCalendarGivenCalendarSharees:familySharees:isPrimaryAppleAccount:", v5, v4, 1);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (BOOL)isFamilyCalendar:(id)a3 givenFamilySharees:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "sharees");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(a1, "isFamilyCalendarGivenCalendarSharees:familySharees:isPrimaryAppleAccount:", v8, v6, objc_msgSend(v9, "isPrimaryAppleAccount"));
  return (char)v7;
}

+ (BOOL)isFamilyCalendarGivenCalendarSharees:(id)a3 familySharees:(id)a4 isPrimaryAppleAccount:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  BOOL v20;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v5 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v5)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      v22 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v15 = v8;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v24;
            while (2)
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v24 != v18)
                  objc_enumerationMutation(v15);
                if ((objc_msgSend(v14, "isEqualToSharee:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j)) & 1) != 0)
                {

                  v20 = 1;
                  goto LABEL_21;
                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
              if (v17)
                continue;
              break;
            }
          }

          v12 = v22;
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        v20 = 0;
      }
      while (v11);
    }
    else
    {
      v20 = 0;
    }
LABEL_21:

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

@end
