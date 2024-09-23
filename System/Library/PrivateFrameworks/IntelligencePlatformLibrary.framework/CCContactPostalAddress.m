@implementation CCContactPostalAddress

- (CCContactPostalAddress)initWithLabel:(id)a3 street:(id)a4 subLocality:(id)a5 city:(id)a6 subAdministrativeArea:(id)a7 state:(id)a8 postalCode:(id)a9 country:(id)a10 ISOCountryCode:(id)a11 error:(id *)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  int IsInstanceOfExpectedClass;
  id v24;
  id v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  CCContactPostalAddress *v32;
  int v33;
  int v34;
  CCContactPostalAddress *v35;
  void *v37;
  id v39;
  id v40;
  id v41;
  id v42;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v42 = a8;
  v40 = a9;
  v41 = a10;
  v39 = a11;
  v22 = (void *)objc_opt_new();
  if (v17)
  {
    objc_opt_class();
    IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    v24 = 0;
    if (!IsInstanceOfExpectedClass)
      goto LABEL_25;
    CCPBDataWriterWriteStringField();
    if (!v18)
    {
LABEL_4:
      v25 = v24;
      if (v19)
        goto LABEL_5;
LABEL_13:
      v24 = v25;
      if (!v20)
        goto LABEL_7;
LABEL_14:
      objc_opt_class();
      v29 = CCValidateIsInstanceOfExpectedClass();
      v25 = v24;

      if (!v29)
        goto LABEL_32;
      CCPBDataWriterWriteStringField();
      if (v21)
        goto LABEL_8;
LABEL_16:
      v24 = v25;
      goto LABEL_17;
    }
  }
  else
  {
    v24 = 0;
    if (!v18)
      goto LABEL_4;
  }
  objc_opt_class();
  v28 = CCValidateIsInstanceOfExpectedClass();
  v25 = v24;

  if (!v28)
    goto LABEL_32;
  CCPBDataWriterWriteStringField();
  if (!v19)
    goto LABEL_13;
LABEL_5:
  objc_opt_class();
  v26 = CCValidateIsInstanceOfExpectedClass();
  v24 = v25;

  if (!v26)
    goto LABEL_25;
  CCPBDataWriterWriteStringField();
  if (v20)
    goto LABEL_14;
LABEL_7:
  v25 = v24;
  if (!v21)
    goto LABEL_16;
LABEL_8:
  objc_opt_class();
  v27 = CCValidateIsInstanceOfExpectedClass();
  v24 = v25;

  if (!v27)
    goto LABEL_25;
  CCPBDataWriterWriteStringField();
LABEL_17:
  if (v42)
  {
    objc_opt_class();
    v30 = CCValidateIsInstanceOfExpectedClass();
    v25 = v24;

    if (v30)
    {
      CCPBDataWriterWriteStringField();
      goto LABEL_21;
    }
LABEL_32:
    CCSetError();
    v32 = 0;
    v24 = v25;
    goto LABEL_33;
  }
  v25 = v24;
LABEL_21:
  if (!v40)
  {
    v24 = v25;
    if (!v41)
      goto LABEL_24;
    goto LABEL_27;
  }
  objc_opt_class();
  v31 = CCValidateIsInstanceOfExpectedClass();
  v24 = v25;

  if (!v31)
  {
LABEL_25:
    CCSetError();
    v32 = 0;
LABEL_33:
    v35 = self;
    goto LABEL_34;
  }
  CCPBDataWriterWriteStringField();
  if (v41)
  {
LABEL_27:
    objc_opt_class();
    v33 = CCValidateIsInstanceOfExpectedClass();
    v25 = v24;

    if (v33)
    {
      CCPBDataWriterWriteStringField();
      goto LABEL_29;
    }
    goto LABEL_32;
  }
LABEL_24:
  v25 = v24;
LABEL_29:
  if (v39)
  {
    objc_opt_class();
    v34 = CCValidateIsInstanceOfExpectedClass();
    v24 = v25;

    v35 = self;
    if (!v34)
    {
      CCSetError();
      v32 = 0;
      goto LABEL_34;
    }
    CCPBDataWriterWriteStringField();
  }
  else
  {
    v24 = v25;
    v35 = self;
  }
  objc_msgSend(v22, "immutableData");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[CCItemMessage initWithData:error:](v35, "initWithData:error:", v37, a12);

  v32 = v35;
LABEL_34:

  return v32;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v5;
  char *v6;
  int *v7;
  int *v8;
  int *v9;
  void *v10;
  int *v11;
  BOOL v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  objc_class *v20;
  uint64_t v21;
  void *v22;
  objc_class *v23;
  objc_class *v24;
  void *v25;
  BOOL v26;

  v5 = a3;
  v6 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v5);
  v7 = (int *)MEMORY[0x24BE15728];
  v8 = (int *)MEMORY[0x24BE15720];
  v9 = (int *)MEMORY[0x24BE15718];
  if (*(_QWORD *)&v6[*MEMORY[0x24BE15728]] < *(_QWORD *)&v6[*MEMORY[0x24BE15720]])
  {
    v10 = 0;
    v11 = (int *)MEMORY[0x24BE15710];
LABEL_3:
    if (*(_QWORD *)&v6[*v9])
      v12 = 0;
    else
      v12 = v10 == 0;
    if (v12)
    {
      v13 = 0;
      v14 = 0;
      v15 = 0;
      while (1)
      {
        v16 = *v7;
        v17 = *(_QWORD *)&v6[v16];
        if (v17 == -1 || v17 >= *(_QWORD *)&v6[*v8])
          break;
        v18 = *(_BYTE *)(*(_QWORD *)&v6[*v11] + v17);
        *(_QWORD *)&v6[v16] = v17 + 1;
        v15 |= (unint64_t)(v18 & 0x7F) << v13;
        if ((v18 & 0x80) == 0)
          goto LABEL_17;
        v13 += 7;
        if (v14++ >= 9)
        {
          v15 = 0;
          if (*(_QWORD *)&v6[*v9])
            goto LABEL_38;
LABEL_18:
          switch((v15 >> 3))
          {
            case 1u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              v21 = 16;
              goto LABEL_30;
            case 2u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              v21 = 24;
              goto LABEL_30;
            case 3u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              v21 = 32;
              goto LABEL_30;
            case 4u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              v21 = 40;
              goto LABEL_30;
            case 5u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              v21 = 48;
              goto LABEL_30;
            case 6u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              v21 = 56;
              goto LABEL_30;
            case 7u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              v21 = 64;
              goto LABEL_30;
            case 8u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              v21 = 72;
              goto LABEL_30;
            case 9u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              v21 = 80;
LABEL_30:
              v22 = *(Class *)((char *)&self->super.super.isa + v21);
              *(Class *)((char *)&self->super.super.isa + v21) = v20;
              goto LABEL_31;
            default:
              if ((CCPBReaderSkipValueWithTag() & 1) != 0)
              {
                v10 = 0;
              }
              else
              {
                v23 = (objc_class *)objc_opt_class();
                NSStringFromClass(v23);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                CCSkipFieldErrorForMessage();
                v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:

              }
              if (*(_QWORD *)&v6[*v7] >= *(_QWORD *)&v6[*v8])
                goto LABEL_35;
              goto LABEL_3;
          }
        }
      }
      *(_QWORD *)&v6[*v9] = 1;
LABEL_17:
      if (!*(_QWORD *)&v6[*v9])
        goto LABEL_18;
LABEL_38:
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      CCInvalidBufferErrorForMessage();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      CCSetError();

      goto LABEL_39;
    }
LABEL_35:
    if (v10)
    {
      CCSetError();
LABEL_39:

      v26 = 0;
      goto LABEL_41;
    }
  }
  if (*(_QWORD *)&v6[*v9])
    goto LABEL_38;
  v26 = 1;
LABEL_41:

  return v26;
}

- (NSString)label
{
  return (NSString *)(id)-[NSString copy](self->_label, "copy");
}

- (NSString)street
{
  return (NSString *)(id)-[NSString copy](self->_street, "copy");
}

- (NSString)subLocality
{
  return (NSString *)(id)-[NSString copy](self->_subLocality, "copy");
}

- (NSString)city
{
  return (NSString *)(id)-[NSString copy](self->_city, "copy");
}

- (NSString)subAdministrativeArea
{
  return (NSString *)(id)-[NSString copy](self->_subAdministrativeArea, "copy");
}

- (NSString)state
{
  return (NSString *)(id)-[NSString copy](self->_state, "copy");
}

- (NSString)postalCode
{
  return (NSString *)(id)-[NSString copy](self->_postalCode, "copy");
}

- (NSString)country
{
  return (NSString *)(id)-[NSString copy](self->_country, "copy");
}

- (NSString)ISOCountryCode
{
  return (NSString *)(id)-[NSString copy](self->_ISOCountryCode, "copy");
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(id, void *);

  v14 = (void (**)(id, void *))a3;
  if (self->_label)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19749, self->_label);
    v14[2](v14, v5);

  }
  if (self->_street)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19750, self->_street);
    v14[2](v14, v6);

  }
  if (self->_subLocality)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19751, self->_subLocality);
    v14[2](v14, v7);

  }
  if (self->_city)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19752, self->_city);
    v14[2](v14, v8);

  }
  if (self->_subAdministrativeArea)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19753, self->_subAdministrativeArea);
    v14[2](v14, v9);

  }
  if (self->_state)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19754, self->_state);
    v14[2](v14, v10);

  }
  if (self->_postalCode)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19755, self->_postalCode);
    v14[2](v14, v11);

  }
  if (self->_country)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19756, self->_country);
    v14[2](v14, v12);

  }
  if (self->_ISOCountryCode)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 19757, self->_ISOCountryCode);
    v14[2](v14, v13);

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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_opt_new();
  if (self->_label)
  {
    -[CCContactPostalAddress label](self, "label");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("label"));

  }
  if (self->_street)
  {
    -[CCContactPostalAddress street](self, "street");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("street"));

  }
  if (self->_subLocality)
  {
    -[CCContactPostalAddress subLocality](self, "subLocality");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("subLocality"));

  }
  if (self->_city)
  {
    -[CCContactPostalAddress city](self, "city");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("city"));

  }
  if (self->_subAdministrativeArea)
  {
    -[CCContactPostalAddress subAdministrativeArea](self, "subAdministrativeArea");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("subAdministrativeArea"));

  }
  if (self->_state)
  {
    -[CCContactPostalAddress state](self, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("state"));

  }
  if (self->_postalCode)
  {
    -[CCContactPostalAddress postalCode](self, "postalCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("postalCode"));

  }
  if (self->_country)
  {
    -[CCContactPostalAddress country](self, "country");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("country"));

  }
  if (self->_ISOCountryCode)
  {
    -[CCContactPostalAddress ISOCountryCode](self, "ISOCountryCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("ISOCountryCode"));

  }
  v13 = (void *)objc_msgSend(v3, "copy");

  return v13;
}

- (CCContactPostalAddress)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CCContactPostalAddress *v15;
  void *v17;
  void *v18;
  void *v19;
  CCContactPostalAddress *v20;

  v6 = a3;
  objc_opt_class();
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("label"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("street"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subLocality"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("city"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subAdministrativeArea"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("state"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("postalCode"));
    v20 = self;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("country"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ISOCountryCode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CCContactPostalAddress initWithLabel:street:subLocality:city:subAdministrativeArea:state:postalCode:country:ISOCountryCode:error:]([CCContactPostalAddress alloc], "initWithLabel:street:subLocality:city:subAdministrativeArea:state:postalCode:country:ISOCountryCode:error:", v18, v9, v19, v10, v11, v12, v17, v13, v14, a4);

    self = v20;
  }
  else
  {
    CCSetError();
    v15 = 0;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ISOCountryCode, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_street, 0);
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
