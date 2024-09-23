@implementation MRRequestDetails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (MRRequestDetails)initWithName:(id)a3 requestID:(id)a4 reason:(id)a5 userInitiated:(BOOL)a6
{
  id v11;
  id v12;
  __CFString *v13;
  MRRequestDetails *v14;
  MRRequestDetails *v15;
  NSString *v16;
  void *requestID;
  uint64_t v18;
  NSString *v19;
  __CFString *v20;
  uint64_t v21;
  NSDate *startDate;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = (__CFString *)a5;
  v24.receiver = self;
  v24.super_class = (Class)MRRequestDetails;
  v14 = -[MRRequestDetails init](&v24, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_name, a3);
    if (v12)
    {
      v16 = (NSString *)v12;
      requestID = v15->_requestID;
      v15->_requestID = v16;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      requestID = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(requestID, "UUIDString");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v15->_requestID;
      v15->_requestID = (NSString *)v18;

    }
    if (v13)
      v20 = v13;
    else
      v20 = &stru_1E30D5AF8;
    objc_storeStrong((id *)&v15->_reason, v20);
    v15->_qos = qos_class_self();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v21 = objc_claimAutoreleasedReturnValue();
    startDate = v15->_startDate;
    v15->_startDate = (NSDate *)v21;

    v15->_userInitiated = a6;
  }

  return v15;
}

- (MRRequestDetails)initWithName:(id)a3 requestID:(id)a4 reason:(id)a5
{
  return -[MRRequestDetails initWithName:requestID:reason:userInitiated:](self, "initWithName:requestID:reason:userInitiated:", a3, a4, a5, 0);
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (MRRequestDetails)initWithData:(id)a3
{
  id v4;
  _MRRequestDetailsProtobuf *v5;
  MRRequestDetails *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[_MRRequestDetailsProtobuf initWithData:]([_MRRequestDetailsProtobuf alloc], "initWithData:", v4);

    self = -[MRRequestDetails initWithProtobuf:](self, "initWithProtobuf:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MRRequestDetails)initWithProtobuf:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MRRequestDetails *v9;
  uint64_t v10;
  NSDate *startDate;
  MRRequestDetails *v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reason");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MRRequestDetails initWithName:requestID:reason:](self, "initWithName:requestID:reason:", v6, v7, v8);

    if (v9)
    {
      v9->_qos = objc_msgSend(v5, "qos");
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)(unint64_t)objc_msgSend(v5, "startDate"));
      startDate = v9->_startDate;
      v9->_startDate = (NSDate *)v10;

      v9->_userInitiated = objc_msgSend(v5, "userInitiated");
    }
    self = v9;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MRRequestDetails name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRRequestDetails requestID](self, "requestID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRRequestDetails reason](self, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@<%@>:%@ UserInitiated=%u, qos=%u"), v4, v5, v6, self->_userInitiated, self->_qos);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MRRequestDetails protobuf](self, "protobuf");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobuf"));

}

- (MRRequestDetails)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MRRequestDetails *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobuf"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[MRRequestDetails initWithProtobuf:](self, "initWithProtobuf:", v5);
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[MRRequestDetails protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (_MRRequestDetailsProtobuf)protobuf
{
  _MRRequestDetailsProtobuf *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;

  v3 = objc_alloc_init(_MRRequestDetailsProtobuf);
  -[MRRequestDetails name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRRequestDetailsProtobuf setName:](v3, "setName:", v4);

  -[MRRequestDetails requestID](self, "requestID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRRequestDetailsProtobuf setRequestID:](v3, "setRequestID:", v5);

  -[MRRequestDetails reason](self, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRRequestDetailsProtobuf setReason:](v3, "setReason:", v6);

  -[_MRRequestDetailsProtobuf setQos:](v3, "setQos:", -[MRRequestDetails qos](self, "qos"));
  -[MRRequestDetails startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  -[_MRRequestDetailsProtobuf setStartDate:](v3, "setStartDate:", (unint64_t)v8);

  -[_MRRequestDetailsProtobuf setUserInitiated:](v3, "setUserInitiated:", -[MRRequestDetails userInitiated](self, "userInitiated"));
  return v3;
}

- (NSString)requestReasonID
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MRRequestDetails requestID](self, "requestID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRRequestDetails reason](self, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@<%@>"), v4, v5);

  return (NSString *)v6;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)qos
{
  return self->_qos;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

@end
