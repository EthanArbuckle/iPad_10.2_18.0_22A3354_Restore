@implementation MXSourceXPCPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MXSourceXPCPayload)initWithSourceID:(int64_t)a3 withDateStamp:(id)a4 andMetrics:(id)a5
{
  id v9;
  id v10;
  MXSourceXPCPayload *v11;
  MXSourceXPCPayload *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MXSourceXPCPayload;
  v11 = -[MXSourceXPCPayload init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_sourceID = a3;
    objc_storeStrong((id *)&v11->_datestamp, a4);
    objc_storeStrong((id *)&v12->_metrics, a5);
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t sourceID;
  id v5;

  sourceID = self->_sourceID;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", sourceID, CFSTR("sourceID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_datestamp, CFSTR("dateStamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metrics, CFSTR("metrics"));

}

- (MXSourceXPCPayload)initWithCoder:(id)a3
{
  id v4;
  MXSourceXPCPayload *v5;
  uint64_t v6;
  NSDate *datestamp;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSDictionary *metrics;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MXSourceXPCPayload;
  v5 = -[MXSourceXPCPayload init](&v19, sel_init);
  if (v5)
  {
    v5->_sourceID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sourceID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateStamp"));
    v6 = objc_claimAutoreleasedReturnValue();
    datestamp = v5->_datestamp;
    v5->_datestamp = (NSDate *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("metrics"));
    v16 = objc_claimAutoreleasedReturnValue();
    metrics = v5->_metrics;
    v5->_metrics = (NSDictionary *)v16;

  }
  return v5;
}

- (int64_t)sourceID
{
  return self->_sourceID;
}

- (void)setSourceID:(int64_t)a3
{
  self->_sourceID = a3;
}

- (NSDate)datestamp
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDatestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDictionary)metrics
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_datestamp, 0);
}

@end
