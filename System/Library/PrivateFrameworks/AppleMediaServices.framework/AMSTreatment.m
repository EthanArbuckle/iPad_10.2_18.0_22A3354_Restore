@implementation AMSTreatment

- (NSDate)startDate
{
  return self->_startDate;
}

- (AMSTreatment)initWithEndDate:(id)a3 identifier:(id)a4 startDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  AMSTreatment *v12;
  AMSTreatment *v13;
  uint64_t v14;
  NSString *identifier;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AMSTreatment;
  v12 = -[AMSTreatment init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_endDate, a3);
    v14 = objc_msgSend(v10, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    objc_storeStrong((id *)&v13->_startDate, a5);
  }

  return v13;
}

- (AMSTreatment)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  AMSTreatment *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AMSTreatment initWithEndDate:identifier:startDate:](self, "initWithEndDate:identifier:startDate:", v5, v6, v7);
  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AMSTreatment endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("endDate"));

  -[AMSTreatment identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

  -[AMSTreatment startDate](self, "startDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("startDate"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AMSTreatment identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  AMSTreatment *v4;
  AMSTreatment *v5;
  AMSTreatment *v6;
  AMSTreatment *v7;
  void *v8;
  char v9;

  v4 = (AMSTreatment *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;

      if (!v7)
      {
        v9 = 0;
        goto LABEL_9;
      }
      -[AMSTreatment identifier](self, "identifier");
      v6 = (AMSTreatment *)objc_claimAutoreleasedReturnValue();
      -[AMSTreatment identifier](v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[AMSTreatment isEqualToString:](v6, "isEqualToString:", v8);

    }
    else
    {
      v7 = 0;
      v9 = 0;
    }

LABEL_9:
    goto LABEL_10;
  }
  v9 = 1;
LABEL_10:

  return v9;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("endDate");
  -[AMSTreatment endDate](self, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("identifier");
  -[AMSTreatment identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("startDate");
  -[AMSTreatment startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

@end
