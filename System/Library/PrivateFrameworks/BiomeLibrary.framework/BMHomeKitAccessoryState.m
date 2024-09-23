@implementation BMHomeKitAccessoryState

- (BMHomeKitAccessoryState)initWithMediaPropertyType:(id)a3 valueType:(int)a4 dataValue:(id)a5 stringValue:(id)a6 numValue:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMHomeKitAccessoryState *v17;
  double v18;
  objc_super v20;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMHomeKitAccessoryState;
  v17 = -[BMEventBase init](&v20, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v17->_mediaPropertyType, a3);
    v17->_valueType = a4;
    objc_storeStrong((id *)&v17->_dataValue, a5);
    objc_storeStrong((id *)&v17->_stringValue, a6);
    if (v16)
    {
      v17->_hasNumValue = 1;
      objc_msgSend(v16, "doubleValue");
    }
    else
    {
      v17->_hasNumValue = 0;
      v18 = -1.0;
    }
    v17->_numValue = v18;
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
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMHomeKitAccessoryState mediaPropertyType](self, "mediaPropertyType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMHomeKitAccessoryStateValueTypeAsString(-[BMHomeKitAccessoryState valueType](self, "valueType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitAccessoryState dataValue](self, "dataValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitAccessoryState stringValue](self, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[BMHomeKitAccessoryState numValue](self, "numValue");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMHomeKitAccessoryState with mediaPropertyType: %@, valueType: %@, dataValue: %@, stringValue: %@, numValue: %@"), v4, v5, v6, v7, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMHomeKitAccessoryState *v5;
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
  void *v29;
  uint64_t v30;
  unint64_t v31;
  double v32;
  BMHomeKitAccessoryState *v33;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMHomeKitAccessoryState;
  v5 = -[BMEventBase init](&v35, sel_init);
  if (!v5)
    goto LABEL_47;
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
          v21 = 32;
          goto LABEL_32;
        case 2u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          break;
        case 3u:
          PBReaderReadData();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 40;
          goto LABEL_32;
        case 4u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 48;
LABEL_32:
          v29 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 5u:
          v5->_hasNumValue = 1;
          v30 = *v6;
          v31 = *(_QWORD *)&v4[v30];
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v32 = *(double *)(*(_QWORD *)&v4[*v9] + v31);
            *(_QWORD *)&v4[v30] = v31 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v32 = 0.0;
          }
          v5->_numValue = v32;
          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_46;
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
          goto LABEL_37;
        v22 += 7;
        v17 = v23++ >= 9;
        if (v17)
        {
          LODWORD(v24) = 0;
          goto LABEL_39;
        }
      }
      v4[*v8] = 1;
LABEL_37:
      if (v4[*v8])
        LODWORD(v24) = 0;
LABEL_39:
      if (v24 >= 4)
        LODWORD(v24) = 0;
      v5->_valueType = v24;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_46:
    v33 = 0;
  else
LABEL_47:
    v33 = v5;

  return v33;
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (self->_mediaPropertyType)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_dataValue)
    PBDataWriterWriteDataField();
  if (self->_stringValue)
    PBDataWriterWriteStringField();
  v4 = v5;
  if (self->_hasNumValue)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMHomeKitAccessoryState writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMHomeKitAccessoryState)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id *v10;
  id v11;
  id *v12;
  uint64_t v13;
  id *v14;
  uint64_t v15;
  BMHomeKitAccessoryState *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v23;
  uint64_t v24;
  id v25;
  id *v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  id *v37;
  id v38;
  id *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mediaPropertyType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("valueType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v16 = 0;
            goto LABEL_29;
          }
          v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v33 = a4;
          v34 = *MEMORY[0x1E0D025B8];
          v49 = *MEMORY[0x1E0CB2D50];
          v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("valueType"));
          v50 = v42;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v34, 2, v17);
          a4 = 0;
          v16 = 0;
          *v33 = v35;
LABEL_28:

LABEL_29:
          v7 = v40;
          goto LABEL_30;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMHomeKitAccessoryStateValueTypeFromString(v9));
        v10 = (id *)objc_claimAutoreleasedReturnValue();
      }
      v39 = v10;
    }
    else
    {
      v39 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dataValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v8;
    if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v42 = 0;
          v16 = 0;
          a4 = v39;
          goto LABEL_28;
        }
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v24 = *MEMORY[0x1E0D025B8];
        v47 = *MEMORY[0x1E0CB2D50];
        v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), objc_opt_class(), CFSTR("dataValue"));
        v48 = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 2, v18);
        v16 = 0;
        v42 = 0;
        v26 = a4;
        a4 = v39;
        *v26 = v25;
        goto LABEL_27;
      }
      v42 = v17;
    }
    else
    {
      v42 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("stringValue"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v19 = 0;
          v16 = 0;
          a4 = v39;
          goto LABEL_27;
        }
        v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v37 = a4;
        v28 = *MEMORY[0x1E0D025B8];
        v45 = *MEMORY[0x1E0CB2D50];
        v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("stringValue"));
        v46 = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v28, 2, v20);
        v16 = 0;
        v19 = 0;
        a4 = v39;
        *v37 = v29;
        goto LABEL_26;
      }
      v19 = v18;
    }
    else
    {
      v19 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numValue"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v36 = *MEMORY[0x1E0D025B8];
          v43 = *MEMORY[0x1E0CB2D50];
          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numValue"));
          v44 = v30;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v36, 2, v31);

        }
        v21 = 0;
        v16 = 0;
        a4 = v39;
        goto LABEL_26;
      }
      v21 = v20;
    }
    else
    {
      v21 = 0;
    }
    a4 = v39;
    v16 = -[BMHomeKitAccessoryState initWithMediaPropertyType:valueType:dataValue:stringValue:numValue:](self, "initWithMediaPropertyType:valueType:dataValue:stringValue:numValue:", v41, objc_msgSend(v39, "intValue"), v42, v19, v21);
    self = v16;
LABEL_26:

LABEL_27:
    v8 = v41;
    goto LABEL_28;
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
    v16 = 0;
    goto LABEL_31;
  }
  v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v12 = a4;
  v13 = *MEMORY[0x1E0D025B8];
  v51 = *MEMORY[0x1E0CB2D50];
  v14 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("mediaPropertyType"));
  v52[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13;
  a4 = v14;
  v8 = 0;
  v16 = 0;
  *v12 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", v15, 2, v9);
LABEL_30:

LABEL_31:
  return v16;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  -[BMHomeKitAccessoryState mediaPropertyType](self, "mediaPropertyType");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMHomeKitAccessoryState valueType](self, "valueType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHomeKitAccessoryState dataValue](self, "dataValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMHomeKitAccessoryState stringValue](self, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (-[BMHomeKitAccessoryState hasNumValue](self, "hasNumValue"))
  {
    -[BMHomeKitAccessoryState numValue](self, "numValue");
    if (fabs(v9) == INFINITY)
    {
      v8 = 0;
    }
    else
    {
      -[BMHomeKitAccessoryState numValue](self, "numValue");
      v10 = (void *)MEMORY[0x1E0CB37E8];
      -[BMHomeKitAccessoryState numValue](self, "numValue");
      objc_msgSend(v10, "numberWithDouble:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v18 = v3;
  v20[0] = CFSTR("mediaPropertyType");
  v11 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[0] = v11;
  v20[1] = CFSTR("valueType");
  v12 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[1] = v12;
  v20[2] = CFSTR("dataValue");
  v13 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[2] = v13;
  v20[3] = CFSTR("stringValue");
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[3] = v14;
  v20[4] = CFSTR("numValue");
  v15 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[4] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 5, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
      goto LABEL_17;
  }
  else
  {

    if (v7)
    {
LABEL_17:
      if (v6)
        goto LABEL_18;
LABEL_24:

      if (v4)
        goto LABEL_19;
      goto LABEL_25;
    }
  }

  if (!v6)
    goto LABEL_24;
LABEL_18:
  if (v4)
    goto LABEL_19;
LABEL_25:

LABEL_19:
  if (!v19)

  return v16;
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
  BOOL v12;
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
  double v26;
  double v27;
  double v28;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMHomeKitAccessoryState mediaPropertyType](self, "mediaPropertyType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaPropertyType");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMHomeKitAccessoryState mediaPropertyType](self, "mediaPropertyType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mediaPropertyType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_21;
    }
    v13 = -[BMHomeKitAccessoryState valueType](self, "valueType");
    if (v13 == objc_msgSend(v5, "valueType"))
    {
      -[BMHomeKitAccessoryState dataValue](self, "dataValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dataValue");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[BMHomeKitAccessoryState dataValue](self, "dataValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "dataValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_21;
      }
      -[BMHomeKitAccessoryState stringValue](self, "stringValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringValue");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[BMHomeKitAccessoryState stringValue](self, "stringValue");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringValue");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_21;
      }
      if (!-[BMHomeKitAccessoryState hasNumValue](self, "hasNumValue")
        && !objc_msgSend(v5, "hasNumValue"))
      {
        v12 = 1;
        goto LABEL_22;
      }
      if (-[BMHomeKitAccessoryState hasNumValue](self, "hasNumValue") && objc_msgSend(v5, "hasNumValue"))
      {
        -[BMHomeKitAccessoryState numValue](self, "numValue");
        v27 = v26;
        objc_msgSend(v5, "numValue");
        v12 = v27 == v28;
LABEL_22:

        goto LABEL_23;
      }
    }
LABEL_21:
    v12 = 0;
    goto LABEL_22;
  }
  v12 = 0;
LABEL_23:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)mediaPropertyType
{
  return self->_mediaPropertyType;
}

- (int)valueType
{
  return self->_valueType;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (double)numValue
{
  return self->_numValue;
}

- (BOOL)hasNumValue
{
  return self->_hasNumValue;
}

- (void)setHasNumValue:(BOOL)a3
{
  self->_hasNumValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_dataValue, 0);
  objc_storeStrong((id *)&self->_mediaPropertyType, 0);
}

+ (unsigned)latestDataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  __objc2_class **v6;
  void *v7;
  _DWORD *v8;

  v5 = a3;
  if (a4 == 1)
  {
    v6 = off_1E5E4AB18;
  }
  else
  {
    if (a4)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = off_1E5E4AB20;
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
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mediaPropertyType"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("valueType"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("dataValue"), 4, 0, 3, 14, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("stringValue"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numValue"), 1, 0, 5, 0, 0);
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
  return &unk_1E5F1E010;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mediaPropertyType"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("valueType"), 2, 4, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("dataValue"), 3, 14, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("stringValue"), 4, 13, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numValue"), 5, 0, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
