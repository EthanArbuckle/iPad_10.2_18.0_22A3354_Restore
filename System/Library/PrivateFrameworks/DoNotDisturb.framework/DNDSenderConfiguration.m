@implementation DNDSenderConfiguration

- (DNDSenderConfiguration)init
{
  return (DNDSenderConfiguration *)-[DNDSenderConfiguration _initWithAllowedContactTypes:deniedContactTypes:allowedContactGroups:deniedContactGroups:allowedContacts:deniedContacts:phoneCallBypassSettings:](self, "_initWithAllowedContactTypes:deniedContactTypes:allowedContactGroups:deniedContactGroups:allowedContacts:deniedContacts:phoneCallBypassSettings:", 0, 0, 0, 0, 0, 0, 0);
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
  DNDSenderConfiguration *v22;
  void *v23;
  void *v24;
  NSMutableSet *v25;
  NSMutableSet *allowedContactTypes;
  void *v27;
  void *v28;
  NSMutableSet *v29;
  NSMutableSet *deniedContactTypes;
  void *v31;
  void *v32;
  NSMutableSet *v33;
  NSMutableSet *allowedContactGroups;
  void *v35;
  void *v36;
  NSMutableSet *v37;
  NSMutableSet *deniedContactGroups;
  void *v39;
  void *v40;
  NSMutableSet *v41;
  NSMutableSet *allowedContacts;
  void *v43;
  void *v44;
  NSMutableSet *v45;
  NSMutableSet *deniedContacts;
  uint64_t v47;
  DNDBypassSettings *phoneCallBypassSettings;
  objc_super v50;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v50.receiver = self;
  v50.super_class = (Class)DNDSenderConfiguration;
  v22 = -[DNDSenderConfiguration init](&v50, sel_init);
  if (v22)
  {
    v23 = (void *)objc_msgSend(v15, "mutableCopy");
    v24 = v23;
    if (v23)
      v25 = v23;
    else
      v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    allowedContactTypes = v22->_allowedContactTypes;
    v22->_allowedContactTypes = v25;

    v27 = (void *)objc_msgSend(v16, "mutableCopy");
    v28 = v27;
    if (v27)
      v29 = v27;
    else
      v29 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    deniedContactTypes = v22->_deniedContactTypes;
    v22->_deniedContactTypes = v29;

    v31 = (void *)objc_msgSend(v17, "mutableCopy");
    v32 = v31;
    if (v31)
      v33 = v31;
    else
      v33 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    allowedContactGroups = v22->_allowedContactGroups;
    v22->_allowedContactGroups = v33;

    v35 = (void *)objc_msgSend(v18, "mutableCopy");
    v36 = v35;
    if (v35)
      v37 = v35;
    else
      v37 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    deniedContactGroups = v22->_deniedContactGroups;
    v22->_deniedContactGroups = v37;

    v39 = (void *)objc_msgSend(v19, "mutableCopy");
    v40 = v39;
    if (v39)
      v41 = v39;
    else
      v41 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    allowedContacts = v22->_allowedContacts;
    v22->_allowedContacts = v41;

    v43 = (void *)objc_msgSend(v20, "mutableCopy");
    v44 = v43;
    if (v43)
      v45 = v43;
    else
      v45 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    deniedContacts = v22->_deniedContacts;
    v22->_deniedContacts = v45;

    v47 = objc_msgSend(v21, "copy");
    phoneCallBypassSettings = v22->_phoneCallBypassSettings;
    v22->_phoneCallBypassSettings = (DNDBypassSettings *)v47;

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
  void *v15;
  unint64_t v16;

  -[DNDSenderConfiguration allowedContactTypes](self, "allowedContactTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDSenderConfiguration deniedContactTypes](self, "deniedContactTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DNDSenderConfiguration allowedContactGroups](self, "allowedContactGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[DNDSenderConfiguration deniedContactGroups](self, "deniedContactGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[DNDSenderConfiguration allowedContacts](self, "allowedContacts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[DNDSenderConfiguration deniedContacts](self, "deniedContacts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[DNDSenderConfiguration phoneCallBypassSettings](self, "phoneCallBypassSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  DNDSenderConfiguration *v4;
  DNDSenderConfiguration *v5;
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

  v4 = (DNDSenderConfiguration *)a3;
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
      -[DNDSenderConfiguration allowedContactTypes](self, "allowedContactTypes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSenderConfiguration allowedContactTypes](v5, "allowedContactTypes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
      {
        -[DNDSenderConfiguration allowedContactTypes](self, "allowedContactTypes");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v13 = 0;
          goto LABEL_86;
        }
        v9 = (void *)v8;
        -[DNDSenderConfiguration allowedContactTypes](v5, "allowedContactTypes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v13 = 0;
LABEL_85:

          goto LABEL_86;
        }
        -[DNDSenderConfiguration allowedContactTypes](self, "allowedContactTypes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSenderConfiguration allowedContactTypes](v5, "allowedContactTypes");
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
      -[DNDSenderConfiguration deniedContactTypes](self, "deniedContactTypes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSenderConfiguration deniedContactTypes](v5, "deniedContactTypes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 != v15)
      {
        -[DNDSenderConfiguration deniedContactTypes](self, "deniedContactTypes");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          v89 = v14;
          -[DNDSenderConfiguration deniedContactTypes](v5, "deniedContactTypes");
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = (void *)v18;
            -[DNDSenderConfiguration deniedContactTypes](self, "deniedContactTypes");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSenderConfiguration deniedContactTypes](v5, "deniedContactTypes");
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
      -[DNDSenderConfiguration allowedContactGroups](self, "allowedContactGroups");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSenderConfiguration allowedContactGroups](v5, "allowedContactGroups");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21 == v22)
        goto LABEL_25;
      -[DNDSenderConfiguration allowedContactGroups](self, "allowedContactGroups");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v82 = (void *)v23;
        -[DNDSenderConfiguration allowedContactGroups](v5, "allowedContactGroups");
        v24 = objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v78 = (void *)v24;
          -[DNDSenderConfiguration allowedContactGroups](self, "allowedContactGroups");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSenderConfiguration allowedContactGroups](v5, "allowedContactGroups");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v25, "isEqual:", v14) & 1) != 0)
          {
            v74 = v25;
LABEL_25:
            -[DNDSenderConfiguration deniedContactGroups](self, "deniedContactGroups");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSenderConfiguration deniedContactGroups](v5, "deniedContactGroups");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26 != v84)
            {
              -[DNDSenderConfiguration deniedContactGroups](self, "deniedContactGroups");
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
              -[DNDSenderConfiguration deniedContactGroups](v5, "deniedContactGroups");
              v28 = objc_claimAutoreleasedReturnValue();
              if (v28)
              {
                v76 = v14;
                v77 = v21;
                v71 = (void *)v28;
                -[DNDSenderConfiguration deniedContactGroups](self, "deniedContactGroups");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                -[DNDSenderConfiguration deniedContactGroups](v5, "deniedContactGroups");
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
            -[DNDSenderConfiguration allowedContacts](self, "allowedContacts");
            v30 = objc_claimAutoreleasedReturnValue();
            -[DNDSenderConfiguration allowedContacts](v5, "allowedContacts");
            v31 = objc_claimAutoreleasedReturnValue();
            v75 = (void *)v30;
            v32 = v30 == v31;
            v33 = (void *)v31;
            if (v32)
            {
              v72 = (void *)v31;
LABEL_45:
              -[DNDSenderConfiguration deniedContacts](self, "deniedContacts");
              v39 = objc_claimAutoreleasedReturnValue();
              -[DNDSenderConfiguration deniedContacts](v5, "deniedContacts");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              if ((void *)v39 == v70)
              {
                v64 = (void *)v39;
                v65 = v21;
                goto LABEL_55;
              }
              -[DNDSenderConfiguration deniedContacts](self, "deniedContacts");
              v40 = objc_claimAutoreleasedReturnValue();
              if (v40)
              {
                v63 = (void *)v40;
                -[DNDSenderConfiguration deniedContacts](v5, "deniedContacts");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                if (v41)
                {
                  v65 = v21;
                  v61 = v41;
                  -[DNDSenderConfiguration deniedContacts](self, "deniedContacts");
                  v42 = objc_claimAutoreleasedReturnValue();
                  -[DNDSenderConfiguration deniedContacts](v5, "deniedContacts");
                  v43 = objc_claimAutoreleasedReturnValue();
                  v60 = (void *)v42;
                  v44 = (void *)v42;
                  v45 = (void *)v43;
                  if ((objc_msgSend(v44, "isEqual:", v43) & 1) != 0)
                  {
                    v58 = v45;
                    v64 = (void *)v39;
LABEL_55:
                    -[DNDSenderConfiguration phoneCallBypassSettings](self, "phoneCallBypassSettings");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    -[DNDSenderConfiguration phoneCallBypassSettings](v5, "phoneCallBypassSettings");
                    v47 = objc_claimAutoreleasedReturnValue();
                    if (v46 == (void *)v47)
                    {

                      v13 = 1;
                    }
                    else
                    {
                      v59 = (void *)v47;
                      -[DNDSenderConfiguration phoneCallBypassSettings](self, "phoneCallBypassSettings");
                      v48 = objc_claimAutoreleasedReturnValue();
                      if (v48)
                      {
                        v57 = (void *)v48;
                        -[DNDSenderConfiguration phoneCallBypassSettings](v5, "phoneCallBypassSettings");
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v49)
                        {
                          v56 = v49;
                          -[DNDSenderConfiguration phoneCallBypassSettings](self, "phoneCallBypassSettings");
                          v55 = (void *)objc_claimAutoreleasedReturnValue();
                          -[DNDSenderConfiguration phoneCallBypassSettings](v5, "phoneCallBypassSettings");
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
            -[DNDSenderConfiguration allowedContacts](self, "allowedContacts");
            v34 = objc_claimAutoreleasedReturnValue();
            if (v34)
            {
              v69 = (void *)v34;
              -[DNDSenderConfiguration allowedContacts](v5, "allowedContacts");
              v35 = objc_claimAutoreleasedReturnValue();
              if (v35)
              {
                v72 = v33;
                v66 = (void *)v35;
                -[DNDSenderConfiguration allowedContacts](self, "allowedContacts");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                -[DNDSenderConfiguration allowedContacts](v5, "allowedContacts");
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

- (id)description
{
  return -[DNDSenderConfiguration _descriptionForRedacted:](self, "_descriptionForRedacted:", 0);
}

- (id)redactedDescription
{
  return -[DNDSenderConfiguration _descriptionForRedacted:](self, "_descriptionForRedacted:", 1);
}

- (id)_descriptionForRedacted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  NSMutableSet *allowedContactTypes;
  NSMutableSet *deniedContactTypes;
  NSMutableSet *allowedContactGroups;
  NSMutableSet *deniedContactGroups;
  void *allowedContacts;
  void *deniedContacts;
  void *v13;

  v3 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  allowedContactTypes = self->_allowedContactTypes;
  deniedContactTypes = self->_deniedContactTypes;
  allowedContactGroups = self->_allowedContactGroups;
  deniedContactGroups = self->_deniedContactGroups;
  allowedContacts = self->_allowedContacts;
  if (v3)
  {
    -[DNDSenderConfiguration _redactedDescriptionsForContacts:](self, "_redactedDescriptionsForContacts:", self->_allowedContacts);
    allowedContacts = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSenderConfiguration _redactedDescriptionsForContacts:](self, "_redactedDescriptionsForContacts:", self->_deniedContacts);
    deniedContacts = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    deniedContacts = self->_deniedContacts;
  }
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p; allowedContactTypes: %@; deniedContactTypes: %@; allowedContactGroups: %@; deniedContactGroups: %@; allowedContacts: %@; deniedContacts: %@; phoneCallBypassSettings: %@>"),
    v6,
    self,
    allowedContactTypes,
    deniedContactTypes,
    allowedContactGroups,
    deniedContactGroups,
    allowedContacts,
    deniedContacts,
    self->_phoneCallBypassSettings);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  return v13;
}

- (id)_redactedDescriptionsForContacts:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
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
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "redactedDescription", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSenderConfiguration _initWithAllowedContactTypes:deniedContactTypes:allowedContactGroups:deniedContactGroups:allowedContacts:deniedContacts:phoneCallBypassSettings:]([DNDMutableSenderConfiguration alloc], "_initWithAllowedContactTypes:deniedContactTypes:allowedContactGroups:deniedContactGroups:allowedContacts:deniedContacts:phoneCallBypassSettings:", self->_allowedContactTypes, self->_deniedContactTypes, self->_allowedContactGroups, self->_deniedContactGroups, self->_allowedContacts, self->_deniedContacts, self->_phoneCallBypassSettings);
}

- (void)diffAgainstObject:(id)a3 usingDiffBuilder:(id)a4 withDescription:(id)a5
{
  id v7;
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
  id v23;

  v23 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v23;
    -[DNDSenderConfiguration allowedContacts](self, "allowedContacts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allowedContacts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diffObject:againstObject:withDescription:", v9, v10, CFSTR("allowedContacts"));

    -[DNDSenderConfiguration deniedContacts](self, "deniedContacts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deniedContacts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diffObject:againstObject:withDescription:", v11, v12, CFSTR("deniedContacts"));

    -[DNDSenderConfiguration allowedContactTypes](self, "allowedContactTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allowedContactTypes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diffObject:againstObject:withDescription:", v13, v14, CFSTR("allowedContactTypes"));

    -[DNDSenderConfiguration deniedContactTypes](self, "deniedContactTypes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deniedContactTypes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diffObject:againstObject:withDescription:", v15, v16, CFSTR("deniedContactTypes"));

    -[DNDSenderConfiguration allowedContactGroups](self, "allowedContactGroups");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allowedContactGroups");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diffObject:againstObject:withDescription:", v17, v18, CFSTR("allowedContactGroups"));

    -[DNDSenderConfiguration deniedContactGroups](self, "deniedContactGroups");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deniedContactGroups");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diffObject:againstObject:withDescription:", v19, v20, CFSTR("deniedContactGroups"));

    -[DNDSenderConfiguration phoneCallBypassSettings](self, "phoneCallBypassSettings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "phoneCallBypassSettings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "diffObject:againstObject:withDescription:", v21, v22, CFSTR("phoneCallBypassSettings"));
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDSenderConfiguration)initWithCoder:(id)a3
{
  void *v3;
  id v4;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  DNDSenderConfiguration *v28;
  void *v30;
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("allowedContactTypes"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99E60];
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("deniedContactTypes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  v35[0] = objc_opt_class();
  v35[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("allowedContactGroups"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C99E60];
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("deniedContactGroups"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0C99E60];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("allowedContacts"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0C99E60];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setWithArray:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("deniedContacts"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneCallBypassSettings"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = -[DNDSenderConfiguration _initWithAllowedContactTypes:deniedContactTypes:allowedContactGroups:deniedContactGroups:allowedContacts:deniedContacts:phoneCallBypassSettings:](self, "_initWithAllowedContactTypes:deniedContactTypes:allowedContactGroups:deniedContactGroups:allowedContacts:deniedContacts:phoneCallBypassSettings:", v30, v10, v14, v18, v22, v26, v27);
  return v28;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableSet *allowedContactTypes;
  id v5;

  allowedContactTypes = self->_allowedContactTypes;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", allowedContactTypes, CFSTR("allowedContactTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deniedContactTypes, CFSTR("deniedContactTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_allowedContactGroups, CFSTR("allowedContactGroups"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deniedContactGroups, CFSTR("deniedContactGroups"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_allowedContacts, CFSTR("allowedContacts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deniedContacts, CFSTR("deniedContacts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneCallBypassSettings, CFSTR("phoneCallBypassSettings"));

}

- (DNDBypassSettings)phoneCallBypassSettings
{
  return (DNDBypassSettings *)-[DNDSenderConfiguration _evaluatedBypassSettings:](self, "_evaluatedBypassSettings:", self->_phoneCallBypassSettings);
}

- (id)_evaluatedBypassSettings:(id)a3
{
  id v3;
  DNDMutableBypassSettings *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = (DNDMutableBypassSettings *)objc_msgSend(v3, "mutableCopy");
  if (!v4)
    v4 = objc_alloc_init(DNDMutableBypassSettings);
  v5 = DNDResolvedImmediateBypassEventSourceType(objc_msgSend(v3, "immediateBypassEventSourceType"));
  if (v5 == 5)
  {
    objc_msgSend(v3, "immediateBypassCNGroupIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v5 = 5;
    else
      v5 = DNDResolvedImmediateBypassEventSourceType(0);
  }
  -[DNDMutableBypassSettings setImmediateBypassEventSourceType:](v4, "setImmediateBypassEventSourceType:", v5);

  return v4;
}

- (NSSet)allowedContactTypes
{
  return &self->_allowedContactTypes->super;
}

- (NSSet)deniedContactTypes
{
  return &self->_deniedContactTypes->super;
}

- (NSSet)allowedContactGroups
{
  return &self->_allowedContactGroups->super;
}

- (NSSet)deniedContactGroups
{
  return &self->_deniedContactGroups->super;
}

- (NSSet)allowedContacts
{
  return &self->_allowedContacts->super;
}

- (NSSet)deniedContacts
{
  return &self->_deniedContacts->super;
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
