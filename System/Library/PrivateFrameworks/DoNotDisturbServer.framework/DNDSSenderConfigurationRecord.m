@implementation DNDSSenderConfigurationRecord

- (DNDSSenderConfigurationRecord)init
{
  return (DNDSSenderConfigurationRecord *)-[DNDSSenderConfigurationRecord _initWithRecord:](self, "_initWithRecord:", 0);
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
  id v12;

  v4 = a3;
  objc_msgSend(v4, "allowedContactTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deniedContactTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowedContactGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deniedContactGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowedContacts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deniedContacts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneCallBypassSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[DNDSSenderConfigurationRecord _initWithAllowedContactTypes:deniedContactTypes:allowedContactGroups:deniedContactGroups:allowedContacts:deniedContacts:phoneCallBypassSettings:](self, "_initWithAllowedContactTypes:deniedContactTypes:allowedContactGroups:deniedContactGroups:allowedContacts:deniedContacts:phoneCallBypassSettings:", v5, v6, v7, v8, v9, v10, v11);
  return v12;
}

- (id)_initWithAllowedContactTypes:(id)a3 deniedContactTypes:(id)a4 allowedContactGroups:(id)a5 deniedContactGroups:(id)a6 allowedContacts:(id)a7 deniedContacts:(id)a8 phoneCallBypassSettings:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  DNDSSenderConfigurationRecord *v22;
  void *v23;
  void *v24;
  NSSet *v25;
  NSSet *allowedContactTypes;
  void *v27;
  void *v28;
  NSSet *v29;
  NSSet *deniedContactTypes;
  void *v31;
  void *v32;
  NSSet *v33;
  NSSet *allowedContactGroups;
  void *v35;
  void *v36;
  NSSet *v37;
  NSSet *deniedContactGroups;
  void *v39;
  void *v40;
  NSSet *v41;
  NSSet *allowedContacts;
  void *v43;
  void *v44;
  NSSet *v45;
  NSSet *deniedContacts;
  uint64_t v47;
  DNDSBypassSettingsRecord *phoneCallBypassSettings;
  objc_super v50;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v50.receiver = self;
  v50.super_class = (Class)DNDSSenderConfigurationRecord;
  v22 = -[DNDSSenderConfigurationRecord init](&v50, sel_init);
  if (v22)
  {
    v23 = (void *)objc_msgSend(v15, "copy");
    v24 = v23;
    if (v23)
      v25 = v23;
    else
      v25 = (NSSet *)objc_opt_new();
    allowedContactTypes = v22->_allowedContactTypes;
    v22->_allowedContactTypes = v25;

    v27 = (void *)objc_msgSend(v16, "copy");
    v28 = v27;
    if (v27)
      v29 = v27;
    else
      v29 = (NSSet *)objc_opt_new();
    deniedContactTypes = v22->_deniedContactTypes;
    v22->_deniedContactTypes = v29;

    v31 = (void *)objc_msgSend(v17, "copy");
    v32 = v31;
    if (v31)
      v33 = v31;
    else
      v33 = (NSSet *)objc_opt_new();
    allowedContactGroups = v22->_allowedContactGroups;
    v22->_allowedContactGroups = v33;

    v35 = (void *)objc_msgSend(v18, "copy");
    v36 = v35;
    if (v35)
      v37 = v35;
    else
      v37 = (NSSet *)objc_opt_new();
    deniedContactGroups = v22->_deniedContactGroups;
    v22->_deniedContactGroups = v37;

    v39 = (void *)objc_msgSend(v19, "copy");
    v40 = v39;
    if (v39)
      v41 = v39;
    else
      v41 = (NSSet *)objc_opt_new();
    allowedContacts = v22->_allowedContacts;
    v22->_allowedContacts = v41;

    v43 = (void *)objc_msgSend(v20, "copy");
    v44 = v43;
    if (v43)
      v45 = v43;
    else
      v45 = (NSSet *)objc_opt_new();
    deniedContacts = v22->_deniedContacts;
    v22->_deniedContacts = v45;

    v47 = objc_msgSend(v21, "copy");
    phoneCallBypassSettings = v22->_phoneCallBypassSettings;
    v22->_phoneCallBypassSettings = (DNDSBypassSettingsRecord *)v47;

  }
  return v22;
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
  unint64_t v15;

  -[DNDSSenderConfigurationRecord allowedContactTypes](self, "allowedContactTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDSSenderConfigurationRecord deniedContactTypes](self, "deniedContactTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DNDSSenderConfigurationRecord allowedContactGroups](self, "allowedContactGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[DNDSSenderConfigurationRecord deniedContactGroups](self, "deniedContactGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[DNDSSenderConfigurationRecord allowedContacts](self, "allowedContacts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[DNDSSenderConfigurationRecord deniedContacts](self, "deniedContacts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 ^ v12 ^ objc_msgSend(v13, "hash");
  v15 = v14 ^ -[DNDSBypassSettingsRecord hash](self->_phoneCallBypassSettings, "hash");

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  DNDSSenderConfigurationRecord *v4;
  DNDSSenderConfigurationRecord *v5;
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
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
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

  v4 = (DNDSSenderConfigurationRecord *)a3;
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
      -[DNDSSenderConfigurationRecord allowedContactTypes](self, "allowedContactTypes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSSenderConfigurationRecord allowedContactTypes](v5, "allowedContactTypes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
      {
        -[DNDSSenderConfigurationRecord allowedContactTypes](self, "allowedContactTypes");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v13 = 0;
          goto LABEL_86;
        }
        v9 = (void *)v8;
        -[DNDSSenderConfigurationRecord allowedContactTypes](v5, "allowedContactTypes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v13 = 0;
LABEL_85:

          goto LABEL_86;
        }
        -[DNDSSenderConfigurationRecord allowedContactTypes](self, "allowedContactTypes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSSenderConfigurationRecord allowedContactTypes](v5, "allowedContactTypes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v11, "isEqual:", v12))
        {
          v13 = 0;
LABEL_84:

          goto LABEL_85;
        }
        v85 = v9;
        v86 = v12;
        v87 = v11;
        v88 = v10;
      }
      -[DNDSSenderConfigurationRecord deniedContactTypes](self, "deniedContactTypes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSSenderConfigurationRecord deniedContactTypes](v5, "deniedContactTypes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 != v15)
      {
        -[DNDSSenderConfigurationRecord deniedContactTypes](self, "deniedContactTypes");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          v89 = v14;
          -[DNDSSenderConfigurationRecord deniedContactTypes](v5, "deniedContactTypes");
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = (void *)v18;
            -[DNDSSenderConfigurationRecord deniedContactTypes](self, "deniedContactTypes");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSSenderConfigurationRecord deniedContactTypes](v5, "deniedContactTypes");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v14, "isEqual:", v20) & 1) != 0)
            {
              v80 = v17;
              v81 = v20;
              v83 = v14;
              v79 = v19;
              goto LABEL_17;
            }

          }
        }
        else
        {

        }
LABEL_82:
        v13 = 0;
        goto LABEL_83;
      }
      v89 = v14;
LABEL_17:
      -[DNDSSenderConfigurationRecord allowedContactGroups](self, "allowedContactGroups");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSSenderConfigurationRecord allowedContactGroups](v5, "allowedContactGroups");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21 == v22)
        goto LABEL_25;
      -[DNDSSenderConfigurationRecord allowedContactGroups](self, "allowedContactGroups");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v82 = (void *)v23;
        -[DNDSSenderConfigurationRecord allowedContactGroups](v5, "allowedContactGroups");
        v24 = objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v78 = (void *)v24;
          -[DNDSSenderConfigurationRecord allowedContactGroups](self, "allowedContactGroups");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSSenderConfigurationRecord allowedContactGroups](v5, "allowedContactGroups");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v25, "isEqual:", v14) & 1) != 0)
          {
            v74 = v25;
LABEL_25:
            -[DNDSSenderConfigurationRecord deniedContactGroups](self, "deniedContactGroups");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSSenderConfigurationRecord deniedContactGroups](v5, "deniedContactGroups");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26 != v84)
            {
              -[DNDSSenderConfigurationRecord deniedContactGroups](self, "deniedContactGroups");
              v27 = objc_claimAutoreleasedReturnValue();
              if (!v27)
              {

                if (v21 == v22)
                {

                }
                else
                {

                }
                v38 = v89;
                v51 = v83;
                if (v89 == v15)
                  goto LABEL_80;
                goto LABEL_71;
              }
              v73 = (void *)v27;
              -[DNDSSenderConfigurationRecord deniedContactGroups](v5, "deniedContactGroups");
              v28 = objc_claimAutoreleasedReturnValue();
              if (v28)
              {
                v76 = v14;
                v77 = v21;
                v71 = (void *)v28;
                -[DNDSSenderConfigurationRecord deniedContactGroups](self, "deniedContactGroups");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                -[DNDSSenderConfigurationRecord deniedContactGroups](v5, "deniedContactGroups");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v29, "isEqual:", v21) & 1) != 0)
                {
                  v67 = v21;
                  v68 = v29;
                  goto LABEL_33;
                }

                if (v77 == v22)
                {

                }
                else
                {

                }
              }
              else
              {

                if (v21 == v22)
                {

                }
                else
                {

                }
              }
              v38 = v89;
              if (v89 == v15)
              {
LABEL_80:

                goto LABEL_81;
              }
              goto LABEL_78;
            }
            v76 = v14;
            v77 = v21;
LABEL_33:
            -[DNDSSenderConfigurationRecord allowedContacts](self, "allowedContacts");
            v30 = objc_claimAutoreleasedReturnValue();
            -[DNDSSenderConfigurationRecord allowedContacts](v5, "allowedContacts");
            v31 = objc_claimAutoreleasedReturnValue();
            v75 = (void *)v30;
            v32 = v30 == v31;
            v33 = (void *)v31;
            if (v32)
            {
              v72 = (void *)v31;
LABEL_45:
              -[DNDSSenderConfigurationRecord deniedContacts](self, "deniedContacts");
              v39 = objc_claimAutoreleasedReturnValue();
              -[DNDSSenderConfigurationRecord deniedContacts](v5, "deniedContacts");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              if ((void *)v39 == v70)
              {
                v64 = (void *)v39;
                v65 = v21;
                goto LABEL_55;
              }
              -[DNDSSenderConfigurationRecord deniedContacts](self, "deniedContacts");
              v40 = objc_claimAutoreleasedReturnValue();
              if (v40)
              {
                v63 = (void *)v40;
                -[DNDSSenderConfigurationRecord deniedContacts](v5, "deniedContacts");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                if (v41)
                {
                  v65 = v21;
                  v61 = v41;
                  -[DNDSSenderConfigurationRecord deniedContacts](self, "deniedContacts");
                  v42 = objc_claimAutoreleasedReturnValue();
                  -[DNDSSenderConfigurationRecord deniedContacts](v5, "deniedContacts");
                  v43 = objc_claimAutoreleasedReturnValue();
                  v60 = (void *)v42;
                  v44 = (void *)v42;
                  v45 = (void *)v43;
                  if ((objc_msgSend(v44, "isEqual:", v43) & 1) != 0)
                  {
                    v58 = v45;
                    v64 = (void *)v39;
LABEL_55:
                    -[DNDSSenderConfigurationRecord phoneCallBypassSettings](self, "phoneCallBypassSettings");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    -[DNDSSenderConfigurationRecord phoneCallBypassSettings](v5, "phoneCallBypassSettings");
                    v47 = objc_claimAutoreleasedReturnValue();
                    if (v46 == (void *)v47)
                    {

                      v13 = 1;
                    }
                    else
                    {
                      v59 = (void *)v47;
                      -[DNDSSenderConfigurationRecord phoneCallBypassSettings](self, "phoneCallBypassSettings");
                      v48 = objc_claimAutoreleasedReturnValue();
                      if (v48)
                      {
                        v57 = (void *)v48;
                        -[DNDSSenderConfigurationRecord phoneCallBypassSettings](v5, "phoneCallBypassSettings");
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v49)
                        {
                          v56 = v49;
                          -[DNDSSenderConfigurationRecord phoneCallBypassSettings](self, "phoneCallBypassSettings");
                          v55 = (void *)objc_claimAutoreleasedReturnValue();
                          -[DNDSSenderConfigurationRecord phoneCallBypassSettings](v5, "phoneCallBypassSettings");
                          v50 = (void *)objc_claimAutoreleasedReturnValue();
                          v13 = objc_msgSend(v55, "isEqual:", v50);

                          v49 = v56;
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
                    if (v64 != v70)
                    {

                    }
                    if (v75 != v72)
                    {

                    }
                    if (v26 != v84)
                    {

                    }
                    if (v77 != v22)
                    {

                    }
                    if (v89 != v15)
                    {

                    }
LABEL_83:
                    v11 = v87;
                    v10 = v88;
                    v9 = v85;
                    v12 = v86;
                    if (v6 != v7)
                      goto LABEL_84;
LABEL_86:

                    goto LABEL_87;
                  }

                  v41 = v61;
                  v21 = v65;
                }
                v52 = (void *)v39;
                v53 = v21;

              }
              else
              {
                v52 = (void *)v39;
                v53 = v21;
              }

              if (v75 != v72)
              {

              }
              if (v26 != v84)
              {

              }
              if (v77 != v22)
              {

              }
              v38 = v89;
              if (v89 == v15)
                goto LABEL_80;
              goto LABEL_78;
            }
            -[DNDSSenderConfigurationRecord allowedContacts](self, "allowedContacts");
            v34 = objc_claimAutoreleasedReturnValue();
            if (v34)
            {
              v69 = (void *)v34;
              -[DNDSSenderConfigurationRecord allowedContacts](v5, "allowedContacts");
              v35 = objc_claimAutoreleasedReturnValue();
              if (v35)
              {
                v72 = v33;
                v66 = (void *)v35;
                -[DNDSSenderConfigurationRecord allowedContacts](self, "allowedContacts");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                -[DNDSSenderConfigurationRecord allowedContacts](v5, "allowedContacts");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v36, "isEqual:", v37) & 1) != 0)
                {
                  v62 = v36;
                  v21 = v37;
                  goto LABEL_45;
                }

                goto LABEL_65;
              }

            }
LABEL_65:

            if (v26 == v84)
            {

            }
            else
            {

            }
            v51 = v83;
            if (v77 != v22)
            {

            }
            v38 = v89;
            if (v89 == v15)
              goto LABEL_80;
LABEL_71:

LABEL_79:
            goto LABEL_80;
          }

        }
      }

      v38 = v89;
      if (v89 == v15)
      {

LABEL_81:
        goto LABEL_82;
      }
LABEL_78:

      goto LABEL_79;
    }
    v13 = 0;
  }
LABEL_87:

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
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDSSenderConfigurationRecord allowedContactTypes](self, "allowedContactTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSenderConfigurationRecord deniedContactTypes](self, "deniedContactTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSenderConfigurationRecord allowedContactGroups](self, "allowedContactGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSenderConfigurationRecord deniedContactGroups](self, "deniedContactGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSenderConfigurationRecord allowedContacts](self, "allowedContacts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSenderConfigurationRecord deniedContacts](self, "deniedContacts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSenderConfigurationRecord phoneCallBypassSettings](self, "phoneCallBypassSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; allowedContactTypes: %@; ; deniedContactTypes: %@; ; allowedContactGroups: %@; ; deniedContactGroups: %@; ; allowedContacts: %@; ; deniedContacts: %@; ; phoneCallBypassSettings: %@; >"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSSenderConfigurationRecord _initWithRecord:]([DNDSMutableSenderConfigurationRecord alloc], "_initWithRecord:", self);
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
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  void *v38;
  void *v39;
  Class v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "bs_safeArrayForKey:", CFSTR("allowedContactTypes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "bs_safeArrayForKey:", CFSTR("deniedContactTypes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "bs_safeArrayForKey:", CFSTR("allowedContactGroups"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "bs_safeArrayForKey:", CFSTR("deniedContactGroups"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "bs_safeArrayForKey:", CFSTR("allowedContacts"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_opt_new();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v19 = v17;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v50;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v50 != v22)
          objc_enumerationMutation(v19);
        v24 = +[DNDSContactRecord newWithDictionaryRepresentation:context:](DNDSContactRecord, "newWithDictionaryRepresentation:context:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v23), v6);
        objc_msgSend(v18, "addObject:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v21);
  }

  v25 = (void *)MEMORY[0x1E0C99E60];
  v44 = v5;
  objc_msgSend(v5, "bs_safeArrayForKey:", CFSTR("silencedContacts"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setWithArray:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)objc_opt_new();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v29 = v27;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v46;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v46 != v32)
          objc_enumerationMutation(v29);
        v34 = +[DNDSContactRecord newWithDictionaryRepresentation:context:](DNDSContactRecord, "newWithDictionaryRepresentation:context:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v33), v6);
        objc_msgSend(v28, "addObject:", v34);

        ++v33;
      }
      while (v31 != v33);
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v31);
  }

  objc_msgSend(v44, "bs_safeDictionaryForKey:", CFSTR("phoneCallBypassSettings"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = +[DNDSBypassSettingsRecord newWithDictionaryRepresentation:context:](DNDSBypassSettingsRecord, "newWithDictionaryRepresentation:context:", v35, v6);
  v41 = (Class)objc_msgSend(objc_alloc((Class)a1), "_initWithAllowedContactTypes:deniedContactTypes:allowedContactGroups:deniedContactGroups:allowedContacts:deniedContacts:phoneCallBypassSettings:", v43, v42, v39, v38, v18, v28, v36);

  return v41;
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
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
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

  -[DNDSSenderConfigurationRecord allowedContactTypes](self, "allowedContactTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bs_setSafeObject:forKey:", v11, CFSTR("allowedContactTypes"));

  -[DNDSSenderConfigurationRecord deniedContactTypes](self, "deniedContactTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bs_setSafeObject:forKey:", v13, CFSTR("deniedContactTypes"));

  -[DNDSSenderConfigurationRecord allowedContactGroups](self, "allowedContactGroups");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bs_setSafeObject:forKey:", v15, CFSTR("allowedContactGroups"));

  -[DNDSSenderConfigurationRecord deniedContactGroups](self, "deniedContactGroups");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bs_setSafeObject:forKey:", v17, CFSTR("deniedContactGroups"));

  if ((objc_msgSend(v4, "redactSensitiveData") & 1) != 0)
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("allowedContacts"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("silencedContacts"));
  }
  else
  {
    v18 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v4, "healingSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("allowedContacts"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setArrayHealingSource:", v20);

    v21 = (void *)objc_opt_new();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    -[DNDSSenderConfigurationRecord allowedContacts](self, "allowedContacts");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v48 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "dictionaryRepresentationWithContext:", v18);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v27);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v24);
    }

    objc_msgSend(v21, "allObjects");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bs_setSafeObject:forKey:", v28, CFSTR("allowedContacts"));

    v42 = v4;
    objc_msgSend(v4, "healingSource");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("silencedContacts"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setArrayHealingSource:", v30);

    v31 = (void *)objc_opt_new();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[DNDSSenderConfigurationRecord deniedContacts](self, "deniedContacts");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v44 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * j), "dictionaryRepresentationWithContext:", v18);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v37);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v34);
    }

    objc_msgSend(v31, "allObjects");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bs_setSafeObject:forKey:", v38, CFSTR("silencedContacts"));

    v4 = v42;
  }
  -[DNDSSenderConfigurationRecord phoneCallBypassSettings](self, "phoneCallBypassSettings");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    -[DNDSSenderConfigurationRecord phoneCallBypassSettings](self, "phoneCallBypassSettings");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDictionaryRepresentationOfRecord:forKey:context:", v40, CFSTR("phoneCallBypassSettings"), v4);

  }
  return v9;
}

- (NSSet)allowedContactTypes
{
  return self->_allowedContactTypes;
}

- (NSSet)deniedContactTypes
{
  return self->_deniedContactTypes;
}

- (NSSet)allowedContactGroups
{
  return self->_allowedContactGroups;
}

- (NSSet)deniedContactGroups
{
  return self->_deniedContactGroups;
}

- (NSSet)allowedContacts
{
  return self->_allowedContacts;
}

- (NSSet)deniedContacts
{
  return self->_deniedContacts;
}

- (DNDSBypassSettingsRecord)phoneCallBypassSettings
{
  return self->_phoneCallBypassSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneCallBypassSettings, 0);
  objc_storeStrong((id *)&self->_deniedContacts, 0);
  objc_storeStrong((id *)&self->_allowedContacts, 0);
  objc_storeStrong((id *)&self->_deniedContactGroups, 0);
  objc_storeStrong((id *)&self->_allowedContactGroups, 0);
  objc_storeStrong((id *)&self->_deniedContactTypes, 0);
  objc_storeStrong((id *)&self->_allowedContactTypes, 0);
}

@end
