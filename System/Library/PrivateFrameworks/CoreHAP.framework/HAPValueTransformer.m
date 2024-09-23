@implementation HAPValueTransformer

+ (Class)expectedClassForFormat:(unint64_t)a3
{
  if (a3 - 1 > 0xE)
    return (Class)0;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (id)reverseTransformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7
    && (v8 = objc_msgSend((id)objc_opt_class(), "expectedTransformedClassForFormat:", a4),
        (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Value class, %@, is not of the expected class %@"), objc_opt_class(), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPValueTransformer] %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    if (a5)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB2D50];
      v18 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6756, v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v9 = 0;
  }
  else
  {
    v9 = v7;
  }

  return v9;
}

- (id)transformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7
    && (v8 = objc_msgSend((id)objc_opt_class(), "expectedClassForFormat:", a4), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Value class, %@, is not of the expected class %@"), objc_opt_class(), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPValueTransformer] %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    if (a5)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB2D50];
      v18 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6756, v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v9 = 0;
  }
  else
  {
    v9 = v7;
  }

  return v9;
}

+ (Class)expectedTransformedClassForFormat:(unint64_t)a3
{
  return +[HAPValueTransformer expectedClassForFormat:](HAPValueTransformer, "expectedClassForFormat:", a3);
}

@end
