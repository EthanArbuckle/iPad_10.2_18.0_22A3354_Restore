@implementation CNContactShareActionHelper

+ (BOOL)contactsHavePrivateProperties:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  +[CNContactCardFieldPicker privateCardPropertiesForContacts:](CNContactCardFieldPicker, "privateCardPropertiesForContacts:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__CNContactShareActionHelper_contactsHavePrivateProperties___block_invoke;
  v9[3] = &unk_1E204B3F8;
  v10 = v5;
  v11 = a1;
  v6 = v5;
  v7 = objc_msgSend(v4, "_cn_any:", v9);

  return v7;
}

+ (BOOL)contact:(id)a3 hasPrivateProperties:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  char v19;
  int v20;
  BOOL v21;
  uint64_t v23;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    v25 = *MEMORY[0x1E0C96668];
    v23 = *MEMORY[0x1E0D137F8];
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C971A0], "contactPropertiesByKey");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "valueForKey:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          if (objc_msgSend(v13, "isSingleValue"))
          {
            objc_msgSend(v13, "nilValue");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14 != v15)
            {
              v16 = v14;
LABEL_21:

              v21 = 1;
              goto LABEL_22;
            }
          }
          if (objc_msgSend(v13, "isMultiValue"))
          {
            objc_opt_class();
            v16 = v14;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v17 = v16;
            else
              v17 = 0;
            v18 = v17;

            if (objc_msgSend(v11, "isEqualToString:", v25))
            {
              v19 = objc_msgSend(a1, "contactHasShareableAddressingGrammarValue:", v5);

              v14 = v16;
              if ((v19 & 1) != 0)
                goto LABEL_21;
            }
            else
            {
              v20 = (*(uint64_t (**)(uint64_t, id))(v23 + 16))(v23, v18);

              if (!v20)
                goto LABEL_21;
            }
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v8)
        continue;
      break;
    }
  }
  v21 = 0;
LABEL_22:

  return v21;
}

+ (BOOL)contactsHaveShareableAddressingGrammarValue:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__CNContactShareActionHelper_contactsHaveShareableAddressingGrammarValue___block_invoke;
  v4[3] = &__block_descriptor_40_e19_B16__0__CNContact_8l;
  v4[4] = a1;
  return objc_msgSend(a3, "_cn_any:", v4);
}

+ (BOOL)contactHasShareableAddressingGrammarValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  char v7;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "valueForKey:", *MEMORY[0x1E0C96668]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = objc_msgSend(v6, "_cn_any:", &__block_literal_global_27734);
  return v7;
}

uint64_t __72__CNContactShareActionHelper_contactHasShareableAddressingGrammarValue___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;

  v2 = a2;
  objc_opt_class();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = (*(unsigned int (**)(void))(*MEMORY[0x1E0D137F0] + 16))() ^ 1;
  return v6;
}

uint64_t __74__CNContactShareActionHelper_contactsHaveShareableAddressingGrammarValue___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "contactHasShareableAddressingGrammarValue:", a2);
}

uint64_t __60__CNContactShareActionHelper_contactsHavePrivateProperties___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "contact:hasPrivateProperties:", a2, *(_QWORD *)(a1 + 32));
}

@end
