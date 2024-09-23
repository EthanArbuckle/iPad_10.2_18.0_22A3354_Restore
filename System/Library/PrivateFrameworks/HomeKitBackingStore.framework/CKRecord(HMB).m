@implementation CKRecord(HMB)

- (id)hmbDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmbDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recordChangeTag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "modifiedByDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "modificationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@/%@/%@/%@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)externalData:()HMB
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(a1, "encodeSystemFieldsWithCoder:", v5);
  objc_msgSend(v5, "finishEncoding");
  if (a3)
  {
    objc_msgSend(v5, "error");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "encodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)externalID:()HMB
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "externalID:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)hmbSetObject:()HMB forKey:encrypted:
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a4;
  v9 = a3;
  v11 = v9;
  if (a5)
  {
    objc_msgSend(a1, "encryptedValuesByKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v11, v8);

    v8 = v11;
    v11 = v10;
  }
  else
  {
    objc_msgSend(a1, "setObject:forKey:", v9, v8);
  }

}

- (id)hmbObjectForKey:()HMB encrypted:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (a4)
  {
    objc_msgSend(a1, "encryptedValuesByKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v7;
  }
  else
  {
    objc_msgSend(a1, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)recordFromExternalData:()HMB error:
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v15;

  v5 = (objc_class *)MEMORY[0x1E0CB3710];
  v6 = a3;
  v15 = 0;
  v7 = (void *)objc_msgSend([v5 alloc], "initForReadingFromData:error:", v6, &v15);

  v8 = v15;
  v9 = v8;
  if (!v7)
  {
    if (a4)
    {
      if (v8)
      {
        v10 = 0;
        *a4 = objc_retainAutorelease(v8);
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v13;

    }
    v10 = 0;
    goto LABEL_15;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithCoder:", v7);
  objc_msgSend(v7, "finishDecoding");
  if (v10)
  {
    v11 = v10;
  }
  else if (a4)
  {
    objc_msgSend(v7, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v7, "error");
    else
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_15:
  return v10;
}

@end
