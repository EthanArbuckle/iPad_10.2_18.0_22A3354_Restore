@implementation AMSEngagementEnqueueRequest

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[AMSEngagementEnqueueRequest clientInfo](self, "clientInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("kCodingKeyClientInfo"));

  -[AMSEngagementEnqueueRequest destinations](self, "destinations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("kCodingKeyDestinations"));

  -[AMSEngagementEnqueueRequest events](self, "events");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("kCodingKeyEvents"));

  -[AMSEngagementEnqueueRequest logKey](self, "logKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("kCodingKeyLogKey"));

  -[AMSEngagementEnqueueRequest timeout](self, "timeout");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("kCodingKeyTimeoOut"));

}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (double)timeout
{
  return self->_timeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
}

- (NSArray)events
{
  return self->_events;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (NSArray)destinations
{
  return self->_destinations;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void)setLogKey:(id)a3
{
  objc_storeStrong((id *)&self->_logKey, a3);
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (void)setDestinations:(id)a3
{
  objc_storeStrong((id *)&self->_destinations, a3);
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (AMSEngagementEnqueueRequest)initWithCoder:(id)a3
{
  id v4;
  AMSEngagementEnqueueRequest *v5;
  uint64_t v6;
  AMSProcessInfo *clientInfo;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *destinations;
  void *v13;
  uint64_t v14;
  NSArray *events;
  uint64_t v16;
  NSString *logKey;
  double v18;
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AMSEngagementEnqueueRequest;
  v5 = -[AMSEngagementEnqueueRequest init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyClientInfo"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientInfo = v5->_clientInfo;
    v5->_clientInfo = (AMSProcessInfo *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("kCodingKeyDestinations"));
    v11 = objc_claimAutoreleasedReturnValue();
    destinations = v5->_destinations;
    v5->_destinations = (NSArray *)v11;

    objc_msgSend(MEMORY[0x1E0C99E60], "ams_PLISTClasses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kCodingKeyEvents"));
    v14 = objc_claimAutoreleasedReturnValue();
    events = v5->_events;
    v5->_events = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyLogKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    logKey = v5->_logKey;
    v5->_logKey = (NSString *)v16;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kCodingKeyTimeoOut"));
    v5->_timeout = v18;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)archiveClasses
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3, v6, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
