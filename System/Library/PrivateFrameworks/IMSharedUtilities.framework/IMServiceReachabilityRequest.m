@implementation IMServiceReachabilityRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IMServiceReachabilityRequest)initWithHandleIDs:(id)a3 requestID:(id)a4 serviceName:(id)a5 accountID:(id)a6 context:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  IMServiceReachabilityRequest *v17;
  IMServiceReachabilityRequest *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)IMServiceReachabilityRequest;
  v17 = -[IMServiceReachabilityRequest init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_handleIDs, a3);
    objc_storeStrong((id *)&v18->_requestID, a4);
    objc_storeStrong((id *)&v18->_serviceName, a5);
    objc_storeStrong((id *)&v18->_accountID, a6);
    objc_storeStrong((id *)&v18->_context, a7);
  }

  return v18;
}

- (IMServiceReachabilityRequest)initWithCoder:(id)a3
{
  id v4;
  IMServiceReachabilityRequest *v5;
  uint64_t v6;
  NSArray *handleIDs;
  uint64_t v8;
  NSString *requestID;
  uint64_t v10;
  NSString *serviceName;
  uint64_t v12;
  NSString *accountID;
  uint64_t v14;
  IMServiceReachabilityContext *context;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IMServiceReachabilityRequest;
  v5 = -[IMServiceReachabilityRequest init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("handleIDs"));
    v6 = objc_claimAutoreleasedReturnValue();
    handleIDs = v5->_handleIDs;
    v5->_handleIDs = (NSArray *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestID"));
    v8 = objc_claimAutoreleasedReturnValue();
    requestID = v5->_requestID;
    v5->_requestID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceName"));
    v10 = objc_claimAutoreleasedReturnValue();
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
    v12 = objc_claimAutoreleasedReturnValue();
    accountID = v5->_accountID;
    v5->_accountID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
    v14 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (IMServiceReachabilityContext *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *handleIDs;
  id v5;

  handleIDs = self->_handleIDs;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", handleIDs, CFSTR("handleIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestID, CFSTR("requestID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceName, CFSTR("serviceName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountID, CFSTR("accountID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_context, CFSTR("context"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[IMServiceReachabilityRequest requestID](self, "requestID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMServiceReachabilityRequest serviceName](self, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMServiceReachabilityRequest accountID](self, "accountID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMServiceReachabilityRequest context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMServiceReachabilityRequest handleIDs](self, "handleIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p [requestID: %@ serviceName: %@ accountID: %@ context: %@ handleIDs: %@]>"), v4, self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_signature
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMServiceReachabilityRequest serviceName](self, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMServiceReachabilityRequest handleIDs](self, "handleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMServiceReachabilityRequest context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_signature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@%@"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSArray)handleIDs
{
  return self->_handleIDs;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (IMServiceReachabilityContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_handleIDs, 0);
}

@end
