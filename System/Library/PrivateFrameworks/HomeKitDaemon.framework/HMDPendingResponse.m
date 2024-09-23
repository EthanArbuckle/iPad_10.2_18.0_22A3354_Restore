@implementation HMDPendingResponse

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDPendingResponse requestMessage](self, "requestMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Pending Response for request: %@, total requests: %tu pending responses: %tu"), v5, -[HMDPendingResponse totalRequestsCount](self, "totalRequestsCount"), -[HMDPendingResponse pendingResponseCount](self, "pendingResponseCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addToPendingResponses:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[HMDPendingResponse allResponses](self, "allResponses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

    -[HMDPendingResponse latestResponses](self, "latestResponses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v4);

    -[HMDPendingResponse setPendingResponseCount:](self, "setPendingResponseCount:", -[HMDPendingResponse pendingResponseCount](self, "pendingResponseCount") - 1);
  }
}

- (void)addResponsesToPendingResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  -[HMDPendingResponse allResponses](self, "allResponses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v4);

  -[HMDPendingResponse latestResponses](self, "latestResponses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v4);

  v7 = objc_msgSend(v4, "count");
  -[HMDPendingResponse setPendingResponseCount:](self, "setPendingResponseCount:", -[HMDPendingResponse pendingResponseCount](self, "pendingResponseCount") - v7);
}

- (id)retrieveAndClearAllResponses
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDPendingResponse allResponses](self, "allResponses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[HMDPendingResponse allResponses](self, "allResponses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[HMDPendingResponse latestResponses](self, "latestResponses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  return v4;
}

- (id)retrieveAndClearLatestResponses
{
  void *v3;
  void *v4;
  void *v5;

  -[HMDPendingResponse latestResponses](self, "latestResponses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[HMDPendingResponse latestResponses](self, "latestResponses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  return v4;
}

- (HMFMessage)requestMessage
{
  return self->_requestMessage;
}

- (void)setRequestMessage:(id)a3
{
  objc_storeStrong((id *)&self->_requestMessage, a3);
}

- (NSString)originalRequestIdentifier
{
  return self->_originalRequestIdentifier;
}

- (void)setOriginalRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_originalRequestIdentifier, a3);
}

- (unint64_t)pendingResponseCount
{
  return self->_pendingResponseCount;
}

- (void)setPendingResponseCount:(unint64_t)a3
{
  self->_pendingResponseCount = a3;
}

- (unint64_t)totalRequestsCount
{
  return self->_totalRequestsCount;
}

- (void)setTotalRequestsCount:(unint64_t)a3
{
  self->_totalRequestsCount = a3;
}

- (NSMutableArray)allResponses
{
  return self->_allResponses;
}

- (void)setAllResponses:(id)a3
{
  objc_storeStrong((id *)&self->_allResponses, a3);
}

- (NSMutableArray)latestResponses
{
  return self->_latestResponses;
}

- (void)setLatestResponses:(id)a3
{
  objc_storeStrong((id *)&self->_latestResponses, a3);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (double)creationTime
{
  return self->_creationTime;
}

- (void)setCreationTime:(double)a3
{
  self->_creationTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_latestResponses, 0);
  objc_storeStrong((id *)&self->_allResponses, 0);
  objc_storeStrong((id *)&self->_originalRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_requestMessage, 0);
}

+ (id)tupleForMessage:(id)a3 originalRequestIdentifier:(id)a4 requestCount:(unint64_t)a5 withCompletionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  HMDPendingResponse *v12;
  void *v13;
  void *v14;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(HMDPendingResponse);
  -[HMDPendingResponse setRequestMessage:](v12, "setRequestMessage:", v11);

  -[HMDPendingResponse setOriginalRequestIdentifier:](v12, "setOriginalRequestIdentifier:", v10);
  -[HMDPendingResponse setTotalRequestsCount:](v12, "setTotalRequestsCount:", a5);
  -[HMDPendingResponse setPendingResponseCount:](v12, "setPendingResponseCount:", a5);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPendingResponse setAllResponses:](v12, "setAllResponses:", v13);

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPendingResponse setLatestResponses:](v12, "setLatestResponses:", v14);

  -[HMDPendingResponse setResponseHandler:](v12, "setResponseHandler:", v9);
  -[HMDPendingResponse setCreationTime:](v12, "setCreationTime:", CFAbsoluteTimeGetCurrent());
  return v12;
}

@end
