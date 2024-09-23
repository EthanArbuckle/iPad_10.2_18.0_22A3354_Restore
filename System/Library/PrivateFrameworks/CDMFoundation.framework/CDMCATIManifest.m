@implementation CDMCATIManifest

- (CDMCATIManifest)initWithPath:(id)a3
{
  id v4;
  CDMCATIManifest *v5;
  CDMCATIManifest *v6;
  _BOOL4 v7;
  uint64_t v8;
  NSString *locale;
  uint64_t v10;
  NSString *date;
  uint64_t v12;
  NSString *GUID;
  uint64_t v14;
  NSString *version;
  void *v16;
  float v17;
  void *v18;
  float v19;
  uint64_t v20;
  NSString *usoEntity;
  void *v22;
  NSString *v23;
  NSString *v24;
  uint64_t v25;
  NSString *usoVerb;
  NSString *v27;
  NSString *v28;
  uint64_t v29;
  NSString *usoEdge;
  NSString *v31;
  NSString *v32;
  void *v33;
  NSObject *v34;
  NSString *v36;
  NSString *v37;
  NSString *v38;
  NSString *v39;
  int usoElementId;
  NSString *v41;
  NSString *v42;
  NSString *v43;
  objc_super v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  NSString *v48;
  __int16 v49;
  NSString *v50;
  __int16 v51;
  NSString *v52;
  __int16 v53;
  NSString *v54;
  __int16 v55;
  NSString *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  NSString *v60;
  __int16 v61;
  NSString *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)CDMCATIManifest;
  v5 = -[CDMCATIManifest init](&v44, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_22;
  v5->_manifestValid = 0;
  -[CDMCATIManifest readCatiManifest:](v5, "readCatiManifest:", v4);
  if (!v6->_manifest)
    goto LABEL_22;
  v7 = -[CDMCATIManifest validateManifest](v6, "validateManifest");
  v6->_manifestValid = v7;
  if (!v7)
    goto LABEL_22;
  -[NSDictionary objectForKey:](v6->_manifest, "objectForKey:", CFSTR("locale"));
  v8 = objc_claimAutoreleasedReturnValue();
  locale = v6->_locale;
  v6->_locale = (NSString *)v8;

  -[NSDictionary objectForKey:](v6->_manifest, "objectForKey:", CFSTR("date"));
  v10 = objc_claimAutoreleasedReturnValue();
  date = v6->_date;
  v6->_date = (NSString *)v10;

  -[NSDictionary objectForKey:](v6->_manifest, "objectForKey:", CFSTR("GUID"));
  v12 = objc_claimAutoreleasedReturnValue();
  GUID = v6->_GUID;
  v6->_GUID = (NSString *)v12;

  -[NSDictionary objectForKey:](v6->_manifest, "objectForKey:", CFSTR("version"));
  v14 = objc_claimAutoreleasedReturnValue();
  version = v6->_version;
  v6->_version = (NSString *)v14;

  -[NSDictionary objectForKey:](v6->_manifest, "objectForKey:", CFSTR("confidenceThreshold"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMCATIManifest getThresholdValue:](v6, "getThresholdValue:", v16);
  v6->_confidenceScoreThreshold = v17;

  -[NSDictionary objectForKey:](v6->_manifest, "objectForKey:", CFSTR("multiturnConfidenceThreshold"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMCATIManifest getMultiturnThresholdValue:](v6, "getMultiturnThresholdValue:", v18);
  v6->_multiturnConfidenceScoreThreshold = v19;

  -[CDMCATIManifest extractWeightsAndOverridesFromManifest:](v6, "extractWeightsAndOverridesFromManifest:", v6->_manifest);
  -[NSDictionary objectForKey:](v6->_manifest, "objectForKey:", CFSTR("usoEntity"));
  v20 = objc_claimAutoreleasedReturnValue();
  usoEntity = v6->_usoEntity;
  v6->_usoEntity = (NSString *)v20;

  -[NSDictionary objectForKey:](v6->_manifest, "objectForKey:", CFSTR("usoElementId"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v6->_usoElementId = -[CDMCATIManifest getUsoElementId:](v6, "getUsoElementId:", v22);

  v23 = v6->_usoEntity;
  if (v23)
  {
    if (-[NSString length](v23, "length"))
      goto LABEL_9;
    v24 = v6->_usoEntity;
  }
  else
  {
    v24 = 0;
  }
  v6->_usoEntity = (NSString *)CFSTR("siri_Canned");

LABEL_9:
  -[NSDictionary objectForKey:](v6->_manifest, "objectForKey:", CFSTR("usoVerb"));
  v25 = objc_claimAutoreleasedReturnValue();
  usoVerb = v6->_usoVerb;
  v6->_usoVerb = (NSString *)v25;

  v27 = v6->_usoVerb;
  if (v27)
  {
    if (-[NSString length](v27, "length"))
      goto LABEL_14;
    v28 = v6->_usoVerb;
  }
  else
  {
    v28 = 0;
  }
  v6->_usoVerb = (NSString *)CFSTR("action");

LABEL_14:
  -[NSDictionary objectForKey:](v6->_manifest, "objectForKey:", CFSTR("usoCATIdEdge"));
  v29 = objc_claimAutoreleasedReturnValue();
  usoEdge = v6->_usoEdge;
  v6->_usoEdge = (NSString *)v29;

  v31 = v6->_usoEdge;
  if (!v31)
  {
    v32 = 0;
    goto LABEL_18;
  }
  if (!-[NSString length](v31, "length"))
  {
    v32 = v6->_usoEdge;
LABEL_18:
    v6->_usoEdge = (NSString *)CFSTR("dialogId");

  }
  -[NSDictionary objectForKey:](v6->_manifest, "objectForKey:", CFSTR("expectedPositiveUtterances"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v6->_expectedPositiveUtterances = -[CDMCATIManifest getExpectedPositiveUtterancesValue:](v6, "getExpectedPositiveUtterancesValue:", v33);

  CDMOSLoggerForCategory(0);
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    v36 = v6->_locale;
    v37 = v6->_date;
    v38 = v6->_GUID;
    v39 = v6->_version;
    usoElementId = v6->_usoElementId;
    v41 = v6->_usoEntity;
    v42 = v6->_usoVerb;
    v43 = v6->_usoEdge;
    *(_DWORD *)buf = 136317186;
    v46 = "-[CDMCATIManifest initWithPath:]";
    v47 = 2112;
    v48 = v36;
    v49 = 2112;
    v50 = v37;
    v51 = 2112;
    v52 = v38;
    v53 = 2112;
    v54 = v39;
    v55 = 2112;
    v56 = v41;
    v57 = 1024;
    v58 = usoElementId;
    v59 = 2112;
    v60 = v42;
    v61 = 2112;
    v62 = v43;
    _os_log_debug_impl(&dword_21A2A0000, v34, OS_LOG_TYPE_DEBUG, "%s CATI manifest locale: %@, date: %@, GUID: %@, version: %@, uso entity: %@, usoElementId: %d, usoVerb: %@, usoEdge: %@", buf, 0x58u);
  }

LABEL_22:
  return v6;
}

- (void)readCatiManifest:(id)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSDictionary *v10;
  NSObject *p_super;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  NSObject *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v12 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v12;
      if (v8)
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("cati-manifest"));
        v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        p_super = &self->_manifest->super;
        self->_manifest = v10;
      }
      else
      {
        CDMOSLoggerForCategory(0);
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v14 = "-[CDMCATIManifest readCatiManifest:]";
          v15 = 2112;
          v16 = v9;
          _os_log_error_impl(&dword_21A2A0000, p_super, OS_LOG_TYPE_ERROR, "%s [ERR]: Error parsing JSON: %@", buf, 0x16u);
        }
      }

    }
    else
    {
      CDMOSLoggerForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "-[CDMCATIManifest readCatiManifest:]";
        v15 = 2112;
        v16 = v4;
        _os_log_error_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_ERROR, "%s [ERR]: CATI manifest data could not be read at %@", buf, 0x16u);
      }
    }

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[CDMCATIManifest readCatiManifest:]";
      v15 = 2112;
      v16 = v4;
      _os_log_error_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_ERROR, "%s [ERR]: CATI manifest file not found at %@", buf, 0x16u);
    }
  }

}

- (BOOL)validateManifest
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("locale"), CFSTR("date"), CFSTR("GUID"), CFSTR("version"), 0);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    v6 = 1;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSDictionary objectForKey:](self->_manifest, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9 == 0;

        if (v10)
        {
          CDMOSLoggerForCategory(0);
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v18 = "-[CDMCATIManifest validateManifest]";
            v19 = 2112;
            v20 = v8;
            _os_log_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_INFO, "%s [WARN]: CATI manifest is invalid. Missing field: %@", buf, 0x16u);
          }

          v6 = 0;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 1;
  }

  return v6 & 1;
}

- (float)getThresholdValue:(id)a3
{
  id v3;
  float v4;
  float v5;
  NSObject *v6;
  id v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "floatValue");
    v5 = v4;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v9 = 136315394;
      v10 = "-[CDMCATIManifest getThresholdValue:]";
      v11 = 2112;
      v12 = (id)objc_opt_class();
      v7 = v12;
      _os_log_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_INFO, "%s [WARN]: CATI manifest does not contain a valid confidence threshold key. Current value type: %@", (uint8_t *)&v9, 0x16u);

    }
    v5 = 0.9;
  }

  return v5;
}

- (float)getMultiturnThresholdValue:(id)a3
{
  id v3;
  float v4;
  float v5;
  NSObject *v6;
  id v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "floatValue");
    v5 = v4;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v9 = 136315394;
      v10 = "-[CDMCATIManifest getMultiturnThresholdValue:]";
      v11 = 2112;
      v12 = (id)objc_opt_class();
      v7 = v12;
      _os_log_impl(&dword_21A2A0000, v6, OS_LOG_TYPE_INFO, "%s [WARN]: CATI manifest does not contain a valid multiturn confidence threshold key.Current value type: %@", (uint8_t *)&v9, 0x16u);

    }
    v5 = 0.7;
  }

  return v5;
}

- (int)getExpectedPositiveUtterancesValue:(id)a3
{
  id v3;
  int v4;
  NSObject *v5;
  id v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "intValue");
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = 136315394;
      v9 = "-[CDMCATIManifest getExpectedPositiveUtterancesValue:]";
      v10 = 2112;
      v11 = (id)objc_opt_class();
      v6 = v11;
      _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s [WARN]: CATI manifest does not contain a valid expected number of positive utterances key. Current value type: %@", (uint8_t *)&v8, 0x16u);

    }
    v4 = -1;
  }

  return v4;
}

- (int)getUsoElementId:(id)a3
{
  id v3;
  int v4;
  NSObject *v5;
  id v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "intValue");
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = 136315394;
      v9 = "-[CDMCATIManifest getUsoElementId:]";
      v10 = 2112;
      v11 = (id)objc_opt_class();
      v6 = v11;
      _os_log_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_INFO, "%s [WARN]: CATI manifest does not contain a valid uso element id key. Current value type: %@", (uint8_t *)&v8, 0x16u);

    }
    v4 = -1;
  }

  return v4;
}

- (void)extractWeightsAndOverridesFromManifest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("intents"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (objc_msgSend(v4, "objectForKey:", CFSTR("intents")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        v5,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("intents"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("GUID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        CDMOSLoggerForCategory(0);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v15 = 136315138;
          v16 = "-[CDMCATIManifest extractWeightsAndOverridesFromManifest:]";
          _os_log_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_INFO, "%s Intents key present in manifest and contains guids.", (uint8_t *)&v15, 0xCu);
        }
        v12 = 0;
      }
      else
      {
        CDMOSLoggerForCategory(0);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = 1;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v15 = 136315138;
          v16 = "-[CDMCATIManifest extractWeightsAndOverridesFromManifest:]";
          _os_log_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_INFO, "%s Intents key present in manifest, but no guids. This is an older version of assets", (uint8_t *)&v15, 0xCu);
        }
      }

      self->_isPreGuidVersion = v12;
      -[CDMCATIManifest getWeightsAndOverridesAtIntentKeyFromManifest:](self, "getWeightsAndOverridesAtIntentKeyFromManifest:", v4);
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = 136315138;
        v16 = "-[CDMCATIManifest extractWeightsAndOverridesFromManifest:]";
        _os_log_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_INFO, "%s [WARN]: Intents key present in manifest, but it's an empty array. Using legacy keys to get weights and overrides.", (uint8_t *)&v15, 0xCu);
      }

      self->_isPreGuidVersion = 1;
      -[CDMCATIManifest getWeightsAndOverridesWithLegacyKeysFromManifest:](self, "getWeightsAndOverridesWithLegacyKeysFromManifest:", v4);
    }

  }
  else
  {
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v15 = 136315138;
      v16 = "-[CDMCATIManifest extractWeightsAndOverridesFromManifest:]";
      _os_log_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_INFO, "%s [WARN]: No intents key in manifest. Using legacy keys to get weights and overrides.", (uint8_t *)&v15, 0xCu);
    }

    self->_isPreGuidVersion = 1;
    -[CDMCATIManifest getWeightsAndOverridesWithLegacyKeysFromManifest:](self, "getWeightsAndOverridesWithLegacyKeysFromManifest:", v4);
  }

}

- (void)getWeightsAndOverridesAtIntentKeyFromManifest:(id)a3
{
  uint64_t v3;
  uint64_t i;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  unint64_t j;
  void *v12;
  char isKindOfClass;
  void *v14;
  unsigned int v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  CDMCATIIntent *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  CDMCATIIntent *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  NSDictionary *v48;
  NSDictionary *intentLookup;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSDictionary *v55;
  NSDictionary *weights;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSDictionary *v62;
  NSDictionary *positiveOverrides;
  void *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id obj;
  CDMCATIIntent *v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t buf[4];
  const char *v81;
  __int16 v82;
  void *v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v65 = a3;
  objc_msgSend(v65, "objectForKey:", CFSTR("intents"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v69 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v66 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v67 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v70 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = v64;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
  if (v3)
  {
    v74 = *(_QWORD *)v77;
    do
    {
      v75 = v3;
      for (i = 0; i != v75; ++i)
      {
        if (*(_QWORD *)v77 != v74)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        objc_msgSend(v5, "objectForKey:", CFSTR("modelType"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 99);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v8);

            CDMOSLoggerForCategory(0);
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v81 = "-[CDMCATIManifest getWeightsAndOverridesAtIntentKeyFromManifest:]";
              v82 = 2112;
              v83 = v5;
              _os_log_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: The modelType key exists but it is not castable to an Array, so the model type is invalid for intent object: %@", buf, 0x16u);
            }
            goto LABEL_49;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v10);

        }
        v9 = v7;
        for (j = 0; -[NSObject count](v9, "count") > j; ++j)
        {
          -[NSObject objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", j);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
          {
            CDMOSLoggerForCategory(0);
            v16 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              goto LABEL_21;
            *(_DWORD *)buf = 136315394;
            v81 = "-[CDMCATIManifest getWeightsAndOverridesAtIntentKeyFromManifest:]";
            v82 = 2112;
            v83 = v5;
            v17 = v16;
            v18 = "%s [WARN]: The modelType value is not castable to NSNumber, ignoring intent: %@";
            goto LABEL_20;
          }
          -[NSObject objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", j);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "intValue");

          if (v15 <= 1)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v15);
            v16 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v16);
            goto LABEL_21;
          }
          CDMOSLoggerForCategory(0);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v81 = "-[CDMCATIManifest getWeightsAndOverridesAtIntentKeyFromManifest:]";
            v82 = 2112;
            v83 = v5;
            v17 = v16;
            v18 = "%s [WARN]: The modelType value is neither invocation nor multiturn, ignoring intent: %@";
LABEL_20:
            _os_log_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_INFO, v18, buf, 0x16u);
          }
LABEL_21:

        }
        if (!objc_msgSend(v6, "count"))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 99);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v19);

        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 99);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v6, "containsObject:", v20);

        if ((v21 & 1) == 0)
        {
          if (self->_isPreGuidVersion)
          {
            objc_msgSend(v5, "objectForKey:", CFSTR("weights"));
            v73 = (CDMCATIIntent *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectForKey:", CFSTR("positiveOverrides"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22;
            if (v22
              && (objc_msgSend(v22, "componentsSeparatedByString:", CFSTR(".")),
                  v24 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v24, "objectAtIndexedSubscript:", 0),
                  v25 = objc_claimAutoreleasedReturnValue(),
                  v24,
                  v25))
            {
              v26 = -[CDMCATIIntent initWithGuid:intentName:ensemble:]([CDMCATIIntent alloc], "initWithGuid:intentName:ensemble:", v25, v25, CFSTR("invocation"));
              -[CDMCATIIntent guid](v26, "guid");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "setObject:forKey:", v26, v27);

              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v6, "containsObject:", v28);

              if (v29)
              {
                if (-[CDMCATIIntent length](v73, "length"))
                {
                  -[CDMCATIIntent guid](v26, "guid");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v68, "addObject:", v30);

                }
                if (objc_msgSend(v23, "length"))
                {
                  -[CDMCATIIntent guid](v26, "guid");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v69, "addObject:", v31);

                }
              }

            }
            else
            {
              CDMOSLoggerForCategory(0);
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v81 = "-[CDMCATIManifest getWeightsAndOverridesAtIntentKeyFromManifest:]";
                v82 = 2112;
                v83 = v5;
                _os_log_impl(&dword_21A2A0000, v25, OS_LOG_TYPE_INFO, "%s There are no positive overrides for %@, skipping.", buf, 0x16u);
              }
            }

LABEL_37:
          }
          else
          {
            v32 = [CDMCATIIntent alloc];
            objc_msgSend(v5, "objectForKey:", CFSTR("GUID"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectForKey:", CFSTR("intentName"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectForKey:", CFSTR("ensemble"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = -[CDMCATIIntent initWithGuid:intentName:ensemble:](v32, "initWithGuid:intentName:ensemble:", v33, v34, v35);

            -[CDMCATIIntent guid](v73, "guid");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "setObject:forKey:", v73, v36);

            objc_msgSend(v5, "objectForKey:", CFSTR("weights"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "BOOLValue");

            objc_msgSend(v5, "objectForKey:", CFSTR("positiveOverrides"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "BOOLValue");

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v6, "containsObject:", v41);

            if (v42)
            {
              if (v38)
              {
                -[CDMCATIIntent guid](v73, "guid");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "addObject:", v43);

              }
              if (v40)
              {
                -[CDMCATIIntent guid](v73, "guid");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v69, "addObject:", v44);

              }
            }
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v6, "containsObject:", v45);

            if (v46)
            {
              if (v38)
              {
                -[CDMCATIIntent guid](v73, "guid");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "addObject:", v47);

              }
              if (v40)
              {
                -[CDMCATIIntent guid](v73, "guid");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "addObject:", v23);
                goto LABEL_37;
              }
            }
          }

        }
LABEL_49:

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
    }
    while (v3);
  }

  v48 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:", v70);
  intentLookup = self->_intentLookup;
  self->_intentLookup = v48;

  v50 = objc_alloc(MEMORY[0x24BDBCE70]);
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v68);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v66);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (NSDictionary *)objc_msgSend(v50, "initWithObjectsAndKeys:", v51, v52, v53, v54, 0, v64);
  weights = self->_weights;
  self->_weights = v55;

  v57 = objc_alloc(MEMORY[0x24BDBCE70]);
  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v69);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v67);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (NSDictionary *)objc_msgSend(v57, "initWithObjectsAndKeys:", v58, v59, v60, v61, 0);
  positiveOverrides = self->_positiveOverrides;
  self->_positiveOverrides = v62;

}

- (id)getPositiveOverrideGuidsForModelType:(unint64_t)a3
{
  NSDictionary *positiveOverrides;
  void *v4;
  id v5;

  if (a3 > 1)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  }
  else
  {
    positiveOverrides = self->_positiveOverrides;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](positiveOverrides, "objectForKey:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)getWeightGuidsForModelType:(unint64_t)a3
{
  NSDictionary *weights;
  void *v4;
  id v5;

  if (a3 > 1)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  }
  else
  {
    weights = self->_weights;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](weights, "objectForKey:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)getWeightsAndOverridesWithLegacyKeysFromManifest:(id)a3
{
  void *v3;
  id v4;
  unint64_t i;
  CDMCATIIntent *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSDictionary *v15;
  NSDictionary *intentLookup;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSDictionary *v22;
  NSDictionary *weights;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  NSDictionary *v29;
  NSDictionary *positiveOverrides;
  id v31;
  id v33;
  void *v34;
  id v35;

  v31 = a3;
  objc_msgSend(v31, "objectForKey:", CFSTR("weights"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKey:", CFSTR("positive-overrides"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v35 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  for (i = 0; objc_msgSend(v3, "count") > i; ++i)
  {
    v6 = objc_alloc_init(CDMCATIIntent);
    objc_msgSend(v3, "objectAtIndexedSubscript:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMCATIIntent setIntentName:](v6, "setIntentName:", v9);

    -[CDMCATIIntent intentName](v6, "intentName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMCATIIntent setGuid:](v6, "setGuid:", v10);

    -[CDMCATIIntent setEnsemble:](v6, "setEnsemble:", CFSTR("invocation"));
    -[CDMCATIIntent guid](v6, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, v11);

    -[CDMCATIIntent guid](v6, "guid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v12);

    objc_msgSend(v3, "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v34, "containsObject:", v13);

    if ((_DWORD)v12)
    {
      -[CDMCATIIntent guid](v6, "guid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v14);

    }
  }
  v15 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:", v4);
  intentLookup = self->_intentLookup;
  self->_intentLookup = v15;

  v17 = objc_alloc(MEMORY[0x24BDBCE70]);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v33);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (NSDictionary *)objc_msgSend(v17, "initWithObjectsAndKeys:", v18, v19, v20, v21, 0);
  weights = self->_weights;
  self->_weights = v22;

  v24 = objc_alloc(MEMORY[0x24BDBCE70]);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v35);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (NSDictionary *)objc_msgSend(v24, "initWithObjectsAndKeys:", v25, v26, v27, v28, 0);
  positiveOverrides = self->_positiveOverrides;
  self->_positiveOverrides = v29;

}

- (NSDictionary)manifest
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setManifest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)manifestValid
{
  return self->_manifestValid;
}

- (void)setManifestValid:(BOOL)a3
{
  self->_manifestValid = a3;
}

- (NSString)locale
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLocale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)date
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)GUID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setGUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)version
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (float)confidenceScoreThreshold
{
  return self->_confidenceScoreThreshold;
}

- (void)setConfidenceScoreThreshold:(float)a3
{
  self->_confidenceScoreThreshold = a3;
}

- (float)multiturnConfidenceScoreThreshold
{
  return self->_multiturnConfidenceScoreThreshold;
}

- (void)setMultiturnConfidenceScoreThreshold:(float)a3
{
  self->_multiturnConfidenceScoreThreshold = a3;
}

- (NSString)usoEntity
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUsoEntity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (int)usoElementId
{
  return self->_usoElementId;
}

- (void)setUsoElementId:(int)a3
{
  self->_usoElementId = a3;
}

- (NSString)usoVerb
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setUsoVerb:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)usoEdge
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUsoEdge:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (int)expectedPositiveUtterances
{
  return self->_expectedPositiveUtterances;
}

- (void)setExpectedPositiveUtterances:(int)a3
{
  self->_expectedPositiveUtterances = a3;
}

- (NSDictionary)weights
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setWeights:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSDictionary)positiveOverrides
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPositiveOverrides:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSDictionary)intentLookup
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setIntentLookup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (BOOL)isPreGuidVersion
{
  return self->_isPreGuidVersion;
}

- (void)setIsPreGuidVersion:(BOOL)a3
{
  self->_isPreGuidVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentLookup, 0);
  objc_storeStrong((id *)&self->_positiveOverrides, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_usoEdge, 0);
  objc_storeStrong((id *)&self->_usoVerb, 0);
  objc_storeStrong((id *)&self->_usoEntity, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
}

@end
