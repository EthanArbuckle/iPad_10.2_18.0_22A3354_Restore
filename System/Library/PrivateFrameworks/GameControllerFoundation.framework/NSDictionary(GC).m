@implementation NSDictionary(GC)

- (id)gc_objectForKey:()GC ofClass:
{
  id v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[6];
  _QWORD v17[7];

  v17[6] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("*** %s: aClass cannot be nil"), "-[NSDictionary(GC) gc_objectForKey:ofClass:]");
    +[NSException exceptionWithName:reason:userInfo:](&off_1F03A68F8, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_claimAutoreleasedReturnValue(), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  v6 = (id)objc_msgSend(a1, "objectForKey:");
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(a3, "description");
    v9 = objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a4);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Value for key '%@' has unexpected class '%@'."), v9, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v16[0] = CFSTR("GC_NSExceptionErrorDomain");
    v16[1] = CFSTR("GC_NSExceptionErrorCode");
    v17[0] = CFSTR("NSCollectionErrorDomain");
    v17[1] = &unk_1EA4F15C8;
    v16[2] = *MEMORY[0x1E0CB2D50];
    v16[3] = CFSTR("NSCollectionErrorIndexKey");
    v17[2] = CFSTR("Invalid dictionary.");
    v17[3] = v9;
    v16[4] = CFSTR("NSCollectionErrorElementClassKey");
    v16[5] = CFSTR("NSCollectionErrorExpectedClassKey");
    v17[4] = v12;
    v17[5] = v10;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v17, v16, 6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSException exceptionWithName:reason:userInfo:](&off_1F03A68F8, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidCollectionException"), v13, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v15);
  }
  return v6;
}

- (id)gc_objectForKey:()GC ofClass:error:
{
  id v8;
  id v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("*** %s: aClass cannot be nil"), "-[NSDictionary(GC) gc_objectForKey:ofClass:error:]");
    +[NSException exceptionWithName:reason:userInfo:](&off_1F03A68F8, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_claimAutoreleasedReturnValue(), 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  v8 = (id)objc_msgSend(a1, "objectForKey:");
  if (!v8 || (objc_opt_isKindOfClass() & 1) != 0)
    return v8;
  if (a5)
  {
    objc_msgSend(a3, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Value for key '%@' has unexpected class '%@'."), v11, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0CB2D68];
    v18[0] = *MEMORY[0x1E0CB2D50];
    v18[1] = v16;
    v19[0] = CFSTR("Invalid dictionary.");
    v19[1] = v15;
    v18[2] = CFSTR("NSCollectionErrorIndexKey");
    v18[3] = CFSTR("NSCollectionErrorElementClassKey");
    v19[2] = v11;
    v19[3] = v14;
    v18[4] = CFSTR("NSCollectionErrorExpectedClassKey");
    v19[4] = v12;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", CFSTR("NSCollectionErrorDomain"), 3, v17);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (id)gc_requiredObjectForKey:()GC ofClass:
{
  id v6;
  void *v7;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  _QWORD v20[6];
  _QWORD v21[6];
  _QWORD v22[4];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("*** %s: aClass cannot be nil"), "-[NSDictionary(GC) gc_requiredObjectForKey:ofClass:]");
    +[NSException exceptionWithName:reason:userInfo:](&off_1F03A68F8, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_claimAutoreleasedReturnValue(), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  v6 = (id)objc_msgSend(a1, "objectForKey:");
  if (!v6)
  {
    objc_msgSend(a3, "description");
    v10 = objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Missing required key '%@'."), v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v22[0] = CFSTR("GC_NSExceptionErrorDomain");
    v22[1] = CFSTR("GC_NSExceptionErrorCode");
    v23[0] = CFSTR("NSCollectionErrorDomain");
    v23[1] = &unk_1EA4F15E0;
    v22[2] = *MEMORY[0x1E0CB2D50];
    v22[3] = CFSTR("NSCollectionErrorIndexKey");
    v23[2] = CFSTR("Invalid dictionary.");
    v23[3] = v10;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11;
    goto LABEL_8;
  }
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(a3, "description");
    v14 = objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a4);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Value for key '%@' has unexpected class '%@'."), v14, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v20[0] = CFSTR("GC_NSExceptionErrorDomain");
    v20[1] = CFSTR("GC_NSExceptionErrorCode");
    v21[0] = CFSTR("NSCollectionErrorDomain");
    v21[1] = &unk_1EA4F15C8;
    v20[2] = *MEMORY[0x1E0CB2D50];
    v20[3] = CFSTR("NSCollectionErrorIndexKey");
    v21[2] = CFSTR("Invalid dictionary.");
    v21[3] = v14;
    v20[4] = CFSTR("NSCollectionErrorElementClassKey");
    v20[5] = CFSTR("NSCollectionErrorExpectedClassKey");
    v21[4] = v17;
    v21[5] = v15;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v21, v20, 6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;
LABEL_8:
    +[NSException exceptionWithName:reason:userInfo:](&off_1F03A68F8, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidCollectionException"), v13, v12);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v19);
  }
  return v7;
}

- (id)gc_requiredObjectForKey:()GC ofClass:error:
{
  id v8;
  void *v9;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("*** %s: aClass cannot be nil"), "-[NSDictionary(GC) gc_requiredObjectForKey:ofClass:error:]");
    +[NSException exceptionWithName:reason:userInfo:](&off_1F03A68F8, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_claimAutoreleasedReturnValue(), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  v8 = (id)objc_msgSend(a1, "objectForKey:");
  if (!v8)
  {
    if (a5)
    {
      objc_msgSend(a3, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Missing required key '%@'."), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *MEMORY[0x1E0CB2D68];
      v23[0] = *MEMORY[0x1E0CB2D50];
      v23[1] = v14;
      v24[0] = CFSTR("Invalid dictionary.");
      v24[1] = v13;
      v23[2] = CFSTR("NSCollectionErrorIndexKey");
      v24[2] = v12;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", CFSTR("NSCollectionErrorDomain"), 1, v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
    }
    return 0;
  }
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a5)
    {
      objc_msgSend(a3, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Value for key '%@' has unexpected class '%@'."), v12, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x1E0CB2D68];
      v21[0] = *MEMORY[0x1E0CB2D50];
      v21[1] = v19;
      v22[0] = CFSTR("Invalid dictionary.");
      v22[1] = v18;
      v21[2] = CFSTR("NSCollectionErrorIndexKey");
      v21[3] = CFSTR("NSCollectionErrorElementClassKey");
      v22[2] = v12;
      v22[3] = v17;
      v21[4] = CFSTR("NSCollectionErrorExpectedClassKey");
      v22[4] = v13;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", CFSTR("NSCollectionErrorDomain"), 3, v20);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
    return 0;
  }
  return v9;
}

- (void)gc_makeValuesPerformSelector:()GC withObject:
{
  id v6;

  objc_msgSend(a1, "allValues");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "makeObjectsPerformSelector:withObject:", a3, a4);

}

- (uint64_t)gc_enumerateKeysAndObjectsUsingBlock:()GC
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__NSDictionary_GC__gc_enumerateKeysAndObjectsUsingBlock___block_invoke;
  v4[3] = &__block_descriptor_40_e15_v32__0_8_16_B24lu32l8;
  v4[4] = a3;
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v4);
}

- (id)gc_dictionaryByRemovingObjectsForKeys:()GC
{
  void *v4;
  void *v5;
  id v7;

  if (!a3)
  {
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("*** %s: keys cannot be nil"), "-[NSDictionary(GC) gc_dictionaryByRemovingObjectsForKeys:]");
    +[NSException exceptionWithName:reason:userInfo:](&off_1F03A68F8, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_claimAutoreleasedReturnValue(), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  v4 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v4, "removeObjectsForKeys:", a3);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

@end
