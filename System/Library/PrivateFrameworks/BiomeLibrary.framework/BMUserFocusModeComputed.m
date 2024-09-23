@implementation BMUserFocusModeComputed

- (BMUserFocusModeComputed)initWithMode:(id)a3 starting:(id)a4 updateReason:(int)a5 semanticType:(int)a6 updateSource:(int)a7 semanticModeIdentifier:(id)a8
{
  id v15;
  id v16;
  id v17;
  BMUserFocusModeComputed *v18;
  objc_super v20;

  v15 = a3;
  v16 = a4;
  v17 = a8;
  v20.receiver = self;
  v20.super_class = (Class)BMUserFocusModeComputed;
  v18 = -[BMEventBase init](&v20, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v18->_mode, a3);
    if (v16)
    {
      v18->_hasStarting = 1;
      v18->_starting = objc_msgSend(v16, "BOOLValue");
    }
    else
    {
      v18->_hasStarting = 0;
      v18->_starting = 0;
    }
    v18->_updateReason = a5;
    v18->_semanticType = a6;
    v18->_updateSource = a7;
    objc_storeStrong((id *)&v18->_semanticModeIdentifier, a8);
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
  -[BMUserFocusModeComputed mode](self, "mode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMUserFocusModeComputed starting](self, "starting"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMUserFocusModeComputedUpdateReasonAsString(-[BMUserFocusModeComputed updateReason](self, "updateReason"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMUserFocusModeComputedSemanticTypeAsString(-[BMUserFocusModeComputed semanticType](self, "semanticType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BMUserFocusModeComputedUpdateSourceAsString(-[BMUserFocusModeComputed updateSource](self, "updateSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMUserFocusModeComputed semanticModeIdentifier](self, "semanticModeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMUserFocusModeComputed with mode: %@, starting: %@, updateReason: %@, semanticType: %@, updateSource: %@, semanticModeIdentifier: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMUserFocusModeComputed *v5;
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
  uint64_t v19;
  uint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  void *v43;
  uint64_t v44;
  BMUserFocusModeComputed *v45;
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)BMUserFocusModeComputed;
  v5 = -[BMEventBase init](&v47, sel_init);
  if (!v5)
    goto LABEL_79;
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
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 40;
          goto LABEL_52;
        case 2u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          v5->_hasStarting = 1;
          while (2)
          {
            v24 = *v6;
            v25 = *(_QWORD *)&v4[v24];
            if (v25 == -1 || v25 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v25);
              *(_QWORD *)&v4[v24] = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                v16 = v22++ >= 9;
                if (v16)
                {
                  v23 = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v23 = 0;
LABEL_56:
          v5->_starting = v23 != 0;
          continue;
        case 3u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          while (2)
          {
            v30 = *v6;
            v31 = *(_QWORD *)&v4[v30];
            if (v31 == -1 || v31 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v31);
              *(_QWORD *)&v4[v30] = v31 + 1;
              v29 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                v16 = v28++ >= 9;
                if (v16)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v29) = 0;
LABEL_60:
          if (v29 >= 4)
            LODWORD(v29) = 0;
          v44 = 24;
          goto LABEL_75;
        case 4u:
          v33 = 0;
          v34 = 0;
          v29 = 0;
          while (2)
          {
            v35 = *v6;
            v36 = *(_QWORD *)&v4[v35];
            if (v36 == -1 || v36 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v36);
              *(_QWORD *)&v4[v35] = v36 + 1;
              v29 |= (unint64_t)(v37 & 0x7F) << v33;
              if (v37 < 0)
              {
                v33 += 7;
                v16 = v34++ >= 9;
                if (v16)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v29) = 0;
LABEL_66:
          if (v29 >= 0xC)
            LODWORD(v29) = 0;
          v44 = 28;
          goto LABEL_75;
        case 5u:
          v38 = 0;
          v39 = 0;
          v29 = 0;
          break;
        case 6u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 48;
LABEL_52:
          v43 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_78;
          continue;
      }
      while (1)
      {
        v40 = *v6;
        v41 = *(_QWORD *)&v4[v40];
        if (v41 == -1 || v41 >= *(_QWORD *)&v4[*v7])
          break;
        v42 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v41);
        *(_QWORD *)&v4[v40] = v41 + 1;
        v29 |= (unint64_t)(v42 & 0x7F) << v38;
        if ((v42 & 0x80) == 0)
          goto LABEL_70;
        v38 += 7;
        v16 = v39++ >= 9;
        if (v16)
        {
          LODWORD(v29) = 0;
          goto LABEL_72;
        }
      }
      v4[*v8] = 1;
LABEL_70:
      if (v4[*v8])
        LODWORD(v29) = 0;
LABEL_72:
      if (v29 >= 4)
        LODWORD(v29) = 0;
      v44 = 32;
LABEL_75:
      *(_DWORD *)((char *)&v5->super.super.isa + v44) = v29;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_78:
    v45 = 0;
  else
LABEL_79:
    v45 = v5;

  return v45;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_mode)
    PBDataWriterWriteStringField();
  if (self->_hasStarting)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_semanticModeIdentifier)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMUserFocusModeComputed writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMUserFocusModeComputed)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id *v13;
  id v14;
  uint64_t v15;
  id v16;
  id *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  BMUserFocusModeComputed *v25;
  id *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  id v32;
  id *v33;
  id v34;
  id *v35;
  uint64_t v36;
  id v37;
  id v38;
  id *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  _QWORD v61[3];

  v61[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!p_isa)
      {
        v49 = 0;
        v25 = self;
        goto LABEL_48;
      }
      v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v11 = *MEMORY[0x1E0D025B8];
      v60 = *MEMORY[0x1E0CB2D50];
      v48 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("mode"));
      v61[0] = v48;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, 2, v7);
      v49 = 0;
      v13 = p_isa;
      p_isa = 0;
      *v13 = v12;
      goto LABEL_59;
    }
    v49 = v6;
  }
  else
  {
    v49 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("starting"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = v7;
        goto LABEL_7;
      }
      if (p_isa)
      {
        v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v15 = *MEMORY[0x1E0D025B8];
        v58 = *MEMORY[0x1E0CB2D50];
        v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("starting"));
        v59 = v47;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (id)objc_msgSend(v14, "initWithDomain:code:userInfo:", v15, 2, v8);
        v48 = 0;
        v17 = p_isa;
        p_isa = 0;
        *v17 = v16;
        goto LABEL_65;
      }
      v48 = 0;
LABEL_59:
      v25 = self;
      goto LABEL_47;
    }
  }
  v48 = 0;
LABEL_7:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("updateReason"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v6;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;
LABEL_22:
        v47 = v9;
        goto LABEL_23;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMUserFocusModeComputedUpdateReasonFromString(v8));
        v9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      if (p_isa)
      {
        v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v31 = *MEMORY[0x1E0D025B8];
        v56 = *MEMORY[0x1E0CB2D50];
        v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("updateReason"));
        v57 = v45;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v31, 2, v18);
        v47 = 0;
        v33 = p_isa;
        p_isa = 0;
        *v33 = v32;
        goto LABEL_67;
      }
      v47 = 0;
LABEL_65:
      v25 = self;
      goto LABEL_46;
    }
  }
  v47 = 0;
LABEL_23:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("semanticType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = v18;
LABEL_30:
        v45 = v19;
        goto LABEL_31;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMUserFocusModeComputedSemanticTypeFromString(v18));
        v19 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
      if (p_isa)
      {
        v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v35 = p_isa;
        v36 = *MEMORY[0x1E0D025B8];
        v54 = *MEMORY[0x1E0CB2D50];
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("semanticType"));
        v55 = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", v36, 2, v20);
        v45 = 0;
        p_isa = 0;
        *v35 = v37;
        goto LABEL_69;
      }
      v45 = 0;
LABEL_67:
      v25 = self;
      goto LABEL_45;
    }
  }
  v45 = 0;
LABEL_31:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("updateSource"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = v20;
LABEL_38:
        v21 = v22;
        goto LABEL_39;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMUserFocusModeComputedUpdateSourceFromString(v20));
        v22 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_38;
      }
      if (p_isa)
      {
        v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v39 = p_isa;
        v40 = *MEMORY[0x1E0D025B8];
        v52 = *MEMORY[0x1E0CB2D50];
        v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("updateSource"));
        v53 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v40, 2, v23);
        v21 = 0;
        p_isa = 0;
        *v39 = v41;
        goto LABEL_63;
      }
      v21 = 0;
LABEL_69:
      v25 = self;
      goto LABEL_44;
    }
  }
  v21 = 0;
LABEL_39:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("semanticModeIdentifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = v23;
        goto LABEL_42;
      }
      if (p_isa)
      {
        v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v42 = *MEMORY[0x1E0D025B8];
        v50 = *MEMORY[0x1E0CB2D50];
        v27 = p_isa;
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("semanticModeIdentifier"));
        v51 = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *v27 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v42, 2, v29);

        v24 = 0;
        p_isa = 0;
      }
      else
      {
        v24 = 0;
      }
LABEL_63:
      v25 = self;
      goto LABEL_43;
    }
  }
  v24 = 0;
LABEL_42:
  v25 = -[BMUserFocusModeComputed initWithMode:starting:updateReason:semanticType:updateSource:semanticModeIdentifier:](self, "initWithMode:starting:updateReason:semanticType:updateSource:semanticModeIdentifier:", v49, v48, objc_msgSend(v47, "intValue"), objc_msgSend(v45, "intValue"), objc_msgSend(v21, "intValue"), v24);
  p_isa = (id *)&v25->super.super.isa;
LABEL_43:

LABEL_44:
LABEL_45:

  v6 = v44;
LABEL_46:

LABEL_47:
LABEL_48:

  return (BMUserFocusModeComputed *)p_isa;
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
  -[BMUserFocusModeComputed mode](self, "mode");
  v3 = objc_claimAutoreleasedReturnValue();
  if (-[BMUserFocusModeComputed hasStarting](self, "hasStarting"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMUserFocusModeComputed starting](self, "starting"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMUserFocusModeComputed updateReason](self, "updateReason"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMUserFocusModeComputed semanticType](self, "semanticType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMUserFocusModeComputed updateSource](self, "updateSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMUserFocusModeComputed semanticModeIdentifier](self, "semanticModeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("mode");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v9;
  v20 = (void *)v3;
  v22[0] = v9;
  v21[1] = CFSTR("starting");
  v10 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v10;
  v22[1] = v10;
  v21[2] = CFSTR("updateReason");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v10, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v11;
  v21[3] = CFSTR("semanticType");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v12;
  v21[4] = CFSTR("updateSource");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v13;
  v21[5] = CFSTR("semanticModeIdentifier");
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
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  int v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMUserFocusModeComputed mode](self, "mode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mode");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMUserFocusModeComputed mode](self, "mode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_17;
    }
    if (!-[BMUserFocusModeComputed hasStarting](self, "hasStarting") && !objc_msgSend(v5, "hasStarting")
      || -[BMUserFocusModeComputed hasStarting](self, "hasStarting")
      && objc_msgSend(v5, "hasStarting")
      && (v13 = -[BMUserFocusModeComputed starting](self, "starting"), v13 == objc_msgSend(v5, "starting")))
    {
      v14 = -[BMUserFocusModeComputed updateReason](self, "updateReason");
      if (v14 == objc_msgSend(v5, "updateReason"))
      {
        v15 = -[BMUserFocusModeComputed semanticType](self, "semanticType");
        if (v15 == objc_msgSend(v5, "semanticType"))
        {
          v16 = -[BMUserFocusModeComputed updateSource](self, "updateSource");
          if (v16 == objc_msgSend(v5, "updateSource"))
          {
            -[BMUserFocusModeComputed semanticModeIdentifier](self, "semanticModeIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "semanticModeIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17 == v18)
            {
              v12 = 1;
            }
            else
            {
              -[BMUserFocusModeComputed semanticModeIdentifier](self, "semanticModeIdentifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "semanticModeIdentifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v19, "isEqual:", v20);

            }
            goto LABEL_18;
          }
        }
      }
    }
LABEL_17:
    v12 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v12 = 0;
LABEL_19:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)mode
{
  return self->_mode;
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

- (int)updateReason
{
  return self->_updateReason;
}

- (int)semanticType
{
  return self->_semanticType;
}

- (int)updateSource
{
  return self->_updateSource;
}

- (NSString)semanticModeIdentifier
{
  return self->_semanticModeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semanticModeIdentifier, 0);
  objc_storeStrong((id *)&self->_mode, 0);
}

+ (unsigned)latestDataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  __objc2_class **v6;
  void *v7;
  _DWORD *v8;

  v5 = a3;
  if (a4 == 2)
  {
    v6 = off_1E5E4B760;
  }
  else
  {
    if (a4 != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = off_1E5E4B768;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v5);
  v8 = (_DWORD *)objc_msgSend(objc_alloc(*v6), "initByReadFrom:", v7);
  v8[5] = a4;

LABEL_7:
  return v8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mode"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("starting"), 0, 0, 2, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("updateReason"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("semanticType"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("updateSource"), 0, 0, 5, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("semanticModeIdentifier"), 2, 0, 6, 13, 0);
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
  return &unk_1E5F1A800;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mode"), 1, 13, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("starting"), 2, 12, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("updateReason"), 3, 4, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("semanticType"), 4, 4, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("updateSource"), 5, 4, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("semanticModeIdentifier"), 6, 13, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
