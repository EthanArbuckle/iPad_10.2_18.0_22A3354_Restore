@implementation INCodable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customValueForKeyDictionary, 0);
  objc_storeStrong((id *)&self->_objectDescription, 0);
}

- (id)valueForPropertyNamed:(id)a3
{
  NSMutableDictionary *customValueForKeyDictionary;
  void *v4;
  void *v5;

  customValueForKeyDictionary = self->_customValueForKeyDictionary;
  objc_msgSend(a3, "if_stringByLowercasingFirstCharacter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](customValueForKeyDictionary, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (INCodable)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  INCodable *v18;
  INCodable *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v28;
  id v29;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_decodeBytesNoCopyForKey:", CFSTR("codableDescriptionBytes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14
    || (objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codableDescriptionData")),
        (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v29 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "_in_safeUnarchivedObjectOfClasses:fromData:error:", v13, v14, &v29);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v29;
    if (v16)
    {
      v17 = v16;
      objc_msgSend(v3, "failWithError:", v16);
      v18 = 0;
      v19 = self;
      goto LABEL_12;
    }
  }
  else
  {
    objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v13, CFSTR("_objectDescription"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "if_decodeBytesNoCopyForKey:", CFSTR("bytes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)MEMORY[0x1E0C99E60];
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v23, CFSTR("_nonNilRepeatedAttributes"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0;
  v19 = -[INCodable _initWithCodableDescription:data:error:](self, "_initWithCodableDescription:data:error:", v15, v17, &v28);
  v25 = v28;
  -[INCodable _setEmptyArrayForNonNilRepeatedAttributes:](v19, "_setEmptyArrayForNonNilRepeatedAttributes:", v24);
  if (v25)
  {
    objc_msgSend(v3, "failWithError:", v25);
    v18 = 0;
  }
  else
  {
    v18 = v19;
  }

LABEL_12:
  return v18;
}

uint64_t __29__INCodable__readFrom_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  char isKindOfClass;
  id v19;
  void *v20;
  id v21;
  NSString *v22;
  INCodable *v23;
  id v24;
  NSString *v25;
  Class v26;
  uint64_t v27;
  _QWORD *v28;
  int v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "propertyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "modifier") && !v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v3, "propertyName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v3;
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v16 = v10;

    objc_msgSend(v16, "valueTransformer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v16;
    if (v12
      && (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v12, (isKindOfClass & 1) != 0))
    {
      v19 = v12;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
      v21 = v20;

      objc_msgSend(v21, "codableDescription");
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v23 = -[INCodable initWithCodableDescription:data:]([INCodable alloc], "initWithCodableDescription:data:", v22, 0);
LABEL_26:
        v24 = v23;

        if (!PBReaderPlaceMark() || !objc_msgSend(v24, "readFrom:", *(_QWORD *)(a1 + 40)))
          goto LABEL_33;
LABEL_27:
        if (v17)
        {
          objc_msgSend(v17, "reverseTransformedValue:", v24);
          v27 = objc_claimAutoreleasedReturnValue();

          v24 = (id)v27;
        }
        PBReaderRecallMark();
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        v28 = *(_QWORD **)(a1 + 64);
        if (!v28 || !*v28)
          v29 = 0;
        else
LABEL_33:
          v29 = 1;
LABEL_34:

        if (!v29)
        {
LABEL_54:
          v43 = objc_msgSend(*(id *)(a1 + 40), "hasError") ^ 1;
          goto LABEL_55;
        }
        goto LABEL_45;
      }
      if (*(_QWORD *)(a1 + 64))
      {
        v39 = (void *)MEMORY[0x1E0CB35C8];
        v56 = *MEMORY[0x1E0CB2938];
        v40 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v19, "typeName");
        v24 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "stringWithFormat:", CFSTR("Unknown codable description for custom type: %@"), v24);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = v41;
        v29 = 1;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 8001, v42);
        **(_QWORD **)(a1 + 64) = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_34;
      }
    }
    else
    {
      if (v17)
      {
        v24 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "reverseTransformedValueClass"));
        goto LABEL_27;
      }
      objc_msgSend(v12, "typeName");
      v25 = (NSString *)objc_claimAutoreleasedReturnValue();
      v26 = NSClassFromString(v25);
      LODWORD(v26) = -[objc_class isSubclassOfClass:](v26, "isSubclassOfClass:", objc_opt_class());

      if ((_DWORD)v26)
      {
        objc_msgSend(v12, "typeName");
        v22 = (NSString *)objc_claimAutoreleasedReturnValue();
        v23 = (INCodable *)objc_alloc_init(NSClassFromString(v22));
        goto LABEL_26;
      }
      if (*(_QWORD *)(a1 + 64))
      {
        v35 = (void *)MEMORY[0x1E0CB35C8];
        v54 = *MEMORY[0x1E0CB2938];
        v36 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "typeName");
        v24 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringWithFormat:", CFSTR("Unknown type %@"), v24);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v37;
        v29 = 1;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 8001, v38);
        **(_QWORD **)(a1 + 64) = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_34;
      }
    }

LABEL_44:
    goto LABEL_45;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "readInt32"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setObject:forAttribute:", v12, v3);
LABEL_53:

    goto LABEL_54;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v3;
    switch(objc_msgSend(v12, "type"))
    {
      case 0:
        v13 = (void *)MEMORY[0x1E0CB37E8];
        v14 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 40), "readDouble");
        objc_msgSend(v13, "numberWithDouble:");
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_52;
      case 1:
        v44 = (void *)MEMORY[0x1E0CB37E8];
        v14 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 40), "readFloat");
        objc_msgSend(v44, "numberWithFloat:");
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_52;
      case 2:
        v14 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "readInt32"));
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_52;
      case 3:
        v14 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "readInt64"));
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_52;
      case 4:
        v14 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "readUint32"));
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_52;
      case 5:
        v14 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 40), "readUint64"));
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_52;
      case 6:
        v14 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "readBOOL"));
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_52:
        v45 = (void *)v15;
        objc_msgSend(v14, "_setObject:forAttribute:", v15, v12);

        goto LABEL_53;
      case 7:
        v47 = *(_QWORD *)(a1 + 56);
        objc_msgSend(*(id *)(a1 + 40), "readString");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "_intents_decodeFromProto");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, id, void *, _QWORD))(v47 + 16))(v47, v49, v12, v6, *(_QWORD *)(a1 + 64));

        goto LABEL_58;
      case 8:
        v50 = *(_QWORD *)(a1 + 56);
        objc_msgSend(*(id *)(a1 + 40), "readData");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, id, void *, _QWORD))(v50 + 16))(v50, v48, v12, v6, *(_QWORD *)(a1 + 64));
LABEL_58:

        v51 = *(_QWORD **)(a1 + 64);
        if (!v51 || !*v51)
          goto LABEL_53;
        goto LABEL_44;
      default:
        goto LABEL_53;
    }
  }
  if (*(_QWORD *)(a1 + 64))
  {
    v30 = (void *)MEMORY[0x1E0CB35C8];
    v52 = *MEMORY[0x1E0CB2938];
    v31 = (void *)MEMORY[0x1E0CB3940];
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("Unsupported attribute type: %@"), v12);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 8001, v34);
    **(_QWORD **)(a1 + 64) = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_44;
  }
LABEL_45:
  v43 = 0;
LABEL_55:

  return v43;
}

void __29__INCodable__readFrom_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, _QWORD *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (objc_msgSend(v10, "modifier"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setObject:forAttribute:", v9, v10);
  }
  else if (v9)
  {
    objc_msgSend(v11, "addObject:", v9);
  }
  else if (a5)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2938];
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "propertyName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Value for property '%@' can't be nil"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 8001, v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
}

- (void)_setObject:(id)a3 forAttribute:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a4, "propertyName");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[INCodable setValue:forPropertyNamed:](self, "setValue:forPropertyNamed:", v6, v7);

}

- (void)setValue:(id)a3 forPropertyNamed:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *customValueForKeyDictionary;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v6, "if_stringByLowercasingFirstCharacter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[INCodable isValidKey:](self, "isValidKey:", v7))
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99768];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@' is not a valid attribute"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v12);
  }
  customValueForKeyDictionary = self->_customValueForKeyDictionary;
  if (v13)
    -[NSMutableDictionary setObject:forKeyedSubscript:](customValueForKeyDictionary, "setObject:forKeyedSubscript:", v13, v7);
  else
    -[NSMutableDictionary removeObjectForKey:](customValueForKeyDictionary, "removeObjectForKey:", v7);

}

- (BOOL)isValidKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[INCodable _objectDescription](self, "_objectDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_stringByLowercasingFirstCharacter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "attributeByName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v7 != 0;

  return (char)v4;
}

- (id)_copyWithZone:(_NSZone *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  INCodable *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[INCodable _nonNilRepeatedAttributes](self, "_nonNilRepeatedAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  -[INCodable _dataWithError:](self, "_dataWithError:", &v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v19;
  if (v9)
  {
    v10 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v21 = "-[INCodable _copyWithZone:error:]";
      v22 = 2112;
      v23 = self;
      v24 = 2112;
      v25 = v9;
      _os_log_error_impl(&dword_18BEBC000, v10, OS_LOG_TYPE_ERROR, "%s Failed to copy INCodable %@ due to data error: %@", buf, 0x20u);
    }
    v11 = 0;
    v12 = 0;
    *a4 = objc_retainAutorelease(v9);
  }
  else
  {
    v13 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
    -[INCodable _objectDescription](self, "_objectDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v15 = (void *)objc_msgSend(v13, "_initWithCodableDescription:data:error:", v14, v8, &v18);
    v11 = v18;

    objc_msgSend(v15, "_setEmptyArrayForNonNilRepeatedAttributes:", v7);
    if (v11)
    {
      v16 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v21 = "-[INCodable _copyWithZone:error:]";
        v22 = 2112;
        v23 = self;
        v24 = 2112;
        v25 = v11;
        _os_log_error_impl(&dword_18BEBC000, v16, OS_LOG_TYPE_ERROR, "%s Failed to copy INCodable %@ due to initialization error: %@", buf, 0x20u);
      }
      v12 = 0;
      *a4 = objc_retainAutorelease(v11);
    }
    else
    {
      v12 = v15;
    }

  }
  return v12;
}

- (id)_initWithCodableDescription:(id)a3 data:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  INCodable *v11;
  uint64_t v12;
  NSMutableDictionary *customValueForKeyDictionary;
  id v14;
  void *v15;
  id v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)INCodable;
  v11 = -[INCodable init](&v18, sel_init);
  if (v11)
  {
    v12 = objc_opt_new();
    customValueForKeyDictionary = v11->_customValueForKeyDictionary;
    v11->_customValueForKeyDictionary = (NSMutableDictionary *)v12;

    objc_storeStrong((id *)&v11->_objectDescription, a3);
    v17 = 0;
    -[INCodable _setData:error:](v11, "_setData:error:", v10, &v17);
    v14 = v17;
    v15 = v14;
    if (v14)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v14);

      v11 = 0;
    }

  }
  return v11;
}

- (void)_setData:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "length"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v7);
    -[INCodable _readFrom:error:](self, "_readFrom:error:", v6, a4);

  }
  else
  {
    -[NSMutableDictionary removeAllObjects](self->_customValueForKeyDictionary, "removeAllObjects");
  }

}

- (id)_nonNilRepeatedAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[INCodable _objectDescription](self, "_objectDescription", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "propertyName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "hasPrefix:", CFSTR("_"));

        if ((v13 & 1) == 0)
        {
          -[INCodable _valueForAttribute:](self, "_valueForAttribute:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14 && !objc_msgSend(v11, "modifier"))
          {
            objc_msgSend(v11, "propertyName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v15);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v3;
}

- (id)_dataWithError:(id *)a3
{
  id v5;
  void *v6;

  v5 = objc_alloc_init(MEMORY[0x1E0D82B98]);
  -[INCodable _writeTo:error:](self, "_writeTo:error:", v5, a3);
  objc_msgSend(v5, "immutableData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setEmptyArrayForNonNilRepeatedAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = MEMORY[0x1E0C9AA60];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (-[INCodable isValidKey:](self, "isValidKey:", v10))
        {
          -[INCodable valueForPropertyNamed:](self, "valueForPropertyNamed:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {

          }
          else
          {
            -[INCodable _objectDescription](self, "_objectDescription");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "attributeByName:", v10);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "modifier");

            if (!v14)
              -[INCodable setValue:forPropertyNamed:](self, "setValue:forPropertyNamed:", v8, v10);
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (BOOL)_readFrom:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v10;
  unsigned int (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  id v34;
  INCodable *v35;
  id v36;
  id *v37;
  char v38;
  unsigned int v39;
  _QWORD v40[5];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __29__INCodable__readFrom_error___block_invoke;
  v40[3] = &unk_1E228EFB8;
  v40[4] = self;
  v8 = (void *)MEMORY[0x18D7812C4](v40);
  while (objc_msgSend(v6, "hasMoreData"))
  {
    v39 = 0;
    v38 = 0;
    objc_msgSend(v6, "readTag:type:", &v39, &v38);
    if (*((_BYTE *)v6 + (int)*MEMORY[0x1E0D82BC8]) || v38 == 4)
      break;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __29__INCodable__readFrom_error___block_invoke_2;
    v32[3] = &unk_1E228EFE0;
    v33 = v7;
    v37 = a4;
    v34 = v6;
    v10 = v8;
    v35 = self;
    v36 = v10;
    v11 = (unsigned int (**)(_QWORD, _QWORD))MEMORY[0x18D7812C4](v32);
    -[INCodable _objectDescription](self, "_objectDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v39);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 && !((unsigned int (**)(_QWORD, void *))v11)[2](v11, v15))
    {

      LOBYTE(v25) = 0;
      goto LABEL_21;
    }

  }
  v27 = v8;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v7, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
        {
          v24 = (void *)objc_msgSend(v22, "copy");
          -[INCodable setValue:forPropertyNamed:](self, "setValue:forPropertyNamed:", v24, v21);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
    }
    while (v18);
  }

  v25 = objc_msgSend(v6, "hasError") ^ 1;
  v8 = v27;
LABEL_21:

  return v25;
}

- (BOOL)_writeTo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  unsigned int (**v15)(_QWORD, _QWORD, _QWORD);
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id *v36;
  _QWORD v37[4];
  id v38;
  id *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[INCodable _objectDescription](self, "_objectDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_58_64793);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __28__INCodable__writeTo_error___block_invoke_2;
  v37[3] = &unk_1E228F048;
  v39 = a4;
  v12 = v6;
  v38 = v12;
  v33[0] = v11;
  v33[1] = 3221225472;
  v33[2] = __28__INCodable__writeTo_error___block_invoke_3;
  v33[3] = &unk_1E228F070;
  v33[4] = self;
  v13 = (id)MEMORY[0x18D7812C4](v37);
  v35 = v13;
  v36 = a4;
  v14 = v12;
  v34 = v14;
  v15 = (unsigned int (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x18D7812C4](v33);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v16 = v10;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
  if (v17)
  {
    v18 = v17;
    v27 = v13;
    v28 = v14;
    v19 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v30 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        -[INCodable _objectDescription](self, "_objectDescription", v27, v28, (_QWORD)v29);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "attributes");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKey:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24 && !((unsigned int (**)(_QWORD, void *, uint64_t))v15)[2](v15, v24, v21))
        {

          v25 = 0;
          goto LABEL_12;
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
      if (v18)
        continue;
      break;
    }
    v25 = 1;
LABEL_12:
    v13 = v27;
    v14 = v28;
  }
  else
  {
    v25 = 1;
  }

  return v25;
}

- (INCodableDescription)_objectDescription
{
  return self->_objectDescription;
}

uint64_t __28__INCodable__writeTo_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  int v33;
  int v34;
  uint64_t v35;
  double v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  uint64_t v49;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  objc_class *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  void *v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;
  void *v78;
  uint64_t v79;
  id v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    if (objc_msgSend(v7, "modifier"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_valueForAttribute:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 && !(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
      {
LABEL_5:

        goto LABEL_25;
      }
    }
    else
    {
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "_valueForAttribute:ofClass:", v7, objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v70;
LABEL_16:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v70 != v17)
            objc_enumerationMutation(v8);
          if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
            goto LABEL_5;
          if (v16 == ++v18)
          {
            v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
            if (v16)
              goto LABEL_16;
            break;
          }
        }
      }
    }

    goto LABEL_69;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v5, "modifier"))
    {
      objc_msgSend(*(id *)(a1 + 40), "writeInt32:forTag:", objc_msgSend(*(id *)(a1 + 32), "_int32ValueForAttribute:", v5), objc_msgSend(v6, "unsignedIntValue"));
      goto LABEL_69;
    }
    if (!*(_QWORD *)(a1 + 56))
      goto LABEL_32;
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v79 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Repeated modifier is not supported for enum attributes"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v80 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 8001, v25);
    **(_QWORD **)(a1 + 56) = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!*(_QWORD *)(a1 + 56))
    {
LABEL_32:
      v31 = 0;
      goto LABEL_70;
    }
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v73 = *MEMORY[0x1E0CB2938];
    v20 = (void *)MEMORY[0x1E0CB3940];
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("Unsupported attribute type: %@"), v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 8001, v23);
    **(_QWORD **)(a1 + 56) = (id)objc_claimAutoreleasedReturnValue();

LABEL_25:
    goto LABEL_32;
  }
  v9 = v5;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E23E9CB8, &unk_1E23E9CD0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "modifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "type"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "containsObject:", v11);

    if ((v12 & 1) == 0)
    {
      if (*(_QWORD *)(a1 + 56))
      {
        v26 = (void *)MEMORY[0x1E0CB35C8];
        v77 = *MEMORY[0x1E0CB2938];
        v27 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "type"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("Repeated modifier is not supported for scalar attributes with type %@"), v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 8001, v30);
        **(_QWORD **)(a1 + 56) = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_31:

      goto LABEL_32;
    }
  }
  switch(objc_msgSend(v9, "type"))
  {
    case 0:
      v13 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "_doubleValueForAttribute:", v9);
      objc_msgSend(v13, "writeDouble:forTag:", objc_msgSend(v6, "unsignedIntValue"), v14);
      goto LABEL_68;
    case 1:
      v32 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "_floatValueForAttribute:", v9);
      v34 = v33;
      v35 = objc_msgSend(v6, "unsignedIntValue");
      LODWORD(v36) = v34;
      objc_msgSend(v32, "writeFloat:forTag:", v35, v36);
      goto LABEL_68;
    case 2:
      objc_msgSend(*(id *)(a1 + 40), "writeInt32:forTag:", objc_msgSend(*(id *)(a1 + 32), "_int32ValueForAttribute:", v9), objc_msgSend(v6, "unsignedIntValue"));
      goto LABEL_68;
    case 3:
      objc_msgSend(*(id *)(a1 + 40), "writeInt64:forTag:", (int)objc_msgSend(*(id *)(a1 + 32), "_int32ValueForAttribute:", v9), objc_msgSend(v6, "unsignedIntValue"));
      goto LABEL_68;
    case 4:
      objc_msgSend(*(id *)(a1 + 40), "writeUint32:forTag:", objc_msgSend(*(id *)(a1 + 32), "_UInt32ValueForAttribute:", v9), objc_msgSend(v6, "unsignedIntValue"));
      goto LABEL_68;
    case 5:
      objc_msgSend(*(id *)(a1 + 40), "writeUint64:forTag:", objc_msgSend(*(id *)(a1 + 32), "_UInt64ValueForAttribute:", v9), objc_msgSend(v6, "unsignedIntValue"));
      goto LABEL_68;
    case 6:
      objc_msgSend(*(id *)(a1 + 40), "writeBOOL:forTag:", objc_msgSend(*(id *)(a1 + 32), "_BOOLValueForAttribute:", v9), objc_msgSend(v6, "unsignedIntValue"));
      goto LABEL_68;
    case 7:
      if (objc_msgSend(v9, "modifier"))
      {
        objc_msgSend(*(id *)(a1 + 32), "_valueForAttribute:ofClass:", v9, objc_opt_class());
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "_intents_encodeForProto");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
          objc_msgSend(*(id *)(a1 + 40), "writeString:forTag:", v38, objc_msgSend(v6, "unsignedIntValue"));
      }
      else
      {
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        objc_msgSend(*(id *)(a1 + 32), "_valueForAttribute:ofClass:", v9, objc_opt_class());
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
        if (v39)
        {
          v40 = v39;
          v59 = v10;
          v60 = v9;
          v41 = *(_QWORD *)v66;
          while (1)
          {
            for (i = 0; i != v40; ++i)
            {
              if (*(_QWORD *)v66 != v41)
                objc_enumerationMutation(v38);
              v43 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
              if (v43)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v51 = (void *)MEMORY[0x1E0C99DA0];
                  v52 = *MEMORY[0x1E0C99768];
                  v53 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v60, "propertyName");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_73;
                }
              }
              objc_msgSend(v43, "_intents_encodeForProto");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              if (v44)
                objc_msgSend(*(id *)(a1 + 40), "writeString:forTag:", v44, objc_msgSend(v6, "unsignedIntValue"));

            }
            v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
            if (!v40)
            {
LABEL_66:

              goto LABEL_69;
            }
          }
        }
      }
      break;
    case 8:
      if (objc_msgSend(v9, "modifier"))
      {
        objc_msgSend(*(id *)(a1 + 32), "_valueForAttribute:ofClass:", v9, objc_opt_class());
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
          objc_msgSend(*(id *)(a1 + 40), "writeData:forTag:", v38, objc_msgSend(v6, "unsignedIntValue"));
      }
      else
      {
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        objc_msgSend(*(id *)(a1 + 32), "_valueForAttribute:ofClass:", v9, objc_opt_class());
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
        if (v45)
        {
          v46 = v45;
          v59 = v10;
          v60 = v9;
          v47 = *(_QWORD *)v62;
          while (1)
          {
            for (j = 0; j != v46; ++j)
            {
              if (*(_QWORD *)v62 != v47)
                objc_enumerationMutation(v38);
              v49 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j);
              if (v49)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v51 = (void *)MEMORY[0x1E0C99DA0];
                  v52 = *MEMORY[0x1E0C99768];
                  v53 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v9, "propertyName");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_73:
                  v55 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v55);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "stringWithFormat:", CFSTR("Property '%@' is not a valid NSArray<%@ *> subclass"), v54, v56, v59);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "exceptionWithName:reason:userInfo:", v52, v57, 0);
                  v58 = (id)objc_claimAutoreleasedReturnValue();

                  objc_exception_throw(v58);
                }
              }
              objc_msgSend(*(id *)(a1 + 40), "writeData:forTag:", v49, objc_msgSend(v6, "unsignedIntValue"));
            }
            v46 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
            if (!v46)
              goto LABEL_66;
          }
        }
      }
      break;
    default:
      goto LABEL_68;
  }

LABEL_68:
LABEL_69:
  v31 = 1;
LABEL_70:

  return v31;
}

- (id)_valueForAttribute:(id)a3
{
  NSMutableDictionary *customValueForKeyDictionary;
  void *v4;
  void *v5;
  void *v6;

  customValueForKeyDictionary = self->_customValueForKeyDictionary;
  objc_msgSend(a3, "propertyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_stringByLowercasingFirstCharacter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](customValueForKeyDictionary, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __28__INCodable__writeTo_error___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v7, "valueTransformer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "transformedValue:", v8);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v12;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "unsignedIntValue");
    PBDataWriterWriteSubmessage();
  }
  else if (*(_QWORD *)(a1 + 40))
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2938];
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "propertyName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 8001, v18);
    **(_QWORD **)(a1 + 40) = (id)objc_claimAutoreleasedReturnValue();

  }
  return isKindOfClass & 1;
}

uint64_t __28__INCodable__writeTo_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v3 = -[INCodable _copyWithZone:error:](self, "_copyWithZone:error:", a3, &v8);
  v4 = v8;
  if (v4)
  {
    v5 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[INCodable copyWithZone:]";
      v11 = 2112;
      v12 = v4;
      _os_log_error_impl(&dword_18BEBC000, v5, OS_LOG_TYPE_ERROR, "%s Failed to copy due to error %@", buf, 0x16u);
    }
    v6 = 0;
  }
  else
  {
    v6 = v3;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  INCodableDescription *objectDescription;
  void *v9;
  id v10;
  id v11;
  id v12;

  v4 = a3;
  v12 = 0;
  -[INCodable _dataWithError:](self, "_dataWithError:", &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v6)
  {
    objc_msgSend(v4, "failWithError:", v6);
  }
  else
  {
    -[INCodable _nonNilRepeatedAttributes](self, "_nonNilRepeatedAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("_nonNilRepeatedAttributes"));

    objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v5, CFSTR("bytes"));
    objectDescription = self->_objectDescription;
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", objectDescription, 1, &v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
    if (v10)
      objc_msgSend(v4, "failWithError:", v10);
    else
      objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v9, CFSTR("codableDescriptionBytes"));

  }
}

- (id)_nonNilAttributes
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[INCodable _objectDescription](self, "_objectDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "propertyName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("_"));

        if ((v12 & 1) == 0)
        {
          -[INCodable _valueForAttribute:](self, "_valueForAttribute:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          if ((INObjectIsConsideredNil(v13, isKindOfClass & 1) & 1) == 0)
          {
            objc_msgSend(v10, "propertyName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v15);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  return v17;
}

- (INCodable)initWithCodableDescription:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  INCodable *v13;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0;
  v8 = -[INCodable _initWithCodableDescription:data:error:](self, "_initWithCodableDescription:data:error:", v6, v7, &v15);
  v9 = v15;
  v10 = v8;
  v11 = v10;
  if (v9)
  {
    v12 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v17 = "-[INCodable initWithCodableDescription:data:]";
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      v22 = 2112;
      v23 = v9;
      _os_log_error_impl(&dword_18BEBC000, v12, OS_LOG_TYPE_ERROR, "%s Failed to init INCodable with description %@ and data %@ due to error: %@", buf, 0x2Au);
    }
    v13 = 0;
  }
  else
  {
    v13 = (INCodable *)v10;
  }

  return v13;
}

- (void)setNilValueForAllKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodable _objectDescription](self, "_objectDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __34__INCodable_setNilValueForAllKeys__block_invoke;
  v20[3] = &unk_1E228EF50;
  v7 = v3;
  v21 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v20);
  -[NSMutableDictionary removeObjectsForKeys:](self->_customValueForKeyDictionary, "removeObjectsForKeys:", v7);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_64863);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "propertyName", (_QWORD)v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[INCodable setValue:forPropertyNamed:](self, "setValue:forPropertyNamed:", 0, v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v12);
  }

}

- (BOOL)readFrom:(id)a3
{
  BOOL v3;
  id v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v3 = -[INCodable _readFrom:error:](self, "_readFrom:error:", a3, &v12);
  v4 = v12;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "debugDescription");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = -[__CFString length](v6, "length");
    v8 = CFSTR("INCodable data reading failed");
    if (v7)
      v8 = v6;
    v9 = v8;
    v10 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[INCodable readFrom:]";
      v15 = 2112;
      v16 = v9;
      _os_log_error_impl(&dword_18BEBC000, v10, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }

    v3 = 0;
  }

  return v3;
}

- (void)writeTo:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  const __CFString *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  -[INCodable _writeTo:error:](self, "_writeTo:error:", a3, &v10);
  v3 = v10;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "debugDescription");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_FAULT))
    {
      v7 = v6;
      v8 = -[__CFString length](v5, "length");
      v9 = CFSTR("INCodable data writing failed");
      if (v8)
        v9 = v5;
      *(_DWORD *)buf = 136315394;
      v12 = "-[INCodable writeTo:]";
      v13 = 2114;
      v14 = v9;
      _os_log_fault_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_FAULT, "%s INCodable writeTo failed: %{public}@", buf, 0x16u);

    }
  }

}

- (id)data
{
  void *v2;
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  id v7;
  NSObject *v9;
  uint64_t v10;
  const __CFString *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  -[INCodable _dataWithError:](self, "_dataWithError:", &v12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v12;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "debugDescription");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_FAULT))
    {
      v9 = v6;
      v10 = -[__CFString length](v5, "length");
      v11 = CFSTR("INCodable data writing failed");
      if (v10)
        v11 = v5;
      *(_DWORD *)buf = 136315394;
      v14 = "-[INCodable data]";
      v15 = 2114;
      v16 = v11;
      _os_log_fault_impl(&dword_18BEBC000, v9, OS_LOG_TYPE_FAULT, "%s INCodable data failed: %{public}@", buf, 0x16u);

    }
    v7 = 0;
  }
  else
  {
    v7 = v2;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  double v15;
  double v16;
  double v17;
  float v18;
  float v19;
  float v20;
  int v21;
  int v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  void *v29;
  uint64_t v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = 0;
    goto LABEL_48;
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[INCodable _objectDescription](self, "_objectDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (!v8)
  {
LABEL_43:
    v27 = 1;
    goto LABEL_47;
  }
  v9 = v8;
  v10 = *(_QWORD *)v37;
LABEL_4:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v37 != v10)
      objc_enumerationMutation(v7);
    v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v11);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    if (!-[INCodable _isAttribute:equalTo:](self, "_isAttribute:equalTo:", v12, v4))
      goto LABEL_46;
LABEL_28:
    if (v9 == ++v11)
    {
      v26 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      v9 = v26;
      if (!v26)
        goto LABEL_43;
      goto LABEL_4;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = -[INCodable _int32ValueForAttribute:](self, "_int32ValueForAttribute:", v12);
    if (v13 != objc_msgSend(v4, "_int32ValueForAttribute:", v12))
      goto LABEL_46;
    goto LABEL_28;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1E0C99DA0];
    v30 = *MEMORY[0x1E0C99768];
    v31 = (void *)MEMORY[0x1E0CB3940];
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("Unsupported attribute type: %@"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "exceptionWithName:reason:userInfo:", v30, v34, 0);
    v35 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v35);
  }
  v14 = v12;
  switch(objc_msgSend(v14, "type"))
  {
    case -1:
      goto LABEL_45;
    case 0:
      -[INCodable _doubleValueForAttribute:](self, "_doubleValueForAttribute:", v14);
      v16 = v15;
      objc_msgSend(v4, "_doubleValueForAttribute:", v14);
      if (v16 != v17)
        goto LABEL_45;
      goto LABEL_27;
    case 1:
      -[INCodable _floatValueForAttribute:](self, "_floatValueForAttribute:", v14);
      v19 = v18;
      objc_msgSend(v4, "_floatValueForAttribute:", v14);
      if (v19 != v20)
        goto LABEL_45;
      goto LABEL_27;
    case 2:
      v21 = -[INCodable _int32ValueForAttribute:](self, "_int32ValueForAttribute:", v14);
      v22 = objc_msgSend(v4, "_int32ValueForAttribute:", v14);
      goto LABEL_26;
    case 3:
      v23 = -[INCodable _int64ValueForAttribute:](self, "_int64ValueForAttribute:", v14);
      v24 = objc_msgSend(v4, "_int64ValueForAttribute:", v14);
      goto LABEL_23;
    case 4:
      v21 = -[INCodable _UInt32ValueForAttribute:](self, "_UInt32ValueForAttribute:", v14);
      v22 = objc_msgSend(v4, "_UInt32ValueForAttribute:", v14);
      goto LABEL_26;
    case 5:
      v23 = -[INCodable _UInt64ValueForAttribute:](self, "_UInt64ValueForAttribute:", v14);
      v24 = objc_msgSend(v4, "_UInt64ValueForAttribute:", v14);
LABEL_23:
      if (v23 != v24)
        goto LABEL_45;
      goto LABEL_27;
    case 6:
      v21 = -[INCodable _BOOLValueForAttribute:](self, "_BOOLValueForAttribute:", v14);
      v22 = objc_msgSend(v4, "_BOOLValueForAttribute:", v14);
LABEL_26:
      if (v21 == v22)
        goto LABEL_27;
      goto LABEL_45;
    case 7:
      v25 = objc_msgSend(v14, "modifier");
      if ((unint64_t)(v25 - 1) < 2)
      {
        if (!-[INCodable _isStringAttribute:equalTo:](self, "_isStringAttribute:equalTo:", v14, v4))
          goto LABEL_45;
        goto LABEL_27;
      }
      if (v25)
        goto LABEL_36;
      goto LABEL_32;
    case 8:
      v25 = objc_msgSend(v14, "modifier");
      if ((unint64_t)(v25 - 1) >= 2)
      {
        if (v25)
        {
LABEL_36:
          if (v25 == -1)
            goto LABEL_45;
        }
        else
        {
LABEL_32:
          if (!-[INCodable _isAttribute:equalTo:](self, "_isAttribute:equalTo:", v14, v4))
            goto LABEL_45;
        }
        goto LABEL_27;
      }
      if (-[INCodable _isAttribute:equalTo:](self, "_isAttribute:equalTo:", v14, v4))
      {
LABEL_27:

        goto LABEL_28;
      }
LABEL_45:

LABEL_46:
      v27 = 0;
LABEL_47:

LABEL_48:
      return v27;
    default:
      goto LABEL_27;
  }
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  float v16;
  long double v17;
  double v18;
  double v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  int64_t v23;
  void *v25;
  uint64_t v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[INCodable _objectDescription](self, "_objectDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v33;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[INCodable _valueForAttribute:](self, "_valueForAttribute:", v11);
          v12 = (id)objc_claimAutoreleasedReturnValue();
          v8 ^= objc_msgSend(v12, "hash");
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v8 ^= 2654435761 * -[INCodable _int32ValueForAttribute:](self, "_int32ValueForAttribute:", v11);
            continue;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v25 = (void *)MEMORY[0x1E0C99DA0];
            v26 = *MEMORY[0x1E0C99768];
            v27 = (void *)MEMORY[0x1E0CB3940];
            v28 = (objc_class *)objc_opt_class();
            NSStringFromClass(v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringWithFormat:", CFSTR("Unsupported attribute type: %@"), v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "exceptionWithName:reason:userInfo:", v26, v30, 0);
            v31 = (id)objc_claimAutoreleasedReturnValue();

            objc_exception_throw(v31);
          }
          v12 = v11;
          switch(objc_msgSend(v12, "type"))
          {
            case 0:
              -[INCodable _doubleValueForAttribute:](self, "_doubleValueForAttribute:", v12);
              v15 = -v14;
              if (v14 >= 0.0)
                v15 = v14;
              goto LABEL_18;
            case 1:
              -[INCodable _floatValueForAttribute:](self, "_floatValueForAttribute:", v12);
              v15 = v16;
              if (v16 < 0.0)
                v15 = -v16;
LABEL_18:
              v17 = floor(v15 + 0.5);
              v18 = (v15 - v17) * 1.84467441e19;
              v19 = fmod(v17, 1.84467441e19);
              v20 = 2654435761u * (unint64_t)v19;
              v21 = v20 + (unint64_t)v18;
              if (v18 <= 0.0)
                v21 = 2654435761u * (unint64_t)v19;
              v22 = v20 - (unint64_t)fabs(v18);
              if (v18 >= 0.0)
                v22 = v21;
              goto LABEL_31;
            case 2:
              v22 = 2654435761 * -[INCodable _int32ValueForAttribute:](self, "_int32ValueForAttribute:", v12);
              goto LABEL_31;
            case 3:
              v23 = -[INCodable _int64ValueForAttribute:](self, "_int64ValueForAttribute:", v12);
              goto LABEL_27;
            case 4:
              v22 = 2654435761 * -[INCodable _UInt32ValueForAttribute:](self, "_UInt32ValueForAttribute:", v12);
              goto LABEL_31;
            case 5:
              v23 = -[INCodable _UInt64ValueForAttribute:](self, "_UInt64ValueForAttribute:", v12);
LABEL_27:
              v22 = 2654435761 * v23;
              goto LABEL_31;
            case 6:
              if (-[INCodable _BOOLValueForAttribute:](self, "_BOOLValueForAttribute:", v12))
                v22 = 2654435761;
              else
                v22 = 0;
LABEL_31:
              v8 ^= v22;
              break;
            case 7:
            case 8:
              -[INCodable _valueForAttribute:](self, "_valueForAttribute:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v8 ^= objc_msgSend(v13, "hash");

              break;
            default:
              break;
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (!v7)
        goto LABEL_37;
    }
  }
  v8 = 0;
LABEL_37:

  return v8;
}

- (id)_dictionaryRepresentationWithNullValues:(BOOL)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v29;
  INCodable *v30;
  BOOL v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[INCodable _objectDescription](self, "_objectDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v41;
    v32 = v5;
    v31 = a3;
    v29 = v8;
    v30 = self;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v41 != v34)
          objc_enumerationMutation(v8);
        v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v10, "propertyName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("_"));

        if ((v12 & 1) == 0)
        {
          objc_msgSend(v10, "propertyName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[INCodable valueForPropertyNamed:](self, "valueForPropertyNamed:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v14, "dictionaryRepresentation");
            v15 = objc_claimAutoreleasedReturnValue();
            goto LABEL_21;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = v14;
            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v16, "count"));
            v36 = 0u;
            v37 = 0u;
            v38 = 0u;
            v39 = 0u;
            v18 = v16;
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            if (v19)
            {
              v20 = v19;
              v21 = *(_QWORD *)v37;
              do
              {
                for (j = 0; j != v20; ++j)
                {
                  if (*(_QWORD *)v37 != v21)
                    objc_enumerationMutation(v18);
                  v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v23, "dictionaryRepresentation");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v17, "addObject:", v24);

                  }
                  else
                  {
                    objc_msgSend(v17, "addObject:", v23);
                  }
                }
                v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
              }
              while (v20);
            }

            v15 = objc_msgSend(v17, "copy");
            v5 = v32;
            a3 = v31;
            v8 = v29;
            self = v30;
LABEL_21:

            v14 = (void *)v15;
          }
          if (a3 || v14)
          {
            v25 = (uint64_t)v14;
            if (!v14)
            {
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v25 = objc_claimAutoreleasedReturnValue();
              v33 = (void *)v25;
            }
            objc_msgSend(v10, "propertyName");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKey:", v25, v26);

            if (!v14)
          }

          continue;
        }
      }
      v35 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v35);
  }

  v27 = (void *)objc_msgSend(v5, "copy");
  return v27;
}

- (id)dictionaryRepresentation
{
  return -[INCodable _dictionaryRepresentationWithNullValues:](self, "_dictionaryRepresentationWithNullValues:", 1);
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  INCodableDescription *objectDescription;
  id v16;
  id v17;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  -[INCodable _dataWithError:](self, "_dataWithError:", &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  if (!v9)
  {
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v8, CFSTR("bytes"));
    objc_msgSend(v7, "intents_setIntegerIfNonZero:forKey:", -[INCodableDescription codableDescriptionType](self->_objectDescription, "codableDescriptionType"), CFSTR("descType"));
    -[INCodable _nonNilRepeatedAttributes](self, "_nonNilRepeatedAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v13, CFSTR("_nonNilRepeatedAttributes"));

    objectDescription = self->_objectDescription;
    v16 = 0;
    objc_msgSend(v7, "intents_setWidgetPlistRepresentable:forKey:parameters:error:", objectDescription, CFSTR("codableDescriptionBytes"), v6, &v16);
    v10 = v16;
    if (!v10)
    {
      v11 = (void *)objc_msgSend(v7, "copy");
      goto LABEL_8;
    }
    if (a4)
      goto LABEL_3;
LABEL_6:
    v11 = 0;
    goto LABEL_8;
  }
  v10 = v9;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  v10 = objc_retainAutorelease(v10);
  v11 = 0;
  *a4 = v10;
LABEL_8:

  return v11;
}

- (BOOL)_isAttribute:(id)a3 equalTo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v6 = a4;
  v7 = a3;
  -[INCodable _valueForAttribute:](self, "_valueForAttribute:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_valueForAttribute:", v7);
  v9 = objc_claimAutoreleasedReturnValue();

  if (v8 | v9)
  {
    v10 = 0;
    if (v8 && v9)
      v10 = objc_msgSend((id)v8, "isEqual:", v9);
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)_isStringAttribute:(id)a3 equalTo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  char v11;

  v6 = a4;
  v7 = a3;
  -[INCodable _valueForAttribute:ofClass:](self, "_valueForAttribute:ofClass:", v7, objc_opt_class());
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_valueForAttribute:ofClass:", v7, objc_opt_class());
  v9 = objc_claimAutoreleasedReturnValue();

  if (v8 | v9)
  {
    if (v8)
      v10 = v9 == 0;
    else
      v10 = 1;
    if (v10)
      v11 = 0;
    else
      v11 = objc_msgSend((id)v8, "isEqualToString:", v9);
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (double)_doubleValueForAttribute:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[INCodable _valueForAttribute:](self, "_valueForAttribute:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (float)_floatValueForAttribute:(id)a3
{
  void *v3;
  float v4;
  float v5;

  -[INCodable _valueForAttribute:](self, "_valueForAttribute:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (int)_int32ValueForAttribute:(id)a3
{
  void *v3;
  int v4;

  -[INCodable _valueForAttribute:](self, "_valueForAttribute:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (int64_t)_int64ValueForAttribute:(id)a3
{
  void *v3;
  int64_t v4;

  -[INCodable _valueForAttribute:](self, "_valueForAttribute:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  return v4;
}

- (unsigned)_UInt32ValueForAttribute:(id)a3
{
  void *v3;
  unsigned int v4;

  -[INCodable _valueForAttribute:](self, "_valueForAttribute:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (unint64_t)_UInt64ValueForAttribute:(id)a3
{
  void *v3;
  unint64_t v4;

  -[INCodable _valueForAttribute:](self, "_valueForAttribute:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (BOOL)_BOOLValueForAttribute:(id)a3
{
  void *v3;
  char v4;

  -[INCodable _valueForAttribute:](self, "_valueForAttribute:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)_valueForAttribute:(id)a3 ofClass:(Class)a4
{
  id v6;
  void *v7;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a3;
  -[INCodable _valueForAttribute:](self, "_valueForAttribute:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99768];
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "propertyName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Property '%@' is not a valid %@ subclass"), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v14, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v15);
  }

  return v7;
}

- (void)_setObjectDescription:(id)a3
{
  objc_storeStrong((id *)&self->_objectDescription, a3);
}

- (NSMutableDictionary)customValueForKeyDictionary
{
  return self->_customValueForKeyDictionary;
}

- (void)setCustomValueForKeyDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_customValueForKeyDictionary, a3);
}

void __34__INCodable_setNilValueForAllKeys__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "propertyName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("_"));

    if ((v4 & 1) == 0)
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v7, "propertyName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v6);

    }
  }

}

uint64_t __34__INCodable_setNilValueForAllKeys__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "propertyName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("_")) ^ 1;

  return v3;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v21;
  id v22;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(v5, "intents_safeObjectForKey:ofType:", CFSTR("bytes"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intents_safeObjectForKey:ofType:", CFSTR("_nonNilRepeatedAttributes"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "intents_intForKey:", CFSTR("descType"));
    v9 = INCodableDescriptionClassFromType(v8);
    if (v9)
      goto LABEL_3;
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentError(8001, v16, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
LABEL_3:
      v22 = 0;
      objc_msgSend(v9, "intents_widgetPlistRepresentableInDict:key:error:", v5, CFSTR("codableDescriptionBytes"), &v22);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v22;
      if (v11)
      {
        v12 = v11;
        if (a4)
        {
          v12 = objc_retainAutorelease(v11);
          v13 = 0;
          *a4 = v12;
        }
        else
        {
          v13 = 0;
        }
      }
      else
      {
        v21 = 0;
        v17 = -[INCodable _initWithCodableDescription:data:error:]([INCodable alloc], "_initWithCodableDescription:data:error:", v10, v6, &v21);
        v18 = v21;
        v12 = v18;
        if (v18)
        {
          v13 = 0;
          if (a4)
            *a4 = objc_retainAutorelease(v18);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "_setEmptyArrayForNonNilRepeatedAttributes:", v19);

          v13 = v17;
        }

      }
    }
    else if (a4)
    {
      v12 = objc_retainAutorelease(v12);
      v13 = 0;
      *a4 = v12;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
