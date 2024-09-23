@implementation AMSMediaResponseDecoder

- (id)resultFromResult:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  AMSMediaResult *v13;
  void *v15;

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
    v10 = objc_msgSend(v8, "statusCode");
    if (v10 == 401)
    {
      v11 = CFSTR("Media token is expired.");
    }
    else
    {
      v10 = objc_msgSend(v8, "statusCode");
      if (v10 == 403)
      {
        v11 = CFSTR("Media token is invalid.");
      }
      else
      {
        if (objc_msgSend(v8, "statusCode") != 404)
        {
          if ((objc_msgSend(v9, "containsIndex:", objc_msgSend(v8, "statusCode")) & 1) != 0)
          {
            v12 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Response status code is: %lu"), objc_msgSend(v8, "statusCode"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            AMSError(301, CFSTR("Invalid Status Code"), v15, 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

          }
LABEL_13:

          if (!v12)
            goto LABEL_14;
          goto LABEL_5;
        }
        v11 = CFSTR("Media resource not found.");
        v10 = 405;
      }
    }
    AMSError(v10, CFSTR("Invalid Status Code"), v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  AMSError(301, CFSTR("Invalid Response"), CFSTR("Response is not of type NSHTTPURLResponse."), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
LABEL_14:
    v13 = -[AMSMediaResult initWithResult:]([AMSMediaResult alloc], "initWithResult:", v5);
    goto LABEL_15;
  }
LABEL_5:
  v13 = 0;
  if (a4)
    *a4 = objc_retainAutorelease(v12);
LABEL_15:

  return v13;
}

@end
