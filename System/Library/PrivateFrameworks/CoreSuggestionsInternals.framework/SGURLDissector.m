@implementation SGURLDissector

- (id)supportedBundleIdentifiers
{
  if (supportedBundleIdentifiers__pasOnceToken5 != -1)
    dispatch_once(&supportedBundleIdentifiers__pasOnceToken5, &__block_literal_global_25001);
  return (id)supportedBundleIdentifiers__pasExprOnceResult;
}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *context;
  void *contexta;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "bundleIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(v8, "uniqueIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v8, "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[SGURLDissector supportedBundleIdentifiers](self, "supportedBundleIdentifiers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bundleIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "containsObject:", v17);

        if (v18)
        {
          objc_msgSend(v8, "htmlParser");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "appleAnchorHrefs");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v55 = v20;
          if (objc_msgSend(v20, "count"))
          {
            context = (void *)MEMORY[0x1C3BD4F6C]();
            objc_msgSend(v20, "allObjects");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "author");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "handles");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v47, "count");
            if (v45)
            {
              objc_msgSend(v8, "author");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "handles");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v53 = 0;
            }
            objc_msgSend(v8, "bundleIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "domainIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "uniqueIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "subject");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "date");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)objc_opt_new();
            LOBYTE(v39) = objc_msgSend(v8, "isSent");
            -[SGURLDissector urlsFromURLs:handle:bundleIdentifier:domainIdentifier:uniqueIdentifier:documentTitle:documentDate:documentTimeInterval:receivedAt:isOutgoingDocument:](self, "urlsFromURLs:handle:bundleIdentifier:domainIdentifier:uniqueIdentifier:documentTitle:documentDate:documentTimeInterval:receivedAt:isOutgoingDocument:", v56, v53, v22, v23, v24, v25, 0.0, v26, v27, v39);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            if (v45)
            {

            }
            objc_autoreleasePoolPop(context);
            if (v43)
              objc_msgSend(v9, "addExternalEnrichment:", v43);

          }
          v28 = MEMORY[0x1C3BD4F6C]();
          objc_msgSend(v8, "textContent");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "author");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "handles");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v29;
          contexta = (void *)v28;
          v46 = objc_msgSend(v30, "count");
          v48 = v30;
          v44 = v10;
          if (v46)
          {
            objc_msgSend(v8, "author");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "handles");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "objectAtIndexedSubscript:", 0);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v54 = 0;
          }
          objc_msgSend(v8, "plainTextDetectedData");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "bundleIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "domainIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "uniqueIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "subject");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "date");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)objc_opt_new();
          LOBYTE(v40) = objc_msgSend(v8, "isSent");
          -[SGURLDissector urlsFromText:handle:dataDetectorMatches:bundleIdentifier:domainIdentifier:uniqueIdentifier:documentTitle:documentDate:documentTimeInterval:receivedAt:isOutgoingDocument:](self, "urlsFromText:handle:dataDetectorMatches:bundleIdentifier:domainIdentifier:uniqueIdentifier:documentTitle:documentDate:documentTimeInterval:receivedAt:isOutgoingDocument:", v57, v54, v31, v32, v33, v34, 0.0, v35, v36, v37, v40);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v46)
          {

          }
          objc_autoreleasePoolPop(contexta);
          v10 = v44;
          if (v38)
            objc_msgSend(v9, "addExternalEnrichment:", v38);

        }
        goto LABEL_12;
      }
    }
    else
    {

    }
  }
  sgLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v21, OS_LOG_TYPE_DEFAULT, "SGURLDissector ignoring entity due to missing bundle id, unique id, or date", buf, 2u);
  }

LABEL_12:
}

- (id)urlsFromURLs:(id)a3 handle:(id)a4 bundleIdentifier:(id)a5 domainIdentifier:(id)a6 uniqueIdentifier:(id)a7 documentTitle:(id)a8 documentDate:(id)a9 documentTimeInterval:(double)a10 receivedAt:(id)a11 isOutgoingDocument:(BOOL)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t i;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v42;
  SGURLDissector *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id *v48;
  id v49;
  id obj;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v49 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v47 = a8;
  v46 = a9;
  v45 = a11;
  v48 = (id *)objc_opt_new();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v23 = v19;
  v24 = v21;
  obj = v23;
  v52 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
  if (v52)
  {
    v51 = *(_QWORD *)v54;
    v43 = self;
    do
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v54 != v51)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        v27 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v26, "absoluteString");
        v28 = objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          v29 = (void *)v28;
          objc_msgSend(v26, "absoluteString");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "length");

          if (v31)
          {
            LOBYTE(v42) = -[SGURLDissector _flagsForBundleIdentifier:documentDate:documentTimeInterval:isOutgoingDocument:](self, "_flagsForBundleIdentifier:documentDate:documentTimeInterval:isOutgoingDocument:", v20, v46, a12, a10);
            v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19980]), "initWithURL:title:receivedFromHandle:bundleIdentifier:groupIdentifier:documentIdentifier:documentTitle:documentDate:documentTimeInterval:receivedAt:flags:", v26, 0, v49, v20, v24, v22, a10, v47, v46, v45, v42);
            objc_msgSend(v48[1], "addObject:", v32);
            sgLogHandle();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v32, "url");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "absoluteString");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = v22;
              v36 = v24;
              v37 = v20;
              v38 = objc_msgSend(v34, "length");
              objc_msgSend(v32, "receivedFromHandle");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v39, "length");
              *(_DWORD *)buf = 134218754;
              v58 = v38;
              v20 = v37;
              v24 = v36;
              v22 = v35;
              v59 = 2048;
              v60 = v40;
              v61 = 2112;
              v62 = v20;
              v63 = 2112;
              v64 = v35;
              _os_log_impl(&dword_1C3607000, v33, OS_LOG_TYPE_DEFAULT, "SGURLDissector(URLs) found URL of length %tu, from handle of length %tu, in: (%@, %@)", buf, 0x2Au);

              self = v43;
            }

          }
        }
        objc_autoreleasePoolPop(v27);
      }
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    }
    while (v52);
  }

  return v48;
}

- (id)urlsFromText:(id)a3 handle:(id)a4 dataDetectorMatches:(id)a5 bundleIdentifier:(id)a6 domainIdentifier:(id)a7 uniqueIdentifier:(id)a8 documentTitle:(id)a9 documentDate:(id)a10 documentTimeInterval:(double)a11 receivedAt:(id)a12 isOutgoingDocument:(BOOL)a13
{
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  id v66;
  __int16 v67;
  id v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v52 = a4;
  v20 = a5;
  v54 = a6;
  v51 = a7;
  v53 = a8;
  v50 = a9;
  v49 = a10;
  v48 = a12;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v21 = v20;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
  if (v22)
  {
    v23 = v22;
    v56 = 0;
    v24 = *(_QWORD *)v58;
    v55 = v19;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v58 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        v27 = (void *)MEMORY[0x1C3BD4F6C]();
        if (objc_msgSend(v26, "matchType") == 5)
        {
          v28 = objc_msgSend(v26, "valueRange");
          objc_msgSend(v19, "substringWithRange:", v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (v30 && objc_msgSend(v30, "length"))
          {
            if (!v56)
              v56 = (id *)objc_opt_new();
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v32;
            if (v32)
            {
              objc_msgSend(v32, "absoluteString");
              v34 = objc_claimAutoreleasedReturnValue();
              if (v34)
              {
                v35 = (void *)v34;
                objc_msgSend(v33, "absoluteString");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = objc_msgSend(v36, "length");

                v19 = v55;
                if (v37)
                {
                  LOBYTE(v43) = -[SGURLDissector _flagsForBundleIdentifier:documentDate:documentTimeInterval:isOutgoingDocument:](self, "_flagsForBundleIdentifier:documentDate:documentTimeInterval:isOutgoingDocument:", v54, v49, a13, a11);
                  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19980]), "initWithURL:title:receivedFromHandle:bundleIdentifier:groupIdentifier:documentIdentifier:documentTitle:documentDate:documentTimeInterval:receivedAt:flags:", v33, 0, v52, v54, v51, v53, a11, v50, v49, v48, v43);
                  objc_msgSend(v56[1], "addObject:", v38);
                  sgLogHandle();
                  v39 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v38, "url");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "absoluteString");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    v44 = objc_msgSend(v45, "length");
                    objc_msgSend(v38, "receivedFromHandle");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    v41 = objc_msgSend(v40, "length");
                    *(_DWORD *)buf = 134218754;
                    v62 = v44;
                    v63 = 2048;
                    v64 = v41;
                    v65 = 2112;
                    v66 = v54;
                    v67 = 2112;
                    v68 = v53;
                    _os_log_impl(&dword_1C3607000, v39, OS_LOG_TYPE_DEFAULT, "SGURLDissector(Text) found URL of length %tu, from handle of length %tu, in: (%@, %@)", buf, 0x2Au);

                  }
                  v19 = v55;
                }
              }
            }

          }
        }
        objc_autoreleasePoolPop(v27);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    }
    while (v23);
  }
  else
  {
    v56 = 0;
  }

  return v56;
}

- (id)urlsFromAttributes:(id)a3 handle:(id)a4 bundleIdentifier:(id)a5 domainIdentifier:(id)a6 uniqueIdentifier:(id)a7 documentTitle:(id)a8 documentDate:(id)a9 documentTimeInterval:(double)a10 receivedAt:(id)a11 isOutgoingDocument:(BOOL)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  unsigned __int8 v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id *v39;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v45 = a4;
  v20 = a5;
  v44 = a6;
  v46 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a11;
  objc_msgSend(v19, "URL");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
    goto LABEL_6;
  v25 = (void *)v24;
  objc_msgSend(v19, "URL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "absoluteString");
  v43 = v21;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "length");

  v21 = v43;
  if (v28)
  {
    objc_msgSend(v19, "textContent");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGURLDissector _titleFromMessagesSynthesizedTextContent:](self, "_titleFromMessagesSynthesizedTextContent:", v29);
    v30 = objc_claimAutoreleasedReturnValue();

    v31 = -[SGURLDissector _flagsForBundleIdentifier:documentDate:documentTimeInterval:isOutgoingDocument:](self, "_flagsForBundleIdentifier:documentDate:documentTimeInterval:isOutgoingDocument:", v20, v22, a12, a10);
    v32 = objc_alloc(MEMORY[0x1E0D19980]);
    objc_msgSend(v19, "URL");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v41) = v31;
    v34 = (void *)objc_msgSend(v32, "initWithURL:title:receivedFromHandle:bundleIdentifier:groupIdentifier:documentIdentifier:documentTitle:documentDate:documentTimeInterval:receivedAt:flags:", v33, v30, v45, v20, v44, v46, a10, v43, v22, v23, v41);

    sgLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v34, "url");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "absoluteString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "length");
      objc_msgSend(v34, "receivedFromHandle");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v48 = v37;
      v49 = 2048;
      v50 = objc_msgSend(v38, "length");
      v51 = 2112;
      v52 = v20;
      v53 = 2112;
      v54 = v46;
      _os_log_impl(&dword_1C3607000, v35, OS_LOG_TYPE_DEFAULT, "SGURLDissector(Attributes) found URL of length %tu, from handle of length %tu, in: (%@, %@)", buf, 0x2Au);

      v21 = v43;
    }

    v39 = (id *)objc_opt_new();
    objc_msgSend(v39[1], "addObject:", v34);

  }
  else
  {
LABEL_6:
    sgLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v30, OS_LOG_TYPE_DEFAULT, "urlsFromAttributes called with no URL attribute", buf, 2u);
    }
    v39 = 0;
  }

  return v39;
}

- (id)_titleFromMessagesSynthesizedTextContent:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  __int16 v14;
  __int16 v15;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR(":"), 2);
  v6 = v5;
  v7 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("("), 6);
  if (!v6 || !v8)
  {
    sgLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 0;
      v11 = "urlsFromAttributes failed to find colon and parenthesis in text";
      v12 = (uint8_t *)&v15;
LABEL_9:
      _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
    }
LABEL_10:

    v9 = 0;
    goto LABEL_11;
  }
  if (v7 <= v4 + 3)
  {
    sgLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 0;
      v11 = "urlsFromAttributes found invalid ranges of colon and parenthesis";
      v12 = (uint8_t *)&v14;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  objc_msgSend(v3, "substringWithRange:", v4 + 2, v7 - v4 - 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v9;
}

- (unsigned)_flagsForBundleIdentifier:(id)a3 documentDate:(id)a4 documentTimeInterval:(double)a5 isOutgoingDocument:(BOOL)a6
{
  id v9;
  void *v10;

  v9 = a3;
  v10 = v9;
  if (a5 > 0.0)
    a6 |= 0x20u;
  if (((a4 != 0) & objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D81000])) != 0)
    a6 |= 0x40u;
  if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D80FD0]) & 1) != 0
    || objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D80FE0]))
  {
    a6 |= 0x10u;
  }

  return a6;
}

void __44__SGURLDissector_supportedBundleIdentifiers__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = (void *)MEMORY[0x1C3BD4F6C]();
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_msgSend(v2, "initWithObjects:", *MEMORY[0x1E0D19A28], 0);
  objc_autoreleasePoolPop(v1);
  v4 = (void *)supportedBundleIdentifiers__pasExprOnceResult;
  supportedBundleIdentifiers__pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v0);
}

@end
