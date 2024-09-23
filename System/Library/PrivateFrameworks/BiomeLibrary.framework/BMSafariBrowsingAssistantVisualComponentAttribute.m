@implementation BMSafariBrowsingAssistantVisualComponentAttribute

- (BMSafariBrowsingAssistantVisualComponentAttribute)initWithComponentType:(int)a3 cardType:(int)a4 entityType:(int)a5 readerViewSectionType:(int)a6
{
  BMSafariBrowsingAssistantVisualComponentAttribute *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BMSafariBrowsingAssistantVisualComponentAttribute;
  v10 = -[BMEventBase init](&v12, sel_init);
  if (v10)
  {
    v10->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v10->_componentType = a3;
    v10->_cardType = a4;
    v10->_entityType = a5;
    v10->_readerViewSectionType = a6;
  }
  return v10;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMSafariBrowsingAssistantComponentTypeAsString(-[BMSafariBrowsingAssistantVisualComponentAttribute componentType](self, "componentType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMSafariBrowsingAssistantCardTypeAsString(-[BMSafariBrowsingAssistantVisualComponentAttribute cardType](self, "cardType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMSafariBrowsingAssistantEntityTypeAsString(-[BMSafariBrowsingAssistantVisualComponentAttribute entityType](self, "entityType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMSafariBrowsingAssistantReaderViewSectionTypeAsString(-[BMSafariBrowsingAssistantVisualComponentAttribute readerViewSectionType](self, "readerViewSectionType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSafariBrowsingAssistantVisualComponentAttribute with componentType: %@, cardType: %@, entityType: %@, readerViewSectionType: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSafariBrowsingAssistantVisualComponentAttribute *v5;
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
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  int *v40;
  BMSafariBrowsingAssistantVisualComponentAttribute *v41;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BMSafariBrowsingAssistantVisualComponentAttribute;
  v5 = -[BMEventBase init](&v43, sel_init);
  if (!v5)
    goto LABEL_78;
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
      switch((v12 >> 3))
      {
        case 1u:
          v19 = 0;
          v20 = 0;
          v21 = 0;
          while (1)
          {
            v22 = *v6;
            v23 = *(_QWORD *)&v4[v22];
            if (v23 == -1 || v23 >= *(_QWORD *)&v4[*v7])
              break;
            v24 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v23);
            *(_QWORD *)&v4[v22] = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0)
              goto LABEL_51;
            v19 += 7;
            v16 = v20++ >= 9;
            if (v16)
            {
              LODWORD(v21) = 0;
              goto LABEL_53;
            }
          }
          v4[*v8] = 1;
LABEL_51:
          if (v4[*v8])
            LODWORD(v21) = 0;
LABEL_53:
          if (v21 >= 4)
            LODWORD(v21) = 0;
          v40 = &OBJC_IVAR___BMSafariBrowsingAssistantVisualComponentAttribute__componentType;
          goto LABEL_74;
        case 2u:
          v25 = 0;
          v26 = 0;
          v21 = 0;
          while (2)
          {
            v27 = *v6;
            v28 = *(_QWORD *)&v4[v27];
            if (v28 == -1 || v28 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v28);
              *(_QWORD *)&v4[v27] = v28 + 1;
              v21 |= (unint64_t)(v29 & 0x7F) << v25;
              if (v29 < 0)
              {
                v25 += 7;
                v16 = v26++ >= 9;
                if (v16)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v21) = 0;
LABEL_59:
          if (v21 >= 3)
            LODWORD(v21) = 0;
          v40 = &OBJC_IVAR___BMSafariBrowsingAssistantVisualComponentAttribute__cardType;
          goto LABEL_74;
        case 3u:
          v30 = 0;
          v31 = 0;
          v21 = 0;
          while (2)
          {
            v32 = *v6;
            v33 = *(_QWORD *)&v4[v32];
            if (v33 == -1 || v33 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v34 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v33);
              *(_QWORD *)&v4[v32] = v33 + 1;
              v21 |= (unint64_t)(v34 & 0x7F) << v30;
              if (v34 < 0)
              {
                v30 += 7;
                v16 = v31++ >= 9;
                if (v16)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v21) = 0;
LABEL_65:
          if (v21 >= 5)
            LODWORD(v21) = 0;
          v40 = &OBJC_IVAR___BMSafariBrowsingAssistantVisualComponentAttribute__entityType;
          goto LABEL_74;
        case 4u:
          v35 = 0;
          v36 = 0;
          v21 = 0;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_77;
          continue;
      }
      while (1)
      {
        v37 = *v6;
        v38 = *(_QWORD *)&v4[v37];
        if (v38 == -1 || v38 >= *(_QWORD *)&v4[*v7])
          break;
        v39 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v38);
        *(_QWORD *)&v4[v37] = v38 + 1;
        v21 |= (unint64_t)(v39 & 0x7F) << v35;
        if ((v39 & 0x80) == 0)
          goto LABEL_69;
        v35 += 7;
        v16 = v36++ >= 9;
        if (v16)
        {
          LODWORD(v21) = 0;
          goto LABEL_71;
        }
      }
      v4[*v8] = 1;
LABEL_69:
      if (v4[*v8])
        LODWORD(v21) = 0;
LABEL_71:
      if (v21 >= 3)
        LODWORD(v21) = 0;
      v40 = &OBJC_IVAR___BMSafariBrowsingAssistantVisualComponentAttribute__readerViewSectionType;
LABEL_74:
      *(_DWORD *)((char *)&v5->super.super.isa + *v40) = v21;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_77:
    v41 = 0;
  else
LABEL_78:
    v41 = v5;

  return v41;
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSafariBrowsingAssistantVisualComponentAttribute writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSafariBrowsingAssistantVisualComponentAttribute)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  BMSafariBrowsingAssistantVisualComponentAttribute *v17;
  id v18;
  BMSafariBrowsingAssistantVisualComponentAttribute *v19;
  id v21;
  uint64_t v22;
  id v23;
  id *v24;
  BMSafariBrowsingAssistantVisualComponentAttribute *v25;
  uint64_t v26;
  uint64_t v27;
  id *v28;
  id v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("componentType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v38 = 0;
LABEL_9:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cardType"));
    v9 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)v9;
    if (v9 && (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v15 = 0;
            v19 = 0;
            goto LABEL_30;
          }
          v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v24 = a4;
          v25 = self;
          v26 = *MEMORY[0x1E0D025B8];
          v43 = *MEMORY[0x1E0CB2D50];
          v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("cardType"));
          v44 = v14;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          self = v25;
          v15 = 0;
          v19 = 0;
          *v24 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v27, 2, v13);
          goto LABEL_29;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSafariBrowsingAssistantCardTypeFromString(v10));
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = v12;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("entityType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v7;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v15 = v11;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v13;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v14 = 0;
            v19 = 0;
            goto LABEL_29;
          }
          v28 = a4;
          v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v30 = *MEMORY[0x1E0D025B8];
          v41 = *MEMORY[0x1E0CB2D50];
          v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("entityType"));
          v42 = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v30, 2, v16);
          v14 = 0;
          v19 = 0;
          *v28 = v31;
          goto LABEL_28;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSafariBrowsingAssistantEntityTypeFromString(v13));
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("readerViewSectionType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = self;
        v18 = v16;
      }
      else
      {
        v15 = v11;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v34 = *MEMORY[0x1E0D025B8];
            v39 = *MEMORY[0x1E0CB2D50];
            v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("readerViewSectionType"));
            v40 = v32;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *a4 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v34, 2, v33);

          }
          v18 = 0;
          v19 = 0;
          goto LABEL_28;
        }
        v17 = self;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSafariBrowsingAssistantReaderViewSectionTypeFromString(v16));
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v17 = self;
      v18 = 0;
    }
    v15 = v11;
    self = -[BMSafariBrowsingAssistantVisualComponentAttribute initWithComponentType:cardType:entityType:readerViewSectionType:](v17, "initWithComponentType:cardType:entityType:readerViewSectionType:", objc_msgSend(v38, "intValue"), objc_msgSend(v11, "intValue"), objc_msgSend(v14, "intValue"), objc_msgSend(v18, "intValue"));
    v19 = self;
LABEL_28:

    v7 = v36;
LABEL_29:

    v10 = v37;
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
LABEL_8:
    v38 = v8;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSafariBrowsingAssistantComponentTypeFromString(v7));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!a4)
  {
    v38 = 0;
    v19 = 0;
    goto LABEL_31;
  }
  v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v22 = *MEMORY[0x1E0D025B8];
  v45 = *MEMORY[0x1E0CB2D50];
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("componentType"));
  v46[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v19 = 0;
  *a4 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2, v10);
LABEL_30:

LABEL_31:
  return v19;
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
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSafariBrowsingAssistantVisualComponentAttribute componentType](self, "componentType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSafariBrowsingAssistantVisualComponentAttribute cardType](self, "cardType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSafariBrowsingAssistantVisualComponentAttribute entityType](self, "entityType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSafariBrowsingAssistantVisualComponentAttribute readerViewSectionType](self, "readerViewSectionType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("componentType");
  v7 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v7;
  v13[1] = CFSTR("cardType");
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v8;
  v13[2] = CFSTR("entityType");
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v9;
  v13[3] = CFSTR("readerViewSectionType");
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v5)
      goto LABEL_11;
  }
  else
  {

    if (v5)
    {
LABEL_11:
      if (v4)
        goto LABEL_12;
LABEL_16:

      if (v3)
        goto LABEL_13;
LABEL_17:

      goto LABEL_13;
    }
  }

  if (!v4)
    goto LABEL_16;
LABEL_12:
  if (!v3)
    goto LABEL_17;
LABEL_13:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMSafariBrowsingAssistantVisualComponentAttribute componentType](self, "componentType");
    if (v6 == objc_msgSend(v5, "componentType")
      && (v7 = -[BMSafariBrowsingAssistantVisualComponentAttribute cardType](self, "cardType"),
          v7 == objc_msgSend(v5, "cardType"))
      && (v8 = -[BMSafariBrowsingAssistantVisualComponentAttribute entityType](self, "entityType"),
          v8 == objc_msgSend(v5, "entityType")))
    {
      v9 = -[BMSafariBrowsingAssistantVisualComponentAttribute readerViewSectionType](self, "readerViewSectionType");
      v10 = v9 == objc_msgSend(v5, "readerViewSectionType");
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)componentType
{
  return self->_componentType;
}

- (int)cardType
{
  return self->_cardType;
}

- (int)entityType
{
  return self->_entityType;
}

- (int)readerViewSectionType
{
  return self->_readerViewSectionType;
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

    v4 = -[BMSafariBrowsingAssistantVisualComponentAttribute initByReadFrom:]([BMSafariBrowsingAssistantVisualComponentAttribute alloc], "initByReadFrom:", v7);
    v4[4] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("componentType"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("cardType"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("entityType"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("readerViewSectionType"), 0, 0, 4, 4, 0);
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D2D8;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("componentType"), 1, 4, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("cardType"), 2, 4, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("entityType"), 3, 4, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("readerViewSectionType"), 4, 4, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
