@implementation HMDDataStreamBulkSendSessionCandidate

- (HMDDataStreamBulkSendSessionCandidate)initWithProtocol:(id)a3 requestHeader:(id)a4 metadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDDataStreamBulkSendSessionCandidate *v11;
  HMDDataStreamBulkSendSessionCandidate *v12;
  uint64_t v13;
  NSMutableArray *pendingReads;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDDataStreamBulkSendSessionCandidate;
  v11 = -[HMDDataStreamBulkSendSessionCandidate init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_bulkSendProtocol, v8);
    objc_storeStrong((id *)&v12->_requestHeader, a4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    pendingReads = v12->_pendingReads;
    v12->_pendingReads = (NSMutableArray *)v13;

    objc_storeStrong((id *)&v12->_metadata, a5);
  }

  return v12;
}

- (void)acceptBulkSendSessionOnQueue:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMDDataStreamBulkSendSessionCandidate bulkSendProtocol](self, "bulkSendProtocol");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asyncBulkSendSessionCandidate:didAcceptOnQueue:callback:", self, v7, v6);

}

- (void)rejectBulkSendSessionWithStatus:(unsigned __int16)a3
{
  uint64_t v3;
  id v5;

  v3 = a3;
  -[HMDDataStreamBulkSendSessionCandidate bulkSendProtocol](self, "bulkSendProtocol");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asyncBulkSendSessionCandidate:didRejectWithStatus:", self, v3);

}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (HMDDataStreamBulkSendProtocol)bulkSendProtocol
{
  return (HMDDataStreamBulkSendProtocol *)objc_loadWeakRetained((id *)&self->_bulkSendProtocol);
}

- (NSDictionary)requestHeader
{
  return self->_requestHeader;
}

- (NSMutableArray)pendingReads
{
  return self->_pendingReads;
}

- (void)setPendingReads:(id)a3
{
  objc_storeStrong((id *)&self->_pendingReads, a3);
}

- (NSError)receivedFailure
{
  return self->_receivedFailure;
}

- (void)setReceivedFailure:(id)a3
{
  objc_storeStrong((id *)&self->_receivedFailure, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivedFailure, 0);
  objc_storeStrong((id *)&self->_pendingReads, 0);
  objc_storeStrong((id *)&self->_requestHeader, 0);
  objc_destroyWeak((id *)&self->_bulkSendProtocol);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
