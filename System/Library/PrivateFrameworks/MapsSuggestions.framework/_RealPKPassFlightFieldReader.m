@implementation _RealPKPassFlightFieldReader

- (void)loadPass:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSDictionary *semantics;
  void *v7;
  NSDictionary *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  NSDictionary *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  BOOL v31;
  uint64_t v32;
  uint64_t m;
  void *v34;
  NSDictionary *v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t n;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  BOOL v45;
  NSDictionary *fields;
  _RealPKPassFlightFieldReader *v47;
  id v48;
  id v49;
  id obj;
  id obja;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "allSemantics", v4);
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  semantics = self->_semantics;
  self->_semantics = v5;

  v49 = v4;
  v48 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v47 = self;
  objc_msgSend(v49, "primaryFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (NSDictionary *)v48;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v71 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        objc_msgSend(v13, "key");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "value");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v14)
          v17 = v15 == 0;
        else
          v17 = 1;
        if (!v17)
          -[NSDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v15, v14);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
    }
    while (v10);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend(v49, "frontFieldBuckets");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, &v70, 16);
  if (v18)
  {
    v52 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v59 != v52)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
        v21 = v8;
        v22 = v20;
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v23 = v22;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
        if (v24)
        {
          v25 = *(_QWORD *)v67;
          do
          {
            for (k = 0; k != v24; ++k)
            {
              if (*(_QWORD *)v67 != v25)
                objc_enumerationMutation(v23);
              v27 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * k);
              objc_msgSend(v27, "key");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "value");
              v29 = objc_claimAutoreleasedReturnValue();
              v30 = (void *)v29;
              if (v28)
                v31 = v29 == 0;
              else
                v31 = 1;
              if (!v31)
                -[NSDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v29, v28);

            }
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
          }
          while (v24);
        }

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, &v70, 16);
    }
    while (v18);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend(v49, "backFieldBuckets");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v54, &v66, 16);
  if (v32)
  {
    v53 = *(_QWORD *)v55;
    do
    {
      for (m = 0; m != v32; ++m)
      {
        if (*(_QWORD *)v55 != v53)
          objc_enumerationMutation(obja);
        v34 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * m);
        v35 = v8;
        v36 = v34;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v37 = v36;
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
        if (v38)
        {
          v39 = *(_QWORD *)v63;
          do
          {
            for (n = 0; n != v38; ++n)
            {
              if (*(_QWORD *)v63 != v39)
                objc_enumerationMutation(v37);
              v41 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * n);
              objc_msgSend(v41, "key");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "value");
              v43 = objc_claimAutoreleasedReturnValue();
              v44 = (void *)v43;
              if (v42)
                v45 = v43 == 0;
              else
                v45 = 1;
              if (!v45)
                -[NSDictionary setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v43, v42);

            }
            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
          }
          while (v38);
        }

      }
      v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v54, &v66, 16);
    }
    while (v32);
  }

  fields = v47->_fields;
  v47->_fields = v8;

}

- (id)combinedFlightCode
{
  void *v3;
  NSDictionary *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*MEMORY[0x1E0D6A9F8];
  v4 = self->_semantics;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A980]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9B8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA58]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA70]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA78]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA80]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A948]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A950]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A960]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA60]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA68]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA30]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA38]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA40]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA48]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", v3) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A920]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A968]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A970]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A998]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A978]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9A0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9A8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9D0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9B0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A988]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A990]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9C0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9C8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A958]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9E8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAA8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA88]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAC0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAB0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA28]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA20]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA10]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA18]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA08]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A938]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A940]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A930]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA50]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA00]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9E0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A910]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A918]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A928]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAB8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9D8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA98]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA90]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAA0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A908]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9F0]) & 1) != 0)
  {
    -[NSDictionary objectForKey:](v4, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    GEOFindOrCreateLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealWalletConnector.mm";
      v34 = 1024;
      v35 = 148;
      v36 = 2082;
      v37 = "NSString *_stringFromSemantics(_PKPassSemanticDict *__strong, NSString *__strong)";
      v38 = 2082;
      v39 = "! PKPassSemanticIsStringKey(key)";
      _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a semantic string!", buf, 0x26u);
    }

    v6 = 0;
  }

  if (objc_msgSend(v6, "length"))
  {
    v7 = v6;
    goto LABEL_86;
  }
  -[NSDictionary objectForKeyedSubscript:](self->_fields, "objectForKeyedSubscript:", CFSTR("flight"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    v30 = 0;
    v31 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = (void *)v8;
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_fields, "objectForKeyedSubscript:", CFSTR("flightNumber"));
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v30 = 0;
      v31 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v29 = (void *)v15;
    }
    else
    {
      -[NSDictionary objectForKeyedSubscript:](self->_fields, "objectForKeyedSubscript:", CFSTR("FLIGHT"));
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v28 = (void *)v15;
        v29 = 0;
        v31 = 0;
        v10 = 0;
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v30 = 1;
      }
      else
      {
        -[NSDictionary objectForKeyedSubscript:](self->_fields, "objectForKeyedSubscript:", CFSTR("flightNo"));
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v28 = 0;
          v29 = 0;
          v10 = 0;
          v11 = 0;
          v12 = 0;
          v13 = 0;
          v30 = 1;
          v31 = 1;
          v27 = (void *)v15;
        }
        else
        {
          -[NSDictionary objectForKeyedSubscript:](self->_fields, "objectForKeyedSubscript:", CFSTR("flightNb"));
          v15 = objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            -[NSDictionary objectForKeyedSubscript:](self->_fields, "objectForKeyedSubscript:", CFSTR("flightNum"));
            v19 = objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              v28 = 0;
              v29 = 0;
              v26 = 0;
              v27 = 0;
              v11 = 0;
              v12 = 0;
              v13 = 0;
              v30 = 1;
              v31 = 0x100000001;
              v14 = (void *)v19;
              v10 = 1;
              v25 = (void *)v19;
            }
            else
            {
              -[NSDictionary objectForKeyedSubscript:](self->_fields, "objectForKeyedSubscript:", CFSTR("flight-number"));
              v20 = objc_claimAutoreleasedReturnValue();
              if (v20)
              {
                v28 = 0;
                v29 = 0;
                v26 = 0;
                v27 = 0;
                v24 = (void *)v20;
                v25 = 0;
                v12 = 0;
                v13 = 0;
                v30 = 1;
                v31 = 0x100000001;
                v14 = (void *)v20;
                v10 = 1;
                v11 = 1;
              }
              else
              {
                -[NSDictionary objectForKeyedSubscript:](self->_fields, "objectForKeyedSubscript:", CFSTR("flightNumber2"));
                v21 = objc_claimAutoreleasedReturnValue();
                if (v21)
                {
                  v28 = 0;
                  v29 = 0;
                  v26 = 0;
                  v27 = 0;
                  v24 = 0;
                  v25 = 0;
                  v13 = 0;
                  v30 = 1;
                  v31 = 0x100000001;
                  v14 = (void *)v21;
                  v10 = 1;
                  v11 = 1;
                  v12 = 1;
                  v23 = (void *)v21;
                }
                else
                {
                  -[NSDictionary objectForKeyedSubscript:](self->_fields, "objectForKeyedSubscript:", CFSTR("flightNewName"));
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = 0;
                  v29 = 0;
                  v26 = 0;
                  v27 = 0;
                  v24 = 0;
                  v25 = 0;
                  v23 = 0;
                  v30 = 1;
                  v31 = 0x100000001;
                  v10 = 1;
                  v11 = 1;
                  v12 = 1;
                  v13 = 1;
                }
              }
            }
            goto LABEL_69;
          }
          v28 = 0;
          v29 = 0;
          v26 = (void *)v15;
          v27 = 0;
          v10 = 0;
          v11 = 0;
          v12 = 0;
          v13 = 0;
          v30 = 1;
          v31 = 0x100000001;
        }
      }
    }
    v14 = (void *)v15;
  }
LABEL_69:
  v16 = v14;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v17);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  if (v12)

  if (v11)
  if (v10)

  if (HIDWORD(v31))
  if ((_DWORD)v31)

  if (v30)
  if (!v9)

LABEL_86:
  return v7;
}

- (id)departureAirportCode
{
  void *v3;
  NSDictionary *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*MEMORY[0x1E0D6A968];
  v4 = self->_semantics;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A980]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9B8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA58]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA70]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA78]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA80]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A948]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A950]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A960]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA60]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA68]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA30]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA38]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA40]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA48]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9F8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A920]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", v3) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A970]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A998]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A978]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9A0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9A8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9D0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9B0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A988]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A990]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9C0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9C8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A958]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9E8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAA8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA88]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAC0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAB0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA28]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA20]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA10]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA18]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA08]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A938]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A940]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A930]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA50]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA00]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9E0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A910]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A918]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A928]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAB8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9D8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA98]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA90]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAA0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A908]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9F0]) & 1) != 0)
  {
    -[NSDictionary objectForKey:](v4, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_65;
  }
  else
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealWalletConnector.mm";
      v19 = 1024;
      v20 = 148;
      v21 = 2082;
      v22 = "NSString *_stringFromSemantics(_PKPassSemanticDict *__strong, NSString *__strong)";
      v23 = 2082;
      v24 = "! PKPassSemanticIsStringKey(key)";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a semantic string!", (uint8_t *)&v17, 0x26u);
    }

  }
  -[NSDictionary objectForKeyedSubscript:](self->_fields, "objectForKeyedSubscript:", CFSTR("origin"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v6 = v7;
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_fields, "objectForKeyedSubscript:", CFSTR("source"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      -[NSDictionary objectForKeyedSubscript:](self->_fields, "objectForKeyedSubscript:", CFSTR("depart"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v11;

  }
LABEL_65:
  v12 = v6;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)arrivalAirportCode
{
  void *v3;
  NSDictionary *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*MEMORY[0x1E0D6A968];
  v4 = self->_semantics;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A980]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9B8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA58]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA70]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA78]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA80]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A948]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A950]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A960]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA60]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA68]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA30]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA38]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA40]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA48]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9F8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A920]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", v3) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A970]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A998]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A978]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9A0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9A8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9D0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9B0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A988]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A990]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9C0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9C8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A958]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9E8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAA8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA88]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAC0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAB0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA28]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA20]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA10]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA18]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA08]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A938]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A940]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A930]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA50]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA00]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9E0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A910]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A918]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A928]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAB8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9D8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA98]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA90]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAA0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A908]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9F0]) & 1) != 0)
  {
    -[NSDictionary objectForKey:](v4, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_65;
  }
  else
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealWalletConnector.mm";
      v19 = 1024;
      v20 = 148;
      v21 = 2082;
      v22 = "NSString *_stringFromSemantics(_PKPassSemanticDict *__strong, NSString *__strong)";
      v23 = 2082;
      v24 = "! PKPassSemanticIsStringKey(key)";
      _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a semantic string!", (uint8_t *)&v17, 0x26u);
    }

  }
  -[NSDictionary objectForKeyedSubscript:](self->_fields, "objectForKeyedSubscript:", CFSTR("origin"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v6 = v7;
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_fields, "objectForKeyedSubscript:", CFSTR("source"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      -[NSDictionary objectForKeyedSubscript:](self->_fields, "objectForKeyedSubscript:", CFSTR("arrive"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v11;

  }
LABEL_65:
  v12 = v6;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)departureTerminal
{
  void *v3;
  NSDictionary *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*MEMORY[0x1E0D6A998];
  v4 = self->_semantics;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A980]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9B8]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA58]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA70]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA78]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA80]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A948]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A950]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A960]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA60]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA68]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA30]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA38]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA40]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA48]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9F8]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A920]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A968]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A970]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", v3) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A978]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9A0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9A8]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9D0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9B0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A988]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A990]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9C0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9C8]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A958]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9E8]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAA8]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA88]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAC0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAB0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA28]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA20]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA10]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA18]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA08]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A938]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A940]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A930]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA50]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA00]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9E0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A910]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A918]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A928]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAB8]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9D8]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA98]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA90]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAA0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A908]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9F0]) & 1) == 0)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealWalletConnector.mm";
      v14 = 1024;
      v15 = 148;
      v16 = 2082;
      v17 = "NSString *_stringFromSemantics(_PKPassSemanticDict *__strong, NSString *__strong)";
      v18 = 2082;
      v19 = "! PKPassSemanticIsStringKey(key)";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a semantic string!", (uint8_t *)&v12, 0x26u);
    }

    goto LABEL_58;
  }
  -[NSDictionary objectForKey:](v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_58:
    -[NSDictionary objectForKeyedSubscript:](self->_fields, "objectForKeyedSubscript:", CFSTR("terminal"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)departureGate
{
  void *v3;
  NSDictionary *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*MEMORY[0x1E0D6A978];
  v4 = self->_semantics;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A980]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9B8]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA58]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA70]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA78]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA80]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A948]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A950]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A960]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA60]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA68]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA30]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA38]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA40]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA48]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9F8]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A920]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A968]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A970]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A998]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", v3) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9A0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9A8]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9D0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9B0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A988]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A990]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9C0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9C8]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A958]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9E8]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAA8]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA88]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAC0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAB0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA28]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA20]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA10]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA18]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA08]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A938]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A940]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A930]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA50]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA00]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9E0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A910]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A918]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A928]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAB8]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9D8]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA98]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AA90]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AAA0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A908]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A9F0]) & 1) == 0)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealWalletConnector.mm";
      v14 = 1024;
      v15 = 148;
      v16 = 2082;
      v17 = "NSString *_stringFromSemantics(_PKPassSemanticDict *__strong, NSString *__strong)";
      v18 = 2082;
      v19 = "! PKPassSemanticIsStringKey(key)";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a semantic string!", (uint8_t *)&v12, 0x26u);
    }

    goto LABEL_58;
  }
  -[NSDictionary objectForKey:](v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_58:
    -[NSDictionary objectForKeyedSubscript:](self->_fields, "objectForKeyedSubscript:", CFSTR("gate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)departureTime
{
  void *v3;
  NSDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  NSDictionary *v8;
  NSObject *v9;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*MEMORY[0x1E0D6A830];
  v4 = self->_semantics;
  v5 = (void *)*MEMORY[0x1E0D6A858];
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A858]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", v3) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A848]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A820]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A850]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A828]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A840]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A870]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A880]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A890]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A860]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A878]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A888]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A868]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A838]) & 1) != 0)
  {
    -[NSDictionary objectForKey:](v4, "objectForKey:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      return v7;
  }
  else
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealWalletConnector.mm";
      v14 = 1024;
      v15 = 154;
      v16 = 2082;
      v17 = "NSDate *_dateFromSemantics(_PKPassSemanticDict *__strong, NSString *__strong)";
      v18 = 2082;
      v19 = "! PKPassSemanticIsDateKey(key)";
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a semantic date!", (uint8_t *)&v12, 0x26u);
    }

  }
  v8 = self->_semantics;
  if ((objc_msgSend(v5, "isEqualToString:", v5) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", v3) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6A848]) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6A820]) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6A850]) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6A828]) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6A840]) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6A870]) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6A880]) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6A890]) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6A860]) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6A878]) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6A888]) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6A868]) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D6A838]) & 1) != 0)
  {
    -[NSDictionary objectForKey:](v8, "objectForKey:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject dateValue](v9, "dateValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealWalletConnector.mm";
      v14 = 1024;
      v15 = 154;
      v16 = 2082;
      v17 = "NSDate *_dateFromSemantics(_PKPassSemanticDict *__strong, NSString *__strong)";
      v18 = 2082;
      v19 = "! PKPassSemanticIsDateKey(key)";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a semantic date!", (uint8_t *)&v12, 0x26u);
    }
    v7 = 0;
  }

  return v7;
}

- (id)arrivalTime
{
  void *v3;
  NSDictionary *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSDictionary *v9;
  NSObject *v10;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*MEMORY[0x1E0D6A820];
  v4 = self->_semantics;
  v5 = *MEMORY[0x1E0D6A858];
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A858]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A830]) & 1) != 0
    || (v6 = (void *)*MEMORY[0x1E0D6A848], (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A848]) & 1) != 0)
    || (objc_msgSend(v3, "isEqualToString:", v3) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A850]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A828]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A840]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A870]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A880]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A890]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A860]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A878]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A888]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A868]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6A838]) & 1) != 0)
  {
    -[NSDictionary objectForKey:](v4, "objectForKey:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      return v8;
    v6 = (void *)*MEMORY[0x1E0D6A848];
  }
  else
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealWalletConnector.mm";
      v15 = 1024;
      v16 = 154;
      v17 = 2082;
      v18 = "NSDate *_dateFromSemantics(_PKPassSemanticDict *__strong, NSString *__strong)";
      v19 = 2082;
      v20 = "! PKPassSemanticIsDateKey(key)";
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a semantic date!", (uint8_t *)&v13, 0x26u);
    }

  }
  v9 = self->_semantics;
  if ((objc_msgSend(v6, "isEqualToString:", v5) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D6A830]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", v6) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", v3) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D6A850]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D6A828]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D6A840]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D6A870]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D6A880]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D6A890]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D6A860]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D6A878]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D6A888]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D6A868]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D6A838]) & 1) != 0)
  {
    -[NSDictionary objectForKey:](v9, "objectForKey:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject dateValue](v10, "dateValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealWalletConnector.mm";
      v15 = 1024;
      v16 = 154;
      v17 = 2082;
      v18 = "NSDate *_dateFromSemantics(_PKPassSemanticDict *__strong, NSString *__strong)";
      v19 = 2082;
      v20 = "! PKPassSemanticIsDateKey(key)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a semantic date!", (uint8_t *)&v13, 0x26u);
    }
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_semantics, 0);
}

@end
