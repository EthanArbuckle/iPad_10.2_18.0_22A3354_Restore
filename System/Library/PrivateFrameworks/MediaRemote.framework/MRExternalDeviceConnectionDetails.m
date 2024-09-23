@implementation MRExternalDeviceConnectionDetails

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRExternalDeviceConnectionDetails startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRExternalDeviceConnectionDetails startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceNow");
  v8 = -v7;
  -[MRExternalDeviceConnectionDetails requestID](self, "requestID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRExternalDeviceConnectionDetails reason](self, "reason");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p %@ (%lf seconds ago) %@ %@ (%u)>"), v4, self, v5, *(_QWORD *)&v8, v9, v10, -[MRExternalDeviceConnectionDetails qos](self, "qos"));

  return v11;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_requestID, a3);
}

- (unsigned)qos
{
  return self->_qos;
}

- (void)setQos:(unsigned int)a3
{
  self->_qos = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
