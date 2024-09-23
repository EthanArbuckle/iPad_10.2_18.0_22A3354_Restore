@implementation COMessageSession

- (COMessageSession)initWithMember:(id)a3
{
  id v5;
  COMessageSession *v6;
  COMessageSession *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COMessageSession;
  v6 = -[COMessageSession init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_member, a3);
    v7->_startTime = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  }

  return v7;
}

- (void)stopWithNotice:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[COMessageSession messageChannel](self, "messageChannel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "stopMessageSession:withNotice:", self, v6);

}

- (id)messageChannel
{
  void *v3;
  void *v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[COMessageSession producer](self, "producer");
  else
    -[COMessageSession consumer](self, "consumer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageChannel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)subTopic
{
  void *v3;
  void *v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[COMessageSession producer](self, "producer");
  else
    -[COMessageSession consumer](self, "consumer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subTopic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[COMessageSession subTopic](self, "subTopic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[COMessageSession member](self, "member");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  COMessageSession *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (COMessageSession *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    -[COMessageSession subTopic](self, "subTopic");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMessageSession subTopic](v4, "subTopic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if (v7)
    {
      -[COMessageSession member](self, "member");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[COMessageSession member](v4, "member");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToMember:", v9);

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (COClusterMember)member
{
  return self->_member;
}

- (BOOL)didUseRequest
{
  return self->_didUseRequest;
}

- (void)setDidUseRequest:(BOOL)a3
{
  self->_didUseRequest = a3;
}

- (BOOL)didUseResponse
{
  return self->_didUseResponse;
}

- (void)setDidUseResponse:(BOOL)a3
{
  self->_didUseResponse = a3;
}

- (BOOL)didUseNotice
{
  return self->_didUseNotice;
}

- (void)setDidUseNotice:(BOOL)a3
{
  self->_didUseNotice = a3;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_member, 0);
}

@end
