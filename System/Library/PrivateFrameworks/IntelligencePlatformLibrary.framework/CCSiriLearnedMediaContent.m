@implementation CCSiriLearnedMediaContent

- (CCSiriLearnedMediaContent)initWithUserPhrasedSongName:(id)a3 userPhrasedArtistName:(id)a4 userPhrasedAlbumName:(id)a5 userPhrasedEntityName:(id)a6 userPhrasedVersion:(id)a7 suggestedAdamId:(id)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  id v21;
  id v22;
  int v23;
  int v24;
  int IsInstanceOfExpectedClass;
  int v26;
  void *v27;
  int v28;
  id v29;
  void *v30;
  CCSiriLearnedMediaContent *v31;
  CCSiriLearnedMediaContent *v32;
  id *v34;
  id v35;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v35 = a8;
  v19 = (void *)objc_opt_new();
  if (!v14)
  {
    v34 = a9;
    v21 = 0;
    if (!v15)
      goto LABEL_4;
LABEL_11:
    objc_opt_class();
    IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    v22 = v21;

    if (!IsInstanceOfExpectedClass)
    {
LABEL_22:
      CCSetError();
      v32 = 0;
      v21 = v22;
      goto LABEL_24;
    }
    CCPBDataWriterWriteStringField();
    if (v16)
      goto LABEL_5;
LABEL_13:
    v21 = v22;
    if (!v17)
      goto LABEL_7;
    goto LABEL_14;
  }
  objc_opt_class();
  v20 = CCValidateIsInstanceOfExpectedClass();
  v21 = 0;
  if (!v20)
    goto LABEL_23;
  v34 = a9;
  CCPBDataWriterWriteStringField();
  if (v15)
    goto LABEL_11;
LABEL_4:
  v22 = v21;
  if (!v16)
    goto LABEL_13;
LABEL_5:
  objc_opt_class();
  v23 = CCValidateIsInstanceOfExpectedClass();
  v21 = v22;

  if (!v23)
  {
LABEL_23:
    CCSetError();
    v32 = 0;
    goto LABEL_24;
  }
  CCPBDataWriterWriteStringField();
  if (!v17)
  {
LABEL_7:
    v22 = v21;
    if (v18)
      goto LABEL_8;
LABEL_16:
    v21 = v22;
    goto LABEL_17;
  }
LABEL_14:
  objc_opt_class();
  v26 = CCValidateIsInstanceOfExpectedClass();
  v22 = v21;

  if (!v26)
    goto LABEL_22;
  CCPBDataWriterWriteStringField();
  if (!v18)
    goto LABEL_16;
LABEL_8:
  objc_opt_class();
  v24 = CCValidateIsInstanceOfExpectedClass();
  v21 = v22;

  if (!v24)
    goto LABEL_23;
  CCPBDataWriterWriteStringField();
LABEL_17:
  v27 = v35;
  if (v35)
  {
    objc_opt_class();
    v28 = CCValidateIsInstanceOfExpectedClass();
    v29 = v21;

    if (!v28)
    {
      CCSetError();
      v32 = 0;
      v21 = v29;
      goto LABEL_25;
    }
    CCPBDataWriterWriteStringField();
    v21 = v29;
  }
  objc_msgSend(v19, "immutableData");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[CCItemMessage initWithData:error:](self, "initWithData:error:", v30, v34);

  self = v31;
  v32 = v31;
LABEL_24:
  v27 = v35;
LABEL_25:

  return v32;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v5;
  char *v6;
  int *v7;
  int *v8;
  int *v9;
  void *v10;
  int *v11;
  BOOL v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  objc_class *v20;
  uint64_t v21;
  void *v22;
  objc_class *v23;
  objc_class *v24;
  void *v25;
  BOOL v26;

  v5 = a3;
  v6 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v5);
  v7 = (int *)MEMORY[0x24BE15728];
  v8 = (int *)MEMORY[0x24BE15720];
  v9 = (int *)MEMORY[0x24BE15718];
  if (*(_QWORD *)&v6[*MEMORY[0x24BE15728]] < *(_QWORD *)&v6[*MEMORY[0x24BE15720]])
  {
    v10 = 0;
    v11 = (int *)MEMORY[0x24BE15710];
LABEL_3:
    if (*(_QWORD *)&v6[*v9])
      v12 = 0;
    else
      v12 = v10 == 0;
    if (v12)
    {
      v13 = 0;
      v14 = 0;
      v15 = 0;
      while (1)
      {
        v16 = *v7;
        v17 = *(_QWORD *)&v6[v16];
        if (v17 == -1 || v17 >= *(_QWORD *)&v6[*v8])
          break;
        v18 = *(_BYTE *)(*(_QWORD *)&v6[*v11] + v17);
        *(_QWORD *)&v6[v16] = v17 + 1;
        v15 |= (unint64_t)(v18 & 0x7F) << v13;
        if ((v18 & 0x80) == 0)
          goto LABEL_17;
        v13 += 7;
        if (v14++ >= 9)
        {
          v15 = 0;
          if (*(_QWORD *)&v6[*v9])
            goto LABEL_35;
LABEL_18:
          switch((v15 >> 3))
          {
            case 1u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              v21 = 16;
              goto LABEL_27;
            case 2u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              v21 = 24;
              goto LABEL_27;
            case 3u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              v21 = 32;
              goto LABEL_27;
            case 4u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              v21 = 40;
              goto LABEL_27;
            case 5u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              v21 = 48;
              goto LABEL_27;
            case 6u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              v21 = 56;
LABEL_27:
              v22 = *(Class *)((char *)&self->super.super.isa + v21);
              *(Class *)((char *)&self->super.super.isa + v21) = v20;
              goto LABEL_28;
            default:
              if ((CCPBReaderSkipValueWithTag() & 1) != 0)
              {
                v10 = 0;
              }
              else
              {
                v23 = (objc_class *)objc_opt_class();
                NSStringFromClass(v23);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                CCSkipFieldErrorForMessage();
                v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:

              }
              if (*(_QWORD *)&v6[*v7] >= *(_QWORD *)&v6[*v8])
                goto LABEL_32;
              goto LABEL_3;
          }
        }
      }
      *(_QWORD *)&v6[*v9] = 1;
LABEL_17:
      if (!*(_QWORD *)&v6[*v9])
        goto LABEL_18;
LABEL_35:
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      CCInvalidBufferErrorForMessage();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      CCSetError();

      goto LABEL_36;
    }
LABEL_32:
    if (v10)
    {
      CCSetError();
LABEL_36:

      v26 = 0;
      goto LABEL_38;
    }
  }
  if (*(_QWORD *)&v6[*v9])
    goto LABEL_35;
  v26 = 1;
LABEL_38:

  return v26;
}

- (NSString)userPhrasedSongName
{
  return (NSString *)(id)-[NSString copy](self->_userPhrasedSongName, "copy");
}

- (NSString)userPhrasedArtistName
{
  return (NSString *)(id)-[NSString copy](self->_userPhrasedArtistName, "copy");
}

- (NSString)userPhrasedAlbumName
{
  return (NSString *)(id)-[NSString copy](self->_userPhrasedAlbumName, "copy");
}

- (NSString)userPhrasedEntityName
{
  return (NSString *)(id)-[NSString copy](self->_userPhrasedEntityName, "copy");
}

- (NSString)userPhrasedVersion
{
  return (NSString *)(id)-[NSString copy](self->_userPhrasedVersion, "copy");
}

- (NSString)suggestedAdamId
{
  return (NSString *)(id)-[NSString copy](self->_suggestedAdamId, "copy");
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *);

  v11 = (void (**)(id, void *))a3;
  if (self->_userPhrasedSongName)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 62159, self->_userPhrasedSongName);
    v11[2](v11, v5);

  }
  if (self->_userPhrasedArtistName)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 62160, self->_userPhrasedArtistName);
    v11[2](v11, v6);

  }
  if (self->_userPhrasedAlbumName)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 62161, self->_userPhrasedAlbumName);
    v11[2](v11, v7);

  }
  if (self->_userPhrasedEntityName)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 62162, self->_userPhrasedEntityName);
    v11[2](v11, v8);

  }
  if (self->_userPhrasedVersion)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 62163, self->_userPhrasedVersion);
    v11[2](v11, v9);

  }
  if (self->_suggestedAdamId)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 62164, self->_suggestedAdamId);
    v11[2](v11, v10);

  }
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  if (self->_userPhrasedSongName)
  {
    -[CCSiriLearnedMediaContent userPhrasedSongName](self, "userPhrasedSongName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("userPhrasedSongName"));

  }
  if (self->_userPhrasedArtistName)
  {
    -[CCSiriLearnedMediaContent userPhrasedArtistName](self, "userPhrasedArtistName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("userPhrasedArtistName"));

  }
  if (self->_userPhrasedAlbumName)
  {
    -[CCSiriLearnedMediaContent userPhrasedAlbumName](self, "userPhrasedAlbumName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("userPhrasedAlbumName"));

  }
  if (self->_userPhrasedEntityName)
  {
    -[CCSiriLearnedMediaContent userPhrasedEntityName](self, "userPhrasedEntityName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("userPhrasedEntityName"));

  }
  if (self->_userPhrasedVersion)
  {
    -[CCSiriLearnedMediaContent userPhrasedVersion](self, "userPhrasedVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("userPhrasedVersion"));

  }
  if (self->_suggestedAdamId)
  {
    -[CCSiriLearnedMediaContent suggestedAdamId](self, "suggestedAdamId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("suggestedAdamId"));

  }
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (CCSiriLearnedMediaContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CCSiriLearnedMediaContent *v15;

  v6 = a3;
  objc_opt_class();
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userPhrasedSongName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userPhrasedArtistName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userPhrasedAlbumName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userPhrasedEntityName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userPhrasedVersion"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestedAdamId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CCSiriLearnedMediaContent initWithUserPhrasedSongName:userPhrasedArtistName:userPhrasedAlbumName:userPhrasedEntityName:userPhrasedVersion:suggestedAdamId:error:]([CCSiriLearnedMediaContent alloc], "initWithUserPhrasedSongName:userPhrasedArtistName:userPhrasedAlbumName:userPhrasedEntityName:userPhrasedVersion:suggestedAdamId:error:", v9, v10, v11, v12, v13, v14, a4);

  }
  else
  {
    CCSetError();
    v15 = 0;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedAdamId, 0);
  objc_storeStrong((id *)&self->_userPhrasedVersion, 0);
  objc_storeStrong((id *)&self->_userPhrasedEntityName, 0);
  objc_storeStrong((id *)&self->_userPhrasedAlbumName, 0);
  objc_storeStrong((id *)&self->_userPhrasedArtistName, 0);
  objc_storeStrong((id *)&self->_userPhrasedSongName, 0);
}

+ (unsigned)itemType
{
  return -3378;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((unsigned __int16)(a3 + 3378) > 6u)
    return 0;
  else
    return off_251030930[(unsigned __int16)(a3 + 3378)];
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
