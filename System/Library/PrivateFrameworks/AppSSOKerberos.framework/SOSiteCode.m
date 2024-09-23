@implementation SOSiteCode

- (SOSiteCode)initWithSiteCode:(id)a3 forNetworkFingerprint:(id)a4
{
  id v7;
  id v8;
  SOSiteCode *v9;
  SOSiteCode *v10;
  uint64_t v11;
  NSDate *timeStamp;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SOSiteCode;
  v9 = -[SOSiteCode init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_code, a3);
    objc_storeStrong((id *)&v10->_networkFingerprint, a4);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = objc_claimAutoreleasedReturnValue();
    timeStamp = v10->_timeStamp;
    v10->_timeStamp = (NSDate *)v11;

  }
  return v10;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  objc_msgSend(v3, "setFormatOptions:", 1907);
  -[SOSiteCode timeStamp](self, "timeStamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD17C8];
  -[SOSiteCode networkFingerprint](self, "networkFingerprint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOSiteCode code](self, "code");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@, %@, %@"), v7, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)age
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOSiteCode timeStamp](self, "timeStamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SOSiteCode)initWithCoder:(id)a3
{
  id v4;
  SOSiteCode *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSString *code;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSDate *timeStamp;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSString *networkFingerprint;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SOSiteCode;
  v5 = -[SOSiteCode init](&v25, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_code);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "containsValueForKey:", v6);

    if (v7)
    {
      v8 = objc_opt_class();
      NSStringFromSelector(sel_code);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      code = v5->_code;
      v5->_code = (NSString *)v10;

    }
    NSStringFromSelector(sel_timeStamp);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v4, "containsValueForKey:", v12);

    if (v13)
    {
      v14 = objc_opt_class();
      NSStringFromSelector(sel_timeStamp);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
      v16 = objc_claimAutoreleasedReturnValue();
      timeStamp = v5->_timeStamp;
      v5->_timeStamp = (NSDate *)v16;

    }
    NSStringFromSelector(sel_networkFingerprint);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v4, "containsValueForKey:", v18);

    if (v19)
    {
      v20 = objc_opt_class();
      NSStringFromSelector(sel_networkFingerprint);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v20, v21);
      v22 = objc_claimAutoreleasedReturnValue();
      networkFingerprint = v5->_networkFingerprint;
      v5->_networkFingerprint = (NSString *)v22;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *code;
  id v5;
  void *v6;
  NSDate *timeStamp;
  void *v8;
  NSString *networkFingerprint;
  id v10;

  code = self->_code;
  v5 = a3;
  NSStringFromSelector(sel_code);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", code, v6);

  timeStamp = self->_timeStamp;
  NSStringFromSelector(sel_timeStamp);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", timeStamp, v8);

  networkFingerprint = self->_networkFingerprint;
  NSStringFromSelector(sel_networkFingerprint);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", networkFingerprint, v10);

}

- (NSString)code
{
  return self->_code;
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (NSString)networkFingerprint
{
  return self->_networkFingerprint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkFingerprint, 0);
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_storeStrong((id *)&self->_code, 0);
}

@end
