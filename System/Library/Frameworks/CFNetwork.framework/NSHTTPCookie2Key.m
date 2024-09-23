@implementation NSHTTPCookie2Key

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  NSString *name;
  id Property;
  const char *v9;
  NSString *path;
  id v11;
  const char *v12;
  NSString *domain;
  id v14;
  const char *v15;
  NSString *partition;
  NSString *v17;
  const char *v18;
  NSString *v19;
  id v20;
  char v21;

  v4 = a3;
  v6 = v4;
  name = self->_name;
  if (v4)
    Property = objc_getProperty(v4, v5, 8, 1);
  else
    Property = 0;
  if (-[NSString isEqualToString:](name, "isEqualToString:", Property))
  {
    path = self->_path;
    v11 = v6 ? objc_getProperty(v6, v9, 24, 1) : 0;
    if (-[NSString isEqualToString:](path, "isEqualToString:", v11))
    {
      domain = self->_domain;
      v14 = v6 ? objc_getProperty(v6, v12, 16, 1) : 0;
      if (-[NSString isEqualToString:](domain, "isEqualToString:", v14))
      {
        partition = self->_partition;
        if (v6)
        {
          v17 = (NSString *)objc_getProperty(v6, v15, 32, 1);
          if (partition == v17)
          {
            v21 = 1;
            v19 = partition;
            goto LABEL_17;
          }
          v19 = v17;
          partition = self->_partition;
          v20 = objc_getProperty(v6, v18, 32, 1);
        }
        else
        {
          v19 = 0;
          if (!partition)
          {
            v21 = 1;
            goto LABEL_17;
          }
          v20 = 0;
        }
        v21 = -[NSString isEqualToString:](partition, "isEqualToString:", v20);
LABEL_17:

        goto LABEL_15;
      }
    }
  }
  v21 = 0;
LABEL_15:

  return v21;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_partition, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_path, "hash") - v4 + 32 * v4;
  return -[NSString hash](self->_domain, "hash") - v5 + 32 * v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partition, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (_QWORD)initWithHTTPCookie2:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v3 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)NSHTTPCookie2Key;
    a1 = objc_msgSendSuper2(&v13, sel_init);
    if (a1)
    {
      objc_msgSend(v3, "name");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)a1[1];
      a1[1] = v4;

      objc_msgSend(v3, "partition");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)a1[4];
      a1[4] = v6;

      objc_msgSend(v3, "path");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)a1[3];
      a1[3] = v8;

      objc_msgSend(v3, "domain");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)a1[2];
      a1[2] = v10;

    }
  }

  return a1;
}

@end
