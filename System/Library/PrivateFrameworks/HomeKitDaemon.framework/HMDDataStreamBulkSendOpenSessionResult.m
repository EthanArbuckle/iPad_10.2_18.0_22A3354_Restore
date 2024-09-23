@implementation HMDDataStreamBulkSendOpenSessionResult

- (HMDDataStreamBulkSendOpenSessionResult)initWithSession:(id)a3 payload:(id)a4
{
  id v7;
  id v8;
  HMDDataStreamBulkSendOpenSessionResult *v9;
  HMDDataStreamBulkSendOpenSessionResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDDataStreamBulkSendOpenSessionResult;
  v9 = -[HMDDataStreamBulkSendOpenSessionResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, a3);
    objc_storeStrong((id *)&v10->_payload, a4);
  }

  return v10;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDataStreamBulkSendOpenSessionResult session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("session"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDataStreamBulkSendOpenSessionResult payload](self, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("payload"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMDDataStreamBulkSendSession)session
{
  return self->_session;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
