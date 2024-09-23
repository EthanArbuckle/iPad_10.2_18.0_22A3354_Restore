@implementation BMPlaceInferenceMapItem

- (BMPlaceInferenceMapItem)initWithIdentifier:(id)a3 name:(id)a4 address:(id)a5 category:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BMPlaceInferenceMapItem *v14;
  uint64_t v15;
  NSString *raw_identifier;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BMPlaceInferenceMapItem;
  v14 = -[BMEventBase init](&v18, sel_init);
  if (v14)
  {
    v14->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v10)
    {
      objc_msgSend(v10, "UUIDString");
      v15 = objc_claimAutoreleasedReturnValue();
      raw_identifier = v14->_raw_identifier;
      v14->_raw_identifier = (NSString *)v15;
    }
    else
    {
      raw_identifier = v14->_raw_identifier;
      v14->_raw_identifier = 0;
    }

    objc_storeStrong((id *)&v14->_name, a4);
    objc_storeStrong((id *)&v14->_address, a5);
    objc_storeStrong((id *)&v14->_category, a6);
  }

  return v14;
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
  -[BMPlaceInferenceMapItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPlaceInferenceMapItem name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPlaceInferenceMapItem address](self, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPlaceInferenceMapItem category](self, "category");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMPlaceInferenceMapItem with identifier: %@, name: %@, address: %@, category: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMPlaceInferenceMapItem *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  int v18;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  BMPlaceInferenceMapItem *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BMPlaceInferenceMapItem;
  v5 = -[BMEventBase init](&v25, sel_init);
  if (!v5)
    goto LABEL_30;
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
        v15 = v14 + 1;
        if (v14 == -1 || v15 > *(_QWORD *)&v4[*v7])
          break;
        v16 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        if (v11++ >= 9)
        {
          v12 = 0;
          v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v18 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v18 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 16;
          goto LABEL_26;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 32;
          goto LABEL_26;
        case 3u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 40;
          goto LABEL_26;
        case 4u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 48;
LABEL_26:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_29;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_29:
    v23 = 0;
  else
LABEL_30:
    v23 = v5;

  return v23;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_raw_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_address)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_category)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMPlaceInferenceMapItem writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMPlaceInferenceMapItem)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  BMPlaceInferenceMapItem *v14;
  BMPlaceInferenceMapItem *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  id *v20;
  id v21;
  uint64_t v22;
  id v23;
  id *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v30;
  uint64_t v31;
  id *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id *v36;
  void *v37;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v6;
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          v14 = self;
          goto LABEL_35;
        }
        v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v22 = *MEMORY[0x1E0D025B8];
        v43 = *MEMORY[0x1E0CB2D50];
        v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("name"));
        v44 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
        *a4 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2, v9);
        a4 = 0;
        v14 = self;
LABEL_34:

        v6 = v37;
LABEL_35:

        goto LABEL_36;
      }
      v36 = v8;
    }
    else
    {
      v36 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("address"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v11 = 0;
          v15 = 0;
          v14 = self;
          a4 = v36;
          goto LABEL_34;
        }
        v10 = v7;
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v24 = a4;
        v25 = *MEMORY[0x1E0D025B8];
        v41 = *MEMORY[0x1E0CB2D50];
        v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("address"));
        v42 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v25, 2, v12);
        v15 = 0;
        v11 = 0;
        *v24 = v26;
        v14 = self;
        goto LABEL_32;
      }
      v10 = v7;
      v11 = v9;
    }
    else
    {
      v10 = v7;
      v11 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("category"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v13 = 0;
      v14 = self;
LABEL_13:
      a4 = v36;
      v14 = -[BMPlaceInferenceMapItem initWithIdentifier:name:address:category:](v14, "initWithIdentifier:name:address:category:", v10, v36, v11, v13);
      v15 = v14;
LABEL_33:

      v7 = v10;
      goto LABEL_34;
    }
    objc_opt_class();
    v14 = self;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v12;
      goto LABEL_13;
    }
    if (a4)
    {
      v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v34 = *MEMORY[0x1E0D025B8];
      v39 = *MEMORY[0x1E0CB2D50];
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("category"));
      v40 = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v34, 2, v28);

    }
    v13 = 0;
    v15 = 0;
LABEL_32:
    a4 = v36;
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4)
    {
      v15 = 0;
      v14 = self;
      goto LABEL_38;
    }
    v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v19 = *MEMORY[0x1E0D025B8];
    v45 = *MEMORY[0x1E0CB2D50];
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
    v46 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v20 = (id *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    *a4 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 2, v20);
    a4 = v20;
    v14 = self;
    goto LABEL_36;
  }
  v7 = v6;
  v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
  if (v16)
  {
    v17 = (void *)v16;

    v7 = v17;
    goto LABEL_4;
  }
  v14 = self;
  if (!a4)
  {
    v15 = 0;
    goto LABEL_37;
  }
  v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v31 = *MEMORY[0x1E0D025B8];
  v47 = *MEMORY[0x1E0CB2D50];
  v32 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("identifier"));
  v48[0] = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, 2, v33);
  a4 = v32;

  v15 = 0;
LABEL_36:

LABEL_37:
LABEL_38:

  return v15;
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
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  -[BMPlaceInferenceMapItem identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMPlaceInferenceMapItem name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPlaceInferenceMapItem address](self, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPlaceInferenceMapItem category](self, "category");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("identifier");
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[0] = v8;
  v14[1] = CFSTR("name");
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v9;
  v14[2] = CFSTR("address");
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[2] = v10;
  v14[3] = CFSTR("category");
  v11 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
      goto LABEL_11;
  }
  else
  {

    if (v6)
    {
LABEL_11:
      if (v5)
        goto LABEL_12;
LABEL_16:

      if (v4)
        goto LABEL_13;
LABEL_17:

      goto LABEL_13;
    }
  }

  if (!v5)
    goto LABEL_16;
LABEL_12:
  if (!v4)
    goto LABEL_17;
LABEL_13:

  return v12;
}

- (NSUUID)identifier
{
  NSString *raw_identifier;
  void *v3;

  raw_identifier = self->_raw_identifier;
  if (raw_identifier)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_identifier, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSUUID *)v3;
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
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMPlaceInferenceMapItem identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMPlaceInferenceMapItem identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_13;
    }
    -[BMPlaceInferenceMapItem name](self, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMPlaceInferenceMapItem name](self, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_13;
    }
    -[BMPlaceInferenceMapItem address](self, "address");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "address");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMPlaceInferenceMapItem address](self, "address");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "address");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
      {
LABEL_13:
        v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    -[BMPlaceInferenceMapItem category](self, "category");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "category");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 == v26)
    {
      v12 = 1;
    }
    else
    {
      -[BMPlaceInferenceMapItem category](self, "category");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "category");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v27, "isEqual:", v28);

    }
    goto LABEL_19;
  }
  v12 = 0;
LABEL_20:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)address
{
  return self->_address;
}

- (NSString)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_raw_identifier, 0);
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

    v4 = -[BMPlaceInferenceMapItem initByReadFrom:]([BMPlaceInferenceMapItem alloc], "initByReadFrom:", v7);
    v4[6] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 6, 0, 1, 13, 3);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("name"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("address"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("category"), 2, 0, 4, 13, 0);
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
  return &unk_1E5F1E6B8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 1, 13, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("name"), 2, 13, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("address"), 3, 13, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("category"), 4, 13, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
