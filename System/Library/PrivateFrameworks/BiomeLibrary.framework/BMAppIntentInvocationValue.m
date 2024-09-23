@implementation BMAppIntentInvocationValue

- (BMAppIntentInvocationValue)initWithValueType:(id)a3 value:(id)a4 displayRepresentation:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMAppIntentInvocationValue *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMAppIntentInvocationValue;
  v12 = -[BMEventBase init](&v14, sel_init);
  if (v12)
  {
    v12->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v12->_valueType, a3);
    objc_storeStrong((id *)&v12->_value, a4);
    objc_storeStrong((id *)&v12->_displayRepresentation, a5);
  }

  return v12;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMAppIntentInvocationValue valueType](self, "valueType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationValue value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationValue displayRepresentation](self, "displayRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMAppIntentInvocationValue with valueType: %@, value: %@, displayRepresentation: %@"), v4, v5, v6);

  return (NSString *)v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAppIntentInvocationValue *v5;
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
  int v18;
  unint64_t v20;
  objc_class *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSData *value;
  BMAppIntentInvocationValue *v26;
  objc_super v28;
  uint64_t v29;
  uint64_t v30;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BMAppIntentInvocationValue;
  v5 = -[BMEventBase init](&v28, sel_init);
  if (!v5)
    goto LABEL_34;
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
        if (v11++ >= 9)
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
      v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        v29 = 0;
        v30 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_33;
        v21 = -[BMAppIntentInvocationDisplayRepresentation initByReadFrom:]([BMAppIntentInvocationDisplayRepresentation alloc], "initByReadFrom:", v4);
        if (!v21)
          goto LABEL_33;
        v22 = 40;
      }
      else
      {
        if ((_DWORD)v20 == 2)
        {
          PBReaderReadData();
          v24 = objc_claimAutoreleasedReturnValue();
          value = v5->_value;
          v5->_value = (NSData *)v24;

          continue;
        }
        if ((_DWORD)v20 != 1)
        {
          if (!PBReaderSkipValueWithTag())
            goto LABEL_33;
          continue;
        }
        v29 = 0;
        v30 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_33;
        v21 = -[BMAppIntentInvocationValueType initByReadFrom:]([BMAppIntentInvocationValueType alloc], "initByReadFrom:", v4);
        if (!v21)
          goto LABEL_33;
        v22 = 24;
      }
      v23 = *(Class *)((char *)&v5->super.super.isa + v22);
      *(Class *)((char *)&v5->super.super.isa + v22) = v21;

      PBReaderRecallMark();
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_33:
    v26 = 0;
  else
LABEL_34:
    v26 = v5;

  return v26;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_valueType)
  {
    PBDataWriterPlaceMark();
    -[BMAppIntentInvocationValueType writeTo:](self->_valueType, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_value)
    PBDataWriterWriteDataField();
  if (self->_displayRepresentation)
  {
    PBDataWriterPlaceMark();
    -[BMAppIntentInvocationDisplayRepresentation writeTo:](self->_displayRepresentation, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMAppIntentInvocationValue writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAppIntentInvocationValue)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BMAppIntentInvocationValueType *v8;
  void *v9;
  id *v10;
  id v11;
  void *v12;
  BMAppIntentInvocationDisplayRepresentation *v13;
  BMAppIntentInvocationValue *v14;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  BMAppIntentInvocationValueType *v29;
  id v30;
  id *v31;
  id v32;
  id v33;
  uint64_t v34;
  BMAppIntentInvocationDisplayRepresentation *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("valueType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v7;
    v33 = 0;
    v8 = -[BMAppIntentInvocationValueType initWithJSONDictionary:error:]([BMAppIntentInvocationValueType alloc], "initWithJSONDictionary:error:", v11, &v33);
    v16 = v33;
    if (v16)
    {
      v17 = v16;
      if (a4)
        *a4 = objc_retainAutorelease(v16);

      v14 = 0;
      goto LABEL_14;
    }

LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("value"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v14 = 0;
          v11 = 0;
          goto LABEL_13;
        }
        v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v23 = *MEMORY[0x1E0D025B8];
        v36 = *MEMORY[0x1E0CB2D50];
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), objc_opt_class(), CFSTR("value"));
        v37 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
        v24 = a4;
        v13 = (BMAppIntentInvocationDisplayRepresentation *)objc_claimAutoreleasedReturnValue();
        v25 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v23, 2, v13);
        v14 = 0;
        v11 = 0;
        *v24 = v25;
        goto LABEL_11;
      }
      v10 = a4;
      v11 = v9;
    }
    else
    {
      v10 = a4;
      v11 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("displayRepresentation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v10)
        {
          v14 = 0;
          goto LABEL_12;
        }
        v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v27 = *MEMORY[0x1E0D025B8];
        v34 = *MEMORY[0x1E0CB2D50];
        v31 = v10;
        v13 = (BMAppIntentInvocationDisplayRepresentation *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("displayRepresentation"));
        v35 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *v31 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v27, 2, v26);

        v14 = 0;
LABEL_11:

LABEL_12:
LABEL_13:

        goto LABEL_14;
      }
      v29 = v8;
      v18 = v12;
      v32 = 0;
      v13 = -[BMAppIntentInvocationDisplayRepresentation initWithJSONDictionary:error:]([BMAppIntentInvocationDisplayRepresentation alloc], "initWithJSONDictionary:error:", v18, &v32);
      v19 = v32;
      if (v19)
      {
        v20 = v19;
        if (v10)
          *v10 = objc_retainAutorelease(v19);

        v14 = 0;
        v12 = v18;
        v8 = v29;
        goto LABEL_11;
      }

      v8 = v29;
    }
    else
    {
      v13 = 0;
    }
    self = -[BMAppIntentInvocationValue initWithValueType:value:displayRepresentation:](self, "initWithValueType:value:displayRepresentation:", v8, v11, v13);
    v14 = self;
    goto LABEL_11;
  }
  if (!a4)
  {
    v14 = 0;
    goto LABEL_15;
  }
  v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v22 = *MEMORY[0x1E0D025B8];
  v38 = *MEMORY[0x1E0CB2D50];
  v8 = (BMAppIntentInvocationValueType *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("valueType"));
  v39[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  *a4 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2, v11);
LABEL_14:

LABEL_15:
  return v14;
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
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  -[BMAppIntentInvocationValue valueType](self, "valueType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMAppIntentInvocationValue value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMAppIntentInvocationValue displayRepresentation](self, "displayRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jsonDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = CFSTR("valueType");
  v9 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[0] = v9;
  v14[1] = CFSTR("value");
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v10;
  v14[2] = CFSTR("displayRepresentation");
  v11 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v6)
      goto LABEL_9;
LABEL_12:

    if (v4)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!v6)
    goto LABEL_12;
LABEL_9:
  if (!v4)
    goto LABEL_13;
LABEL_10:

  return v12;
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
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMAppIntentInvocationValue valueType](self, "valueType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueType");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMAppIntentInvocationValue valueType](self, "valueType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "valueType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_9;
    }
    -[BMAppIntentInvocationValue value](self, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMAppIntentInvocationValue value](self, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
      {
LABEL_9:
        v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    -[BMAppIntentInvocationValue displayRepresentation](self, "displayRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 == v20)
    {
      v12 = 1;
    }
    else
    {
      -[BMAppIntentInvocationValue displayRepresentation](self, "displayRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v21, "isEqual:", v22);

    }
    goto LABEL_15;
  }
  v12 = 0;
LABEL_16:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMAppIntentInvocationValueType)valueType
{
  return self->_valueType;
}

- (NSData)value
{
  return self->_value;
}

- (BMAppIntentInvocationDisplayRepresentation)displayRepresentation
{
  return self->_displayRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayRepresentation, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_valueType, 0);
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

    v4 = -[BMAppIntentInvocationValue initByReadFrom:]([BMAppIntentInvocationValue alloc], "initByReadFrom:", v7);
    v4[4] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("valueType_json"), 5, 1, &__block_literal_global_537);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("value"), 4, 0, 2, 14, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("displayRepresentation_json"), 5, 1, &__block_literal_global_538);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1CBD0;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("valueType"), 1, 14, objc_opt_class());
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("value"), 2, 14, 0, v2);
  v7[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("displayRepresentation"), 3, 14, objc_opt_class());
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __37__BMAppIntentInvocationValue_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __37__BMAppIntentInvocationValue_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
