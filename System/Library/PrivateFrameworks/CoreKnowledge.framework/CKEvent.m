@implementation CKEvent

- (CKEvent)initWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 metadata:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CKEvent *v15;
  CKEvent *v16;
  NSDictionary *v17;
  NSDictionary *metadata;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CKEvent;
  v15 = -[CKEvent init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_startDate, a4);
    objc_storeStrong((id *)&v16->_endDate, a5);
    if (v14)
      v17 = (NSDictionary *)v14;
    else
      v17 = (NSDictionary *)MEMORY[0x1E0C9AA70];
    metadata = v16->_metadata;
    v16->_metadata = v17;

  }
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  CKEvent *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;

  v4 = (CKEvent *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CKEvent identifier](self, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKEvent identifier](v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqualToString:", v6))
      {
        -[CKEvent startDate](self, "startDate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKEvent startDate](v4, "startDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "compare:", v8))
        {
          v9 = 0;
        }
        else
        {
          -[CKEvent endDate](self, "endDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKEvent endDate](v4, "endDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v10, "compare:", v11) == 0;

        }
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
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSDate hash](self->_startDate, "hash") ^ v3;
  return v4 ^ -[NSDate hash](self->_endDate, "hash");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CKEvent identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEvent startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEvent endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@[start=%@,end=%@]"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CKEvent identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEvent startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEvent endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEvent metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@[start=%@,end=%@,metadata=%@]"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
