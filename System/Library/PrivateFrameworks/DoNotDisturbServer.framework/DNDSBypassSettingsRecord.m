@implementation DNDSBypassSettingsRecord

- (DNDSBypassSettingsRecord)init
{
  return (DNDSBypassSettingsRecord *)-[DNDSBypassSettingsRecord _initWithRecord:](self, "_initWithRecord:", 0);
}

- (id)_initWithRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "immediateBypassEventSourceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "immediateBypassCNGroupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "repeatEventSourceBehaviorEnabledSetting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[DNDSBypassSettingsRecord _initWithImmediateBypassEventSourceType:immediateBypassCNGroupIdentifier:repeatEventSourceBehaviorEnabledSetting:](self, "_initWithImmediateBypassEventSourceType:immediateBypassCNGroupIdentifier:repeatEventSourceBehaviorEnabledSetting:", v5, v6, v7);
  return v8;
}

- (id)_initWithImmediateBypassEventSourceType:(id)a3 immediateBypassCNGroupIdentifier:(id)a4 repeatEventSourceBehaviorEnabledSetting:(id)a5
{
  id v8;
  id v9;
  id v10;
  DNDSBypassSettingsRecord *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *immediateBypassCNGroupIdentifier;
  uint64_t v17;
  void *v18;
  void *v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)DNDSBypassSettingsRecord;
  v11 = -[DNDSBypassSettingsRecord init](&v21, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    v13 = (void *)v12;
    if (v12)
      v14 = (void *)v12;
    else
      v14 = &unk_1E86DE490;
    objc_storeStrong((id *)&v11->_immediateBypassEventSourceType, v14);

    v15 = objc_msgSend(v9, "copy");
    immediateBypassCNGroupIdentifier = v11->_immediateBypassCNGroupIdentifier;
    v11->_immediateBypassCNGroupIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v10, "copy");
    v18 = (void *)v17;
    if (v17)
      v19 = (void *)v17;
    else
      v19 = &unk_1E86DE490;
    objc_storeStrong((id *)&v11->_repeatEventSourceBehaviorEnabledSetting, v19);

  }
  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[DNDSBypassSettingsRecord immediateBypassEventSourceType](self, "immediateBypassEventSourceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDSBypassSettingsRecord immediateBypassCNGroupIdentifier](self, "immediateBypassCNGroupIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DNDSBypassSettingsRecord repeatEventSourceBehaviorEnabledSetting](self, "repeatEventSourceBehaviorEnabledSetting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  DNDSBypassSettingsRecord *v5;
  DNDSBypassSettingsRecord *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v5 = (DNDSBypassSettingsRecord *)a3;
  if (self == v5)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[DNDSBypassSettingsRecord immediateBypassEventSourceType](self, "immediateBypassEventSourceType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSBypassSettingsRecord immediateBypassEventSourceType](v6, "immediateBypassEventSourceType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[DNDSBypassSettingsRecord immediateBypassEventSourceType](self, "immediateBypassEventSourceType");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v13 = 0;
          goto LABEL_37;
        }
        v10 = (void *)v9;
        -[DNDSBypassSettingsRecord immediateBypassEventSourceType](v6, "immediateBypassEventSourceType");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v13 = 0;
LABEL_36:

          goto LABEL_37;
        }
        -[DNDSBypassSettingsRecord immediateBypassEventSourceType](self, "immediateBypassEventSourceType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSBypassSettingsRecord immediateBypassEventSourceType](v6, "immediateBypassEventSourceType");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "isEqual:", v3))
        {
          v13 = 0;
LABEL_35:

          goto LABEL_36;
        }
        v36 = v3;
        v37 = v12;
        v38 = v11;
        v39 = v10;
      }
      -[DNDSBypassSettingsRecord immediateBypassCNGroupIdentifier](self, "immediateBypassCNGroupIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSBypassSettingsRecord immediateBypassCNGroupIdentifier](v6, "immediateBypassCNGroupIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 != v15)
      {
        -[DNDSBypassSettingsRecord immediateBypassCNGroupIdentifier](self, "immediateBypassCNGroupIdentifier");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          -[DNDSBypassSettingsRecord immediateBypassCNGroupIdentifier](v6, "immediateBypassCNGroupIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v35 = v14;
            -[DNDSBypassSettingsRecord immediateBypassCNGroupIdentifier](self, "immediateBypassCNGroupIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSBypassSettingsRecord immediateBypassCNGroupIdentifier](v6, "immediateBypassCNGroupIdentifier");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v19, "isEqual:", v3) & 1) != 0)
            {
              v31 = v19;
              v32 = v18;
              v33 = v17;
LABEL_17:
              -[DNDSBypassSettingsRecord repeatEventSourceBehaviorEnabledSetting](self, "repeatEventSourceBehaviorEnabledSetting");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[DNDSBypassSettingsRecord repeatEventSourceBehaviorEnabledSetting](v6, "repeatEventSourceBehaviorEnabledSetting");
              v21 = objc_claimAutoreleasedReturnValue();
              if (v20 == (void *)v21)
              {

                v13 = 1;
                v27 = v35;
              }
              else
              {
                v22 = (void *)v21;
                v34 = v3;
                -[DNDSBypassSettingsRecord repeatEventSourceBehaviorEnabledSetting](self, "repeatEventSourceBehaviorEnabledSetting");
                v23 = objc_claimAutoreleasedReturnValue();
                if (v23)
                {
                  v24 = (void *)v23;
                  -[DNDSBypassSettingsRecord repeatEventSourceBehaviorEnabledSetting](v6, "repeatEventSourceBehaviorEnabledSetting");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v25)
                  {
                    v30 = v25;
                    -[DNDSBypassSettingsRecord repeatEventSourceBehaviorEnabledSetting](self, "repeatEventSourceBehaviorEnabledSetting");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    -[DNDSBypassSettingsRecord repeatEventSourceBehaviorEnabledSetting](v6, "repeatEventSourceBehaviorEnabledSetting");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v13 = objc_msgSend(v29, "isEqual:", v26);

                    v25 = v30;
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
                v3 = v34;
                v27 = v35;
              }
              if (v27 != v15)
              {

              }
LABEL_34:
              v11 = v38;
              v10 = v39;
              v3 = v36;
              v12 = v37;
              if (v7 != v8)
                goto LABEL_35;
LABEL_37:

              goto LABEL_38;
            }

            v14 = v35;
          }

        }
        v13 = 0;
        goto LABEL_34;
      }
      v35 = v14;
      goto LABEL_17;
    }
    v13 = 0;
  }
LABEL_38:

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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDSBypassSettingsRecord immediateBypassEventSourceType](self, "immediateBypassEventSourceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSBypassSettingsRecord immediateBypassCNGroupIdentifier](self, "immediateBypassCNGroupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSBypassSettingsRecord repeatEventSourceBehaviorEnabledSetting](self, "repeatEventSourceBehaviorEnabledSetting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; immediateBypassEventSourceType: %@; immediateBypassCNGroupIdentifier: '%@'; repeatEventSourceBehaviorEnabledSetting: %@>"),
    v4,
    self,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSBypassSettingsRecord _initWithRecord:]([DNDSMutableBypassSettingsRecord alloc], "_initWithRecord:", self);
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  return a3;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("immediateBypassEventSourceType"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("immediateBypassCNGroupIdentifier"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("repeatEventSourceBehaviorEnabledSetting"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithImmediateBypassEventSourceType:immediateBypassCNGroupIdentifier:repeatEventSourceBehaviorEnabledSetting:", v6, v7, v8);
  return v9;
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

  -[DNDSBypassSettingsRecord immediateBypassEventSourceType](self, "immediateBypassEventSourceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("immediateBypassEventSourceType"));

  -[DNDSBypassSettingsRecord immediateBypassCNGroupIdentifier](self, "immediateBypassCNGroupIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bs_setSafeObject:forKey:", v10, CFSTR("immediateBypassCNGroupIdentifier"));

  -[DNDSBypassSettingsRecord repeatEventSourceBehaviorEnabledSetting](self, "repeatEventSourceBehaviorEnabledSetting");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("repeatEventSourceBehaviorEnabledSetting"));

  return v8;
}

- (NSNumber)immediateBypassEventSourceType
{
  return self->_immediateBypassEventSourceType;
}

- (NSString)immediateBypassCNGroupIdentifier
{
  return self->_immediateBypassCNGroupIdentifier;
}

- (NSNumber)repeatEventSourceBehaviorEnabledSetting
{
  return self->_repeatEventSourceBehaviorEnabledSetting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repeatEventSourceBehaviorEnabledSetting, 0);
  objc_storeStrong((id *)&self->_immediateBypassCNGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_immediateBypassEventSourceType, 0);
}

+ (id)_recordWithEncodedInfo:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a3;
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("privilegedSenderTypes"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "unsignedIntegerValue");
    objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("privilegedAddressBookGroupRecordID"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "recordForLegacyPrivilegedSenderType:legacyAddressBookID:", v8, objc_msgSend(v9, "intValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)recordForLegacyPrivilegedSenderType:(unint64_t)a3 legacyAddressBookID:(int)a4
{
  uint64_t v4;
  char v5;
  DNDSMutableBypassSettingsRecord *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = objc_alloc_init(DNDSMutableBypassSettingsRecord);
  if ((v5 & 0x10) != 0)
  {
    v7 = 0;
    v8 = 1;
  }
  else if ((v5 & 1) != 0)
  {
    v7 = 0;
    v8 = 3;
  }
  else if ((v5 & 4) != 0)
  {
    v7 = 0;
    v8 = 4;
  }
  else if ((v5 & 2) != 0)
  {
    if ((_DWORD)v4 == -1)
    {
      v7 = 0;
      v13 = 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C97318], "predicateForiOSLegacyIdentifier:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc_init(MEMORY[0x1E0C97298]);
      objc_msgSend(v10, "requestAccessForEntityType:completionHandler:", 0, &__block_literal_global_25);
      objc_msgSend(v10, "groupsMatchingPredicate:error:", v9, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = 5;
    }
    if (v7)
      v8 = v13;
    else
      v8 = 0;
  }
  else
  {
    v7 = 0;
    v8 = 2;
  }
  if ((v5 & 8) != 0)
    v14 = 2;
  else
    v14 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableBypassSettingsRecord setImmediateBypassEventSourceType:](v6, "setImmediateBypassEventSourceType:", v15);

  -[DNDSMutableBypassSettingsRecord setImmediateBypassCNGroupIdentifier:](v6, "setImmediateBypassCNGroupIdentifier:", v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableBypassSettingsRecord setRepeatEventSourceBehaviorEnabledSetting:](v6, "setRepeatEventSourceBehaviorEnabledSetting:", v16);

  return v6;
}

- (unint64_t)legacyPrivilegedSenderType
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;

  -[DNDSBypassSettingsRecord immediateBypassEventSourceType](self, "immediateBypassEventSourceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unsignedIntegerValue");
  v4 = DNDResolvedImmediateBypassEventSourceType();

  if ((unint64_t)(v4 - 1) > 4)
    v5 = 0;
  else
    v5 = qword_1CB953C28[v4 - 1];
  -[DNDSBypassSettingsRecord repeatEventSourceBehaviorEnabledSetting](self, "repeatEventSourceBehaviorEnabledSetting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unsignedIntegerValue");
  v7 = DNDResolvedRepeatEventSourceBehaviorEnabledSetting();

  if (v7 == 2)
    return v5 | 8;
  else
    return v5;
}

@end
