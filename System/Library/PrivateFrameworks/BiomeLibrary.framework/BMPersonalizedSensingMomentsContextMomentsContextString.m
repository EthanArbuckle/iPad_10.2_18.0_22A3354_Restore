@implementation BMPersonalizedSensingMomentsContextMomentsContextString

- (BMPersonalizedSensingMomentsContextMomentsContextString)initWithTextString:(id)a3 stringIdentifier:(id)a4 dimensions:(id)a5
{
  return -[BMPersonalizedSensingMomentsContextMomentsContextString initWithTextString:stringIdentifier:dimensions:contentType:](self, "initWithTextString:stringIdentifier:dimensions:contentType:", a3, a4, a5, 0);
}

- (BMPersonalizedSensingMomentsContextMomentsContextString)initWithTextString:(id)a3 stringIdentifier:(id)a4 dimensions:(id)a5 contentType:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BMPersonalizedSensingMomentsContextMomentsContextString *v15;
  uint64_t v16;
  NSString *raw_stringIdentifier;
  unsigned int v18;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BMPersonalizedSensingMomentsContextMomentsContextString;
  v15 = -[BMEventBase init](&v20, sel_init);
  if (v15)
  {
    v15->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v15->_textString, a3);
    if (v12)
    {
      objc_msgSend(v12, "UUIDString");
      v16 = objc_claimAutoreleasedReturnValue();
      raw_stringIdentifier = v15->_raw_stringIdentifier;
      v15->_raw_stringIdentifier = (NSString *)v16;
    }
    else
    {
      raw_stringIdentifier = v15->_raw_stringIdentifier;
      v15->_raw_stringIdentifier = 0;
    }

    objc_storeStrong((id *)&v15->_dimensions, a5);
    if (v14)
    {
      v15->_hasContentType = 1;
      v18 = objc_msgSend(v14, "unsignedIntValue");
    }
    else
    {
      v18 = 0;
      v15->_hasContentType = 0;
    }
    v15->_contentType = v18;
  }

  return v15;
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
  -[BMPersonalizedSensingMomentsContextMomentsContextString textString](self, "textString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPersonalizedSensingMomentsContextMomentsContextString stringIdentifier](self, "stringIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPersonalizedSensingMomentsContextMomentsContextString dimensions](self, "dimensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContextString contentType](self, "contentType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMPersonalizedSensingMomentsContextMomentsContextString with textString: %@, stringIdentifier: %@, dimensions: %@, contentType: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMPersonalizedSensingMomentsContextMomentsContextString *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  BOOL v18;
  int v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  NSArray *dimensions;
  int v35;
  BMPersonalizedSensingMomentsContextMomentsContextString *v36;
  objc_super v38;
  uint64_t v39;
  uint64_t v40;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BMPersonalizedSensingMomentsContextMomentsContextString;
  v5 = -[BMEventBase init](&v38, sel_init);
  if (!v5)
    goto LABEL_42;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v9])
        break;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = *v7;
        v15 = *(_QWORD *)&v4[v14];
        v16 = v15 + 1;
        if (v15 == -1 || v16 > *(_QWORD *)&v4[*v8])
          break;
        v17 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v15);
        *(_QWORD *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0)
          goto LABEL_13;
        v11 += 7;
        v18 = v12++ >= 9;
        if (v18)
        {
          v13 = 0;
          v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v19 = v4[*v9];
      if (v4[*v9])
        v13 = 0;
LABEL_15:
      if (v19 || (v13 & 7) == 4)
        break;
      switch((v13 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 40;
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 16;
LABEL_24:
          v23 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

          continue;
        case 3u:
          v39 = 0;
          v40 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_44;
          v24 = -[BMPersonalizedSensingMomentsContextDimension initByReadFrom:]([BMPersonalizedSensingMomentsContextDimension alloc], "initByReadFrom:", v4);
          if (!v24)
            goto LABEL_44;
          v25 = v24;
          objc_msgSend(v6, "addObject:", v24);
          PBReaderRecallMark();

          continue;
        case 4u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          v5->_hasContentType = 1;
          break;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_44:

          goto LABEL_41;
      }
      while (1)
      {
        v29 = *v7;
        v30 = *(_QWORD *)&v4[v29];
        v31 = v30 + 1;
        if (v30 == -1 || v31 > *(_QWORD *)&v4[*v8])
          break;
        v32 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v30);
        *(_QWORD *)&v4[v29] = v31;
        v28 |= (unint64_t)(v32 & 0x7F) << v26;
        if ((v32 & 0x80) == 0)
          goto LABEL_36;
        v26 += 7;
        v18 = v27++ >= 9;
        if (v18)
        {
          LODWORD(v28) = 0;
          goto LABEL_38;
        }
      }
      v4[*v9] = 1;
LABEL_36:
      if (v4[*v9])
        LODWORD(v28) = 0;
LABEL_38:
      v5->_contentType = v28;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v33 = objc_msgSend(v6, "copy");
  dimensions = v5->_dimensions;
  v5->_dimensions = (NSArray *)v33;

  v35 = v4[*v9];
  if (v35)
LABEL_41:
    v36 = 0;
  else
LABEL_42:
    v36 = v5;

  return v36;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_textString)
    PBDataWriterWriteStringField();
  if (self->_raw_stringIdentifier)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_dimensions;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (self->_hasContentType)
    PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMPersonalizedSensingMomentsContextMomentsContextString writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMPersonalizedSensingMomentsContextMomentsContextString)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  BMPersonalizedSensingMomentsContextDimension *v19;
  BMPersonalizedSensingMomentsContextDimension *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  BMPersonalizedSensingMomentsContextMomentsContextString *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id *v33;
  id v34;
  uint64_t v35;
  void *v36;
  id *v37;
  uint64_t *v38;
  void *v39;
  id v40;
  uint64_t v41;
  id v42;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  BMPersonalizedSensingMomentsContextMomentsContextString *v57;
  void *v58;
  void *v59;
  void *v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  id v72;
  _BYTE v73[128];
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  _QWORD v81[3];

  v81[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("textString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v27 = *MEMORY[0x1E0D025B8];
        v80 = *MEMORY[0x1E0CB2D50];
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("textString"));
        v81[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, &v80, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v27, 2, v9);
        v29 = 0;
        v7 = 0;
        *a4 = v28;
        goto LABEL_53;
      }
      v29 = 0;
      v7 = 0;
      goto LABEL_55;
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stringIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v31 = *MEMORY[0x1E0D025B8];
        v76 = *MEMORY[0x1E0CB2D50];
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("stringIdentifier"));
        v77 = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, 2, v32);

        v29 = 0;
        goto LABEL_53;
      }
      v29 = 0;
      goto LABEL_54;
    }
    v23 = v8;
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v23);
    if (!v24)
    {
      v8 = v23;
      if (a4)
      {
        v44 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v45 = v7;
        v46 = *MEMORY[0x1E0D025B8];
        v78 = *MEMORY[0x1E0CB2D50];
        v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-initWithUUIDString: for %@ returned nil"), CFSTR("stringIdentifier"));
        v79 = v47;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v46;
        v7 = v45;
        *a4 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", v49, 2, v48);

      }
      v29 = 0;
      v9 = v8;
      goto LABEL_53;
    }
    v25 = (void *)v24;
    v59 = v8;

    v9 = v25;
  }
  else
  {
    v59 = v8;
    v9 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dimensions"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if (v12)
  {
    v55 = v9;
    v56 = v7;
    v57 = self;
    v58 = v6;

    v10 = 0;
  }
  else
  {
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v41 = *MEMORY[0x1E0D025B8];
          v74 = *MEMORY[0x1E0CB2D50];
          v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("dimensions"));
          v75 = v61;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          v42 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v41, 2, v22);
          v29 = 0;
          *a4 = v42;
          goto LABEL_51;
        }
        v29 = 0;
        goto LABEL_52;
      }
    }
    v55 = v9;
    v56 = v7;
    v57 = self;
    v58 = v6;
  }
  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v10 = v10;
  v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
  if (!v13)
    goto LABEL_22;
  v14 = v13;
  v15 = *(_QWORD *)v64;
  v54 = v5;
  while (2)
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v64 != v15)
        objc_enumerationMutation(v10);
      v17 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = a4;
        if (a4)
        {
          v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v35 = *MEMORY[0x1E0D025B8];
          v71 = *MEMORY[0x1E0CB2D50];
          v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("dimensions"));
          v72 = v18;
          v36 = (void *)MEMORY[0x1E0C99D80];
          v37 = &v72;
          v38 = &v71;
LABEL_38:
          objc_msgSend(v36, "dictionaryWithObjects:forKeys:count:", v37, v38, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *v33 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", v35, 2, v39);
LABEL_42:

          v29 = 0;
          v22 = v10;
          v5 = v54;
          v9 = v55;
          v7 = v56;
          self = v57;
          goto LABEL_50;
        }
LABEL_45:
        v29 = 0;
        v22 = v10;
        v5 = v54;
        v9 = v55;
        self = v57;
        v6 = v58;
        v7 = v56;
        goto LABEL_51;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v33 = a4;
        if (a4)
        {
          v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v35 = *MEMORY[0x1E0D025B8];
          v69 = *MEMORY[0x1E0CB2D50];
          v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("dimensions"));
          v70 = v18;
          v36 = (void *)MEMORY[0x1E0C99D80];
          v37 = &v70;
          v38 = &v69;
          goto LABEL_38;
        }
        goto LABEL_45;
      }
      v18 = v17;
      v19 = [BMPersonalizedSensingMomentsContextDimension alloc];
      v62 = 0;
      v20 = -[BMPersonalizedSensingMomentsContextDimension initWithJSONDictionary:error:](v19, "initWithJSONDictionary:error:", v18, &v62);
      v21 = v62;
      if (v21)
      {
        v39 = v21;
        if (a4)
          *a4 = objc_retainAutorelease(v21);

        goto LABEL_42;
      }
      objc_msgSend(v61, "addObject:", v20);

    }
    v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    v5 = v54;
    if (v14)
      continue;
    break;
  }
LABEL_22:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("contentType"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    v22 = 0;
    v7 = v56;
    self = v57;
    v9 = v55;
    goto LABEL_49;
  }
  objc_opt_class();
  v7 = v56;
  self = v57;
  v9 = v55;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = 0;
    goto LABEL_49;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v18;
LABEL_49:
    self = -[BMPersonalizedSensingMomentsContextMomentsContextString initWithTextString:stringIdentifier:dimensions:contentType:](self, "initWithTextString:stringIdentifier:dimensions:contentType:", v7, v9, v61, v22);
    v29 = self;
  }
  else
  {
    if (a4)
    {
      v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v50 = *MEMORY[0x1E0D025B8];
      v67 = *MEMORY[0x1E0CB2D50];
      v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("contentType"));
      v68 = v51;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v50, 2, v52);

    }
    v22 = 0;
    v29 = 0;
  }
LABEL_50:

  v6 = v58;
LABEL_51:

LABEL_52:
  v8 = v59;
LABEL_53:

LABEL_54:
LABEL_55:

  return v29;
}

- (id)_dimensionsJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BMPersonalizedSensingMomentsContextMomentsContextString dimensions](self, "dimensions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "jsonDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  -[BMPersonalizedSensingMomentsContextMomentsContextString textString](self, "textString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPersonalizedSensingMomentsContextMomentsContextString stringIdentifier](self, "stringIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMPersonalizedSensingMomentsContextMomentsContextString _dimensionsJSONArray](self, "_dimensionsJSONArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMPersonalizedSensingMomentsContextMomentsContextString hasContentType](self, "hasContentType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextMomentsContextString contentType](self, "contentType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v14[0] = CFSTR("textString");
  v8 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[0] = v8;
  v14[1] = CFSTR("stringIdentifier");
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v9;
  v14[2] = CFSTR("dimensions");
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[2] = v10;
  v14[3] = CFSTR("contentType");
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
      goto LABEL_14;
  }
  else
  {

    if (v6)
    {
LABEL_14:
      if (v5)
        goto LABEL_15;
LABEL_19:

      if (v3)
        goto LABEL_16;
LABEL_20:

      goto LABEL_16;
    }
  }

  if (!v5)
    goto LABEL_19;
LABEL_15:
  if (!v3)
    goto LABEL_20;
LABEL_16:

  return v12;
}

- (NSUUID)stringIdentifier
{
  NSString *raw_stringIdentifier;
  void *v3;

  raw_stringIdentifier = self->_raw_stringIdentifier;
  if (raw_stringIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0D02620], "convertValue:toType:", raw_stringIdentifier, 3);
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
  BOOL v12;
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
  unsigned int v25;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMPersonalizedSensingMomentsContextMomentsContextString textString](self, "textString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textString");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMPersonalizedSensingMomentsContextMomentsContextString textString](self, "textString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "textString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_20;
    }
    -[BMPersonalizedSensingMomentsContextMomentsContextString stringIdentifier](self, "stringIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMPersonalizedSensingMomentsContextMomentsContextString stringIdentifier](self, "stringIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_20;
    }
    -[BMPersonalizedSensingMomentsContextMomentsContextString dimensions](self, "dimensions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dimensions");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMPersonalizedSensingMomentsContextMomentsContextString dimensions](self, "dimensions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dimensions");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_20;
    }
    if (!-[BMPersonalizedSensingMomentsContextMomentsContextString hasContentType](self, "hasContentType")
      && !objc_msgSend(v5, "hasContentType"))
    {
      v12 = 1;
      goto LABEL_21;
    }
    if (-[BMPersonalizedSensingMomentsContextMomentsContextString hasContentType](self, "hasContentType")
      && objc_msgSend(v5, "hasContentType"))
    {
      v25 = -[BMPersonalizedSensingMomentsContextMomentsContextString contentType](self, "contentType");
      v12 = v25 == objc_msgSend(v5, "contentType");
LABEL_21:

      goto LABEL_22;
    }
LABEL_20:
    v12 = 0;
    goto LABEL_21;
  }
  v12 = 0;
LABEL_22:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)textString
{
  return self->_textString;
}

- (NSArray)dimensions
{
  return self->_dimensions;
}

- (unsigned)contentType
{
  return self->_contentType;
}

- (BOOL)hasContentType
{
  return self->_hasContentType;
}

- (void)setHasContentType:(BOOL)a3
{
  self->_hasContentType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimensions, 0);
  objc_storeStrong((id *)&self->_textString, 0);
  objc_storeStrong((id *)&self->_raw_stringIdentifier, 0);
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

    v4 = -[BMPersonalizedSensingMomentsContextMomentsContextString initByReadFrom:]([BMPersonalizedSensingMomentsContextMomentsContextString alloc], "initByReadFrom:", v7);
    v4[7] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("textString"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("stringIdentifier"), 6, 0, 2, 13, 3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("dimensions_json"), 5, 1, &__block_literal_global_323);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contentType"), 0, 0, 4, 4, 0);
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
  return &unk_1E5F1F468;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("textString"), 1, 13, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("stringIdentifier"), 2, 13, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("dimensions"), 3, 14, objc_opt_class());
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentType"), 4, 4, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __66__BMPersonalizedSensingMomentsContextMomentsContextString_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_dimensionsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
