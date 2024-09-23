@implementation ASDPropertyStripInfo

- (ASDPropertyStripInfo)initWithDictionary:(id)a3 resourcePath:(id)a4
{
  id v6;
  id v7;
  ASDPropertyStripInfo *v8;
  void *v9;
  uint64_t v10;
  NSString *path;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASDPropertyStripInfo;
  v8 = -[ASDPropertyStripInfo init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Path"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "stringByAppendingPathComponent:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      path = v8->_path;
      v8->_path = (NSString *)v10;

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Value"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v8->_value, v12);

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  ASDPropertyStripInfo *v6;
  ASDPropertyStripInfo *v7;
  void *v8;
  int v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  void *v17;

  v6 = (ASDPropertyStripInfo *)a3;
  if (self == v6)
  {
    v10 = 1;
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    goto LABEL_22;
  }
  v7 = v6;
  -[ASDPropertyStripInfo path](self, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || (-[ASDPropertyStripInfo path](v7, "path"), (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[ASDPropertyStripInfo path](self, "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDPropertyStripInfo path](v7, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqual:", v4))
    {
      v10 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v9 = 1;
  }
  else
  {
    v17 = 0;
    v9 = 0;
  }
  -[ASDPropertyStripInfo value](self, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 || (-[ASDPropertyStripInfo value](v7, "value"), (v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[ASDPropertyStripInfo value](self, "value", v15, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDPropertyStripInfo value](v7, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "isEqual:", v13);

    if (v11)
      goto LABEL_17;
  }
  else
  {
    v16 = 0;
    v10 = 1;
  }

LABEL_17:
  if (v9)
    goto LABEL_18;
LABEL_19:
  if (!v8)

LABEL_22:
  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[ASDPropertyStripInfo path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[ASDPropertyStripInfo value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)path
{
  return self->_path;
}

- (NSDictionary)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
