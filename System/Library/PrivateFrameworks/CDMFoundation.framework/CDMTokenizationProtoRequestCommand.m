@implementation CDMTokenizationProtoRequestCommand

- (CDMTokenizationProtoRequestCommand)initWithRequest:(id)a3
{
  id v4;
  CDMTokenizationProtoRequestCommand *v5;
  uint64_t v6;
  NSArray *requests;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMTokenizationProtoRequestCommand;
  v5 = -[CDMBaseCommand init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    requests = v5->_requests;
    v5->_requests = (NSArray *)v6;

  }
  return v5;
}

- (CDMTokenizationProtoRequestCommand)initWithRequests:(id)a3
{
  id v5;
  CDMTokenizationProtoRequestCommand *v6;
  CDMTokenizationProtoRequestCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMTokenizationProtoRequestCommand;
  v6 = -[CDMBaseCommand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_requests, a3);

  return v7;
}

- (NSArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
  objc_storeStrong((id *)&self->_requests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);
}

@end
