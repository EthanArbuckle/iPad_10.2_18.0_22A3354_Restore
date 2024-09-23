@implementation AMDOptArgParser

- (id)getValueForOption:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;
  id location[2];
  AMDOptArgParser *v12;
  id v13;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = -[AMDOptArgParser parsedOptArgs](v12, "parsedOptArgs");
  v10 = (id)-[NSMutableDictionary objectForKey:](v9, "objectForKey:", location[0]);

  if (v10)
  {
    v8 = -[AMDOptArgParser parsedOptArgs](v12, "parsedOptArgs");
    v13 = (id)-[NSMutableDictionary objectForKey:](v8, "objectForKey:", location[0]);

  }
  else
  {
    v6 = -[AMDOptArgParser options](v12, "options");
    v7 = (id)-[NSMutableDictionary objectForKey:](v6, "objectForKey:", location[0]);

    if (v7)
    {
      v5 = -[AMDOptArgParser options](v12, "options");
      v4 = (id)-[NSMutableDictionary objectForKey:](v5, "objectForKey:", location[0]);
      v13 = (id)objc_msgSend(v4, "defaultValue");

    }
    else
    {
      v13 = 0;
    }
  }
  objc_storeStrong(location, 0);
  return v13;
}

- (AMDOptArgParser)initWithOptArgs:(id)a3
{
  AMDOptArgParser *v3;
  void *v4;
  id v5;
  AMDOptArgParser *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSMutableDictionary *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id obj;
  uint64_t v30;
  id v31;
  int v32;
  id v33;
  id v34;
  id v35;
  _QWORD __b[8];
  uint64_t v37;
  objc_super v38;
  id location[2];
  AMDOptArgParser *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v40;
  v40 = 0;
  v38.receiver = v3;
  v38.super_class = (Class)AMDOptArgParser;
  v40 = -[AMDOptArgParser init](&v38, sel_init);
  objc_storeStrong((id *)&v40, v40);
  v25 = objc_alloc(MEMORY[0x1E0C99E08]);
  v26 = (id)objc_msgSend(v25, "initWithCapacity:", objc_msgSend(location[0], "count") + 1);
  -[AMDOptArgParser setOptions:](v40, "setOptions:");

  v27 = objc_alloc(MEMORY[0x1E0C99E08]);
  v28 = (id)objc_msgSend(v27, "initWithCapacity:", objc_msgSend(location[0], "count") + 1);
  -[AMDOptArgParser setShortOptions:](v40, "setShortOptions:");

  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v41, 16);
  if (v30)
  {
    v22 = *(_QWORD *)__b[2];
    v23 = 0;
    v24 = v30;
    while (1)
    {
      v21 = v23;
      if (*(_QWORD *)__b[2] != v22)
        objc_enumerationMutation(obj);
      v37 = *(_QWORD *)(__b[1] + 8 * v23);
      v35 = (id)objc_msgSend(location[0], "objectForKey:", v37);
      v34 = (id)objc_msgSend(v35, "objectForKey:", CFSTR("shortName"));
      v33 = [AMDCommandLineOption alloc];
      v16 = v33;
      v14 = v37;
      v19 = (id)objc_msgSend(v35, "objectForKey:", CFSTR("defaultValue"));
      v18 = (id)objc_msgSend(v35, "objectForKey:", CFSTR("helpText"));
      v15 = v34;
      v17 = (id)objc_msgSend(v35, "objectForKey:", CFSTR("isBool"));
      v4 = (void *)objc_msgSend(v16, "initWithName:withDefaultValue:withHelpText:withShortName:andIsBoolFlag:", v14, v19, v18, v15, objc_msgSend(v17, "BOOLValue") & 1);
      v5 = v33;
      v33 = v4;

      v20 = -[AMDOptArgParser options](v40, "options");
      -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v33, v37);

      if (!v34)
        goto LABEL_9;
      v12 = -[AMDOptArgParser shortOptions](v40, "shortOptions");
      v13 = (id)-[NSMutableDictionary objectForKey:](v12, "objectForKey:", v34);

      if (!v13)
        break;
      NSLog(CFSTR("Short option %@ being reused, check opt arg spec"), v34);
      -[AMDOptArgParser setOptions:](v40, "setOptions:");
      -[AMDOptArgParser setShortOptions:](v40, "setShortOptions:", 0);
      v32 = 2;
LABEL_10:
      objc_storeStrong(&v33, 0);
      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v35, 0);
      if (v32)
        goto LABEL_14;
      ++v23;
      if (v21 + 1 >= v24)
      {
        v23 = 0;
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v41, 16);
        if (!v24)
          goto LABEL_13;
      }
    }
    v11 = -[AMDOptArgParser shortOptions](v40, "shortOptions");
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v33, v34);

LABEL_9:
    v32 = 0;
    goto LABEL_10;
  }
LABEL_13:
  v32 = 0;
LABEL_14:

  v31 = -[AMDCommandLineOption initWithName:withDefaultValue:withHelpText:withShortName:andIsBoolFlag:]([AMDCommandLineOption alloc], "initWithName:withDefaultValue:withHelpText:withShortName:andIsBoolFlag:", CFSTR("-help"), 0, CFSTR("Show help text"), CFSTR("-h"), 1);
  v10 = -[AMDOptArgParser options](v40, "options");

  if (v10)
  {
    v8 = -[AMDOptArgParser options](v40, "options");
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v31, CFSTR("-help"));

    v9 = -[AMDOptArgParser shortOptions](v40, "shortOptions");
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v31, CFSTR("-h"));

  }
  v7 = v40;
  v32 = 1;
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v40, 0);
  return v7;
}

- (id)parseArgs:(id)a3
{
  NSMutableDictionary *v3;
  id v4;
  id v5;
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  id v11;
  id v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  unint64_t v15;
  BOOL v16;
  id v17;
  id v18;
  int i;
  id v20;
  id v21;
  int v22;
  id location[2];
  AMDOptArgParser *v24;
  id v25;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[AMDOptArgParser options](v24, "options");
  v16 = v3 != 0;

  if (!v16)
  {
    v25 = 0;
    v22 = 1;
    goto LABEL_26;
  }
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; ; ++i)
  {
    v15 = i;
    if (v15 >= objc_msgSend(location[0], "count"))
      break;
    v18 = (id)objc_msgSend(location[0], "objectAtIndexedSubscript:", i);
    if ((objc_msgSend(v18, "hasPrefix:", CFSTR("-")) & 1) != 0)
    {
      v14 = -[AMDOptArgParser options](v24, "options");
      v17 = (id)-[NSMutableDictionary objectForKey:](v14, "objectForKey:", v18);

      if (!v17)
      {
        v13 = -[AMDOptArgParser shortOptions](v24, "shortOptions");
        v4 = (id)-[NSMutableDictionary objectForKey:](v13, "objectForKey:", v18);
        v5 = v17;
        v17 = v4;

      }
      if (!v17)
      {
        printf("!! Bad option: %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v18), "UTF8String"));
        v25 = 0;
        v22 = 1;
        goto LABEL_16;
      }
      if ((objc_msgSend(v17, "isBool") & 1) != 0)
      {
        v11 = v21;
        v12 = (id)objc_msgSend(v17, "name");
        objc_msgSend(v11, "setObject:forKey:", MEMORY[0x1E0C9AAB0]);

        goto LABEL_15;
      }
      v10 = ++i;
      if (v10 < objc_msgSend(location[0], "count"))
      {
        v7 = v21;
        v9 = (id)objc_msgSend(location[0], "objectAtIndexedSubscript:", i);
        v8 = (id)objc_msgSend(v17, "name");
        objc_msgSend(v7, "setObject:forKey:", v9);

LABEL_15:
        v22 = 0;
      }
      else
      {
        printf("!! Missing value for option: %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v18), "UTF8String"));
        v25 = 0;
        v22 = 1;
      }
LABEL_16:
      objc_storeStrong(&v17, 0);
      if (v22)
        goto LABEL_20;
      goto LABEL_19;
    }
    objc_msgSend(v20, "addObject:", v18);
LABEL_19:
    v22 = 0;
LABEL_20:
    objc_storeStrong(&v18, 0);
    if (v22)
      goto LABEL_25;
  }
  if (objc_msgSend(v20, "count"))
    objc_msgSend(v21, "setObject:forKey:", v20, CFSTR("arguments"));
  -[AMDOptArgParser setParsedOptArgs:](v24, "setParsedOptArgs:", v21);
  v25 = v21;
  v22 = 1;
LABEL_25:
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
LABEL_26:
  objc_storeStrong(location, 0);
  return v25;
}

- (void)showHelp
{
  id v2;
  id v3;
  id v4;
  id v5;
  char v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char isKindOfClass;
  NSMutableDictionary *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  NSMutableDictionary *obj;
  uint64_t v23;
  id v24;
  id v25;
  _QWORD __b[8];
  id v27;
  SEL v28;
  AMDOptArgParser *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v29 = self;
  v28 = a2;
  printf("\n");
  memset(__b, 0, sizeof(__b));
  obj = -[AMDOptArgParser options](v29, "options");
  v23 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
  if (v23)
  {
    v19 = *(_QWORD *)__b[2];
    v20 = 0;
    v21 = v23;
    while (1)
    {
      v18 = v20;
      if (*(_QWORD *)__b[2] != v19)
        objc_enumerationMutation(obj);
      v27 = *(id *)(__b[1] + 8 * v20);
      v17 = -[AMDOptArgParser options](v29, "options");
      v25 = (id)-[NSMutableDictionary objectForKey:](v17, "objectForKey:", v27);

      v24 = CFSTR("false");
      if ((objc_msgSend(v25, "isBool") & 1) == 0)
      {
        v15 = (id)objc_msgSend(v25, "defaultValue");
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v14 = (id)objc_msgSend(v25, "defaultValue");
          v2 = (id)objc_msgSend(v14, "stringValue");
          v3 = v24;
          v24 = v2;

        }
        else
        {
          v4 = (id)objc_msgSend(v25, "defaultValue");
          v5 = v24;
          v24 = v4;

        }
      }
      v8 = (const char *)objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
      v13 = (id)objc_msgSend(v25, "shortName");
      v9 = (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      v12 = (id)objc_msgSend(v25, "helpText");
      v10 = (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      v11 = (const char *)objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
      v6 = objc_msgSend(v25, "isBool");
      v7 = "yes";
      if ((v6 & 1) == 0)
        v7 = "no";
      printf("%s (%s)\t: %s\ndefault value\t\t: %s\nisBool\t\t\t: %s\n\n", v8, v9, v10, v11, v7);

      objc_storeStrong(&v24, 0);
      objc_storeStrong(&v25, 0);
      ++v20;
      if (v18 + 1 >= v21)
      {
        v20 = 0;
        v21 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
        if (!v21)
          break;
      }
    }
  }

  printf("End of help text\n");
}

- (NSMutableDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (NSMutableDictionary)parsedOptArgs
{
  return self->_parsedOptArgs;
}

- (void)setParsedOptArgs:(id)a3
{
  objc_storeStrong((id *)&self->_parsedOptArgs, a3);
}

- (NSMutableDictionary)shortOptions
{
  return self->_shortOptions;
}

- (void)setShortOptions:(id)a3
{
  objc_storeStrong((id *)&self->_shortOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortOptions, 0);
  objc_storeStrong((id *)&self->_parsedOptArgs, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
