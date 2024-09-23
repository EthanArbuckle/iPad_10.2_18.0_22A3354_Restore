@implementation BCSURLNormalizer

+ (id)normalizedURLForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  uint8_t *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint8_t v75[16];
  uint8_t v76[16];
  uint8_t buf[2];
  __int16 v78;
  __int16 v79;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    ABSLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v79 = 0;
    v18 = "Normalizing URL - Step 1 - input URL is nil";
    v19 = (uint8_t *)&v79;
LABEL_13:
    _os_log_impl(&dword_20ACAD000, v9, OS_LOG_TYPE_DEFAULT, v18, v19, 2u);
    goto LABEL_14;
  }
  objc_msgSend(v3, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    ABSLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v78 = 0;
    v18 = "Normalizing URL - Step 2 - URL has nil scheme";
    v19 = (uint8_t *)&v78;
    goto LABEL_13;
  }
  objc_msgSend(v4, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
    ABSLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v18 = "Normalizing URL - Step 2 - URL has nil host";
      v19 = buf;
      goto LABEL_13;
    }
LABEL_14:
    v20 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v4, "standardizedURL");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v9, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject percentEncodedFragment](v10, "percentEncodedFragment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject encodedHost](v10, "encodedHost");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lowercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject percentEncodedPassword](v10, "percentEncodedPassword");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject percentEncodedPath](v10, "percentEncodedPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject port](v10, "port");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject percentEncodedQuery](v10, "percentEncodedQuery");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
    {
      -[NSObject query](v10, "query");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    v62 = v17;

    -[NSObject scheme](v10, "scheme");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lowercaseString");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = v10;
    -[NSObject percentEncodedUser](v10, "percentEncodedUser");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByRemovingPercentEncoding");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByRemovingPercentEncoding");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByRemovingPercentEncoding");
    v64 = v14;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByRemovingPercentEncoding");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByRemovingPercentEncoding");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "stringByRemovingPercentEncoding");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "URLFragmentAllowedCharacterSet");
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "URLHostAllowedCharacterSet");
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "URLPasswordAllowedCharacterSet");
    v63 = v15;
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
    v66 = v11;
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
    v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "URLUserAllowedCharacterSet");
    v29 = objc_claimAutoreleasedReturnValue();
    v60 = (void *)v24;
    objc_msgSend(v74, "stringByAddingPercentEncodingWithAllowedCharacters:", v24);
    v65 = v13;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)v25;
    objc_msgSend(v73, "stringByAddingPercentEncodingWithAllowedCharacters:", v25);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v23;
    v57 = (void *)v26;
    objc_msgSend(v23, "stringByAddingPercentEncodingWithAllowedCharacters:", v26);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)v27;
    objc_msgSend(v72, "stringByAddingPercentEncodingWithAllowedCharacters:", v27);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringByRemovingOccurancesOfCharacter:fromPosition:", CFSTR("/"), 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = (void *)v28;
    objc_msgSend(v71, "stringByAddingPercentEncodingWithAllowedCharacters:", v28);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)v29;
    objc_msgSend(v70, "stringByAddingPercentEncodingWithAllowedCharacters:", v29);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v32;
    objc_msgSend(v32, "stringByRemovingOccurancesOfCharacter:fromPosition:", CFSTR("/"), 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringByRemovingOccurancesOfCharacter:fromPosition:", CFSTR("?"), 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = v30;
    v38 = v34;
    v69 = v68;
    v39 = v33;
    v40 = v36;
    v41 = v49;
    v42 = v50;
    v43 = v51;
    objc_opt_self();
    v44 = objc_alloc_init(MEMORY[0x24BDD1808]);
    objc_msgSend(v44, "setPercentEncodedFragment:", v37);

    objc_msgSend(v44, "setEncodedHost:", v42);
    objc_msgSend(v44, "setPercentEncodedPassword:", v41);

    objc_msgSend(v44, "setPercentEncodedPath:", v40);
    objc_msgSend(v44, "setPercentEncodedQuery:", v39);

    objc_msgSend(v44, "setPercentEncodedUser:", v38);
    objc_msgSend(v44, "setScheme:", v43);
    v58 = v43;

    v45 = v37;
    objc_msgSend(v44, "setPort:", v69);

    objc_msgSend(v44, "URL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = v67;
    if (!v20)
    {
      ABSLogCommon();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v75 = 0;
        _os_log_impl(&dword_20ACAD000, v47, OS_LOG_TYPE_DEFAULT, "Normalizing URL - Step 5 - normalizedURL is nil", v75, 2u);
      }

      v46 = v67;
    }

    v21 = v56;
  }
  else
  {
    ABSLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v76 = 0;
      _os_log_impl(&dword_20ACAD000, v21, OS_LOG_TYPE_DEFAULT, "Normalizing URL - Step 2 - standardizedURLString is nil", v76, 2u);
    }
    v20 = 0;
  }

LABEL_25:
  return v20;
}

@end
