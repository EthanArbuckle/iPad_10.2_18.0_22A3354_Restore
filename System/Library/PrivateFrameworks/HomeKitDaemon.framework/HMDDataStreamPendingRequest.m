@implementation HMDDataStreamPendingRequest

- (HMDDataStreamPendingRequest)initWithIdentifier:(id)a3 protocol:(id)a4 topic:(id)a5 payload:(id)a6 callback:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMDDataStreamPendingRequest *v17;
  HMDDataStreamPendingRequest *v18;
  void *v19;
  id callback;
  id v22;
  objc_super v23;

  v22 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HMDDataStreamPendingRequest;
  v17 = -[HMDDataStreamPendingRequest init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_protocol, a4);
    objc_storeStrong((id *)&v18->_topic, a5);
    objc_storeStrong((id *)&v18->_identifier, a3);
    v19 = _Block_copy(v16);
    callback = v18->_callback;
    v18->_callback = v19;

    objc_storeStrong((id *)&v18->_payload, a6);
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HMDDataStreamPendingRequest *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (HMDDataStreamPendingRequest *)v4;
    if (self == v5)
    {
      v8 = 1;
    }
    else
    {
      -[HMDDataStreamPendingRequest identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDataStreamPendingRequest identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDDataStreamPendingRequest identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (NSString)topic
{
  return self->_topic;
}

- (NSString)protocol
{
  return self->_protocol;
}

- (id)callback
{
  return self->_callback;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
