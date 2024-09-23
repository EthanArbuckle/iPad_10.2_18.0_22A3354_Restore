@implementation GTTpacketRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *selector;
  id v5;

  selector = self->_selector;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", selector, CFSTR("selector"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requests, CFSTR("request"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_requestID, CFSTR("requestID"));

}

- (GTTpacketRequest)initWithCoder:(id)a3
{
  id v4;
  GTTpacketRequest *v5;
  uint64_t v6;
  NSString *selector;
  uint64_t v8;
  NSString *label;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *requests;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GTTpacketRequest;
  v5 = -[GTTpacketRequest init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selector"));
    v6 = objc_claimAutoreleasedReturnValue();
    selector = v5->_selector;
    v5->_selector = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v8 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v8;

    v5->_requestID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("requestID"));
    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("request"));
    v13 = objc_claimAutoreleasedReturnValue();
    requests = v5->_requests;
    v5->_requests = (NSArray *)v13;

  }
  return v5;
}

- (NSString)selector
{
  return self->_selector;
}

- (void)setSelector:(id)a3
{
  objc_storeStrong((id *)&self->_selector, a3);
}

- (NSArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
  objc_storeStrong((id *)&self->_requests, a3);
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(unint64_t)a3
{
  self->_requestID = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_selector, 0);
}

@end
