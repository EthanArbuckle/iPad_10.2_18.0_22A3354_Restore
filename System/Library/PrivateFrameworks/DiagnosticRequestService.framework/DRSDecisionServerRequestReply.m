@implementation DRSDecisionServerRequestReply

- (DRSDecisionServerRequestReply)initWithOriginalRequest:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  DRSDecisionServerRequestReply *v9;
  void *v10;
  DRSDecisionServerRequestReply *v11;

  v6 = a4;
  if (v6)
  {
    v7 = a3;
    if (objc_msgSend(v6, "hasAccepted"))
      v8 = objc_msgSend(v6, "accepted");
    else
      v8 = 0;
    objc_msgSend(v6, "rejectionReason");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[DRSDecisionServerRequestReply initWithOriginalRequest:requestAccepted:rejectionReason:](self, "initWithOriginalRequest:requestAccepted:rejectionReason:", v7, v8, v10);

    self = v11;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (DRSDecisionServerRequestReply)initWithOriginalRequest:(id)a3 requestAccepted:(BOOL)a4 rejectionReason:(id)a5
{
  id v9;
  id v10;
  DRSDecisionServerRequestReply *v11;
  DRSDecisionServerRequestReply *v12;
  DRSDecisionServerRequestReply *v13;
  objc_super v15;

  v9 = a3;
  v10 = a5;
  if (v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)DRSDecisionServerRequestReply;
    v11 = -[DRSDecisionServerRequestReply init](&v15, sel_init);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong(&v11->_request, a3);
      v12->_requestAccepted = a4;
      objc_storeStrong((id *)&v12->_rejectionReason, a5);
    }
    self = v12;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)request
{
  return self->_request;
}

- (BOOL)requestAccepted
{
  return self->_requestAccepted;
}

- (NSString)rejectionReason
{
  return self->_rejectionReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rejectionReason, 0);
  objc_storeStrong(&self->_request, 0);
}

@end
