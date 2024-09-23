@implementation CCContactDate

- (CCContactDate)initWithLabel:(id)a3 year:(id)a4 month:(id)a5 day:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int IsInstanceOfExpectedClass;
  id v18;
  int v19;
  id v20;
  int v21;
  int v22;
  void *v23;
  CCContactDate *v24;
  id v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void *)objc_opt_new();
  if (v12)
  {
    objc_opt_class();
    IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    v18 = 0;
    if (!IsInstanceOfExpectedClass)
      goto LABEL_16;
    CCPBDataWriterWriteStringField();
  }
  else
  {
    v18 = 0;
  }
  if (v13)
  {
    objc_opt_class();
    v19 = CCValidateIsInstanceOfExpectedClass();
    v20 = v18;

    if (!v19)
      goto LABEL_17;
    objc_msgSend(v13, "unsignedIntValue");
    CCPBDataWriterWriteUint32Field();
    if (!v14)
      goto LABEL_8;
  }
  else
  {
    v20 = v18;
    if (!v14)
    {
LABEL_8:
      v18 = v20;
      if (!v15)
        goto LABEL_15;
LABEL_13:
      objc_opt_class();
      v26 = v18;
      v22 = CCValidateIsInstanceOfExpectedClass();
      v20 = v18;

      if (v22)
      {
        objc_msgSend(v15, "unsignedIntValue");
        CCPBDataWriterWriteUint32Field();
        v18 = v20;
        goto LABEL_15;
      }
LABEL_17:
      CCSetError();
      v24 = 0;
      v18 = v20;
      goto LABEL_18;
    }
  }
  objc_opt_class();
  v21 = CCValidateIsInstanceOfExpectedClass();
  v18 = v20;

  if (!v21)
  {
LABEL_16:
    CCSetError();
    v24 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v14, "unsignedIntValue");
  CCPBDataWriterWriteUint32Field();
  if (v15)
    goto LABEL_13;
LABEL_15:
  objc_msgSend(v16, "immutableData", v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[CCItemMessage initWithData:error:](self, "initWithData:error:", v23, a7);

  v24 = self;
LABEL_18:

  return v24;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v6;
  char *v7;
  int *v8;
  int *v9;
  int *v10;
  void *v11;
  int *v12;
  BOOL v13;
  char v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  BOOL v20;
  NSString *v21;
  NSString *label;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  uint64_t v41;
  objc_class *v42;
  id *v43;
  id v44;
  void *v45;
  objc_class *v46;
  void *v47;
  BOOL v48;
  CCContactDate *v50;

  v6 = a3;
  v7 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v6);
  v8 = (int *)MEMORY[0x24BE15728];
  v9 = (int *)MEMORY[0x24BE15720];
  v10 = (int *)MEMORY[0x24BE15718];
  if (*(_QWORD *)&v7[*MEMORY[0x24BE15728]] >= *(_QWORD *)&v7[*MEMORY[0x24BE15720]])
    goto LABEL_60;
  v11 = 0;
  v12 = (int *)MEMORY[0x24BE15710];
  do
  {
    if (*(_QWORD *)&v7[*v10])
      v13 = 0;
    else
      v13 = v11 == 0;
    if (!v13)
      break;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    while (1)
    {
      v17 = *v8;
      v18 = *(_QWORD *)&v7[v17];
      if (v18 == -1 || v18 >= *(_QWORD *)&v7[*v9])
        break;
      v19 = *(_BYTE *)(*(_QWORD *)&v7[*v12] + v18);
      *(_QWORD *)&v7[v17] = v18 + 1;
      v16 |= (unint64_t)(v19 & 0x7F) << v14;
      if ((v19 & 0x80) == 0)
        goto LABEL_17;
      v14 += 7;
      v20 = v15++ >= 9;
      if (v20)
      {
        v16 = 0;
        if (*(_QWORD *)&v7[*v10])
          goto LABEL_61;
        goto LABEL_18;
      }
    }
    *(_QWORD *)&v7[*v10] = 1;
LABEL_17:
    if (*(_QWORD *)&v7[*v10])
      goto LABEL_61;
LABEL_18:
    switch((v16 >> 3))
    {
      case 1u:
        CCPBReaderReadStringNoCopy();
        v21 = (NSString *)objc_claimAutoreleasedReturnValue();
        label = self->_label;
        self->_label = v21;

        v11 = 0;
        continue;
      case 2u:
        v23 = 0;
        v24 = 0;
        v25 = 0;
        while (1)
        {
          v26 = *v8;
          v27 = *(_QWORD *)&v7[v26];
          if (v27 == -1 || v27 >= *(_QWORD *)&v7[*v9])
            break;
          v28 = *(_BYTE *)(*(_QWORD *)&v7[*v12] + v27);
          *(_QWORD *)&v7[v26] = v27 + 1;
          v25 |= (unint64_t)(v28 & 0x7F) << v23;
          if ((v28 & 0x80) == 0)
            goto LABEL_44;
          v23 += 7;
          v20 = v24++ >= 9;
          if (v20)
          {
            LODWORD(v25) = 0;
            goto LABEL_46;
          }
        }
        *(_QWORD *)&v7[*v10] = 1;
LABEL_44:
        if (*(_QWORD *)&v7[*v10])
          LODWORD(v25) = 0;
LABEL_46:
        v11 = 0;
        self->_year = v25;
        v41 = 16;
        goto LABEL_55;
      case 3u:
        v29 = 0;
        v30 = 0;
        v31 = 0;
        while (2)
        {
          v32 = *v8;
          v33 = *(_QWORD *)&v7[v32];
          if (v33 == -1 || v33 >= *(_QWORD *)&v7[*v9])
          {
            *(_QWORD *)&v7[*v10] = 1;
          }
          else
          {
            v34 = *(_BYTE *)(*(_QWORD *)&v7[*v12] + v33);
            *(_QWORD *)&v7[v32] = v33 + 1;
            v31 |= (unint64_t)(v34 & 0x7F) << v29;
            if (v34 < 0)
            {
              v29 += 7;
              v20 = v30++ >= 9;
              if (v20)
              {
                LODWORD(v31) = 0;
                goto LABEL_50;
              }
              continue;
            }
          }
          break;
        }
        if (*(_QWORD *)&v7[*v10])
          LODWORD(v31) = 0;
LABEL_50:
        v11 = 0;
        self->_month = v31;
        v41 = 17;
        goto LABEL_55;
      case 4u:
        v35 = 0;
        v36 = 0;
        v37 = 0;
        break;
      default:
        if ((CCPBReaderSkipValueWithTag() & 1) != 0)
        {
          v11 = 0;
        }
        else
        {
          v42 = (objc_class *)objc_opt_class();
          NSStringFromClass(v42);
          v50 = self;
          v43 = a4;
          v44 = v6;
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          CCSkipFieldErrorForMessage();
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v6 = v44;
          a4 = v43;
          self = v50;
        }
        continue;
    }
    while (1)
    {
      v38 = *v8;
      v39 = *(_QWORD *)&v7[v38];
      if (v39 == -1 || v39 >= *(_QWORD *)&v7[*v9])
        break;
      v40 = *(_BYTE *)(*(_QWORD *)&v7[*v12] + v39);
      *(_QWORD *)&v7[v38] = v39 + 1;
      v37 |= (unint64_t)(v40 & 0x7F) << v35;
      if ((v40 & 0x80) == 0)
        goto LABEL_52;
      v35 += 7;
      v20 = v36++ >= 9;
      if (v20)
      {
        LODWORD(v37) = 0;
        goto LABEL_54;
      }
    }
    *(_QWORD *)&v7[*v10] = 1;
LABEL_52:
    if (*(_QWORD *)&v7[*v10])
      LODWORD(v37) = 0;
LABEL_54:
    v11 = 0;
    self->_day = v37;
    v41 = 18;
LABEL_55:
    *((_BYTE *)&self->super.super.isa + v41) = 1;
  }
  while (*(_QWORD *)&v7[*v8] < *(_QWORD *)&v7[*v9]);
  if (v11)
  {
    CCSetError();
  }
  else
  {
LABEL_60:
    if (!*(_QWORD *)&v7[*v10])
    {
      v48 = 1;
      goto LABEL_64;
    }
LABEL_61:
    v46 = (objc_class *)objc_opt_class();
    NSStringFromClass(v46);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

  }
  v48 = 0;
LABEL_64:

  return v48;
}

- (NSString)label
{
  return (NSString *)(id)-[NSString copy](self->_label, "copy");
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  int v4;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void (**v14)(id, void *);

  v4 = a4;
  v14 = (void (**)(id, void *))a3;
  if (self->_label)
  {
    switch(v4)
    {
      case 19701:
        v6 = 19713;
        break;
      case 19705:
        v6 = 19769;
        break;
      case 19702:
        v6 = 19740;
        break;
      default:
        goto LABEL_9;
    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", v6, self->_label);
    v14[2](v14, v7);

  }
LABEL_9:
  if (!self->_hasYear)
    goto LABEL_17;
  switch(v4)
  {
    case 19701:
      v8 = 19734;
      break;
    case 19705:
      v8 = 19773;
      break;
    case 19702:
      v8 = 19737;
      break;
    default:
      goto LABEL_17;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:uint32Value:", v8, self->_year);
  v14[2](v14, v9);

LABEL_17:
  if (!self->_hasMonth)
    goto LABEL_25;
  switch(v4)
  {
    case 19701:
      v10 = 19735;
      break;
    case 19705:
      v10 = 19774;
      break;
    case 19702:
      v10 = 19738;
      break;
    default:
      goto LABEL_25;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:uint32Value:", v10, self->_month);
  v14[2](v14, v11);

LABEL_25:
  if (self->_hasDay)
  {
    switch(v4)
    {
      case 19701:
        v12 = 19736;
        goto LABEL_32;
      case 19705:
        v12 = 19775;
        goto LABEL_32;
      case 19702:
        v12 = 19739;
LABEL_32:
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:uint32Value:", v12, self->_day);
        v14[2](v14, v13);

        break;
    }
  }

}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  if (self->_label)
  {
    -[CCContactDate label](self, "label");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("label"));

  }
  if (self->_hasYear)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[CCContactDate year](self, "year"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("year"));

  }
  if (self->_hasMonth)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[CCContactDate month](self, "month"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("month"));

  }
  if (self->_hasDay)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[CCContactDate day](self, "day"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("day"));

  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (CCContactDate)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CCContactDate *v13;

  v6 = a3;
  objc_opt_class();
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("label"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("year"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("month"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("day"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CCContactDate initWithLabel:year:month:day:error:]([CCContactDate alloc], "initWithLabel:year:month:day:error:", v9, v10, v11, v12, a4);

  }
  else
  {
    CCSetError();
    v13 = 0;
  }

  return v13;
}

- (unsigned)year
{
  return self->_year;
}

- (unsigned)month
{
  return self->_month;
}

- (unsigned)day
{
  return self->_day;
}

- (BOOL)hasYear
{
  return self->_hasYear;
}

- (void)setHasYear:(BOOL)a3
{
  self->_hasYear = a3;
}

- (BOOL)hasMonth
{
  return self->_hasMonth;
}

- (void)setHasMonth:(BOOL)a3
{
  self->_hasMonth = a3;
}

- (BOOL)hasDay
{
  return self->_hasDay;
}

- (void)setHasDay:(BOOL)a3
{
  self->_hasDay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

+ (unsigned)itemType
{
  return 19668;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  return 0;
}

+ (Class)metaContentMessageClass
{
  return (Class)objc_opt_class();
}

+ (Class)contentMessageClass
{
  return (Class)objc_opt_class();
}

@end
