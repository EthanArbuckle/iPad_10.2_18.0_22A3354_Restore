@implementation BMAudioRoute

- (BMAudioRoute)initWithExternal:(id)a3 identifier:(id)a4 portType:(id)a5 portName:(id)a6 routeChangeReason:(int)a7 type:(int)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  BMAudioRoute *v18;
  objc_super v20;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BMAudioRoute;
  v18 = -[BMEventBase init](&v20, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v14)
    {
      v18->_hasExternal = 1;
      v18->_external = objc_msgSend(v14, "BOOLValue");
    }
    else
    {
      v18->_hasExternal = 0;
      v18->_external = 0;
    }
    objc_storeStrong((id *)&v18->_identifier, a4);
    objc_storeStrong((id *)&v18->_portType, a5);
    objc_storeStrong((id *)&v18->_portName, a6);
    v18->_routeChangeReason = a7;
    v18->_type = a8;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAudioRoute external](self, "external"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAudioRoute identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAudioRoute portType](self, "portType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAudioRoute portName](self, "portName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BMAudioRouteChangeReasonAsString(-[BMAudioRoute routeChangeReason](self, "routeChangeReason"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BMAudioRouteTypeAsString(-[BMAudioRoute type](self, "type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMAudioRoute with external: %@, identifier: %@, portType: %@, portName: %@, routeChangeReason: %@, type: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAudioRoute *v5;
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
  uint64_t v25;
  uint64_t v26;
  void *v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  BMAudioRoute *v40;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BMAudioRoute;
  v5 = -[BMEventBase init](&v42, sel_init);
  if (!v5)
    goto LABEL_67;
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
          v5->_hasExternal = 1;
          while (2)
          {
            v22 = *v6;
            v23 = *(_QWORD *)&v4[v22];
            if (v23 == -1 || v23 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v24 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v23);
              *(_QWORD *)&v4[v22] = v23 + 1;
              v21 |= (unint64_t)(v24 & 0x7F) << v19;
              if (v24 < 0)
              {
                v19 += 7;
                v16 = v20++ >= 9;
                if (v16)
                {
                  v21 = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v21 = 0;
LABEL_50:
          v5->_external = v21 != 0;
          continue;
        case 2u:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 32;
          goto LABEL_32;
        case 3u:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 40;
          goto LABEL_32;
        case 4u:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 48;
LABEL_32:
          v27 = *(Class *)((char *)&v5->super.super.isa + v26);
          *(Class *)((char *)&v5->super.super.isa + v26) = (Class)v25;

          continue;
        case 5u:
          v28 = 0;
          v29 = 0;
          v30 = 0;
          while (2)
          {
            v31 = *v6;
            v32 = *(_QWORD *)&v4[v31];
            if (v32 == -1 || v32 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v33 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v32);
              *(_QWORD *)&v4[v31] = v32 + 1;
              v30 |= (unint64_t)(v33 & 0x7F) << v28;
              if (v33 < 0)
              {
                v28 += 7;
                v16 = v29++ >= 9;
                if (v16)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_54;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v30) = 0;
LABEL_54:
          if (v30 >= 8)
            LODWORD(v30) = 0;
          v39 = 24;
          goto LABEL_63;
        case 6u:
          v34 = 0;
          v35 = 0;
          v30 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_66;
          continue;
      }
      while (1)
      {
        v36 = *v6;
        v37 = *(_QWORD *)&v4[v36];
        if (v37 == -1 || v37 >= *(_QWORD *)&v4[*v7])
          break;
        v38 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v37);
        *(_QWORD *)&v4[v36] = v37 + 1;
        v30 |= (unint64_t)(v38 & 0x7F) << v34;
        if ((v38 & 0x80) == 0)
          goto LABEL_58;
        v34 += 7;
        v16 = v35++ >= 9;
        if (v16)
        {
          LODWORD(v30) = 0;
          goto LABEL_60;
        }
      }
      v4[*v8] = 1;
LABEL_58:
      if (v4[*v8])
        LODWORD(v30) = 0;
LABEL_60:
      if (v30 >= 3)
        LODWORD(v30) = 0;
      v39 = 28;
LABEL_63:
      *(_DWORD *)((char *)&v5->super.super.isa + v39) = v30;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_66:
    v40 = 0;
  else
LABEL_67:
    v40 = v5;

  return v40;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasExternal)
    PBDataWriterWriteBOOLField();
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_portType)
    PBDataWriterWriteStringField();
  if (self->_portName)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMAudioRoute writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAudioRoute)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  BMAudioRoute *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  id *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  BMAudioRoute *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("external"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v18 = 0;
          v20 = 0;
          goto LABEL_50;
        }
        v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v22 = v8;
        v23 = *MEMORY[0x1E0D025B8];
        v57 = *MEMORY[0x1E0CB2D50];
        v47 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
        v58 = v47;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        v8 = v22;
        v18 = 0;
        v20 = 0;
        *v42 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v24, 2, v10);
        goto LABEL_49;
      }
      v46 = v9;
    }
    else
    {
      v46 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("portType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v47 = 0;
          v20 = 0;
          v18 = v46;
          goto LABEL_49;
        }
        v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = v8;
        v27 = *MEMORY[0x1E0D025B8];
        v55 = *MEMORY[0x1E0CB2D50];
        v44 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("portType"));
        v56 = v44;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        v8 = v26;
        v47 = 0;
        v20 = 0;
        *v42 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v28, 2, v11);
LABEL_48:
        v18 = v46;

        self = v48;
LABEL_49:

        goto LABEL_50;
      }
      v47 = v10;
    }
    else
    {
      v47 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("portName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v8;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v44 = 0;
          v20 = 0;
          goto LABEL_48;
        }
        v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v29 = *MEMORY[0x1E0D025B8];
        v53 = *MEMORY[0x1E0CB2D50];
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("portName"));
        v54 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v29, 2, v12);
        v44 = 0;
        v20 = 0;
        *v42 = v30;
        goto LABEL_47;
      }
      v44 = v11;
    }
    else
    {
      v44 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("routeChangeReason"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v12;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v42)
          {
            v13 = 0;
            v20 = 0;
            goto LABEL_47;
          }
          v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v36 = *MEMORY[0x1E0D025B8];
          v51 = *MEMORY[0x1E0CB2D50];
          v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("routeChangeReason"));
          v52 = v32;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v36, 2, v31);
          v13 = 0;
          v20 = 0;
          *v42 = v37;
          goto LABEL_46;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMAudioRouteChangeReasonFromString(v12));
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v13 = v14;
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = v31;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v42)
          {
            v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v40 = *MEMORY[0x1E0D025B8];
            v49 = *MEMORY[0x1E0CB2D50];
            v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("type"));
            v50 = v38;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *v42 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v40, 2, v39);

          }
          v32 = 0;
          v20 = 0;
          goto LABEL_46;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMAudioRouteTypeFromString(v31));
        v33 = (id)objc_claimAutoreleasedReturnValue();
      }
      v32 = v33;
    }
    else
    {
      v32 = 0;
    }
    v20 = -[BMAudioRoute initWithExternal:identifier:portType:portName:routeChangeReason:type:](v48, "initWithExternal:identifier:portType:portName:routeChangeReason:type:", v43, v46, v47, v44, objc_msgSend(v13, "intValue"), objc_msgSend(v32, "intValue"));
    v48 = v20;
LABEL_46:

LABEL_47:
    v8 = v43;
    goto LABEL_48;
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
    v20 = 0;
    goto LABEL_51;
  }
  v15 = a4;
  v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v17 = *MEMORY[0x1E0D025B8];
  v59 = *MEMORY[0x1E0CB2D50];
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("external"));
  v60[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, 2, v9);
  v8 = 0;
  v20 = 0;
  *v15 = v19;
LABEL_50:

LABEL_51:
  return v20;
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
  if (-[BMAudioRoute hasExternal](self, "hasExternal"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAudioRoute external](self, "external"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[BMAudioRoute identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAudioRoute portType](self, "portType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAudioRoute portName](self, "portName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAudioRoute routeChangeReason](self, "routeChangeReason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAudioRoute type](self, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("external");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v9;
  v20 = (void *)v3;
  v22[0] = v9;
  v21[1] = CFSTR("identifier");
  v10 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v10;
  v22[1] = v10;
  v21[2] = CFSTR("portType");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v10, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v11;
  v21[3] = CFSTR("portName");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v12;
  v21[4] = CFSTR("routeChangeReason");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v13;
  v21[5] = CFSTR("type");
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
      goto LABEL_18;
  }
  else
  {

    if (v7)
    {
LABEL_18:
      if (v6)
        goto LABEL_19;
      goto LABEL_26;
    }
  }

  if (v6)
  {
LABEL_19:
    if (v5)
      goto LABEL_20;
LABEL_27:

    if (v4)
      goto LABEL_21;
    goto LABEL_28;
  }
LABEL_26:

  if (!v5)
    goto LABEL_27;
LABEL_20:
  if (v4)
    goto LABEL_21;
LABEL_28:

LABEL_21:
  if (!v20)

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  int v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMAudioRoute hasExternal](self, "hasExternal") || objc_msgSend(v5, "hasExternal"))
    {
      if (!-[BMAudioRoute hasExternal](self, "hasExternal"))
        goto LABEL_22;
      if (!objc_msgSend(v5, "hasExternal"))
        goto LABEL_22;
      v6 = -[BMAudioRoute external](self, "external");
      if (v6 != objc_msgSend(v5, "external"))
        goto LABEL_22;
    }
    -[BMAudioRoute identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[BMAudioRoute identifier](self, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_22;
    }
    -[BMAudioRoute portType](self, "portType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "portType");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[BMAudioRoute portType](self, "portType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "portType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_22;
    }
    -[BMAudioRoute portName](self, "portName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "portName");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v21)
    {

    }
    else
    {
      v22 = (void *)v21;
      -[BMAudioRoute portName](self, "portName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "portName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      if (!v25)
        goto LABEL_22;
    }
    v26 = -[BMAudioRoute routeChangeReason](self, "routeChangeReason");
    if (v26 == objc_msgSend(v5, "routeChangeReason"))
    {
      v27 = -[BMAudioRoute type](self, "type");
      v13 = v27 == objc_msgSend(v5, "type");
LABEL_23:

      goto LABEL_24;
    }
LABEL_22:
    v13 = 0;
    goto LABEL_23;
  }
  v13 = 0;
LABEL_24:

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)external
{
  return self->_external;
}

- (BOOL)hasExternal
{
  return self->_hasExternal;
}

- (void)setHasExternal:(BOOL)a3
{
  self->_hasExternal = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)portType
{
  return self->_portType;
}

- (NSString)portName
{
  return self->_portName;
}

- (int)routeChangeReason
{
  return self->_routeChangeReason;
}

- (int)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portName, 0);
  objc_storeStrong((id *)&self->_portType, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
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

    v4 = -[BMAudioRoute initByReadFrom:]([BMAudioRoute alloc], "initByReadFrom:", v7);
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
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("external"), 0, 0, 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("portType"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("portName"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("routeChangeReason"), 0, 0, 5, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("type"), 0, 0, 6, 4, 0);
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
  return &unk_1E5F1A548;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("external"), 1, 12, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 2, 13, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("portType"), 3, 13, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("portName"), 4, 13, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("routeChangeReason"), 5, 4, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("type"), 6, 4, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
