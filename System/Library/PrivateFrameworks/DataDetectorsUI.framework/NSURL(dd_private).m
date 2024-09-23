@implementation NSURL(dd_private)

- (uint64_t)dd_isMaps:()dd_private
{
  return objc_msgSend(a1, "dd_isMaps:isDirections:", a3, 0);
}

- (uint64_t)dd_isMaps:()dd_private isDirections:
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(a1, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("maps")) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("geo")))
  {
    objc_msgSend(a1, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(":"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (unint64_t)objc_msgSend(v10, "count") > 1;
LABEL_4:

    goto LABEL_5;
  }
  objc_msgSend(a1, "query");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if (!a3 || (objc_msgSend(a1, "path"), v18 = (void *)objc_claimAutoreleasedReturnValue(), v18, !v18))
    {
      v11 = 0;
      goto LABEL_17;
    }
    objc_msgSend(a1, "host");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
    objc_msgSend(a1, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lowercaseString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "hasPrefix:", CFSTR("/maps")))
    {
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("www.google.com")) & 1) != 0
        || (objc_msgSend(v9, "isEqualToString:", CFSTR("www.bing.com")) & 1) != 0)
      {
        v11 = 1;
      }
      else
      {
        v11 = objc_msgSend(v9, "isEqualToString:", CFSTR("goo.gl"));
      }
    }
    else
    {
      v11 = 0;
    }

    goto LABEL_4;
  }
  objc_msgSend(a1, "host");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v9, "isEqualToString:", CFSTR("maps.apple.com"));
  v11 = a3 | v16;
  if (a3 && (v16 & 1) == 0)
  {
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("maps.google.com")) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", CFSTR("maps.bing.com")) & 1) != 0)
    {
      v11 = 1;
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_5:

  if (a4 && (_DWORD)v11)
  {
    objc_msgSend(a1, "resourceSpecifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "containsString:", CFSTR("?daddr=")) & 1) != 0)
      v13 = 1;
    else
      v13 = objc_msgSend(v12, "containsString:", CFSTR("&daddr="));
    *a4 = v13;

    v11 = 1;
  }
LABEL_17:

  return v11;
}

- (uint64_t)dd_isAnySimpleTelephonyScheme
{
  void *v2;
  void *v3;
  uint64_t IsChatBot;
  void *v5;
  void *v6;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(&unk_1E426B2A0, "containsObject:", v3) & 1) != 0)
  {
    IsChatBot = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("sip")))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", a1, 0);
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    IsChatBot = dd_handleIsChatBot(v6);

  }
  else
  {
    IsChatBot = 0;
  }

  return IsChatBot;
}

- (uint64_t)dd_hasHosts:()dd_private filterKey:filterValue:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    objc_msgSend(a1, "host");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lowercaseString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "containsObject:", v12);

    if (v13)
    {
      if (!v9 || !v10)
        goto LABEL_9;
      objc_msgSend(a1, "absoluteString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@="), v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "rangeOfString:", v15) == 0x7FFFFFFFFFFFFFFFLL)
      {

LABEL_9:
        v19 = 1;
        goto LABEL_10;
      }
      objc_msgSend(a1, "absoluteString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%@"), v9, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "rangeOfString:", v17);

      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_9;
    }
  }
  v19 = 0;
LABEL_10:

  return v19;
}

- (void)dd_AppleiTunesSchemes
{
  return &unk_1E426B2B8;
}

- (void)dd_AppleOtherSchemes
{
  return &unk_1E426B2D0;
}

- (uint64_t)dd_isAppleiTunesStore
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "dd_AppleiTunesSchemes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "dd_hasHosts:filterKey:filterValue:", v2, CFSTR("app"), CFSTR("itunes")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "dd_AppleOtherSchemes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(a1, "dd_hasHosts:filterKey:filterValue:", v4, CFSTR("app"), CFSTR("itunes"));

  }
  return v3;
}

- (uint64_t)dd_isAppleApps
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "host");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(&unk_1E426B2E8, "containsObject:", v2);

  return v3;
}

- (uint64_t)dd_isAppleBooks
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(CFSTR("books.apple.com"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(a1, "dd_AppleiTunesSchemes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(a1, "dd_hasHosts:filterKey:filterValue:", v5, CFSTR("app"), CFSTR("books"));

  }
  return v4;
}

- (uint64_t)dd_isAppleMusic
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(&unk_1E426B300, "containsObject:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(a1, "dd_AppleiTunesSchemes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(a1, "dd_hasHosts:filterKey:filterValue:", v5, CFSTR("app"), CFSTR("music"));

  }
  return v4;
}

- (uint64_t)dd_isApplePodcasts
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(CFSTR("podcasts.apple.com"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(a1, "dd_AppleiTunesSchemes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(a1, "dd_hasHosts:filterKey:filterValue:", v5, CFSTR("app"), CFSTR("podcast"));

  }
  return v4;
}

- (uint64_t)dd_isAppleTV
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(CFSTR("tv.apple.com"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(a1, "dd_AppleiTunesSchemes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(a1, "dd_hasHosts:filterKey:filterValue:", v5, CFSTR("app"), CFSTR("tv"));

  }
  return v4;
}

- (uint64_t)dd_isAppleStore
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "dd_AppleiTunesSchemes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v3) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(a1, "dd_AppleOtherSchemes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", v3);

  }
  return v5;
}

- (BOOL)dd_isCloudLink
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "iCloudSharingURL_noFragment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)dd_phoneNumberFromTelScheme
{
  void *v1;
  id v2;

  objc_msgSend(a1, "dd_phoneNumberFromTelSchemeAndExtractBody:serviceID:suggestions:", 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 0;
  if ((objc_msgSend(v1, "containsString:", CFSTR("@")) & 1) == 0)
    v2 = v1;

  return v2;
}

- (id)dd_emailFromTelScheme
{
  void *v1;
  id v2;

  objc_msgSend(a1, "dd_phoneNumberFromTelSchemeAndExtractBody:serviceID:suggestions:", 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 0;
  if (objc_msgSend(v1, "containsString:", CFSTR("@")))
    v2 = v1;

  return v2;
}

- (id)dd_phoneNumberFromTelSchemeAndExtractBody:()dd_private serviceID:suggestions:
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  const __CFString *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  __CFString *v42;
  const __CFString *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  int v75;
  char v76;
  uint64_t v77;
  _QWORD *v78;
  __CFString *v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _QWORD v92[3];

  v92[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "dd_isAnySimpleTelephonyScheme"))
    return 0;
  objc_msgSend(a1, "resourceSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("//")))
  {
    if ((unint64_t)objc_msgSend(v8, "length") < 3)
      goto LABEL_42;
    objc_msgSend(v8, "substringFromIndex:", 2);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(a1, "scheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lowercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v10) = objc_msgSend(v11, "isEqualToString:", CFSTR("sms"));
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("sip"));
    v78 = a4;
    v76 = (char)v10;
    if ((_DWORD)v10)
    {
      v13 = CFSTR(";");
      v14 = objc_msgSend(v8, "rangeOfString:", CFSTR("?"));
      v15 = objc_msgSend(v8, "rangeOfString:", CFSTR("&"));
      v16 = objc_msgSend(v8, "rangeOfString:", CFSTR(";"));
      if (v15 >= v14)
        v17 = CFSTR("?");
      else
        v17 = CFSTR("&");
      if (v15 >= v14)
        v18 = v14;
      else
        v18 = v15;
      if (v16 >= v18)
        v13 = v17;
      objc_msgSend(v8, "componentsSeparatedByString:", v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "count"))
      {
        objc_msgSend(v19, "firstObject");
        v67 = v19;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v92[0] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = v67;
        if ((unint64_t)objc_msgSend(v67, "count") < 2)
        {
          v38 = 0;
        }
        else
        {
          v74 = v12;
          objc_msgSend(v67, "subarrayWithRange:", 1, objc_msgSend(v67, "count") - 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "componentsJoinedByString:", v13);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "componentsSeparatedByString:", CFSTR("&"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          v70 = v11;
          v72 = v8;
          v68 = v21;
          v66 = v23;
          if ((a3 || a4 || a5)
            && (v88 = 0u,
                v89 = 0u,
                v86 = 0u,
                v87 = 0u,
                (v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v86, v91, 16)) != 0))
          {
            v27 = v26;
            v81 = 0;
            v28 = *(_QWORD *)v87;
            v77 = *(_QWORD *)v87;
            do
            {
              for (i = 0; i != v27; ++i)
              {
                if (*(_QWORD *)v87 != v28)
                  objc_enumerationMutation(v25);
                v30 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
                objc_msgSend(v30, "componentsSeparatedByString:", CFSTR("="));
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                if ((unint64_t)objc_msgSend(v31, "count") >= 2)
                {
                  objc_msgSend(v31, "firstObject");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "lowercaseString");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v30, "substringFromIndex:", objc_msgSend(v33, "length") + 1);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  if (a3 && objc_msgSend(v33, "isEqualToString:", CFSTR("body")))
                  {
                    objc_msgSend(v34, "stringByRemovingPercentEncoding");
                    *a3 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  else if (objc_msgSend(v33, "isEqualToString:", CFSTR("service_id")))
                  {
                    objc_msgSend(v34, "stringByRemovingPercentEncoding");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v78)
                    {
                      v81 = objc_retainAutorelease(v35);
                      *v78 = v81;
                    }
                    else
                    {
                      v81 = v35;
                    }
                    v28 = v77;
                  }
                  else if (a5 && objc_msgSend(v33, "isEqualToString:", CFSTR("suggestions")))
                  {
                    *a5 = objc_retainAutorelease(v34);
                  }

                }
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v86, v91, 16);
            }
            while (v27);
          }
          else
          {
            v81 = 0;
          }
          objc_msgSend(v68, "arrayByAddingObjectsFromArray:", v25);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = v70;
          v8 = v72;
          a4 = v78;
          v12 = v74;
          v38 = v81;
          v19 = v67;
        }
      }
      else
      {
        v38 = 0;
        v21 = 0;
      }

    }
    else
    {
      objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(";"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
    }
    objc_msgSend(v21, "firstObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "length");

    if (!v40)
    {
      v37 = 0;
LABEL_90:

      goto LABEL_91;
    }
    objc_msgSend(v21, "firstObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringByRemovingPercentEncoding");
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v75 = v12;
    if ((v76 & 1) != 0)
    {
      if (!-[__CFString isEqualToString:](v42, "isEqualToString:", CFSTR("/open")))
      {
        v80 = v42;
LABEL_57:
        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        v44 = v21;
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
        if (v45)
        {
          v46 = v45;
          v69 = v21;
          v71 = v11;
          v73 = v8;
          v47 = 0;
          v48 = 1;
          v49 = *(_QWORD *)v83;
LABEL_59:
          v50 = 0;
          v51 = v47;
          while (1)
          {
            v47 = v48;
            if (*(_QWORD *)v83 != v49)
              objc_enumerationMutation(v44);
            if ((v47 & 1) != 0)
              goto LABEL_74;
            v52 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v50);
            objc_msgSend(v52, "componentsSeparatedByString:", CFSTR("="));
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = v53;
            if ((v51 & 1) != 0 && objc_msgSend(v53, "count") == 1)
            {
              if (objc_msgSend(v52, "length"))
              {
                objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("1234567890#*"));
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "invertedSet");
                v56 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v52, "rangeOfCharacterFromSet:", v56) == 0x7FFFFFFFFFFFFFFFLL)
                {
                  v65 = v52;
                  v60 = v80;
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@;%@"), v80, v65);
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_78:

                  v11 = v71;
                  v8 = v73;
                  a4 = v78;
                  v21 = v69;
                  goto LABEL_79;
                }
LABEL_72:

              }
            }
            else if (objc_msgSend(v54, "count") == 2)
            {
              objc_msgSend(v54, "objectAtIndexedSubscript:", 0);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v56, "isEqualToString:", CFSTR("ext")))
              {
                objc_msgSend(v54, "objectAtIndexedSubscript:", 1);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v58 = objc_msgSend(v57, "length");

                if (v58)
                {
                  v59 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v54, "objectAtIndexedSubscript:", 1);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "stringByRemovingPercentEncoding");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "stringWithFormat:", CFSTR("%@;%@"), v80, v60);
                  v61 = (void *)objc_claimAutoreleasedReturnValue();

                  goto LABEL_78;
                }
                goto LABEL_73;
              }
              goto LABEL_72;
            }
LABEL_73:

LABEL_74:
            v48 = 0;
            ++v50;
            v51 = v47;
            if (v46 == v50)
            {
              v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
              v48 = 0;
              if (v46)
                goto LABEL_59;
              v11 = v71;
              v8 = v73;
              a4 = v78;
              v21 = v69;
              break;
            }
          }
        }
        v61 = v80;
LABEL_79:

        if (dd_handleIsChatBot(v61))
        {
          if (a4)
          {
            if (!*a4)
              *a4 = objc_retainAutorelease(v61);
          }
          v62 = v61;

          objc_msgSend(v62, "componentsSeparatedByString:", CFSTR("@"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v63, "firstObject");
          v64 = (void *)objc_claimAutoreleasedReturnValue();

          v38 = v62;
          if (!v75)
            goto LABEL_87;
        }
        else
        {
          v64 = v61;
          if (!v75)
            goto LABEL_87;
        }
        if (!dd_handleIsChatBot(v38))
        {
          v37 = 0;
          goto LABEL_89;
        }
LABEL_87:
        v37 = v64;
LABEL_89:

        goto LABEL_90;
      }
      v43 = CFSTR("open");
    }
    else
    {
      -[__CFString stringByReplacingOccurrencesOfString:withString:](v42, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR(";"));
      v43 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }

    v80 = (__CFString *)v43;
    goto LABEL_57;
  }
LABEL_42:
  v37 = 0;
LABEL_91:

  return v37;
}

- (id)dd_emailFromMailtoScheme
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("mailto"));

  if (v4)
  {
    objc_msgSend(a1, "resourceSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("?"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByRemovingPercentEncoding");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "rangeOfString:", CFSTR("@"));
    if (v9)
      v10 = v8;
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)dd_handleFromFacetimeSchemeFilteringForEmail:()dd_private
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  objc_msgSend(a1, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(&unk_1E426B318, "containsObject:", v6);

  if (v7)
  {
    objc_msgSend(a1, "resourceSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hasPrefix:", CFSTR("//")))
    {
      if ((unint64_t)objc_msgSend(v8, "length") < 3)
      {
        v14 = 0;
LABEL_15:

        return v14;
      }
      objc_msgSend(v8, "substringFromIndex:", 2);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("?"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByRemovingPercentEncoding");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12
      && (!objc_msgSend(v12, "containsString:", CFSTR("@"))
        ? (v13 = 0)
        : (v13 = dd_handleIsChatBot(v12) ^ 1),
          v13 == a3))
    {
      v14 = v12;
    }
    else
    {
      v14 = 0;
    }

    goto LABEL_15;
  }
  v14 = 0;
  return v14;
}

- (uint64_t)dd_phoneNumberFromFacetimeScheme
{
  return objc_msgSend(a1, "dd_handleFromFacetimeSchemeFilteringForEmail:", 0);
}

- (uint64_t)dd_emailFromFacetimeScheme
{
  return objc_msgSend(a1, "dd_handleFromFacetimeSchemeFilteringForEmail:", 1);
}

- (id)dd_rdarLinkFromTelScheme
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isEqualToString:", CFSTR("rdar")))
  {
    v4 = a1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("tel")))
  {
    v5 = objc_alloc(MEMORY[0x1E0C99E98]);
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "dd_phoneNumberFromTelScheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("rdar://problem/%@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v5, "initWithString:", v8);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)dd_phoneNumberFromValidSchemes:()dd_private
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v4, "containsObject:", v6);
  if (!(_DWORD)v5)
    goto LABEL_7;
  if (!objc_msgSend(&unk_1E426B330, "containsObject:", v6))
  {
    if (objc_msgSend(&unk_1E426B348, "containsObject:", v6))
    {
      objc_msgSend(a1, "dd_emailFromFacetimeScheme");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        objc_msgSend(a1, "dd_phoneNumberFromFacetimeScheme");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_4;
      }
    }
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  objc_msgSend(a1, "dd_phoneNumberFromTelScheme");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_4:
  v8 = (void *)v7;
LABEL_8:

  return v8;
}

- (id)dd_emailFromValidSchemes:()dd_private
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v4, "containsObject:", v6);
  if (!(_DWORD)v5)
    goto LABEL_10;
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("mailto")))
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("sms")) & 1) != 0
      || objc_msgSend(v6, "isEqualToString:", CFSTR("sip")))
    {
      objc_msgSend(a1, "dd_emailFromTelScheme");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    if (objc_msgSend(&unk_1E426B360, "containsObject:", v6))
    {
      objc_msgSend(a1, "dd_emailFromFacetimeScheme");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_10:
    v8 = 0;
    goto LABEL_11;
  }
  objc_msgSend(a1, "dd_emailFromMailtoScheme");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v8 = (void *)v7;
LABEL_11:

  return v8;
}

- (id)dd_productIdentifierFromAppleStoreScheme
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  if (objc_msgSend(a1, "dd_isAppleStore"))
  {
    objc_msgSend(a1, "pathComponents");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "count");
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      while (1)
      {
        objc_msgSend(v2, "objectAtIndex:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "rangeOfString:options:", CFSTR("^(id)?[0-9]+?$"), 1024) != 0x7FFFFFFFFFFFFFFFLL)
          break;

        if (v4 == ++v5)
          goto LABEL_6;
      }
      objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("id"), &stru_1E4259460);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "intValue"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
LABEL_6:
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (uint64_t)dd_previewActionSupported
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "hasPrefix:", CFSTR("x-apple-data-detectors")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(v2, "lowercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 1;
    if ((objc_msgSend(v4, "hasPrefix:", CFSTR("http")) & 1) == 0 && (objc_msgSend(a1, "dd_isMaps:", 1) & 1) == 0)
      v3 = objc_msgSend(a1, "dd_isAnySimpleTelephonyScheme");

  }
  return v3;
}

@end
