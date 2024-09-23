@implementation FSFSchema

- (id)initSchemaForClass:(id)a3 inLanguage:(id)a4 withRepoUrl:(id)a5 pkgName:(id)a6 version:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  FSFSchema *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSDictionary *schemaData;
  id v25;
  void *v26;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)FSFSchema;
  v17 = -[FSFSchema init](&v27, sel_init);
  if (v17)
  {
    v25 = objc_alloc(MEMORY[0x24BDBCE70]);
    v26 = v13;
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18 = v14;
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v19 = v12;
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v20 = v15;
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = v16;
    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = objc_msgSend(v25, "initWithObjectsAndKeys:", v26, CFSTR("language"), v18, CFSTR("repo_url"), v19, CFSTR("class_name"), v20, CFSTR("pkg_name"), v21, CFSTR("version"), 0);
    schemaData = v17->_schemaData;
    v17->_schemaData = (NSDictionary *)v22;

    if (v16)
    {
      if (v15)
        goto LABEL_14;
    }
    else
    {

      if (v15)
      {
LABEL_14:
        if (v12)
          goto LABEL_15;
        goto LABEL_20;
      }
    }

    if (v12)
    {
LABEL_15:
      if (v14)
        goto LABEL_16;
      goto LABEL_21;
    }
LABEL_20:

    if (v14)
    {
LABEL_16:
      if (v13)
        goto LABEL_17;
LABEL_22:

      goto LABEL_17;
    }
LABEL_21:

    if (v13)
      goto LABEL_17;
    goto LABEL_22;
  }
LABEL_17:

  return v17;
}

- (NSDictionary)schemaData
{
  return self->_schemaData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schemaData, 0);
}

@end
