@implementation NSObject(Protobuf)

- (_DKPRValue)toPBCodable
{
  _DKPRValue *v2;
  _DKPRValueType *v3;
  double v4;
  _DKPRValue *v5;
  void *v6;
  uint64_t valuePtr;

  v2 = objc_alloc_init(_DKPRValue);
  v3 = objc_alloc_init(_DKPRValueType);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_DKPRValueType setType:]((uint64_t)v3, 2);
      -[_DKPRValue setStringValue:]((uint64_t)v2, a1);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[_DKPRValueType setType:]((uint64_t)v3, 4);
        objc_msgSend(a1, "timeIntervalSinceReferenceDate");
        -[_DKPRValue setDateValue:]((uint64_t)v2, v4);
      }
      else
      {
        -[_DKPRValueType setType:]((uint64_t)v3, 3);
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:", a1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DKPRValue setBlobValue:]((uint64_t)v2, v6);

      }
    }
    goto LABEL_13;
  }
  if (CFNumberIsFloatType((CFNumberRef)a1))
  {
    valuePtr = 0;
    if (CFNumberGetValue((CFNumberRef)a1, kCFNumberDoubleType, &valuePtr))
    {
      -[_DKPRValueType setType:]((uint64_t)v3, 1);
      -[_DKPRValue setDoubleValue:]((uint64_t)v2, *(double *)&valuePtr);
LABEL_13:
      -[_DKPRValue setType:]((uint64_t)v2, v3);
      v5 = v2;
      goto LABEL_14;
    }
  }
  else
  {
    valuePtr = 0;
    if (CFNumberGetValue((CFNumberRef)a1, kCFNumberSInt64Type, &valuePtr))
    {
      -[_DKPRValueType setType:]((uint64_t)v3, 0);
      -[_DKPRValue setIntegerValue:]((uint64_t)v2, valuePtr);
      goto LABEL_13;
    }
  }
  v5 = 0;
LABEL_14:

  return v5;
}

+ (id)fromPBCodable:()Protobuf
{
  id v3;
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;
  void *v24;
  id v25;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    -[_DKPRValue type]((uint64_t)v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_DKPRValueType type]((uint64_t)v5);

    switch(v6)
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[_DKPRValue integerValue]((uint64_t)v4));
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 1:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -[_DKPRValue doubleValue]((uint64_t)v4));
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 2:
        -[_DKPRValue stringValue]((uint64_t)v4);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 3:
        v24 = (void *)MEMORY[0x1E0C99E60];
        v23 = objc_opt_class();
        v9 = objc_opt_class();
        v10 = objc_opt_class();
        v11 = objc_opt_class();
        v12 = objc_opt_class();
        v13 = objc_opt_class();
        v14 = objc_opt_class();
        v15 = objc_opt_class();
        v16 = objc_opt_class();
        objc_msgSend(v24, "setWithObjects:", v23, v9, v10, v11, v12, v13, v14, v15, v16, objc_opt_class(), 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0CB3710];
        -[_DKPRValue blobValue]((uint64_t)v4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        objc_msgSend(v18, "unarchivedObjectOfClasses:fromData:error:", v17, v19, &v25);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v25;

        if (v21)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            +[NSObject(Protobuf) fromPBCodable:].cold.1((uint64_t)v21);
          v8 = 0;
        }
        else
        {
          v8 = v20;
        }

        break;
      case 4:
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", -[_DKPRValue dateValue]((uint64_t)v4));
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        v8 = (id)v7;
        break;
      default:
        v8 = 0;
        break;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (void)fromPBCodable:()Protobuf .cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error unarchiving object %@", (uint8_t *)&v1, 0xCu);
}

@end
