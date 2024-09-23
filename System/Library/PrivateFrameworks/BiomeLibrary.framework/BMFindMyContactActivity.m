@implementation BMFindMyContactActivity

- (BMFindMyContactActivity)initWithHandle:(id)a3 actionType:(int)a4 eventTimestampBegin:(id)a5 eventTimestampEnd:(id)a6 bundleID:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMFindMyContactActivity *v17;
  double v18;
  double v19;
  objc_super v21;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)BMFindMyContactActivity;
  v17 = -[BMEventBase init](&v21, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v17->_handle, a3);
    v17->_actionType = a4;
    if (v14)
    {
      v17->_hasRaw_eventTimestampBegin = 1;
      objc_msgSend(v14, "timeIntervalSince1970");
    }
    else
    {
      v17->_hasRaw_eventTimestampBegin = 0;
      v18 = -1.0;
    }
    v17->_raw_eventTimestampBegin = v18;
    if (v15)
    {
      v17->_hasRaw_eventTimestampEnd = 1;
      objc_msgSend(v15, "timeIntervalSince1970");
    }
    else
    {
      v17->_hasRaw_eventTimestampEnd = 0;
      v19 = -1.0;
    }
    v17->_raw_eventTimestampEnd = v19;
    objc_storeStrong((id *)&v17->_bundleID, a7);
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
  -[BMFindMyContactActivity handle](self, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMFindMyContactActivityEventTypeAsString(-[BMFindMyContactActivity actionType](self, "actionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFindMyContactActivity eventTimestampBegin](self, "eventTimestampBegin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFindMyContactActivity eventTimestampEnd](self, "eventTimestampEnd");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFindMyContactActivity bundleID](self, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMFindMyContactActivity with handle: %@, actionType: %@, eventTimestampBegin: %@, eventTimestampEnd: %@, bundleID: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMFindMyContactActivity *v5;
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
  uint64_t v20;
  uint64_t v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  unint64_t v30;
  objc_class *v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  BMFindMyContactActivity *v36;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BMFindMyContactActivity;
  v5 = -[BMEventBase init](&v38, sel_init);
  if (!v5)
    goto LABEL_52;
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
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 56;
          goto LABEL_37;
        case 2u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          break;
        case 3u:
          v5->_hasRaw_eventTimestampBegin = 1;
          v29 = *v6;
          v30 = *(_QWORD *)&v4[v29];
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v30);
            *(_QWORD *)&v4[v29] = v30 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v35 = 24;
          goto LABEL_48;
        case 4u:
          v5->_hasRaw_eventTimestampEnd = 1;
          v32 = *v6;
          v33 = *(_QWORD *)&v4[v32];
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v33);
            *(_QWORD *)&v4[v32] = v33 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v35 = 40;
LABEL_48:
          *(Class *)((char *)&v5->super.super.isa + v35) = v31;
          continue;
        case 5u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 64;
LABEL_37:
          v34 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_51;
          continue;
      }
      while (1)
      {
        v25 = *v6;
        v26 = *(_QWORD *)&v4[v25];
        v27 = v26 + 1;
        if (v26 == -1 || v27 > *(_QWORD *)&v4[*v7])
          break;
        v28 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v26);
        *(_QWORD *)&v4[v25] = v27;
        v24 |= (unint64_t)(v28 & 0x7F) << v22;
        if ((v28 & 0x80) == 0)
          goto LABEL_39;
        v22 += 7;
        v17 = v23++ >= 9;
        if (v17)
        {
          LODWORD(v24) = 0;
          goto LABEL_41;
        }
      }
      v4[*v8] = 1;
LABEL_39:
      if (v4[*v8])
        LODWORD(v24) = 0;
LABEL_41:
      if (v24 >= 4)
        LODWORD(v24) = 0;
      v5->_actionType = v24;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_51:
    v36 = 0;
  else
LABEL_52:
    v36 = v5;

  return v36;
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (self->_handle)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_hasRaw_eventTimestampBegin)
    PBDataWriterWriteDoubleField();
  if (self->_hasRaw_eventTimestampEnd)
    PBDataWriterWriteDoubleField();
  v4 = v5;
  if (self->_bundleID)
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
  -[BMFindMyContactActivity writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMFindMyContactActivity)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  BMFindMyContactActivity *v12;
  void *v13;
  objc_class *v14;
  id v15;
  id v16;
  double v17;
  double v18;
  id *v19;
  id v20;
  void *v21;
  void *v22;
  objc_class *v23;
  id v24;
  id v25;
  double v26;
  double v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  id *v37;
  id v38;
  uint64_t v39;
  id v40;
  id *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  id *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id *v58;
  uint64_t v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("handle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v50 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("actionType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v49 = 0;
            v12 = 0;
            goto LABEL_39;
          }
          v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v36 = *MEMORY[0x1E0D025B8];
          v57 = *MEMORY[0x1E0CB2D50];
          v37 = a4;
          a4 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("actionType"));
          v58 = a4;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = 0;
          v12 = 0;
          *v37 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v36, 2, v13);
          goto LABEL_38;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMFindMyContactActivityEventTypeFromString(v8));
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v49 = v9;
    }
    else
    {
      v49 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventTimestampBegin"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = a4;
    v48 = v7;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (objc_class *)MEMORY[0x1E0C99D68];
        v15 = v13;
        v16 = [v14 alloc];
        objc_msgSend(v15, "doubleValue");
        v18 = v17;

        v19 = (id *)objc_msgSend(v16, "initWithTimeIntervalSince1970:", v18);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v20, "dateFromString:", v13);
          a4 = (id *)objc_claimAutoreleasedReturnValue();

          goto LABEL_24;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v12 = 0;
            goto LABEL_38;
          }
          v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v39 = *MEMORY[0x1E0D025B8];
          v55 = *MEMORY[0x1E0CB2D50];
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("eventTimestampBegin"));
          v56 = v22;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v39, 2, v21);
          v41 = a4;
          a4 = 0;
          v12 = 0;
          *v41 = v40;
LABEL_37:

          v7 = v48;
LABEL_38:

          goto LABEL_39;
        }
        v19 = v13;
      }
      a4 = v19;
    }
    else
    {
      a4 = 0;
    }
LABEL_24:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventTimestampEnd"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = (objc_class *)MEMORY[0x1E0C99D68];
        v24 = v21;
        v25 = [v23 alloc];
        objc_msgSend(v24, "doubleValue");
        v27 = v26;

        v28 = (id)objc_msgSend(v25, "initWithTimeIntervalSince1970:", v27);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v29 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v29, "dateFromString:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_32;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v47)
          {
            v22 = 0;
            v12 = 0;
            goto LABEL_37;
          }
          v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v42 = *MEMORY[0x1E0D025B8];
          v53 = *MEMORY[0x1E0CB2D50];
          v31 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("eventTimestampEnd"));
          v54 = v31;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v42, 2, v30);
          v22 = 0;
          v12 = 0;
          *v47 = v43;
          goto LABEL_36;
        }
        v28 = v21;
      }
      v22 = v28;
    }
    else
    {
      v22 = 0;
    }
LABEL_32:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleID"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v47)
        {
          v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v44 = *MEMORY[0x1E0D025B8];
          v51 = *MEMORY[0x1E0CB2D50];
          v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleID"));
          v52 = v33;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *v47 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v44, 2, v34);

        }
        v31 = 0;
        v12 = 0;
        goto LABEL_36;
      }
      v31 = v30;
    }
    else
    {
      v31 = 0;
    }
    v12 = -[BMFindMyContactActivity initWithHandle:actionType:eventTimestampBegin:eventTimestampEnd:bundleID:](self, "initWithHandle:actionType:eventTimestampBegin:eventTimestampEnd:bundleID:", v50, objc_msgSend(v49, "intValue"), a4, v22, v31);
    self = v12;
LABEL_36:

    goto LABEL_37;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v50 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v50 = 0;
    v12 = 0;
    goto LABEL_40;
  }
  v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v11 = *MEMORY[0x1E0D025B8];
  v59 = *MEMORY[0x1E0CB2D50];
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("handle"));
  v60[0] = v49;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  v12 = 0;
  *a4 = (id)objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, 2, v8);
LABEL_39:

LABEL_40:
  return v12;
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
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  _QWORD v28[6];

  v28[5] = *MEMORY[0x1E0C80C00];
  -[BMFindMyContactActivity handle](self, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMFindMyContactActivity actionType](self, "actionType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFindMyContactActivity eventTimestampBegin](self, "eventTimestampBegin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMFindMyContactActivity eventTimestampBegin](self, "eventTimestampBegin");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    objc_msgSend(v6, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  -[BMFindMyContactActivity eventTimestampEnd](self, "eventTimestampEnd");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[BMFindMyContactActivity eventTimestampEnd](self, "eventTimestampEnd");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSince1970");
    objc_msgSend(v10, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  -[BMFindMyContactActivity bundleID](self, "bundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = CFSTR("handle");
  v14 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v21 = v14;
  v28[0] = v14;
  v24 = CFSTR("actionType");
  v15 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v14, v23, v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[1] = v15;
  v25 = CFSTR("eventTimestampBegin");
  v16 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[2] = v16;
  v26 = CFSTR("eventTimestampEnd");
  v17 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[3] = v17;
  v27 = CFSTR("bundleID");
  v18 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[4] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v23, 5, v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (v12)
      goto LABEL_19;
  }
  else
  {

    if (v12)
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

  return v19;
}

- (NSDate)eventTimestampBegin
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_eventTimestampBegin)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_eventTimestampBegin);
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

- (NSDate)eventTimestampEnd
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_eventTimestampEnd)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_eventTimestampEnd);
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
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  int v13;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMFindMyContactActivity handle](self, "handle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMFindMyContactActivity handle](self, "handle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_14;
    }
    v13 = -[BMFindMyContactActivity actionType](self, "actionType");
    if (v13 == objc_msgSend(v5, "actionType"))
    {
      -[BMFindMyContactActivity eventTimestampBegin](self, "eventTimestampBegin");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventTimestampBegin");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[BMFindMyContactActivity eventTimestampBegin](self, "eventTimestampBegin");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "eventTimestampBegin");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_14;
      }
      -[BMFindMyContactActivity eventTimestampEnd](self, "eventTimestampEnd");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventTimestampEnd");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[BMFindMyContactActivity eventTimestampEnd](self, "eventTimestampEnd");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "eventTimestampEnd");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_14;
      }
      -[BMFindMyContactActivity bundleID](self, "bundleID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27 == v28)
      {
        v12 = 1;
      }
      else
      {
        -[BMFindMyContactActivity bundleID](self, "bundleID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bundleID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v29, "isEqual:", v30);

      }
      goto LABEL_15;
    }
LABEL_14:
    v12 = 0;
LABEL_15:

    goto LABEL_16;
  }
  v12 = 0;
LABEL_16:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)handle
{
  return self->_handle;
}

- (int)actionType
{
  return self->_actionType;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_handle, 0);
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

    v4 = -[BMFindMyContactActivity initByReadFrom:]([BMFindMyContactActivity alloc], "initByReadFrom:", v7);
    v4[12] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("handle"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("actionType"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventTimestampBegin"), 3, 0, 3, 0, 2);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventTimestampEnd"), 3, 0, 4, 0, 2);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleID"), 2, 0, 5, 13, 0);
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
  return &unk_1E5F1D728;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("handle"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("actionType"), 2, 4, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventTimestampBegin"), 3, 0, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventTimestampEnd"), 4, 0, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleID"), 5, 13, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
