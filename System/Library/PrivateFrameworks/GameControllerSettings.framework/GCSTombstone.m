@implementation GCSTombstone

+ (double)timeToLiveSeconds
{
  return 2592000.0;
}

- (GCSTombstone)initWithIdentifier:(id)a3 creationDate:(id)a4 recordType:(int64_t)a5
{
  id v9;
  id v10;
  GCSTombstone *v11;
  GCSTombstone *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GCSTombstone;
  v11 = -[GCSTombstone init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_creationDate, a4);
    v12->_recordType = a5;
  }

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (int64_t)recordType
{
  return self->_recordType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)archivalClasses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  return +[NSSet setWithObjects:](&off_254DF4B10, "setWithObjects:", v2, v3, v4, v5, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCSTombstone)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  GCSTombstone *v7;

  v4 = a3;
  +[GCSTombstone archivalClasses](GCSTombstone, "archivalClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("_jsonObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[GCSTombstone initWithJSONObject:](self, "initWithJSONObject:", v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GCSTombstone jsonObject](self, "jsonObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_jsonObject"));

}

- (GCSTombstone)initWithJSONObject:(id)a3
{
  id v4;
  id v5;
  GCSTombstone *v6;
  uint64_t v7;
  NSString *identifier;
  uint64_t v9;
  NSDate *creationDate;
  void *v11;
  GCSTombstone *v12;
  objc_super v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v14.receiver = self;
    v14.super_class = (Class)GCSTombstone;
    v6 = -[GCSTombstone init](&v14, sel_init);
    if (v6)
    {
      objc_msgSend(v5, "_gcs_stringForJSONKey:", CFSTR("identifier"));
      v7 = objc_claimAutoreleasedReturnValue();
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v7;

      objc_msgSend(v5, "_gcs_dateForJSONKey:", CFSTR("creationDate"));
      v9 = objc_claimAutoreleasedReturnValue();
      creationDate = v6->_creationDate;
      v6->_creationDate = (NSDate *)v9;

      objc_msgSend(v5, "_gcs_numberForJSONKey:", CFSTR("recordType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_recordType = objc_msgSend(v11, "longValue");

    }
    self = v6;

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (GCSJSONObject)jsonObject
{
  NSDate *creationDate;
  NSString *identifier;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  identifier = self->_identifier;
  creationDate = self->_creationDate;
  v10[0] = identifier;
  v9[0] = CFSTR("identifier");
  v9[1] = CFSTR("creationDate");
  -[NSDate jsonObject](creationDate, "jsonObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  v9[2] = CFSTR("recordType");
  +[NSNumber numberWithInteger:](&off_254DF4058, "numberWithInteger:", self->_recordType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DF3850, "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (GCSJSONObject *)v7;
}

@end
