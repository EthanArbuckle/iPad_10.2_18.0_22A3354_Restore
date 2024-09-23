@implementation _MCDStackItem

+ (id)stackItemWithContainer:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copy");
  v8 = (void *)v5[2];
  v5[2] = v7;

  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "copy");
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (id)description
{
  void *v2;
  NSString *identifier;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  identifier = self->_identifier;
  _MCDStringFromIndexPath(self->_indexPath);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[%@:%@]"), identifier, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
