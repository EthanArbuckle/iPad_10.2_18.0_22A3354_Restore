@implementation MOEventFetchOptions

- (MOEventFetchOptions)initWithDateInterval:(id)a3 ascending:(BOOL)a4 limit:(id)a5
{
  return -[MOEventFetchOptions initWithDateInterval:ascending:category:limit:](self, "initWithDateInterval:ascending:category:limit:", a3, a4, 0, a5);
}

- (MOEventFetchOptions)initWithDateInterval:(id)a3 ascending:(BOOL)a4 category:(unint64_t)a5 limit:(id)a6
{
  id v11;
  id v12;
  MOEventFetchOptions *v13;
  MOEventFetchOptions *v14;
  objc_super v16;

  v11 = a3;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)MOEventFetchOptions;
  v13 = -[MOEventFetchOptions init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_ascending = a4;
    v13->_category = a5;
    objc_storeStrong((id *)&v13->_dateInterval, a3);
    objc_storeStrong((id *)&v14->_limit, a6);
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 ascending;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  ascending = self->_ascending;
  v6 = a3;
  objc_msgSend(v4, "numberWithBool:", ascending);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("ascending"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_dateInterval, CFSTR("dateInterval"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_limit, CFSTR("limit"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_category);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("category"));

}

- (MOEventFetchOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  MOEventFetchOptions *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ascending"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("limit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("category"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[MOEventFetchOptions initWithDateInterval:ascending:category:limit:](self, "initWithDateInterval:ascending:category:limit:", v7, v6, objc_msgSend(v9, "unsignedLongValue"), v8);
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  MOEventFetchOptions *v4;
  MOEventFetchOptions *v5;
  BOOL v6;

  v4 = (MOEventFetchOptions *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[MOEventFetchOptions isEqualToFetchOptions:](self, "isEqualToFetchOptions:", v5);

  return v6;
}

- (BOOL)isEqualToFetchOptions:(id)a3
{
  void *v3;
  id v5;
  int ascending;
  int v7;
  NSDateInterval *dateInterval;
  uint64_t v9;
  void *v10;
  NSDateInterval *v11;
  void *v12;
  int v13;
  void *v14;
  char v15;
  void *v16;
  NSNumber *limit;
  void *v18;
  unint64_t category;
  uint64_t v20;
  int v21;
  char v22;
  BOOL v23;

  v5 = a3;
  ascending = self->_ascending;
  v7 = objc_msgSend(v5, "ascending");
  dateInterval = self->_dateInterval;
  if (dateInterval)
    goto LABEL_2;
  objc_msgSend(v5, "dateInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v13 = 1;
    goto LABEL_11;
  }
  if (self->_dateInterval)
  {
LABEL_2:
    objc_msgSend(v5, "dateInterval");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = self->_dateInterval;
      objc_msgSend(v5, "dateInterval");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[NSDateInterval isEqualToDateInterval:](v11, "isEqualToDateInterval:", v12);

      if (dateInterval)
        goto LABEL_12;
    }
    else
    {
      v13 = 0;
      if (dateInterval)
        goto LABEL_12;
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_11:

LABEL_12:
  if (self->_limit)
  {
    objc_msgSend(v5, "limit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = 1;
    }
    else if (self->_limit)
    {
      objc_msgSend(v5, "limit");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        limit = self->_limit;
        objc_msgSend(v5, "limit");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[NSNumber isEqualToNumber:](limit, "isEqualToNumber:", v18);

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }
  category = self->_category;
  v20 = objc_msgSend(v5, "category");
  if (ascending == v7)
    v21 = v13;
  else
    v21 = 0;
  if (category == v20)
    v22 = v15;
  else
    v22 = 0;
  if (v21 == 1)
    v23 = v22;
  else
    v23 = 0;

  return v23;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ascending);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSDateInterval hash](self->_dateInterval, "hash");
  v6 = v5 ^ -[NSNumber hash](self->_limit, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_category);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self->_ascending)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  -[NSDateInterval startDate](self->_dateInterval, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](self->_dateInterval, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ascending, %@,  startDate, %@, endDate, %@, category, %lu, limit, %@"), v4, v6, v8, self->_category, self->_limit);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)limit
{
  return self->_limit;
}

- (unint64_t)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
