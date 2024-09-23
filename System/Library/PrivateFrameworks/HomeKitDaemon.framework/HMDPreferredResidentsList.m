@implementation HMDPreferredResidentsList

- (HMDPreferredResidentsList)initWithResidentIDSIdentifiers:(id)a3 modifiedTimestamp:(id)a4
{
  id v6;
  id v7;
  HMDPreferredResidentsList *v8;
  uint64_t v9;
  NSArray *residentIDSIdentifiers;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDPreferredResidentsList;
  v8 = -[HMDPreferredResidentsList init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    residentIDSIdentifiers = v8->_residentIDSIdentifiers;
    v8->_residentIDSIdentifiers = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_modifiedTimestamp, a4);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDPreferredResidentsList residentIDSIdentifiers](self, "residentIDSIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "residentIDSIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToArray:", v8))
    {
      -[HMDPreferredResidentsList modifiedTimestamp](self, "modifiedTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "modifiedTimestamp");
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

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDPreferredResidentsList residentIDSIdentifiers](self, "residentIDSIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[HMDPreferredResidentsList residentIDSIdentifiers](self, "residentIDSIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[HMDPreferredResidentsList residentIDSIdentifiers](self, "residentIDSIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 >= 3)
    v7 = 3;
  else
    v7 = v4;
  objc_msgSend(v5, "subarrayWithRange:", 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDD17C8];
  -[HMDPreferredResidentsList modifiedTimestamp](self, "modifiedTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localTimeDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("modifiedTimestamp %@ residentIDSIdentifiers (%lu) %@"), v11, v4, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSArray)residentIDSIdentifiers
{
  return self->_residentIDSIdentifiers;
}

- (NSDate)modifiedTimestamp
{
  return self->_modifiedTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedTimestamp, 0);
  objc_storeStrong((id *)&self->_residentIDSIdentifiers, 0);
}

@end
