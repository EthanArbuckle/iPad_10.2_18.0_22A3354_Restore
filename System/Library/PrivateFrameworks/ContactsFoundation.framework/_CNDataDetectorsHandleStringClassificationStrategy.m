@implementation _CNDataDetectorsHandleStringClassificationStrategy

+ (id)dataDetectorsStrategy
{
  return objc_alloc_init(_CNDataDetectorsHandleStringClassificationStrategy);
}

+ (id)assistedDataDetectorsStrategy
{
  return objc_alloc_init(_CNAssistedDataDetectorsHandleStringClassificationStrategy);
}

- (unint64_t)classificationOfHandleString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  unint64_t v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  int v14;

  +[CNObservable scannerResultsInString:](CNObservable, "scannerResultsInString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", *MEMORY[0x1E0D1CAB0]);

    if ((v7 & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(v5, "type");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0D1CB40]);

      if ((v10 & 1) != 0
        || (objc_msgSend(v5, "type"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = objc_msgSend(v11, "isEqual:", *MEMORY[0x1E0D1CB50]),
            v11,
            (v12 & 1) != 0))
      {
        v8 = 2;
      }
      else
      {
        objc_msgSend(v5, "type");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", *MEMORY[0x1E0D1CBB0]);

        if (v14)
          v8 = 2;
        else
          v8 = 0;
      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
