@implementation DESRecordSet(MLRTask)

+ (id)recordSetForTask:()MLRTask
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char isKindOfClass;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "DESTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "DESTask");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "matchingRecordSet");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "internalTask");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "internalTask");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordSet");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v6;

LABEL_7:
  return v9;
}

@end
