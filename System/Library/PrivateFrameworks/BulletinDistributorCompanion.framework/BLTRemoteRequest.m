@implementation BLTRemoteRequest

+ (id)remoteRequestWithProtobuf:(id)a3 type:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtobuf:type:", v6, v4);

  return v7;
}

- (BLTRemoteRequest)initWithProtobuf:(id)a3 type:(unsigned __int16)a4
{
  id v7;
  BLTRemoteRequest *v8;
  BLTRemoteRequest *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BLTRemoteRequest;
  v8 = -[BLTRemoteRequest init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_protobuf, a3);
    v9->_type = a4;
    v9->_allowCloudDelivery = 1;
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTRemoteRequest protobuf](self, "protobuf");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v4, CFSTR("protobuf"), 0);

  v6 = (id)objc_msgSend(v3, "appendUnsignedInt:withName:", -[BLTRemoteRequest type](self, "type"), CFSTR("type"));
  -[BLTRemoteRequest didSend](self, "didSend");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v7, CFSTR("didSend"), 1);

  -[BLTRemoteRequest timeout](self, "timeout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v9, CFSTR("timeout"), 1);

  -[BLTRemoteRequest didQueue](self, "didQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v11, CFSTR("didQueue"), 1);

  -[BLTRemoteRequest requestDescription](self, "requestDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v13, CFSTR("requestDescription"), 1);

  v15 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLTRemoteRequest allowCloudDelivery](self, "allowCloudDelivery"), CFSTR("allowCloudDelivery"));
  -[BLTRemoteRequest uniqueID](self, "uniqueID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v16, CFSTR("uniqueID"), 1);

  -[BLTRemoteRequest responseCompletion](self, "responseCompletion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v18, CFSTR("responseCompletion"), 1);

  -[BLTRemoteRequest responseToRequest](self, "responseToRequest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v20, CFSTR("responseToRequest"), 1);

  objc_msgSend(v3, "build");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (PBCodable)protobuf
{
  return self->_protobuf;
}

- (void)setProtobuf:(id)a3
{
  objc_storeStrong((id *)&self->_protobuf, a3);
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int16)a3
{
  self->_type = a3;
}

- (id)didSend
{
  return self->_didSend;
}

- (void)setDidSend:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_timeout, a3);
}

- (id)didQueue
{
  return self->_didQueue;
}

- (void)setDidQueue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)requestDescription
{
  return self->_requestDescription;
}

- (void)setRequestDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)allowCloudDelivery
{
  return self->_allowCloudDelivery;
}

- (void)setAllowCloudDelivery:(BOOL)a3
{
  self->_allowCloudDelivery = a3;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)responseCompletion
{
  return self->_responseCompletion;
}

- (void)setResponseCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)nonWaking
{
  return self->_nonWaking;
}

- (void)setNonWaking:(BOOL)a3
{
  self->_nonWaking = a3;
}

- (IDSProtobuf)responseToRequest
{
  return self->_responseToRequest;
}

- (void)setResponseToRequest:(id)a3
{
  objc_storeStrong((id *)&self->_responseToRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseToRequest, 0);
  objc_storeStrong(&self->_responseCompletion, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_requestDescription, 0);
  objc_storeStrong(&self->_didQueue, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong(&self->_didSend, 0);
  objc_storeStrong((id *)&self->_protobuf, 0);
}

@end
