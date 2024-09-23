@implementation MKHTTPParser

- (id)parse:(id)a3 hostname:(id)a4
{
  id v5;
  char *v6;
  id v7;
  id v8;
  char v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  id v15;
  char v16;
  MKHTTPRequest *v17;
  void *v18;
  MKHTTPRequest *v19;
  MKHTTPHeaders *v20;
  id v22;
  void *v23;
  void *v24;

  v5 = a3;
  v22 = a4;
  v6 = (char *)malloc_type_malloc(0x400uLL, 0x100004077774924uLL);
  v23 = v5;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE90]), "initWithData:", v5);
  objc_msgSend(v24, "open");
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v9 = 0;
  v10 = 0;
  while (2)
  {
    v11 = objc_msgSend(v24, "read:maxLength:", v6, 1024);
    if (!v11)
      break;
    v12 = 0;
    while (1)
    {
      v13 = v6[v12];
      if (v13 == 10 && v9 == 13)
        break;
      objc_msgSend(v8, "appendFormat:", CFSTR("%c"), v6[v12]);
LABEL_11:
      v9 = v13;
      if (v11 == ++v12)
        goto LABEL_15;
    }
    if (objc_msgSend(v8, "length") != 1)
    {
      objc_msgSend(v8, "deleteCharactersInRange:", objc_msgSend(v8, "length") - 1, 1);
      objc_msgSend(v7, "addObject:", v8);
      v15 = objc_alloc_init(MEMORY[0x24BDD16A8]);

      v8 = v15;
      goto LABEL_11;
    }
    if ((_DWORD)v12)
    {
      v16 = 0;
      v10 += v12 + 1;
      goto LABEL_17;
    }
    v9 = 13;
LABEL_15:
    v10 += v11;
    if (v11 == 1024)
      continue;
    break;
  }
  v16 = 1;
LABEL_17:
  objc_msgSend(v24, "close");
  free(v6);
  if ((v16 & 1) != 0)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(v23, "subdataWithRange:", v10, objc_msgSend(v23, "length") - v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = [MKHTTPRequest alloc];
    v20 = -[MKHTTPHeaders initWithArray:]([MKHTTPHeaders alloc], "initWithArray:", v7);
    v17 = -[MKHTTPRequest initWithHeaders:body:hostname:](v19, "initWithHeaders:body:hostname:", v20, v18, v22);

  }
  return v17;
}

- (id)chunk:(id)a3 offset:(unint64_t *)a4 done:(BOOL *)a5
{
  id v6;
  unsigned __int8 *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  int v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  BOOL *v25;
  id v27;
  int v28;

  v6 = a3;
  if (!v6)
  {
    v22 = 0;
    goto LABEL_24;
  }
  v25 = a5;
  v7 = (unsigned __int8 *)malloc_type_malloc(0x400uLL, 0x100004077774924uLL);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE90]), "initWithData:", v6);
  objc_msgSend(v24, "open");
  v27 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v28 = 0;
  do
  {
    v12 = objc_msgSend(v24, "read:maxLength:", v7, 1024);
    if (!v12)
      break;
    v13 = v12;
    for (i = 0; i != v13; ++i)
    {
      v15 = v11;
      v11 = v7[i];
      if (v11 != 10 || v15 != 13)
      {
        ++v9;
        continue;
      }
      v17 = v9 - 1;
      if ((v8 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(objc_retainAutorelease(v6), "bytes") + v10, v9 - 1, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v19, 4);
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17A8]), "initWithString:", v20);
        objc_msgSend(v21, "scanHexInt:", &v28);
        v10 += v9 + 1;

        v9 = 0;
LABEL_19:
        v8 = 1;
        continue;
      }
      if (v17 != v28)
      {
        ++v9;
        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(objc_retainAutorelease(v6), "bytes") + v10, v9 - 1, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "appendData:", v18);
      if (a4)
        *a4 = v10 + v17 + 2;
      if (v25)
        *v25 = objc_msgSend(v18, "length") == 0;
      v10 += v9 + 1;
      v28 = 0;

      v9 = 0;
      v8 = 0;
    }
  }
  while (v13 == 1024);
  objc_msgSend(v24, "close");
  free(v7);

  v22 = v27;
LABEL_24:

  return v22;
}

- (id)parts:(id)a3 boundary:(id)a4 container:(id)a5
{
  id v7;
  id v8;
  id v9;
  unsigned __int8 *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  int v19;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  MKHTTPRequest *v29;
  MKHTTPHeaders *v30;
  void *v31;
  MKHTTPRequest *v32;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  char v42;
  void *v43;
  void *v44;
  id v45;

  v7 = a3;
  v8 = a4;
  v37 = a5;
  v9 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v9, "appendString:", CFSTR("--"));
  v35 = v8;
  objc_msgSend(v9, "appendString:", v8);
  v34 = v9;
  objc_msgSend(v9, "dataUsingEncoding:", 4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (unsigned __int8 *)malloc_type_malloc(0x400uLL, 0x100004077774924uLL);
  v45 = v7;
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE90]), "initWithData:", v7);
  objc_msgSend(v38, "open");
  v36 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v44 = 0;
  v41 = 0;
  v42 = 0;
  v14 = 0;
  v15 = 1;
  do
  {
    v16 = objc_msgSend(v38, "read:maxLength:", v10, 1024);
    if (!v16)
      break;
    v17 = v16;
    for (i = 0; i != v17; ++i)
    {
      v19 = v11;
      v11 = v10[i];
      if (v11 != 10 || v19 != 13)
      {
        ++v13;
        continue;
      }
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(objc_retainAutorelease(v45), "bytes") + v12, v13 - 1, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if ((v15 & 1) != 0)
      {
        if (objc_msgSend(v21, "isEqualToData:", v43))
        {
          v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);

          v15 = 0;
          v41 = 0;
          v12 += v13 + 1;
          v14 = 1;
          v44 = v23;
LABEL_22:
          v13 = 0;
          goto LABEL_23;
        }
        ++v13;
      }
      else
      {
        if (!objc_msgSend(v21, "length"))
        {
          v15 = 0;
          v14 = 0;
          v12 += v13 + 1;
          v42 = 1;
          goto LABEL_22;
        }
        if ((v14 & 1) != 0)
        {
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v22, 4);
          objc_msgSend(v44, "addObject:", v24);
          objc_msgSend(v24, "lowercaseString");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "hasPrefix:", CFSTR("content-length"));

          if (v26)
          {
            objc_msgSend(v24, "componentsSeparatedByString:", CFSTR(": "));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v27, "count") == 2)
            {
              v40 = objc_alloc_init(MEMORY[0x24BDD16F0]);
              objc_msgSend(v40, "setNumberStyle:", 1);
              objc_msgSend(v27, "objectAtIndexedSubscript:", 1);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "numberFromString:", v39);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v28, "unsignedLongLongValue");

            }
          }
          v12 += v13 + 1;

          v15 = 0;
          v13 = 0;
          v14 = 1;
          goto LABEL_23;
        }
        if ((v42 & 1) == 0)
        {
          v15 = 0;
          v14 = 0;
          v42 = 0;
          ++v13;
          goto LABEL_23;
        }
        if (v41 && objc_msgSend(v22, "length") != v41)
        {
          v15 = 0;
          v14 = 0;
          ++v13;
          v42 = 1;
          goto LABEL_23;
        }
        v29 = [MKHTTPRequest alloc];
        v30 = -[MKHTTPHeaders initWithMultipartHeaderArray:]([MKHTTPHeaders alloc], "initWithMultipartHeaderArray:", v44);
        objc_msgSend(v37, "hostname");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = -[MKHTTPRequest initWithHeaders:body:hostname:](v29, "initWithHeaders:body:hostname:", v30, v22, v31);

        objc_msgSend(v36, "addObject:", v32);
        v12 += v13 + 1;

        v14 = 0;
        v42 = 0;
        v13 = 0;
      }
      v15 = 1;
LABEL_23:

    }
  }
  while (v17 == 1024);
  objc_msgSend(v38, "close");
  free(v10);

  return v36;
}

@end
