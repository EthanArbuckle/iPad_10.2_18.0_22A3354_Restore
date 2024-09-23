@implementation HAPDataValueTransformer

- (id)transformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  char v23;
  __int16 v24;
  int v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  int v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  objc_super v36;
  _BYTE buf[12];
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8)
  {
    if (+[HAPDataValueTransformer isValidFormat:](HAPDataValueTransformer, "isValidFormat:", a4))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
      v12 = v11;
      goto LABEL_18;
    }
    goto LABEL_9;
  }
  v36.receiver = self;
  v36.super_class = (Class)HAPDataValueTransformer;
  -[HAPValueTransformer transformedValue:format:error:](&v36, sel_transformedValue_format_error_, v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if ((v10 & 1) == 0)
    goto LABEL_17;
  if (!+[HAPDataValueTransformer isValidFormat:](HAPDataValueTransformer, "isValidFormat:", a4))
  {
LABEL_9:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
LABEL_10:
      v11 = v8;
      goto LABEL_11;
    }
    v13 = (void *)MEMORY[0x1E0CB3940];
    HAPCharacteristicFormatToString(a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Invalid format type '%@' for value of class '%@'"), v14, objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v18;
      v38 = 2112;
      v39 = v15;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@[HAPDataValueTransformer] %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    if (a5)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v42 = *MEMORY[0x1E0CB2D50];
      v43[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6717, v20);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_17:
    v12 = 0;
    goto LABEL_18;
  }
  switch(a4)
  {
    case 1uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_69;
      v22 = v8;
      if (objc_msgSend(v22, "compare:", &unk_1E89892D8) == 1 || objc_msgSend(v22, "compare:", &unk_1E89892F0) == -1)
        goto LABEL_65;
      v23 = objc_msgSend(v22, "unsignedCharValue");
      goto LABEL_39;
    case 2uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_69;
      v22 = v8;
      if (objc_msgSend(v22, "compare:", &unk_1E8989308) == 1 || objc_msgSend(v22, "compare:", &unk_1E89892F0) == -1)
        goto LABEL_65;
      v24 = objc_msgSend(v22, "unsignedShortValue");
      goto LABEL_44;
    case 3uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_69;
      v22 = v8;
      if (objc_msgSend(v22, "compare:", &unk_1E8989320) == 1 || objc_msgSend(v22, "compare:", &unk_1E89892F0) == -1)
        goto LABEL_65;
      v25 = objc_msgSend(v22, "unsignedIntValue");
      goto LABEL_49;
    case 4uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_69;
      v22 = v8;
      if (objc_msgSend(v22, "compare:", &unk_1E8989338) == 1 || objc_msgSend(v22, "compare:", &unk_1E89892F0) == -1)
        goto LABEL_65;
      v26 = objc_msgSend(v22, "unsignedLongLongValue");
      goto LABEL_54;
    case 5uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_69;
      v22 = v8;
      if (objc_msgSend(v22, "compare:", &unk_1E8989218) == 1 || objc_msgSend(v22, "compare:", &unk_1E8989230) == -1)
        goto LABEL_65;
      v23 = objc_msgSend(v22, "charValue");
LABEL_39:
      buf[0] = v23;
      v27 = (void *)MEMORY[0x1E0C99D50];
      v28 = 1;
      goto LABEL_64;
    case 6uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_69;
      v22 = v8;
      if (objc_msgSend(v22, "compare:", &unk_1E8989248) == 1 || objc_msgSend(v22, "compare:", &unk_1E8989260) == -1)
        goto LABEL_65;
      v24 = objc_msgSend(v22, "shortValue");
LABEL_44:
      *(_WORD *)buf = v24;
      v27 = (void *)MEMORY[0x1E0C99D50];
      v28 = 2;
      goto LABEL_64;
    case 7uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_69;
      v22 = v8;
      if (objc_msgSend(v22, "compare:", &unk_1E8989278) == 1 || objc_msgSend(v22, "compare:", &unk_1E8989290) == -1)
        goto LABEL_65;
      v25 = objc_msgSend(v22, "intValue");
LABEL_49:
      *(_DWORD *)buf = v25;
      goto LABEL_63;
    case 8uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_69;
      v22 = v8;
      if (objc_msgSend(v22, "compare:", &unk_1E89892A8) == 1 || objc_msgSend(v22, "compare:", &unk_1E89892C0) == -1)
        goto LABEL_65;
      v26 = objc_msgSend(v22, "longLongValue");
LABEL_54:
      *(_QWORD *)buf = v26;
      v27 = (void *)MEMORY[0x1E0C99D50];
      v28 = 8;
      goto LABEL_64;
    case 9uLL:
      buf[0] = 0;
      if ((objc_msgSend(v8, "isEqual:", MEMORY[0x1E0C9AAA0]) & 1) != 0)
        goto LABEL_58;
      if (!objc_msgSend(v8, "isEqual:", MEMORY[0x1E0C9AAB0]))
        goto LABEL_17;
      buf[0] = 1;
LABEL_58:
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 1);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 0xAuLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_69;
      v22 = v8;
      if (objc_msgSend(v22, "compare:", &unk_1E8989890) == 1 || objc_msgSend(v22, "compare:", &unk_1E89898A0) == -1)
      {
LABEL_65:
        v12 = 0;
      }
      else
      {
        objc_msgSend(v22, "floatValue");
        *(_DWORD *)buf = v29;
LABEL_63:
        v27 = (void *)MEMORY[0x1E0C99D50];
        v28 = 4;
LABEL_64:
        objc_msgSend(v27, "dataWithBytes:length:", buf, v28);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }

      break;
    case 0xBuLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_69;
      objc_msgSend(v8, "dataUsingEncoding:", 4);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 0xCuLL:
    case 0xDuLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_10;
      goto LABEL_69;
    default:
LABEL_69:
      v30 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        HAPCharacteristicFormatToString(a4);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v32;
        v38 = 2112;
        v39 = v33;
        v40 = 2112;
        v41 = v34;
        v35 = v34;
        _os_log_impl(&dword_1CCE01000, v31, OS_LOG_TYPE_ERROR, "%{public}@[HAPDataValueTransformer] Invalid format/class (%@/%@) combination.", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v30);
      if (!a5)
        goto LABEL_17;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6737, 0);
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      break;
  }
LABEL_18:

  return v12;
}

- (id)reverseTransformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  unsigned __int8 *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  unsigned __int16 *v19;
  unsigned int *v20;
  _QWORD *v21;
  char *v22;
  __int16 *v23;
  unsigned int *v24;
  _QWORD *v25;
  void *v26;
  double v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8
    && (v34.receiver = self,
        v34.super_class = (Class)HAPDataValueTransformer,
        -[HAPValueTransformer reverseTransformedValue:format:error:](&v34, sel_reverseTransformedValue_format_error_, v8, a4, a5), v9 = (void *)objc_claimAutoreleasedReturnValue(), v10 = objc_msgSend(v8, "isEqual:", v9), v9, !v10))
  {
    v18 = 0;
  }
  else if (+[HAPDataValueTransformer isValidFormat:](HAPDataValueTransformer, "isValidFormat:", a4))
  {
    v11 = v8;
    v12 = v11;
    switch(a4)
    {
      case 1uLL:
        if (objc_msgSend(v11, "length") != 1)
          goto LABEL_34;
        v13 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v12), "bytes");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *v13);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      case 2uLL:
        if (objc_msgSend(v11, "length") != 2)
          goto LABEL_34;
        v19 = (unsigned __int16 *)objc_msgSend(objc_retainAutorelease(v12), "bytes");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *v19);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      case 3uLL:
        if (objc_msgSend(v11, "length") != 4)
          goto LABEL_34;
        v20 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v12), "bytes");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *v20);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      case 4uLL:
        if (objc_msgSend(v11, "length") != 8)
          goto LABEL_34;
        v21 = (_QWORD *)objc_msgSend(objc_retainAutorelease(v12), "bytes");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *v21);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      case 5uLL:
        if (objc_msgSend(v11, "length") != 1)
          goto LABEL_34;
        v22 = (char *)objc_msgSend(objc_retainAutorelease(v12), "bytes");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", *v22);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      case 6uLL:
        if (objc_msgSend(v11, "length") != 2)
          goto LABEL_34;
        v23 = (__int16 *)objc_msgSend(objc_retainAutorelease(v12), "bytes");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", *v23);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      case 7uLL:
        if (objc_msgSend(v11, "length") != 4)
          goto LABEL_34;
        v24 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v12), "bytes");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *v24);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      case 8uLL:
        if (objc_msgSend(v11, "length") != 8)
          goto LABEL_34;
        v25 = (_QWORD *)objc_msgSend(objc_retainAutorelease(v12), "bytes");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *v25);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      case 9uLL:
        if (objc_msgSend(v11, "length") != 1)
          goto LABEL_34;
        if (*(_BYTE *)objc_msgSend(objc_retainAutorelease(v12), "bytes") == 1)
          v26 = (void *)MEMORY[0x1E0C9AAB0];
        else
          v26 = (void *)MEMORY[0x1E0C9AAA0];
        v14 = v26;
        goto LABEL_41;
      case 0xAuLL:
        if (objc_msgSend(v11, "length") != 4)
          goto LABEL_34;
        LODWORD(v27) = *(_DWORD *)objc_msgSend(objc_retainAutorelease(v12), "bytes");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      case 0xBuLL:
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 4);
        goto LABEL_41;
      default:
        if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
        {
          v14 = v11;
LABEL_41:
          v18 = v14;
        }
        else
        {
          if (!objc_msgSend(v12, "length"))
            goto LABEL_39;
LABEL_34:
          v28 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            HAPCharacteristicFormatToString(a4);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "length"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v36 = v30;
            v37 = 2112;
            v38 = (unint64_t)v31;
            v39 = 2112;
            v40 = v32;
            _os_log_impl(&dword_1CCE01000, v29, OS_LOG_TYPE_ERROR, "%{public}@[HAPDataValueTransformer] Invalid format/data length (%@/%@) combination.", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v28);
          if (a5)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6737, 0);
            v18 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
LABEL_39:
            v18 = 0;
          }
        }

        break;
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v17;
      v37 = 2048;
      v38 = a4;
      _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPDataValueTransformer] Invalid format '%tu', returning value unchanged", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v18 = v8;
  }

  return v18;
}

+ (Class)expectedTransformedClassForFormat:(unint64_t)a3
{
  if (a3 - 1 > 0xC)
    return (Class)0;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)isValidFormat:(unint64_t)a3
{
  return (a3 < 0x10) & (0x3FFEu >> a3);
}

+ (id)defaultDataValueTransformer
{
  return (id)defaultDataValueTransformer;
}

+ (void)initialize
{
  HAPDataValueTransformer *v2;
  void *v3;

  if (!defaultDataValueTransformer)
  {
    v2 = objc_alloc_init(HAPDataValueTransformer);
    v3 = (void *)defaultDataValueTransformer;
    defaultDataValueTransformer = (uint64_t)v2;

  }
}

@end
