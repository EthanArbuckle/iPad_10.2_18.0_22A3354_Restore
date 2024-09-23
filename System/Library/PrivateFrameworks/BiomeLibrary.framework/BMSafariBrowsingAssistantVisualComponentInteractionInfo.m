@implementation BMSafariBrowsingAssistantVisualComponentInteractionInfo

- (BMSafariBrowsingAssistantVisualComponentInteractionInfo)initWithTableOfContentsText:(id)a3 tableOfContentsTextIndex:(id)a4 hideShowButton:(int)a5
{
  id v9;
  id v10;
  BMSafariBrowsingAssistantVisualComponentInteractionInfo *v11;
  uint64_t v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BMSafariBrowsingAssistantVisualComponentInteractionInfo;
  v11 = -[BMEventBase init](&v14, sel_init);
  if (v11)
  {
    v11->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v11->_tableOfContentsText, a3);
    if (v10)
    {
      v11->_hasTableOfContentsTextIndex = 1;
      v12 = objc_msgSend(v10, "unsignedLongLongValue");
    }
    else
    {
      v12 = 0;
      v11->_hasTableOfContentsTextIndex = 0;
    }
    v11->_tableOfContentsTextIndex = v12;
    v11->_hideShowButton = a5;
  }

  return v11;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSafariBrowsingAssistantVisualComponentInteractionInfo tableOfContentsText](self, "tableOfContentsText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMSafariBrowsingAssistantVisualComponentInteractionInfo tableOfContentsTextIndex](self, "tableOfContentsTextIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMSafariBrowsingAssistantHideShowButtonAsString(-[BMSafariBrowsingAssistantVisualComponentInteractionInfo hideShowButton](self, "hideShowButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSafariBrowsingAssistantVisualComponentInteractionInfo with tableOfContentsText: %@, tableOfContentsTextIndex: %@, hideShowButton: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSafariBrowsingAssistantVisualComponentInteractionInfo *v5;
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
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  NSString *tableOfContentsText;
  char v28;
  unsigned int v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  BMSafariBrowsingAssistantVisualComponentInteractionInfo *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMSafariBrowsingAssistantVisualComponentInteractionInfo;
  v5 = -[BMEventBase init](&v36, sel_init);
  if (!v5)
    goto LABEL_52;
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
      if ((v12 >> 3) == 1)
      {
        PBReaderReadString();
        v26 = objc_claimAutoreleasedReturnValue();
        tableOfContentsText = v5->_tableOfContentsText;
        v5->_tableOfContentsText = (NSString *)v26;

      }
      else if ((_DWORD)v19 == 2)
      {
        v28 = 0;
        v29 = 0;
        v30 = 0;
        v5->_hasTableOfContentsTextIndex = 1;
        while (1)
        {
          v31 = *v6;
          v32 = *(_QWORD *)&v4[v31];
          if (v32 == -1 || v32 >= *(_QWORD *)&v4[*v7])
            break;
          v33 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v32);
          *(_QWORD *)&v4[v31] = v32 + 1;
          v30 |= (unint64_t)(v33 & 0x7F) << v28;
          if ((v33 & 0x80) == 0)
            goto LABEL_46;
          v28 += 7;
          v16 = v29++ >= 9;
          if (v16)
          {
            v30 = 0;
            goto LABEL_48;
          }
        }
        v4[*v8] = 1;
LABEL_46:
        if (v4[*v8])
          v30 = 0;
LABEL_48:
        v5->_tableOfContentsTextIndex = v30;
      }
      else if ((_DWORD)v19 == 3)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        while (1)
        {
          v23 = *v6;
          v24 = *(_QWORD *)&v4[v23];
          if (v24 == -1 || v24 >= *(_QWORD *)&v4[*v7])
            break;
          v25 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v24);
          *(_QWORD *)&v4[v23] = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0)
            goto LABEL_40;
          v20 += 7;
          v16 = v21++ >= 9;
          if (v16)
          {
            LODWORD(v22) = 0;
            goto LABEL_42;
          }
        }
        v4[*v8] = 1;
LABEL_40:
        if (v4[*v8])
          LODWORD(v22) = 0;
LABEL_42:
        if (v22 >= 3)
          LODWORD(v22) = 0;
        v5->_hideShowButton = v22;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_51;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_51:
    v34 = 0;
  else
LABEL_52:
    v34 = v5;

  return v34;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_tableOfContentsText)
    PBDataWriterWriteStringField();
  if (self->_hasTableOfContentsTextIndex)
    PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSafariBrowsingAssistantVisualComponentInteractionInfo writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSafariBrowsingAssistantVisualComponentInteractionInfo)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  BMSafariBrowsingAssistantVisualComponentInteractionInfo *v16;
  uint64_t v17;
  id v18;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tableOfContentsText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tableOfContentsTextIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v10 = 0;
          v16 = 0;
          goto LABEL_25;
        }
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v17 = *MEMORY[0x1E0D025B8];
        v27 = *MEMORY[0x1E0CB2D50];
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("tableOfContentsTextIndex"));
        v28 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v17, 2, v11);
        v10 = 0;
        v16 = 0;
        *a4 = v18;
        goto LABEL_24;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hideShowButton"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v11;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v22 = *MEMORY[0x1E0D025B8];
            v25 = *MEMORY[0x1E0CB2D50];
            v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("hideShowButton"));
            v26 = v20;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *a4 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v22, 2, v21);

          }
          v12 = 0;
          v16 = 0;
          goto LABEL_24;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSafariBrowsingAssistantHideShowButtonFromString(v11));
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v13;
    }
    else
    {
      v12 = 0;
    }
    self = -[BMSafariBrowsingAssistantVisualComponentInteractionInfo initWithTableOfContentsText:tableOfContentsTextIndex:hideShowButton:](self, "initWithTableOfContentsText:tableOfContentsTextIndex:hideShowButton:", v8, v10, objc_msgSend(v12, "intValue"));
    v16 = self;
LABEL_24:

    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v8 = 0;
    v16 = 0;
    goto LABEL_26;
  }
  v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v15 = *MEMORY[0x1E0D025B8];
  v29 = *MEMORY[0x1E0CB2D50];
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("tableOfContentsText"));
  v30[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v16 = 0;
  *a4 = (id)objc_msgSend(v14, "initWithDomain:code:userInfo:", v15, 2, v9);
LABEL_25:

LABEL_26:
  return v16;
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
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  -[BMSafariBrowsingAssistantVisualComponentInteractionInfo tableOfContentsText](self, "tableOfContentsText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSafariBrowsingAssistantVisualComponentInteractionInfo hasTableOfContentsTextIndex](self, "hasTableOfContentsTextIndex"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMSafariBrowsingAssistantVisualComponentInteractionInfo tableOfContentsTextIndex](self, "tableOfContentsTextIndex"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSafariBrowsingAssistantVisualComponentInteractionInfo hideShowButton](self, "hideShowButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("tableOfContentsText");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v6;
  v11[1] = CFSTR("tableOfContentsTextIndex");
  v7 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v7;
  v11[2] = CFSTR("hideShowButton");
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v4)
      goto LABEL_12;
LABEL_15:

    if (v3)
      goto LABEL_13;
LABEL_16:

    goto LABEL_13;
  }

  if (!v4)
    goto LABEL_15;
LABEL_12:
  if (!v3)
    goto LABEL_16;
LABEL_13:

  return v9;
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
  unint64_t v13;
  int v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSafariBrowsingAssistantVisualComponentInteractionInfo tableOfContentsText](self, "tableOfContentsText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tableOfContentsText");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSafariBrowsingAssistantVisualComponentInteractionInfo tableOfContentsText](self, "tableOfContentsText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tableOfContentsText");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_13;
    }
    if (!-[BMSafariBrowsingAssistantVisualComponentInteractionInfo hasTableOfContentsTextIndex](self, "hasTableOfContentsTextIndex")&& !objc_msgSend(v5, "hasTableOfContentsTextIndex")|| -[BMSafariBrowsingAssistantVisualComponentInteractionInfo hasTableOfContentsTextIndex](self, "hasTableOfContentsTextIndex")&& objc_msgSend(v5, "hasTableOfContentsTextIndex")&& (v13 = -[BMSafariBrowsingAssistantVisualComponentInteractionInfo tableOfContentsTextIndex](self, "tableOfContentsTextIndex"), v13 == objc_msgSend(v5, "tableOfContentsTextIndex")))
    {
      v14 = -[BMSafariBrowsingAssistantVisualComponentInteractionInfo hideShowButton](self, "hideShowButton");
      v12 = v14 == objc_msgSend(v5, "hideShowButton");
LABEL_14:

      goto LABEL_15;
    }
LABEL_13:
    v12 = 0;
    goto LABEL_14;
  }
  v12 = 0;
LABEL_15:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)tableOfContentsText
{
  return self->_tableOfContentsText;
}

- (unint64_t)tableOfContentsTextIndex
{
  return self->_tableOfContentsTextIndex;
}

- (BOOL)hasTableOfContentsTextIndex
{
  return self->_hasTableOfContentsTextIndex;
}

- (void)setHasTableOfContentsTextIndex:(BOOL)a3
{
  self->_hasTableOfContentsTextIndex = a3;
}

- (int)hideShowButton
{
  return self->_hideShowButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableOfContentsText, 0);
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

    v4 = -[BMSafariBrowsingAssistantVisualComponentInteractionInfo initByReadFrom:]([BMSafariBrowsingAssistantVisualComponentInteractionInfo alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("tableOfContentsText"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("tableOfContentsTextIndex"), 0, 0, 2, 5, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hideShowButton"), 0, 0, 3, 4, 0);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D320;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tableOfContentsText"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tableOfContentsTextIndex"), 2, 5, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hideShowButton"), 3, 4, 0);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
