@implementation BMSQLRow

- (BMSQLRow)initWithValues:(id)a3
{
  id v4;
  BMSQLRow *v5;
  uint64_t v6;
  NSMutableArray *allValues;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMSQLRow;
  v5 = -[BMSQLRow init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    allValues = v5->_allValues;
    v5->_allValues = (NSMutableArray *)v6;

  }
  return v5;
}

- (id)valueAtIdx:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[BMSQLRow allValues](self, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)columnCount
{
  void *v2;
  int64_t v3;

  -[BMSQLRow allValues](self, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)values
{
  void *v2;
  void *v3;

  -[BMSQLRow allValues](self, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;

  -[BMSQLRow values](self, "values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "values");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMSQLRow values](self, "values");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSMutableArray hash](self->_allValues, "hash");
}

- (NSMutableArray)allValues
{
  return self->_allValues;
}

- (void)setAllValues:(id)a3
{
  objc_storeStrong((id *)&self->_allValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allValues, 0);
}

@end
