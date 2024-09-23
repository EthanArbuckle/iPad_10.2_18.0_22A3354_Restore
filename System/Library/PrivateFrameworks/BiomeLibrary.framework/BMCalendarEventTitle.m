@implementation BMCalendarEventTitle

- (BMCalendarEventTitle)initWithTitle:(id)a3 interaction:(id)a4
{
  id v7;
  id v8;
  BMCalendarEventTitle *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMCalendarEventTitle;
  v9 = -[BMEventBase init](&v11, sel_init);
  if (v9)
  {
    v9->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v9->_interaction, a4);
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
  -[BMCalendarEventTitle title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMCalendarEventTitle interaction](self, "interaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMCalendarEventTitle with title: %@, interaction: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMCalendarEventTitle *v5;
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
  int v17;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  BMCalendarEventTitle *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BMCalendarEventTitle;
  v5 = -[BMEventBase init](&v24, sel_init);
  if (!v5)
    goto LABEL_28;
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
        if (v11++ >= 9)
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
      if ((v12 >> 3) == 2)
      {
        PBReaderReadData();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 32;
      }
      else
      {
        if ((v12 >> 3) != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_27;
          continue;
        }
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 24;
      }
      v21 = *(Class *)((char *)&v5->super.super.isa + v20);
      *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_27:
    v22 = 0;
  else
LABEL_28:
    v22 = v5;

  return v22;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_interaction)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMCalendarEventTitle writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMCalendarEventTitle)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  BMCalendarEventTitle *v11;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v11 = 0;
        v8 = 0;
        goto LABEL_9;
      }
      v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v14 = *MEMORY[0x1E0D025B8];
      v22 = *MEMORY[0x1E0CB2D50];
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("title"));
      v23[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, 2, v9);
      v11 = 0;
      v8 = 0;
      *a4 = v15;
      goto LABEL_8;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("interaction"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v17 = *MEMORY[0x1E0D025B8];
        v20 = *MEMORY[0x1E0CB2D50];
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), objc_opt_class(), CFSTR("interaction"));
        v21 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, 2, v19);

      }
      v10 = 0;
      v11 = 0;
      goto LABEL_8;
    }
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }
  self = -[BMCalendarEventTitle initWithTitle:interaction:](self, "initWithTitle:interaction:", v8, v10);
  v11 = self;
LABEL_8:

LABEL_9:
  return v11;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[BMCalendarEventTitle title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMCalendarEventTitle interaction](self, "interaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = CFSTR("title");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = CFSTR("interaction");
  v11[0] = v6;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {

    if (v3)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!v3)
    goto LABEL_9;
LABEL_7:

  return v8;
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
    -[BMCalendarEventTitle title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMCalendarEventTitle title](self, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
      {
        v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    -[BMCalendarEventTitle interaction](self, "interaction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interaction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
    {
      v12 = 1;
    }
    else
    {
      -[BMCalendarEventTitle interaction](self, "interaction");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "interaction");
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

- (NSString)title
{
  return self->_title;
}

- (NSData)interaction
{
  return self->_interaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_title, 0);
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

    v4 = -[BMCalendarEventTitle initByReadFrom:]([BMCalendarEventTitle alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("title"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("interaction"), 4, 0, 2, 14, 0);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1F4F8;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("title"), 1, 13, 0);
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("interaction"), 2, 14, 0);
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
