@implementation EMReadLater

- (EMReadLater)initWithDate:(id)a3
{
  id v5;
  EMReadLater *v6;
  EMReadLater *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMReadLater;
  v6 = -[EMReadLater init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_date, a3);

  return v7;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[EMReadLater date](self, "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isActive
{
  void *v2;
  char v3;

  -[EMReadLater date](self, "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ef_isEarlierThanNow");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  EMReadLater *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (EMReadLater *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[EMReadLater date](self, "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMReadLater date](v4, "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = EFObjectsAreEqual();

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[EMReadLater date](self, "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)ef_publicDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[EMReadLater date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("date:%@, isActive:%d"), v4, -[EMReadLater isActive](self, "isActive"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMReadLater)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  EMReadLater *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EMReadLater initWithDate:](self, "initWithDate:", v5);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EMReadLater date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_date"));

}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
