@implementation DNDConfiguration

+ (unint64_t)defaultConfigurationType
{
  return 0;
}

+ (unint64_t)defaultSuppressionType
{
  return 2;
}

+ (unint64_t)defaultMinimumBreakthroughUrgency
{
  return 0;
}

- (id)_initWithConfigurationType:(unint64_t)a3
{
  return -[DNDConfiguration _initWithSuppressionType:suppressionMode:allowedApplicationIdentifiers:deniedApplicationIdentifiers:allowedWebApplicationIdentifiers:deniedWebApplicationIdentifiers:senderConfiguration:minimumBreakthroughUrgency:hideApplicationBadges:allowIntelligentManagement:compatibilityVersion:applicationConfigurationType:senderConfigurationType:](self, "_initWithSuppressionType:suppressionMode:allowedApplicationIdentifiers:deniedApplicationIdentifiers:allowedWebApplicationIdentifiers:deniedWebApplicationIdentifiers:senderConfiguration:minimumBreakthroughUrgency:hideApplicationBadges:allowIntelligentManagement:compatibilityVersion:applicationConfigurationType:senderConfigurationType:", +[DNDConfiguration defaultSuppressionType](DNDConfiguration, "defaultSuppressionType"), 0, 0, 0, 0, 0, 0, +[DNDConfiguration defaultMinimumBreakthroughUrgency](DNDConfiguration, "defaultMinimumBreakthroughUrgency"), 2, 1, 2, a3, a3);
}

- (id)_initWithSuppressionType:(unint64_t)a3 suppressionMode:(unint64_t)a4 allowedApplicationIdentifiers:(id)a5 deniedApplicationIdentifiers:(id)a6 allowedWebApplicationIdentifiers:(id)a7 deniedWebApplicationIdentifiers:(id)a8 senderConfiguration:(id)a9 minimumBreakthroughUrgency:(unint64_t)a10 hideApplicationBadges:(unint64_t)a11 allowIntelligentManagement:(unint64_t)a12 compatibilityVersion:(int64_t)a13 applicationConfigurationType:(unint64_t)a14 senderConfigurationType:(unint64_t)a15
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  DNDConfiguration *v26;
  DNDConfiguration *v27;
  void *v28;
  void *v29;
  NSMutableDictionary *v30;
  NSMutableDictionary *allowedApplicationIdentifiers;
  void *v32;
  void *v33;
  NSMutableSet *v34;
  NSMutableSet *deniedApplicationIdentifiers;
  void *v36;
  void *v37;
  NSMutableSet *v38;
  NSMutableSet *allowedWebApplicationIdentifiers;
  void *v40;
  void *v41;
  NSMutableSet *v42;
  NSMutableSet *deniedWebApplicationIdentifiers;
  void *v44;
  void *v45;
  DNDMutableSenderConfiguration *v46;
  DNDMutableSenderConfiguration *senderConfiguration;
  objc_super v49;

  v21 = a5;
  v22 = a6;
  v23 = a7;
  v24 = a8;
  v25 = a9;
  v49.receiver = self;
  v49.super_class = (Class)DNDConfiguration;
  v26 = -[DNDConfiguration init](&v49, sel_init);
  v27 = v26;
  if (v26)
  {
    v26->_suppressionType = a3;
    v26->_suppressionMode = a4;
    v28 = (void *)objc_msgSend(v21, "mutableCopy");
    v29 = v28;
    if (v28)
      v30 = v28;
    else
      v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    allowedApplicationIdentifiers = v27->_allowedApplicationIdentifiers;
    v27->_allowedApplicationIdentifiers = v30;

    v32 = (void *)objc_msgSend(v22, "mutableCopy");
    v33 = v32;
    if (v32)
      v34 = v32;
    else
      v34 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    deniedApplicationIdentifiers = v27->_deniedApplicationIdentifiers;
    v27->_deniedApplicationIdentifiers = v34;

    v36 = (void *)objc_msgSend(v23, "mutableCopy");
    v37 = v36;
    if (v36)
      v38 = v36;
    else
      v38 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    allowedWebApplicationIdentifiers = v27->_allowedWebApplicationIdentifiers;
    v27->_allowedWebApplicationIdentifiers = v38;

    v40 = (void *)objc_msgSend(v24, "mutableCopy");
    v41 = v40;
    if (v40)
      v42 = v40;
    else
      v42 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    deniedWebApplicationIdentifiers = v27->_deniedWebApplicationIdentifiers;
    v27->_deniedWebApplicationIdentifiers = v42;

    v44 = (void *)objc_msgSend(v25, "mutableCopy");
    v45 = v44;
    if (v44)
      v46 = v44;
    else
      v46 = objc_alloc_init(DNDMutableSenderConfiguration);
    senderConfiguration = v27->_senderConfiguration;
    v27->_senderConfiguration = v46;

    v27->_minimumBreakthroughUrgency = a10;
    v27->_hideApplicationBadges = a11;
    v27->_allowIntelligentManagement = a12;
    v27->_compatibilityVersion = a13;
    v27->_applicationConfigurationType = a14;
    v27->_senderConfigurationType = a15;
  }

  return v27;
}

- (id)allowedApplications
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_allowedApplicationIdentifiers;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_allowedApplicationIdentifiers, "objectForKeyedSubscript:", v9, (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bundleID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v11);

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)deniedApplications
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_deniedApplicationIdentifiers;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "bundleID", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;

  v3 = -[DNDConfiguration suppressionType](self, "suppressionType");
  v4 = -[DNDConfiguration suppressionMode](self, "suppressionMode") ^ v3;
  -[DNDConfiguration allowedApplicationIdentifiers](self, "allowedApplicationIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");
  -[DNDConfiguration deniedApplicationIdentifiers](self, "deniedApplicationIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[DNDConfiguration allowedWebApplicationIdentifiers](self, "allowedWebApplicationIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[DNDConfiguration deniedWebApplicationIdentifiers](self, "deniedWebApplicationIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[DNDConfiguration senderConfiguration](self, "senderConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  v15 = v10 ^ v14 ^ -[DNDConfiguration minimumBreakthroughUrgency](self, "minimumBreakthroughUrgency");
  v16 = -[DNDConfiguration hideApplicationBadges](self, "hideApplicationBadges");
  v17 = v16 ^ -[DNDConfiguration allowIntelligentManagement](self, "allowIntelligentManagement");
  v18 = v17 ^ -[DNDConfiguration compatibilityVersion](self, "compatibilityVersion");
  v19 = v18 ^ -[DNDConfiguration applicationConfigurationType](self, "applicationConfigurationType");
  v20 = v15 ^ v19 ^ -[DNDConfiguration senderConfigurationType](self, "senderConfigurationType");

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  DNDConfiguration *v6;
  DNDConfiguration *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  int64_t v45;
  unint64_t v46;
  unint64_t v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
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
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;

  v6 = (DNDConfiguration *)a3;
  if (self == v6)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      v8 = -[DNDConfiguration suppressionType](self, "suppressionType");
      if (v8 != -[DNDConfiguration suppressionType](v7, "suppressionType")
        || (v9 = -[DNDConfiguration suppressionMode](self, "suppressionMode"),
            v9 != -[DNDConfiguration suppressionMode](v7, "suppressionMode")))
      {
        v16 = 0;
LABEL_79:

        goto LABEL_80;
      }
      -[DNDConfiguration allowedApplicationIdentifiers](self, "allowedApplicationIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDConfiguration allowedApplicationIdentifiers](v7, "allowedApplicationIdentifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 != v11)
      {
        -[DNDConfiguration allowedApplicationIdentifiers](self, "allowedApplicationIdentifiers");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v16 = 0;
          goto LABEL_78;
        }
        v3 = (void *)v12;
        -[DNDConfiguration allowedApplicationIdentifiers](v7, "allowedApplicationIdentifiers");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v16 = 0;
LABEL_77:

          goto LABEL_78;
        }
        v4 = (void *)v13;
        -[DNDConfiguration allowedApplicationIdentifiers](self, "allowedApplicationIdentifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDConfiguration allowedApplicationIdentifiers](v7, "allowedApplicationIdentifiers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v14, "isEqual:", v15))
        {
          v16 = 0;
LABEL_76:

          goto LABEL_77;
        }
        v73 = v15;
        v74 = v14;
      }
      -[DNDConfiguration deniedApplicationIdentifiers](self, "deniedApplicationIdentifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDConfiguration deniedApplicationIdentifiers](v7, "deniedApplicationIdentifiers");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (v17 != (void *)v18)
      {
        -[DNDConfiguration deniedApplicationIdentifiers](self, "deniedApplicationIdentifiers");
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = (void *)v20;
          -[DNDConfiguration deniedApplicationIdentifiers](v7, "deniedApplicationIdentifiers");
          v22 = objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            v75 = v19;
            v70 = (void *)v22;
            v71 = v3;
            v23 = v4;
            -[DNDConfiguration deniedApplicationIdentifiers](self, "deniedApplicationIdentifiers");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDConfiguration deniedApplicationIdentifiers](v7, "deniedApplicationIdentifiers");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v24, "isEqual:", v25) & 1) == 0)
            {

              v16 = 0;
              v15 = v73;
              v14 = v74;
              v4 = v23;
              v3 = v71;
              if (v10 == v11)
                goto LABEL_78;
              goto LABEL_76;
            }
            v64 = v25;
            v65 = v24;
            v63 = v21;
            v4 = v23;
            v3 = v71;
LABEL_20:
            -[DNDConfiguration allowedWebApplicationIdentifiers](self, "allowedWebApplicationIdentifiers");
            v26 = objc_claimAutoreleasedReturnValue();
            -[DNDConfiguration allowedWebApplicationIdentifiers](v7, "allowedWebApplicationIdentifiers");
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = (void *)v27;
            v72 = (void *)v26;
            if (v26 == v27)
            {
              v69 = (void *)v27;
              goto LABEL_28;
            }
            -[DNDConfiguration allowedWebApplicationIdentifiers](self, "allowedWebApplicationIdentifiers");
            v29 = objc_claimAutoreleasedReturnValue();
            if (v29)
            {
              v66 = (void *)v29;
              -[DNDConfiguration allowedWebApplicationIdentifiers](v7, "allowedWebApplicationIdentifiers");
              v30 = objc_claimAutoreleasedReturnValue();
              if (v30)
              {
                v69 = v28;
                v62 = (void *)v30;
                -[DNDConfiguration allowedWebApplicationIdentifiers](self, "allowedWebApplicationIdentifiers");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                -[DNDConfiguration allowedWebApplicationIdentifiers](v7, "allowedWebApplicationIdentifiers");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v28, "isEqual:", v31) & 1) != 0)
                {
                  v60 = v28;
                  v58 = v31;
LABEL_28:
                  -[DNDConfiguration deniedWebApplicationIdentifiers](self, "deniedWebApplicationIdentifiers");
                  v32 = objc_claimAutoreleasedReturnValue();
                  -[DNDConfiguration deniedWebApplicationIdentifiers](v7, "deniedWebApplicationIdentifiers");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  v68 = (void *)v32;
                  if ((void *)v32 == v67)
                    goto LABEL_37;
                  -[DNDConfiguration deniedWebApplicationIdentifiers](self, "deniedWebApplicationIdentifiers");
                  v33 = objc_claimAutoreleasedReturnValue();
                  if (v33)
                  {
                    v59 = (void *)v33;
                    -[DNDConfiguration deniedWebApplicationIdentifiers](v7, "deniedWebApplicationIdentifiers");
                    v34 = objc_claimAutoreleasedReturnValue();
                    if (v34)
                    {
                      v57 = (void *)v34;
                      -[DNDConfiguration deniedWebApplicationIdentifiers](self, "deniedWebApplicationIdentifiers");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      -[DNDConfiguration deniedWebApplicationIdentifiers](v7, "deniedWebApplicationIdentifiers");
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((objc_msgSend(v35, "isEqual:", v28) & 1) != 0)
                      {
                        v54 = v35;
LABEL_37:
                        -[DNDConfiguration senderConfiguration](self, "senderConfiguration");
                        v36 = (void *)objc_claimAutoreleasedReturnValue();
                        -[DNDConfiguration senderConfiguration](v7, "senderConfiguration");
                        v61 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v36 == v61)
                        {
                          v56 = v4;
                        }
                        else
                        {
                          -[DNDConfiguration senderConfiguration](self, "senderConfiguration");
                          v37 = objc_claimAutoreleasedReturnValue();
                          if (!v37)
                          {

                            v16 = 0;
LABEL_89:
                            if (v68 != v67)
                            {

                            }
                            if (v72 != v69)
                            {

                            }
                            if (v17 != v75)
                            {

                            }
                            goto LABEL_95;
                          }
                          v55 = (void *)v37;
                          -[DNDConfiguration senderConfiguration](v7, "senderConfiguration");
                          v38 = objc_claimAutoreleasedReturnValue();
                          if (!v38)
                          {
                            v16 = 0;
LABEL_88:

                            goto LABEL_89;
                          }
                          v50 = v28;
                          v39 = v36;
                          v53 = (void *)v38;
                          -[DNDConfiguration senderConfiguration](self, "senderConfiguration");
                          v40 = (void *)objc_claimAutoreleasedReturnValue();
                          -[DNDConfiguration senderConfiguration](v7, "senderConfiguration");
                          v51 = (void *)objc_claimAutoreleasedReturnValue();
                          v52 = v40;
                          if (!objc_msgSend(v40, "isEqual:"))
                          {
                            v16 = 0;
                            v36 = v39;
                            v28 = v50;
LABEL_87:

                            goto LABEL_88;
                          }
                          v56 = v4;
                          v36 = v39;
                          v28 = v50;
                        }
                        v42 = -[DNDConfiguration minimumBreakthroughUrgency](self, "minimumBreakthroughUrgency");
                        if (v42 != -[DNDConfiguration minimumBreakthroughUrgency](v7, "minimumBreakthroughUrgency")
                          || (v43 = -[DNDConfiguration hideApplicationBadges](self, "hideApplicationBadges"),
                              v43 != -[DNDConfiguration hideApplicationBadges](v7, "hideApplicationBadges"))
                          || (v44 = -[DNDConfiguration allowIntelligentManagement](self, "allowIntelligentManagement"),
                              v44 != -[DNDConfiguration allowIntelligentManagement](v7, "allowIntelligentManagement"))
                          || (v45 = -[DNDConfiguration compatibilityVersion](self, "compatibilityVersion"),
                              v45 != -[DNDConfiguration compatibilityVersion](v7, "compatibilityVersion"))
                          || (v46 = -[DNDConfiguration applicationConfigurationType](self, "applicationConfigurationType"), v46 != -[DNDConfiguration applicationConfigurationType](v7, "applicationConfigurationType")))
                        {
                          if (v36 != v61)
                          {

                            v16 = 0;
                            v48 = v67;
                            v4 = v56;
                            if (v68 == v67)
                            {
LABEL_60:

                              if (v72 != v69)
                              {

                              }
                              if (v17 != v75)
                              {

                              }
LABEL_95:

LABEL_75:
                              v15 = v73;
                              v14 = v74;
                              if (v10 != v11)
                                goto LABEL_76;
LABEL_78:

                              goto LABEL_79;
                            }
LABEL_59:

                            v48 = v67;
                            goto LABEL_60;
                          }
                          v16 = 0;
                          v4 = v56;
LABEL_83:

                          v48 = v67;
                          if (v68 == v67)
                            goto LABEL_60;
                          goto LABEL_59;
                        }
                        v47 = -[DNDConfiguration senderConfigurationType](self, "senderConfigurationType");
                        v16 = v47 == -[DNDConfiguration senderConfigurationType](v7, "senderConfigurationType");
                        v4 = v56;
                        if (v36 == v61)
                          goto LABEL_83;
                        goto LABEL_87;
                      }
                      v41 = v60;

                    }
                    else
                    {
                      v41 = v60;
                    }

                  }
                  else
                  {
                    v41 = v60;
                  }

                  if (v72 == v69)
                  {

                  }
                  else
                  {

                  }
                  if (v17 != v75)
                  {

                  }
LABEL_74:

                  v16 = 0;
                  goto LABEL_75;
                }

LABEL_45:
                if (v17 == v75)
                {

                }
                else
                {

                }
                goto LABEL_74;
              }

            }
            goto LABEL_45;
          }

        }
        goto LABEL_74;
      }
      v75 = (void *)v18;
      goto LABEL_20;
    }
    v16 = 0;
  }
LABEL_80:

  return v16;
}

- (id)description
{
  return -[DNDConfiguration _descriptionForRedacted:](self, "_descriptionForRedacted:", 0);
}

- (id)redactedDescription
{
  return -[DNDConfiguration _descriptionForRedacted:](self, "_descriptionForRedacted:", 1);
}

- (id)_descriptionForRedacted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSMutableSet *deniedWebApplicationIdentifiers;
  void *senderConfiguration;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  unint64_t applicationConfigurationType;
  unint64_t senderConfigurationType;
  const __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  NSMutableSet *allowedWebApplicationIdentifiers;
  NSMutableSet *deniedApplicationIdentifiers;
  NSMutableDictionary *allowedApplicationIdentifiers;
  uint64_t v24;
  void *v25;
  void *v26;
  _BOOL4 v27;

  v3 = a3;
  v25 = (void *)MEMORY[0x1E0CB3940];
  v24 = objc_opt_class();
  DNDStringFromInterruptionSuppression(self->_suppressionType);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  DNDStringFromInterruptionSuppressionMode(self->_suppressionMode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  allowedApplicationIdentifiers = self->_allowedApplicationIdentifiers;
  deniedWebApplicationIdentifiers = self->_deniedWebApplicationIdentifiers;
  allowedWebApplicationIdentifiers = self->_allowedWebApplicationIdentifiers;
  deniedApplicationIdentifiers = self->_deniedApplicationIdentifiers;
  senderConfiguration = self->_senderConfiguration;
  v27 = v3;
  if (v3)
  {
    objc_msgSend(senderConfiguration, "redactedDescription");
    senderConfiguration = (void *)objc_claimAutoreleasedReturnValue();
  }
  DNDStringFromBreakthroughUrgency(self->_minimumBreakthroughUrgency);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  DNDEnabledSettingToString(-[DNDConfiguration hideApplicationBadges](self, "hideApplicationBadges"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  DNDEnabledSettingToString(-[DNDConfiguration allowIntelligentManagement](self, "allowIntelligentManagement"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("Inclusive");
  applicationConfigurationType = self->_applicationConfigurationType;
  senderConfigurationType = self->_senderConfigurationType;
  if (applicationConfigurationType)
    v14 = CFSTR("Inclusive");
  else
    v14 = CFSTR("Exclusive");
  if (applicationConfigurationType == 2)
    v15 = CFSTR("Unconfigured");
  else
    v15 = (__CFString *)v14;
  if (!senderConfigurationType)
    v11 = CFSTR("Exclusive");
  if (senderConfigurationType == 2)
    v11 = CFSTR("Unconfigured");
  v16 = v11;
  v17 = v15;
  DNDCompatibilityVersionToString(-[DNDConfiguration compatibilityVersion](self, "compatibilityVersion"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("<%@: %p; suppressionType: %@; suppressionMode: %@ allowedApplicationIdentifiers: %@; deniedApplicationIdentifiers: %@; allowedWebApplicationIdentifiers: %@; deniedWebApplicationIdentifiers: %@; senderConfiguration: %@; minimumBreakthroughUrgency: %@; hideApplicationBadges: %@; allowIntelligentManagement: %@; applicationConfigurationType: %@; senderConfigurationType: %@; compatibilityVersion: %@; >"),
    v24,
    self,
    v26,
    v5,
    allowedApplicationIdentifiers,
    deniedApplicationIdentifiers,
    allowedWebApplicationIdentifiers,
    deniedWebApplicationIdentifiers,
    senderConfiguration,
    v8,
    v9,
    v10,
    v17,
    v16,
    v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  return v19;
}

- (void)log:(id)a3 withPrefix:(id)a4
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  unint64_t applicationConfigurationType;
  unint64_t senderConfigurationType;
  const __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  NSMutableDictionary *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  DNDMutableSenderConfiguration *v24;
  void *v25;
  NSMutableSet *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  DNDMutableSenderConfiguration *v31;
  NSMutableSet *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  DNDMutableSenderConfiguration *v37;
  NSMutableSet *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  DNDMutableSenderConfiguration *v43;
  DNDMutableSenderConfiguration *senderConfiguration;
  __CFString *v45;
  __CFString *v46;
  DNDMutableSenderConfiguration *v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
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
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint8_t v68[128];
  uint8_t buf[4];
  id v70;
  __int16 v71;
  DNDMutableSenderConfiguration *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  __CFString *v82;
  __int16 v83;
  __CFString *v84;
  __int16 v85;
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v70 = v6;
    _os_log_impl(&dword_19ABEB000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Begin configuration", buf, 0xCu);
  }
  v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    DNDStringFromInterruptionSuppression(self->_suppressionType);
    v47 = (DNDMutableSenderConfiguration *)objc_claimAutoreleasedReturnValue();
    DNDStringFromInterruptionSuppressionMode(self->_suppressionMode);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    DNDStringFromBreakthroughUrgency(self->_minimumBreakthroughUrgency);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    DNDEnabledSettingToString(-[DNDConfiguration hideApplicationBadges](self, "hideApplicationBadges"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    DNDEnabledSettingToString(-[DNDConfiguration allowIntelligentManagement](self, "allowIntelligentManagement"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("Inclusive");
    applicationConfigurationType = self->_applicationConfigurationType;
    senderConfigurationType = self->_senderConfigurationType;
    if (applicationConfigurationType)
      v15 = CFSTR("Inclusive");
    else
      v15 = CFSTR("Exclusive");
    if (applicationConfigurationType == 2)
      v16 = CFSTR("Unconfigured");
    else
      v16 = (__CFString *)v15;
    if (!senderConfigurationType)
      v12 = CFSTR("Exclusive");
    if (senderConfigurationType == 2)
      v17 = CFSTR("Unconfigured");
    else
      v17 = (__CFString *)v12;
    v46 = v17;
    v45 = v16;
    DNDCompatibilityVersionToString(-[DNDConfiguration compatibilityVersion](self, "compatibilityVersion"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545410;
    v70 = v6;
    v71 = 2114;
    v72 = v47;
    v73 = 2114;
    v74 = v8;
    v75 = 2114;
    v76 = v9;
    v77 = 2114;
    v78 = v10;
    v79 = 2114;
    v80 = v11;
    v81 = 2114;
    v82 = v16;
    v83 = 2114;
    v84 = v17;
    v85 = 2114;
    v86 = v18;
    _os_log_impl(&dword_19ABEB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] suppressionType: %{public}@; suppressionMode: %{public}@; minimumBreakthroughUrgency: %{public}@; hid"
      "eApplicationBadges: %{public}@; allowIntelligentManagement: %{public}@; applicationConfigurationType: %{public}@; "
      "senderConfigurationType: %{public}@; compatibilityVersion: %{public}@",
      buf,
      0x5Cu);

  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v19 = self->_allowedApplicationIdentifiers;
  v20 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v62 != v22)
          objc_enumerationMutation(v19);
        v24 = *(DNDMutableSenderConfiguration **)(*((_QWORD *)&v61 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_allowedApplicationIdentifiers, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543875;
          v70 = v6;
          v71 = 2113;
          v72 = v24;
          v73 = 2113;
          v74 = v25;
          _os_log_impl(&dword_19ABEB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Allowed app: %{private}@; %{private}@",
            buf,
            0x20u);
        }

      }
      v21 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
    }
    while (v21);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v26 = self->_deniedApplicationIdentifiers;
  v27 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v58 != v29)
          objc_enumerationMutation(v26);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v31 = *(DNDMutableSenderConfiguration **)(*((_QWORD *)&v57 + 1) + 8 * j);
          *(_DWORD *)buf = 138543619;
          v70 = v6;
          v71 = 2113;
          v72 = v31;
          _os_log_impl(&dword_19ABEB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Denied app: %{private}@", buf, 0x16u);
        }
      }
      v28 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
    }
    while (v28);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v32 = self->_allowedWebApplicationIdentifiers;
  v33 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v54;
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v54 != v35)
          objc_enumerationMutation(v32);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v37 = *(DNDMutableSenderConfiguration **)(*((_QWORD *)&v53 + 1) + 8 * k);
          *(_DWORD *)buf = 138543619;
          v70 = v6;
          v71 = 2113;
          v72 = v37;
          _os_log_impl(&dword_19ABEB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Allowed Web app: %{private}@", buf, 0x16u);
        }
      }
      v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
    }
    while (v34);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v38 = self->_deniedWebApplicationIdentifiers;
  v39 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v50;
    do
    {
      for (m = 0; m != v40; ++m)
      {
        if (*(_QWORD *)v50 != v41)
          objc_enumerationMutation(v38);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v43 = *(DNDMutableSenderConfiguration **)(*((_QWORD *)&v49 + 1) + 8 * m);
          *(_DWORD *)buf = 138543619;
          v70 = v6;
          v71 = 2113;
          v72 = v43;
          _os_log_impl(&dword_19ABEB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Denied Web app: %{private}@", buf, 0x16u);
        }
      }
      v40 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
    }
    while (v40);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    senderConfiguration = self->_senderConfiguration;
    *(_DWORD *)buf = 138543619;
    v70 = v6;
    v71 = 2113;
    v72 = senderConfiguration;
    _os_log_impl(&dword_19ABEB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] senderConfiguration: %{private}@", buf, 0x16u);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v70 = v6;
    _os_log_impl(&dword_19ABEB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] End configuration", buf, 0xCu);
  }

}

- (void)diffAgainstObject:(id)a3 usingDiffBuilder:(id)a4 withDescription:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;

  v38 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = v38;
    objc_msgSend(v8, "numberWithUnsignedInteger:", -[DNDConfiguration suppressionType](self, "suppressionType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "suppressionType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diffObject:againstObject:withDescription:", v10, v11, CFSTR("suppressionType"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DNDConfiguration suppressionMode](self, "suppressionMode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "suppressionMode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diffObject:againstObject:withDescription:", v12, v13, CFSTR("suppressionMode"));

    -[DNDConfiguration allowedApplicationIdentifiers](self, "allowedApplicationIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allowedApplicationIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diffObject:againstObject:withDescription:", v14, v15, CFSTR("allowedApplicationIdentifiers"));

    -[DNDConfiguration deniedApplicationIdentifiers](self, "deniedApplicationIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deniedApplicationIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diffObject:againstObject:withDescription:", v16, v17, CFSTR("deniedApplicationIdentifiers"));

    -[DNDConfiguration allowedWebApplicationIdentifiers](self, "allowedWebApplicationIdentifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allowedWebApplicationIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diffObject:againstObject:withDescription:", v18, v19, CFSTR("allowedWebApplicationIdentifiers"));

    -[DNDConfiguration deniedWebApplicationIdentifiers](self, "deniedWebApplicationIdentifiers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deniedWebApplicationIdentifiers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diffObject:againstObject:withDescription:", v20, v21, CFSTR("deniedWebApplicationIdentifiers"));

    -[DNDConfiguration senderConfiguration](self, "senderConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "senderConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diffObject:againstObject:withDescription:", v22, v23, CFSTR("senderConfiguration"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DNDConfiguration minimumBreakthroughUrgency](self, "minimumBreakthroughUrgency"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "minimumBreakthroughUrgency"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diffObject:againstObject:withDescription:", v24, v25, CFSTR("minimumBreakthroughUrgency"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DNDConfiguration hideApplicationBadges](self, "hideApplicationBadges"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "hideApplicationBadges"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diffObject:againstObject:withDescription:", v26, v27, CFSTR("hideApplicationBadges"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DNDConfiguration allowIntelligentManagement](self, "allowIntelligentManagement"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "allowIntelligentManagement"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diffObject:againstObject:withDescription:", v28, v29, CFSTR("allowIntelligentManagement]"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DNDConfiguration applicationConfigurationType](self, "applicationConfigurationType"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "applicationConfigurationType"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diffObject:againstObject:withDescription:", v30, v31, CFSTR("applicationConfigurationType"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DNDConfiguration senderConfigurationType](self, "senderConfigurationType"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "senderConfigurationType"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diffObject:againstObject:withDescription:", v32, v33, CFSTR("senderConfigurationType"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[DNDConfiguration compatibilityVersion](self, "compatibilityVersion"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)MEMORY[0x1E0CB37E8];
    v36 = objc_msgSend(v9, "compatibilityVersion");

    objc_msgSend(v35, "numberWithInteger:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diffObject:againstObject:withDescription:", v34, v37, CFSTR("compatibilityVersion"));

  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDConfiguration _initWithSuppressionType:suppressionMode:allowedApplicationIdentifiers:deniedApplicationIdentifiers:allowedWebApplicationIdentifiers:deniedWebApplicationIdentifiers:senderConfiguration:minimumBreakthroughUrgency:hideApplicationBadges:allowIntelligentManagement:compatibilityVersion:applicationConfigurationType:senderConfigurationType:]([DNDMutableConfiguration alloc], "_initWithSuppressionType:suppressionMode:allowedApplicationIdentifiers:deniedApplicationIdentifiers:allowedWebApplicationIdentifiers:deniedWebApplicationIdentifiers:senderConfiguration:minimumBreakthroughUrgency:hideApplicationBadges:allowIntelligentManagement:compatibilityVersion:applicationConfigurationType:senderConfigurationType:", self->_suppressionType, self->_suppressionMode, self->_allowedApplicationIdentifiers, self->_deniedApplicationIdentifiers, self->_allowedWebApplicationIdentifiers, self->_deniedWebApplicationIdentifiers, self->_senderConfiguration, self->_minimumBreakthroughUrgency, self->_hideApplicationBadges, self->_allowIntelligentManagement, -[DNDConfiguration compatibilityVersion](self, "compatibilityVersion"), self->_applicationConfigurationType, self->_senderConfigurationType);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDConfiguration)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  DNDConfiguration *v24;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[5];

  v33[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v28 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("suppressionType"));
  v27 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("suppressionMode"));
  v4 = (void *)MEMORY[0x1E0C99E60];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  v33[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("allowedApplicationIdentifiers"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99E60];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v9, CFSTR("deniedApplicationIdentifiers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v13, CFSTR("allowedWebApplicationIdentifiers"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C99E60];
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v17, CFSTR("deniedWebApplicationIdentifiers"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderConfiguration"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("minimumBreakthroughUrgency"));
  if (objc_msgSend(v3, "containsValueForKey:", CFSTR("hideApplicationBadges")))
    v21 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("hideApplicationBadges"));
  else
    v21 = 0;
  if (objc_msgSend(v3, "containsValueForKey:", CFSTR("allowIntelligentManagement")))
    v22 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("allowIntelligentManagement"));
  else
    v22 = 0;
  if (objc_msgSend(v3, "containsValueForKey:", CFSTR("compatibility")))
    v23 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("compatibility"));
  else
    v23 = 2;
  v24 = -[DNDConfiguration _initWithSuppressionType:suppressionMode:allowedApplicationIdentifiers:deniedApplicationIdentifiers:allowedWebApplicationIdentifiers:deniedWebApplicationIdentifiers:senderConfiguration:minimumBreakthroughUrgency:hideApplicationBadges:allowIntelligentManagement:compatibilityVersion:applicationConfigurationType:senderConfigurationType:](self, "_initWithSuppressionType:suppressionMode:allowedApplicationIdentifiers:deniedApplicationIdentifiers:allowedWebApplicationIdentifiers:deniedWebApplicationIdentifiers:senderConfiguration:minimumBreakthroughUrgency:hideApplicationBadges:allowIntelligentManagement:compatibilityVersion:applicationConfigurationType:senderConfigurationType:", v28, v27, v26, v10, v14, v18, v19, v20, v21, v22, v23, objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("applicationConfigurationType")), objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("senderConfigurationType")));

  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t suppressionType;
  id v5;

  suppressionType = self->_suppressionType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", suppressionType, CFSTR("suppressionType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_suppressionMode, CFSTR("suppressionMode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_allowedApplicationIdentifiers, CFSTR("allowedApplicationIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deniedApplicationIdentifiers, CFSTR("deniedApplicationIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_allowedWebApplicationIdentifiers, CFSTR("allowedWebApplicationIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deniedWebApplicationIdentifiers, CFSTR("deniedWebApplicationIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_senderConfiguration, CFSTR("senderConfiguration"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_minimumBreakthroughUrgency, CFSTR("minimumBreakthroughUrgency"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_hideApplicationBadges, CFSTR("hideApplicationBadges"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_allowIntelligentManagement, CFSTR("allowIntelligentManagement"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[DNDConfiguration compatibilityVersion](self, "compatibilityVersion"), CFSTR("compatibility"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_applicationConfigurationType, CFSTR("applicationConfigurationType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_senderConfigurationType, CFSTR("senderConfigurationType"));

}

- (NSSet)applicationsWithExceptions
{
  unint64_t v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = (id)objc_opt_new();
  v3 = -[DNDConfiguration applicationConfigurationType](self, "applicationConfigurationType");
  if (v3 == 1)
  {
    -[NSMutableSet allObjects](self->_deniedApplicationIdentifiers, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObjectsFromArray:", v14);

  }
  else if (!v3)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = self->_allowedApplicationIdentifiers;
    v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[NSMutableDictionary objectForKey:](self->_allowedApplicationIdentifiers, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "allowedThreads");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "count"))
          {

          }
          else
          {
            objc_msgSend(v10, "deniedThreads");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "count");

            if (!v13)
              objc_msgSend(v16, "addObject:", v9);
          }

        }
        v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }

  }
  return (NSSet *)v16;
}

- (unint64_t)exceptionForApplication:(id)a3
{
  id v4;
  DNDApplicationIdentifier *v5;
  unint64_t v6;

  v4 = a3;
  v5 = -[DNDApplicationIdentifier initWithBundleID:]([DNDApplicationIdentifier alloc], "initWithBundleID:", v4);

  v6 = -[DNDConfiguration _exceptionForApplicationIdentifier:thread:](self, "_exceptionForApplicationIdentifier:thread:", v5, 0);
  return v6;
}

- (unint64_t)exceptionForApplication:(id)a3 thread:(id)a4
{
  id v6;
  id v7;
  DNDApplicationIdentifier *v8;
  unint64_t v9;

  v6 = a4;
  v7 = a3;
  v8 = -[DNDApplicationIdentifier initWithBundleID:]([DNDApplicationIdentifier alloc], "initWithBundleID:", v7);

  v9 = -[DNDConfiguration _exceptionForApplicationIdentifier:thread:](self, "_exceptionForApplicationIdentifier:thread:", v8, v6);
  return v9;
}

- (unint64_t)exceptionForApplicationIdentifier:(id)a3
{
  return -[DNDConfiguration _exceptionForApplicationIdentifier:thread:](self, "_exceptionForApplicationIdentifier:thread:", a3, 0);
}

- (unint64_t)_exceptionForApplicationIdentifier:(id)a3 thread:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t (**v9)(_QWORD, _QWORD, _QWORD);
  DNDApplicationIdentifier *v10;
  void *v11;
  DNDApplicationIdentifier *v12;
  void *v13;
  uint64_t v14;
  DNDApplicationIdentifier *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *, void *);
  void *v22;
  DNDConfiguration *v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __62__DNDConfiguration__exceptionForApplicationIdentifier_thread___block_invoke;
  v22 = &unk_1E39B5900;
  v23 = self;
  v8 = v7;
  v24 = v8;
  v9 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AECF898](&v19);
  if (((uint64_t (**)(_QWORD, id, id))v9)[2](v9, v6, v8) == 2)
  {
    if (objc_msgSend(v6, "platform", v19, v20, v21, v22, v23) == 1)
    {
      v10 = [DNDApplicationIdentifier alloc];
      objc_msgSend(v6, "bundleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v10;
      v13 = v11;
      v14 = 3;
LABEL_6:
      v16 = -[DNDApplicationIdentifier initWithBundleID:platform:](v12, "initWithBundleID:platform:", v13, v14);

      v6 = (id)v16;
      goto LABEL_7;
    }
    if (objc_msgSend(v6, "platform") == 3)
    {
      v15 = [DNDApplicationIdentifier alloc];
      objc_msgSend(v6, "bundleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v15;
      v13 = v11;
      v14 = 1;
      goto LABEL_6;
    }
  }
LABEL_7:
  v17 = ((uint64_t (**)(_QWORD, id, id))v9)[2](v9, v6, v8);

  return v17;
}

uint64_t __62__DNDConfiguration__exceptionForApplicationIdentifier_thread___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!*(_QWORD *)(a1 + 40))
  {
    if (v7)
    {
      objc_msgSend(v7, "allowedThreads");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v15, "count"))
      {
        objc_msgSend(v8, "deniedThreads");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count") != 0;

        v16 = 2 * v18;
LABEL_15:
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "containsObject:", v5))
          v14 = 1;
        else
          v14 = v16;
        goto LABEL_18;
      }

    }
    v16 = 2;
    goto LABEL_15;
  }
  if (v7)
  {
    objc_msgSend(v7, "allowedThreads");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v6);

    if (v10)
      v11 = 0;
    else
      v11 = 2;
    objc_msgSend(v8, "deniedThreads");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v6);

    if (v13)
      v14 = 1;
    else
      v14 = v11;
  }
  else
  {
    v14 = 2;
  }
LABEL_18:

  return v14;
}

- (NSDictionary)threadsWithExceptions
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_allowedApplicationIdentifiers;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_allowedApplicationIdentifiers, "objectForKey:", v9, (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[DNDConfiguration threadConfigurationType](self, "threadConfigurationType");
        if (v11 == 1)
        {
          objc_msgSend(v10, "deniedThreads");
          v12 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v11)
            goto LABEL_11;
          objc_msgSend(v10, "allowedThreads");
          v12 = objc_claimAutoreleasedReturnValue();
        }
        v13 = (void *)v12;
        objc_msgSend(v3, "setObject:forKey:", v12, v9);

LABEL_11:
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (NSSet)webApplicationsWithExceptions
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  v4 = -[DNDConfiguration applicationConfigurationType](self, "applicationConfigurationType");
  if (!v4)
  {
    v5 = 40;
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    v5 = 48;
LABEL_5:
    objc_msgSend(*(id *)((char *)&self->super.isa + v5), "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v6);

  }
  return (NSSet *)v3;
}

- (unint64_t)exceptionForWebApplicationIdentifier:(id)a3
{
  NSMutableSet *allowedWebApplicationIdentifiers;
  id v5;
  unint64_t v6;
  int v7;

  allowedWebApplicationIdentifiers = self->_allowedWebApplicationIdentifiers;
  v5 = a3;
  if (-[NSMutableSet containsObject:](allowedWebApplicationIdentifiers, "containsObject:", v5))
    v6 = 0;
  else
    v6 = 2;
  v7 = -[NSMutableSet containsObject:](self->_deniedWebApplicationIdentifiers, "containsObject:", v5);

  if (v7)
    return 1;
  else
    return v6;
}

- (NSSet)contactsWithExceptions
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  v4 = -[DNDConfiguration senderConfigurationType](self, "senderConfigurationType");
  if (v4 == 1)
  {
    -[DNDSenderConfiguration deniedContacts](self->_senderConfiguration, "deniedContacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v4)
  {
    -[DNDSenderConfiguration allowedContacts](self->_senderConfiguration, "allowedContacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = v5;
    objc_msgSend(v5, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v7);

  }
  return (NSSet *)v3;
}

- (unint64_t)exceptionForContactHandle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 2;
  -[DNDSenderConfiguration allowedContacts](self->_senderConfiguration, "allowedContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __46__DNDConfiguration_exceptionForContactHandle___block_invoke;
  v15[3] = &unk_1E39B5928;
  v7 = v4;
  v16 = v7;
  v17 = &v18;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v15);

  -[DNDSenderConfiguration deniedContacts](self->_senderConfiguration, "deniedContacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __46__DNDConfiguration_exceptionForContactHandle___block_invoke_2;
  v12[3] = &unk_1E39B5928;
  v9 = v7;
  v13 = v9;
  v14 = &v18;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

  v10 = v19[3];
  _Block_object_dispose(&v18, 8);

  return v10;
}

uint64_t __46__DNDConfiguration_exceptionForContactHandle___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "matchesContactHandle:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

uint64_t __46__DNDConfiguration_exceptionForContactHandle___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "matchesContactHandle:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (DNDBypassSettings)phoneCallBypassSettings
{
  return -[DNDSenderConfiguration phoneCallBypassSettings](self->_senderConfiguration, "phoneCallBypassSettings");
}

- (BOOL)isSupportedConfiguration
{
  uint64_t v2;
  BOOL v3;
  BOOL v4;
  BOOL v5;

  v2 = -[DNDConfiguration compatibilityVersion](self, "compatibilityVersion");
  if (v2 < 21)
  {
    v5 = __OFSUB__(2, v2);
    v3 = v2 == 2;
    v4 = 2 - v2 < 0;
  }
  else
  {
    v5 = 0;
    v3 = 0;
    v4 = 0;
  }
  return (v4 ^ v5 | v3) != 0;
}

- (int64_t)compatibilityVersion
{
  int64_t result;
  void *v4;
  void *v5;
  uint64_t v6;

  result = self->_compatibilityVersion;
  if (result <= 20)
  {
    -[DNDConfiguration allowedWebApplicationIdentifiers](self, "allowedWebApplicationIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {

      return 11;
    }
    -[DNDConfiguration deniedWebApplicationIdentifiers](self, "deniedWebApplicationIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
      return 11;
    if (-[DNDConfiguration applicationConfigurationType](self, "applicationConfigurationType")
      || -[DNDConfiguration senderConfigurationType](self, "senderConfigurationType")
      || -[DNDConfiguration threadConfigurationType](self, "threadConfigurationType"))
    {
      return 10;
    }
    else if (-[DNDConfiguration allowIntelligentManagement](self, "allowIntelligentManagement") == 2)
    {
      return 20;
    }
    else
    {
      return 3;
    }
  }
  return result;
}

- (int64_t)rawCompatibilityVersion
{
  return self->_compatibilityVersion;
}

- (unint64_t)type
{
  return self->_applicationConfigurationType;
}

- (unint64_t)suppressionType
{
  return self->_suppressionType;
}

- (unint64_t)suppressionMode
{
  return self->_suppressionMode;
}

- (NSDictionary)allowedApplicationIdentifiers
{
  return &self->_allowedApplicationIdentifiers->super;
}

- (NSSet)deniedApplicationIdentifiers
{
  return &self->_deniedApplicationIdentifiers->super;
}

- (NSSet)allowedWebApplicationIdentifiers
{
  return &self->_allowedWebApplicationIdentifiers->super;
}

- (void)setAllowedWebApplicationIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSSet)deniedWebApplicationIdentifiers
{
  return &self->_deniedWebApplicationIdentifiers->super;
}

- (void)setDeniedWebApplicationIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (DNDSenderConfiguration)senderConfiguration
{
  return &self->_senderConfiguration->super;
}

- (unint64_t)minimumBreakthroughUrgency
{
  return self->_minimumBreakthroughUrgency;
}

- (unint64_t)hideApplicationBadges
{
  return self->_hideApplicationBadges;
}

- (unint64_t)allowIntelligentManagement
{
  return self->_allowIntelligentManagement;
}

- (unint64_t)applicationConfigurationType
{
  return self->_applicationConfigurationType;
}

- (unint64_t)senderConfigurationType
{
  return self->_senderConfigurationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderConfiguration, 0);
  objc_storeStrong((id *)&self->_deniedWebApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_allowedWebApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_deniedApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_allowedApplicationIdentifiers, 0);
}

@end
