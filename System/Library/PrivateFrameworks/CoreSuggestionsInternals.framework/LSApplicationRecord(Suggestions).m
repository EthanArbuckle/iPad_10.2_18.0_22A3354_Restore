@implementation LSApplicationRecord(Suggestions)

- (uint64_t)sg_isAppleBundleIdentifier
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("com.apple."));

  return v2;
}

+ (id)sg_preferredApplicationRecordForUserActivityType:()Suggestions withTeamIdentifier:preferredBundleIdentifier:
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  char v38;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  id v55;
  _BYTE v56[128];
  uint8_t v57[128];
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  id v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "hasPrefix:", CFSTR("com.apple.")))
  {
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v9, 0, 0);
  }
  else if (v8)
  {
    v11 = (void *)_LSCopyAdvertisementStringForTeamIdentifierAndActivityType();
    if (v11)
    {
      v55 = 0;
      objc_msgSend(MEMORY[0x1E0CA5870], "applicationRecordsForUserActivityType:limit:error:", v11, 5, &v55);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v55;
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __130__LSApplicationRecord_Suggestions__sg_preferredApplicationRecordForUserActivityType_withTeamIdentifier_preferredBundleIdentifier___block_invoke;
      v53[3] = &unk_1E7DAB888;
      v14 = v8;
      v54 = v14;
      objc_msgSend(v12, "_pas_filteredArrayWithTest:", v53);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      sgEventsLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      v44 = v13;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_msgSend(v12, "count");
        v18 = objc_msgSend(v15, "count");
        *(_DWORD *)buf = 134219010;
        v59 = v17;
        v60 = 2048;
        v61 = v18;
        v62 = 2112;
        v63 = v14;
        v64 = 2112;
        v65 = v12;
        v66 = 2112;
        v67 = v15;
        _os_log_impl(&dword_1C3607000, v16, OS_LOG_TYPE_DEFAULT, "Filtered event records from %tu to %tu filtering for teamIdentifier %@: %@ -> %@", buf, 0x34u);
      }

      if (objc_msgSend(v15, "count") == 1
        && (objc_msgSend(v15, "firstObject"),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v19, "applicationState"),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            v21 = objc_msgSend(v20, "isInstalled"),
            v20,
            v19,
            v21))
      {
        objc_msgSend(v15, "firstObject");
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v15, "count"))
      {
        v43 = v15;
        if (v9)
        {
          v41 = v12;
          v42 = v11;
          v40 = v7;
          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          v22 = v15;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v50;
            do
            {
              for (i = 0; i != v24; ++i)
              {
                if (*(_QWORD *)v50 != v25)
                  objc_enumerationMutation(v22);
                v27 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
                objc_msgSend(v27, "applicationState");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v28, "isInstalled") & 1) != 0)
                {
                  objc_msgSend(v27, "bundleIdentifier");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = objc_msgSend(v29, "isEqualToString:", v9);

                  if ((v30 & 1) != 0)
                  {
                    v10 = v27;

                    goto LABEL_36;
                  }
                }
                else
                {

                }
              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
            }
            while (v24);
          }

          v10 = 0;
LABEL_36:
          v7 = v40;
LABEL_38:
          v12 = v41;
          v11 = v42;
          v13 = v44;
        }
        else
        {
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          v31 = v15;
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v46;
            v41 = v12;
            v42 = v11;
            while (2)
            {
              for (j = 0; j != v33; ++j)
              {
                if (*(_QWORD *)v46 != v34)
                  objc_enumerationMutation(v31);
                v36 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
                objc_msgSend(v36, "applicationState");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = objc_msgSend(v37, "isInstalled");

                if ((v38 & 1) != 0)
                {
                  v10 = v36;

                  goto LABEL_38;
                }
              }
              v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
              v12 = v41;
              v11 = v42;
              v13 = v44;
              if (v33)
                continue;
              break;
            }
          }

          v10 = 0;
        }
        v15 = v43;
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)sg_preferredApplicationRecordForURL:()Suggestions
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v10;
  id v11;

  v3 = a3;
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CA5838], "appLinksWithURL:limit:includeLinksForCurrentApplication:error:", v3, 1, 1, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  if (!objc_msgSend(v4, "count"))
  {
    v10 = v5;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA58A8]), "initWithURL:error:", v3, &v10);
    v8 = v10;

    if (v6)
    {
      objc_msgSend(v6, "bundleRecord");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_7:
        v5 = v8;
        goto LABEL_8;
      }

    }
    v7 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetApplicationRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v7;
}

+ (id)sg_applicationRecordForDefaultWebBrowser
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("http://"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LSApplicationRecord+Suggestions.m"), 112, CFSTR("HTTP URL should always construct"));

  }
  v10 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA58A8]), "initWithURL:error:", v4, &v10);
  v6 = v5;
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v5, "bundleRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    v7 = 0;
  }

  return v7;
}

@end
