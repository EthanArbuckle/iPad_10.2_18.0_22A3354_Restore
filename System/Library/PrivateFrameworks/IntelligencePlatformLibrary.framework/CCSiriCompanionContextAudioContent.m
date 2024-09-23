@implementation CCSiriCompanionContextAudioContent

- (CCSiriCompanionContextAudioContent)initWithAppBundleId:(id)a3 mediaCategories:(id)a4 subscriptionStatus:(unsigned int)a5 localizedAppName:(id)a6 nowPlayingCount:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  id v20;
  int IsInstanceOfExpectedClass;
  id v22;
  int v23;
  id v24;
  CCSiriCompanionContextAudioContent *v25;
  int v26;
  int v27;
  void *v28;
  CCSiriCompanionContextAudioContent *v30;
  id v31;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = (void *)objc_opt_new();
  if (!v14)
  {
    v20 = 0;
LABEL_5:
    v30 = self;
    if (v15)
    {
      objc_opt_class();
      IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
      v22 = v20;

      if (!IsInstanceOfExpectedClass)
      {
        CCSetError();
        v25 = 0;
        v20 = v22;
LABEL_23:
        self = v30;
        goto LABEL_24;
      }
      CCPBDataWriterWriteRepeatedUInt32Field();
      if (!a5)
      {
LABEL_8:
        v20 = v22;
        if (v16)
        {
LABEL_9:
          objc_opt_class();
          v23 = CCValidateIsInstanceOfExpectedClass();
          v24 = v20;

          if (!v23)
          {
            CCSetError();
            v25 = 0;
            v20 = v24;
            goto LABEL_23;
          }
          CCPBDataWriterWriteStringField();
          if (!v17)
          {
LABEL_11:
            v20 = v24;
LABEL_19:
            objc_msgSend(v18, "immutableData", v30);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (CCSiriCompanionContextAudioContent *)(id)objc_msgSend(v31, "initWithData:error:", v28, a8);

            self = v25;
            goto LABEL_24;
          }
          goto LABEL_17;
        }
LABEL_16:
        v24 = v20;
        if (!v17)
          goto LABEL_11;
LABEL_17:
        objc_opt_class();
        v27 = CCValidateIsInstanceOfExpectedClass();
        v20 = v24;

        if (v27)
        {
          objc_msgSend(v17, "intValue");
          CCPBDataWriterWriteInt32Field();
          goto LABEL_19;
        }
        goto LABEL_21;
      }
    }
    else
    {
      v22 = v20;
      if (!a5)
        goto LABEL_8;
    }
    v26 = CCValidateEnumField();
    v20 = v22;

    if (!v26)
    {
LABEL_21:
      CCSetError();
      v25 = 0;
      goto LABEL_23;
    }
    CCPBDataWriterWriteUint32Field();
    if (v16)
      goto LABEL_9;
    goto LABEL_16;
  }
  objc_opt_class();
  v19 = CCValidateIsInstanceOfExpectedClass();
  v20 = 0;
  if (v19)
  {
    CCPBDataWriterWriteStringField();
    goto LABEL_5;
  }
  CCSetError();
  v25 = 0;
LABEL_24:

  return v25;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v5;
  char *v6;
  int *v7;
  int *v8;
  void *v9;
  void *v10;
  int *v11;
  int *v12;
  BOOL v13;
  char v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  BOOL v20;
  objc_class *v21;
  uint64_t v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  void *v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  objc_class *v36;
  void *v37;
  id v38;
  void *v39;
  CCSiriCompanionContextAudioContentMediaCategoriesRepeatedEnum *v40;
  CCSiriCompanionContextAudioContentMediaCategoriesRepeatedEnum *mediaCategories;
  objc_class *v42;
  void *v43;
  void *v44;
  BOOL v45;
  CCSiriCompanionContextAudioContent *v47;

  v5 = a3;
  v6 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v5);
  v7 = (int *)MEMORY[0x24BE15728];
  v8 = (int *)MEMORY[0x24BE15720];
  if (*(_QWORD *)&v6[*MEMORY[0x24BE15728]] >= *(_QWORD *)&v6[*MEMORY[0x24BE15720]])
  {
    v9 = 0;
LABEL_54:
    v10 = 0;
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v11 = (int *)MEMORY[0x24BE15718];
    v12 = (int *)MEMORY[0x24BE15710];
    do
    {
      if (*(_QWORD *)&v6[*v11])
        v13 = 0;
      else
        v13 = v10 == 0;
      if (!v13)
        break;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      while (1)
      {
        v17 = *v7;
        v18 = *(_QWORD *)&v6[v17];
        if (v18 == -1 || v18 >= *(_QWORD *)&v6[*v8])
          break;
        v19 = *(_BYTE *)(*(_QWORD *)&v6[*v12] + v18);
        *(_QWORD *)&v6[v17] = v18 + 1;
        v16 |= (unint64_t)(v19 & 0x7F) << v14;
        if ((v19 & 0x80) == 0)
          goto LABEL_17;
        v14 += 7;
        v20 = v15++ >= 9;
        if (v20)
        {
          v16 = 0;
          if (*(_QWORD *)&v6[*v11])
            goto LABEL_54;
          goto LABEL_18;
        }
      }
      *(_QWORD *)&v6[*v11] = 1;
LABEL_17:
      if (*(_QWORD *)&v6[*v11])
        goto LABEL_54;
LABEL_18:
      switch((v16 >> 3))
      {
        case 1u:
          CCPBReaderReadStringNoCopy();
          v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v22 = 32;
          goto LABEL_33;
        case 2u:
          if (!v9)
            v9 = (void *)objc_opt_new();
          CCPBReaderAppendRepeatedEnumFieldValues();
          goto LABEL_34;
        case 3u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          while (2)
          {
            v26 = *v7;
            v27 = *(_QWORD *)&v6[v26];
            if (v27 == -1 || v27 >= *(_QWORD *)&v6[*v8])
            {
              *(_QWORD *)&v6[*v11] = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)&v6[*v12] + v27);
              *(_QWORD *)&v6[v26] = v27 + 1;
              v25 |= (unint64_t)(v28 & 0x7F) << v23;
              if (v28 < 0)
              {
                v23 += 7;
                v20 = v24++ >= 9;
                if (v20)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_45;
                }
                continue;
              }
            }
            break;
          }
          if (*(_QWORD *)&v6[*v11])
            LODWORD(v25) = 0;
LABEL_45:
          v10 = 0;
          self->_subscriptionStatus = v25;
          continue;
        case 4u:
          CCPBReaderReadStringNoCopy();
          v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v22 = 48;
LABEL_33:
          v29 = *(Class *)((char *)&self->super.super.isa + v22);
          *(Class *)((char *)&self->super.super.isa + v22) = v21;

LABEL_34:
          v10 = 0;
          continue;
        case 5u:
          v30 = 0;
          v31 = 0;
          v32 = 0;
          break;
        default:
          if ((CCPBReaderSkipValueWithTag() & 1) != 0)
          {
            v10 = 0;
          }
          else
          {
            v36 = (objc_class *)objc_opt_class();
            NSStringFromClass(v36);
            v47 = self;
            v37 = v9;
            v38 = v5;
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            CCSkipFieldErrorForMessage();
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            v5 = v38;
            v9 = v37;
            self = v47;
          }
          continue;
      }
      while (1)
      {
        v33 = *v7;
        v34 = *(_QWORD *)&v6[v33];
        if (v34 == -1 || v34 >= *(_QWORD *)&v6[*v8])
          break;
        v35 = *(_BYTE *)(*(_QWORD *)&v6[*v12] + v34);
        *(_QWORD *)&v6[v33] = v34 + 1;
        v32 |= (unint64_t)(v35 & 0x7F) << v30;
        if ((v35 & 0x80) == 0)
          goto LABEL_47;
        v30 += 7;
        v20 = v31++ >= 9;
        if (v20)
        {
          LODWORD(v32) = 0;
          goto LABEL_49;
        }
      }
      *(_QWORD *)&v6[*v11] = 1;
LABEL_47:
      if (*(_QWORD *)&v6[*v11])
        LODWORD(v32) = 0;
LABEL_49:
      v10 = 0;
      self->_nowPlayingCount = v32;
      self->_hasNowPlayingCount = 1;
    }
    while (*(_QWORD *)&v6[*v7] < *(_QWORD *)&v6[*v8]);
  }
  v40 = (CCSiriCompanionContextAudioContentMediaCategoriesRepeatedEnum *)objc_msgSend(v9, "copy", v47);
  mediaCategories = self->_mediaCategories;
  self->_mediaCategories = v40;

  if (v10)
  {
    CCSetError();
  }
  else
  {
    if (!*(_QWORD *)&v6[*MEMORY[0x24BE15718]])
    {
      v45 = 1;
      goto LABEL_60;
    }
    v42 = (objc_class *)objc_opt_class();
    NSStringFromClass(v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

  }
  v45 = 0;
LABEL_60:

  return v45;
}

- (NSString)appBundleId
{
  return (NSString *)(id)-[NSString copy](self->_appBundleId, "copy");
}

- (NSString)localizedAppName
{
  return (NSString *)(id)-[NSString copy](self->_localizedAppName, "copy");
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))a3;
  if (self->_appBundleId)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 56511, self->_appBundleId);
    v10[2](v10, v5);

  }
  if (self->_mediaCategories)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedEnumValue:", 56512, self->_mediaCategories);
    v10[2](v10, v6);

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:enumValue:", 56513, self->_subscriptionStatus);
  v10[2](v10, v7);

  if (self->_localizedAppName)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 56514, self->_localizedAppName);
    v10[2](v10, v8);

  }
  if (self->_hasNowPlayingCount)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:int32Value:", 56515, self->_nowPlayingCount);
    v10[2](v10, v9);

  }
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v3 = (void *)objc_opt_new();
  if (self->_appBundleId)
  {
    -[CCSiriCompanionContextAudioContent appBundleId](self, "appBundleId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("appBundleId"));

  }
  if (self->_mediaCategories)
  {
    v5 = (void *)objc_opt_new();
    -[CCSiriCompanionContextAudioContent mediaCategories](self, "mediaCategories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __52__CCSiriCompanionContextAudioContent_jsonDictionary__block_invoke;
    v13[3] = &unk_251030AB8;
    v14 = v5;
    v7 = v5;
    objc_msgSend(v6, "enumerateEnumValuesWithBlock:", v13);

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("mediaCategories"));
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[CCSiriCompanionContextAudioContent subscriptionStatus](self, "subscriptionStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("subscriptionStatus"));

  if (self->_localizedAppName)
  {
    -[CCSiriCompanionContextAudioContent localizedAppName](self, "localizedAppName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("localizedAppName"));

  }
  if (self->_hasNowPlayingCount)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[CCSiriCompanionContextAudioContent nowPlayingCount](self, "nowPlayingCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("nowPlayingCount"));

  }
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

- (CCSiriCompanionContextAudioContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  CCSiriCompanionContextAudioContent *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v30;
  CCSiriCompanionContextAudioContent *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_opt_class();
  v38 = 0;
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appBundleId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mediaCategories"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      v32 = v9;
      objc_opt_class();
      v37 = v8;
      v12 = CCValidateIsInstanceOfExpectedClass();
      v13 = v8;

      if ((v12 & 1) == 0)
      {
        CCSetError();
        v23 = 0;
        v14 = v11;
        v8 = v13;
        v9 = v32;
LABEL_21:

        goto LABEL_22;
      }
      v31 = self;
      v14 = (void *)objc_opt_new();
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v15 = v11;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v34;
        v30 = v6;
        while (2)
        {
          v19 = 0;
          v20 = v13;
          do
          {
            if (*(_QWORD *)v34 != v18)
              objc_enumerationMutation(v15);
            v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v19);
            objc_opt_class();
            v22 = CCValidateIsInstanceOfExpectedClass();
            v13 = v20;

            if (!v22)
            {
              CCSetError();

              v23 = 0;
              v14 = v15;
              v8 = v13;
              self = v31;
              v9 = v32;
              v6 = v30;
              goto LABEL_21;
            }
            objc_msgSend(v14, "appendEnumValue:", objc_msgSend(v21, "unsignedIntValue"));
            ++v19;
            v20 = v13;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
          v6 = v30;
          if (v17)
            continue;
          break;
        }
      }

      v8 = v13;
      self = v31;
      v9 = v32;
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subscriptionStatus"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
      v26 = objc_msgSend(v24, "unsignedIntegerValue");
    else
      v26 = 0;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("localizedAppName"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("nowPlayingCount"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[CCSiriCompanionContextAudioContent initWithAppBundleId:mediaCategories:subscriptionStatus:localizedAppName:nowPlayingCount:error:]([CCSiriCompanionContextAudioContent alloc], "initWithAppBundleId:mediaCategories:subscriptionStatus:localizedAppName:nowPlayingCount:error:", v9, v14, v26, v27, v28, a4);

    goto LABEL_21;
  }
  CCSetError();
  v23 = 0;
LABEL_22:

  return v23;
}

- (CCSiriCompanionContextAudioContentMediaCategoriesRepeatedEnum)mediaCategories
{
  return self->_mediaCategories;
}

- (unsigned)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (int)nowPlayingCount
{
  return self->_nowPlayingCount;
}

- (BOOL)hasNowPlayingCount
{
  return self->_hasNowPlayingCount;
}

- (void)setHasNowPlayingCount:(BOOL)a3
{
  self->_hasNowPlayingCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedAppName, 0);
  objc_storeStrong((id *)&self->_mediaCategories, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

void __52__CCSiriCompanionContextAudioContent_jsonDictionary__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (unsigned)itemType
{
  return -9026;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((unsigned __int16)(a3 + 9026) > 5u)
    return 0;
  else
    return off_251030B50[(unsigned __int16)(a3 + 9026)];
}

+ (Class)metaContentMessageClass
{
  return (Class)objc_opt_class();
}

+ (Class)contentMessageClass
{
  return (Class)objc_opt_class();
}

@end
