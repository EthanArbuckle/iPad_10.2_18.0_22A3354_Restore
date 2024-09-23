@implementation FSTaskOptionsBundle

+ (id)bundleForArguments:(char *)a3 count:(int)a4 syntaxDictionary:(id)a5 errorHandler:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v7 = *(_QWORD *)&a4;
  v10 = a5;
  v11 = a6;
  if (v10)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("shortOptions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("shortOptions"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOptionString:count:optionString:errorHandler:", a3, v7, v12, v11);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be encoded by an NSXPCCoder."), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  objc_msgSend(v5, "encodeObject:forKey:", self->_options, CFSTR("FSTaskOption.options"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parameters, CFSTR("FSTaskOption.properties"));

}

- (FSTaskOptionsBundle)initWithCoder:(id)a3
{
  id v4;
  FSTaskOptionsBundle *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *options;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *parameters;
  id v17;
  objc_super v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be decoded by an NSXPCCoder."), 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  v18.receiver = self;
  v18.super_class = (Class)FSTaskOptionsBundle;
  v5 = -[FSTaskOptionsBundle init](&v18, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("FSTaskOption.options"));
    v9 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (NSArray *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("FSTaskOption.properties"));
    v14 = objc_claimAutoreleasedReturnValue();
    parameters = v5->_parameters;
    v5->_parameters = (NSArray *)v14;

  }
  return v5;
}

- (FSTaskOptionsBundle)init
{
  FSTaskOptionsBundle *v2;
  uint64_t v3;
  NSArray *options;
  uint64_t v5;
  NSArray *parameters;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FSTaskOptionsBundle;
  v2 = -[FSTaskOptionsBundle init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    options = v2->_options;
    v2->_options = (NSArray *)v3;

    v5 = objc_opt_new();
    parameters = v2->_parameters;
    v2->_parameters = (NSArray *)v5;

  }
  return v2;
}

- (void)addOption:(id)a3
{
  NSArray *options;
  id v5;
  NSArray *parameters;
  id v7;

  options = self->_options;
  v5 = a3;
  -[NSArray addObject:](options, "addObject:", v5);
  parameters = self->_parameters;
  objc_msgSend(v5, "originalArgv");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NSArray addObjectsFromArray:](parameters, "addObjectsFromArray:", v7);
}

- (FSTaskOptionsBundle)initWithOptionString:(char *)a3 count:(int)a4 optionString:(id)a5 errorHandler:(id)a6
{
  id v10;
  void (**v11)(id, void *, void *);
  FSTaskOptionsBundle *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  FSTaskOptionsBundle *v23;

  v10 = a5;
  v11 = (void (**)(id, void *, void *))a6;
  v12 = -[FSTaskOptionsBundle init](self, "init");
  if (v10 && objc_msgSend(v10, "length") && v12)
  {
    if (objc_msgSend(v10, "characterAtIndex:", 0) == 58)
    {
      v13 = v10;
    }
    else
    {
      objc_msgSend(CFSTR(":"), "stringByAppendingString:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v14 = 0;
    v15 = 0;
    *MEMORY[0x24BDAF288] = 1;
    while (1)
    {
      v10 = objc_retainAutorelease(v13);
      v16 = getopt(a4, a3, (const char *)objc_msgSend(v10, "UTF8String"));
      if (v16 << 24 == -16777216)
        break;
      v17 = (char)v16;
      if ((_DWORD)v17 == 58)
      {
        fs_errorForPOSIXError(22);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
LABEL_19:
          v11[2](v11, v19, v14);

          v23 = 0;
          goto LABEL_22;
        }
      }
      else if ((_DWORD)v17 == 63)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3[*MEMORY[0x24BDAF278] - 1]);
        v18 = objc_claimAutoreleasedReturnValue();

        fs_errorForPOSIXError(45);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)v18;
        if (v19)
          goto LABEL_19;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c"), v17);
        v20 = objc_claimAutoreleasedReturnValue();

        if (*MEMORY[0x24BDAF270])
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[FSTaskOption option:value:](FSTaskOption, "option:value:", v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[FSTaskOptionsBundle addOption:](v12, "addOption:", v22);

        }
        else
        {
          +[FSTaskOption optionWithoutValue:](FSTaskOption, "optionWithoutValue:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[FSTaskOptionsBundle addOption:](v12, "addOption:", v21);
        }

        v15 = (void *)v20;
      }
    }

  }
  v23 = v12;
LABEL_22:

  return v23;
}

+ (id)bundleForArguments:(char *)a3 count:(int)a4 extension:(id)a5 operationType:(unsigned __int8)a6 errorHandler:(id)a7
{
  int v8;
  uint64_t v9;
  id v11;
  id v12;
  FSTaskOptionsBundle *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  FSTaskOptionsBundle *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, void *);
  void *v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v8 = a6;
  v9 = *(_QWORD *)&a4;
  v11 = a5;
  v12 = a7;
  v13 = objc_alloc_init(FSTaskOptionsBundle);
  v14 = objc_opt_new();
  v15 = (void *)v14;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__0;
  v34 = __Block_byref_object_dispose__0;
  v35 = 0;
  if (v13)
    v16 = v14 == 0;
  else
    v16 = 1;
  if (!v16)
  {
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = __85__FSTaskOptionsBundle_bundleForArguments_count_extension_operationType_errorHandler___block_invoke;
    v27 = &unk_250C32410;
    v28 = v11;
    v29 = &v30;
    objc_msgSend(v15, "installedExtensionsSync:", &v24);
    v18 = (void *)v31[5];
    if (!v18)
    {
      puts("No bundle for us!");
      v20 = 0;
      v21 = 0;
      v17 = 0;
LABEL_22:

      goto LABEL_23;
    }
    if (v8 == 2)
    {
      objc_msgSend(v18, "attributes", v24, v25, v26, v27);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("FSActivateOptionSyntax"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = &stru_250C33628;
    }
    else if (v8 == 1)
    {
      objc_msgSend(v18, "attributes", v24, v25, v26, v27);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("FSFormatOptionSyntax"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("Nv:");
    }
    else
    {
      if (v8)
      {
        v20 = 0;
        v21 = 0;
LABEL_21:
        v17 = -[FSTaskOptionsBundle initWithOptionString:count:optionString:errorHandler:](v13, "initWithOptionString:count:optionString:errorHandler:", a3, v9, v21, v12);
        goto LABEL_22;
      }
      objc_msgSend(v18, "attributes", v24, v25, v26, v27);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("FSCheckOptionSyntax"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("qny");
    }

    if (v20)
    {
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("shortOptions"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("shortOptions"));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    goto LABEL_21;
  }
  if (!v14)
  {

    v13 = 0;
  }
  v13 = v13;
  v17 = v13;
LABEL_23:
  _Block_object_dispose(&v30, 8);

  return v17;
}

void __85__FSTaskOptionsBundle_bundleForArguments_count_extension_operationType_errorHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (!a2 || v5)
  {
    fskit_std_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_23B2A6000, v9, OS_LOG_TYPE_INFO, "Could not get extensions - %@", buf, 0xCu);
    }

  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __85__FSTaskOptionsBundle_bundleForArguments_count_extension_operationType_errorHandler___block_invoke_2;
    v10[3] = &unk_250C323E8;
    v7 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v11 = v7;
    v12 = v8;
    objc_msgSend(a2, "enumerateObjectsUsingBlock:", v10);

  }
}

void __85__FSTaskOptionsBundle_bundleForArguments_count_extension_operationType_errorHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

+ (void)resetOptionEnumeration
{
  *MEMORY[0x24BDAF278] = 1;
  *MEMORY[0x24BDAF288] = 1;
}

- (void)enumerateOptionsWithBlock:(id)a3
{
  void (**v4)(id, uint64_t, void *, NSUInteger, char *);
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  char v13;

  v4 = (void (**)(id, uint64_t, void *, NSUInteger, char *))a3;
  v5 = -[NSArray count](self->_options, "count");
  v13 = 0;
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = v8;
      -[NSArray objectAtIndexedSubscript:](self->_options, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "option");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = *(char *)objc_msgSend(v10, "UTF8String");

      if ((objc_msgSend(v8, "hasValue") & 1) != 0)
      {
        objc_msgSend(v8, "optionValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v11, v12, v7, &v13);

      }
      else
      {
        v4[2](v4, v11, 0, v7, &v13);
      }
      if (v13)
        break;
      ++v7;
    }
    while (v7 < v6);

  }
}

- (NSArray)options
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)parameters
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
