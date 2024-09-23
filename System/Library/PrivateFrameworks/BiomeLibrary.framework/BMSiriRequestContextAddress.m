@implementation BMSiriRequestContextAddress

- (BMSiriRequestContextAddress)initWithLabel:(id)a3 street:(id)a4 city:(id)a5 state:(id)a6 postalCode:(id)a7 countryCode:(id)a8
{
  id v15;
  id v16;
  id v17;
  BMSiriRequestContextAddress *v18;
  id v20;
  id v21;
  id v22;
  objc_super v23;

  v22 = a3;
  v21 = a4;
  v20 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)BMSiriRequestContextAddress;
  v18 = -[BMEventBase init](&v23, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v18->_label, a3);
    objc_storeStrong((id *)&v18->_street, a4);
    objc_storeStrong((id *)&v18->_city, a5);
    objc_storeStrong((id *)&v18->_state, a6);
    objc_storeStrong((id *)&v18->_postalCode, a7);
    objc_storeStrong((id *)&v18->_countryCode, a8);
  }

  return v18;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSiriRequestContextAddress label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContextAddress street](self, "street");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContextAddress city](self, "city");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContextAddress state](self, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContextAddress postalCode](self, "postalCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContextAddress countryCode](self, "countryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriRequestContextAddress with label: %@, street: %@, city: %@, state: %@, postalCode: %@, countryCode: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriRequestContextAddress *v5;
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
  BMSiriRequestContextAddress *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BMSiriRequestContextAddress;
  v5 = -[BMEventBase init](&v25, sel_init);
  if (!v5)
    goto LABEL_32;
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
          v21 = 24;
          goto LABEL_28;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 32;
          goto LABEL_28;
        case 3u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 40;
          goto LABEL_28;
        case 4u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 48;
          goto LABEL_28;
        case 5u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 56;
          goto LABEL_28;
        case 6u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 64;
LABEL_28:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_31;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_31:
    v23 = 0;
  else
LABEL_32:
    v23 = v5;

  return v23;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_street)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_city)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_state)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_postalCode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_countryCode)
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
  -[BMSiriRequestContextAddress writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriRequestContextAddress)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  BMSiriRequestContextAddress *v16;
  void *v17;
  id v19;
  id *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id *v25;
  uint64_t v26;
  id *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  id *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id *v45;
  id v46;
  id *v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  BMSiriRequestContextAddress *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  id *v62;
  uint64_t v63;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("label"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("street"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v17 = 0;
          v16 = 0;
          goto LABEL_25;
        }
        v23 = v8;
        v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v25 = a4;
        v26 = *MEMORY[0x1E0D025B8];
        v61 = *MEMORY[0x1E0CB2D50];
        v27 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("street"));
        v62 = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v24;
        v8 = v23;
        v29 = v26;
        a4 = v27;
        v16 = 0;
        v17 = 0;
        *v25 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 2, v10);
        goto LABEL_24;
      }
      v51 = v9;
    }
    else
    {
      v51 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("city"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v16 = 0;
          v17 = v51;
          goto LABEL_24;
        }
        v30 = v8;
        v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v32 = a4;
        v33 = *MEMORY[0x1E0D025B8];
        v59 = *MEMORY[0x1E0CB2D50];
        v50 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("city"));
        v60 = v50;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v31;
        v8 = v30;
        v35 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", v33, 2, v11);
        v16 = 0;
        a4 = 0;
        *v32 = v35;
        goto LABEL_22;
      }
      v47 = v10;
    }
    else
    {
      v47 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("state"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v8;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v50 = 0;
          v16 = 0;
          v17 = v51;
          a4 = v47;
          goto LABEL_23;
        }
        v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v37 = *MEMORY[0x1E0D025B8];
        v57 = *MEMORY[0x1E0CB2D50];
        v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("state"));
        v58 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v37, 2, v12);
        v16 = 0;
        v50 = 0;
        *a4 = v38;
        goto LABEL_57;
      }
      v50 = v11;
    }
    else
    {
      v50 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("postalCode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v13 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v12;
LABEL_16:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("countryCode"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v44 = *MEMORY[0x1E0D025B8];
            v53 = *MEMORY[0x1E0CB2D50];
            v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("countryCode"));
            v54 = v42;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *a4 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v44, 2, v43);

          }
          v15 = 0;
          v16 = 0;
          a4 = v47;
          goto LABEL_20;
        }
        v15 = v14;
      }
      else
      {
        v15 = 0;
      }
      a4 = v47;
      v16 = -[BMSiriRequestContextAddress initWithLabel:street:city:state:postalCode:countryCode:](v52, "initWithLabel:street:city:state:postalCode:countryCode:", v48, v51, v47, v50, v13, v15);
      v52 = v16;
LABEL_20:

LABEL_21:
      v8 = v48;
LABEL_22:
      v17 = v51;
LABEL_23:

      self = v52;
LABEL_24:

      v7 = v49;
      goto LABEL_25;
    }
    if (a4)
    {
      v45 = a4;
      v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v40 = *MEMORY[0x1E0D025B8];
      v55 = *MEMORY[0x1E0CB2D50];
      v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("postalCode"));
      v56 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v40, 2, v14);
      v16 = 0;
      v13 = 0;
      a4 = v47;
      *v45 = v41;
      goto LABEL_20;
    }
    v13 = 0;
    v16 = 0;
LABEL_57:
    a4 = v47;
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v16 = 0;
    v8 = 0;
    goto LABEL_26;
  }
  v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v20 = a4;
  v21 = *MEMORY[0x1E0D025B8];
  v63 = *MEMORY[0x1E0CB2D50];
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("label"));
  v64[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v21, 2, v9);
  v16 = 0;
  v8 = 0;
  *v20 = v22;
LABEL_25:

LABEL_26:
  return v16;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[6];
  _QWORD v22[7];

  v22[6] = *MEMORY[0x1E0C80C00];
  -[BMSiriRequestContextAddress label](self, "label");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContextAddress street](self, "street");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContextAddress city](self, "city");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContextAddress state](self, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContextAddress postalCode](self, "postalCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRequestContextAddress countryCode](self, "countryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("label");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v9;
  v22[0] = v9;
  v21[1] = CFSTR("street");
  v10 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v10;
  v22[1] = v10;
  v21[2] = CFSTR("city");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v10, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v3;
  v22[2] = v11;
  v21[3] = CFSTR("state");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v12;
  v21[4] = CFSTR("postalCode");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v13;
  v21[5] = CFSTR("countryCode");
  v14 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 6, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
      goto LABEL_15;
LABEL_21:

    if (v6)
      goto LABEL_16;
    goto LABEL_22;
  }

  if (!v7)
    goto LABEL_21;
LABEL_15:
  if (v6)
    goto LABEL_16;
LABEL_22:

LABEL_16:
  if (v5)
  {
    if (v4)
      goto LABEL_18;
LABEL_24:

    if (v20)
      goto LABEL_19;
LABEL_25:

    goto LABEL_19;
  }

  if (!v4)
    goto LABEL_24;
LABEL_18:
  if (!v20)
    goto LABEL_25;
LABEL_19:

  return v15;
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
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriRequestContextAddress label](self, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "label");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriRequestContextAddress label](self, "label");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "label");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_21;
    }
    -[BMSiriRequestContextAddress street](self, "street");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "street");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSiriRequestContextAddress street](self, "street");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "street");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_21;
    }
    -[BMSiriRequestContextAddress city](self, "city");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "city");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMSiriRequestContextAddress city](self, "city");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "city");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_21;
    }
    -[BMSiriRequestContextAddress state](self, "state");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "state");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMSiriRequestContextAddress state](self, "state");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "state");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_21;
    }
    -[BMSiriRequestContextAddress postalCode](self, "postalCode");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postalCode");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMSiriRequestContextAddress postalCode](self, "postalCode");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postalCode");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
      {
LABEL_21:
        v12 = 0;
LABEL_22:

        goto LABEL_23;
      }
    }
    -[BMSiriRequestContextAddress countryCode](self, "countryCode");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "countryCode");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38 == v39)
    {
      v12 = 1;
    }
    else
    {
      -[BMSiriRequestContextAddress countryCode](self, "countryCode");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "countryCode");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v40, "isEqual:", v41);

    }
    goto LABEL_22;
  }
  v12 = 0;
LABEL_23:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)street
{
  return self->_street;
}

- (NSString)city
{
  return self->_city;
}

- (NSString)state
{
  return self->_state;
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_street, 0);
  objc_storeStrong((id *)&self->_label, 0);
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

    v4 = -[BMSiriRequestContextAddress initByReadFrom:]([BMSiriRequestContextAddress alloc], "initByReadFrom:", v7);
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
  void *v7;
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("label"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("street"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("city"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("state"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("postalCode"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("countryCode"), 2, 0, 6, 13, 0);
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1CD50;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("label"), 1, 13, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("street"), 2, 13, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("city"), 3, 13, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("state"), 4, 13, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("postalCode"), 5, 13, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("countryCode"), 6, 13, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
