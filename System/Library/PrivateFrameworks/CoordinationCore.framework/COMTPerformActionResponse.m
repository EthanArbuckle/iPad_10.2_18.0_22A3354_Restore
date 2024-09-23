@implementation COMTPerformActionResponse

- (COMTPerformActionResponse)initWithResults:(id)a3
{
  id v4;
  COMTPerformActionResponse *v5;
  uint64_t v6;
  NSDictionary *results;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COMTPerformActionResponse;
  v5 = -[COMessageChannelResponse init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    results = v5->_results;
    v5->_results = (NSDictionary *)v6;

  }
  return v5;
}

- (COMTPerformActionResponse)initWithCoder:(id)a3
{
  id v4;
  COMTPerformActionResponse *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSDictionary *results;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)COMTPerformActionResponse;
  v5 = -[COMessageChannelResponse initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("RR"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    results = v5->_results;
    v5->_results = (NSDictionary *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)COMTPerformActionResponse;
  v4 = a3;
  -[COMessageChannelResponse encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[COMTPerformActionResponse results](self, "results", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("RR"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)results
{
  return self->_results;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
}

@end
