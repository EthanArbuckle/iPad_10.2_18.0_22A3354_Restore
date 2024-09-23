@implementation CLSSocialServiceCoreDuet

- (id)coreDuetPersonSuggestionsOnDate:(id)a3 contactsService:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0D15908], "peopleSuggester");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15910], "currentContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setDate:", v21);
  objc_msgSend(v24, "setContext:", v23);
  objc_msgSend(MEMORY[0x1E0D15918], "defaultSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAggregateByIdentifier:", 1);
  objc_msgSend(v24, "setSettings:", v22);
  v37 = 0;
  objc_msgSend(v24, "suggestPeopleWithError:", &v37);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v37;
  v19 = v6;
  if (v6)
  {
    NSLog(CFSTR("Error fetching people suggestions from CoreDuet _CDPeopleSuggester: %@"), v6, v6, v20);
    v25 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v7 = v20;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v34 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "contact");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            objc_msgSend(v11, "identifier");
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = (void *)v13;
            if (v13)
            {
              v29 = 0;
              v30 = &v29;
              v31 = 0x2020000000;
              v32 = 0;
              v38 = v13;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v26[0] = MEMORY[0x1E0C809B0];
              v26[1] = 3221225472;
              v26[2] = __76__CLSSocialServiceCoreDuet_coreDuetPersonSuggestionsOnDate_contactsService___block_invoke;
              v26[3] = &unk_1E84F86F8;
              v16 = v25;
              v27 = v16;
              v28 = &v29;
              objc_msgSend(v5, "enumeratePersonsForIdentifiers:usingBlock:", v15, v26);

              if (!*((_BYTE *)v30 + 24))
              {
                objc_msgSend(v5, "personForPersonHandle:", v14);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (v17)
                  objc_msgSend(v16, "addObject:", v17);

              }
              _Block_object_dispose(&v29, 8);
            }

          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v8);
    }

  }
  return v25;
}

uint64_t __76__CLSSocialServiceCoreDuet_coreDuetPersonSuggestionsOnDate_contactsService___block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  uint64_t v4;

  if (a2)
  {
    v4 = result;
    result = objc_msgSend(*(id *)(result + 32), "addObject:", a2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

@end
