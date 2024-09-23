@implementation CCPhotosPetRelationshipContent

- (CCPhotosPetRelationshipContent)initWithIsUsersPet:(id)a3 type:(unsigned int)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int IsInstanceOfExpectedClass;
  id v11;
  int v12;
  id v13;
  void *v14;
  CCPhotosPetRelationshipContent *v15;
  id v17;

  v8 = a3;
  v9 = (void *)objc_opt_new();
  if (!v8)
  {
    v11 = 0;
    if (!a4)
      goto LABEL_8;
LABEL_6:
    v17 = v11;
    v12 = CCValidateEnumField();
    v13 = v11;

    if (!v12)
    {
      CCSetError();
      v15 = 0;
      v11 = v13;
      goto LABEL_11;
    }
    CCPBDataWriterWriteUint32Field();
    v11 = v13;
    goto LABEL_8;
  }
  objc_opt_class();
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v11 = 0;
  if (!IsInstanceOfExpectedClass)
  {
    CCSetError();
    v15 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v8, "BOOLValue");
  CCPBDataWriterWriteBOOLField();
  if (a4)
    goto LABEL_6;
LABEL_8:
  objc_msgSend(v9, "immutableData", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[CCItemMessage initWithData:error:](self, "initWithData:error:", v14, a5);

  v15 = self;
LABEL_11:

  return v15;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v6;
  char *v7;
  int *v8;
  int *v9;
  int *v10;
  void *v11;
  int *v12;
  BOOL v13;
  char v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  BOOL v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  objc_class *v33;
  id *v34;
  id v35;
  void *v36;
  objc_class *v37;
  void *v38;
  BOOL v39;
  CCPhotosPetRelationshipContent *v41;

  v6 = a3;
  v7 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v6);
  v8 = (int *)MEMORY[0x24BE15728];
  v9 = (int *)MEMORY[0x24BE15720];
  v10 = (int *)MEMORY[0x24BE15718];
  if (*(_QWORD *)&v7[*MEMORY[0x24BE15728]] >= *(_QWORD *)&v7[*MEMORY[0x24BE15720]])
    goto LABEL_48;
  v11 = 0;
  v12 = (int *)MEMORY[0x24BE15710];
  v41 = self;
  do
  {
    if (*(_QWORD *)&v7[*v10])
      v13 = 0;
    else
      v13 = v11 == 0;
    if (!v13)
      break;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    while (1)
    {
      v17 = *v8;
      v18 = *(_QWORD *)&v7[v17];
      if (v18 == -1 || v18 >= *(_QWORD *)&v7[*v9])
        break;
      v19 = *(_BYTE *)(*(_QWORD *)&v7[*v12] + v18);
      *(_QWORD *)&v7[v17] = v18 + 1;
      v16 |= (unint64_t)(v19 & 0x7F) << v14;
      if ((v19 & 0x80) == 0)
        goto LABEL_17;
      v14 += 7;
      v20 = v15++ >= 9;
      if (v20)
      {
        v16 = 0;
        if (*(_QWORD *)&v7[*v10])
          goto LABEL_49;
        goto LABEL_18;
      }
    }
    *(_QWORD *)&v7[*v10] = 1;
LABEL_17:
    if (*(_QWORD *)&v7[*v10])
      goto LABEL_49;
LABEL_18:
    if ((v16 >> 3) == 1)
    {
      v27 = 0;
      v28 = 0;
      v29 = 0;
      while (1)
      {
        v30 = *v8;
        v31 = *(_QWORD *)&v7[v30];
        if (v31 == -1 || v31 >= *(_QWORD *)&v7[*v9])
          break;
        v32 = *(_BYTE *)(*(_QWORD *)&v7[*v12] + v31);
        *(_QWORD *)&v7[v30] = v31 + 1;
        v29 |= (unint64_t)(v32 & 0x7F) << v27;
        if ((v32 & 0x80) == 0)
          goto LABEL_41;
        v27 += 7;
        v20 = v28++ >= 9;
        if (v20)
        {
          v29 = 0;
          goto LABEL_43;
        }
      }
      *(_QWORD *)&v7[*v10] = 1;
LABEL_41:
      if (*(_QWORD *)&v7[*v10])
        v29 = 0;
LABEL_43:
      v11 = 0;
      self->_isUsersPet = v29 != 0;
      self->_hasIsUsersPet = 1;
    }
    else if ((v16 >> 3) == 2)
    {
      v21 = 0;
      v22 = 0;
      v23 = 0;
      while (1)
      {
        v24 = *v8;
        v25 = *(_QWORD *)&v7[v24];
        if (v25 == -1 || v25 >= *(_QWORD *)&v7[*v9])
          break;
        v26 = *(_BYTE *)(*(_QWORD *)&v7[*v12] + v25);
        *(_QWORD *)&v7[v24] = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0)
          goto LABEL_37;
        v21 += 7;
        v20 = v22++ >= 9;
        if (v20)
        {
          LODWORD(v23) = 0;
          goto LABEL_39;
        }
      }
      *(_QWORD *)&v7[*v10] = 1;
LABEL_37:
      if (*(_QWORD *)&v7[*v10])
        LODWORD(v23) = 0;
LABEL_39:
      v11 = 0;
      self->_type = v23;
    }
    else if ((CCPBReaderSkipValueWithTag() & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = a4;
      v35 = v6;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      CCSkipFieldErrorForMessage();
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v35;
      a4 = v34;
      self = v41;
    }
  }
  while (*(_QWORD *)&v7[*v8] < *(_QWORD *)&v7[*v9]);
  if (v11)
  {
    CCSetError();
  }
  else
  {
LABEL_48:
    if (!*(_QWORD *)&v7[*v10])
    {
      v39 = 1;
      goto LABEL_52;
    }
LABEL_49:
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

  }
  v39 = 0;
LABEL_52:

  return v39;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  if (self->_hasIsUsersPet)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:BOOLValue:", 59689, self->_isUsersPet);
    v7[2](v7, v5);

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:enumValue:", 59690, self->_type);
  v7[2](v7, v6);

}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  if (self->_hasIsUsersPet)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CCPhotosPetRelationshipContent isUsersPet](self, "isUsersPet"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isUsersPet"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[CCPhotosPetRelationshipContent type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("type"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (CCPhotosPetRelationshipContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  CCPhotosPetRelationshipContent *v13;

  v6 = a3;
  objc_opt_class();
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isUsersPet"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v12 = objc_msgSend(v10, "unsignedIntegerValue");
    else
      v12 = 0;
    v13 = -[CCPhotosPetRelationshipContent initWithIsUsersPet:type:error:]([CCPhotosPetRelationshipContent alloc], "initWithIsUsersPet:type:error:", v9, v12, a4);

  }
  else
  {
    CCSetError();
    v13 = 0;
  }

  return v13;
}

- (BOOL)isUsersPet
{
  return self->_isUsersPet;
}

- (unsigned)type
{
  return self->_type;
}

- (BOOL)hasIsUsersPet
{
  return self->_hasIsUsersPet;
}

- (void)setHasIsUsersPet:(BOOL)a3
{
  self->_hasIsUsersPet = a3;
}

+ (unsigned)itemType
{
  return -5848;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((unsigned __int16)(a3 + 5848) > 2u)
    return 0;
  else
    return off_251030690[(unsigned __int16)(a3 + 5848)];
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
