@implementation DNDSModeConfigurationRecord

- (DNDSModeConfigurationRecord)init
{
  return (DNDSModeConfigurationRecord *)-[DNDSModeConfigurationRecord _initWithRecord:](self, "_initWithRecord:", 0);
}

- (id)_initWithRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  void *v20;
  _QWORD v21[3];

  v3 = a3;
  objc_msgSend(v3, "mode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secureConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "triggers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v3, "impactsAvailability");
  v6 = objc_msgSend(v3, "dimsLockScreen");
  objc_msgSend(v3, "created");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastModified");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v3, "lastModifiedByVersion");
  else
    memset(v21, 0, sizeof(v21));
  objc_msgSend(v3, "lastModifiedByDeviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "isAutomaticallyGenerated");
  v11 = objc_msgSend(v3, "compatibilityVersion");
  v12 = objc_msgSend(v3, "ephemeralResolvedCompatibilityVersion");
  LOBYTE(v16) = objc_msgSend(v3, "hasSecureData");
  LOBYTE(v15) = v10;
  v13 = -[DNDSModeConfigurationRecord _initWithMode:configuration:secureConfiguration:triggers:impactsAvailability:dimsLockScreen:created:lastModified:lastModifiedByVersion:lastModifiedByDeviceID:automaticallyGenerated:compatibilityVersion:ephemeralResolvedCompatibilityVersion:hasSecureData:](self, "_initWithMode:configuration:secureConfiguration:triggers:impactsAvailability:dimsLockScreen:created:lastModified:lastModifiedByVersion:lastModifiedByDeviceID:automaticallyGenerated:compatibilityVersion:ephemeralResolvedCompatibilityVersion:hasSecureData:", v20, v19, v4, v5, v17, v6, v7, v8, v21, v9, v15, v11, v12, v16);

  return v13;
}

- (id)_initWithMode:(id)a3 configuration:(id)a4 secureConfiguration:(id)a5 triggers:(id)a6 impactsAvailability:(unint64_t)a7 dimsLockScreen:(unint64_t)a8 created:(id)a9 lastModified:(id)a10 lastModifiedByVersion:(id *)a11 lastModifiedByDeviceID:(id)a12 automaticallyGenerated:(BOOL)a13 compatibilityVersion:(int64_t)a14 ephemeralResolvedCompatibilityVersion:(int64_t)a15 hasSecureData:(BOOL)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  uint64_t v42;
  void *v43;
  objc_super v46;

  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = a9;
  v26 = a10;
  v27 = a12;
  v46.receiver = self;
  v46.super_class = (Class)DNDSModeConfigurationRecord;
  v28 = -[DNDSModeConfigurationRecord init](&v46, sel_init);
  if (v28)
  {
    v29 = objc_msgSend(v21, "copy");
    v30 = (void *)*((_QWORD *)v28 + 1);
    *((_QWORD *)v28 + 1) = v29;

    v31 = objc_msgSend(v22, "copy");
    v32 = (void *)*((_QWORD *)v28 + 2);
    *((_QWORD *)v28 + 2) = v31;

    v33 = objc_msgSend(v23, "copy");
    v34 = (void *)*((_QWORD *)v28 + 3);
    *((_QWORD *)v28 + 3) = v33;

    v35 = objc_msgSend(v24, "copy");
    v36 = (void *)*((_QWORD *)v28 + 4);
    *((_QWORD *)v28 + 4) = v35;

    *((_QWORD *)v28 + 5) = a7;
    *((_QWORD *)v28 + 6) = a8;
    v37 = objc_msgSend(v25, "copy");
    v38 = (void *)*((_QWORD *)v28 + 7);
    *((_QWORD *)v28 + 7) = v37;

    v39 = objc_msgSend(v26, "copy");
    v40 = (void *)*((_QWORD *)v28 + 8);
    *((_QWORD *)v28 + 8) = v39;

    v41 = *(_OWORD *)&a11->var0;
    *((_QWORD *)v28 + 11) = a11->var2;
    *(_OWORD *)(v28 + 72) = v41;
    v42 = objc_msgSend(v27, "copy");
    v43 = (void *)*((_QWORD *)v28 + 12);
    *((_QWORD *)v28 + 12) = v42;

    v28[104] = a13;
    *((_QWORD *)v28 + 14) = a14;
    *((_QWORD *)v28 + 15) = a15;
    v28[105] = a16;
  }

  return v28;
}

- (void)log:(id)a3 withMessage:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  _BOOL4 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[DNDSModeConfigurationRecord mode](self, "mode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v26 = v9;
    v27 = 2114;
    v28 = v7;
    _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Begin: %{public}@", buf, 0x16u);
  }
  v10 = v6;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[DNDSModeConfigurationRecord shortDescription](self, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v9;
    v27 = 2114;
    v28 = v11;
    _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@", buf, 0x16u);

  }
  v12 = v10;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[DNDSModeConfigurationRecord created](self, "created");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeConfigurationRecord lastModified](self, "lastModified");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeConfigurationRecord lastModifiedByVersion](self, "lastModifiedByVersion");
    DNDStringFromOperatingSystemVersion();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeConfigurationRecord lastModifiedByDeviceID](self, "lastModifiedByDeviceID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[DNDSModeConfigurationRecord isAutomaticallyGenerated](self, "isAutomaticallyGenerated");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[DNDSModeConfigurationRecord compatibilityVersion](self, "compatibilityVersion"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[DNDSModeConfigurationRecord hasSecureData](self, "hasSecureData");
    *(_DWORD *)buf = 138545154;
    v26 = v9;
    v27 = 2114;
    v28 = v13;
    v29 = 2114;
    v30 = v14;
    v31 = 2114;
    v32 = v15;
    v33 = 2112;
    v34 = v16;
    v35 = 1026;
    v36 = v17;
    v37 = 2114;
    v38 = v18;
    v39 = 1026;
    v40 = v19;
    _os_log_impl(&dword_1CB895000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] created: %{public}@; lastModified: %{public}@; lastModifiedByVersion: %{public}@; lastModifiedByDevic"
      "eID: %@; isAutomaticallyGenerated: %{public}d; compatibilityVersion: %{public}@; hasSecureData: %{public}d; ",
      buf,
      0x4Au);

  }
  v20 = v12;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    -[DNDSModeConfigurationRecord triggers](self, "triggers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543619;
    v26 = v9;
    v27 = 2113;
    v28 = v21;
    _os_log_impl(&dword_1CB895000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] triggers: %{private}@", buf, 0x16u);

  }
  v22 = v20;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    -[DNDSModeConfigurationRecord configuration](self, "configuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543619;
    v26 = v9;
    v27 = 2113;
    v28 = v23;
    _os_log_impl(&dword_1CB895000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] configuration: %{private}@", buf, 0x16u);

  }
  -[DNDSModeConfigurationRecord secureConfiguration](self, "secureConfiguration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "log:withPrefix:", v22, v9);

  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v9;
    _os_log_impl(&dword_1CB895000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] End", buf, 0xCu);
  }

}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[DNDSModeRecord hash](self->_mode, "hash");
  v4 = -[DNDSConfigurationRecord hash](self->_configuration, "hash") ^ v3;
  v5 = -[DNDSConfigurationSecureRecord hash](self->_secureConfiguration, "hash");
  v6 = v4 ^ v5 ^ -[DNDSModeConfigurationTriggersRecord hash](self->_triggers, "hash");
  v7 = self->_impactsAvailability ^ self->_dimsLockScreen;
  v8 = v7 ^ -[NSDate hash](self->_created, "hash");
  v9 = v6 ^ v8 ^ -[NSDate hash](self->_lastModified, "hash");
  return v9 ^ -[NSString hash](self->_lastModifiedByDeviceID, "hash") ^ self->_automaticallyGenerated ^ self->_compatibilityVersion ^ self->_hasSecureData;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  DNDSModeConfigurationRecord *v5;
  DNDSModeConfigurationRecord *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  unint64_t v54;
  unint64_t v55;
  _BOOL4 v56;
  _BOOL4 v57;
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
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;

  v5 = (DNDSModeConfigurationRecord *)a3;
  if (self == v5)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[DNDSModeConfigurationRecord created](self, "created");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSModeConfigurationRecord created](v6, "created");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8)
        goto LABEL_10;
      -[DNDSModeConfigurationRecord created](self, "created");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_53;
      v10 = (void *)v9;
      -[DNDSModeConfigurationRecord created](v6, "created");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[DNDSModeConfigurationRecord created](self, "created");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSModeConfigurationRecord created](v6, "created");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "isEqual:", v3) & 1) != 0)
        {
          v91 = v10;
          v92 = v3;
          v93 = v12;
          v94 = v11;
LABEL_10:
          -[DNDSModeConfigurationRecord lastModified](self, "lastModified");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSModeConfigurationRecord lastModified](v6, "lastModified");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14 != v15)
          {
            -[DNDSModeConfigurationRecord lastModified](self, "lastModified");
            v16 = objc_claimAutoreleasedReturnValue();
            if (!v16)
            {

              goto LABEL_49;
            }
            v17 = (void *)v16;
            v95 = v14;
            -[DNDSModeConfigurationRecord lastModified](v6, "lastModified");
            v18 = objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              v19 = (void *)v18;
              -[DNDSModeConfigurationRecord lastModified](self, "lastModified");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[DNDSModeConfigurationRecord lastModified](v6, "lastModified");
              v3 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v20, "isEqual:", v3) & 1) != 0)
              {
                v88 = v3;
                v89 = v20;
                v86 = v19;
                v87 = v17;
                goto LABEL_16;
              }

            }
            goto LABEL_49;
          }
          v95 = v14;
LABEL_16:
          -[DNDSModeConfigurationRecord lastModifiedByDeviceID](self, "lastModifiedByDeviceID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSModeConfigurationRecord lastModifiedByDeviceID](v6, "lastModifiedByDeviceID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21 == v22)
            goto LABEL_24;
          -[DNDSModeConfigurationRecord lastModifiedByDeviceID](self, "lastModifiedByDeviceID");
          v23 = objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            v90 = (void *)v23;
            -[DNDSModeConfigurationRecord lastModifiedByDeviceID](v6, "lastModifiedByDeviceID");
            v24 = objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              v85 = (void *)v24;
              -[DNDSModeConfigurationRecord lastModifiedByDeviceID](self, "lastModifiedByDeviceID");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[DNDSModeConfigurationRecord lastModifiedByDeviceID](v6, "lastModifiedByDeviceID");
              v3 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v25, "isEqual:", v3) & 1) != 0)
              {
                v84 = v25;
LABEL_24:
                -[DNDSModeConfigurationRecord lastModifiedByVersion](self, "lastModifiedByVersion");
                if (v6)
                  -[DNDSModeConfigurationRecord lastModifiedByVersion](v6, "lastModifiedByVersion");
                if (DNDOperatingSystemVersionCompare())
                {
                  LOBYTE(v13) = 0;
LABEL_30:
                  if (v21 == v22)
                  {
LABEL_33:

                    if (v95 != v15)
                    {

                    }
                    if (v7 == v8)
                      goto LABEL_54;

                    goto LABEL_51;
                  }

LABEL_32:
                  goto LABEL_33;
                }
                -[DNDSModeConfigurationRecord mode](self, "mode");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                -[DNDSModeConfigurationRecord mode](v6, "mode");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                if (v26 == v83)
                {
                  v82 = v26;
LABEL_57:
                  -[DNDSModeConfigurationRecord configuration](self, "configuration");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  -[DNDSModeConfigurationRecord configuration](v6, "configuration");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  v79 = v33;
                  v81 = v3;
                  if (v33 == v78)
                    goto LABEL_62;
                  -[DNDSModeConfigurationRecord configuration](self, "configuration");
                  v34 = objc_claimAutoreleasedReturnValue();
                  if (v34)
                  {
                    v73 = (void *)v34;
                    -[DNDSModeConfigurationRecord configuration](v6, "configuration");
                    v35 = objc_claimAutoreleasedReturnValue();
                    if (!v35)
                    {

                      if (v82 == v83)
                      {

                      }
                      else
                      {

                      }
LABEL_110:
                      if (v21 != v22)
                      {

                      }
                      v31 = v95;
                      if (v95 == v15)
                        goto LABEL_46;
                      goto LABEL_45;
                    }
                    v70 = (void *)v35;
                    -[DNDSModeConfigurationRecord configuration](self, "configuration");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    -[DNDSModeConfigurationRecord configuration](v6, "configuration");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v36, "isEqual:", v37) & 1) != 0)
                    {
                      v65 = v37;
                      v66 = v36;
                      v3 = v81;
LABEL_62:
                      -[DNDSModeConfigurationRecord secureConfiguration](self, "secureConfiguration");
                      v38 = objc_claimAutoreleasedReturnValue();
                      -[DNDSModeConfigurationRecord secureConfiguration](v6, "secureConfiguration");
                      v39 = objc_claimAutoreleasedReturnValue();
                      v74 = (void *)v38;
                      v40 = v38 == v39;
                      v41 = (void *)v39;
                      if (v40)
                      {
                        v71 = (void *)v39;
                        goto LABEL_79;
                      }
                      -[DNDSModeConfigurationRecord secureConfiguration](self, "secureConfiguration");
                      v42 = objc_claimAutoreleasedReturnValue();
                      if (v42)
                      {
                        v67 = (void *)v42;
                        -[DNDSModeConfigurationRecord secureConfiguration](v6, "secureConfiguration");
                        v43 = objc_claimAutoreleasedReturnValue();
                        if (v43)
                        {
                          v71 = v41;
                          v64 = (void *)v43;
                          -[DNDSModeConfigurationRecord secureConfiguration](self, "secureConfiguration");
                          v44 = objc_claimAutoreleasedReturnValue();
                          -[DNDSModeConfigurationRecord secureConfiguration](v6, "secureConfiguration");
                          v45 = objc_claimAutoreleasedReturnValue();
                          v63 = (void *)v44;
                          v46 = (void *)v44;
                          v47 = (void *)v45;
                          if ((objc_msgSend(v46, "isEqual:", v45) & 1) != 0)
                          {
                            v61 = v47;
LABEL_79:
                            -[DNDSModeConfigurationRecord triggers](self, "triggers");
                            v50 = (void *)objc_claimAutoreleasedReturnValue();
                            -[DNDSModeConfigurationRecord triggers](v6, "triggers");
                            v68 = (void *)objc_claimAutoreleasedReturnValue();
                            v69 = v50;
                            if (v50 != v68)
                            {
                              -[DNDSModeConfigurationRecord triggers](self, "triggers");
                              v51 = objc_claimAutoreleasedReturnValue();
                              if (!v51)
                              {

                                LOBYTE(v13) = 0;
LABEL_127:
                                if (v74 != v71)
                                {

                                }
                                if (v79 != v78)
                                {

                                }
                                if (v82 != v83)
                                {

                                }
                                if (v21 == v22)
                                  goto LABEL_33;

                                goto LABEL_32;
                              }
                              v62 = (void *)v51;
                              -[DNDSModeConfigurationRecord triggers](v6, "triggers");
                              v52 = objc_claimAutoreleasedReturnValue();
                              if (!v52)
                              {
                                LOBYTE(v13) = 0;
LABEL_126:

                                goto LABEL_127;
                              }
                              v60 = (void *)v52;
                              -[DNDSModeConfigurationRecord triggers](self, "triggers");
                              v53 = (void *)objc_claimAutoreleasedReturnValue();
                              -[DNDSModeConfigurationRecord triggers](v6, "triggers");
                              v58 = (void *)objc_claimAutoreleasedReturnValue();
                              v59 = v53;
                              if (!objc_msgSend(v53, "isEqual:"))
                              {
                                LOBYTE(v13) = 0;
LABEL_125:

                                goto LABEL_126;
                              }
                            }
                            v54 = -[DNDSModeConfigurationRecord impactsAvailability](self, "impactsAvailability");
                            if (v54 == -[DNDSModeConfigurationRecord impactsAvailability](v6, "impactsAvailability")
                              && (v55 = -[DNDSModeConfigurationRecord dimsLockScreen](self, "dimsLockScreen"),
                                  v55 == -[DNDSModeConfigurationRecord dimsLockScreen](v6, "dimsLockScreen"))
                              && (v56 = -[DNDSModeConfigurationRecord isAutomaticallyGenerated](self, "isAutomaticallyGenerated"), v56 == -[DNDSModeConfigurationRecord isAutomaticallyGenerated](v6, "isAutomaticallyGenerated")))
                            {
                              v57 = -[DNDSModeConfigurationRecord hasSecureData](self, "hasSecureData");
                              v13 = v57 ^ -[DNDSModeConfigurationRecord hasSecureData](v6, "hasSecureData") ^ 1;
                              if (v69 != v68)
                                goto LABEL_125;
                            }
                            else
                            {
                              if (v69 != v68)
                              {

                                LOBYTE(v13) = 0;
LABEL_116:
                                if (v74 != v71)
                                {

                                }
                                if (v79 != v78)
                                {

                                }
                                if (v82 != v83)
                                {

                                }
                                goto LABEL_30;
                              }
                              LOBYTE(v13) = 0;
                            }

                            goto LABEL_116;
                          }

LABEL_98:
                          if (v79 == v78)
                          {

                          }
                          else
                          {

                          }
                          if (v82 != v83)
                          {

                          }
                          if (v21 != v22)
                          {

                          }
                          v31 = v95;
                          if (v95 == v15)
                            goto LABEL_46;
                          goto LABEL_45;
                        }

                      }
                      goto LABEL_98;
                    }

                    v48 = v82;
                    v49 = v83;
                    if (v82 != v83)
                      goto LABEL_87;
                  }
                  else
                  {

                    v48 = v82;
                    v49 = v83;
                    if (v82 != v83)
                    {
LABEL_87:

LABEL_89:
                      goto LABEL_110;
                    }
                  }

                  goto LABEL_89;
                }
                -[DNDSModeConfigurationRecord mode](self, "mode");
                v27 = objc_claimAutoreleasedReturnValue();
                if (v27)
                {
                  v77 = (void *)v27;
                  -[DNDSModeConfigurationRecord mode](v6, "mode");
                  v28 = objc_claimAutoreleasedReturnValue();
                  if (v28)
                  {
                    v80 = v3;
                    v82 = v26;
                    v76 = (void *)v28;
                    -[DNDSModeConfigurationRecord mode](self, "mode");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    -[DNDSModeConfigurationRecord mode](v6, "mode");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v29, "isEqual:", v30) & 1) != 0)
                    {
                      v75 = v29;
                      v72 = v30;
                      v3 = v80;
                      goto LABEL_57;
                    }

                    if (v21 != v22)
                    {

                      goto LABEL_72;
                    }
                    goto LABEL_73;
                  }

                }
                if (v21 != v22)
                {

LABEL_72:
                  goto LABEL_74;
                }
LABEL_73:

LABEL_74:
                v31 = v95;
                if (v95 == v15)
                  goto LABEL_46;
                goto LABEL_45;
              }

            }
          }

          v31 = v95;
          if (v95 == v15)
          {

            goto LABEL_48;
          }
LABEL_45:

LABEL_46:
LABEL_48:

LABEL_49:
          if (v7 != v8)
          {

            LOBYTE(v13) = 0;
LABEL_51:
            v10 = v91;
            goto LABEL_52;
          }
LABEL_53:
          LOBYTE(v13) = 0;
          goto LABEL_54;
        }

      }
      LOBYTE(v13) = 0;
LABEL_52:

LABEL_54:
      goto LABEL_55;
    }
    LOBYTE(v13) = 0;
  }
LABEL_55:

  return v13;
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
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v15 = objc_opt_class();
  -[DNDSModeConfigurationRecord mode](self, "mode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationRecord configuration](self, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationRecord secureConfiguration](self, "secureConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationRecord triggers](self, "triggers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationRecord impactsAvailability](self, "impactsAvailability");
  DNDEnabledSettingToString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationRecord dimsLockScreen](self, "dimsLockScreen");
  DNDEnabledSettingToString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationRecord created](self, "created");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationRecord lastModified](self, "lastModified");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationRecord lastModifiedByVersion](self, "lastModifiedByVersion");
  DNDStringFromOperatingSystemVersion();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationRecord lastModifiedByDeviceID](self, "lastModifiedByDeviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DNDSModeConfigurationRecord isAutomaticallyGenerated](self, "isAutomaticallyGenerated"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[DNDSModeConfigurationRecord compatibilityVersion](self, "compatibilityVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DNDSModeConfigurationRecord hasSecureData](self, "hasSecureData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p; mode: %@; configuration: %@; secureConfiguration: %@; triggers: %@; impactsAvailability: %@; dimsLockScreen: %@; created: %@; lastModified: %@; lastModifiedByVersion: %@; lastModifiedByDeviceID: %@; automaticallyGenerated: %@; compatibilityVersion: %@; hasSecureData: %@>"),
    v15,
    self,
    v14,
    v19,
    v18,
    v17,
    v12,
    v13,
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (id)shortDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDSModeConfigurationRecord mode](self, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationRecord impactsAvailability](self, "impactsAvailability");
  DNDEnabledSettingToString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationRecord dimsLockScreen](self, "dimsLockScreen");
  DNDEnabledSettingToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; mode: %@; impactsAvailability: %@; dimsLockScreen: %@>"),
    v4,
    self,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSModeConfigurationRecord _initWithRecord:]([DNDSMutableModeConfigurationRecord alloc], "_initWithRecord:", self);
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
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
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  char v42;
  uint64_t v44;
  uint64_t v45;
  char v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  objc_class *v60;
  Class v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  __int128 v66;
  uint64_t v67;
  __int128 v68;
  uint64_t v69;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "currentRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (objc_class *)a1;
  if (v8)
  {
    objc_msgSend(v7, "currentRecord");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {

      v8 = 0;
    }
  }
  objc_msgSend(v6, "bs_safeObjectForKey:ofType:", CFSTR("mode"), objc_opt_class());
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v7, "copyWithCurrentRecord:", v12);
  v63 = (void *)v11;
  v62 = +[DNDSModeRecord newWithDictionaryRepresentation:context:](DNDSModeRecord, "newWithDictionaryRepresentation:context:", v11, v13);

  objc_msgSend(v6, "bs_safeObjectForKey:ofType:", CFSTR("configuration"), objc_opt_class());
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v7, "copyWithCurrentRecord:", v15);
  v59 = (void *)v14;
  v58 = +[DNDSConfigurationRecord newWithDictionaryRepresentation:context:](DNDSConfigurationRecord, "newWithDictionaryRepresentation:context:", v14, v16);

  objc_msgSend(v8, "secureConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v7, "copyWithCurrentRecord:", v17);
  v57 = +[DNDSConfigurationSecureRecord newWithDictionaryRepresentation:context:](DNDSConfigurationSecureRecord, "newWithDictionaryRepresentation:context:", MEMORY[0x1E0C9AA70], v18);

  objc_msgSend(v6, "bs_safeObjectForKey:ofType:", CFSTR("triggers"), objc_opt_class());
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "triggers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v7, "copyWithCurrentRecord:", v20);
  v56 = (void *)v19;
  v55 = +[DNDSModeConfigurationTriggersRecord newWithDictionaryRepresentation:context:](DNDSModeConfigurationTriggersRecord, "newWithDictionaryRepresentation:context:", v19, v21);

  objc_msgSend(v6, "bs_safeObjectForKey:ofType:", CFSTR("impactsAvailability"), objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v22;
  if (v22)
    v52 = objc_msgSend(v22, "unsignedIntegerValue");
  else
    v52 = 0;
  objc_msgSend(v6, "bs_safeObjectForKey:ofType:", CFSTR("dimsLockScreen"), objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v23;
  if (v23)
    v50 = objc_msgSend(v23, "unsignedIntegerValue");
  else
    v50 = 0;
  objc_msgSend(v6, "bs_safeObjectForKey:ofType:", CFSTR("lastModified"), objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0C99D68];
  v51 = v24;
  objc_msgSend(v24, "doubleValue");
  objc_msgSend(v25, "dateWithTimeIntervalSince1970:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_safeStringForKey:", CFSTR("lastModifiedByVersion"));
  v68 = 0uLL;
  v69 = 0;
  v65 = v7;
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    DNDOperatingSystemVersionFromString();
  }
  else
  {
    v68 = *MEMORY[0x1E0D1D440];
    v69 = *(_QWORD *)(MEMORY[0x1E0D1D440] + 16);
  }
  objc_msgSend(v6, "bs_safeStringForKey:", CFSTR("lastModifiedByDeviceID"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_safeObjectForKey:ofType:", CFSTR("created"), objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v28;
  if (v28)
  {
    v29 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v28, "doubleValue");
    objc_msgSend(v29, "dateWithTimeIntervalSince1970:");
    v30 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = v26;
  }
  v31 = v30;
  objc_msgSend(v6, "bs_safeObjectForKey:ofType:", CFSTR("automaticallyGenerated"), objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v32;
  v33 = v26;
  if (v32)
    v46 = objc_msgSend(v32, "BOOLValue");
  else
    v46 = 0;
  objc_msgSend(v6, "bs_safeObjectForKey:ofType:", CFSTR("compatibilityVersion"), objc_opt_class());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
    v36 = objc_msgSend(v34, "integerValue");
  else
    v36 = 2;
  objc_msgSend(v6, "bs_safeObjectForKey:ofType:", CFSTR("resolvedCompatibilityVersion"), objc_opt_class());
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
    v39 = objc_msgSend(v37, "integerValue");
  else
    v39 = 2;
  v64 = v8;
  objc_msgSend(v6, "bs_safeObjectForKey:ofType:", CFSTR("hasSecureData"), objc_opt_class());
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (v40)
    v42 = objc_msgSend(v40, "BOOLValue");
  else
    v42 = 0;
  v66 = v68;
  v67 = v69;
  LOBYTE(v45) = v42;
  LOBYTE(v44) = v46;
  v61 = (Class)objc_msgSend([v60 alloc], "_initWithMode:configuration:secureConfiguration:triggers:impactsAvailability:dimsLockScreen:created:lastModified:lastModifiedByVersion:lastModifiedByDeviceID:automaticallyGenerated:compatibilityVersion:ephemeralResolvedCompatibilityVersion:hasSecureData:", v62, v58, v57, v55, v52, v50, v31, v33, &v66, v27, v44, v36, v39, v45);

  return v61;
}

+ (id)newWithDictionaryRepresentation:(id)a3 partitionedDictionaryRepresentation:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
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
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  char v46;
  uint64_t v48;
  uint64_t v49;
  char v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  objc_class *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  __int128 v72;
  uint64_t v73;
  __int128 v74;
  uint64_t v75;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v9, "currentRecord");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (objc_class *)a1;
  if (v11)
  {
    objc_msgSend(v9, "currentRecord");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {

      v11 = 0;
    }
  }
  objc_msgSend(v8, "bs_safeObjectForKey:ofType:", CFSTR("mode"), objc_opt_class());
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v9, "copyWithCurrentRecord:", v15);
  v69 = (void *)v14;
  v68 = +[DNDSModeRecord newWithDictionaryRepresentation:context:](DNDSModeRecord, "newWithDictionaryRepresentation:context:", v14, v16);

  objc_msgSend(v8, "bs_safeObjectForKey:ofType:", CFSTR("configuration"), objc_opt_class());
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v9, "copyWithCurrentRecord:", v18);
  v65 = (void *)v17;
  v64 = +[DNDSConfigurationRecord newWithDictionaryRepresentation:context:](DNDSConfigurationRecord, "newWithDictionaryRepresentation:context:", v17, v19);

  objc_msgSend(v10, "bs_safeObjectForKey:ofType:", CFSTR("secureConfiguration"), objc_opt_class());
  v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "secureConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v9, "copyWithCurrentRecord:", v21);
  v63 = (void *)v20;
  v62 = +[DNDSConfigurationSecureRecord newWithDictionaryRepresentation:context:](DNDSConfigurationSecureRecord, "newWithDictionaryRepresentation:context:", v20, v22);

  objc_msgSend(v8, "bs_safeObjectForKey:ofType:", CFSTR("triggers"), objc_opt_class());
  v23 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bs_safeObjectForKey:ofType:", CFSTR("secureTriggers"), objc_opt_class());
  v24 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "triggers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v9, "copyWithCurrentRecord:", v25);
  v60 = (void *)v24;
  v61 = (void *)v23;
  v59 = +[DNDSModeConfigurationTriggersRecord newWithDictionaryRepresentation:partitionedDictionaryRepresentation:context:](DNDSModeConfigurationTriggersRecord, "newWithDictionaryRepresentation:partitionedDictionaryRepresentation:context:", v23, v24, v26);

  objc_msgSend(v8, "bs_safeObjectForKey:ofType:", CFSTR("impactsAvailability"), objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v27;
  if (v27)
    v56 = objc_msgSend(v27, "unsignedIntegerValue");
  else
    v56 = 0;
  objc_msgSend(v8, "bs_safeObjectForKey:ofType:", CFSTR("dimsLockScreen"), objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v28;
  if (v28)
    v54 = objc_msgSend(v28, "unsignedIntegerValue");
  else
    v54 = 0;
  objc_msgSend(v8, "bs_safeObjectForKey:ofType:", CFSTR("lastModified"), objc_opt_class());
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)MEMORY[0x1E0C99D68];
  v55 = v29;
  objc_msgSend(v29, "doubleValue");
  objc_msgSend(v30, "dateWithTimeIntervalSince1970:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bs_safeStringForKey:", CFSTR("lastModifiedByVersion"));
  v74 = 0uLL;
  v75 = 0;
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    DNDOperatingSystemVersionFromString();
  }
  else
  {
    v74 = *MEMORY[0x1E0D1D440];
    v75 = *(_QWORD *)(MEMORY[0x1E0D1D440] + 16);
  }
  v71 = v9;
  objc_msgSend(v8, "bs_safeStringForKey:", CFSTR("lastModifiedByDeviceID"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bs_safeObjectForKey:ofType:", CFSTR("created"), objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v33;
  if (v33)
  {
    v34 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v33, "doubleValue");
    objc_msgSend(v34, "dateWithTimeIntervalSince1970:");
    v35 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = v31;
  }
  v36 = v35;
  objc_msgSend(v8, "bs_safeObjectForKey:ofType:", CFSTR("automaticallyGenerated"), objc_opt_class());
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v11;
  v51 = v37;
  if (v37)
    v50 = objc_msgSend(v37, "BOOLValue");
  else
    v50 = 0;
  objc_msgSend(v8, "bs_safeObjectForKey:ofType:", CFSTR("compatibilityVersion"), objc_opt_class());
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v38)
    v40 = objc_msgSend(v38, "integerValue");
  else
    v40 = 2;
  objc_msgSend(v8, "bs_safeObjectForKey:ofType:", CFSTR("resolvedCompatibilityVersion"), objc_opt_class());
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v41)
    v43 = objc_msgSend(v41, "integerValue");
  else
    v43 = 2;
  objc_msgSend(v8, "bs_safeObjectForKey:ofType:", CFSTR("hasSecureData"), objc_opt_class());
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (v44)
    v46 = objc_msgSend(v44, "BOOLValue");
  else
    v46 = 0;
  v72 = v74;
  v73 = v75;
  LOBYTE(v49) = v46;
  LOBYTE(v48) = v50;
  v67 = (void *)objc_msgSend([v66 alloc], "_initWithMode:configuration:secureConfiguration:triggers:impactsAvailability:dimsLockScreen:created:lastModified:lastModifiedByVersion:lastModifiedByDeviceID:automaticallyGenerated:compatibilityVersion:ephemeralResolvedCompatibilityVersion:hasSecureData:", v68, v64, v62, v59, v56, v54, v36, v31, &v72, v32, v48, v40, v43, v49);

  return v67;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
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
  void *v20;
  void *v21;
  __int128 v23;
  int64_t patchVersion;

  v4 = a3;
  objc_msgSend(v4, "healingSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  if ((objc_msgSend(v4, "partitionType") & 2) != 0)
  {
    objc_msgSend(v9, "setDictionaryRepresentationOfRecord:forKey:context:", self->_secureConfiguration, CFSTR("secureConfiguration"), v4);
    objc_msgSend(v9, "setDictionaryRepresentationOfRecord:forKey:context:", self->_triggers, CFSTR("secureTriggers"), v4);
    v10 = (void *)-[NSString copy](self->_lastModifiedByDeviceID, "copy");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("lastModifiedByDeviceID"));

  }
  if ((objc_msgSend(v4, "partitionType") & 1) != 0)
  {
    objc_msgSend(v9, "setDictionaryRepresentationOfRecord:forKey:context:", self->_mode, CFSTR("mode"), v4);
    objc_msgSend(v9, "setDictionaryRepresentationOfRecord:forKey:context:", self->_configuration, CFSTR("configuration"), v4);
    objc_msgSend(v9, "setDictionaryRepresentationOfRecord:forKey:context:", self->_triggers, CFSTR("triggers"), v4);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_impactsAvailability);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("impactsAvailability"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_dimsLockScreen);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("dimsLockScreen"));

    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSince1970](self->_created, "timeIntervalSince1970");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("created"));

    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSince1970](self->_lastModified, "timeIntervalSince1970");
    objc_msgSend(v15, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("lastModified"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_automaticallyGenerated);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("automaticallyGenerated"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_compatibilityVersion);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("compatibilityVersion"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_ephemeralResolvedCompatibilityVersion);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, CFSTR("resolvedCompatibilityVersion"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasSecureData);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, CFSTR("hasSecureData"));

    v23 = *(_OWORD *)&self->_lastModifiedByVersion.majorVersion;
    patchVersion = self->_lastModifiedByVersion.patchVersion;
    DNDStringFromOperatingSystemVersion();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("lastModifiedByVersion"), v23, patchVersion);

    objc_msgSend(v9, "setObject:forKeyedSubscript:", self->_lastModifiedByDeviceID, CFSTR("lastModifiedByDeviceID"));
  }

  return v9;
}

- (BOOL)wasLastModifiedByThisDevice
{
  void *v3;
  BOOL v4;

  -[DNDSModeConfigurationRecord lastModifiedByDeviceID](self, "lastModifiedByDeviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[DNDSModeConfigurationRecord lastModifiedByVersion](self, "lastModifiedByVersion");
    v4 = DNDOperatingSystemVersionCompare() != 0;
  }

  return v4;
}

- (DNDSModeRecord)mode
{
  return self->_mode;
}

- (DNDSConfigurationRecord)configuration
{
  return self->_configuration;
}

- (DNDSConfigurationSecureRecord)secureConfiguration
{
  return self->_secureConfiguration;
}

- (DNDSModeConfigurationTriggersRecord)triggers
{
  return self->_triggers;
}

- (unint64_t)impactsAvailability
{
  return self->_impactsAvailability;
}

- (unint64_t)dimsLockScreen
{
  return self->_dimsLockScreen;
}

- (NSDate)created
{
  return self->_created;
}

- (NSDate)lastModified
{
  return self->_lastModified;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)lastModifiedByVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[3];
  return self;
}

- (NSString)lastModifiedByDeviceID
{
  return self->_lastModifiedByDeviceID;
}

- (BOOL)isAutomaticallyGenerated
{
  return self->_automaticallyGenerated;
}

- (BOOL)hasSecureData
{
  return self->_hasSecureData;
}

- (int64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (int64_t)ephemeralResolvedCompatibilityVersion
{
  return self->_ephemeralResolvedCompatibilityVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedByDeviceID, 0);
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_secureConfiguration, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_mode, 0);
}

+ (id)dictionaryRepresentationWithCKRecord:(id)a3 partitionType:(unint64_t)a4
{
  id v5;
  const __CFString *v6;
  __CFString **v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a4 == 1)
  {
    v6 = CFSTR("Main");
    v7 = kDNDSModeConfigurationsRecordMainPartitionKey;
  }
  else
  {
    if (a4 != 2)
    {
      v14 = 0;
      goto LABEL_17;
    }
    v6 = CFSTR("Secondary");
    v7 = kDNDSModeConfigurationsRecordSecondaryPartitionKey;
  }
  v8 = *v7;
  objc_msgSend(v5, "encryptedValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v10, 0, &v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v20;
    if (v12)
    {
      v13 = (void *)DNDSLogModeConfigurations;
      if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
      {
        v17 = v13;
        objc_msgSend(v5, "recordID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "recordName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v22 = v6;
        v23 = 2114;
        v24 = v19;
        v25 = 2114;
        v26 = v12;
        _os_log_error_impl(&dword_1CB895000, v17, OS_LOG_TYPE_ERROR, "Failed to decode %@ partition data %{public}@: %{public}@", buf, 0x20u);

      }
      v14 = 0;
    }
    else
    {
      v14 = v11;
    }

  }
  else
  {
    v15 = (void *)DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
      +[DNDSModeConfigurationRecord(CKRecord) dictionaryRepresentationWithCKRecord:partitionType:].cold.1((uint64_t)v6, v15, v5);
    v14 = 0;
  }

LABEL_17:
  return v14;
}

+ (id)newWithCKRecord:(id)a3
{
  return (id)objc_msgSend(a1, "newWithCKRecord:currentRecord:", a3, 0);
}

+ (id)newWithCKRecord:(id)a3 currentRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  DNDSApplicationIdentifierMapper *v10;
  DNDSContactProvider *v11;
  DNDSBackingStoreDictionaryContext *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "dictionaryRepresentationWithCKRecord:partitionType:", v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "dictionaryRepresentationWithCKRecord:partitionType:", v6, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = objc_alloc_init(DNDSApplicationIdentifierMapper);
      v11 = objc_alloc_init(DNDSContactProvider);
      v12 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:currentRecord:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:currentRecord:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 1, 3, v7, 0, v11, v10);
      v13 = +[DNDSModeConfigurationRecord newWithDictionaryRepresentation:partitionedDictionaryRepresentation:context:](DNDSModeConfigurationRecord, "newWithDictionaryRepresentation:partitionedDictionaryRepresentation:context:", v8, v9, v12);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (int64_t)populateCKRecord:(id)a3 lastChanceRecord:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  int v16;
  void *v17;
  uint64_t v18;
  DNDSApplicationIdentifierMapper *v19;
  DNDSContactProvider *v20;
  DNDSBackingStoreDictionaryContext *v21;
  void *v22;
  DNDSBackingStoreDictionaryContext *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int64_t v30;
  void *v31;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  id v37;

  v37 = a3;
  v6 = a4;
  objc_msgSend(v6, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSModeConfigurationRecord created](self, "created");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "compare:", v9);

  v11 = -[DNDSModeConfigurationRecord ephemeralResolvedCompatibilityVersion](self, "ephemeralResolvedCompatibilityVersion");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DNDSModeConfigurationsVersion"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");
  if (v7)
    v14 = v10 == 1;
  else
    v14 = 1;
  v16 = !v14 && v11 >= v13;

  v35 = v16;
  if (v16 == 1)
  {
    objc_msgSend((id)objc_opt_class(), "dictionaryRepresentationWithCKRecord:partitionType:", v6, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "dictionaryRepresentationWithCKRecord:partitionType:", v6, 2);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
    v17 = 0;
  }
  v19 = objc_alloc_init(DNDSApplicationIdentifierMapper);
  v20 = objc_alloc_init(DNDSContactProvider);
  v21 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:healingSource:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:healingSource:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 0, 1, v17, 0, v20, v19);
  -[DNDSModeConfigurationRecord dictionaryRepresentationWithContext:](self, "dictionaryRepresentationWithContext:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)v18;
  v23 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:healingSource:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:healingSource:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 0, 2, v18, 0, v20, v19);

  -[DNDSModeConfigurationRecord dictionaryRepresentationWithContext:](self, "dictionaryRepresentationWithContext:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v22)
    && objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v24))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v22, 0, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v24, 0, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "encryptedValues");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v34, CFSTR("DNDSModeConfigurationsRecordMainPartition"));

    objc_msgSend(v37, "encryptedValues");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKey:", v33, CFSTR("DNDSModeConfigurationsRecordSecondaryPartition"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[DNDSModeConfigurationRecord ephemeralResolvedCompatibilityVersion](self, "ephemeralResolvedCompatibilityVersion"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v27, CFSTR("DNDSModeConfigurationsVersion"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[DNDSModeConfigurationRecord ephemeralResolvedCompatibilityVersion](self, "ephemeralResolvedCompatibilityVersion"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    DNDSModeConfigurationsMinimumRequiredVersionForConfigurationVersion(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v29, CFSTR("DNDSModeConfigurationsMinimumRequiredVersion"));

    if (v35)
      v30 = 2;
    else
      v30 = 1;

  }
  else
  {
    v31 = (void *)DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
      -[DNDSModeConfigurationRecord(CKRecord) populateCKRecord:lastChanceRecord:].cold.4(v31, v37);
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
      -[DNDSModeConfigurationRecord(CKRecord) populateCKRecord:lastChanceRecord:].cold.3();
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
      -[DNDSModeConfigurationRecord(CKRecord) populateCKRecord:lastChanceRecord:].cold.2();
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
      -[DNDSModeConfigurationRecord(CKRecord) populateCKRecord:lastChanceRecord:].cold.1();
    v30 = 0;
  }

  return v30;
}

+ (id)newWithDNDSIDSRecord:(id)a3
{
  return (id)objc_msgSend(a1, "newWithDNDSIDSRecord:currentRecord:", a3, 0);
}

+ (id)newWithDNDSIDSRecord:(id)a3 currentRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  DNDSContactProvider *v19;
  DNDSBackingStoreDictionaryContext *v20;
  DNDSApplicationIdentifierMapper *v22;
  id v23;
  id v24;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("DNDSModeConfigurationsRecordData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("DNDSModeConfigurationsRecordPartitionedData"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v7)
  {
    v15 = (void *)DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
      +[DNDSModeConfigurationRecord(DNDSIDSRecord) newWithDNDSIDSRecord:currentRecord:].cold.1(v15, v5);
    goto LABEL_11;
  }
  if (!v8)
  {
    v16 = (void *)DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
      +[DNDSModeConfigurationRecord(DNDSIDSRecord) newWithDNDSIDSRecord:currentRecord:].cold.2(v16, v5);
LABEL_11:
    v14 = 0;
    goto LABEL_19;
  }
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v24;
  if (v11)
  {
    v12 = v11;
    v13 = (void *)DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
      +[DNDSModeConfigurationRecord(DNDSIDSRecord) newWithDNDSIDSRecord:currentRecord:].cold.4(v13, v5);
    v14 = 0;
  }
  else
  {
    v23 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v9, 0, &v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v23;
    if (v12)
    {
      v18 = (void *)DNDSLogModeConfigurations;
      if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
        +[DNDSModeConfigurationRecord(DNDSIDSRecord) newWithDNDSIDSRecord:currentRecord:].cold.3(v18, v5);
      v14 = 0;
    }
    else
    {
      v22 = objc_alloc_init(DNDSApplicationIdentifierMapper);
      v19 = objc_alloc_init(DNDSContactProvider);
      v20 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:currentRecord:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:currentRecord:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 1, 3, v6, 0, v19, v22);
      v14 = +[DNDSModeConfigurationRecord newWithDictionaryRepresentation:partitionedDictionaryRepresentation:context:](DNDSModeConfigurationRecord, "newWithDictionaryRepresentation:partitionedDictionaryRepresentation:context:", v10, v17, v20);

    }
  }

LABEL_19:
  return v14;
}

- (BOOL)populateDNDSIDSRecord:(id)a3
{
  id v4;
  DNDSApplicationIdentifierMapper *v5;
  DNDSContactProvider *v6;
  DNDSBackingStoreDictionaryContext *v7;
  void *v8;
  DNDSBackingStoreDictionaryContext *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;

  v4 = a3;
  v5 = objc_alloc_init(DNDSApplicationIdentifierMapper);
  v6 = objc_alloc_init(DNDSContactProvider);
  v7 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 0, 1, 0, v6, v5);
  -[DNDSModeConfigurationRecord dictionaryRepresentationWithContext:](self, "dictionaryRepresentationWithContext:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 0, 2, 0, v6, v5);

  -[DNDSModeConfigurationRecord dictionaryRepresentationWithContext:](self, "dictionaryRepresentationWithContext:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v8)
    && objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v10))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v8, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v10, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("DNDSModeConfigurationsRecordData"));
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("DNDSModeConfigurationsRecordPartitionedData"));
    objc_msgSend(v4, "setObject:forKey:", &unk_1E86DE700, CFSTR("DNDSModeConfigurationsVersion"));
    objc_msgSend(v4, "setObject:forKey:", &unk_1E86DE700, CFSTR("DNDSModeConfigurationsMinimumRequiredVersion"));

    v13 = 1;
  }
  else
  {
    v14 = (void *)DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
      -[DNDSModeConfigurationRecord(DNDSIDSRecord) populateDNDSIDSRecord:].cold.4(v14, v4);
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
      -[DNDSModeConfigurationRecord(CKRecord) populateCKRecord:lastChanceRecord:].cold.3();
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
      -[DNDSModeConfigurationRecord(CKRecord) populateCKRecord:lastChanceRecord:].cold.2();
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
      -[DNDSModeConfigurationRecord(CKRecord) populateCKRecord:lastChanceRecord:].cold.1();
    v13 = 0;
  }

  return v13;
}

@end
