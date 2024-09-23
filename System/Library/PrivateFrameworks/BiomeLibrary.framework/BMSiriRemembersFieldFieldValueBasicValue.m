@implementation BMSiriRemembersFieldFieldValueBasicValue

- (BMSiriRemembersFieldFieldValueBasicValue)initWithBoolValue:(id)a3 int64Value:(id)a4 doubleValue:(id)a5 stringValue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BMSiriRemembersFieldFieldValueBasicValue *v14;
  uint64_t v15;
  double v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BMSiriRemembersFieldFieldValueBasicValue;
  v14 = -[BMEventBase init](&v18, sel_init);
  if (v14)
  {
    v14->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v10)
    {
      v14->_hasBoolValue = 1;
      v14->_BOOLValue = objc_msgSend(v10, "BOOLValue");
    }
    else
    {
      v14->_hasBoolValue = 0;
      v14->_BOOLValue = 0;
    }
    if (v11)
    {
      v14->_hasInt64Value = 1;
      v15 = objc_msgSend(v11, "longLongValue");
    }
    else
    {
      v14->_hasInt64Value = 0;
      v15 = -1;
    }
    v14->_int64Value = v15;
    if (v12)
    {
      v14->_hasDoubleValue = 1;
      objc_msgSend(v12, "doubleValue");
    }
    else
    {
      v14->_hasDoubleValue = 0;
      v16 = -1.0;
    }
    v14->_doubleValue = v16;
    objc_storeStrong((id *)&v14->_stringValue, a6);
  }

  return v14;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriRemembersFieldFieldValueBasicValue BOOLValue](self, "BOOLValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMSiriRemembersFieldFieldValueBasicValue int64Value](self, "int64Value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriRemembersFieldFieldValueBasicValue doubleValue](self, "doubleValue");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriRemembersFieldFieldValueBasicValue stringValue](self, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriRemembersFieldFieldValueBasicValue with BOOLValue: %@, int64Value: %@, doubleValue: %@, stringValue: %@"), v4, v5, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriRemembersFieldFieldValueBasicValue *v5;
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
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  unint64_t v35;
  double v36;
  uint64_t v37;
  NSString *stringValue;
  BMSiriRemembersFieldFieldValueBasicValue *v39;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMSiriRemembersFieldFieldValueBasicValue;
  v5 = -[BMEventBase init](&v41, sel_init);
  if (!v5)
    goto LABEL_53;
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
          v5->_hasBoolValue = 1;
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
          v5->_BOOLValue = v22 != 0;
          break;
        case 2u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          v5->_hasInt64Value = 1;
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
              v29 = 0;
              goto LABEL_47;
            }
          }
          v4[*v8] = 1;
LABEL_45:
          if (v4[*v8])
            v29 = 0;
LABEL_47:
          v5->_int64Value = v29;
          break;
        case 3u:
          v5->_hasDoubleValue = 1;
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
          v5->_doubleValue = v36;
          break;
        case 4u:
          PBReaderReadString();
          v37 = objc_claimAutoreleasedReturnValue();
          stringValue = v5->_stringValue;
          v5->_stringValue = (NSString *)v37;

          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_52;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_52:
    v39 = 0;
  else
LABEL_53:
    v39 = v5;

  return v39;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasBoolValue)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasInt64Value)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_hasDoubleValue)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_stringValue)
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
  -[BMSiriRemembersFieldFieldValueBasicValue writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriRemembersFieldFieldValueBasicValue)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  BMSiriRemembersFieldFieldValueBasicValue *v11;
  id v12;
  void *v13;
  id v14;
  BMSiriRemembersFieldFieldValueBasicValue *v15;
  id v16;
  uint64_t v17;
  id *v18;
  id v19;
  id *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v28;
  id v29;
  id v30;
  id *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BOOLValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("int64Value"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          goto LABEL_35;
        }
        v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v20 = a4;
        v21 = *MEMORY[0x1E0D025B8];
        v37 = *MEMORY[0x1E0CB2D50];
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("int64Value"));
        v38 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v21, 2, v10);
        v15 = 0;
        a4 = 0;
        *v20 = v22;
        goto LABEL_33;
      }
      v31 = v9;
    }
    else
    {
      v31 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("doubleValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v12 = 0;
          v15 = 0;
          a4 = v31;
          goto LABEL_34;
        }
        v11 = self;
        v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v23 = *MEMORY[0x1E0D025B8];
        v35 = *MEMORY[0x1E0CB2D50];
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("doubleValue"));
        v36 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v23, 2, v13);
        v15 = 0;
        v12 = 0;
        *a4 = v24;
        goto LABEL_31;
      }
      v11 = self;
      v12 = v10;
    }
    else
    {
      v11 = self;
      v12 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("stringValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v14 = 0;
LABEL_13:
      a4 = v31;
      v15 = -[BMSiriRemembersFieldFieldValueBasicValue initWithBoolValue:int64Value:doubleValue:stringValue:](v11, "initWithBoolValue:int64Value:doubleValue:stringValue:", v8, v31, v12, v14);
      v11 = v15;
LABEL_32:

      self = v11;
LABEL_33:
      v7 = v32;
LABEL_34:

      goto LABEL_35;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v13;
      goto LABEL_13;
    }
    if (a4)
    {
      v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v28 = *MEMORY[0x1E0D025B8];
      v33 = *MEMORY[0x1E0CB2D50];
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("stringValue"));
      v34 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v28, 2, v26);

    }
    v14 = 0;
    v15 = 0;
LABEL_31:
    a4 = v31;
    goto LABEL_32;
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
    goto LABEL_36;
  }
  v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v17 = *MEMORY[0x1E0D025B8];
  v39 = *MEMORY[0x1E0CB2D50];
  v18 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("BOOLValue"));
  v40[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v8 = 0;
  *a4 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, 2, v9);
  a4 = v18;
LABEL_35:

LABEL_36:
  return v15;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  if (-[BMSiriRemembersFieldFieldValueBasicValue hasBoolValue](self, "hasBoolValue"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriRemembersFieldFieldValueBasicValue BOOLValue](self, "BOOLValue"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (-[BMSiriRemembersFieldFieldValueBasicValue hasInt64Value](self, "hasInt64Value"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMSiriRemembersFieldFieldValueBasicValue int64Value](self, "int64Value"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (!-[BMSiriRemembersFieldFieldValueBasicValue hasDoubleValue](self, "hasDoubleValue")
    || (-[BMSiriRemembersFieldFieldValueBasicValue doubleValue](self, "doubleValue"), fabs(v5) == INFINITY))
  {
    v7 = 0;
  }
  else
  {
    -[BMSiriRemembersFieldFieldValueBasicValue doubleValue](self, "doubleValue");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriRemembersFieldFieldValueBasicValue doubleValue](self, "doubleValue");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMSiriRemembersFieldFieldValueBasicValue stringValue](self, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("BOOLValue");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[0] = v9;
  v15[1] = CFSTR("int64Value");
  v10 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[1] = v10;
  v15[2] = CFSTR("doubleValue");
  v11 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[2] = v11;
  v15[3] = CFSTR("stringValue");
  v12 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
      goto LABEL_21;
  }
  else
  {

    if (v7)
    {
LABEL_21:
      if (v4)
        goto LABEL_22;
LABEL_26:

      if (v3)
        goto LABEL_23;
LABEL_27:

      goto LABEL_23;
    }
  }

  if (!v4)
    goto LABEL_26;
LABEL_22:
  if (!v3)
    goto LABEL_27;
LABEL_23:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int64_t v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((!-[BMSiriRemembersFieldFieldValueBasicValue hasBoolValue](self, "hasBoolValue")
       && !objc_msgSend(v5, "hasBoolValue")
       || -[BMSiriRemembersFieldFieldValueBasicValue hasBoolValue](self, "hasBoolValue")
       && objc_msgSend(v5, "hasBoolValue")
       && (v6 = -[BMSiriRemembersFieldFieldValueBasicValue BOOLValue](self, "BOOLValue"),
           v6 == objc_msgSend(v5, "BOOLValue")))
      && (!-[BMSiriRemembersFieldFieldValueBasicValue hasInt64Value](self, "hasInt64Value")
       && !objc_msgSend(v5, "hasInt64Value")
       || -[BMSiriRemembersFieldFieldValueBasicValue hasInt64Value](self, "hasInt64Value")
       && objc_msgSend(v5, "hasInt64Value")
       && (v7 = -[BMSiriRemembersFieldFieldValueBasicValue int64Value](self, "int64Value"),
           v7 == objc_msgSend(v5, "int64Value")))
      && (!-[BMSiriRemembersFieldFieldValueBasicValue hasDoubleValue](self, "hasDoubleValue")
       && !objc_msgSend(v5, "hasDoubleValue")
       || -[BMSiriRemembersFieldFieldValueBasicValue hasDoubleValue](self, "hasDoubleValue")
       && objc_msgSend(v5, "hasDoubleValue")
       && (-[BMSiriRemembersFieldFieldValueBasicValue doubleValue](self, "doubleValue"),
           v9 = v8,
           objc_msgSend(v5, "doubleValue"),
           v9 == v10)))
    {
      -[BMSiriRemembersFieldFieldValueBasicValue stringValue](self, "stringValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v15 = 1;
      }
      else
      {
        -[BMSiriRemembersFieldFieldValueBasicValue stringValue](self, "stringValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqual:", v14);

      }
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (BOOL)hasBoolValue
{
  return self->_hasBoolValue;
}

- (void)setHasBoolValue:(BOOL)a3
{
  self->_hasBoolValue = a3;
}

- (int64_t)int64Value
{
  return self->_int64Value;
}

- (BOOL)hasInt64Value
{
  return self->_hasInt64Value;
}

- (void)setHasInt64Value:(BOOL)a3
{
  self->_hasInt64Value = a3;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (BOOL)hasDoubleValue
{
  return self->_hasDoubleValue;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  self->_hasDoubleValue = a3;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
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

    v4 = -[BMSiriRemembersFieldFieldValueBasicValue initByReadFrom:]([BMSiriRemembersFieldFieldValueBasicValue alloc], "initByReadFrom:", v7);
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
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("BOOLValue"), 0, 0, 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("int64Value"), 0, 0, 2, 3, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("doubleValue"), 1, 0, 3, 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("stringValue"), 2, 0, 4, 13, 0);
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
  return &unk_1E5F1B760;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("BOOLValue"), 1, 12, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("int64Value"), 2, 3, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("doubleValue"), 3, 0, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("stringValue"), 4, 13, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
