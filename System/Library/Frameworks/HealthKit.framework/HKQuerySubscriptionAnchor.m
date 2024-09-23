@implementation HKQuerySubscriptionAnchor

- (HKQuerySubscriptionAnchor)initWithDataAnchor:(id)a3 associationAnchor:(id)a4
{
  id v6;
  id v7;
  HKQuerySubscriptionAnchor *v8;
  uint64_t v9;
  NSNumber *dataAnchor;
  uint64_t v11;
  NSNumber *associationAnchor;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKQuerySubscriptionAnchor;
  v8 = -[HKQuerySubscriptionAnchor init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    dataAnchor = v8->_dataAnchor;
    v8->_dataAnchor = (NSNumber *)v9;

    v11 = objc_msgSend(v7, "copy");
    associationAnchor = v8->_associationAnchor;
    v8->_associationAnchor = (NSNumber *)v11;

  }
  return v8;
}

- (void)updateDataAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_dataAnchor, a3);
}

- (void)updateAssociationAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_associationAnchor, a3);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p DataAnchor=%@, AssociationAnchor=%@>"), v5, self, self->_dataAnchor, self->_associationAnchor);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKQuerySubscriptionAnchor *v6;
  HKQuerySubscriptionAnchor *v7;
  NSNumber *dataAnchor;
  NSNumber *v9;
  uint64_t v10;
  NSNumber *v11;
  char v12;
  NSNumber *associationAnchor;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSNumber *v18;
  void *v19;

  v6 = (HKQuerySubscriptionAnchor *)a3;
  if (self == v6)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      dataAnchor = self->_dataAnchor;
      -[HKQuerySubscriptionAnchor dataAnchor](v7, "dataAnchor");
      v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      if (dataAnchor == v9)
        goto LABEL_9;
      -[HKQuerySubscriptionAnchor dataAnchor](v7, "dataAnchor");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v12 = 0;
LABEL_17:

        goto LABEL_18;
      }
      v3 = (void *)v10;
      v11 = self->_dataAnchor;
      -[HKQuerySubscriptionAnchor dataAnchor](v7, "dataAnchor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSNumber isEqual:](v11, "isEqual:", v4))
      {
LABEL_9:
        associationAnchor = self->_associationAnchor;
        -[HKQuerySubscriptionAnchor associationAnchor](v7, "associationAnchor");
        v14 = objc_claimAutoreleasedReturnValue();
        if (associationAnchor == (NSNumber *)v14)
        {

          v12 = 1;
        }
        else
        {
          v15 = (void *)v14;
          -[HKQuerySubscriptionAnchor associationAnchor](v7, "associationAnchor");
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = (void *)v16;
            v18 = self->_associationAnchor;
            -[HKQuerySubscriptionAnchor associationAnchor](v7, "associationAnchor");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = -[NSNumber isEqual:](v18, "isEqual:", v19);

          }
          else
          {

            v12 = 0;
          }
        }
        if (dataAnchor == v9)
          goto LABEL_17;
      }
      else
      {
        v12 = 0;
      }

      goto LABEL_17;
    }
    v12 = 0;
  }
LABEL_18:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *dataAnchor;
  id v5;

  dataAnchor = self->_dataAnchor;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dataAnchor, CFSTR("DataAnchor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associationAnchor, CFSTR("AssociationAnchor"));

}

- (HKQuerySubscriptionAnchor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HKQuerySubscriptionAnchor *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DataAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AssociationAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HKQuerySubscriptionAnchor initWithDataAnchor:associationAnchor:](self, "initWithDataAnchor:associationAnchor:", v5, v6);
  return v7;
}

- (NSNumber)dataAnchor
{
  return self->_dataAnchor;
}

- (NSNumber)associationAnchor
{
  return self->_associationAnchor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associationAnchor, 0);
  objc_storeStrong((id *)&self->_dataAnchor, 0);
}

@end
