@implementation ENError

+ (id)connectionFailedError
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BDD0FC8];
  v7[0] = CFSTR("Connection failed to Evernote Service.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("ENErrorDomain"), 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)noteSizeLimitReachedError
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BDD0FC8];
  v7[0] = CFSTR("Note exceeded size limit to upload.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("ENErrorDomain"), 6, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)errorFromException:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v15 = 0;
    goto LABEL_25;
  }
  v5 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(v3, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "errorCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");

    v10 = objc_msgSend((id)objc_opt_class(), "sanitizedErrorCodeFromEDAMErrorCode:", v9);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("EDAMErrorCode"));

    v12 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FC8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      goto LABEL_12;
    objc_msgSend((id)objc_opt_class(), "localizedDescriptionForENErrorCode:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v12);
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    if (v17)
    {
      objc_msgSend(v4, "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BDD0FC8]);
      v10 = 1;
LABEL_9:

      goto LABEL_12;
    }
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
LABEL_12:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = v4;
    objc_msgSend(v18, "rateLimitDuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v18, "rateLimitDuration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, CFSTR("rateLimitDuration"));

    }
    objc_msgSend(v18, "message");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v18, "message");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, CFSTR("message"));

    }
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "identifier");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("parameter"));
    v10 = 4;
LABEL_19:

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "parameter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, CFSTR("parameter"));

  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ENErrorDomain"), v10, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_25:
  return v15;
}

+ (int64_t)sanitizedErrorCodeFromEDAMErrorCode:(int)a3
{
  if ((a3 - 2) > 0x11)
    return 0;
  else
    return qword_22D6AD3B0[a3 - 2];
}

+ (id)localizedDescriptionForENErrorCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 8)
    return CFSTR("Unknown error");
  else
    return off_24F8B0418[a3 - 2];
}

@end
