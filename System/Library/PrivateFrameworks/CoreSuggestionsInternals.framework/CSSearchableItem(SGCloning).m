@implementation CSSearchableItem(SGCloning)

- (id)sg_clone
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_getAssociatedObject(a1, sel_sg_clonableItemAtIndex_inCodedArray_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0CA6B48];
    objc_msgSend(v2, "second");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedIntegerValue");
    objc_msgSend(v3, "first");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sg_clonableItemAtIndex:inCodedArray:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != a1)
      goto LABEL_11;
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v3, "first");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v18;
      v21 = 2112;
      v22 = a1;
      _os_log_fault_impl(&dword_1C3607000, v9, OS_LOG_TYPE_FAULT, "expected coded array %@ to give a new instance of %@ but it didn't", (uint8_t *)&v19, 0x16u);

    }
    if ((_PASEvaluateLogFaultAndProbCrashCriteria() & 1) != 0)
      abort();

  }
  v8 = (void *)objc_msgSend(a1, "copy");
  objc_msgSend(a1, "attributeSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textContentNoCopy");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
LABEL_10:

    goto LABEL_11;
  }
  v12 = (void *)v11;
  objc_msgSend(v8, "attributeSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textContentNoCopy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(a1, "attributeSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textContent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributeSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextContent:", v15);

    goto LABEL_10;
  }
LABEL_11:

  return v8;
}

+ (id)sg_clonableItemAtIndex:()SGCloning inCodedArray:
{
  id v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1E0D81638];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tupleWithFirst:second:", v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_setAssociatedObject(v8, a2, v11, (void *)1);
  }

  return v8;
}

@end
