@implementation CKRecordID(HMB)

- (id)externalID:()HMB
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("r");
  objc_msgSend(a1, "recordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("z");
  objc_msgSend(a1, "zoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("u");
  objc_msgSend(a1, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ownerName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "hmbOPACKDataFromDictionaryWithError:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)recordIDFromExternalID:()HMB error:
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99D80], "hmbDictionaryFromOPACKData:error:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("u"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("z"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("r"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v7)
      v11 = v8 == 0;
    else
      v11 = 1;
    if (v11 || v9 == 0)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
        v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95098]), "initWithZoneName:ownerName:", v8, v7);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v10, v13);

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
