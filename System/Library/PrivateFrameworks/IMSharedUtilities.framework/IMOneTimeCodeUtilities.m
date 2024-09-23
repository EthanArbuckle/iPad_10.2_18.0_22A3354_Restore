@implementation IMOneTimeCodeUtilities

- (BOOL)isValidOneTimeCode:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("handle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("code"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          goto LABEL_5;
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("machineReadableCode"));
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v3 = (void *)v14;
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("domain"));
          v15 = objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            v13 = 0;
            goto LABEL_18;
          }
          v4 = (void *)v15;
LABEL_5:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("displayCode"));
          v8 = objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v9 = (void *)v8;
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("guid"));
            v10 = objc_claimAutoreleasedReturnValue();
            if (v10)
            {
              v11 = (void *)v10;
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timeStamp"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = v12 != 0;

              if (!v7)
                goto LABEL_16;
              goto LABEL_19;
            }

          }
          v13 = 0;
          if (!v7)
          {
LABEL_16:

LABEL_18:
            v7 = v3;
          }
LABEL_19:

          goto LABEL_20;
        }
      }
      v13 = 0;
LABEL_20:

      goto LABEL_21;
    }
  }
  v13 = 0;
LABEL_21:

  return v13;
}

- (id)createOTCFromMessageBody:(id)a3 sender:(id)a4 guid:(id)a5
{
  id v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  char i;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  NSObject *v56;
  const __CFString *v57;
  unsigned int v59;
  id v60;
  id v61;
  int v62;
  void *v63;
  id v64;
  _QWORD v65[5];
  id v66;
  id v67;
  id v68;
  id v69;
  uint8_t v70[4];
  uint64_t (*v71)(uint64_t, uint64_t);
  _BYTE buf[24];
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v64 = a4;
  v8 = (uint64_t (*)(uint64_t, uint64_t))a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v8;
      _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Checking MessageBody with GUID:%@ for OTC", buf, 0xCu);
    }

  }
  if (v7 && v64 && v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v7, "length") > 0x264)
    {
      v28 = 0;
LABEL_26:
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v73 = sub_19E24770C;
      v74 = sub_19E247570;
      v75 = 0;
      v30 = objc_msgSend(v7, "length");
      v31 = *MEMORY[0x1E0D366F8];
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = sub_19E3117B4;
      v65[3] = &unk_1E3FB6910;
      v65[4] = buf;
      objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v31, 0, v30, 0, v65);
      if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40) && !objc_msgSend(v10, "count"))
        goto LABEL_44;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "objectForKeyedSubscript:", CFSTR("code"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "objectForKeyedSubscript:", CFSTR("displayCode"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v33 == 0;

          if (!v34)
            goto LABEL_36;
        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v70 = 138412290;
          v71 = v8;
          _os_log_impl(&dword_19E239000, v35, OS_LOG_TYPE_INFO, "Detected code for GUID:%@ but it does not appear to be valid", v70, 0xCu);
        }

      }
      if (objc_msgSend(v10, "count"))
      {
LABEL_36:
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "objectForKeyedSubscript:", CFSTR("displayCode"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36;
        if (v36)
        {
          v38 = v36;

          v28 = v38;
        }
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "objectForKeyedSubscript:", CFSTR("displayMoneyAmount"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v39, "length"))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v70 = 138412290;
              v71 = v8;
              _os_log_impl(&dword_19E239000, v40, OS_LOG_TYPE_INFO, "TAN found for guid %@", v70, 0xCu);
            }

          }
          v41 = (void *)MEMORY[0x1E0CB3940];
          IMSharedUtilitiesFrameworkBundle();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("TAN_DISPLAY"), &stru_1E3FBBA48, CFSTR("IMSharedUtilities"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "localizedStringWithFormat:", v43, v28, v39);
          v44 = objc_claimAutoreleasedReturnValue();

          v28 = (id)v44;
        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v70 = 138412290;
            v71 = v8;
            _os_log_impl(&dword_19E239000, v46, OS_LOG_TYPE_INFO, "OTC found for guid %@", v70, 0xCu);
          }

        }
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "objectForKeyedSubscript:", CFSTR("code"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v47, CFSTR("code"));

        objc_msgSend(v10, "setObject:forKeyedSubscript:", v28, CFSTR("displayCode"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v64, CFSTR("handle"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("guid"));
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v48, CFSTR("timeStamp"));

        v45 = (void *)objc_msgSend(v10, "copy");
      }
      else
      {
LABEL_44:
        v45 = 0;
      }
      _Block_object_dispose(buf, 8);

      goto LABEL_78;
    }
    objc_msgSend(v7, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsSeparatedByCharactersInSet:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v28 = 0;
LABEL_25:

      goto LABEL_26;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v14);
    objc_msgSend(v15, "setCharactersToBeSkipped:", 0);
    if (objc_msgSend(v15, "scanString:intoString:", CFSTR("@"), 0))
    {
      v62 = objc_msgSend(v15, "scanString:intoString:", CFSTR("@"), 0);
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = 0;
      v17 = objc_msgSend(v15, "scanUpToCharactersFromSet:intoString:", v16, &v69);
      v18 = v69;

      if (v17)
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v15, "scanCharactersFromSet:intoString:", v19, 0);

        if (v20)
        {
          if (objc_msgSend(v15, "scanString:intoString:", CFSTR("#"), 0))
          {
            objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = 0;
            v22 = objc_msgSend(v15, "scanUpToCharactersFromSet:intoString:", v21, &v68);
            v61 = v68;

            if (!v22)
            {
LABEL_69:
              v27 = 0;
LABEL_70:
              v29 = v61;
              goto LABEL_23;
            }
            objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v15, "scanCharactersFromSet:intoString:", v23, 0);

            if (v24)
            {
              if ((objc_msgSend(v15, "scanString:intoString:", CFSTR("%"), 0) & 1) != 0)
              {
                objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v67 = 0;
                v26 = objc_msgSend(v15, "scanUpToCharactersFromSet:intoString:", v25, &v67);
                v27 = v67;

                if (!v26)
                  goto LABEL_70;
LABEL_57:
                if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v54 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = v8;
                    _os_log_impl(&dword_19E239000, v54, OS_LOG_TYPE_INFO, "Found formatted domain and code for GUID %@", buf, 0xCu);
                  }

                }
                objc_msgSend(v10, "setObject:forKeyedSubscript:", v61, CFSTR("machineReadableCode"));
                objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("domain"));
                if (v62)
                  objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("domainStrict"));
                if (v27)
                {
                  objc_msgSend(v10, "setObject:forKeyedSubscript:", v27, CFSTR("embeddedDomain"));
                }
                else if (objc_msgSend(v63, "count"))
                {
                  objc_msgSend(v63, "firstObject");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "setObject:forKeyedSubscript:", v55, CFSTR("embeddedDomain"));

                  objc_msgSend(v10, "setObject:forKeyedSubscript:", v63, CFSTR("embeddedDomains"));
                }
                v28 = v61;
                goto LABEL_24;
              }
              for (i = objc_msgSend(v15, "isAtEnd");
                    (i & 1) == 0 && objc_msgSend(v15, "scanString:intoString:", CFSTR("@"), 0);
                    i = objc_msgSend(v15, "isAtEnd"))
              {
                v59 = objc_msgSend(v15, "scanString:intoString:", CFSTR("@"), 0);
                objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = 0;
                v51 = objc_msgSend(v15, "scanUpToCharactersFromSet:intoString:", v50, &v66);
                v60 = v66;

                if ((v51 & 1) == 0)
                {

                  goto LABEL_69;
                }
                objc_msgSend(v63, "addObject:", v60);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v59);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "addObject:", v52);

                objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "scanCharactersFromSet:intoString:", v53, 0);

              }
            }
            v27 = 0;
            goto LABEL_57;
          }
        }
      }
      v27 = 0;
      v29 = 0;
    }
    else
    {
      v27 = 0;
      v29 = 0;
      v18 = 0;
    }
LABEL_23:

    v18 = 0;
    v28 = 0;
LABEL_24:

    goto LABEL_25;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      v57 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      if (!v7)
        v57 = CFSTR("YES");
      *(_QWORD *)&buf[4] = v57;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v64;
      *(_WORD *)&buf[22] = 2112;
      v73 = v8;
      _os_log_impl(&dword_19E239000, v56, OS_LOG_TYPE_INFO, "createOTCFromMessageBody called with bad arguments, aborting create. messagesBodyNil:%@ sender:%@ guid:%@", buf, 0x20u);
    }

  }
  v45 = 0;
LABEL_78:

  return v45;
}

@end
