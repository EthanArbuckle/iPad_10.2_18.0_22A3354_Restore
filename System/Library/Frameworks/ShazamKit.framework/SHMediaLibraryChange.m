@implementation SHMediaLibraryChange

- (SHMediaLibraryChange)initWithLibraryItem:(id)a3 changeType:(int64_t)a4
{
  return (SHMediaLibraryChange *)-[SHMediaLibraryChange _initWithLibraryItem:changeType:indexPath:](self, "_initWithLibraryItem:changeType:indexPath:", a3, a4, 0);
}

- (id)_initWithLibraryItem:(id)a3 changeType:(int64_t)a4 indexPath:(id)a5
{
  id v9;
  id v10;
  SHMediaLibraryChange *v11;
  SHMediaLibraryChange *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SHMediaLibraryChange;
  v11 = -[SHMediaLibraryChange init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_libraryItem, a3);
    v12->_changeType = a4;
    objc_storeStrong((id *)&v12->_indexPath, a5);
  }

  return v12;
}

- (BOOL)isConflictingChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int64_t v12;
  uint64_t v13;
  BOOL v14;

  v4 = a3;
  -[SHMediaLibraryChange libraryItem](self, "libraryItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    -[SHMediaLibraryChange indexPath](self, "indexPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[SHMediaLibraryChange indexPath](self, "indexPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "indexPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
      {
        v14 = 1;
        goto LABEL_11;
      }
    }
    v12 = -[SHMediaLibraryChange changeType](self, "changeType");
    if (v12 == 1)
    {
      v13 = 3;
      goto LABEL_10;
    }
    if (v12 == 3)
    {
      v13 = 1;
LABEL_10:
      v14 = objc_msgSend(v4, "changeType") == v13;
      goto LABEL_11;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (SHMediaLibraryChange)initWithCoder:(id)a3
{
  id v4;
  SHMediaLibraryChange *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  SHMediaLibraryItem *libraryItem;
  uint64_t v12;
  NSIndexPath *indexPath;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SHMediaLibraryChange;
  v5 = -[SHMediaLibraryChange init](&v15, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x219A21784]();
    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("SHLibraryChangeCodingLibraryItem"));
    v10 = objc_claimAutoreleasedReturnValue();
    libraryItem = v5->_libraryItem;
    v5->_libraryItem = (SHMediaLibraryItem *)v10;

    v5->_changeType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SHLibraryChangeCodingChangeType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHLibraryChangeCodingIndexPath"));
    v12 = objc_claimAutoreleasedReturnValue();
    indexPath = v5->_indexPath;
    v5->_indexPath = (NSIndexPath *)v12;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)MEMORY[0x219A21784]();
  objc_msgSend(v5, "encodeObject:forKey:", self->_libraryItem, CFSTR("SHLibraryChangeCodingLibraryItem"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_changeType, CFSTR("SHLibraryChangeCodingChangeType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_indexPath, CFSTR("SHLibraryChangeCodingIndexPath"));
  objc_autoreleasePoolPop(v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SHMediaLibraryChange *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  SHMediaLibraryChange *v11;

  v5 = +[SHMediaLibraryChange allocWithZone:](SHMediaLibraryChange, "allocWithZone:");
  -[SHMediaLibraryChange libraryItem](self, "libraryItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  v8 = -[SHMediaLibraryChange changeType](self, "changeType");
  -[SHMediaLibraryChange indexPath](self, "indexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copyWithZone:", a3);
  v11 = -[SHMediaLibraryChange initWithLibraryItem:changeType:indexPath:](v5, "initWithLibraryItem:changeType:indexPath:", v7, v8, v10);

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;

  -[SHMediaLibraryChange indexPath](self, "indexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHMediaLibraryChange libraryItem](self, "libraryItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = -[SHMediaLibraryChange changeType](self, "changeType") ^ v6;
  if (v3)
  {
    -[SHMediaLibraryChange indexPath](self, "indexPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 ^= objc_msgSend(v8, "hash");

  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  SHMediaLibraryChange *v4;
  BOOL v5;

  v4 = (SHMediaLibraryChange *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[SHMediaLibraryChange isEqualChange:](self, "isEqualChange:", v4);
  }

  return v5;
}

- (BOOL)isEqualChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int64_t v9;
  void *v10;
  void *v11;
  char v12;
  int64_t v13;

  v4 = a3;
  -[SHMediaLibraryChange indexPath](self, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHMediaLibraryChange libraryItem](self, "libraryItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);
  if (!v5)
  {
    if (v8)
    {
      v13 = -[SHMediaLibraryChange changeType](self, "changeType");
      v12 = v13 == objc_msgSend(v4, "changeType");
      goto LABEL_8;
    }
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  if (!v8)
    goto LABEL_7;
  v9 = -[SHMediaLibraryChange changeType](self, "changeType");
  if (v9 != objc_msgSend(v4, "changeType"))
    goto LABEL_7;
  -[SHMediaLibraryChange indexPath](self, "indexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

LABEL_8:
  return v12;
}

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[SHMediaLibraryChange changeType](self, "changeType");
  -[SHMediaLibraryChange libraryItem](self, "libraryItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHMediaLibraryChange indexPath](self, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%lu) %@ at index %@"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (SHMediaLibraryItem)libraryItem
{
  return self->_libraryItem;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_libraryItem, 0);
}

@end
