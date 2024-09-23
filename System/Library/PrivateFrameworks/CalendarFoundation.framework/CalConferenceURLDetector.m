@implementation CalConferenceURLDetector

+ (id)conferenceURLFromSources:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v34;
    v27 = v4;
    v25 = *(_QWORD *)v34;
    do
    {
      v10 = 0;
      v26 = v6;
      do
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v10);
        if (objc_msgSend(v11, "length", v25))
        {
          v28 = (unint64_t)v7;
          objc_msgSend(a1, "_URLsInSource:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v13 = v12;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v30;
            while (2)
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v30 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
                if (objc_msgSend(v18, "resultType") == 32)
                {
                  objc_msgSend(v18, "URL");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(a1, "decodeIfSafeLink:", v19);
                  v20 = (id)objc_claimAutoreleasedReturnValue();

                  if ((objc_msgSend((id)objc_opt_class(), "isPreferredURL:", v20) & 1) != 0)
                  {

                    v4 = v27;
                    v7 = (void *)v28;
                    goto LABEL_36;
                  }
                  if (!v8)
                  {
                    if (objc_msgSend(a1, "_isValidTelURL:", v20))
                      v8 = (unint64_t)v20;
                    else
                      v8 = 0;
                  }

                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
              if (v15)
                continue;
              break;
            }
          }

          v4 = v27;
          v7 = (void *)v28;
          v6 = v26;
          if (!(v8 | v28))
          {
            objc_msgSend(a1, "_firstPhoneNumberInSource:", v11);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v21, "resultType") == 2048)
            {
              objc_msgSend(v21, "phoneNumber");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "phoneURL");
              v7 = (void *)objc_claimAutoreleasedReturnValue();

              v6 = v26;
            }
            else
            {
              v7 = 0;
            }

          }
          v9 = v25;
        }
        ++v10;
      }
      while (v10 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }

  if (v8)
    v23 = (void *)v8;
  else
    v23 = v7;
  v20 = v23;
LABEL_36:

  return v20;
}

+ (id)googleMeetURLsAndPhoneNumbersFromSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_linksInSource:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (objc_msgSend(v11, "resultType") == 32)
        {
          objc_msgSend(v11, "URL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend((id)objc_opt_class(), "_isGoogleMeetURL:", v12))
            objc_msgSend(v5, "addObject:", v11);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v8);
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        if (objc_msgSend(v18, "resultType") == 32)
        {
          objc_msgSend(v18, "URL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend((id)objc_opt_class(), "isPreferredURL:", v19)
            && (objc_msgSend((id)objc_opt_class(), "_isGoogleMeetURL:", v19) & 1) == 0)
          {
            objc_msgSend(v5, "addObject:", v18);
          }

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v15);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = v13;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v31;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * k);
        if (objc_msgSend(v25, "resultType", (_QWORD)v30) == 32)
        {
          objc_msgSend(v25, "URL");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(a1, "_isValidTelURL:", v26))
            objc_msgSend(v5, "addObject:", v25);

        }
        else if (objc_msgSend(v25, "resultType") == 2048)
        {
          objc_msgSend(v25, "phoneNumber");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "phoneURL");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
            objc_msgSend(v5, "addObject:", v25);
        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v22);
  }

  return v5;
}

+ (id)_linksInSource:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_dataDetector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_URLsInSource:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__5;
  v21 = __Block_byref_object_dispose__5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  v16 = 0;
  objc_msgSend((id)objc_opt_class(), "_URLDataDetector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "length");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__CalConferenceURLDetector__URLsInSource___block_invoke;
  v10[3] = &unk_1E2A84AD8;
  v10[4] = &v11;
  v10[5] = &v17;
  v10[6] = a1;
  objc_msgSend(v5, "enumerateMatchesInString:options:range:usingBlock:", v4, 2, 0, v6, v10);

  if (v12[5])
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (id)v18[5];
  }
  v8 = v7;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __42__CalConferenceURLDetector__URLsInSource___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a2;
  if (v7)
  {
    v11 = v7;
    v8 = objc_msgSend(v7, "resultType") == 32;
    v7 = v11;
    if (v8)
    {
      objc_msgSend(v11, "URL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "decodeIfSafeLink:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(*(id *)(a1 + 48), "isPreferredURL:", v10))
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
        *a4 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v11);
      }

      v7 = v11;
    }
  }

}

+ (id)_firstPhoneNumberInSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_phoneNumberDataDetector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)decodeIfSafeLink:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_microsoftSafeLinkPrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsString:", v7);

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v5, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        v18 = 0;
        goto LABEL_17;
      }
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v21 = v9;
      objc_msgSend(v9, "queryItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v23 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_msgSend(v15, "name");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("url"));

            if ((v17 & 1) != 0)
            {
              objc_msgSend(v15, "value");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v19);
              v18 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_17;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v12)
            continue;
          break;
        }
      }

    }
    v18 = v5;
LABEL_17:

    goto LABEL_18;
  }
  v18 = 0;
LABEL_18:

  return v18;
}

+ (BOOL)isPreferredURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4
    && (objc_msgSend(a1, "_hasDisallowedPathExtension:", v4) & 1) == 0
    && objc_msgSend(a1, "_hasValidPath:", v4))
  {
    objc_msgSend(v4, "cal_hostAfterGoogleRedirects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(a1, "_preferredHostSuffixes", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(v5, "hasSuffix:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i)) & 1) != 0)
          {

            v11 = 1;
            goto LABEL_16;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }

    v11 = objc_msgSend(a1, "isTUConversationLink:", v4);
LABEL_16:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)isTUConversationLink:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "host");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(MEMORY[0x1E0DBD290], "baseURLs", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "host");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "isEqualToString:", v3);

          if ((v9 & 1) != 0)
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

+ (BOOL)_isGoogleMeetURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (v4
    && (objc_msgSend(a1, "_hasDisallowedPathExtension:", v4) & 1) == 0
    && objc_msgSend(a1, "_hasValidPath:", v4))
  {
    objc_msgSend(v4, "cal_hostAfterGoogleRedirects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_googleMeetSuffix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "hasSuffix:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)_isValidTelURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  if (objc_msgSend(v3, "cal_hasSchemeTel"))
  {
    objc_msgSend(v3, "resourceSpecifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), &stru_1E2A86598);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)_hasValidPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(a3, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "length")
    && (objc_msgSend(v5, "length") != 1 || (objc_msgSend(v5, "hasPrefix:", CFSTR("/")) & 1) == 0);

  return v6;
}

+ (BOOL)_hasDisallowedPathExtension:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (_hasDisallowedPathExtension__onceToken != -1)
    dispatch_once(&_hasDisallowedPathExtension__onceToken, &__block_literal_global_18);
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    v5 = objc_msgSend((id)_hasDisallowedPathExtension__disallowedPathExtensions, "containsObject:", v4);
  else
    v5 = 0;

  return v5;
}

void __56__CalConferenceURLDetector__hasDisallowedPathExtension___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E2A9B620);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_hasDisallowedPathExtension__disallowedPathExtensions;
  _hasDisallowedPathExtension__disallowedPathExtensions = v0;

}

+ (id)_googleMeetSuffix
{
  if (_googleMeetSuffix_onceToken != -1)
    dispatch_once(&_googleMeetSuffix_onceToken, &__block_literal_global_33_0);
  return (id)_googleMeetSuffix_suffix;
}

void __45__CalConferenceURLDetector__googleMeetSuffix__block_invoke()
{
  void *v0;

  v0 = (void *)_googleMeetSuffix_suffix;
  _googleMeetSuffix_suffix = (uint64_t)CFSTR("meet.google.com");

}

+ (id)_microsoftSafeLinkPrefix
{
  if (_microsoftSafeLinkPrefix_onceToken != -1)
    dispatch_once(&_microsoftSafeLinkPrefix_onceToken, &__block_literal_global_36_0);
  return (id)_microsoftSafeLinkPrefix_prefix;
}

void __52__CalConferenceURLDetector__microsoftSafeLinkPrefix__block_invoke()
{
  void *v0;

  v0 = (void *)_microsoftSafeLinkPrefix_prefix;
  _microsoftSafeLinkPrefix_prefix = (uint64_t)CFSTR("safelinks.protection.outlook.com");

}

+ (id)_preferredHostSuffixes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CalConferenceURLDetector__preferredHostSuffixes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_preferredHostSuffixes_onceToken != -1)
    dispatch_once(&_preferredHostSuffixes_onceToken, block);
  return (id)_preferredHostSuffixes_preferredSuffixes;
}

void __50__CalConferenceURLDetector__preferredHostSuffixes__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[23];

  v4[22] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR(".webex.com");
  v4[1] = CFSTR(".webex.com.cn");
  v4[2] = CFSTR(".dmz.webex.com");
  v4[3] = CFSTR("web.ciscospark.com");
  v4[4] = CFSTR(".skype.com");
  v4[5] = CFSTR("meetings.ringcentral.com");
  objc_msgSend(*(id *)(a1 + 32), "_googleMeetSuffix");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[6] = v1;
  v4[7] = CFSTR("zoom.us");
  v4[8] = CFSTR("teams.microsoft.com");
  v4[9] = CFSTR("teams.microsoft.us");
  v4[10] = CFSTR("teams.live.com");
  v4[11] = CFSTR("teams.microsoftonline.cn");
  v4[12] = CFSTR("messenger.com");
  v4[13] = CFSTR("msngr.com");
  v4[14] = CFSTR("line.me");
  v4[15] = CFSTR("telegram.me");
  v4[16] = CFSTR("duo.app.goo.gl");
  v4[17] = CFSTR("transcripts.gotomeeting.com");
  v4[18] = CFSTR("gotomeet.me");
  v4[19] = CFSTR("bluejeans.com");
  v4[20] = CFSTR("join.me");
  v4[21] = CFSTR("call.whatsapp.com");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 22);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_preferredHostSuffixes_preferredSuffixes;
  _preferredHostSuffixes_preferredSuffixes = v2;

}

+ (id)_dataDetector
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CalConferenceURLDetector__dataDetector__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_dataDetector_onceToken != -1)
    dispatch_once(&_dataDetector_onceToken, block);
  return (id)_dataDetector_dataDetector;
}

void __41__CalConferenceURLDetector__dataDetector__block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  BOOL v3;
  NSObject *v4;
  uint8_t v5[8];
  id v6;

  v6 = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3560]), "initWithTypes:error:", 2080, &v6);
  v1 = v6;
  v2 = (void *)_dataDetector_dataDetector;
  _dataDetector_dataDetector = v0;

  if (_dataDetector_dataDetector)
    v3 = 1;
  else
    v3 = v1 == 0;
  if (!v3)
  {
    objc_msgSend((id)objc_opt_class(), "logHandle");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18FC12000, v4, OS_LOG_TYPE_DEFAULT, "Error initializing the data detector.", v5, 2u);
    }

  }
}

+ (id)_URLDataDetector
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CalConferenceURLDetector__URLDataDetector__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_URLDataDetector_onceToken != -1)
    dispatch_once(&_URLDataDetector_onceToken, block);
  return (id)_URLDataDetector_dataDetector;
}

void __44__CalConferenceURLDetector__URLDataDetector__block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  BOOL v3;
  NSObject *v4;
  uint8_t v5[8];
  id v6;

  v6 = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3560]), "initWithTypes:error:", 32, &v6);
  v1 = v6;
  v2 = (void *)_URLDataDetector_dataDetector;
  _URLDataDetector_dataDetector = v0;

  if (_URLDataDetector_dataDetector)
    v3 = 1;
  else
    v3 = v1 == 0;
  if (!v3)
  {
    objc_msgSend((id)objc_opt_class(), "logHandle");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18FC12000, v4, OS_LOG_TYPE_DEFAULT, "Error initializing the data detector.", v5, 2u);
    }

  }
}

+ (id)_phoneNumberDataDetector
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CalConferenceURLDetector__phoneNumberDataDetector__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_phoneNumberDataDetector_onceToken != -1)
    dispatch_once(&_phoneNumberDataDetector_onceToken, block);
  return (id)_phoneNumberDataDetector_dataDetector;
}

void __52__CalConferenceURLDetector__phoneNumberDataDetector__block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  BOOL v3;
  NSObject *v4;
  uint8_t v5[8];
  id v6;

  v6 = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3560]), "initWithTypes:error:", 2048, &v6);
  v1 = v6;
  v2 = (void *)_phoneNumberDataDetector_dataDetector;
  _phoneNumberDataDetector_dataDetector = v0;

  if (_phoneNumberDataDetector_dataDetector)
    v3 = 1;
  else
    v3 = v1 == 0;
  if (!v3)
  {
    objc_msgSend((id)objc_opt_class(), "logHandle");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18FC12000, v4, OS_LOG_TYPE_DEFAULT, "Error initializing the data detector.", v5, 2u);
    }

  }
}

+ (id)logHandle
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CalConferenceURLDetector_logHandle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (logHandle_onceToken_1 != -1)
    dispatch_once(&logHandle_onceToken_1, block);
  return (id)logHandle_logHandle_1;
}

void __37__CalConferenceURLDetector_logHandle__block_invoke()
{
  objc_class *v0;
  os_log_t v1;
  void *v2;
  id v3;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.CalendarFoundation", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)logHandle_logHandle_1;
  logHandle_logHandle_1 = (uint64_t)v1;

}

@end
