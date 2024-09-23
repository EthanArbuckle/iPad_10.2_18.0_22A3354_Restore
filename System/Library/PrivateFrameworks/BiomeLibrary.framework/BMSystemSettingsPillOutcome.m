@implementation BMSystemSettingsPillOutcome

- (BMSystemSettingsPillOutcome)initWithChildAccount:(id)a3 firstUpdate:(id)a4 fromPill:(id)a5 gesture:(id)a6 gestureOn:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BMSystemSettingsPillOutcome *v17;
  objc_super v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v19.receiver = self;
  v19.super_class = (Class)BMSystemSettingsPillOutcome;
  v17 = -[BMEventBase init](&v19, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v12)
    {
      v17->_hasChildAccount = 1;
      v17->_childAccount = objc_msgSend(v12, "BOOLValue");
    }
    else
    {
      v17->_hasChildAccount = 0;
      v17->_childAccount = 0;
    }
    if (v13)
    {
      v17->_hasFirstUpdate = 1;
      v17->_firstUpdate = objc_msgSend(v13, "BOOLValue");
    }
    else
    {
      v17->_hasFirstUpdate = 0;
      v17->_firstUpdate = 0;
    }
    if (v14)
    {
      v17->_hasFromPill = 1;
      v17->_fromPill = objc_msgSend(v14, "BOOLValue");
    }
    else
    {
      v17->_hasFromPill = 0;
      v17->_fromPill = 0;
    }
    objc_storeStrong((id *)&v17->_gesture, a6);
    if (v16)
    {
      v17->_hasGestureOn = 1;
      v17->_gestureOn = objc_msgSend(v16, "BOOLValue");
    }
    else
    {
      v17->_hasGestureOn = 0;
      v17->_gestureOn = 0;
    }
  }

  return v17;
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSystemSettingsPillOutcome childAccount](self, "childAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSystemSettingsPillOutcome firstUpdate](self, "firstUpdate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSystemSettingsPillOutcome fromPill](self, "fromPill"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSystemSettingsPillOutcome gesture](self, "gesture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSystemSettingsPillOutcome gestureOn](self, "gestureOn"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSystemSettingsPillOutcome with childAccount: %@, firstUpdate: %@, fromPill: %@, gesture: %@, gestureOn: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSystemSettingsPillOutcome *v5;
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
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  NSString *gesture;
  char v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  BOOL v45;
  uint64_t v46;
  BMSystemSettingsPillOutcome *v47;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)BMSystemSettingsPillOutcome;
  v5 = -[BMEventBase init](&v49, sel_init);
  if (!v5)
    goto LABEL_71;
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
          v5->_hasChildAccount = 1;
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
              goto LABEL_52;
            v19 += 7;
            v16 = v20++ >= 9;
            if (v16)
            {
              v21 = 0;
              goto LABEL_54;
            }
          }
          v4[*v8] = 1;
LABEL_52:
          if (v4[*v8])
            v21 = 0;
LABEL_54:
          v45 = v21 != 0;
          v46 = 16;
          goto LABEL_67;
        case 2u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          v5->_hasFirstUpdate = 1;
          while (2)
          {
            v28 = *v6;
            v29 = *(_QWORD *)&v4[v28];
            if (v29 == -1 || v29 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v29);
              *(_QWORD *)&v4[v28] = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                v16 = v26++ >= 9;
                if (v16)
                {
                  v27 = 0;
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v27 = 0;
LABEL_58:
          v45 = v27 != 0;
          v46 = 18;
          goto LABEL_67;
        case 3u:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          v5->_hasFromPill = 1;
          while (2)
          {
            v34 = *v6;
            v35 = *(_QWORD *)&v4[v34];
            if (v35 == -1 || v35 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v35);
              *(_QWORD *)&v4[v34] = v35 + 1;
              v33 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                v16 = v32++ >= 9;
                if (v16)
                {
                  v33 = 0;
                  goto LABEL_62;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v33 = 0;
LABEL_62:
          v45 = v33 != 0;
          v46 = 20;
          goto LABEL_67;
        case 4u:
          PBReaderReadString();
          v37 = objc_claimAutoreleasedReturnValue();
          gesture = v5->_gesture;
          v5->_gesture = (NSString *)v37;

          continue;
        case 5u:
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v5->_hasGestureOn = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_70;
          continue;
      }
      while (1)
      {
        v42 = *v6;
        v43 = *(_QWORD *)&v4[v42];
        if (v43 == -1 || v43 >= *(_QWORD *)&v4[*v7])
          break;
        v44 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v43);
        *(_QWORD *)&v4[v42] = v43 + 1;
        v41 |= (unint64_t)(v44 & 0x7F) << v39;
        if ((v44 & 0x80) == 0)
          goto LABEL_64;
        v39 += 7;
        v16 = v40++ >= 9;
        if (v16)
        {
          v41 = 0;
          goto LABEL_66;
        }
      }
      v4[*v8] = 1;
LABEL_64:
      if (v4[*v8])
        v41 = 0;
LABEL_66:
      v45 = v41 != 0;
      v46 = 22;
LABEL_67:
      *((_BYTE *)&v5->super.super.isa + v46) = v45;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_70:
    v47 = 0;
  else
LABEL_71:
    v47 = v5;

  return v47;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasChildAccount)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasFirstUpdate)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasFromPill)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_gesture)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasGestureOn)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSystemSettingsPillOutcome writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSystemSettingsPillOutcome)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  BMSystemSettingsPillOutcome *v15;
  id v17;
  id *v18;
  uint64_t v19;
  id *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  id *v28;
  id v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id *v35;
  id *v36;
  id v37;
  id *v38;
  id v39;
  id v40;
  BMSystemSettingsPillOutcome *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("childAccount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstUpdate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          goto LABEL_20;
        }
        v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v35 = a4;
        v23 = *MEMORY[0x1E0D025B8];
        v48 = *MEMORY[0x1E0CB2D50];
        v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("firstUpdate"));
        v49 = v40;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v23, 2, v10);
        v15 = 0;
        a4 = 0;
        *v35 = v24;
        goto LABEL_19;
      }
      v38 = v9;
    }
    else
    {
      v38 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fromPill"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v8;
    v41 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v40 = 0;
          v15 = 0;
          a4 = v38;
          goto LABEL_19;
        }
        v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = *MEMORY[0x1E0D025B8];
        v46 = *MEMORY[0x1E0CB2D50];
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("fromPill"));
        v47 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 2, v11);
        v15 = 0;
        v40 = 0;
        v28 = a4;
        a4 = v38;
        *v28 = v27;
LABEL_18:

        self = v41;
        v8 = v39;
LABEL_19:

        goto LABEL_20;
      }
      v40 = v10;
    }
    else
    {
      v40 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gesture"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v12 = 0;
          v15 = 0;
          a4 = v38;
          goto LABEL_18;
        }
        v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v36 = a4;
        v30 = *MEMORY[0x1E0D025B8];
        v44 = *MEMORY[0x1E0CB2D50];
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("gesture"));
        v45 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v30, 2, v13);
        v15 = 0;
        v12 = 0;
        a4 = v38;
        *v36 = v31;
        goto LABEL_17;
      }
      v12 = v11;
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gestureOn"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v34 = *MEMORY[0x1E0D025B8];
          v42 = *MEMORY[0x1E0CB2D50];
          v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("gestureOn"));
          v43 = v32;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v34, 2, v33);

        }
        v14 = 0;
        v15 = 0;
        a4 = v38;
        goto LABEL_17;
      }
      v14 = v13;
    }
    else
    {
      v14 = 0;
    }
    a4 = v38;
    v15 = -[BMSystemSettingsPillOutcome initWithChildAccount:firstUpdate:fromPill:gesture:gestureOn:](v41, "initWithChildAccount:firstUpdate:fromPill:gesture:gestureOn:", v39, v38, v40, v12, v14);
    v41 = v15;
LABEL_17:

    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v15 = 0;
    v8 = 0;
    goto LABEL_21;
  }
  v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v18 = a4;
  v19 = *MEMORY[0x1E0D025B8];
  v50 = *MEMORY[0x1E0CB2D50];
  v20 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("childAccount"));
  v51[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19;
  a4 = v20;
  v15 = 0;
  v8 = 0;
  *v18 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v21, 2, v9);
LABEL_20:

LABEL_21:
  return v15;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  if (-[BMSystemSettingsPillOutcome hasChildAccount](self, "hasChildAccount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSystemSettingsPillOutcome childAccount](self, "childAccount"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (-[BMSystemSettingsPillOutcome hasFirstUpdate](self, "hasFirstUpdate"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSystemSettingsPillOutcome firstUpdate](self, "firstUpdate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (-[BMSystemSettingsPillOutcome hasFromPill](self, "hasFromPill"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSystemSettingsPillOutcome fromPill](self, "fromPill"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[BMSystemSettingsPillOutcome gesture](self, "gesture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSystemSettingsPillOutcome hasGestureOn](self, "hasGestureOn"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSystemSettingsPillOutcome gestureOn](self, "gestureOn"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v17 = CFSTR("childAccount");
  v8 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v15 = v8;
  v22[0] = v8;
  v18 = CFSTR("firstUpdate");
  v9 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v8, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v9;
  v19 = CFSTR("fromPill");
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v10;
  v20 = CFSTR("gesture");
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v11;
  v21 = CFSTR("gestureOn");
  v12 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
      goto LABEL_25;
  }
  else
  {

    if (v6)
    {
LABEL_25:
      if (v5)
        goto LABEL_26;
      goto LABEL_31;
    }
  }

  if (v5)
  {
LABEL_26:
    if (v4)
      goto LABEL_27;
LABEL_32:

    if (v3)
      goto LABEL_28;
LABEL_33:

    goto LABEL_28;
  }
LABEL_31:

  if (!v4)
    goto LABEL_32;
LABEL_27:
  if (!v3)
    goto LABEL_33;
LABEL_28:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  _BOOL4 v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMSystemSettingsPillOutcome hasChildAccount](self, "hasChildAccount")
      || objc_msgSend(v5, "hasChildAccount"))
    {
      if (!-[BMSystemSettingsPillOutcome hasChildAccount](self, "hasChildAccount"))
        goto LABEL_27;
      if (!objc_msgSend(v5, "hasChildAccount"))
        goto LABEL_27;
      v6 = -[BMSystemSettingsPillOutcome childAccount](self, "childAccount");
      if (v6 != objc_msgSend(v5, "childAccount"))
        goto LABEL_27;
    }
    if (-[BMSystemSettingsPillOutcome hasFirstUpdate](self, "hasFirstUpdate")
      || objc_msgSend(v5, "hasFirstUpdate"))
    {
      if (!-[BMSystemSettingsPillOutcome hasFirstUpdate](self, "hasFirstUpdate"))
        goto LABEL_27;
      if (!objc_msgSend(v5, "hasFirstUpdate"))
        goto LABEL_27;
      v7 = -[BMSystemSettingsPillOutcome firstUpdate](self, "firstUpdate");
      if (v7 != objc_msgSend(v5, "firstUpdate"))
        goto LABEL_27;
    }
    if (-[BMSystemSettingsPillOutcome hasFromPill](self, "hasFromPill")
      || objc_msgSend(v5, "hasFromPill"))
    {
      if (!-[BMSystemSettingsPillOutcome hasFromPill](self, "hasFromPill"))
        goto LABEL_27;
      if (!objc_msgSend(v5, "hasFromPill"))
        goto LABEL_27;
      v8 = -[BMSystemSettingsPillOutcome fromPill](self, "fromPill");
      if (v8 != objc_msgSend(v5, "fromPill"))
        goto LABEL_27;
    }
    -[BMSystemSettingsPillOutcome gesture](self, "gesture");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "gesture");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v9 == (void *)v10)
    {

    }
    else
    {
      v11 = (void *)v10;
      -[BMSystemSettingsPillOutcome gesture](self, "gesture");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "gesture");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (!v14)
        goto LABEL_27;
    }
    if (!-[BMSystemSettingsPillOutcome hasGestureOn](self, "hasGestureOn")
      && !objc_msgSend(v5, "hasGestureOn"))
    {
      LOBYTE(v15) = 1;
      goto LABEL_28;
    }
    if (-[BMSystemSettingsPillOutcome hasGestureOn](self, "hasGestureOn")
      && objc_msgSend(v5, "hasGestureOn"))
    {
      v16 = -[BMSystemSettingsPillOutcome gestureOn](self, "gestureOn");
      v15 = v16 ^ objc_msgSend(v5, "gestureOn") ^ 1;
LABEL_28:

      goto LABEL_29;
    }
LABEL_27:
    LOBYTE(v15) = 0;
    goto LABEL_28;
  }
  LOBYTE(v15) = 0;
LABEL_29:

  return v15;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)childAccount
{
  return self->_childAccount;
}

- (BOOL)hasChildAccount
{
  return self->_hasChildAccount;
}

- (void)setHasChildAccount:(BOOL)a3
{
  self->_hasChildAccount = a3;
}

- (BOOL)firstUpdate
{
  return self->_firstUpdate;
}

- (BOOL)hasFirstUpdate
{
  return self->_hasFirstUpdate;
}

- (void)setHasFirstUpdate:(BOOL)a3
{
  self->_hasFirstUpdate = a3;
}

- (BOOL)fromPill
{
  return self->_fromPill;
}

- (BOOL)hasFromPill
{
  return self->_hasFromPill;
}

- (void)setHasFromPill:(BOOL)a3
{
  self->_hasFromPill = a3;
}

- (NSString)gesture
{
  return self->_gesture;
}

- (BOOL)gestureOn
{
  return self->_gestureOn;
}

- (BOOL)hasGestureOn
{
  return self->_hasGestureOn;
}

- (void)setHasGestureOn:(BOOL)a3
{
  self->_hasGestureOn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gesture, 0);
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

    v4 = -[BMSystemSettingsPillOutcome initByReadFrom:]([BMSystemSettingsPillOutcome alloc], "initByReadFrom:", v7);
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
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("childAccount"), 0, 0, 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("firstUpdate"), 0, 0, 2, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("fromPill"), 0, 0, 3, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("gesture"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("gestureOn"), 0, 0, 5, 12, 0);
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1EF58;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("childAccount"), 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("firstUpdate"), 2, 12, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("fromPill"), 3, 12, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("gesture"), 4, 13, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("gestureOn"), 5, 12, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
