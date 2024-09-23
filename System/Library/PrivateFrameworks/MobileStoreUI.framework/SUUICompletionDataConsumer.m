@implementation SUUICompletionDataConsumer

- (id)_invalidResponseError
{
  return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEB24A0], 111, 0);
}

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  SUUICompletionList *v14;
  id v16;

  v8 = a3;
  if (objc_msgSend(a4, "statusCode") == 200)
  {
    if (v8)
    {
      v16 = 0;
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v8, 0, 0, &v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v16;
      v11 = v10;
      if (v9)
        v12 = v10 == 0;
      else
        v12 = 0;
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = -[SUUICompletionList initWithCompletionListDictionary:]([SUUICompletionList alloc], "initWithCompletionListDictionary:", v9);
LABEL_18:

          goto LABEL_19;
        }
        if (a5)
        {
          -[SUUICompletionDataConsumer _invalidResponseError](self, "_invalidResponseError");
          v13 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
      }
      else if (a5)
      {
        v13 = objc_retainAutorelease(v10);
LABEL_16:
        v14 = 0;
        *a5 = v13;
        goto LABEL_18;
      }
      v14 = 0;
      goto LABEL_18;
    }
    goto LABEL_11;
  }
  if (!a5)
  {
LABEL_11:
    v14 = 0;
    goto LABEL_19;
  }
  -[SUUICompletionDataConsumer _invalidResponseError](self, "_invalidResponseError");
  v14 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v14;
}

@end
