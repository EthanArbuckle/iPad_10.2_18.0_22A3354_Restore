@implementation LiveFSItemPair

+ (id)newWithParent:(id)a3 fname:(id)a4
{
  id v5;
  id v6;
  LiveFSItemPair *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[LiveFSItemPair initWithParent:fname:caseSensitivity:]([LiveFSItemPair alloc], "initWithParent:fname:caseSensitivity:", v6, v5, 1);

  return v7;
}

+ (id)newWithParent:(id)a3 fname:(id)a4 caseSensitivity:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  LiveFSItemPair *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[LiveFSItemPair initWithParent:fname:caseSensitivity:]([LiveFSItemPair alloc], "initWithParent:fname:caseSensitivity:", v8, v7, v5);

  return v9;
}

- (LiveFSItemPair)initWithParent:(id)a3 fname:(id)a4 caseSensitivity:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  NSString *v11;
  NSString *filename;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  objc_storeStrong((id *)&self->_itemId, a3);
  if (v5)
  {
    v11 = (NSString *)v10;
  }
  else
  {
    objc_msgSend(v10, "lowercaseString");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  filename = self->_filename;
  self->_filename = v11;

  return self;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_itemId, "hash");
  return -[NSString hash](self->_filename, "hash") - v3 + (v3 << 7);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *itemId;
  void *v6;
  NSString *filename;
  void *v8;
  BOOL v9;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    itemId = self->_itemId;
    objc_msgSend(v4, "itemId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](itemId, "isEqualToString:", v6))
    {
      filename = self->_filename;
      objc_msgSend(v4, "filename");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NSString isEqualToString:](filename, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)itemId
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)filename
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_itemId, 0);
}

@end
