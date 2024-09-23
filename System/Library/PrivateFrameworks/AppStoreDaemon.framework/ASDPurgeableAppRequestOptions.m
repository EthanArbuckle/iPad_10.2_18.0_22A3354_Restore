@implementation ASDPurgeableAppRequestOptions

- (ASDPurgeableAppRequestOptions)initWithVolume:(id)a3 urgency:(int64_t)a4
{
  id v7;
  ASDPurgeableAppRequestOptions *v8;
  ASDPurgeableAppRequestOptions *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDPurgeableAppRequestOptions;
  v8 = -[ASDPurgeableAppRequestOptions init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_volume, a3);
    v9->_urgency = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDPurgeableAppRequestOptions *v5;
  uint64_t v6;
  NSString *volume;

  v5 = -[ASDPurgeableAppRequestOptions init](+[ASDPurgeableAppRequestOptions allocWithZone:](ASDPurgeableAppRequestOptions, "allocWithZone:"), "init");
  v5->_performAvailablityCheck = self->_performAvailablityCheck;
  v5->_skipLaunchCheck = self->_skipLaunchCheck;
  v5->_urgency = self->_urgency;
  v6 = -[NSString copyWithZone:](self->_volume, "copyWithZone:", a3);
  volume = v5->_volume;
  v5->_volume = (NSString *)v6;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDPurgeableAppRequestOptions)initWithCoder:(id)a3
{
  id v4;
  ASDPurgeableAppRequestOptions *v5;
  uint64_t v6;
  NSString *volume;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDPurgeableAppRequestOptions;
  v5 = -[ASDRequestOptions initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_performAvailablityCheck = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("performAvailablityCheck"));
    v5->_skipLaunchCheck = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("skipLaunchCheck"));
    v5->_urgency = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("urgency"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("volume"));
    v6 = objc_claimAutoreleasedReturnValue();
    volume = v5->_volume;
    v5->_volume = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[ASDPurgeableAppRequestOptions performAvailablityCheck](self, "performAvailablityCheck"), CFSTR("performAvailablityCheck"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ASDPurgeableAppRequestOptions skipLaunchCheck](self, "skipLaunchCheck"), CFSTR("skipLaunchCheck"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[ASDPurgeableAppRequestOptions urgency](self, "urgency"), CFSTR("urgency"));
  -[ASDPurgeableAppRequestOptions volume](self, "volume");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("volume"));

  v6.receiver = self;
  v6.super_class = (Class)ASDPurgeableAppRequestOptions;
  -[ASDRequestOptions encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);

}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[ASDPurgeableAppRequestOptions urgency](self, "urgency");
  -[ASDPurgeableAppRequestOptions volume](self, "volume");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {urgency = %ld, volume = %@ skip launch check = %d, perform availability check = %d}"), v4, v5, v6, -[ASDPurgeableAppRequestOptions skipLaunchCheck](self, "skipLaunchCheck"), -[ASDPurgeableAppRequestOptions performAvailablityCheck](self, "performAvailablityCheck"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)performAvailablityCheck
{
  return self->_performAvailablityCheck;
}

- (void)setPerformAvailablityCheck:(BOOL)a3
{
  self->_performAvailablityCheck = a3;
}

- (BOOL)skipLaunchCheck
{
  return self->_skipLaunchCheck;
}

- (void)setSkipLaunchCheck:(BOOL)a3
{
  self->_skipLaunchCheck = a3;
}

- (int64_t)urgency
{
  return self->_urgency;
}

- (void)setUrgency:(int64_t)a3
{
  self->_urgency = a3;
}

- (NSString)volume
{
  return self->_volume;
}

- (void)setVolume:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volume, 0);
}

@end
