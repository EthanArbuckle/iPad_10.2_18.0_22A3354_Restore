@implementation _WKWebExtensionWebNavigationURLFilter

- (_WKWebExtensionWebNavigationURLFilter)initWithDictionary:(id)a3 outErrorMessage:(id *)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _WKWebExtensionWebNavigationURLFilter *v13;
  void *v14;
  void *v16;
  void *v17;
  id v19;
  id v20;
  objc_super v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  _QWORD v37[20];
  _QWORD v38[20];
  uint64_t v39;
  const __CFString *v40;
  void *v41;
  _QWORD v42[3];

  v42[1] = *MEMORY[0x1E0C80C00];
  v20 = a3;
  if ((byte_1ECE71D12 & 1) == 0)
  {
    v42[0] = CFSTR("url");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
    qword_1ECE71D28 = objc_claimAutoreleasedReturnValue();
    byte_1ECE71D12 = 1;
  }
  if ((byte_1ECE71D13 & 1) == 0)
  {
    v40 = CFSTR("url");
    v39 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    qword_1ECE71D30 = objc_claimAutoreleasedReturnValue();

    byte_1ECE71D13 = 1;
  }
  if (WebKit::validateDictionary(v20, CFSTR("filters"), (void *)qword_1ECE71D28, (void *)qword_1ECE71D30, a4))
  {
    if ((byte_1ECE71D14 & 1) == 0)
    {
      v37[0] = CFSTR("hostContains");
      v38[0] = objc_opt_class();
      v37[1] = CFSTR("hostEquals");
      v38[1] = objc_opt_class();
      v37[2] = CFSTR("hostPrefix");
      v38[2] = objc_opt_class();
      v37[3] = CFSTR("hostSuffix");
      v38[3] = objc_opt_class();
      v37[4] = CFSTR("pathContains");
      v38[4] = objc_opt_class();
      v37[5] = CFSTR("pathEquals");
      v38[5] = objc_opt_class();
      v37[6] = CFSTR("pathPrefix");
      v38[6] = objc_opt_class();
      v37[7] = CFSTR("pathSuffix");
      v38[7] = objc_opt_class();
      v37[8] = CFSTR("queryContains");
      v38[8] = objc_opt_class();
      v37[9] = CFSTR("queryEquals");
      v38[9] = objc_opt_class();
      v37[10] = CFSTR("queryPrefix");
      v38[10] = objc_opt_class();
      v37[11] = CFSTR("querySuffix");
      v38[11] = objc_opt_class();
      v37[12] = CFSTR("urlContains");
      v38[12] = objc_opt_class();
      v37[13] = CFSTR("urlEquals");
      v38[13] = objc_opt_class();
      v37[14] = CFSTR("urlMatches");
      v38[14] = objc_opt_class();
      v37[15] = CFSTR("originAndPathMatches");
      v38[15] = objc_opt_class();
      v37[16] = CFSTR("urlPrefix");
      v38[16] = objc_opt_class();
      v37[17] = CFSTR("urlSuffix");
      v38[17] = objc_opt_class();
      v37[18] = CFSTR("schemes");
      v36 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v38[18] = v17;
      v37[19] = CFSTR("ports");
      v38[19] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 20);
      qword_1ECE71D38 = objc_claimAutoreleasedReturnValue();

      byte_1ECE71D14 = 1;
    }
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("url"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v32 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (!WebKit::validateDictionary(v9, CFSTR("url"), 0, (void *)qword_1ECE71D38, a4))
            goto LABEL_26;
          v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v25 = 0;
          v26 = &v25;
          v27 = 0x3032000000;
          v28 = __Block_byref_object_copy__0;
          v29 = __Block_byref_object_dispose__0;
          v30 = 0;
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __76___WKWebExtensionWebNavigationURLFilter_initWithDictionary_outErrorMessage___block_invoke;
          v22[3] = &unk_1E34AB2D8;
          v24 = &v25;
          v11 = v10;
          v23 = v11;
          objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v22);
          v12 = (void *)v26[5];
          if (v12)
            *a4 = objc_retainAutorelease(v12);
          else
            objc_msgSend(v19, "addObject:", v11);

          _Block_object_dispose(&v25, 8);
          if (v12)
          {
LABEL_26:

            v13 = 0;
            goto LABEL_27;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v6)
          continue;
        break;
      }
    }

    v21.receiver = self;
    v21.super_class = (Class)_WKWebExtensionWebNavigationURLFilter;
    v13 = -[_WKWebExtensionWebNavigationURLFilter init](&v21, sel_init);
    if (v13)
    {
      if (objc_msgSend(v19, "count"))
        v14 = v19;
      else
        v14 = 0;
      objc_storeStrong((id *)&v13->_predicateGroups, v14);
      v13 = v13;
      self = v13;
    }
    else
    {
      self = 0;
    }
LABEL_27:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)matchesURL:(id)a3
{
  id v4;
  NSArray *predicateGroups;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  predicateGroups = self->_predicateGroups;
  if (predicateGroups)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = predicateGroups;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v22;
      while (1)
      {
        v9 = 0;
LABEL_5:
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (!v12)
          break;
        v13 = *(_QWORD *)v18;
LABEL_9:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v11);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "matchesURL:", v4) & 1) == 0)
            break;
          if (v12 == ++v14)
          {
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            if (v12)
              goto LABEL_9;
            goto LABEL_19;
          }
        }

        if (++v9 != v7)
          goto LABEL_5;
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        v15 = 0;
        if (!v7)
          goto LABEL_22;
      }
LABEL_19:

      v15 = 1;
    }
    else
    {
      v15 = 0;
    }
LABEL_22:

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicateGroups, 0);
}

@end
