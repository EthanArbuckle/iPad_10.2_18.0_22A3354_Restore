@implementation BMIntelligencePlatformFeatureStoreFeatureValueBasicValue

- (BMIntelligencePlatformFeatureStoreFeatureValueBasicValue)initWithInt_value:(id)a3 double_value:(id)a4 float_value:(id)a5 string_value:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *v14;
  uint64_t v15;
  double v16;
  float v17;
  double v18;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BMIntelligencePlatformFeatureStoreFeatureValueBasicValue;
  v14 = -[BMEventBase init](&v20, sel_init);
  if (v14)
  {
    v14->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v10)
    {
      v14->_hasInt_value = 1;
      v15 = objc_msgSend(v10, "longLongValue");
    }
    else
    {
      v14->_hasInt_value = 0;
      v15 = -1;
    }
    v14->_int_value = v15;
    if (v11)
    {
      v14->_hasDouble_value = 1;
      objc_msgSend(v11, "doubleValue");
    }
    else
    {
      v14->_hasDouble_value = 0;
      v16 = -1.0;
    }
    v14->_double_value = v16;
    if (v12)
    {
      v14->_hasFloat_value = 1;
      objc_msgSend(v12, "floatValue");
      v18 = v17;
    }
    else
    {
      v14->_hasFloat_value = 0;
      v18 = -1.0;
    }
    v14->_float_value = v18;
    objc_storeStrong((id *)&v14->_string_value, a6);
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
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue int_value](self, "int_value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue double_value](self, "double_value");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue float_value](self, "float_value");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue string_value](self, "string_value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMIntelligencePlatformFeatureStoreFeatureValueBasicValue with int_value: %@, double_value: %@, float_value: %@, string_value: %@"), v4, v6, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *v5;
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
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  unint64_t v28;
  double v29;
  uint64_t v30;
  unint64_t v31;
  float v32;
  uint64_t v33;
  NSString *string_value;
  uint64_t v35;
  BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *v36;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BMIntelligencePlatformFeatureStoreFeatureValueBasicValue;
  v5 = -[BMEventBase init](&v38, sel_init);
  if (!v5)
    goto LABEL_48;
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
          v5->_hasInt_value = 1;
          break;
        case 2u:
          v5->_hasDouble_value = 1;
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
          v35 = 32;
          goto LABEL_44;
        case 3u:
          v5->_hasFloat_value = 1;
          v30 = *v6;
          v31 = *(_QWORD *)&v4[v30];
          if (v31 <= 0xFFFFFFFFFFFFFFFBLL && v31 + 4 <= *(_QWORD *)&v4[*v7])
          {
            v32 = *(float *)(*(_QWORD *)&v4[*v9] + v31);
            *(_QWORD *)&v4[v30] = v31 + 4;
          }
          else
          {
            v4[*v8] = 1;
            v32 = 0.0;
          }
          v29 = v32;
          v35 = 40;
LABEL_44:
          *(double *)((char *)&v5->super.super.isa + v35) = v29;
          continue;
        case 4u:
          PBReaderReadString();
          v33 = objc_claimAutoreleasedReturnValue();
          string_value = v5->_string_value;
          v5->_string_value = (NSString *)v33;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_47;
          continue;
      }
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
          goto LABEL_37;
        v20 += 7;
        v17 = v21++ >= 9;
        if (v17)
        {
          v22 = 0;
          goto LABEL_39;
        }
      }
      v4[*v8] = 1;
LABEL_37:
      if (v4[*v8])
        v22 = 0;
LABEL_39:
      v5->_int_value = v22;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_47:
    v36 = 0;
  else
LABEL_48:
    v36 = v5;

  return v36;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasInt_value)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_hasDouble_value)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_hasFloat_value)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }
  if (self->_string_value)
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
  -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMIntelligencePlatformFeatureStoreFeatureValueBasicValue)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *v11;
  id v12;
  void *v13;
  id v14;
  BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *v15;
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("int_value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("double_value"));
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
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("double_value"));
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
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("float_value"));
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
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("float_value"));
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
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("string_value"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v14 = 0;
LABEL_13:
      a4 = v31;
      v15 = -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue initWithInt_value:double_value:float_value:string_value:](v11, "initWithInt_value:double_value:float_value:string_value:", v8, v31, v12, v14);
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
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("string_value"));
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
  v18 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("int_value"));
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
  double v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  if (-[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue hasInt_value](self, "hasInt_value"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue int_value](self, "int_value"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (!-[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue hasDouble_value](self, "hasDouble_value")
    || (-[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue double_value](self, "double_value"),
        fabs(v4) == INFINITY))
  {
    v6 = 0;
  }
  else
  {
    -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue double_value](self, "double_value");
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue double_value](self, "double_value");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!-[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue hasFloat_value](self, "hasFloat_value")
    || (-[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue float_value](self, "float_value"),
        fabs(v7) == INFINITY))
  {
    v9 = 0;
  }
  else
  {
    -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue float_value](self, "float_value");
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue float_value](self, "float_value");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue string_value](self, "string_value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("int_value");
  v11 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[0] = v11;
  v17[1] = CFSTR("double_value");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[1] = v12;
  v17[2] = CFSTR("float_value");
  v13 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[2] = v13;
  v17[3] = CFSTR("string_value");
  v14 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
      goto LABEL_22;
  }
  else
  {

    if (v9)
    {
LABEL_22:
      if (v6)
        goto LABEL_23;
LABEL_27:

      if (v3)
        goto LABEL_24;
LABEL_28:

      goto LABEL_24;
    }
  }

  if (!v6)
    goto LABEL_27;
LABEL_23:
  if (!v3)
    goto LABEL_28;
LABEL_24:

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((!-[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue hasInt_value](self, "hasInt_value")
       && !objc_msgSend(v5, "hasInt_value")
       || -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue hasInt_value](self, "hasInt_value")
       && objc_msgSend(v5, "hasInt_value")
       && (v6 = -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue int_value](self, "int_value"),
           v6 == objc_msgSend(v5, "int_value")))
      && (!-[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue hasDouble_value](self, "hasDouble_value")
       && !objc_msgSend(v5, "hasDouble_value")
       || -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue hasDouble_value](self, "hasDouble_value")
       && objc_msgSend(v5, "hasDouble_value")
       && (-[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue double_value](self, "double_value"),
           v8 = v7,
           objc_msgSend(v5, "double_value"),
           v8 == v9))
      && (!-[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue hasFloat_value](self, "hasFloat_value")
       && !objc_msgSend(v5, "hasFloat_value")
       || -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue hasFloat_value](self, "hasFloat_value")
       && objc_msgSend(v5, "hasFloat_value")
       && (-[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue float_value](self, "float_value"),
           v11 = v10,
           objc_msgSend(v5, "float_value"),
           v11 == v12)))
    {
      -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue string_value](self, "string_value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "string_value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 == v14)
      {
        v17 = 1;
      }
      else
      {
        -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue string_value](self, "string_value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "string_value");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

      }
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int64_t)int_value
{
  return self->_int_value;
}

- (BOOL)hasInt_value
{
  return self->_hasInt_value;
}

- (void)setHasInt_value:(BOOL)a3
{
  self->_hasInt_value = a3;
}

- (double)double_value
{
  return self->_double_value;
}

- (BOOL)hasDouble_value
{
  return self->_hasDouble_value;
}

- (void)setHasDouble_value:(BOOL)a3
{
  self->_hasDouble_value = a3;
}

- (double)float_value
{
  return self->_float_value;
}

- (BOOL)hasFloat_value
{
  return self->_hasFloat_value;
}

- (void)setHasFloat_value:(BOOL)a3
{
  self->_hasFloat_value = a3;
}

- (NSString)string_value
{
  return self->_string_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string_value, 0);
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

    v4 = -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue initByReadFrom:]([BMIntelligencePlatformFeatureStoreFeatureValueBasicValue alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("int_value"), 0, 0, 1, 3, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("double_value"), 1, 0, 2, 0, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("float_value"), 1, 0, 3, 1, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("string_value"), 2, 0, 4, 13, 0);
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
  return &unk_1E5F1AF80;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("int_value"), 1, 3, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("double_value"), 2, 0, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("float_value"), 3, 1, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("string_value"), 4, 13, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
