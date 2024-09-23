@implementation SANPVideoLanguageOption(AFMediaRemoteUtilities)

+ (id)_languageOptionFromMediaRemoteRepresentation:()AFMediaRemoteUtilities
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _QWORD v33[10];
  _QWORD v34[11];

  v34[10] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MRLanguageOptionCopyIdentifier();
  if (v0)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0D88300]);
    objc_msgSend(v1, "setIdentifier:", v0);
    v2 = (void *)MRLanguageOptionCopyLanguageTag();
    objc_msgSend(v1, "setLanguageTag:", v2);

    v3 = (void *)MRLanguageOptionCopyDisplayName();
    objc_msgSend(v1, "setDisplayName:", v3);

    v4 = *MEMORY[0x1E0D88F28];
    v5 = *MEMORY[0x1E0D4C730];
    v33[0] = *MEMORY[0x1E0D4C738];
    v33[1] = v5;
    v6 = *MEMORY[0x1E0D88F20];
    v34[0] = v4;
    v34[1] = v6;
    v7 = *MEMORY[0x1E0D88EF8];
    v8 = *MEMORY[0x1E0D4C748];
    v33[2] = *MEMORY[0x1E0D4C708];
    v33[3] = v8;
    v9 = *MEMORY[0x1E0D88F38];
    v34[2] = v7;
    v34[3] = v9;
    v10 = *MEMORY[0x1E0D88F00];
    v11 = *MEMORY[0x1E0D4C728];
    v33[4] = *MEMORY[0x1E0D4C710];
    v33[5] = v11;
    v12 = *MEMORY[0x1E0D88F18];
    v34[4] = v10;
    v34[5] = v12;
    v13 = *MEMORY[0x1E0D88F08];
    v14 = *MEMORY[0x1E0D4C740];
    v33[6] = *MEMORY[0x1E0D4C718];
    v33[7] = v14;
    v15 = *MEMORY[0x1E0D88F30];
    v34[6] = v13;
    v34[7] = v15;
    v16 = *MEMORY[0x1E0D4C750];
    v33[8] = *MEMORY[0x1E0D4C720];
    v33[9] = v16;
    v17 = *MEMORY[0x1E0D88F40];
    v34[8] = *MEMORY[0x1E0D88F10];
    v34[9] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MRLanguageOptionCopyCharacteristics();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v19, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v21 = v19;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v29 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(v18, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), (_QWORD)v28);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
            objc_msgSend(v20, "addObject:", v26);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v23);
    }

    objc_msgSend(v1, "setCharacteristics:", v20);
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

@end
