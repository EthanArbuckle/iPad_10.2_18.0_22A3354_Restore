@implementation DNDSConfigurationSecureRecord

- (DNDSConfigurationSecureRecord)init
{
  return (DNDSConfigurationSecureRecord *)-[DNDSConfigurationSecureRecord _initWithRecord:](self, "_initWithRecord:", 0);
}

- (id)_initWithRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "senderConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowedApplications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deniedApplications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowedWebApplications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deniedWebApplications");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[DNDSConfigurationSecureRecord _initWithSenderConfiguration:allowedApplications:deniedApplications:allowedWebApplications:deniedWebApplications:](self, "_initWithSenderConfiguration:allowedApplications:deniedApplications:allowedWebApplications:deniedWebApplications:", v5, v6, v7, v8, v9);
  return v10;
}

- (id)_initWithSenderConfiguration:(id)a3 allowedApplications:(id)a4 deniedApplications:(id)a5 allowedWebApplications:(id)a6 deniedWebApplications:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  DNDSConfigurationSecureRecord *v17;
  void *v18;
  void *v19;
  DNDSSenderConfigurationRecord *v20;
  DNDSSenderConfigurationRecord *senderConfiguration;
  void *v22;
  void *v23;
  NSDictionary *v24;
  NSDictionary *allowedApplications;
  void *v26;
  void *v27;
  NSSet *v28;
  NSSet *deniedApplications;
  void *v30;
  void *v31;
  NSSet *v32;
  NSSet *allowedWebApplications;
  void *v34;
  void *v35;
  NSSet *v36;
  NSSet *deniedWebApplications;
  objc_super v39;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v39.receiver = self;
  v39.super_class = (Class)DNDSConfigurationSecureRecord;
  v17 = -[DNDSConfigurationSecureRecord init](&v39, sel_init);
  if (v17)
  {
    v18 = (void *)objc_msgSend(v12, "copy");
    v19 = v18;
    if (v18)
      v20 = v18;
    else
      v20 = (DNDSSenderConfigurationRecord *)objc_opt_new();
    senderConfiguration = v17->_senderConfiguration;
    v17->_senderConfiguration = v20;

    v22 = (void *)objc_msgSend(v13, "copy");
    v23 = v22;
    if (v22)
      v24 = v22;
    else
      v24 = (NSDictionary *)objc_opt_new();
    allowedApplications = v17->_allowedApplications;
    v17->_allowedApplications = v24;

    v26 = (void *)objc_msgSend(v14, "copy");
    v27 = v26;
    if (v26)
      v28 = v26;
    else
      v28 = (NSSet *)objc_opt_new();
    deniedApplications = v17->_deniedApplications;
    v17->_deniedApplications = v28;

    v30 = (void *)objc_msgSend(v15, "copy");
    v31 = v30;
    if (v30)
      v32 = v30;
    else
      v32 = (NSSet *)objc_opt_new();
    allowedWebApplications = v17->_allowedWebApplications;
    v17->_allowedWebApplications = v32;

    v34 = (void *)objc_msgSend(v16, "copy");
    v35 = v34;
    if (v34)
      v36 = v34;
    else
      v36 = (NSSet *)objc_opt_new();
    deniedWebApplications = v17->_deniedWebApplications;
    v17->_deniedWebApplications = v36;

  }
  return v17;
}

- (void)log:(id)a3 withPrefix:(id)a4
{
  NSObject *v5;
  id v6;
  NSDictionary *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  DNDSSenderConfigurationRecord *v13;
  void *v14;
  NSSet *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  DNDSSenderConfigurationRecord *v20;
  NSSet *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  DNDSSenderConfigurationRecord *v26;
  NSSet *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  DNDSSenderConfigurationRecord *v32;
  DNDSSenderConfigurationRecord *senderConfiguration;
  __int128 v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint8_t v54[128];
  uint8_t buf[4];
  id v56;
  __int16 v57;
  DNDSSenderConfigurationRecord *v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v56 = v6;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Begin secure configuration", buf, 0xCu);
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v7 = self->_allowedApplications;
  v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v49;
    *(_QWORD *)&v9 = 138543875;
    v34 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v49 != v11)
          objc_enumerationMutation(v7);
        v13 = *(DNDSSenderConfigurationRecord **)(*((_QWORD *)&v48 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_allowedApplications, "objectForKeyedSubscript:", v13, v34);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v34;
          v56 = v6;
          v57 = 2113;
          v58 = v13;
          v59 = 2113;
          v60 = v14;
          _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Allowed app: %{private}@; %{private}@",
            buf,
            0x20u);
        }

      }
      v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    }
    while (v10);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v15 = self->_deniedApplications;
  v16 = -[NSSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v45 != v18)
          objc_enumerationMutation(v15);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v20 = *(DNDSSenderConfigurationRecord **)(*((_QWORD *)&v44 + 1) + 8 * j);
          *(_DWORD *)buf = 138543619;
          v56 = v6;
          v57 = 2113;
          v58 = v20;
          _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Denied app: %{private}@", buf, 0x16u);
        }
      }
      v17 = -[NSSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    }
    while (v17);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v21 = self->_allowedWebApplications;
  v22 = -[NSSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v41;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v41 != v24)
          objc_enumerationMutation(v21);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v26 = *(DNDSSenderConfigurationRecord **)(*((_QWORD *)&v40 + 1) + 8 * k);
          *(_DWORD *)buf = 138543619;
          v56 = v6;
          v57 = 2113;
          v58 = v26;
          _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Allowed web app: %{private}@", buf, 0x16u);
        }
      }
      v23 = -[NSSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
    }
    while (v23);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v27 = self->_deniedWebApplications;
  v28 = -[NSSet countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v37;
    do
    {
      for (m = 0; m != v29; ++m)
      {
        if (*(_QWORD *)v37 != v30)
          objc_enumerationMutation(v27);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v32 = *(DNDSSenderConfigurationRecord **)(*((_QWORD *)&v36 + 1) + 8 * m);
          *(_DWORD *)buf = 138543619;
          v56 = v6;
          v57 = 2113;
          v58 = v32;
          _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Denied web app: %{private}@", buf, 0x16u);
        }
      }
      v29 = -[NSSet countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
    }
    while (v29);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    senderConfiguration = self->_senderConfiguration;
    *(_DWORD *)buf = 138543619;
    v56 = v6;
    v57 = 2113;
    v58 = senderConfiguration;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] senderConfiguration: %{private}@", buf, 0x16u);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v56 = v6;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] End secure configuration", buf, 0xCu);
  }

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
  unint64_t v12;

  -[DNDSConfigurationSecureRecord senderConfiguration](self, "senderConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDSConfigurationSecureRecord allowedApplications](self, "allowedApplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DNDSConfigurationSecureRecord deniedApplications](self, "deniedApplications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[DNDSConfigurationSecureRecord allowedWebApplications](self, "allowedWebApplications");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[DNDSConfigurationSecureRecord deniedWebApplications](self, "deniedWebApplications");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  DNDSConfigurationSecureRecord *v4;
  DNDSConfigurationSecureRecord *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
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

  v4 = (DNDSConfigurationSecureRecord *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DNDSConfigurationSecureRecord senderConfiguration](self, "senderConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSConfigurationSecureRecord senderConfiguration](v5, "senderConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
      {
        -[DNDSConfigurationSecureRecord senderConfiguration](self, "senderConfiguration");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v13 = 0;
          goto LABEL_54;
        }
        v9 = (void *)v8;
        -[DNDSConfigurationSecureRecord senderConfiguration](v5, "senderConfiguration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v13 = 0;
LABEL_53:

          goto LABEL_54;
        }
        -[DNDSConfigurationSecureRecord senderConfiguration](self, "senderConfiguration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSConfigurationSecureRecord senderConfiguration](v5, "senderConfiguration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v11, "isEqual:", v12))
        {
          v13 = 0;
LABEL_52:

          goto LABEL_53;
        }
        v58 = v9;
        v59 = v12;
        v60 = v11;
        v61 = v10;
      }
      -[DNDSConfigurationSecureRecord allowedApplications](self, "allowedApplications");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSConfigurationSecureRecord allowedApplications](v5, "allowedApplications");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 != v15)
      {
        -[DNDSConfigurationSecureRecord allowedApplications](self, "allowedApplications");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          v62 = v14;
          -[DNDSConfigurationSecureRecord allowedApplications](v5, "allowedApplications");
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = (void *)v18;
            -[DNDSConfigurationSecureRecord allowedApplications](self, "allowedApplications");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSConfigurationSecureRecord allowedApplications](v5, "allowedApplications");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v20, "isEqual:", v21) & 1) != 0)
            {
              v53 = v21;
              v54 = v20;
              v51 = v19;
              v52 = v17;
              goto LABEL_17;
            }

          }
        }
        else
        {

        }
LABEL_50:
        v13 = 0;
        goto LABEL_51;
      }
      v62 = v14;
LABEL_17:
      -[DNDSConfigurationSecureRecord deniedApplications](self, "deniedApplications");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSConfigurationSecureRecord deniedApplications](v5, "deniedApplications");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22 != v23)
      {
        -[DNDSConfigurationSecureRecord deniedApplications](self, "deniedApplications");
        v24 = objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v55 = (void *)v24;
          -[DNDSConfigurationSecureRecord deniedApplications](v5, "deniedApplications");
          v25 = objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            v50 = (void *)v25;
            -[DNDSConfigurationSecureRecord deniedApplications](self, "deniedApplications");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSConfigurationSecureRecord deniedApplications](v5, "deniedApplications");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v26, "isEqual:", v27) & 1) != 0)
            {
              v57 = v22;
              v47 = v27;
              v48 = v26;
              goto LABEL_26;
            }

          }
        }

        v38 = v62;
        if (v62 == v15)
        {

LABEL_49:
          goto LABEL_50;
        }
LABEL_47:

LABEL_48:
        goto LABEL_49;
      }
      v57 = v22;
LABEL_26:
      -[DNDSConfigurationSecureRecord allowedWebApplications](self, "allowedWebApplications");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSConfigurationSecureRecord allowedWebApplications](v5, "allowedWebApplications");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28 == v56)
      {
LABEL_33:
        -[DNDSConfigurationSecureRecord deniedWebApplications](self, "deniedWebApplications");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSConfigurationSecureRecord deniedWebApplications](v5, "deniedWebApplications");
        v34 = objc_claimAutoreleasedReturnValue();
        if (v33 == (void *)v34)
        {

          v13 = 1;
        }
        else
        {
          v45 = (void *)v34;
          -[DNDSConfigurationSecureRecord deniedWebApplications](self, "deniedWebApplications");
          v35 = objc_claimAutoreleasedReturnValue();
          if (v35)
          {
            v42 = (void *)v35;
            -[DNDSConfigurationSecureRecord deniedWebApplications](v5, "deniedWebApplications");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (v36)
            {
              v41 = v36;
              -[DNDSConfigurationSecureRecord deniedWebApplications](self, "deniedWebApplications");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              -[DNDSConfigurationSecureRecord deniedWebApplications](v5, "deniedWebApplications");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v40, "isEqual:", v37);

              v36 = v41;
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
        }
        if (v28 != v56)
        {

        }
        if (v57 != v23)
        {

        }
        if (v62 != v15)
        {

        }
LABEL_51:
        v11 = v60;
        v10 = v61;
        v9 = v58;
        v12 = v59;
        if (v6 != v7)
          goto LABEL_52;
LABEL_54:

        goto LABEL_55;
      }
      -[DNDSConfigurationSecureRecord allowedWebApplications](self, "allowedWebApplications");
      v29 = objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v49 = (void *)v29;
        -[DNDSConfigurationSecureRecord allowedWebApplications](v5, "allowedWebApplications");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          v46 = v30;
          -[DNDSConfigurationSecureRecord allowedWebApplications](self, "allowedWebApplications");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSConfigurationSecureRecord allowedWebApplications](v5, "allowedWebApplications");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v31, "isEqual:", v32) & 1) != 0)
          {
            v43 = v31;
            v44 = v32;
            goto LABEL_33;
          }

          v30 = v46;
        }

      }
      if (v57 != v23)
      {

      }
      v38 = v62;
      if (v62 == v15)
        goto LABEL_48;
      goto LABEL_47;
    }
    v13 = 0;
  }
LABEL_55:

  return v13;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDSConfigurationSecureRecord senderConfiguration](self, "senderConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSConfigurationSecureRecord allowedApplications](self, "allowedApplications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSConfigurationSecureRecord deniedApplications](self, "deniedApplications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSConfigurationSecureRecord allowedWebApplications](self, "allowedWebApplications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSConfigurationSecureRecord deniedWebApplications](self, "deniedWebApplications");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; senderConfiguration: %@; ; allowedApplications: %@; ; deniedApplications: %@; ; allowedWebApplications: %@; ; deniedWebApplications: %@; >"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSConfigurationSecureRecord _initWithRecord:]([DNDSMutableConfigurationSecureRecord alloc], "_initWithRecord:", self);
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  return a3;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  uint64_t v47;
  void *v48;
  void *v49;
  objc_class *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id obj;
  char v60;
  _BYTE v61[15];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  char v66;
  _BYTE v67[15];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  char v72;
  _BYTE v73[15];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v51 = (objc_class *)a1;
  v86 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "bs_safeDictionaryForKey:", CFSTR("senderConfiguration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = +[DNDSSenderConfigurationRecord newWithDictionaryRepresentation:context:](DNDSSenderConfigurationRecord, "newWithDictionaryRepresentation:context:", v7, v6);

  objc_msgSend(v5, "bs_safeDictionaryForKey:", CFSTR("platforms"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v5;
  objc_msgSend(v5, "bs_safeDictionaryForKey:", CFSTR("allowedApplications"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)objc_opt_new();
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v79 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
        objc_msgSend(v58, "objectForKeyedSubscript:", v13, v51);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "unsignedIntegerValue");

        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", v13, v15);
        objc_msgSend(v6, "applicationIdentifierMapper");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "applicationIdentifierForFileWithSourceApplicationIdentifier:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "bundleID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obj, "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = +[DNDSApplicationConfigurationRecord newWithDictionaryRepresentation:context:](DNDSApplicationConfigurationRecord, "newWithDictionaryRepresentation:context:", v20, v6);

        objc_msgSend(v57, "setObject:forKey:", v21, v18);
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
    }
    while (v10);
  }

  objc_msgSend(v53, "bs_safeArrayForKey:", CFSTR("silencedApplications"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v56 = v22;
  v24 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
  v54 = v23;
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v75;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v75 != v26)
          objc_enumerationMutation(v56);
        v28 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", v28, 0);
LABEL_17:
          objc_msgSend(v23, "addObject:", v29, v51);

          continue;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v30 = (void *)objc_msgSend(MEMORY[0x1E0D1D598], "newWithDictionaryRepresentation:context:", v28, v6);
          objc_msgSend(v6, "applicationIdentifierMapper");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "applicationIdentifierForFileWithSourceApplicationIdentifier:", v30);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = v54;
          goto LABEL_17;
        }
        if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR))
          +[DNDSConfigurationSecureRecord newWithDictionaryRepresentation:context:].cold.3(&v72, v73);
      }
      v25 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
    }
    while (v25);
  }

  objc_msgSend(v53, "bs_safeArrayForKey:", CFSTR("allowedWebApplications"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v33 = v32;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v69;
    do
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v69 != v36)
          objc_enumerationMutation(v33);
        v38 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * k);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v39 = (void *)objc_msgSend(MEMORY[0x1E0D1D770], "newWithDictionaryRepresentation:context:", v38, v6);
          objc_msgSend(v55, "addObject:", v39);

        }
        else if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR))
        {
          +[DNDSConfigurationSecureRecord newWithDictionaryRepresentation:context:].cold.1(&v66, v67);
        }
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
    }
    while (v35);
  }

  objc_msgSend(v53, "bs_safeArrayForKey:", CFSTR("silencedWebApplications"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v42 = v40;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v63;
    do
    {
      for (m = 0; m != v44; ++m)
      {
        if (*(_QWORD *)v63 != v45)
          objc_enumerationMutation(v42);
        v47 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * m);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v48 = (void *)objc_msgSend(MEMORY[0x1E0D1D770], "newWithDictionaryRepresentation:context:", v47, v6);
          objc_msgSend(v41, "addObject:", v48);

        }
        else if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR))
        {
          +[DNDSConfigurationSecureRecord newWithDictionaryRepresentation:context:].cold.1(&v60, v61);
        }
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
    }
    while (v44);
  }

  v49 = (void *)objc_msgSend([v51 alloc], "_initWithSenderConfiguration:allowedApplications:deniedApplications:allowedWebApplications:deniedWebApplications:", v52, v57, v54, v55, v41);
  return v49;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t m;
  void *v59;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "healingSource");
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

  -[DNDSConfigurationSecureRecord senderConfiguration](self, "senderConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v8;
  objc_msgSend(v8, "setDictionaryRepresentationOfRecord:forKey:context:", v9, CFSTR("senderConfiguration"), v3);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  -[DNDSConfigurationSecureRecord allowedApplications](self, "allowedApplications");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v79, v86, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v80 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * i);
        -[DNDSConfigurationSecureRecord allowedApplications](self, "allowedApplications");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_msgSend(v3, "destination");
        if (!v18)
        {
          objc_msgSend(v3, "applicationIdentifierMapper");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "applicationIdentifierForSyncWithSourceApplicationIdentifier:", v15);
          v20 = objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
        if (v18 == 1)
        {
          objc_msgSend(v3, "applicationIdentifierMapper");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "applicationIdentifierForFileWithSourceApplicationIdentifier:", v15);
          v20 = objc_claimAutoreleasedReturnValue();
LABEL_13:
          v21 = (void *)v20;

          goto LABEL_15;
        }
        v21 = 0;
LABEL_15:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "platform"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "bundleID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "setObject:forKeyedSubscript:", v22, v23);

        objc_msgSend(v21, "bundleID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setDictionaryRepresentationOfRecord:forKey:context:", v17, v24, v3);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v79, v86, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v3, "healingSource");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("silencedApplications"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v26;
  objc_msgSend(v26, "setArrayHealingSource:", v28);

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  -[DNDSConfigurationSecureRecord deniedApplications](self, "deniedApplications");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
  if (!v30)
    goto LABEL_30;
  v31 = v30;
  v32 = *(_QWORD *)v76;
  do
  {
    for (j = 0; j != v31; ++j)
    {
      if (*(_QWORD *)v76 != v32)
        objc_enumerationMutation(v29);
      v34 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * j);
      v35 = objc_msgSend(v3, "destination");
      if (!v35)
      {
        objc_msgSend(v3, "applicationIdentifierMapper");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "applicationIdentifierForSyncWithSourceApplicationIdentifier:", v34);
        v37 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      }
      if (v35 == 1)
      {
        objc_msgSend(v3, "applicationIdentifierMapper");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "applicationIdentifierForFileWithSourceApplicationIdentifier:", v34);
        v37 = objc_claimAutoreleasedReturnValue();
LABEL_26:
        v38 = (void *)v37;

        goto LABEL_28;
      }
      v38 = 0;
LABEL_28:
      objc_msgSend(v38, "dictionaryRepresentationWithContext:", v63);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v39);

    }
    v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
  }
  while (v31);
LABEL_30:

  objc_msgSend(v62, "bs_setSafeObject:forKey:", v65, CFSTR("allowedApplications"));
  objc_msgSend(v62, "bs_setSafeObject:forKey:", v64, CFSTR("platforms"));
  v61 = v25;
  objc_msgSend(v62, "bs_setSafeObject:forKey:", v25, CFSTR("silencedApplications"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v3, "healingSource");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("allowedWebApplications"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setArrayHealingSource:", v43);

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  -[DNDSConfigurationSecureRecord allowedWebApplications](self, "allowedWebApplications");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v72;
    do
    {
      for (k = 0; k != v46; ++k)
      {
        if (*(_QWORD *)v72 != v47)
          objc_enumerationMutation(v44);
        objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * k), "dictionaryRepresentationWithContext:", v41);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addObject:", v49);

      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
    }
    while (v46);
  }

  objc_msgSend(v62, "bs_setSafeObject:forKey:", v40, CFSTR("allowedWebApplications"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v3, "healingSource");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("silencedWebApplications"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setArrayHealingSource:", v53);

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  -[DNDSConfigurationSecureRecord deniedWebApplications](self, "deniedWebApplications");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v68;
    do
    {
      for (m = 0; m != v56; ++m)
      {
        if (*(_QWORD *)v68 != v57)
          objc_enumerationMutation(v54);
        objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * m), "dictionaryRepresentationWithContext:", v51);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "addObject:", v59);

      }
      v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
    }
    while (v56);
  }

  objc_msgSend(v62, "bs_setSafeObject:forKey:", v50, CFSTR("silencedWebApplications"));
  return v62;
}

- (DNDSSenderConfigurationRecord)senderConfiguration
{
  return self->_senderConfiguration;
}

- (NSDictionary)allowedApplications
{
  return self->_allowedApplications;
}

- (NSSet)deniedApplications
{
  return self->_deniedApplications;
}

- (NSSet)allowedWebApplications
{
  return self->_allowedWebApplications;
}

- (NSSet)deniedWebApplications
{
  return self->_deniedWebApplications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deniedWebApplications, 0);
  objc_storeStrong((id *)&self->_allowedWebApplications, 0);
  objc_storeStrong((id *)&self->_deniedApplications, 0);
  objc_storeStrong((id *)&self->_allowedApplications, 0);
  objc_storeStrong((id *)&self->_senderConfiguration, 0);
}

+ (void)newWithDictionaryRepresentation:(_BYTE *)a1 context:(_BYTE *)a2 .cold.1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_3(a1, a2);
  OUTLINED_FUNCTION_0_4(&dword_1CB895000, v2, v3, "Unexpected class in allowed web application list", v4);
}

+ (void)newWithDictionaryRepresentation:(_BYTE *)a1 context:(_BYTE *)a2 .cold.3(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_3(a1, a2);
  OUTLINED_FUNCTION_0_4(&dword_1CB895000, v2, v3, "Unexpected class in denied application list", v4);
}

@end
