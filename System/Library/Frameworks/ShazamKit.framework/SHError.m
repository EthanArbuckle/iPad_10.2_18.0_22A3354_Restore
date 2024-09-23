@implementation SHError

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:underlyingError:keyOverrides:", a3, a4, MEMORY[0x24BDBD1B8]);
}

+ (id)privateErrorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  if (a3 == 203)
  {
    v5 = (void *)MEMORY[0x24BDBCED8];
    v6 = a4;
    objc_msgSend(v5, "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v6, *MEMORY[0x24BDD1398]);

    objc_msgSend(v7, "setValue:forKey:", CFSTR("The match attempt was cancelled"), *MEMORY[0x24BDD0BA0]);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ShazamKit"), 203, v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 keyOverrides:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = (void *)MEMORY[0x24BDBCED8];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v10, *MEMORY[0x24BDD1398]);

  objc_msgSend(a1, "messageForCode:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v12, *MEMORY[0x24BDD0BA0]);

  objc_msgSend(v11, "setValuesForKeysWithDictionary:", v9);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ShazamKit"), a3, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)annotateClientError:(id *)a3 code:(int64_t)a4 underlyingError:(id)a5
{
  return objc_msgSend(a1, "annotateClientError:code:underlyingError:keyOverrides:", a3, a4, a5, MEMORY[0x24BDBD1B8]);
}

+ (BOOL)annotateClientError:(id *)a3 code:(int64_t)a4 underlyingError:(id)a5 keyOverrides:(id)a6
{
  void *v7;
  void *v8;

  +[SHError errorWithCode:underlyingError:keyOverrides:](SHError, "errorWithCode:underlyingError:keyOverrides:", a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3)
    *a3 = objc_retainAutorelease(v7);

  return a3 != 0;
}

+ (id)messageForCode:(int64_t)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;

  v3 = CFSTR("The supplied audio is not contiguous. Flow contiguous audio.");
  v4 = CFSTR("There was an error syncing items to the library.");
  v5 = CFSTR("ShazamKit encountered an internal error.");
  v6 = CFSTR("Failed to fetch Media Item. Ensure shazamID is valid.");
  if (a3 != 600)
    v6 = CFSTR("The supplied audio is not contiguous. Flow contiguous audio.");
  if (a3 != 500)
    v5 = v6;
  if (a3 != 400)
    v4 = v5;
  v7 = CFSTR("The Catalog URL is not a file path URL that points to a valid catalog.");
  if (a3 != 301)
    v7 = CFSTR("The supplied audio is not contiguous. Flow contiguous audio.");
  if (a3 == 300)
    v7 = CFSTR("The Custom Catalog is invalid.");
  if (a3 <= 399)
    v4 = v7;
  v8 = CFSTR("The provided signature duration is outside the valid range.");
  v9 = CFSTR("The match attempt failed.");
  if (a3 != 202)
    v9 = CFSTR("The supplied audio is not contiguous. Flow contiguous audio.");
  if (a3 != 201)
    v8 = v9;
  if (a3 == 200)
    v3 = CFSTR("The Signature was invalid (possibly no peaks). Ensure novel audio is playing.");
  if (a3 == 100)
    v3 = CFSTR("The supplied audio format is not supported. Please choose a supported audio format.");
  if (a3 > 200)
    v3 = v8;
  if (a3 <= 299)
    return (id)v3;
  else
    return (id)v4;
}

+ (id)normalizedError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  if (a3)
  {
    v3 = a3;
    v4 = (void *)objc_opt_class();
    objc_msgSend(v3, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "normalizedUserInfo:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v3, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v3, "code");

    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (id)normalizedUserInfo:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  id v15;

  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __30__SHError_normalizedUserInfo___block_invoke;
  v13 = &unk_24D9B78A8;
  v14 = v6;
  v15 = a1;
  v7 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v10);

  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);
  return v8;
}

void __30__SHError_normalizedUserInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v12 = a2;
  v5 = a3;
  if (!objc_msgSend(MEMORY[0x24BDD1770], "propertyList:isValidForFormat:", v5, 200))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDD1398])
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend((id)objc_opt_class(), "normalizedError:", v5);
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDD10D8]))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v7 = (void *)MEMORY[0x24BDBCEB8];
            v8 = v5;
            objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v13[0] = MEMORY[0x24BDAC760];
            v13[1] = 3221225472;
            v13[2] = __30__SHError_normalizedUserInfo___block_invoke_2;
            v13[3] = &unk_24D9B7880;
            v10 = *(_QWORD *)(a1 + 40);
            v14 = v9;
            v15 = v10;
            v11 = v9;
            objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);

            objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v12);
LABEL_12:

            goto LABEL_13;
          }
        }
        objc_msgSend(v5, "description");
        v6 = objc_claimAutoreleasedReturnValue();
      }
      v11 = (id)v6;
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v12);
      goto LABEL_12;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v12);
LABEL_13:

}

void __30__SHError_normalizedUserInfo___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend((id)objc_opt_class(), "normalizedError:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

+ (id)remapErrorToClientError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "sh_isMatchAttemptCancelledError"))
      goto LABEL_3;
    if (objc_msgSend(v4, "sh_hasShazamKitPublicErrorDomain"))
    {
      v6 = v4;
      goto LABEL_8;
    }
    if (!objc_msgSend(v4, "sh_isShazamCoreError"))
    {
      if (objc_msgSend(v4, "sh_isMediaLibraryError"))
      {
        v5 = 400;
        goto LABEL_4;
      }
LABEL_3:
      v5 = 202;
LABEL_4:
      +[SHError errorWithCode:underlyingError:](SHError, "errorWithCode:underlyingError:", v5, v4);
      v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v7 = v6;
      goto LABEL_9;
    }
    v9 = objc_msgSend(v4, "code");
    v10 = 202;
    if (v9 == 302)
      v10 = 600;
    if ((unint64_t)(v9 - 400) < 2)
      v10 = 500;
    if ((unint64_t)(v9 - 300) >= 2)
      v11 = v10;
    else
      v11 = 300;
    objc_msgSend(v4, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BE90530], "messageForCode:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHError errorWithCode:underlyingError:keyOverrides:](SHError, "errorWithCode:underlyingError:keyOverrides:", v11, v13, v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
LABEL_9:

  return v7;
}

+ (BOOL)remapErrorToClientErrorPointer:(id *)a3
{
  if (a3)
  {
    objc_msgSend(a1, "remapErrorToClientError:", *a3);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 1;
}

@end
