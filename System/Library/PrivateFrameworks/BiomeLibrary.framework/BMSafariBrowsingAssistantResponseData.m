@implementation BMSafariBrowsingAssistantResponseData

- (BMSafariBrowsingAssistantResponseData)initWithSummaryText:(id)a3 tableOfContentsTexts:(id)a4
{
  id v7;
  id v8;
  BMSafariBrowsingAssistantResponseData *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMSafariBrowsingAssistantResponseData;
  v9 = -[BMEventBase init](&v11, sel_init);
  if (v9)
  {
    v9->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v9->_summaryText, a3);
    objc_storeStrong((id *)&v9->_tableOfContentsTexts, a4);
  }

  return v9;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSafariBrowsingAssistantResponseData summaryText](self, "summaryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantResponseData tableOfContentsTexts](self, "tableOfContentsTexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSafariBrowsingAssistantResponseData with summaryText: %@, tableOfContentsTexts: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSafariBrowsingAssistantResponseData *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  int v18;
  uint64_t v20;
  void *summaryText;
  uint64_t v22;
  uint64_t v23;
  NSArray *tableOfContentsTexts;
  int v25;
  BMSafariBrowsingAssistantResponseData *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BMSafariBrowsingAssistantResponseData;
  v5 = -[BMEventBase init](&v28, sel_init);
  if (!v5)
    goto LABEL_29;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (v4[*v9])
        goto LABEL_27;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = *v7;
        v15 = *(_QWORD *)&v4[v14];
        if (v15 == -1 || v15 >= *(_QWORD *)&v4[*v8])
          break;
        v16 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v15);
        *(_QWORD *)&v4[v14] = v15 + 1;
        v13 |= (unint64_t)(v16 & 0x7F) << v11;
        if ((v16 & 0x80) == 0)
          goto LABEL_13;
        v11 += 7;
        if (v12++ >= 9)
        {
          v13 = 0;
          v18 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v18 = v4[*v9];
      if (v4[*v9])
        v13 = 0;
LABEL_15:
      if (v18 || (v13 & 7) == 4)
        goto LABEL_27;
      if ((v13 >> 3) == 2)
        break;
      if ((v13 >> 3) == 1)
      {
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        summaryText = v5->_summaryText;
        v5->_summaryText = (NSString *)v20;
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
LABEL_31:

        goto LABEL_28;
      }
LABEL_26:
      if (*(_QWORD *)&v4[*v7] >= *(_QWORD *)&v4[*v8])
        goto LABEL_27;
    }
    PBReaderReadString();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
      goto LABEL_31;
    summaryText = (void *)v22;
    objc_msgSend(v6, "addObject:", v22);
    goto LABEL_24;
  }
LABEL_27:
  v23 = objc_msgSend(v6, "copy");
  tableOfContentsTexts = v5->_tableOfContentsTexts;
  v5->_tableOfContentsTexts = (NSArray *)v23;

  v25 = v4[*v9];
  if (v25)
LABEL_28:
    v26 = 0;
  else
LABEL_29:
    v26 = v5;

  return v26;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_summaryText)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_tableOfContentsTexts;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSafariBrowsingAssistantResponseData writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSafariBrowsingAssistantResponseData)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BMSafariBrowsingAssistantResponseData *v20;
  id *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  id *v33;
  BMSafariBrowsingAssistantResponseData *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  BMSafariBrowsingAssistantResponseData *v38;
  id *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("summaryText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v6;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v30 = *MEMORY[0x1E0D025B8];
        v52 = *MEMORY[0x1E0CB2D50];
        v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("summaryText"));
        v53[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v30, 2, v14);
        v8 = 0;
        v20 = 0;
        *a4 = v31;
        goto LABEL_27;
      }
      v8 = 0;
      v20 = 0;
      goto LABEL_29;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tableOfContentsTexts"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
  {
    v12 = v7;
    v13 = v8;
    v39 = a4;

    v9 = 0;
LABEL_9:
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v9 = v9;
    v15 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (!v15)
      goto LABEL_18;
    v16 = v15;
    v17 = *(_QWORD *)v42;
    v38 = self;
LABEL_11:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v17)
        objc_enumerationMutation(v9);
      v19 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v18);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v21 = v39;
        v8 = v13;
        v7 = v12;
        if (v39)
        {
          v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v23 = *MEMORY[0x1E0D025B8];
          v45 = *MEMORY[0x1E0CB2D50];
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("tableOfContentsTexts"));
          v46 = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v27;
LABEL_25:
          *v21 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v23, 2, v25);

        }
        goto LABEL_26;
      }
      objc_msgSend(v14, "addObject:", v19);
      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        self = v38;
        if (v16)
          goto LABEL_11;
LABEL_18:

        v8 = v13;
        self = -[BMSafariBrowsingAssistantResponseData initWithSummaryText:tableOfContentsTexts:](self, "initWithSummaryText:tableOfContentsTexts:", v13, v14);
        v20 = self;
        v7 = v12;
LABEL_27:

        goto LABEL_28;
      }
    }
    v21 = v39;
    v8 = v13;
    v7 = v12;
    if (v39)
    {
      v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v23 = *MEMORY[0x1E0D025B8];
      v47 = *MEMORY[0x1E0CB2D50];
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("tableOfContentsTexts"));
      v48 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v22;
      goto LABEL_25;
    }
LABEL_26:

    v20 = 0;
    self = v38;
    goto LABEL_27;
  }
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v12 = v7;
    v13 = v8;
    v39 = a4;
    goto LABEL_9;
  }
  if (a4)
  {
    v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v33 = a4;
    v34 = self;
    v35 = *MEMORY[0x1E0D025B8];
    v50 = *MEMORY[0x1E0CB2D50];
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("tableOfContentsTexts"));
    v51 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v35;
    self = v34;
    *v33 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v37, 2, v36);

    v20 = 0;
    goto LABEL_27;
  }
  v20 = 0;
LABEL_28:

  v6 = v40;
LABEL_29:

  return v20;
}

- (id)_tableOfContentsTextsJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[BMSafariBrowsingAssistantResponseData tableOfContentsTexts](self, "tableOfContentsTexts", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[BMSafariBrowsingAssistantResponseData summaryText](self, "summaryText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantResponseData _tableOfContentsTextsJSONArray](self, "_tableOfContentsTextsJSONArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("summaryText");
  v5 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("tableOfContentsTexts");
  v10[0] = v5;
  v6 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

    if (v3)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v3)
    goto LABEL_9;
LABEL_7:

  return v7;
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
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSafariBrowsingAssistantResponseData summaryText](self, "summaryText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "summaryText");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSafariBrowsingAssistantResponseData summaryText](self, "summaryText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "summaryText");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
      {
        v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    -[BMSafariBrowsingAssistantResponseData tableOfContentsTexts](self, "tableOfContentsTexts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tableOfContentsTexts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
    {
      v12 = 1;
    }
    else
    {
      -[BMSafariBrowsingAssistantResponseData tableOfContentsTexts](self, "tableOfContentsTexts");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tableOfContentsTexts");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v15, "isEqual:", v16);

    }
    goto LABEL_11;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)summaryText
{
  return self->_summaryText;
}

- (NSArray)tableOfContentsTexts
{
  return self->_tableOfContentsTexts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableOfContentsTexts, 0);
  objc_storeStrong((id *)&self->_summaryText, 0);
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

    v4 = -[BMSafariBrowsingAssistantResponseData initByReadFrom:]([BMSafariBrowsingAssistantResponseData alloc], "initByReadFrom:", v7);
    v4[4] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("summaryText"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("tableOfContentsTexts_json"), 5, 1, &__block_literal_global_618);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D398;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("summaryText"), 1, 13, 0);
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tableOfContentsTexts"), 2, 13, 0);
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __48__BMSafariBrowsingAssistantResponseData_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_tableOfContentsTextsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
