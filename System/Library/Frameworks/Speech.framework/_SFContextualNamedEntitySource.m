@implementation _SFContextualNamedEntitySource

- (_SFContextualNamedEntitySource)initWithSourceApplications:(id)a3 fromDate:(id)a4 toDate:(id)a5 limit:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  _SFContextualNamedEntitySource *v13;
  uint64_t v14;
  NSArray *sourceApplications;
  uint64_t v16;
  NSDate *fromDate;
  uint64_t v18;
  NSDate *toDate;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_SFContextualNamedEntitySource;
  v13 = -[_SFContextualNamedEntitySource init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    sourceApplications = v13->_sourceApplications;
    v13->_sourceApplications = (NSArray *)v14;

    v16 = objc_msgSend(v11, "copy");
    fromDate = v13->_fromDate;
    v13->_fromDate = (NSDate *)v16;

    v18 = objc_msgSend(v12, "copy");
    toDate = v13->_toDate;
    v13->_toDate = (NSDate *)v18;

    v13->_limit = a6;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *sourceApplications;
  id v5;

  sourceApplications = self->_sourceApplications;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sourceApplications, CFSTR("_sourceApplications"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fromDate, CFSTR("_fromDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_toDate, CFSTR("_toDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_limit, CFSTR("_limit"));

}

- (_SFContextualNamedEntitySource)initWithCoder:(id)a3
{
  id v4;
  _SFContextualNamedEntitySource *v5;
  uint64_t v6;
  NSArray *sourceApplications;
  uint64_t v8;
  NSDate *fromDate;
  uint64_t v10;
  NSDate *toDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFContextualNamedEntitySource;
  v5 = -[_SFContextualNamedEntitySource init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_sourceApplications"));
    v6 = objc_claimAutoreleasedReturnValue();
    sourceApplications = v5->_sourceApplications;
    v5->_sourceApplications = (NSArray *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fromDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    fromDate = v5->_fromDate;
    v5->_fromDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_toDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    toDate = v5->_toDate;
    v5->_toDate = (NSDate *)v10;

    v5->_limit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_limit"));
  }

  return v5;
}

- (NSArray)sourceApplications
{
  return self->_sourceApplications;
}

- (NSDate)fromDate
{
  return self->_fromDate;
}

- (NSDate)toDate
{
  return self->_toDate;
}

- (int64_t)limit
{
  return self->_limit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toDate, 0);
  objc_storeStrong((id *)&self->_fromDate, 0);
  objc_storeStrong((id *)&self->_sourceApplications, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
