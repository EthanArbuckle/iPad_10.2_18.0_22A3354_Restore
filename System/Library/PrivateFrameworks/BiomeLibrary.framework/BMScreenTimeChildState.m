@implementation BMScreenTimeChildState

- (BMScreenTimeChildState)initWithStarting:(id)a3 eventID:(id)a4 signalDate:(id)a5 userDSID:(id)a6 state:(int)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  BMScreenTimeChildState *v16;
  double v17;
  objc_super v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)BMScreenTimeChildState;
  v16 = -[BMEventBase init](&v19, sel_init);
  if (v16)
  {
    v16->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v12)
    {
      v16->_hasStarting = 1;
      v16->_starting = objc_msgSend(v12, "BOOLValue");
    }
    else
    {
      v16->_hasStarting = 0;
      v16->_starting = 0;
    }
    objc_storeStrong((id *)&v16->_eventID, a4);
    if (v14)
    {
      v16->_hasRaw_signalDate = 1;
      objc_msgSend(v14, "timeIntervalSince1970");
    }
    else
    {
      v16->_hasRaw_signalDate = 0;
      v17 = -1.0;
    }
    v16->_raw_signalDate = v17;
    objc_storeStrong((id *)&v16->_userDSID, a6);
    v16->_state = a7;
  }

  return v16;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMScreenTimeChildState starting](self, "starting"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMScreenTimeChildState eventID](self, "eventID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMScreenTimeChildState signalDate](self, "signalDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMScreenTimeChildState userDSID](self, "userDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BMScreenTimeChildStateScreenTimeChildStateKindAsString(-[BMScreenTimeChildState state](self, "state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMScreenTimeChildState with starting: %@, eventID: %@, signalDate: %@, userDSID: %@, state: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMScreenTimeChildState *v5;
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
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  double v31;
  void *v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  BMScreenTimeChildState *v40;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BMScreenTimeChildState;
  v5 = -[BMEventBase init](&v42, sel_init);
  if (!v5)
    goto LABEL_57;
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
                  goto LABEL_45;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v22 = 0;
LABEL_45:
          v5->_starting = v22 != 0;
          continue;
        case 2u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 48;
          goto LABEL_34;
        case 3u:
          v5->_hasRaw_signalDate = 1;
          v29 = *v6;
          v30 = *(_QWORD *)&v4[v29];
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(double *)(*(_QWORD *)&v4[*v9] + v30);
            *(_QWORD *)&v4[v29] = v30 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0.0;
          }
          v5->_raw_signalDate = v31;
          continue;
        case 4u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 56;
LABEL_34:
          v32 = *(Class *)((char *)&v5->super.super.isa + v28);
          *(Class *)((char *)&v5->super.super.isa + v28) = (Class)v27;

          continue;
        case 5u:
          v33 = 0;
          v34 = 0;
          v35 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_56;
          continue;
      }
      while (1)
      {
        v36 = *v6;
        v37 = *(_QWORD *)&v4[v36];
        v38 = v37 + 1;
        if (v37 == -1 || v38 > *(_QWORD *)&v4[*v7])
          break;
        v39 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v37);
        *(_QWORD *)&v4[v36] = v38;
        v35 |= (unint64_t)(v39 & 0x7F) << v33;
        if ((v39 & 0x80) == 0)
          goto LABEL_47;
        v33 += 7;
        v17 = v34++ >= 9;
        if (v17)
        {
          LODWORD(v35) = 0;
          goto LABEL_49;
        }
      }
      v4[*v8] = 1;
LABEL_47:
      if (v4[*v8])
        LODWORD(v35) = 0;
LABEL_49:
      if (v35 >= 3)
        LODWORD(v35) = 0;
      v5->_state = v35;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_56:
    v40 = 0;
  else
LABEL_57:
    v40 = v5;

  return v40;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasStarting)
    PBDataWriterWriteBOOLField();
  if (self->_eventID)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_signalDate)
    PBDataWriterWriteDoubleField();
  if (self->_userDSID)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMScreenTimeChildState writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMScreenTimeChildState)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  id v11;
  id v12;
  double v13;
  double v14;
  id *v15;
  id v16;
  uint64_t v17;
  BMScreenTimeChildState *v18;
  id v19;
  uint64_t v20;
  id *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  id *v36;
  uint64_t v37;
  id v38;
  id v39;
  id *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  id *v51;
  uint64_t v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("starting"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v43 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v42 = 0;
          v18 = 0;
          goto LABEL_42;
        }
        v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v20 = *MEMORY[0x1E0D025B8];
        v50 = *MEMORY[0x1E0CB2D50];
        v21 = a4;
        a4 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("eventID"));
        v51 = a4;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0;
        v18 = 0;
        *v21 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 2, v9);
        goto LABEL_41;
      }
      v42 = v8;
    }
    else
    {
      v42 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("signalDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = a4;
    v41 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = (objc_class *)MEMORY[0x1E0C99D68];
        v11 = v9;
        v12 = [v10 alloc];
        objc_msgSend(v11, "doubleValue");
        v14 = v13;

        v15 = (id *)objc_msgSend(v12, "initWithTimeIntervalSince1970:", v14);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v22 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v22, "dateFromString:", v9);
          a4 = (id *)objc_claimAutoreleasedReturnValue();

          goto LABEL_23;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v18 = 0;
            goto LABEL_41;
          }
          v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v34 = *MEMORY[0x1E0D025B8];
          v48 = *MEMORY[0x1E0CB2D50];
          v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("signalDate"));
          v49 = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v34, 2, v23);
          v36 = a4;
          a4 = 0;
          v18 = 0;
          *v36 = v35;
LABEL_40:

          v7 = v41;
LABEL_41:

          goto LABEL_42;
        }
        v15 = v9;
      }
      a4 = v15;
    }
    else
    {
      a4 = 0;
    }
LABEL_23:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userDSID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v40)
        {
          v24 = 0;
          v18 = 0;
          goto LABEL_40;
        }
        v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v28 = *MEMORY[0x1E0D025B8];
        v46 = *MEMORY[0x1E0CB2D50];
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("userDSID"));
        v47 = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v28, 2, v25);
        v24 = 0;
        v18 = 0;
        *v40 = v29;
        goto LABEL_39;
      }
      v24 = v23;
    }
    else
    {
      v24 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("state"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = v25;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v40)
          {
            v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v37 = *MEMORY[0x1E0D025B8];
            v44 = *MEMORY[0x1E0CB2D50];
            v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("state"));
            v45 = v31;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *v40 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v37, 2, v32);

          }
          v26 = 0;
          v18 = 0;
          goto LABEL_39;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMScreenTimeChildStateScreenTimeChildStateKindFromString(v25));
        v27 = (id)objc_claimAutoreleasedReturnValue();
      }
      v26 = v27;
    }
    else
    {
      v26 = 0;
    }
    v18 = -[BMScreenTimeChildState initWithStarting:eventID:signalDate:userDSID:state:](self, "initWithStarting:eventID:signalDate:userDSID:state:", v43, v42, a4, v24, objc_msgSend(v26, "intValue"));
    self = v18;
LABEL_39:

    goto LABEL_40;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v43 = 0;
    v18 = 0;
    goto LABEL_43;
  }
  v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v17 = *MEMORY[0x1E0D025B8];
  v52 = *MEMORY[0x1E0CB2D50];
  v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("starting"));
  v53[0] = v42;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v18 = 0;
  *a4 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, 2, v8);
LABEL_42:

LABEL_43:
  return v18;
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
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  if (-[BMScreenTimeChildState hasStarting](self, "hasStarting"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMScreenTimeChildState starting](self, "starting"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[BMScreenTimeChildState eventID](self, "eventID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMScreenTimeChildState signalDate](self, "signalDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMScreenTimeChildState signalDate](self, "signalDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    objc_msgSend(v6, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  -[BMScreenTimeChildState userDSID](self, "userDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMScreenTimeChildState state](self, "state"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = CFSTR("starting");
  v11 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v18 = v11;
  v25[0] = v11;
  v21 = CFSTR("eventID");
  v12 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v11, v20, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[1] = v12;
  v22 = CFSTR("signalDate");
  v13 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[2] = v13;
  v23 = CFSTR("userDSID");
  v14 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[3] = v14;
  v24 = CFSTR("state");
  v15 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[4] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v20, 5, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
      goto LABEL_19;
  }
  else
  {

    if (v9)
    {
LABEL_19:
      if (v8)
        goto LABEL_20;
      goto LABEL_25;
    }
  }

  if (v8)
  {
LABEL_20:
    if (v4)
      goto LABEL_21;
LABEL_26:

    if (v3)
      goto LABEL_22;
LABEL_27:

    goto LABEL_22;
  }
LABEL_25:

  if (!v4)
    goto LABEL_26;
LABEL_21:
  if (!v3)
    goto LABEL_27;
LABEL_22:

  return v16;
}

- (NSDate)signalDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_signalDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_signalDate);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
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
  int v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMScreenTimeChildState hasStarting](self, "hasStarting") || objc_msgSend(v5, "hasStarting"))
    {
      if (!-[BMScreenTimeChildState hasStarting](self, "hasStarting"))
        goto LABEL_18;
      if (!objc_msgSend(v5, "hasStarting"))
        goto LABEL_18;
      v6 = -[BMScreenTimeChildState starting](self, "starting");
      if (v6 != objc_msgSend(v5, "starting"))
        goto LABEL_18;
    }
    -[BMScreenTimeChildState eventID](self, "eventID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventID");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[BMScreenTimeChildState eventID](self, "eventID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_18;
    }
    -[BMScreenTimeChildState signalDate](self, "signalDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "signalDate");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[BMScreenTimeChildState signalDate](self, "signalDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "signalDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_18;
    }
    -[BMScreenTimeChildState userDSID](self, "userDSID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userDSID");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v21)
    {

    }
    else
    {
      v22 = (void *)v21;
      -[BMScreenTimeChildState userDSID](self, "userDSID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userDSID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      if (!v25)
      {
LABEL_18:
        v13 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    v27 = -[BMScreenTimeChildState state](self, "state");
    v13 = v27 == objc_msgSend(v5, "state");
    goto LABEL_19;
  }
  v13 = 0;
LABEL_20:

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

- (NSString)eventID
{
  return self->_eventID;
}

- (NSString)userDSID
{
  return self->_userDSID;
}

- (int)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDSID, 0);
  objc_storeStrong((id *)&self->_eventID, 0);
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

    v4 = -[BMScreenTimeChildState initByReadFrom:]([BMScreenTimeChildState alloc], "initByReadFrom:", v7);
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
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("starting"), 0, 0, 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("signalDate"), 3, 0, 3, 0, 2);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userDSID"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("state"), 0, 0, 5, 4, 0);
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
  return &unk_1E5F1C840;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("starting"), 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventID"), 2, 13, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("signalDate"), 3, 0, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userDSID"), 4, 13, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("state"), 5, 4, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
