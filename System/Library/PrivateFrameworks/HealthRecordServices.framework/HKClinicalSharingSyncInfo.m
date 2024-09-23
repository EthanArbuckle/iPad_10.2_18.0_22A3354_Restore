@implementation HKClinicalSharingSyncInfo

- (HKClinicalSharingSyncInfo)initWithStartDate:(id)a3 accountIdentifiers:(id)a4
{
  id v6;
  id v7;
  HKClinicalSharingSyncInfo *v8;
  uint64_t v9;
  NSDate *startDate;
  uint64_t v11;
  NSSet *accountIdentifiers;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKClinicalSharingSyncInfo;
  v8 = -[HKClinicalSharingSyncInfo init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    startDate = v8->_startDate;
    v8->_startDate = (NSDate *)v9;

    v11 = objc_msgSend(v7, "copy");
    accountIdentifiers = v8->_accountIdentifiers;
    v8->_accountIdentifiers = (NSSet *)v11;

  }
  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSDate hash](self->_startDate, "hash");
  return -[NSSet hash](self->_accountIdentifiers, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  HKClinicalSharingSyncInfo *v4;
  HKClinicalSharingSyncInfo *v5;
  HKClinicalSharingSyncInfo *v6;
  BOOL v7;

  v4 = (HKClinicalSharingSyncInfo *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    v7 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NSDate isEqualToDate:](self->_startDate, "isEqualToDate:", v6->_startDate)
      && -[NSSet isEqualToSet:](self->_accountIdentifiers, "isEqualToSet:", v6->_accountIdentifiers);

  }
  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSDate *startDate;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  startDate = self->_startDate;
  -[NSSet allObjects](self->_accountIdentifiers, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p start: %@ accounts: [%@]>"), v4, self, startDate, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *startDate;
  id v5;

  startDate = self->_startDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountIdentifiers, CFSTR("accoundIdentifiers"));

}

- (HKClinicalSharingSyncInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  HKClinicalSharingSyncInfo *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDBCF20]);
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("accoundIdentifiers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      self = -[HKClinicalSharingSyncInfo initWithStartDate:accountIdentifiers:](self, "initWithStartDate:accountIdentifiers:", v5, v9);
      v10 = self;
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      v10 = 0;
    }

  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v10 = 0;
  }

  return v10;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSSet)accountIdentifiers
{
  return self->_accountIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifiers, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
