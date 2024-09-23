@implementation HKFamilyCircleUtilities

+ (void)fetchFamilyContacts:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) == 3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D20EB0]);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __47__HKFamilyCircleUtilities_fetchFamilyContacts___block_invoke;
    v5[3] = &unk_1E9C464E0;
    v6 = v3;
    objc_msgSend(v4, "startRequestWithCompletionHandler:", v5);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 110, CFSTR("Unauthorized for Contact's access."));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v3 + 2))(v3, 0, v4);
  }

}

void __47__HKFamilyCircleUtilities_fetchFamilyContacts___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v3, "members", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if ((objc_msgSend(v10, "isMe") & 1) == 0)
          {
            objc_msgSend(v10, "contact");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (v11)
            {
              objc_msgSend(v10, "contact");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "contact");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "identifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v14);

            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v7);
    }

    v15 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "allValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v15 + 16))(v15, v16, 0);

  }
  else
  {
    v17 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 2000, CFSTR("Unable to start the family circle request."));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v18);

  }
}

@end
