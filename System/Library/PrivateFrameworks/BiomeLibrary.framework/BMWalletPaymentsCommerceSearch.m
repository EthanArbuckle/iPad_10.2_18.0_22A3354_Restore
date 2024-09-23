@implementation BMWalletPaymentsCommerceSearch

- (BMWalletPaymentsCommerceSearch)initWithTagSource:(int)a3 tagType:(int)a4 passType:(int)a5 tagClickDate:(id)a6
{
  id v10;
  BMWalletPaymentsCommerceSearch *v11;
  double v12;
  objc_super v14;

  v10 = a6;
  v14.receiver = self;
  v14.super_class = (Class)BMWalletPaymentsCommerceSearch;
  v11 = -[BMEventBase init](&v14, sel_init);
  if (v11)
  {
    v11->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v11->_tagSource = a3;
    v11->_tagType = a4;
    v11->_passType = a5;
    if (v10)
    {
      v11->_hasTagClickDate = 1;
      objc_msgSend(v10, "doubleValue");
    }
    else
    {
      v11->_hasTagClickDate = 0;
      v12 = -1.0;
    }
    v11->_tagClickDate = v12;
  }

  return v11;
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
  BMWalletPaymentsCommerceSearchTagSourceAsString(-[BMWalletPaymentsCommerceSearch tagSource](self, "tagSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMWalletPaymentsCommerceSearchTagTypeAsString(-[BMWalletPaymentsCommerceSearch tagType](self, "tagType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMWalletPaymentsCommerceSearchPassTypeAsString(-[BMWalletPaymentsCommerceSearch passType](self, "passType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[BMWalletPaymentsCommerceSearch tagClickDate](self, "tagClickDate");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMWalletPaymentsCommerceSearch with tagSource: %@, tagType: %@, passType: %@, tagClickDate: %@"), v4, v5, v6, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMWalletPaymentsCommerceSearch *v5;
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
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  unint64_t v40;
  double v41;
  uint64_t v42;
  BMWalletPaymentsCommerceSearch *v43;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)BMWalletPaymentsCommerceSearch;
  v5 = -[BMEventBase init](&v45, sel_init);
  if (!v5)
    goto LABEL_70;
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
              goto LABEL_47;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_49;
            }
          }
          v4[*v8] = 1;
LABEL_47:
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_49:
          if (v22 >= 3)
            LODWORD(v22) = 0;
          v42 = 24;
          goto LABEL_64;
        case 2u:
          v27 = 0;
          v28 = 0;
          v22 = 0;
          while (2)
          {
            v29 = *v6;
            v30 = *(_QWORD *)&v4[v29];
            v31 = v30 + 1;
            if (v30 == -1 || v31 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v30);
              *(_QWORD *)&v4[v29] = v31;
              v22 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                v17 = v28++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_55;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_55:
          if (v22 >= 0x12)
            LODWORD(v22) = 0;
          v42 = 28;
          goto LABEL_64;
        case 3u:
          v33 = 0;
          v34 = 0;
          v22 = 0;
          break;
        case 4u:
          v5->_hasTagClickDate = 1;
          v39 = *v6;
          v40 = *(_QWORD *)&v4[v39];
          if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v41 = *(double *)(*(_QWORD *)&v4[*v9] + v40);
            *(_QWORD *)&v4[v39] = v40 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v41 = 0.0;
          }
          v5->_tagClickDate = v41;
          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_69;
          continue;
      }
      while (1)
      {
        v35 = *v6;
        v36 = *(_QWORD *)&v4[v35];
        v37 = v36 + 1;
        if (v36 == -1 || v37 > *(_QWORD *)&v4[*v7])
          break;
        v38 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v36);
        *(_QWORD *)&v4[v35] = v37;
        v22 |= (unint64_t)(v38 & 0x7F) << v33;
        if ((v38 & 0x80) == 0)
          goto LABEL_59;
        v33 += 7;
        v17 = v34++ >= 9;
        if (v17)
        {
          LODWORD(v22) = 0;
          goto LABEL_61;
        }
      }
      v4[*v8] = 1;
LABEL_59:
      if (v4[*v8])
        LODWORD(v22) = 0;
LABEL_61:
      if (v22 >= 3)
        LODWORD(v22) = 0;
      v42 = 32;
LABEL_64:
      *(_DWORD *)((char *)&v5->super.super.isa + v42) = v22;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_69:
    v43 = 0;
  else
LABEL_70:
    v43 = v5;

  return v43;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasTagClickDate)
    PBDataWriterWriteDoubleField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMWalletPaymentsCommerceSearch writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMWalletPaymentsCommerceSearch)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  BMWalletPaymentsCommerceSearch *v15;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id *v21;
  id v22;
  uint64_t v23;
  id v24;
  id *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id *v29;
  BMWalletPaymentsCommerceSearch *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tagSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = self;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v32 = 0;
          v15 = 0;
          goto LABEL_31;
        }
        v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v20 = *MEMORY[0x1E0D025B8];
        v39 = *MEMORY[0x1E0CB2D50];
        v21 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("tagSource"));
        v40[0] = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0;
        v15 = 0;
        *a4 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 2, v8);
        a4 = v21;
        goto LABEL_45;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMWalletPaymentsCommerceSearchTagSourceFromString(v7));
      v32 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v32 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tagType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;
LABEL_15:
        v29 = v9;
        goto LABEL_16;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMWalletPaymentsCommerceSearchTagTypeFromString(v8));
        v9 = (id *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      if (a4)
      {
        v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v23 = *MEMORY[0x1E0D025B8];
        v37 = *MEMORY[0x1E0CB2D50];
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("tagType"));
        v38 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
        *a4 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v23, 2, v10);
        a4 = 0;
        self = v30;
        goto LABEL_29;
      }
      v15 = 0;
LABEL_45:
      self = v30;
      goto LABEL_30;
    }
  }
  v29 = 0;
LABEL_16:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("passType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v10;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v11 = 0;
          v15 = 0;
          a4 = v29;
          goto LABEL_29;
        }
        v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v25 = a4;
        v26 = *MEMORY[0x1E0D025B8];
        v35 = *MEMORY[0x1E0CB2D50];
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("passType"));
        v36 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v26, 2, v13);
        v11 = 0;
        v15 = 0;
        *v25 = v27;
        a4 = v29;
        self = v30;
        goto LABEL_28;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMWalletPaymentsCommerceSearchPassTypeFromString(v10));
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v12;
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tagClickDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v28 = *MEMORY[0x1E0D025B8];
        v33 = *MEMORY[0x1E0CB2D50];
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("tagClickDate"));
        v34 = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v28, 2, v18);

      }
      v14 = 0;
      v15 = 0;
      a4 = v29;
      goto LABEL_28;
    }
    v14 = v13;
  }
  else
  {
    v14 = 0;
  }
  a4 = v29;
  self = -[BMWalletPaymentsCommerceSearch initWithTagSource:tagType:passType:tagClickDate:](self, "initWithTagSource:tagType:passType:tagClickDate:", objc_msgSend(v32, "intValue"), objc_msgSend(v29, "intValue"), objc_msgSend(v11, "intValue"), v14);
  v15 = self;
LABEL_28:

LABEL_29:
LABEL_30:

LABEL_31:
  return v15;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMWalletPaymentsCommerceSearch tagSource](self, "tagSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMWalletPaymentsCommerceSearch tagType](self, "tagType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMWalletPaymentsCommerceSearch passType](self, "passType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMWalletPaymentsCommerceSearch hasTagClickDate](self, "hasTagClickDate")
    || (-[BMWalletPaymentsCommerceSearch tagClickDate](self, "tagClickDate"), fabs(v6) == INFINITY))
  {
    v8 = 0;
  }
  else
  {
    -[BMWalletPaymentsCommerceSearch tagClickDate](self, "tagClickDate");
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[BMWalletPaymentsCommerceSearch tagClickDate](self, "tagClickDate");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[0] = CFSTR("tagSource");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[0] = v9;
  v15[1] = CFSTR("tagType");
  v10 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[1] = v10;
  v15[2] = CFSTR("passType");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[2] = v11;
  v15[3] = CFSTR("tagClickDate");
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
    if (v5)
      goto LABEL_15;
  }
  else
  {

    if (v5)
    {
LABEL_15:
      if (v4)
        goto LABEL_16;
LABEL_20:

      if (v3)
        goto LABEL_17;
LABEL_21:

      goto LABEL_17;
    }
  }

  if (!v4)
    goto LABEL_20;
LABEL_16:
  if (!v3)
    goto LABEL_21;
LABEL_17:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMWalletPaymentsCommerceSearch tagSource](self, "tagSource");
    if (v6 != objc_msgSend(v5, "tagSource"))
      goto LABEL_11;
    v7 = -[BMWalletPaymentsCommerceSearch tagType](self, "tagType");
    if (v7 != objc_msgSend(v5, "tagType"))
      goto LABEL_11;
    v8 = -[BMWalletPaymentsCommerceSearch passType](self, "passType");
    if (v8 != objc_msgSend(v5, "passType"))
      goto LABEL_11;
    if (!-[BMWalletPaymentsCommerceSearch hasTagClickDate](self, "hasTagClickDate")
      && !objc_msgSend(v5, "hasTagClickDate"))
    {
      v12 = 1;
      goto LABEL_12;
    }
    if (-[BMWalletPaymentsCommerceSearch hasTagClickDate](self, "hasTagClickDate")
      && objc_msgSend(v5, "hasTagClickDate"))
    {
      -[BMWalletPaymentsCommerceSearch tagClickDate](self, "tagClickDate");
      v10 = v9;
      objc_msgSend(v5, "tagClickDate");
      v12 = v10 == v11;
    }
    else
    {
LABEL_11:
      v12 = 0;
    }
LABEL_12:

    goto LABEL_13;
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)tagSource
{
  return self->_tagSource;
}

- (int)tagType
{
  return self->_tagType;
}

- (int)passType
{
  return self->_passType;
}

- (double)tagClickDate
{
  return self->_tagClickDate;
}

- (BOOL)hasTagClickDate
{
  return self->_hasTagClickDate;
}

- (void)setHasTagClickDate:(BOOL)a3
{
  self->_hasTagClickDate = a3;
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

    v4 = -[BMWalletPaymentsCommerceSearch initByReadFrom:]([BMWalletPaymentsCommerceSearch alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("tagSource"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("tagType"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("passType"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("tagClickDate"), 1, 0, 4, 0, 0);
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
  return &unk_1E5F1EE98;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tagSource"), 1, 4, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tagType"), 2, 4, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("passType"), 3, 4, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tagClickDate"), 4, 0, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
