@implementation AVMetadataItem(AVAirSerialization)

- (id)airDictionaryRepresentation
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char isKindOfClass;
  void *v35;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CMTime v42;
  char v43;
  CMTime time;
  char v45;
  uint8_t v46[128];
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("identifier"));

  objc_msgSend(a1, "extendedLanguageTag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("extendedLanguageTag"));

  objc_msgSend(a1, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("localeIdentifier"));

  objc_msgSend(a1, "time");
  if ((v45 & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "time");
    objc_msgSend(v7, "numberWithDouble:", CMTimeGetSeconds(&time));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("time"));

  }
  objc_msgSend(a1, "duration");
  if ((v43 & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "duration");
    objc_msgSend(v9, "numberWithDouble:", CMTimeGetSeconds(&v42));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("duration"));

  }
  objc_msgSend(a1, "dataType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("dataType"));

  if (!objc_msgSend(a1, "statusOfValueForKey:error:", CFSTR("value"), 0))
  {
    _avairlog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[AVMetadataItem(AVAirSerialization) airDictionaryRepresentation]";
      v49 = 2112;
      v50 = a1;
      _os_log_impl(&dword_1AC4B1000, v12, OS_LOG_TYPE_DEFAULT, "%s ** WARNING: the value of this metadata item %@ has not yet been loaded; we're about to force it",
        buf,
        0x16u);
    }

  }
  objc_msgSend(a1, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "base64EncodedStringWithOptions:", 32);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("b64:%@"), v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[AVInternetDateFormatter internetDateFormatter](AVInternetDateFormatter, "internetDateFormatter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringFromDate:", v13);
    v17 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "stringValue");
    v18 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v18;
  }
  v37 = v13;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("value"));
  objc_msgSend(a1, "startDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    +[AVInternetDateFormatter internetDateFormatter](AVInternetDateFormatter, "internetDateFormatter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "startDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringFromDate:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v22, CFSTR("startDate"));

  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(a1, "extraAttributes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "allKeys");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v39 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v2, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v30)
        {
          objc_msgSend(a1, "extraAttributes");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectForKeyedSubscript:", v29);
          v32 = a1;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          a1 = v32;
          if ((isKindOfClass & 1) == 0)
            continue;
          objc_msgSend(v32, "extraAttributes");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKeyedSubscript:", v29);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v35, v29);

          a1 = v32;
        }

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v26);
  }

  return v2;
}

+ (id)itemWithAirDictionaryRepresentation:()AVAirSerialization
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  Float64 v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  Float64 v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char isKindOfClass;
  void *v36;
  const char *v37;
  id v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  char v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  CMTime v64;
  CMTime v65;
  _QWORD v66[3];
  uint8_t v67[128];
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C8B278]);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _avairlog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v69 = "+[AVMetadataItem(AVAirSerialization) itemWithAirDictionaryRepresentation:]";
      _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s ** AVMetadataItem representation has no identifier!", buf, 0xCu);
    }
    goto LABEL_43;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIdentifier:", v7);

  }
  else
  {
    objc_msgSend(v4, "setIdentifier:", 0);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("extendedLanguageTag"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("extendedLanguageTag"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setExtendedLanguageTag:", v10);

  }
  else
  {
    objc_msgSend(v4, "setExtendedLanguageTag:", 0);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("localeIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("localeIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("localeIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {

      v14 = 0;
      v13 = 0;
    }
    objc_msgSend(v4, "setLocale:", v14);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("time"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("time"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("time"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValue");
      v19 = v18;

      if (v19 >= 0.0)
      {
        CMTimeMakeWithSeconds(&v65, v19, 1000);
        objc_msgSend(v4, "setTime:", &v65);
      }
    }
    else
    {

    }
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("duration"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("duration"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("duration"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "doubleValue");
      v24 = v23;

      if (v24 > 0.0)
      {
        CMTimeMakeWithSeconds(&v64, v24, 1000);
        objc_msgSend(v4, "setDuration:", &v64);
      }
    }
    else
    {

    }
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_36;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "hasPrefix:", CFSTR("b64:"));

  if (!v27)
    goto LABEL_37;
  objc_msgSend(v4, "identifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v28, "isEqualToString:", *MEMORY[0x1E0C8A830]) & 1) == 0)
  {
    objc_msgSend(v4, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E0C8A938]) & 1) == 0)
    {
      objc_msgSend(v4, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v30, "isEqualToString:", *MEMORY[0x1E0C8A998]))
      {
        objc_msgSend(v4, "identifier");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v57, "isEqualToString:", *MEMORY[0x1E0C8A930]);

        if ((v58 & 1) == 0)
        {
          _avairlog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            goto LABEL_43;
          objc_msgSend(v4, "identifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v69 = "+[AVMetadataItem(AVAirSerialization) itemWithAirDictionaryRepresentation:]";
          v70 = 2114;
          v71 = v36;
          v37 = "%s The value passed for '%{public}@' is raw data, but we do not expect it. Discarding.";
          goto LABEL_42;
        }
        goto LABEL_35;
      }

    }
  }

LABEL_35:
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "substringFromIndex:", 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v25, 0);
  objc_msgSend(v4, "setValue:", v32);

LABEL_36:
LABEL_37:
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

LABEL_40:
    _avairlog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_43:
      v38 = 0;
      goto LABEL_44;
    }
    objc_msgSend(v4, "identifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v69 = "+[AVMetadataItem(AVAirSerialization) itemWithAirDictionaryRepresentation:]";
    v70 = 2112;
    v71 = v36;
    v37 = "%s Metadata values should not be arrays/dictionaries. Lookin' at you, '%@'.";
LABEL_42:
    _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, v37, buf, 0x16u);

    goto LABEL_43;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    goto LABEL_40;
  objc_msgSend(v4, "value");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v40)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:", v41);

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("startDate"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("startDate"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("startDate"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v44 = 0;
    }

    +[AVInternetDateFormatter internetDateFormatter](AVInternetDateFormatter, "internetDateFormatter");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "dateFromString:", v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setStartDate:", v46);
  }
  v59 = v4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v47 = *MEMORY[0x1E0C8A8C8];
  v66[0] = *MEMORY[0x1E0C8A8E8];
  v66[1] = v47;
  v66[2] = *MEMORY[0x1E0C8A8F8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 3);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v61 != v51)
          objc_enumerationMutation(v48);
        v53 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v53);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v55, v53);

        }
        else
        {
          -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", 0, v53);
        }

      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
    }
    while (v50);
  }

  v4 = v59;
  if (-[NSObject count](v8, "count"))
  {
    v56 = -[NSObject copy](v8, "copy");
    objc_msgSend(v59, "setExtraAttributes:", v56);

  }
  v38 = v59;
LABEL_44:

  return v38;
}

+ (id)airRepresentationForArray:()AVAirSerialization
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "airDictionaryRepresentation", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v4, "addObject:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)itemArrayWithAirRepresentations:()AVAirSerialization
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "itemWithAirDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

@end
