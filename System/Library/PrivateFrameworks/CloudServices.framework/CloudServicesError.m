@implementation CloudServicesError

+ (int64_t)codeForNSError:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  int isEqualToString;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  int64_t v13;
  void *v14;
  const char *v15;
  int v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  int v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  int v33;
  const char *v34;
  uint64_t v35;

  v3 = a3;
  objc_msgSend_domain(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v6, v7, *MEMORY[0x24BDD0B88]);

  if (isEqualToString)
  {
    if ((objc_msgSend_code(v3, v9, v10) | 0x100) == 0x104)
    {
      v13 = 4;
    }
    else
    {
      objc_msgSend_userInfo(v3, v11, v12);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v27, v28, *MEMORY[0x24BDD1398]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
        v13 = objc_msgSend_codeForNSError_(CloudServicesError, v30, (uint64_t)v29);
      else
        v13 = 100;

    }
  }
  else
  {
    objc_msgSend_domain(v3, v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_isEqualToString_(v14, v15, *MEMORY[0x24BDD1308]);

    if (v16)
    {
      if (objc_msgSend_code(v3, v17, v18) == -999)
        v13 = 202;
      else
        v13 = 300;
    }
    else
    {
      objc_msgSend_domain(v3, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend_isEqualToString_(v19, v20, *MEMORY[0x24BDD1128]);

      if (v21)
      {
        v24 = objc_msgSend_code(v3, v22, v23);
        v26 = objc_msgSend_codeForErrno_(CloudServicesError, v25, v24);
      }
      else
      {
        objc_msgSend_domain(v3, v22, v23);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend_isEqualToString_(v31, v32, (uint64_t)CFSTR("EscrowServiceErrorDomain"));

        if (!v33)
        {
          v13 = 100;
          goto LABEL_18;
        }
        v26 = objc_msgSend_code(v3, v34, v35);
      }
      v13 = v26;
    }
  }
LABEL_18:

  return v13;
}

+ (int64_t)codeForErrno:(int64_t)a3
{
  int64_t result;
  NSObject *v4;

  if (a3 > 20)
  {
    if (a3 > 61)
    {
      if (a3 == 62)
        return 7;
      if (a3 == 93)
        return 8;
    }
    else
    {
      if (a3 == 21)
        return 6;
      if (a3 == 28)
        return 105;
    }
  }
  else if (a3 > 16)
  {
    if (a3 == 17)
      return 3;
    if (a3 == 20)
      return 5;
  }
  else
  {
    result = 4;
    if (a3 == 2 || a3 == 9)
      return result;
  }
  sub_20D67C0DC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_20D696794(v4);

  return 100;
}

+ (id)errorWithCode:(int64_t)a3 format:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  uint64_t v15;

  v5 = (objc_class *)MEMORY[0x24BDD17C8];
  v6 = a4;
  v7 = [v5 alloc];
  v9 = (void *)objc_msgSend_initWithFormat_arguments_(v7, v8, (uint64_t)v6, &v15);

  objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCE70], v10, (uint64_t)v9, *MEMORY[0x24BDD0FC8], 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v12, (uint64_t)CFSTR("CloudServicesErrorDomain"), a3, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)errorWithCode:(int64_t)a3 error:(id)a4 format:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  uint64_t v18;

  v7 = (objc_class *)MEMORY[0x24BDD17C8];
  v8 = a5;
  v9 = a4;
  v10 = [v7 alloc];
  v12 = (void *)objc_msgSend_initWithFormat_arguments_(v10, v11, (uint64_t)v8, &v18);

  objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCE70], v13, (uint64_t)v12, *MEMORY[0x24BDD0FC8], v9, *MEMORY[0x24BDD1398], 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v15, (uint64_t)CFSTR("CloudServicesErrorDomain"), a3, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)errorWithCode:(int64_t)a3 URL:(id)a4 format:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  uint64_t v18;

  v7 = (objc_class *)MEMORY[0x24BDD17C8];
  v8 = a5;
  v9 = a4;
  v10 = [v7 alloc];
  v12 = (void *)objc_msgSend_initWithFormat_arguments_(v10, v11, (uint64_t)v8, &v18);

  objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCE70], v13, (uint64_t)v12, *MEMORY[0x24BDD0FC8], v9, *MEMORY[0x24BDD1328], 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v15, (uint64_t)CFSTR("CloudServicesErrorDomain"), a3, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)errorWithCode:(int64_t)a3 error:(id)a4 URL:(id)a5 format:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  uint64_t v21;

  v9 = (objc_class *)MEMORY[0x24BDD17C8];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = [v9 alloc];
  v15 = (void *)objc_msgSend_initWithFormat_arguments_(v13, v14, (uint64_t)v10, &v21);

  objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCE70], v16, (uint64_t)v15, *MEMORY[0x24BDD0FC8], v12, *MEMORY[0x24BDD1398], v11, *MEMORY[0x24BDD1328], 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v18, (uint64_t)CFSTR("CloudServicesErrorDomain"), a3, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 format:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  uint64_t v18;

  v7 = (objc_class *)MEMORY[0x24BDD17C8];
  v8 = a5;
  v9 = a3;
  v10 = [v7 alloc];
  v12 = (void *)objc_msgSend_initWithFormat_arguments_(v10, v11, (uint64_t)v8, &v18);

  objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCE70], v13, (uint64_t)v12, *MEMORY[0x24BDD0FC8], 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v15, (uint64_t)v9, a4, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)errorForNSError:(id)a3 path:(id)a4 format:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  uint64_t v22;

  v7 = (objc_class *)MEMORY[0x24BDD17C8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [v7 alloc];
  v13 = (void *)objc_msgSend_initWithFormat_arguments_(v11, v12, (uint64_t)v8, &v22);

  objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCE70], v14, (uint64_t)v13, *MEMORY[0x24BDD0FC8], v10, *MEMORY[0x24BDD1398], v9, *MEMORY[0x24BDD0CB8], 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BDD1540];
  v18 = objc_msgSend_codeForNSError_(CloudServicesError, v17, (uint64_t)v10);

  objc_msgSend_errorWithDomain_code_userInfo_(v16, v19, (uint64_t)CFSTR("CloudServicesErrorDomain"), v18, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end
