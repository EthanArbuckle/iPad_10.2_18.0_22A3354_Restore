@implementation NSKeyedUnarchiver(AXMExtras)

+ (id)axmSecurelyUnarchiveData:()AXMExtras withExpectedClass:otherAllowedClasses:error:
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  id v23;
  id v24;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;

  v9 = a3;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = 0;
    v17 = 0;
    v21 = 0;
    v22 = CFSTR("'data' was not of required type NSData");
LABEL_6:
    _AXMMakeError(0, v22, v11, v12, v13, v14, v15, v16, v29);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v31 = 0;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v9, &v31);
  v18 = v31;
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = 0;
    if (!a6)
      goto LABEL_9;
    goto LABEL_8;
  }
  v29 = 0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", a4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v26;
  if (v10)
  {
    objc_msgSend(v26, "setByAddingObjectsFromSet:", v10);
    v27 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v27;
  }
  v28 = *MEMORY[0x1E0CB2CD0];
  v30 = 0;
  objc_msgSend(v17, "decodeTopLevelObjectOfClasses:forKey:error:", v21, v28, &v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v30;
  if (!v23)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = 0;
      if (!a6)
        goto LABEL_9;
      goto LABEL_8;
    }
    v22 = CFSTR("'unarchivedResult' was not of type 'expectedClass'");
    goto LABEL_6;
  }
LABEL_7:
  v19 = v23;
  if (a6)
LABEL_8:
    *a6 = objc_retainAutorelease(v19);
LABEL_9:
  v24 = v20;

  return v24;
}

@end
