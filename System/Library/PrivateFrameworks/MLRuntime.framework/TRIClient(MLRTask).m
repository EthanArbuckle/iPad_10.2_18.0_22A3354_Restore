@implementation TRIClient(MLRTask)

+ (id)mlr_clientWithMLRTask:()MLRTask
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "internalTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "internalTask");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "triClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)mlr_namespaceNameWithMLRTask:()MLRTask
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "internalTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "internalTask");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "triBMLT");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "namespaceId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
