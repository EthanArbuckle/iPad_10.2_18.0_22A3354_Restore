@implementation ICLBundlePersonaRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLBundlePersonaRecord)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICLBundlePersonaRecord;
  return -[ICLBundlePersonaRecord init](&v3, sel_init);
}

- (ICLBundlePersonaRecord)initWithCoder:(id)a3
{
  id v4;
  ICLBundlePersonaRecord *v5;
  uint64_t v6;
  NSURL *dataContainerURL;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *groupContainerURLs;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSDictionary *environmentVariables;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICLBundlePersonaRecord;
  v5 = -[ICLBundlePersonaRecord init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataContainerURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    dataContainerURL = v5->_dataContainerURL;
    v5->_dataContainerURL = (NSURL *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("groupContainerURLs"));
    v12 = objc_claimAutoreleasedReturnValue();
    groupContainerURLs = v5->_groupContainerURLs;
    v5->_groupContainerURLs = (NSDictionary *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("environmentVariables"));
    v17 = objc_claimAutoreleasedReturnValue();
    environmentVariables = v5->_environmentVariables;
    v5->_environmentVariables = (NSDictionary *)v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ICLBundlePersonaRecord dataContainerURL](self, "dataContainerURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dataContainerURL"));

  -[ICLBundlePersonaRecord groupContainerURLs](self, "groupContainerURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("groupContainerURLs"));

  -[ICLBundlePersonaRecord environmentVariables](self, "environmentVariables");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("environmentVariables"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[ICLBundlePersonaRecord dataContainerURL](self, "dataContainerURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setDataContainerURL:", v7);

  -[ICLBundlePersonaRecord groupContainerURLs](self, "groupContainerURLs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setGroupContainerURLs:", v9);

  -[ICLBundlePersonaRecord environmentVariables](self, "environmentVariables");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setEnvironmentVariables:", v11);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  ICLBundlePersonaRecord *v4;
  ICLBundlePersonaRecord *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  BOOL v14;
  BOOL v15;

  v4 = (ICLBundlePersonaRecord *)a3;
  if (v4 == self)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[ICLBundlePersonaRecord dataContainerURL](self, "dataContainerURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLBundlePersonaRecord dataContainerURL](v5, "dataContainerURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MICompareObjects(v6, v7);

      if (v8)
      {
        -[ICLBundlePersonaRecord groupContainerURLs](self, "groupContainerURLs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICLBundlePersonaRecord groupContainerURLs](v5, "groupContainerURLs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = MICompareObjects(v9, v10);

        if (v11)
        {
          -[ICLBundlePersonaRecord environmentVariables](self, "environmentVariables");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICLBundlePersonaRecord environmentVariables](v5, "environmentVariables");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = MICompareObjects(v12, v13);

          if (v14)
          {
            v15 = 1;
LABEL_19:

            goto LABEL_20;
          }
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
LABEL_18:
            v15 = 0;
            goto LABEL_19;
          }
        }
        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          goto LABEL_18;
        }
      }
      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
        goto LABEL_18;
      }
      MOLogWrite();
      goto LABEL_18;
    }
    v15 = 0;
  }
LABEL_20:

  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[ICLBundlePersonaRecord dataContainerURL](self, "dataContainerURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[ICLBundlePersonaRecord groupContainerURLs](self, "groupContainerURLs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[ICLBundlePersonaRecord environmentVariables](self, "environmentVariables");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLBundlePersonaRecord dataContainerURL](self, "dataContainerURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLBundlePersonaRecord groupContainerURLs](self, "groupContainerURLs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLBundlePersonaRecord environmentVariables](self, "environmentVariables");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: dataContainerURL: %@ groupContainerURLs: %@ environmentVariables: %@>"), v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSURL)dataContainerURL
{
  return self->_dataContainerURL;
}

- (void)setDataContainerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)groupContainerURLs
{
  return self->_groupContainerURLs;
}

- (void)setGroupContainerURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)environmentVariables
{
  return self->_environmentVariables;
}

- (void)setEnvironmentVariables:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentVariables, 0);
  objc_storeStrong((id *)&self->_groupContainerURLs, 0);
  objc_storeStrong((id *)&self->_dataContainerURL, 0);
}

@end
