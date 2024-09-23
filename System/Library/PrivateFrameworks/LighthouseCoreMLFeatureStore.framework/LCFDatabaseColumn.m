@implementation LCFDatabaseColumn

- (id)init:(id)a3 typeDb:(id)a4
{
  id v7;
  id v8;
  LCFDatabaseColumn *v9;
  LCFDatabaseColumn *v10;
  id *p_typeDb;
  uint64_t v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)LCFDatabaseColumn;
  v9 = -[LCFDatabaseColumn init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    p_typeDb = (id *)&v10->_typeDb;
    objc_storeStrong((id *)&v10->_typeDb, a4);
    if (-[NSString isEqualToString:](v10->_typeDb, "isEqualToString:", CFSTR("TEXT")))
    {
      v12 = 1;
    }
    else if (objc_msgSend(*p_typeDb, "isEqualToString:", CFSTR("INTEGER")))
    {
      v12 = 2;
    }
    else if (objc_msgSend(*p_typeDb, "isEqualToString:", CFSTR("FLOAT")))
    {
      v12 = 3;
    }
    else
    {
      if (!-[NSString isEqualToString:](v10->_typeDb, "isEqualToString:", CFSTR("BOOL")))
      {
        v10->_type = 0;
        goto LABEL_11;
      }
      v12 = 4;
    }
    v10->_type = v12;
  }
LABEL_11:

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)typeDb
{
  return self->_typeDb;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeDb, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
