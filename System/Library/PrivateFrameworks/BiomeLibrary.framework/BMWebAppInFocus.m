@implementation BMWebAppInFocus

- (BMWebAppInFocus)initWithStarting:(id)a3 absoluteTimestamp:(id)a4 type:(int)a5 identifier:(id)a6 name:(id)a7 manifestId:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  BMWebAppInFocus *v19;
  double v20;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v22.receiver = self;
  v22.super_class = (Class)BMWebAppInFocus;
  v19 = -[BMEventBase init](&v22, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v14)
    {
      v19->_hasStarting = 1;
      v19->_starting = objc_msgSend(v14, "BOOLValue");
    }
    else
    {
      v19->_hasStarting = 0;
      v19->_starting = 0;
    }
    if (v15)
    {
      v19->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v19->_hasRaw_absoluteTimestamp = 0;
      v20 = -1.0;
    }
    v19->_raw_absoluteTimestamp = v20;
    v19->_type = a5;
    objc_storeStrong((id *)&v19->_identifier, a6);
    objc_storeStrong((id *)&v19->_name, a7);
    objc_storeStrong((id *)&v19->_manifestId, a8);
  }

  return v19;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMWebAppInFocus starting](self, "starting"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWebAppInFocus absoluteTimestamp](self, "absoluteTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMWebAppInFocusWebAppTypeAsString(-[BMWebAppInFocus type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWebAppInFocus identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWebAppInFocus name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWebAppInFocus manifestId](self, "manifestId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMWebAppInFocus with starting: %@, absoluteTimestamp: %@, type: %@, identifier: %@, name: %@, manifestId: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMWebAppInFocus *v5;
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
  BOOL v17;
  int v18;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  unint64_t v28;
  double v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  BMWebAppInFocus *v40;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BMWebAppInFocus;
  v5 = -[BMEventBase init](&v42, sel_init);
  if (!v5)
    goto LABEL_58;
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
        v17 = v11++ >= 9;
        if (v17)
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
          v20 = 0;
          v21 = 0;
          v22 = 0;
          v5->_hasStarting = 1;
          while (2)
          {
            v23 = *v6;
            v24 = *(_QWORD *)&v4[v23];
            v25 = v24 + 1;
            if (v24 == -1 || v25 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v24);
              *(_QWORD *)&v4[v23] = v25;
              v22 |= (unint64_t)(v26 & 0x7F) << v20;
              if (v26 < 0)
              {
                v20 += 7;
                v17 = v21++ >= 9;
                if (v17)
                {
                  v22 = 0;
                  goto LABEL_46;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v22 = 0;
LABEL_46:
          v5->_starting = v22 != 0;
          continue;
        case 2u:
          v5->_hasRaw_absoluteTimestamp = 1;
          v27 = *v6;
          v28 = *(_QWORD *)&v4[v27];
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v29 = *(double *)(*(_QWORD *)&v4[*v9] + v28);
            *(_QWORD *)&v4[v27] = v28 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v29 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v29;
          continue;
        case 3u:
          v30 = 0;
          v31 = 0;
          v32 = 0;
          break;
        case 4u:
          PBReaderReadString();
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = 48;
          goto LABEL_42;
        case 5u:
          PBReaderReadString();
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = 56;
          goto LABEL_42;
        case 6u:
          PBReaderReadString();
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = 64;
LABEL_42:
          v39 = *(Class *)((char *)&v5->super.super.isa + v38);
          *(Class *)((char *)&v5->super.super.isa + v38) = (Class)v37;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_57;
          continue;
      }
      while (1)
      {
        v33 = *v6;
        v34 = *(_QWORD *)&v4[v33];
        v35 = v34 + 1;
        if (v34 == -1 || v35 > *(_QWORD *)&v4[*v7])
          break;
        v36 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v34);
        *(_QWORD *)&v4[v33] = v35;
        v32 |= (unint64_t)(v36 & 0x7F) << v30;
        if ((v36 & 0x80) == 0)
          goto LABEL_48;
        v30 += 7;
        v17 = v31++ >= 9;
        if (v17)
        {
          LODWORD(v32) = 0;
          goto LABEL_50;
        }
      }
      v4[*v8] = 1;
LABEL_48:
      if (v4[*v8])
        LODWORD(v32) = 0;
LABEL_50:
      if (v32 >= 3)
        LODWORD(v32) = 0;
      v5->_type = v32;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_57:
    v40 = 0;
  else
LABEL_58:
    v40 = v5;

  return v40;
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (self->_hasStarting)
    PBDataWriterWriteBOOLField();
  if (self->_hasRaw_absoluteTimestamp)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_name)
    PBDataWriterWriteStringField();
  v4 = v5;
  if (self->_manifestId)
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
  -[BMWebAppInFocus writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMWebAppInFocus)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  id v12;
  id v13;
  double v14;
  double v15;
  id v16;
  id v17;
  id *v18;
  uint64_t v19;
  BMWebAppInFocus *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  BMWebAppInFocus *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id *v33;
  id v34;
  uint64_t v35;
  id v36;
  BMWebAppInFocus *v37;
  id v38;
  uint64_t v39;
  objc_class *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  BMWebAppInFocus *v49;
  id *v50;
  id *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  _QWORD v69[3];

  v69[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("starting"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
    v9 = objc_claimAutoreleasedReturnValue();
    v54 = (void *)v9;
    if (v9 && (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (objc_class *)MEMORY[0x1E0C99D68];
        v12 = v10;
        v13 = [v11 alloc];
        objc_msgSend(v12, "doubleValue");
        v15 = v14;

        v16 = (id)objc_msgSend(v13, "initWithTimeIntervalSinceReferenceDate:", v15);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v21, "dateFromString:", v10);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v57 = 0;
            v20 = 0;
            goto LABEL_43;
          }
          v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v51 = a4;
          v46 = *MEMORY[0x1E0D025B8];
          v66 = *MEMORY[0x1E0CB2D50];
          v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
          v67 = v56;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = 0;
          v20 = 0;
          *v51 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v46, 2, v22);
          goto LABEL_42;
        }
        v16 = v10;
      }
      v57 = v16;
    }
    else
    {
      v57 = 0;
    }
LABEL_16:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v7;
    if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = v22;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v56 = 0;
            v20 = 0;
            goto LABEL_41;
          }
          v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v50 = a4;
          v44 = *MEMORY[0x1E0D025B8];
          v64 = *MEMORY[0x1E0CB2D50];
          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("type"));
          v65 = v31;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = 0;
          v20 = 0;
          *v50 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 2, v24);
LABEL_40:

LABEL_41:
          v7 = v53;
LABEL_42:

          v10 = v54;
          goto LABEL_43;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMWebAppInFocusWebAppTypeFromString(v22));
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      v56 = v23;
    }
    else
    {
      v56 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v8;
    if (v24)
    {
      v20 = (BMWebAppInFocus *)a4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v31 = 0;
            goto LABEL_40;
          }
          v33 = a4;
          v27 = self;
          v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v35 = *MEMORY[0x1E0D025B8];
          v62 = *MEMORY[0x1E0CB2D50];
          v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
          v63 = v28;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", v35, 2, v26);
          v20 = 0;
          v31 = 0;
          *v33 = v36;
          goto LABEL_39;
        }
        v52 = v22;
        v25 = v24;
LABEL_29:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v26 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v27 = self;
          v28 = 0;
        }
        else
        {
          objc_opt_class();
          v27 = self;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v20)
            {
              v28 = 0;
              v31 = v25;
              v22 = v52;
              goto LABEL_39;
            }
            v37 = v20;
            v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v39 = *MEMORY[0x1E0D025B8];
            v60 = *MEMORY[0x1E0CB2D50];
            v30 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("name"));
            v61 = v30;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = (objc_class *)(id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v39, 2, v29);
            v20 = 0;
            v28 = 0;
            v37->super.super.isa = v40;
            v31 = v25;
            v22 = v52;
            goto LABEL_38;
          }
          v28 = v26;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("manifestId"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          v31 = v25;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v22 = v52;
            if (v20)
            {
              v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v47 = *MEMORY[0x1E0D025B8];
              v58 = *MEMORY[0x1E0CB2D50];
              v49 = v20;
              v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("manifestId"));
              v59 = v41;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v49->super.super.isa = (Class)(id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v47, 2, v42);

              v30 = 0;
              v20 = 0;
            }
            else
            {
              v30 = 0;
            }
            goto LABEL_38;
          }
          v30 = v29;
        }
        else
        {
          v30 = 0;
          v31 = v25;
        }
        v22 = v52;
        v20 = -[BMWebAppInFocus initWithStarting:absoluteTimestamp:type:identifier:name:manifestId:](v27, "initWithStarting:absoluteTimestamp:type:identifier:name:manifestId:", v55, v57, objc_msgSend(v56, "intValue"), v31, v28, v30);
        v27 = v20;
LABEL_38:

LABEL_39:
        self = v27;
        v8 = v55;
        goto LABEL_40;
      }
      v52 = v22;
    }
    else
    {
      v52 = v22;
      v20 = (BMWebAppInFocus *)a4;
    }
    v25 = 0;
    goto LABEL_29;
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
    goto LABEL_44;
  }
  v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v18 = a4;
  v19 = *MEMORY[0x1E0D025B8];
  v68 = *MEMORY[0x1E0CB2D50];
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("starting"));
  v69[0] = v57;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v20 = 0;
  *v18 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v19, 2, v10);
LABEL_43:

LABEL_44:
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
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[6];
  _QWORD v25[7];

  v25[6] = *MEMORY[0x1E0C80C00];
  if (-[BMWebAppInFocus hasStarting](self, "hasStarting"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMWebAppInFocus starting](self, "starting"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[BMWebAppInFocus absoluteTimestamp](self, "absoluteTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMWebAppInFocus absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMWebAppInFocus type](self, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWebAppInFocus identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWebAppInFocus name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMWebAppInFocus manifestId](self, "manifestId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = CFSTR("starting");
  v12 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v12;
  v23 = (void *)v3;
  v25[0] = v12;
  v24[1] = CFSTR("absoluteTimestamp");
  v13 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v20 = v13;
  v25[1] = v13;
  v24[2] = CFSTR("type");
  v14 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v13, v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[2] = v14;
  v24[3] = CFSTR("identifier");
  v15 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[3] = v15;
  v24[4] = CFSTR("name");
  v16 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[4] = v16;
  v24[5] = CFSTR("manifestId");
  v17 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 6, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
      goto LABEL_21;
  }
  else
  {

    if (v10)
    {
LABEL_21:
      if (v9)
        goto LABEL_22;
      goto LABEL_29;
    }
  }

  if (v9)
  {
LABEL_22:
    if (v8)
      goto LABEL_23;
LABEL_30:

    if (v7)
      goto LABEL_24;
    goto LABEL_31;
  }
LABEL_29:

  if (!v8)
    goto LABEL_30;
LABEL_23:
  if (v7)
    goto LABEL_24;
LABEL_31:

LABEL_24:
  if (!v23)

  return v18;
}

- (NSDate)absoluteTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_absoluteTimestamp);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
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
  char v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMWebAppInFocus hasStarting](self, "hasStarting") || objc_msgSend(v5, "hasStarting"))
    {
      if (!-[BMWebAppInFocus hasStarting](self, "hasStarting"))
        goto LABEL_19;
      if (!objc_msgSend(v5, "hasStarting"))
        goto LABEL_19;
      v6 = -[BMWebAppInFocus starting](self, "starting");
      if (v6 != objc_msgSend(v5, "starting"))
        goto LABEL_19;
    }
    -[BMWebAppInFocus absoluteTimestamp](self, "absoluteTimestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[BMWebAppInFocus absoluteTimestamp](self, "absoluteTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_19;
    }
    v14 = -[BMWebAppInFocus type](self, "type");
    if (v14 == objc_msgSend(v5, "type"))
    {
      -[BMWebAppInFocus identifier](self, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v15 == (void *)v16)
      {

      }
      else
      {
        v17 = (void *)v16;
        -[BMWebAppInFocus identifier](self, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if (!v20)
          goto LABEL_19;
      }
      -[BMWebAppInFocus name](self, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v21 == (void *)v22)
      {

      }
      else
      {
        v23 = (void *)v22;
        -[BMWebAppInFocus name](self, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "name");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "isEqual:", v25);

        if (!v26)
          goto LABEL_19;
      }
      -[BMWebAppInFocus manifestId](self, "manifestId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "manifestId");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28 == v29)
      {
        v13 = 1;
      }
      else
      {
        -[BMWebAppInFocus manifestId](self, "manifestId");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "manifestId");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v30, "isEqual:", v31);

      }
      goto LABEL_20;
    }
LABEL_19:
    v13 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v13 = 0;
LABEL_21:

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)starting
{
  return self->_starting;
}

- (BOOL)hasStarting
{
  return self->_hasStarting;
}

- (void)setHasStarting:(BOOL)a3
{
  self->_hasStarting = a3;
}

- (int)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)manifestId
{
  return self->_manifestId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifestId, 0);
  objc_storeStrong((id *)&self->_name, 0);
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

    v4 = -[BMWebAppInFocus initByReadFrom:]([BMWebAppInFocus alloc], "initByReadFrom:", v7);
    v4[9] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("starting"), 0, 0, 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 2, 0, 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("type"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("name"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("manifestId"), 2, 0, 6, 13, 0);
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
  return &unk_1E5F1B8C8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("starting"), 1, 12, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 2, 0, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("type"), 3, 4, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 4, 13, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("name"), 5, 13, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("manifestId"), 6, 13, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
