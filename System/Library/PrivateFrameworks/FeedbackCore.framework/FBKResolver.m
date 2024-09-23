@implementation FBKResolver

+ (id)resolverForQuestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "targetUserAgent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(CFSTR(":FBA"), "isEqualToString:", v5))
    goto LABEL_7;
  objc_msgSend(v4, "userAgentPopulate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v9 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "userAgentPopulate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "resolverForName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && (unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 1, objc_msgSend(v5, "count") - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectsAtIndexes:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setArguments:", v11);

    }
  }
  else
  {
LABEL_7:
    v9 = 0;
  }

LABEL_9:
  return v9;
}

+ (id)resolverForName:(id)a3 arguments:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "resolverForName:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setArguments:", v8);
  return v7;
}

+ (id)resolverForName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  id v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[FBKResolverCurrentBuild name](FBKResolverCurrentBuild, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v11[0] = objc_opt_class();
  +[FBKResolverModelName name](FBKResolverModelName, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  v11[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v3);
  v7 = (objc_class *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(v7);
  return v8;
}

- (void)setArguments:(id)a3
{
  objc_storeStrong((id *)&self->_arguments, a3);
}

+ (id)name
{
  return 0;
}

- (int64_t)expectedArguments
{
  return -1;
}

- (id)run
{
  return 0;
}

- (NSArray)arguments
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arguments, 0);
}

@end
