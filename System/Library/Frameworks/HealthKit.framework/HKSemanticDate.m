@implementation HKSemanticDate

+ (HKSemanticDate)semanticDateWithKeyPath:(id)a3 date:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithKeyPath:date:", v6, v5);

  return (HKSemanticDate *)v7;
}

- (HKSemanticDate)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKSemanticDate)initWithKeyPath:(id)a3 date:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HKSemanticDate *v10;
  uint64_t v11;
  NSString *keyPath;
  uint64_t v13;
  NSDate *date;
  void *v16;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSemanticDate.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyPath"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSemanticDate.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)HKSemanticDate;
  v10 = -[HKSemanticDate init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    keyPath = v10->_keyPath;
    v10->_keyPath = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    date = v10->_date;
    v10->_date = (NSDate *)v13;

  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKSemanticDate)initWithCoder:(id)a3
{
  id v4;
  HKSemanticDate *v5;
  uint64_t v6;
  NSString *keyPath;
  uint64_t v8;
  NSDate *date;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKSemanticDate;
  v5 = -[HKSemanticDate init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("KeyPath"));
    v6 = objc_claimAutoreleasedReturnValue();
    keyPath = v5->_keyPath;
    v5->_keyPath = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Date"));
    v8 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HKSemanticDate keyPath](self, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("KeyPath"));

  -[HKSemanticDate date](self, "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("Date"));

}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int64_t v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "date"), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    -[HKSemanticDate date](self, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "compare:", v9);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HKSemanticDate keyPath](self, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HKSemanticDate date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HKSemanticDate *v4;
  HKSemanticDate *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (HKSemanticDate *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HKSemanticDate keyPath](self, "keyPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSemanticDate keyPath](v5, "keyPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if (v8)
      {
        -[HKSemanticDate date](self, "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKSemanticDate date](v5, "date");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToDate:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end
