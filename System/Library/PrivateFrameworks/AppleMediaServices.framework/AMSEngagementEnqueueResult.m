@implementation AMSEngagementEnqueueResult

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AMSEngagementEnqueueResult actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCodingKeyActions"));

  -[AMSEngagementEnqueueResult data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCodingKeyData"));

  -[AMSEngagementEnqueueResult request](self, "request");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kCodingKeyRequest"));

}

- (AMSEngagementRequest)request
{
  return self->_request;
}

- (NSDictionary)data
{
  return self->_data;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (AMSEngagementEnqueueResult)initWithCoder:(id)a3
{
  id v4;
  AMSEngagementEnqueueResult *v5;
  void *v6;
  uint64_t v7;
  NSArray *actions;
  void *v9;
  uint64_t v10;
  NSDictionary *data;
  uint64_t v12;
  AMSEngagementRequest *request;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSEngagementEnqueueResult;
  v5 = -[AMSEngagementEnqueueResult init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "ams_PLISTClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("kCodingKeyActions"));
    v7 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSArray *)v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "ams_PLISTClasses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("kCodingKeyData"));
    v10 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyRequest"));
    v12 = objc_claimAutoreleasedReturnValue();
    request = v5->_request;
    v5->_request = (AMSEngagementRequest *)v12;

  }
  return v5;
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
