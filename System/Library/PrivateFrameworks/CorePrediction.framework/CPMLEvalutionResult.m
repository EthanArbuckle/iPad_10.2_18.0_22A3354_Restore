@implementation CPMLEvalutionResult

- (id)init:(id)a3 withConfigurationList:(id)a4
{
  id v6;
  CPMLEvalutionResult *v7;
  CPMLEvalutionResult *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPMLEvalutionResult;
  v7 = -[CPMLEvalutionResult init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->object, a3);
    v8->count = -[NSObject count](v8->object, "count");
  }

  return v8;
}

- (id)getString
{
  void *v2;
  void *v3;
  __CFString *v4;

  if (self->count)
  {
    -[NSObject objectAtIndexedSubscript:](self->object, "objectAtIndexedSubscript:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "allKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = CFSTR("CPMLER: Empty Result String");
  }
  return v4;
}

- (id)getStringList
{
  id v3;
  NSObject *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v4 = self->object;
  if (-[NSObject count](v4, "count"))
  {
    v5 = 0;
    do
    {
      -[NSObject objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "allKeys");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "appendString:", v8);
      objc_msgSend(v3, "appendString:", CFSTR("\n"));

      ++v5;
    }
    while (v5 < -[NSObject count](v4, "count"));
  }

  return v3;
}

- (double)getDouble
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  if (self->count != 1)
    return -999.999;
  -[NSObject objectAtIndexedSubscript:](self->object, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (int)getInt
{
  void *v2;
  void *v3;
  void *v4;

  if (self->count != 1)
    return 999;
  -[NSObject objectAtIndexedSubscript:](self->object, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = objc_msgSend(v4, "intValue");
  return (int)v3;
}

- (id)getList
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  if (-[NSObject count](self->object, "count"))
  {
    v4 = 0;
    do
    {
      -[NSObject objectAtIndexedSubscript:](self->object, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allKeys");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "addObject:", v7);
      ++v4;
    }
    while (v4 < -[NSObject count](self->object, "count"));
  }
  return v3;
}

- (id)getListDict
{
  NSObject *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self->object;
  else
    v3 = 0;
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->object, 0);
}

@end
