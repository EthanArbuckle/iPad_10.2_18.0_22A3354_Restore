@implementation BMHomeKitBase

- (BMHomeKitBase)initWithAbsoluteTimestamp:(id)a3 duration:(id)a4 homeUniqueIdentifier:(id)a5 homeOccupancy:(id)a6 source:(id)a7 clientName:(id)a8 eventCorrelationIdentifier:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BMHomeKitBase *v20;
  double v21;
  double v22;
  int v23;
  id v25;
  id v26;
  objc_super v27;

  v15 = a3;
  v16 = a4;
  v26 = a5;
  v17 = a6;
  v25 = a7;
  v18 = a8;
  v19 = a9;
  v27.receiver = self;
  v27.super_class = (Class)BMHomeKitBase;
  v20 = -[BMEventBase init](&v27, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v25, v26);
    if (v15)
    {
      v20->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v15, "timeIntervalSince1970");
    }
    else
    {
      v20->_hasRaw_absoluteTimestamp = 0;
      v21 = -1.0;
    }
    v20->_raw_absoluteTimestamp = v21;
    if (v16)
    {
      v20->_hasDuration = 1;
      objc_msgSend(v16, "doubleValue");
    }
    else
    {
      v20->_hasDuration = 0;
      v22 = -1.0;
    }
    v20->_duration = v22;
    objc_storeStrong((id *)&v20->_homeUniqueIdentifier, a5);
    if (v17)
    {
      v20->_hasHomeOccupancy = 1;
      v23 = objc_msgSend(v17, "intValue");
    }
    else
    {
      v20->_hasHomeOccupancy = 0;
      v23 = -1;
    }
    v20->_homeOccupancy = v23;
    objc_storeStrong((id *)&v20->_source, a7);
    objc_storeStrong((id *)&v20->_clientName, a8);
    objc_storeStrong((id *)&v20->_eventCorrelationIdentifier, a9);
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
  void *v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMHomeKitBase absoluteTimestamp](self, "absoluteTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMHomeKitBase duration](self, "duration");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitBase homeUniqueIdentifier](self, "homeUniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMHomeKitBase homeOccupancy](self, "homeOccupancy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitBase source](self, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitBase clientName](self, "clientName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitBase eventCorrelationIdentifier](self, "eventCorrelationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMHomeKitBase with absoluteTimestamp: %@, duration: %@, homeUniqueIdentifier: %@, homeOccupancy: %@, source: %@, clientName: %@, eventCorrelationIdentifier: %@"), v4, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMHomeKitBase *v5;
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
  unint64_t v21;
  objc_class *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  void *v34;
  uint64_t v35;
  BMHomeKitBase *v36;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BMHomeKitBase;
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
          v5->_hasRaw_absoluteTimestamp = 1;
          v20 = *v6;
          v21 = *(_QWORD *)&v4[v20];
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v21);
            *(_QWORD *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0;
          }
          v35 = 24;
          goto LABEL_48;
        case 2u:
          v5->_hasDuration = 1;
          v23 = *v6;
          v24 = *(_QWORD *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v24);
            *(_QWORD *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0;
          }
          v35 = 48;
LABEL_48:
          *(Class *)((char *)&v5->super.super.isa + v35) = v22;
          continue;
        case 3u:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 56;
          goto LABEL_39;
        case 4u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          v5->_hasHomeOccupancy = 1;
          break;
        case 5u:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 64;
          goto LABEL_39;
        case 6u:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 72;
          goto LABEL_39;
        case 7u:
          PBReaderReadString();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = 80;
LABEL_39:
          v34 = *(Class *)((char *)&v5->super.super.isa + v26);
          *(Class *)((char *)&v5->super.super.isa + v26) = (Class)v25;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_51;
          continue;
      }
      while (1)
      {
        v30 = *v6;
        v31 = *(_QWORD *)&v4[v30];
        v32 = v31 + 1;
        if (v31 == -1 || v32 > *(_QWORD *)&v4[*v7])
          break;
        v33 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v31);
        *(_QWORD *)&v4[v30] = v32;
        v29 |= (unint64_t)(v33 & 0x7F) << v27;
        if ((v33 & 0x80) == 0)
          goto LABEL_41;
        v27 += 7;
        v17 = v28++ >= 9;
        if (v17)
        {
          LODWORD(v29) = 0;
          goto LABEL_43;
        }
      }
      v4[*v8] = 1;
LABEL_41:
      if (v4[*v8])
        LODWORD(v29) = 0;
LABEL_43:
      v5->_homeOccupancy = v29;
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
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasRaw_absoluteTimestamp)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasDuration)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_homeUniqueIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasHomeOccupancy)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_source)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_clientName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_eventCorrelationIdentifier)
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
  -[BMHomeKitBase writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMHomeKitBase)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BMHomeKitBase *v21;
  id v22;
  void *v23;
  id v24;
  BMHomeKitBase *v25;
  void *v26;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  id *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  _QWORD v70[3];

  v70[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_9:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("duration"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = a4;
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v26 = 0;
          v25 = 0;
          goto LABEL_34;
        }
        v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v29 = *MEMORY[0x1E0D025B8];
        v67 = *MEMORY[0x1E0CB2D50];
        v55 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("duration"));
        v68 = v55;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        v26 = 0;
        *v49 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 2, v17);
        goto LABEL_33;
      }
      v54 = v16;
    }
    else
    {
      v54 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("homeUniqueIdentifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v7;
    if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v55 = 0;
          v25 = 0;
          v26 = v54;
          goto LABEL_33;
        }
        v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v30 = *MEMORY[0x1E0D025B8];
        v65 = *MEMORY[0x1E0CB2D50];
        v53 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("homeUniqueIdentifier"));
        v66 = v53;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (id)objc_msgSend(v56, "initWithDomain:code:userInfo:", v30, 2, v18);
        v25 = 0;
        v55 = 0;
        *v49 = v31;
        goto LABEL_66;
      }
      v55 = v17;
    }
    else
    {
      v55 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("homeOccupancy"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v53 = 0;
LABEL_18:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("source"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v16;
      v48 = v8;
      if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v49)
          {
            v51 = 0;
            v25 = 0;
            goto LABEL_30;
          }
          v21 = self;
          v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v35 = *MEMORY[0x1E0D025B8];
          v61 = *MEMORY[0x1E0CB2D50];
          v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("source"));
          v62 = v22;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v35, 2, v20);
          v25 = 0;
          v51 = 0;
          *v49 = v36;
LABEL_29:

          self = v21;
          v8 = v48;
LABEL_30:
          v16 = v47;
LABEL_31:
          v26 = v54;

LABEL_32:
          v7 = v50;
LABEL_33:

          goto LABEL_34;
        }
        v51 = v19;
      }
      else
      {
        v51 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("clientName"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        v21 = self;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v49)
          {
            v22 = 0;
            v25 = 0;
            goto LABEL_29;
          }
          v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v38 = *MEMORY[0x1E0D025B8];
          v59 = *MEMORY[0x1E0CB2D50];
          v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("clientName"));
          v60 = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v38, 2, v23);
          v25 = 0;
          v22 = 0;
          *v49 = v39;
          goto LABEL_28;
        }
        v22 = v20;
      }
      else
      {
        v21 = self;
        v22 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventCorrelationIdentifier"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v49)
          {
            v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v45 = *MEMORY[0x1E0D025B8];
            v57 = *MEMORY[0x1E0CB2D50];
            v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("eventCorrelationIdentifier"));
            v58 = v40;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *v49 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v45, 2, v41);

          }
          v24 = 0;
          v25 = 0;
          goto LABEL_28;
        }
        v24 = v23;
      }
      else
      {
        v24 = 0;
      }
      v25 = -[BMHomeKitBase initWithAbsoluteTimestamp:duration:homeUniqueIdentifier:homeOccupancy:source:clientName:eventCorrelationIdentifier:](v21, "initWithAbsoluteTimestamp:duration:homeUniqueIdentifier:homeOccupancy:source:clientName:eventCorrelationIdentifier:", v48, v54, v55, v53, v51, v22, v24);
      v21 = v25;
LABEL_28:

      goto LABEL_29;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v53 = v18;
      goto LABEL_18;
    }
    if (a4)
    {
      v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v33 = *MEMORY[0x1E0D025B8];
      v63 = *MEMORY[0x1E0CB2D50];
      v51 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("homeOccupancy"));
      v64 = v51;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v33, 2, v19);
      v25 = 0;
      v53 = 0;
      *v49 = v34;
      goto LABEL_31;
    }
    v53 = 0;
    v25 = 0;
LABEL_66:
    v26 = v54;
    goto LABEL_32;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (objc_class *)MEMORY[0x1E0C99D68];
    v10 = v7;
    v11 = [v9 alloc];
    objc_msgSend(v10, "doubleValue");
    v13 = v12;

    v14 = (id)objc_msgSend(v11, "initWithTimeIntervalSince1970:", v13);
LABEL_6:
    v8 = v14;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
    objc_msgSend(v15, "dateFromString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v7;
    goto LABEL_6;
  }
  if (!a4)
  {
    v8 = 0;
    v25 = 0;
    goto LABEL_35;
  }
  v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v43 = a4;
  v44 = *MEMORY[0x1E0D025B8];
  v69 = *MEMORY[0x1E0CB2D50];
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
  v70[0] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, &v69, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v25 = 0;
  *v43 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v44, 2, v16);
LABEL_34:

LABEL_35:
  return v25;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[7];
  _QWORD v30[9];

  v30[7] = *MEMORY[0x1E0C80C00];
  -[BMHomeKitBase absoluteTimestamp](self, "absoluteTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMHomeKitBase absoluteTimestamp](self, "absoluteTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  if (!-[BMHomeKitBase hasDuration](self, "hasDuration")
    || (-[BMHomeKitBase duration](self, "duration"), fabs(v7) == INFINITY))
  {
    v9 = 0;
  }
  else
  {
    -[BMHomeKitBase duration](self, "duration");
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[BMHomeKitBase duration](self, "duration");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  -[BMHomeKitBase homeUniqueIdentifier](self, "homeUniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMHomeKitBase hasHomeOccupancy](self, "hasHomeOccupancy"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMHomeKitBase homeOccupancy](self, "homeOccupancy"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  -[BMHomeKitBase source](self, "source");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitBase clientName](self, "clientName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitBase eventCorrelationIdentifier](self, "eventCorrelationIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = CFSTR("absoluteTimestamp");
  v15 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v15;
  v30[0] = v15;
  v29[1] = CFSTR("duration");
  v16 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v16;
  v30[1] = v16;
  v29[2] = CFSTR("homeUniqueIdentifier");
  v17 = (uint64_t)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v6;
  v24 = (void *)v17;
  v30[2] = v17;
  v29[3] = CFSTR("homeOccupancy");
  v18 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v9;
  v30[3] = v18;
  v29[4] = CFSTR("source");
  v19 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[4] = v19;
  v29[5] = CFSTR("clientName");
  v20 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[5] = v20;
  v29[6] = CFSTR("eventCorrelationIdentifier");
  v21 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[6] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (v13)
      goto LABEL_27;
LABEL_35:

    if (v12)
      goto LABEL_28;
    goto LABEL_36;
  }

  if (!v13)
    goto LABEL_35;
LABEL_27:
  if (v12)
    goto LABEL_28;
LABEL_36:

LABEL_28:
  if (!v11)

  if (v10)
  {
    if (v27)
      goto LABEL_32;
LABEL_38:

    if (v28)
      goto LABEL_33;
LABEL_39:

    goto LABEL_33;
  }

  if (!v27)
    goto LABEL_38;
LABEL_32:
  if (!v28)
    goto LABEL_39;
LABEL_33:

  return v22;
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
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMHomeKitBase absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMHomeKitBase absoluteTimestamp](self, "absoluteTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_27;
    }
    if (-[BMHomeKitBase hasDuration](self, "hasDuration") || objc_msgSend(v5, "hasDuration"))
    {
      if (!-[BMHomeKitBase hasDuration](self, "hasDuration"))
        goto LABEL_27;
      if (!objc_msgSend(v5, "hasDuration"))
        goto LABEL_27;
      -[BMHomeKitBase duration](self, "duration");
      v14 = v13;
      objc_msgSend(v5, "duration");
      if (v14 != v15)
        goto LABEL_27;
    }
    -[BMHomeKitBase homeUniqueIdentifier](self, "homeUniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeUniqueIdentifier");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v16 == (void *)v17)
    {

    }
    else
    {
      v18 = (void *)v17;
      -[BMHomeKitBase homeUniqueIdentifier](self, "homeUniqueIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "homeUniqueIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqual:", v20);

      if (!v21)
        goto LABEL_27;
    }
    if (-[BMHomeKitBase hasHomeOccupancy](self, "hasHomeOccupancy")
      || objc_msgSend(v5, "hasHomeOccupancy"))
    {
      if (!-[BMHomeKitBase hasHomeOccupancy](self, "hasHomeOccupancy"))
        goto LABEL_27;
      if (!objc_msgSend(v5, "hasHomeOccupancy"))
        goto LABEL_27;
      v22 = -[BMHomeKitBase homeOccupancy](self, "homeOccupancy");
      if (v22 != objc_msgSend(v5, "homeOccupancy"))
        goto LABEL_27;
    }
    -[BMHomeKitBase source](self, "source");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "source");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v23 == (void *)v24)
    {

    }
    else
    {
      v25 = (void *)v24;
      -[BMHomeKitBase source](self, "source");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "source");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "isEqual:", v27);

      if (!v28)
        goto LABEL_27;
    }
    -[BMHomeKitBase clientName](self, "clientName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientName");
    v30 = objc_claimAutoreleasedReturnValue();
    if (v29 == (void *)v30)
    {

    }
    else
    {
      v31 = (void *)v30;
      -[BMHomeKitBase clientName](self, "clientName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v32, "isEqual:", v33);

      if (!v34)
      {
LABEL_27:
        v12 = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    -[BMHomeKitBase eventCorrelationIdentifier](self, "eventCorrelationIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventCorrelationIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36 == v37)
    {
      v12 = 1;
    }
    else
    {
      -[BMHomeKitBase eventCorrelationIdentifier](self, "eventCorrelationIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventCorrelationIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v38, "isEqual:", v39);

    }
    goto LABEL_28;
  }
  v12 = 0;
LABEL_29:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)hasDuration
{
  return self->_hasDuration;
}

- (void)setHasDuration:(BOOL)a3
{
  self->_hasDuration = a3;
}

- (NSString)homeUniqueIdentifier
{
  return self->_homeUniqueIdentifier;
}

- (int)homeOccupancy
{
  return self->_homeOccupancy;
}

- (BOOL)hasHomeOccupancy
{
  return self->_hasHomeOccupancy;
}

- (void)setHasHomeOccupancy:(BOOL)a3
{
  self->_hasHomeOccupancy = a3;
}

- (NSString)source
{
  return self->_source;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (NSString)eventCorrelationIdentifier
{
  return self->_eventCorrelationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventCorrelationIdentifier, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_homeUniqueIdentifier, 0);
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

    v4 = -[BMHomeKitBase initByReadFrom:]([BMHomeKitBase alloc], "initByReadFrom:", v7);
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
  void *v9;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 1, 0, 2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("duration"), 1, 0, 2, 0, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("homeUniqueIdentifier"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("homeOccupancy"), 0, 0, 4, 2, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("source"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientName"), 2, 0, 6, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventCorrelationIdentifier"), 2, 0, 7, 13, 0);
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D9E0;
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
  void *v9;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 1, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("duration"), 2, 0, 0, v2);
  v11[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("homeUniqueIdentifier"), 3, 13, 0);
  v11[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("homeOccupancy"), 4, 2, 0);
  v11[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("source"), 5, 13, 0);
  v11[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientName"), 6, 13, 0);
  v11[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventCorrelationIdentifier"), 7, 13, 0);
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
