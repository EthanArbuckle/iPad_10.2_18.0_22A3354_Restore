@implementation BMSafariBrowsingAssistantVisualComponent

- (BMSafariBrowsingAssistantVisualComponent)initWithVisualComponentAttribute:(id)a3 visualComponentData:(id)a4 identifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMSafariBrowsingAssistantVisualComponent *v12;
  uint64_t v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BMSafariBrowsingAssistantVisualComponent;
  v12 = -[BMEventBase init](&v15, sel_init);
  if (v12)
  {
    v12->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v12->_visualComponentAttribute, a3);
    objc_storeStrong((id *)&v12->_visualComponentData, a4);
    if (v11)
    {
      v12->_hasIdentifier = 1;
      v13 = objc_msgSend(v11, "unsignedLongLongValue");
    }
    else
    {
      v13 = 0;
      v12->_hasIdentifier = 0;
    }
    v12->_identifier = v13;
  }

  return v12;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSafariBrowsingAssistantVisualComponent visualComponentAttribute](self, "visualComponentAttribute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantVisualComponent visualComponentData](self, "visualComponentData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMSafariBrowsingAssistantVisualComponent identifier](self, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSafariBrowsingAssistantVisualComponent with visualComponentAttribute: %@, visualComponentData: %@, identifier: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSafariBrowsingAssistantVisualComponent *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  int v17;
  unint64_t v19;
  objc_class *v20;
  uint64_t v21;
  char v22;
  unsigned int v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  void *v28;
  BMSafariBrowsingAssistantVisualComponent *v29;
  objc_super v31;
  uint64_t v32;
  uint64_t v33;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMSafariBrowsingAssistantVisualComponent;
  v5 = -[BMEventBase init](&v31, sel_init);
  if (!v5)
    goto LABEL_45;
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v9 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v8])
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *v6;
        v14 = *(_QWORD *)&v4[v13];
        if (v14 == -1 || v14 >= *(_QWORD *)&v4[*v7])
          break;
        v15 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        v16 = v11++ >= 9;
        if (v16)
        {
          v12 = 0;
          v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v17 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v17 || (v12 & 7) == 4)
        break;
      v19 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        v22 = 0;
        v23 = 0;
        v24 = 0;
        v5->_hasIdentifier = 1;
        while (1)
        {
          v25 = *v6;
          v26 = *(_QWORD *)&v4[v25];
          if (v26 == -1 || v26 >= *(_QWORD *)&v4[*v7])
            break;
          v27 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v26);
          *(_QWORD *)&v4[v25] = v26 + 1;
          v24 |= (unint64_t)(v27 & 0x7F) << v22;
          if ((v27 & 0x80) == 0)
            goto LABEL_39;
          v22 += 7;
          v16 = v23++ >= 9;
          if (v16)
          {
            v24 = 0;
            goto LABEL_41;
          }
        }
        v4[*v8] = 1;
LABEL_39:
        if (v4[*v8])
          v24 = 0;
LABEL_41:
        v5->_identifier = v24;
      }
      else
      {
        if ((_DWORD)v19 == 2)
        {
          v32 = 0;
          v33 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_44;
          v20 = -[BMSafariBrowsingAssistantVisualComponentData initByReadFrom:]([BMSafariBrowsingAssistantVisualComponentData alloc], "initByReadFrom:", v4);
          if (!v20)
            goto LABEL_44;
          v21 = 32;
        }
        else
        {
          if ((_DWORD)v19 != 1)
          {
            if (!PBReaderSkipValueWithTag())
              goto LABEL_44;
            continue;
          }
          v32 = 0;
          v33 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_44;
          v20 = -[BMSafariBrowsingAssistantVisualComponentAttribute initByReadFrom:]([BMSafariBrowsingAssistantVisualComponentAttribute alloc], "initByReadFrom:", v4);
          if (!v20)
            goto LABEL_44;
          v21 = 24;
        }
        v28 = *(Class *)((char *)&v5->super.super.isa + v21);
        *(Class *)((char *)&v5->super.super.isa + v21) = v20;

        PBReaderRecallMark();
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_44:
    v29 = 0;
  else
LABEL_45:
    v29 = v5;

  return v29;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_visualComponentAttribute)
  {
    PBDataWriterPlaceMark();
    -[BMSafariBrowsingAssistantVisualComponentAttribute writeTo:](self->_visualComponentAttribute, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_visualComponentData)
  {
    PBDataWriterPlaceMark();
    -[BMSafariBrowsingAssistantVisualComponentData writeTo:](self->_visualComponentData, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_hasIdentifier)
    PBDataWriterWriteUint64Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSafariBrowsingAssistantVisualComponent writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSafariBrowsingAssistantVisualComponent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BMSafariBrowsingAssistantVisualComponentAttribute *v8;
  id v9;
  BMSafariBrowsingAssistantVisualComponentData *v10;
  void *v11;
  id v12;
  BMSafariBrowsingAssistantVisualComponent *v13;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  BMSafariBrowsingAssistantVisualComponentData *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("visualComponentAttribute"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    v29 = 0;
    v8 = -[BMSafariBrowsingAssistantVisualComponentAttribute initWithJSONDictionary:error:]([BMSafariBrowsingAssistantVisualComponentAttribute alloc], "initWithJSONDictionary:error:", v9, &v29);
    v15 = v29;
    if (v15)
    {
      v16 = v15;
      if (a4)
        *a4 = objc_retainAutorelease(v15);

      goto LABEL_31;
    }

LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("visualComponentData"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v9;
      v28 = 0;
      v10 = -[BMSafariBrowsingAssistantVisualComponentData initWithJSONDictionary:error:]([BMSafariBrowsingAssistantVisualComponentData alloc], "initWithJSONDictionary:error:", v12, &v28);
      v17 = v28;
      if (v17)
      {
        v18 = v17;
        if (a4)
          *a4 = objc_retainAutorelease(v17);

        v13 = 0;
        goto LABEL_12;
      }

LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v25 = *MEMORY[0x1E0D025B8];
            v30 = *MEMORY[0x1E0CB2D50];
            v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("identifier"));
            v31 = v23;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *a4 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v25, 2, v24);

          }
          v13 = 0;
          v12 = 0;
          goto LABEL_11;
        }
        v12 = v11;
      }
      else
      {
        v12 = 0;
      }
      self = -[BMSafariBrowsingAssistantVisualComponent initWithVisualComponentAttribute:visualComponentData:identifier:](self, "initWithVisualComponentAttribute:visualComponentData:identifier:", v8, v10, v12);
      v13 = self;
LABEL_11:

LABEL_12:
      goto LABEL_13;
    }
    if (a4)
    {
      v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0D025B8];
      v32 = *MEMORY[0x1E0CB2D50];
      v10 = (BMSafariBrowsingAssistantVisualComponentData *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("visualComponentData"));
      v33 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v22 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v21, 2, v12);
      v13 = 0;
      *a4 = v22;
      goto LABEL_12;
    }
LABEL_31:
    v13 = 0;
    goto LABEL_13;
  }
  if (!a4)
  {
    v13 = 0;
    goto LABEL_14;
  }
  v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v20 = *MEMORY[0x1E0D025B8];
  v34 = *MEMORY[0x1E0CB2D50];
  v8 = (BMSafariBrowsingAssistantVisualComponentAttribute *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("visualComponentAttribute"));
  v35[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  *a4 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 2, v9);
LABEL_13:

LABEL_14:
  return v13;
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
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  -[BMSafariBrowsingAssistantVisualComponent visualComponentAttribute](self, "visualComponentAttribute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSafariBrowsingAssistantVisualComponent visualComponentData](self, "visualComponentData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BMSafariBrowsingAssistantVisualComponent hasIdentifier](self, "hasIdentifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMSafariBrowsingAssistantVisualComponent identifier](self, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v13[0] = CFSTR("visualComponentAttribute");
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v8;
  v13[1] = CFSTR("visualComponentData");
  v9 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v9;
  v13[2] = CFSTR("identifier");
  v10 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
      goto LABEL_12;
LABEL_15:

    if (v4)
      goto LABEL_13;
LABEL_16:

    goto LABEL_13;
  }

  if (!v6)
    goto LABEL_15;
LABEL_12:
  if (!v4)
    goto LABEL_16;
LABEL_13:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  unint64_t v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSafariBrowsingAssistantVisualComponent visualComponentAttribute](self, "visualComponentAttribute");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visualComponentAttribute");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSafariBrowsingAssistantVisualComponent visualComponentAttribute](self, "visualComponentAttribute");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "visualComponentAttribute");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_16;
    }
    -[BMSafariBrowsingAssistantVisualComponent visualComponentData](self, "visualComponentData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visualComponentData");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSafariBrowsingAssistantVisualComponent visualComponentData](self, "visualComponentData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "visualComponentData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_16;
    }
    if (!-[BMSafariBrowsingAssistantVisualComponent hasIdentifier](self, "hasIdentifier")
      && !objc_msgSend(v5, "hasIdentifier"))
    {
      v12 = 1;
      goto LABEL_17;
    }
    if (-[BMSafariBrowsingAssistantVisualComponent hasIdentifier](self, "hasIdentifier")
      && objc_msgSend(v5, "hasIdentifier"))
    {
      v19 = -[BMSafariBrowsingAssistantVisualComponent identifier](self, "identifier");
      v12 = v19 == objc_msgSend(v5, "identifier");
LABEL_17:

      goto LABEL_18;
    }
LABEL_16:
    v12 = 0;
    goto LABEL_17;
  }
  v12 = 0;
LABEL_18:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMSafariBrowsingAssistantVisualComponentAttribute)visualComponentAttribute
{
  return self->_visualComponentAttribute;
}

- (BMSafariBrowsingAssistantVisualComponentData)visualComponentData
{
  return self->_visualComponentData;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (BOOL)hasIdentifier
{
  return self->_hasIdentifier;
}

- (void)setHasIdentifier:(BOOL)a3
{
  self->_hasIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualComponentData, 0);
  objc_storeStrong((id *)&self->_visualComponentAttribute, 0);
}

+ (unsigned)latestDataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  _DWORD *v4;
  objc_class *v5;
  id v6;
  void *v7;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    v5 = (objc_class *)MEMORY[0x1E0D82B90];
    v6 = a3;
    v7 = (void *)objc_msgSend([v5 alloc], "initWithData:", v6);

    v4 = -[BMSafariBrowsingAssistantVisualComponent initByReadFrom:]([BMSafariBrowsingAssistantVisualComponent alloc], "initByReadFrom:", v7);
    v4[5] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("visualComponentAttribute_json"), 5, 1, &__block_literal_global_377);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("visualComponentData_json"), 5, 1, &__block_literal_global_378);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 0, 0, 3, 5, 0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D2C0;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("visualComponentAttribute"), 1, 14, objc_opt_class());
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("visualComponentData"), 2, 14, objc_opt_class(), v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 3, 5, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __51__BMSafariBrowsingAssistantVisualComponent_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visualComponentData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __51__BMSafariBrowsingAssistantVisualComponent_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visualComponentAttribute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
