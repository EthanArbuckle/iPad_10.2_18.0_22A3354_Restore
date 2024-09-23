@implementation _HKCDADocumentSampleComparisonFilter(HealthDaemon)

- (__CFString)propertyForKeyPath
{
  void *v4;
  int v5;
  __CFString **v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  __CFString *v13;
  void *v15;

  objc_msgSend(a1, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB5790]);

  if (v5)
  {
    v6 = _HDCDASamplePropertyAuthorName;
  }
  else
  {
    objc_msgSend(a1, "keyPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB5798]);

    if (v8)
    {
      v6 = _HDCDASamplePropertyCustodianName;
    }
    else
    {
      objc_msgSend(a1, "keyPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB57A0]);

      if (v10)
      {
        v6 = _HDCDASamplePropertyPatientName;
      }
      else
      {
        objc_msgSend(a1, "keyPath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB57A8]);

        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKCDADocumentSampleComparisonFilter+HealthDaemon.m"), 37, CFSTR("Unreachable code has been executed"));

          v13 = &stru_1E6D11BB8;
          return v13;
        }
        v6 = _HDCDASamplePropertyTitle;
      }
    }
  }
  v13 = *v6;
  return v13;
}

@end
