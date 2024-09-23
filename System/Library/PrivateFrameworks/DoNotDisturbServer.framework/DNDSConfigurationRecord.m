@implementation DNDSConfigurationRecord

- (DNDSConfigurationRecord)init
{
  return (DNDSConfigurationRecord *)-[DNDSConfigurationRecord _initWithRecord:](self, "_initWithRecord:", 0);
}

- (id)_initWithRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "applicationConfigurationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "senderConfigurationType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suppressionType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suppressionMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimumBreakthroughUrgency");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hideApplicationBadges");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowIntelligentManagement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "compatibilityVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[DNDSConfigurationRecord _initWithApplicationConfigurationType:senderConfigurationType:suppressionType:suppressionMode:minimumBreakthroughUrgency:hideApplicationBadges:allowIntelligentManagement:compatibilityVersion:](self, "_initWithApplicationConfigurationType:senderConfigurationType:suppressionType:suppressionMode:minimumBreakthroughUrgency:hideApplicationBadges:allowIntelligentManagement:compatibilityVersion:", v5, v6, v7, v8, v9, v10, v11, v12);
  return v13;
}

- (id)_initWithApplicationConfigurationType:(id)a3 senderConfigurationType:(id)a4 suppressionType:(id)a5 suppressionMode:(id)a6 minimumBreakthroughUrgency:(id)a7 hideApplicationBadges:(id)a8 allowIntelligentManagement:(id)a9 compatibilityVersion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  DNDSConfigurationRecord *v24;
  void *v25;
  void *v26;
  NSNumber *v27;
  NSNumber *applicationConfigurationType;
  void *v29;
  void *v30;
  NSNumber *v31;
  NSNumber *senderConfigurationType;
  void *v33;
  void *v34;
  NSNumber *v35;
  NSNumber *suppressionType;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSNumber *v42;
  NSNumber *minimumBreakthroughUrgency;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v54;
  objc_super v55;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v55.receiver = self;
  v55.super_class = (Class)DNDSConfigurationRecord;
  v24 = -[DNDSConfigurationRecord init](&v55, sel_init);
  if (v24)
  {
    v54 = v16;
    v25 = (void *)objc_msgSend(v16, "copy");
    v26 = v25;
    if (v25)
    {
      v27 = v25;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E0D1D5B8], "defaultConfigurationType"));
      v27 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    applicationConfigurationType = v24->_applicationConfigurationType;
    v24->_applicationConfigurationType = v27;

    v29 = (void *)objc_msgSend(v17, "copy");
    v30 = v29;
    if (v29)
    {
      v31 = v29;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E0D1D5B8], "defaultConfigurationType"));
      v31 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    senderConfigurationType = v24->_senderConfigurationType;
    v24->_senderConfigurationType = v31;

    v33 = (void *)objc_msgSend(v18, "copy");
    v34 = v33;
    if (v33)
    {
      v35 = v33;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E0D1D5B8], "defaultSuppressionType"));
      v35 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    suppressionType = v24->_suppressionType;
    v24->_suppressionType = v35;

    v37 = objc_msgSend(v19, "copy");
    v38 = (void *)v37;
    if (v37)
      v39 = (void *)v37;
    else
      v39 = &unk_1E86DE5C8;
    objc_storeStrong((id *)&v24->_suppressionMode, v39);

    v40 = (void *)objc_msgSend(v20, "copy");
    v41 = v40;
    if (v40)
    {
      v42 = v40;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E0D1D5B8], "defaultMinimumBreakthroughUrgency"));
      v42 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    minimumBreakthroughUrgency = v24->_minimumBreakthroughUrgency;
    v24->_minimumBreakthroughUrgency = v42;

    v44 = objc_msgSend(v21, "copy");
    v45 = (void *)v44;
    if (v44)
      v46 = (void *)v44;
    else
      v46 = &unk_1E86DE5C8;
    objc_storeStrong((id *)&v24->_hideApplicationBadges, v46);

    v47 = objc_msgSend(v22, "copy");
    v48 = (void *)v47;
    if (v47)
      v49 = (void *)v47;
    else
      v49 = &unk_1E86DE5C8;
    objc_storeStrong((id *)&v24->_allowIntelligentManagement, v49);

    v50 = objc_msgSend(v23, "copy");
    v51 = (void *)v50;
    if (v50)
      v52 = (void *)v50;
    else
      v52 = &unk_1E86DE5E0;
    objc_storeStrong((id *)&v24->_compatibilityVersion, v52);

    v16 = v54;
  }

  return v24;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
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
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;

  -[DNDSConfigurationRecord applicationConfigurationType](self, "applicationConfigurationType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDSConfigurationRecord senderConfigurationType](self, "senderConfigurationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DNDSConfigurationRecord minimumBreakthroughUrgency](self, "minimumBreakthroughUrgency");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[DNDSConfigurationRecord suppressionType](self, "suppressionType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[DNDSConfigurationRecord suppressionMode](self, "suppressionMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[DNDSConfigurationRecord hideApplicationBadges](self, "hideApplicationBadges");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[DNDSConfigurationRecord allowIntelligentManagement](self, "allowIntelligentManagement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");
  -[DNDSConfigurationRecord compatibilityVersion](self, "compatibilityVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  DNDSConfigurationRecord *v4;
  DNDSConfigurationRecord *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
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
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;

  v4 = (DNDSConfigurationRecord *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DNDSConfigurationRecord applicationConfigurationType](self, "applicationConfigurationType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSConfigurationRecord applicationConfigurationType](v5, "applicationConfigurationType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
      {
        v8 = 0;
LABEL_66:

        goto LABEL_67;
      }
      -[DNDSConfigurationRecord senderConfigurationType](self, "senderConfigurationType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSConfigurationRecord senderConfigurationType](v5, "senderConfigurationType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 != v10)
      {
        v8 = 0;
LABEL_65:

        goto LABEL_66;
      }
      -[DNDSConfigurationRecord minimumBreakthroughUrgency](self, "minimumBreakthroughUrgency");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSConfigurationRecord minimumBreakthroughUrgency](v5, "minimumBreakthroughUrgency");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v11;
      if (v11 != v12)
      {
        -[DNDSConfigurationRecord minimumBreakthroughUrgency](self, "minimumBreakthroughUrgency");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v8 = 0;
          goto LABEL_64;
        }
        v14 = (void *)v13;
        -[DNDSConfigurationRecord minimumBreakthroughUrgency](v5, "minimumBreakthroughUrgency");
        v15 = objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          v8 = 0;
LABEL_63:

          goto LABEL_64;
        }
        v79 = (void *)v15;
        -[DNDSConfigurationRecord minimumBreakthroughUrgency](self, "minimumBreakthroughUrgency");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSConfigurationRecord minimumBreakthroughUrgency](v5, "minimumBreakthroughUrgency");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = v11;
        if (!objc_msgSend(v11, "isEqual:"))
        {
          v8 = 0;
LABEL_62:

          goto LABEL_63;
        }
        v76 = v14;
      }
      -[DNDSConfigurationRecord suppressionType](self, "suppressionType");
      v16 = objc_claimAutoreleasedReturnValue();
      -[DNDSConfigurationRecord suppressionType](v5, "suppressionType");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = (void *)v16;
      if ((void *)v16 != v80)
      {
        -[DNDSConfigurationRecord suppressionType](self, "suppressionType");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v74 = (void *)v17;
          -[DNDSConfigurationRecord suppressionType](v5, "suppressionType");
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v71 = (void *)v18;
            -[DNDSConfigurationRecord suppressionType](self, "suppressionType");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSConfigurationRecord suppressionType](v5, "suppressionType");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v11, "isEqual:", v19) & 1) != 0)
            {
              v67 = v19;
              goto LABEL_20;
            }

          }
        }

LABEL_60:
        v8 = 0;
        goto LABEL_61;
      }
LABEL_20:
      -[DNDSConfigurationRecord suppressionMode](self, "suppressionMode");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSConfigurationRecord suppressionMode](v5, "suppressionMode");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v11;
      v73 = v20;
      if (v20 == v75)
        goto LABEL_27;
      -[DNDSConfigurationRecord suppressionMode](self, "suppressionMode");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v68 = (void *)v21;
        -[DNDSConfigurationRecord suppressionMode](v5, "suppressionMode");
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v66 = (void *)v22;
          -[DNDSConfigurationRecord suppressionMode](self, "suppressionMode");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSConfigurationRecord suppressionMode](v5, "suppressionMode");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v23, "isEqual:", v24) & 1) != 0)
          {
            v63 = v24;
            v64 = v23;
LABEL_27:
            -[DNDSConfigurationRecord hideApplicationBadges](self, "hideApplicationBadges");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSConfigurationRecord hideApplicationBadges](v5, "hideApplicationBadges");
            v69 = v25;
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25 == v70)
              goto LABEL_35;
            -[DNDSConfigurationRecord hideApplicationBadges](self, "hideApplicationBadges");
            v26 = objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              v65 = (void *)v26;
              -[DNDSConfigurationRecord hideApplicationBadges](v5, "hideApplicationBadges");
              v27 = objc_claimAutoreleasedReturnValue();
              v28 = v73;
              if (!v27)
              {

                v46 = v75;
                goto LABEL_53;
              }
              v60 = (void *)v27;
              -[DNDSConfigurationRecord hideApplicationBadges](self, "hideApplicationBadges");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[DNDSConfigurationRecord hideApplicationBadges](v5, "hideApplicationBadges");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v29, "isEqual:", v30) & 1) != 0)
              {
                v57 = v30;
                v58 = v29;
LABEL_35:
                -[DNDSConfigurationRecord allowIntelligentManagement](self, "allowIntelligentManagement");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                -[DNDSConfigurationRecord allowIntelligentManagement](v5, "allowIntelligentManagement");
                v32 = objc_claimAutoreleasedReturnValue();
                v33 = (void *)v32;
                if (v31 == (void *)v32)
                {
                  v61 = v31;
                  v62 = (void *)v32;
                  goto LABEL_46;
                }
                -[DNDSConfigurationRecord allowIntelligentManagement](self, "allowIntelligentManagement");
                v34 = objc_claimAutoreleasedReturnValue();
                if (v34)
                {
                  v59 = (void *)v34;
                  v61 = v31;
                  v62 = v33;
                  -[DNDSConfigurationRecord allowIntelligentManagement](v5, "allowIntelligentManagement");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v36 = v73;
                  if (v35)
                  {
                    v56 = v35;
                    -[DNDSConfigurationRecord allowIntelligentManagement](self, "allowIntelligentManagement");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    -[DNDSConfigurationRecord allowIntelligentManagement](v5, "allowIntelligentManagement");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v37, "isEqual:", v38) & 1) != 0)
                    {
                      v53 = v38;
                      v54 = v37;
LABEL_46:
                      -[DNDSConfigurationRecord compatibilityVersion](self, "compatibilityVersion");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      -[DNDSConfigurationRecord compatibilityVersion](v5, "compatibilityVersion");
                      v42 = objc_claimAutoreleasedReturnValue();
                      if (v41 == (void *)v42)
                      {

                        v8 = 1;
                      }
                      else
                      {
                        v55 = (void *)v42;
                        -[DNDSConfigurationRecord compatibilityVersion](self, "compatibilityVersion");
                        v43 = objc_claimAutoreleasedReturnValue();
                        if (v43)
                        {
                          v52 = (void *)v43;
                          -[DNDSConfigurationRecord compatibilityVersion](v5, "compatibilityVersion");
                          v44 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v44)
                          {
                            v51 = v44;
                            -[DNDSConfigurationRecord compatibilityVersion](self, "compatibilityVersion");
                            v50 = (void *)objc_claimAutoreleasedReturnValue();
                            -[DNDSConfigurationRecord compatibilityVersion](v5, "compatibilityVersion");
                            v45 = (void *)objc_claimAutoreleasedReturnValue();
                            v8 = objc_msgSend(v50, "isEqual:");

                            v44 = v51;
                          }
                          else
                          {
                            v8 = 0;
                          }

                        }
                        else
                        {

                          v8 = 0;
                        }
                      }
                      if (v61 != v62)
                      {

                      }
                      if (v69 != v70)
                      {

                      }
                      if (v73 != v75)
                      {

                      }
                      if (v81 != v80)
                      {

                      }
LABEL_61:
                      v14 = v76;
                      if (v82 != v12)
                        goto LABEL_62;
LABEL_64:

                      goto LABEL_65;
                    }

                    v35 = v56;
                    v36 = v73;
                  }

                  v48 = v69;
                  v49 = v70;
                  if (v69 == v70)
                    goto LABEL_74;
                }
                else
                {

                  v48 = v69;
                  v49 = v70;
                  v36 = v73;
                  if (v69 == v70)
                    goto LABEL_74;
                }

LABEL_74:
                if (v36 != v75)
                {

                }
                v39 = v81;
                if (v81 != v80)
                {

                }
                goto LABEL_59;
              }

            }
            v46 = v75;
            v28 = v73;
LABEL_53:
            if (v28 == v46)
            {

            }
            else
            {

            }
            v40 = v80;
            v39 = v81;
            if (v81 == v80)
              goto LABEL_58;
            goto LABEL_57;
          }

LABEL_43:
          v40 = v80;
          v39 = v81;
          if (v81 == v80)
          {

LABEL_59:
            goto LABEL_60;
          }
LABEL_57:

LABEL_58:
          goto LABEL_59;
        }

      }
      goto LABEL_43;
    }
    v8 = 0;
  }
LABEL_67:

  return v8;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v18 = (void *)MEMORY[0x1E0CB3940];
  v17 = objc_opt_class();
  -[DNDSConfigurationRecord applicationConfigurationType](self, "applicationConfigurationType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "unsignedIntegerValue");
  DNDStringFromConfigurationType();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSConfigurationRecord senderConfigurationType](self, "senderConfigurationType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "unsignedIntegerValue");
  DNDStringFromConfigurationType();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSConfigurationRecord suppressionType](self, "suppressionType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "unsignedIntegerValue");
  DNDStringFromInterruptionSuppression();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSConfigurationRecord suppressionMode](self, "suppressionMode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "unsignedIntegerValue");
  DNDStringFromInterruptionSuppressionMode();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSConfigurationRecord minimumBreakthroughUrgency](self, "minimumBreakthroughUrgency");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unsignedIntegerValue");
  DNDStringFromBreakthroughUrgency();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSConfigurationRecord hideApplicationBadges](self, "hideApplicationBadges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unsignedIntegerValue");
  DNDEnabledSettingToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSConfigurationRecord allowIntelligentManagement](self, "allowIntelligentManagement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unsignedIntegerValue");
  DNDEnabledSettingToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSConfigurationRecord compatibilityVersion](self, "compatibilityVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "integerValue");
  DNDCompatibilityVersionToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@: %p; applicationConfigurationType: %@; senderConfigurationType: %@; suppressionType: %@; suppressionMode: %@; minimumBreakthroughUrgency: %@; hideApplicationBadges: %@; allowIntelligentManagement: %@; compatibilityVersion: %@>"),
    v17,
    self,
    v15,
    v22,
    v12,
    v13,
    v3,
    v5,
    v7,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSConfigurationRecord _initWithRecord:]([DNDSMutableConfigurationRecord alloc], "_initWithRecord:", self);
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  return a3;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "bs_safeObjectForKey:ofType:", CFSTR("applicationConfigurationType"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_safeObjectForKey:ofType:", CFSTR("senderConfigurationType"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_safeObjectForKey:ofType:", CFSTR("suppressionType"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_safeNumberForKey:", CFSTR("suppressionMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentRecord");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "currentRecord");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "suppressionMode");
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  objc_msgSend(v6, "bs_safeObjectForKey:ofType:", CFSTR("minimumBreakthroughUrgency"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_safeNumberForKey:", CFSTR("hideApplicationBadges"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_safeNumberForKey:", CFSTR("allowIntelligentManagement"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_safeNumberForKey:", CFSTR("compatibilityVersion"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithApplicationConfigurationType:senderConfigurationType:suppressionType:suppressionMode:minimumBreakthroughUrgency:hideApplicationBadges:allowIntelligentManagement:compatibilityVersion:", v21, v8, v9, v10, v15, v16, v17, v18);

  return v19;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(a3, "healingSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  -[DNDSConfigurationRecord applicationConfigurationType](self, "applicationConfigurationType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("applicationConfigurationType"));

  -[DNDSConfigurationRecord senderConfigurationType](self, "senderConfigurationType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("senderConfigurationType"));

  -[DNDSConfigurationRecord suppressionType](self, "suppressionType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("suppressionType"));

  -[DNDSConfigurationRecord suppressionMode](self, "suppressionMode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v12, CFSTR("suppressionMode"));

  -[DNDSConfigurationRecord minimumBreakthroughUrgency](self, "minimumBreakthroughUrgency");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v13, CFSTR("minimumBreakthroughUrgency"));

  -[DNDSConfigurationRecord hideApplicationBadges](self, "hideApplicationBadges");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v14, CFSTR("hideApplicationBadges"));

  -[DNDSConfigurationRecord allowIntelligentManagement](self, "allowIntelligentManagement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v15, CFSTR("allowIntelligentManagement"));

  -[DNDSConfigurationRecord compatibilityVersion](self, "compatibilityVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v16, CFSTR("compatibilityVersion"));

  return v8;
}

- (NSNumber)applicationConfigurationType
{
  return self->_applicationConfigurationType;
}

- (NSNumber)senderConfigurationType
{
  return self->_senderConfigurationType;
}

- (NSNumber)suppressionType
{
  return self->_suppressionType;
}

- (NSNumber)suppressionMode
{
  return self->_suppressionMode;
}

- (NSNumber)minimumBreakthroughUrgency
{
  return self->_minimumBreakthroughUrgency;
}

- (NSNumber)hideApplicationBadges
{
  return self->_hideApplicationBadges;
}

- (NSNumber)allowIntelligentManagement
{
  return self->_allowIntelligentManagement;
}

- (NSNumber)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compatibilityVersion, 0);
  objc_storeStrong((id *)&self->_allowIntelligentManagement, 0);
  objc_storeStrong((id *)&self->_hideApplicationBadges, 0);
  objc_storeStrong((id *)&self->_minimumBreakthroughUrgency, 0);
  objc_storeStrong((id *)&self->_suppressionMode, 0);
  objc_storeStrong((id *)&self->_suppressionType, 0);
  objc_storeStrong((id *)&self->_senderConfigurationType, 0);
  objc_storeStrong((id *)&self->_applicationConfigurationType, 0);
}

@end
