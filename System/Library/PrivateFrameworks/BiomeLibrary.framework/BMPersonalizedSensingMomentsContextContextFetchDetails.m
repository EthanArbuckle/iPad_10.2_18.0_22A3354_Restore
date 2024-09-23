@implementation BMPersonalizedSensingMomentsContextContextFetchDetails

- (BMPersonalizedSensingMomentsContextContextFetchDetails)initWithFetchId:(id)a3 timestamp:(id)a4 clientBundleIdentifier:(id)a5 alternateClientIdentifier:(id)a6 totalContextReplyCount:(id)a7 batchContextReplyStartIndex:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BMPersonalizedSensingMomentsContextContextFetchDetails *v20;
  unsigned int v21;
  double v22;
  unsigned int v23;
  unsigned int v24;
  objc_super v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v26.receiver = self;
  v26.super_class = (Class)BMPersonalizedSensingMomentsContextContextFetchDetails;
  v20 = -[BMEventBase init](&v26, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v14)
    {
      v20->_hasFetchId = 1;
      v21 = objc_msgSend(v14, "unsignedIntValue");
    }
    else
    {
      v21 = 0;
      v20->_hasFetchId = 0;
    }
    v20->_fetchId = v21;
    if (v15)
    {
      v20->_hasRaw_timestamp = 1;
      objc_msgSend(v15, "timeIntervalSince1970");
    }
    else
    {
      v20->_hasRaw_timestamp = 0;
      v22 = -1.0;
    }
    v20->_raw_timestamp = v22;
    objc_storeStrong((id *)&v20->_clientBundleIdentifier, a5);
    objc_storeStrong((id *)&v20->_alternateClientIdentifier, a6);
    if (v18)
    {
      v20->_hasTotalContextReplyCount = 1;
      v23 = objc_msgSend(v18, "unsignedIntValue");
    }
    else
    {
      v23 = 0;
      v20->_hasTotalContextReplyCount = 0;
    }
    v20->_totalContextReplyCount = v23;
    if (v19)
    {
      v20->_hasBatchContextReplyStartIndex = 1;
      v24 = objc_msgSend(v19, "unsignedIntValue");
    }
    else
    {
      v24 = 0;
      v20->_hasBatchContextReplyStartIndex = 0;
    }
    v20->_batchContextReplyStartIndex = v24;
  }

  return v20;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextContextFetchDetails fetchId](self, "fetchId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPersonalizedSensingMomentsContextContextFetchDetails timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPersonalizedSensingMomentsContextContextFetchDetails clientBundleIdentifier](self, "clientBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPersonalizedSensingMomentsContextContextFetchDetails alternateClientIdentifier](self, "alternateClientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextContextFetchDetails totalContextReplyCount](self, "totalContextReplyCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextContextFetchDetails batchContextReplyStartIndex](self, "batchContextReplyStartIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMPersonalizedSensingMomentsContextContextFetchDetails with fetchId: %@, timestamp: %@, clientBundleIdentifier: %@, alternateClientIdentifier: %@, totalContextReplyCount: %@, batchContextReplyStartIndex: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMPersonalizedSensingMomentsContextContextFetchDetails *v5;
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
  uint64_t v30;
  uint64_t v31;
  void *v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  uint64_t v45;
  BMPersonalizedSensingMomentsContextContextFetchDetails *v46;
  objc_super v48;

  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)BMPersonalizedSensingMomentsContextContextFetchDetails;
  v5 = -[BMEventBase init](&v48, sel_init);
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
          v5->_hasFetchId = 1;
          while (1)
          {
            v23 = *v6;
            v24 = *(_QWORD *)&v4[v23];
            v25 = v24 + 1;
            if (v24 == -1 || v25 > *(_QWORD *)&v4[*v7])
              break;
            v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v24);
            *(_QWORD *)&v4[v23] = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0)
              goto LABEL_50;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_52;
            }
          }
          v4[*v8] = 1;
LABEL_50:
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_52:
          v45 = 40;
          goto LABEL_61;
        case 2u:
          v5->_hasRaw_timestamp = 1;
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
          v5->_raw_timestamp = v29;
          continue;
        case 3u:
          PBReaderReadString();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = 56;
          goto LABEL_34;
        case 4u:
          PBReaderReadString();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = 64;
LABEL_34:
          v32 = *(Class *)((char *)&v5->super.super.isa + v31);
          *(Class *)((char *)&v5->super.super.isa + v31) = (Class)v30;

          continue;
        case 5u:
          v33 = 0;
          v34 = 0;
          v22 = 0;
          v5->_hasTotalContextReplyCount = 1;
          while (2)
          {
            v35 = *v6;
            v36 = *(_QWORD *)&v4[v35];
            v37 = v36 + 1;
            if (v36 == -1 || v37 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v36);
              *(_QWORD *)&v4[v35] = v37;
              v22 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                v17 = v34++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_56:
          v45 = 44;
          goto LABEL_61;
        case 6u:
          v39 = 0;
          v40 = 0;
          v22 = 0;
          v5->_hasBatchContextReplyStartIndex = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_66;
          continue;
      }
      while (1)
      {
        v41 = *v6;
        v42 = *(_QWORD *)&v4[v41];
        v43 = v42 + 1;
        if (v42 == -1 || v43 > *(_QWORD *)&v4[*v7])
          break;
        v44 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v42);
        *(_QWORD *)&v4[v41] = v43;
        v22 |= (unint64_t)(v44 & 0x7F) << v39;
        if ((v44 & 0x80) == 0)
          goto LABEL_58;
        v39 += 7;
        v17 = v40++ >= 9;
        if (v17)
        {
          LODWORD(v22) = 0;
          goto LABEL_60;
        }
      }
      v4[*v8] = 1;
LABEL_58:
      if (v4[*v8])
        LODWORD(v22) = 0;
LABEL_60:
      v45 = 48;
LABEL_61:
      *(_DWORD *)((char *)&v5->super.super.isa + v45) = v22;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_66:
    v46 = 0;
  else
LABEL_67:
    v46 = v5;

  return v46;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasFetchId)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasRaw_timestamp)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_clientBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_alternateClientIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasTotalContextReplyCount)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasBatchContextReplyStartIndex)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMPersonalizedSensingMomentsContextContextFetchDetails writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMPersonalizedSensingMomentsContextContextFetchDetails)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_class *v12;
  id *v13;
  id v14;
  id v15;
  double v16;
  double v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  BMPersonalizedSensingMomentsContextContextFetchDetails *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  BMPersonalizedSensingMomentsContextContextFetchDetails *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id *v44;
  id v45;
  id *v46;
  void *v47;
  void *v48;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id *v56;
  id *v57;
  id *v58;
  id v59;
  id v60;
  id *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  id *v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  _QWORD v79[3];

  v79[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fetchId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v9 = objc_claimAutoreleasedReturnValue();
    v65 = (void *)v9;
    if (v9 && (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = (objc_class *)MEMORY[0x1E0C99D68];
        v13 = a4;
        v14 = v10;
        v15 = [v12 alloc];
        objc_msgSend(v14, "doubleValue");
        v17 = v16;

        a4 = v13;
        v18 = (id)objc_msgSend(v15, "initWithTimeIntervalSince1970:", v17);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v25 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v25, "dateFromString:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v11 = 0;
            v24 = 0;
            goto LABEL_51;
          }
          v61 = a4;
          v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v51 = *MEMORY[0x1E0D025B8];
          v76 = *MEMORY[0x1E0CB2D50];
          v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("timestamp"));
          v77 = v28;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
          v52 = objc_claimAutoreleasedReturnValue();
          v53 = v51;
          v27 = (void *)v52;
          v11 = 0;
          v24 = 0;
          *v61 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v53, 2, v52);
          goto LABEL_50;
        }
        v18 = v10;
      }
      v11 = v18;
    }
    else
    {
      v11 = 0;
    }
LABEL_16:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientBundleIdentifier"));
    v26 = objc_claimAutoreleasedReturnValue();
    v67 = v8;
    v64 = (void *)v26;
    if (v26 && (v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v24 = 0;
          v28 = 0;
          goto LABEL_50;
        }
        v57 = a4;
        v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v37 = *MEMORY[0x1E0D025B8];
        v74 = *MEMORY[0x1E0CB2D50];
        v66 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("clientBundleIdentifier"));
        v75 = v66;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0;
        *v57 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v37, 2, v29);
        v28 = 0;
LABEL_49:

        v8 = v67;
        v27 = v64;
LABEL_50:

        v10 = v65;
        goto LABEL_51;
      }
      v28 = v27;
    }
    else
    {
      v28 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("alternateClientIdentifier"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v66 = 0;
          v24 = 0;
          goto LABEL_49;
        }
        v58 = a4;
        v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v39 = v28;
        v40 = v11;
        v41 = *MEMORY[0x1E0D025B8];
        v72 = *MEMORY[0x1E0CB2D50];
        v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("alternateClientIdentifier"));
        v73 = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v41;
        v11 = v40;
        v28 = v39;
        v24 = 0;
        v66 = 0;
        *v58 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v42, 2, v30);
        goto LABEL_48;
      }
      v66 = v29;
    }
    else
    {
      v66 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalContextReplyCount"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v28;
    v63 = v7;
    if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v33 = 0;
          v24 = 0;
          goto LABEL_48;
        }
        v32 = self;
        v59 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v43 = *MEMORY[0x1E0D025B8];
        v70 = *MEMORY[0x1E0CB2D50];
        v31 = v11;
        v44 = a4;
        a4 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("totalContextReplyCount"));
        v71 = a4;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v43, 2, v34);
        v24 = 0;
        v33 = 0;
        *v44 = v45;
        goto LABEL_46;
      }
      v31 = v11;
      v32 = self;
      v33 = v30;
    }
    else
    {
      v31 = v11;
      v32 = self;
      v33 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("batchContextReplyStartIndex"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v34 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      a4 = 0;
LABEL_28:
      v11 = v31;
      v35 = v31;
      v28 = v62;
      v24 = -[BMPersonalizedSensingMomentsContextContextFetchDetails initWithFetchId:timestamp:clientBundleIdentifier:alternateClientIdentifier:totalContextReplyCount:batchContextReplyStartIndex:](v32, "initWithFetchId:timestamp:clientBundleIdentifier:alternateClientIdentifier:totalContextReplyCount:batchContextReplyStartIndex:", v67, v35, v62, v66, v33, a4);
      v32 = v24;
LABEL_47:

      self = v32;
      v7 = v63;
LABEL_48:

      goto LABEL_49;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      a4 = v34;
      goto LABEL_28;
    }
    if (a4)
    {
      v60 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v55 = *MEMORY[0x1E0D025B8];
      v68 = *MEMORY[0x1E0CB2D50];
      v46 = a4;
      v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("batchContextReplyStartIndex"));
      v69 = v47;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *v46 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v55, 2, v48);

      a4 = 0;
    }
    v24 = 0;
LABEL_46:
    v11 = v31;
    v28 = v62;
    goto LABEL_47;
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
    v24 = 0;
    goto LABEL_52;
  }
  v56 = a4;
  v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v20 = *MEMORY[0x1E0D025B8];
  v78 = *MEMORY[0x1E0CB2D50];
  v21 = v7;
  v22 = objc_alloc(MEMORY[0x1E0CB3940]);
  v54 = objc_opt_class();
  v23 = v22;
  v7 = v21;
  v11 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v54, CFSTR("fetchId"));
  v79[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, &v78, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v24 = 0;
  *v56 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 2, v10);
LABEL_51:

LABEL_52:
  return v24;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
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
  if (-[BMPersonalizedSensingMomentsContextContextFetchDetails hasFetchId](self, "hasFetchId"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextContextFetchDetails fetchId](self, "fetchId"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[BMPersonalizedSensingMomentsContextContextFetchDetails timestamp](self, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMPersonalizedSensingMomentsContextContextFetchDetails timestamp](self, "timestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  -[BMPersonalizedSensingMomentsContextContextFetchDetails clientBundleIdentifier](self, "clientBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPersonalizedSensingMomentsContextContextFetchDetails alternateClientIdentifier](self, "alternateClientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMPersonalizedSensingMomentsContextContextFetchDetails hasTotalContextReplyCount](self, "hasTotalContextReplyCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextContextFetchDetails totalContextReplyCount](self, "totalContextReplyCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (-[BMPersonalizedSensingMomentsContextContextFetchDetails hasBatchContextReplyStartIndex](self, "hasBatchContextReplyStartIndex"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextContextFetchDetails batchContextReplyStartIndex](self, "batchContextReplyStartIndex"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v23 = (void *)v3;
  v24[0] = CFSTR("fetchId");
  v12 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v20 = v12;
  v22 = (void *)v7;
  v25[0] = v12;
  v24[1] = CFSTR("timestamp");
  v13 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[1] = v13;
  v24[2] = CFSTR("clientBundleIdentifier");
  v14 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[2] = v14;
  v24[3] = CFSTR("alternateClientIdentifier");
  v15 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[3] = v15;
  v24[4] = CFSTR("totalContextReplyCount");
  v16 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[4] = v16;
  v24[5] = CFSTR("batchContextReplyStartIndex");
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
      goto LABEL_27;
  }
  else
  {

    if (v10)
    {
LABEL_27:
      if (v9)
        goto LABEL_28;
LABEL_36:

      if (v8)
        goto LABEL_29;
      goto LABEL_37;
    }
  }

  if (!v9)
    goto LABEL_36;
LABEL_28:
  if (v8)
    goto LABEL_29;
LABEL_37:

LABEL_29:
  if (!v22)

  if (!v23)
  return v18;
}

- (NSDate)timestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_timestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_timestamp);
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
  unsigned int v6;
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
  unsigned int v26;
  unsigned int v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMPersonalizedSensingMomentsContextContextFetchDetails hasFetchId](self, "hasFetchId")
      || objc_msgSend(v5, "hasFetchId"))
    {
      if (!-[BMPersonalizedSensingMomentsContextContextFetchDetails hasFetchId](self, "hasFetchId"))
        goto LABEL_30;
      if (!objc_msgSend(v5, "hasFetchId"))
        goto LABEL_30;
      v6 = -[BMPersonalizedSensingMomentsContextContextFetchDetails fetchId](self, "fetchId");
      if (v6 != objc_msgSend(v5, "fetchId"))
        goto LABEL_30;
    }
    -[BMPersonalizedSensingMomentsContextContextFetchDetails timestamp](self, "timestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timestamp");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[BMPersonalizedSensingMomentsContextContextFetchDetails timestamp](self, "timestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timestamp");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_30;
    }
    -[BMPersonalizedSensingMomentsContextContextFetchDetails clientBundleIdentifier](self, "clientBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientBundleIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[BMPersonalizedSensingMomentsContextContextFetchDetails clientBundleIdentifier](self, "clientBundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientBundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_30;
    }
    -[BMPersonalizedSensingMomentsContextContextFetchDetails alternateClientIdentifier](self, "alternateClientIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alternateClientIdentifier");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v21)
    {

    }
    else
    {
      v22 = (void *)v21;
      -[BMPersonalizedSensingMomentsContextContextFetchDetails alternateClientIdentifier](self, "alternateClientIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "alternateClientIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      if (!v25)
        goto LABEL_30;
    }
    if (!-[BMPersonalizedSensingMomentsContextContextFetchDetails hasTotalContextReplyCount](self, "hasTotalContextReplyCount")&& !objc_msgSend(v5, "hasTotalContextReplyCount")|| -[BMPersonalizedSensingMomentsContextContextFetchDetails hasTotalContextReplyCount](self, "hasTotalContextReplyCount")&& objc_msgSend(v5, "hasTotalContextReplyCount")&& (v26 = -[BMPersonalizedSensingMomentsContextContextFetchDetails totalContextReplyCount](self, "totalContextReplyCount"), v26 == objc_msgSend(v5, "totalContextReplyCount")))
    {
      if (!-[BMPersonalizedSensingMomentsContextContextFetchDetails hasBatchContextReplyStartIndex](self, "hasBatchContextReplyStartIndex")&& !objc_msgSend(v5, "hasBatchContextReplyStartIndex"))
      {
        v13 = 1;
        goto LABEL_31;
      }
      if (-[BMPersonalizedSensingMomentsContextContextFetchDetails hasBatchContextReplyStartIndex](self, "hasBatchContextReplyStartIndex")&& objc_msgSend(v5, "hasBatchContextReplyStartIndex"))
      {
        v27 = -[BMPersonalizedSensingMomentsContextContextFetchDetails batchContextReplyStartIndex](self, "batchContextReplyStartIndex");
        v13 = v27 == objc_msgSend(v5, "batchContextReplyStartIndex");
LABEL_31:

        goto LABEL_32;
      }
    }
LABEL_30:
    v13 = 0;
    goto LABEL_31;
  }
  v13 = 0;
LABEL_32:

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (unsigned)fetchId
{
  return self->_fetchId;
}

- (BOOL)hasFetchId
{
  return self->_hasFetchId;
}

- (void)setHasFetchId:(BOOL)a3
{
  self->_hasFetchId = a3;
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (NSString)alternateClientIdentifier
{
  return self->_alternateClientIdentifier;
}

- (unsigned)totalContextReplyCount
{
  return self->_totalContextReplyCount;
}

- (BOOL)hasTotalContextReplyCount
{
  return self->_hasTotalContextReplyCount;
}

- (void)setHasTotalContextReplyCount:(BOOL)a3
{
  self->_hasTotalContextReplyCount = a3;
}

- (unsigned)batchContextReplyStartIndex
{
  return self->_batchContextReplyStartIndex;
}

- (BOOL)hasBatchContextReplyStartIndex
{
  return self->_hasBatchContextReplyStartIndex;
}

- (void)setHasBatchContextReplyStartIndex:(BOOL)a3
{
  self->_hasBatchContextReplyStartIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateClientIdentifier, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
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

    v4 = -[BMPersonalizedSensingMomentsContextContextFetchDetails initByReadFrom:]([BMPersonalizedSensingMomentsContextContextFetchDetails alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("fetchId"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("timestamp"), 3, 0, 2, 0, 2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientBundleIdentifier"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("alternateClientIdentifier"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("totalContextReplyCount"), 0, 0, 5, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("batchContextReplyStartIndex"), 0, 0, 6, 4, 0);
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
  return &unk_1E5F1F420;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("fetchId"), 1, 4, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timestamp"), 2, 0, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientBundleIdentifier"), 3, 13, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("alternateClientIdentifier"), 4, 13, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("totalContextReplyCount"), 5, 4, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("batchContextReplyStartIndex"), 6, 4, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
