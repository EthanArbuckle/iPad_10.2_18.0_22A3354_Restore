@implementation APSSignDataWithIdentityRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *data;
  id v5;

  data = self->_data;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", data, CFSTR("dataKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_time, CFSTR("timeKey"));

}

- (APSSignDataWithIdentityRequest)initWithCoder:(id)a3
{
  id v4;
  APSSignDataWithIdentityRequest *v5;
  uint64_t v6;
  NSData *data;
  uint64_t v8;
  NSNumber *time;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APSSignDataWithIdentityRequest;
  v5 = -[APSSignDataWithIdentityRequest init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    time = v5->_time;
    v5->_time = (NSNumber *)v8;

  }
  return v5;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSNumber)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
