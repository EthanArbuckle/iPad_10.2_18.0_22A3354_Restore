@implementation BMDeviceSilentMode

- (BMDeviceSilentMode)initWithStarting:(id)a3 clientType:(int)a4 untilTime:(id)a5 reason:(id)a6
{
  id v10;
  id v11;
  id v12;
  BMDeviceSilentMode *v13;
  double v14;
  objc_super v16;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)BMDeviceSilentMode;
  v13 = -[BMEventBase init](&v16, sel_init);
  if (v13)
  {
    v13->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v10)
    {
      v13->_hasStarting = 1;
      v13->_starting = objc_msgSend(v10, "BOOLValue");
    }
    else
    {
      v13->_hasStarting = 0;
      v13->_starting = 0;
    }
    v13->_clientType = a4;
    if (v11)
    {
      v13->_hasRaw_untilTime = 1;
      objc_msgSend(v11, "timeIntervalSince1970");
    }
    else
    {
      v13->_hasRaw_untilTime = 0;
      v14 = -1.0;
    }
    v13->_raw_untilTime = v14;
    objc_storeStrong((id *)&v13->_reason, a6);
  }

  return v13;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDeviceSilentMode starting](self, "starting"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMDeviceSilentModeClientTypeAsString(-[BMDeviceSilentMode clientType](self, "clientType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceSilentMode untilTime](self, "untilTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceSilentMode reason](self, "reason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMDeviceSilentMode with starting: %@, clientType: %@, untilTime: %@, reason: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMDeviceSilentMode *v5;
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
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  unint64_t v35;
  double v36;
  uint64_t v37;
  NSString *reason;
  BMDeviceSilentMode *v39;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMDeviceSilentMode;
  v5 = -[BMEventBase init](&v41, sel_init);
  if (!v5)
    goto LABEL_55;
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
              goto LABEL_41;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              v22 = 0;
              goto LABEL_43;
            }
          }
          v4[*v8] = 1;
LABEL_41:
          if (v4[*v8])
            v22 = 0;
LABEL_43:
          v5->_starting = v22 != 0;
          break;
        case 2u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
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
              goto LABEL_45;
            v27 += 7;
            v17 = v28++ >= 9;
            if (v17)
            {
              LODWORD(v29) = 0;
              goto LABEL_47;
            }
          }
          v4[*v8] = 1;
LABEL_45:
          if (v4[*v8])
            LODWORD(v29) = 0;
LABEL_47:
          if (v29 >= 0xA)
            LODWORD(v29) = 0;
          v5->_clientType = v29;
          break;
        case 3u:
          v5->_hasRaw_untilTime = 1;
          v34 = *v6;
          v35 = *(_QWORD *)&v4[v34];
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v36 = *(double *)(*(_QWORD *)&v4[*v9] + v35);
            *(_QWORD *)&v4[v34] = v35 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v36 = 0.0;
          }
          v5->_raw_untilTime = v36;
          break;
        case 4u:
          PBReaderReadString();
          v37 = objc_claimAutoreleasedReturnValue();
          reason = v5->_reason;
          v5->_reason = (NSString *)v37;

          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_54;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_54:
    v39 = 0;
  else
LABEL_55:
    v39 = v5;

  return v39;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasStarting)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  if (self->_hasRaw_untilTime)
    PBDataWriterWriteDoubleField();
  if (self->_reason)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMDeviceSilentMode writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMDeviceSilentMode)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  BMDeviceSilentMode *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  id v16;
  id v17;
  double v18;
  double v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  BMDeviceSilentMode *v24;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  id *v36;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("starting"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v38 = 0;
        v12 = 0;
        v24 = self;
        goto LABEL_31;
      }
      v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v11 = *MEMORY[0x1E0D025B8];
      v45 = *MEMORY[0x1E0CB2D50];
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("starting"));
      v46[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      v12 = 0;
      *a4 = (id)objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, 2, v7);
      goto LABEL_45;
    }
    v38 = v6;
  }
  else
  {
    v38 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v7;
LABEL_15:
        v8 = v9;
        goto LABEL_16;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMDeviceSilentModeClientTypeFromString(v7));
        v9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      if (a4)
      {
        v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v29 = *MEMORY[0x1E0D025B8];
        v43 = *MEMORY[0x1E0CB2D50];
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("clientType"));
        v44 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 2, v13);
        v8 = 0;
        v12 = 0;
        *a4 = v30;
        goto LABEL_47;
      }
      v8 = 0;
      v12 = 0;
LABEL_45:
      v24 = self;
      goto LABEL_30;
    }
  }
  v8 = 0;
LABEL_16:
  v36 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("untilTime"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v14 = 0;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = (objc_class *)MEMORY[0x1E0C99D68];
    v16 = v13;
    v17 = [v15 alloc];
    objc_msgSend(v16, "doubleValue");
    v19 = v18;

    v20 = (id)objc_msgSend(v17, "initWithTimeIntervalSince1970:", v19);
LABEL_21:
    v14 = v20;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v13;
      goto LABEL_21;
    }
    if (a4)
    {
      v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v31 = *MEMORY[0x1E0D025B8];
      v41 = *MEMORY[0x1E0CB2D50];
      v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("untilTime"));
      v42 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v31, 2, v22);
      v14 = 0;
      v12 = 0;
      *v36 = v32;
      v24 = self;
      goto LABEL_28;
    }
    v14 = 0;
    v12 = 0;
LABEL_47:
    v24 = self;
    goto LABEL_29;
  }
  v21 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  objc_msgSend(v21, "dateFromString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("reason"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    v24 = self;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v36)
      {
        v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v33 = *MEMORY[0x1E0D025B8];
        v39 = *MEMORY[0x1E0CB2D50];
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("reason"));
        v40 = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *v36 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", v33, 2, v27);

      }
      v23 = 0;
      v12 = 0;
      goto LABEL_28;
    }
    v23 = v22;
  }
  else
  {
    v23 = 0;
    v24 = self;
  }
  v24 = -[BMDeviceSilentMode initWithStarting:clientType:untilTime:reason:](v24, "initWithStarting:clientType:untilTime:reason:", v38, objc_msgSend(v8, "intValue"), v14, v23);
  v12 = v24;
LABEL_28:

LABEL_29:
LABEL_30:

LABEL_31:
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
  void *v14;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  if (-[BMDeviceSilentMode hasStarting](self, "hasStarting"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDeviceSilentMode starting](self, "starting"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceSilentMode clientType](self, "clientType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceSilentMode untilTime](self, "untilTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMDeviceSilentMode untilTime](self, "untilTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    objc_msgSend(v6, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  -[BMDeviceSilentMode reason](self, "reason");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("starting");
  v10 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v10;
  v16[1] = CFSTR("clientType");
  v11 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v11;
  v16[2] = CFSTR("untilTime");
  v12 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v12;
  v16[3] = CFSTR("reason");
  v13 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v8)
      goto LABEL_17;
  }
  else
  {

    if (v8)
    {
LABEL_17:
      if (v4)
        goto LABEL_18;
LABEL_22:

      if (v3)
        goto LABEL_19;
LABEL_23:

      goto LABEL_19;
    }
  }

  if (!v4)
    goto LABEL_22;
LABEL_18:
  if (!v3)
    goto LABEL_23;
LABEL_19:

  return v14;
}

- (NSDate)untilTime
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_untilTime)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_untilTime);
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
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = 0;
    goto LABEL_13;
  }
  v5 = v4;
  if (-[BMDeviceSilentMode hasStarting](self, "hasStarting") || objc_msgSend(v5, "hasStarting"))
  {
    if (!-[BMDeviceSilentMode hasStarting](self, "hasStarting"))
      goto LABEL_10;
    if (!objc_msgSend(v5, "hasStarting"))
      goto LABEL_10;
    v6 = -[BMDeviceSilentMode starting](self, "starting");
    if (v6 != objc_msgSend(v5, "starting"))
      goto LABEL_10;
  }
  v7 = -[BMDeviceSilentMode clientType](self, "clientType");
  if (v7 != objc_msgSend(v5, "clientType"))
    goto LABEL_10;
  -[BMDeviceSilentMode untilTime](self, "untilTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "untilTime");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v8 == (void *)v9)
  {

    goto LABEL_15;
  }
  v10 = (void *)v9;
  -[BMDeviceSilentMode untilTime](self, "untilTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "untilTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if (v13)
  {
LABEL_15:
    -[BMDeviceSilentMode reason](self, "reason");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reason");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 == v17)
    {
      v14 = 1;
    }
    else
    {
      -[BMDeviceSilentMode reason](self, "reason");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reason");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v18, "isEqual:", v19);

    }
    goto LABEL_11;
  }
LABEL_10:
  v14 = 0;
LABEL_11:

LABEL_13:
  return v14;
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

- (int)clientType
{
  return self->_clientType;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
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

    v4 = -[BMDeviceSilentMode initByReadFrom:]([BMDeviceSilentMode alloc], "initByReadFrom:", v7);
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
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("starting"), 0, 0, 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("clientType"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("untilTime"), 3, 0, 3, 0, 2);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("reason"), 2, 0, 4, 13, 0);
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
  return &unk_1E5F1E628;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("starting"), 1, 12, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("clientType"), 2, 4, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("untilTime"), 3, 0, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("reason"), 4, 13, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
