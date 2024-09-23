@implementation ASDMediaClipTaskResponseDecoder

- (id)resultFromResult:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v5 = a3;
  objc_msgSend(v5, "response");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "response");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 200, 100);
    if (objc_msgSend(v8, "statusCode") == 401
      || objc_msgSend(v8, "statusCode") == 403
      || objc_msgSend(v8, "statusCode") == 404)
    {
      AMSError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if ((objc_msgSend(v9, "containsIndex:", objc_msgSend(v8, "statusCode")) & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Response status code is: %lu"), objc_msgSend(v8, "statusCode"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AMSError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!v10)
      goto LABEL_13;
  }
  else
  {
    AMSError();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
LABEL_13:
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB40]), "initWithResult:", v5);
      goto LABEL_14;
    }
  }
  v11 = 0;
  if (a4)
    *a4 = objc_retainAutorelease(v10);
LABEL_14:

  return v11;
}

@end
