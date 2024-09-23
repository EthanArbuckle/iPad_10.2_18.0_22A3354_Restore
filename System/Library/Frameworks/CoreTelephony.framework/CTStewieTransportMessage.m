@implementation CTStewieTransportMessage

- (CTStewieTransportMessage)init
{
  CTStewieTransportMessage *v2;
  void *v3;
  uint64_t v4;
  NSString *msgId;
  NSData *data;
  NSDictionary *metadata;
  CTStewieTransportMessage *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CTStewieTransportMessage;
  v2 = -[CTStewieTransportMessage init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    msgId = v2->_msgId;
    v2->_msgId = (NSString *)v4;

    data = v2->_data;
    v2->_data = 0;

    metadata = v2->_metadata;
    v2->_metadata = 0;

    v8 = v2;
  }

  return v2;
}

- (CTStewieTransportMessage)initWithMsgId:(id)a3
{
  id v5;
  CTStewieTransportMessage *v6;
  CTStewieTransportMessage *v7;
  NSData *data;
  NSDictionary *metadata;
  CTStewieTransportMessage *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTStewieTransportMessage;
  v6 = -[CTStewieTransportMessage init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_msgId, a3);
    data = v7->_data;
    v7->_data = 0;

    metadata = v7->_metadata;
    v7->_metadata = 0;

    v10 = v7;
  }

  return v7;
}

- (id)description
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTStewieTransportMessage msgId](self, "msgId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(", msgId=%@"), v5);

  -[CTStewieTransportMessage data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CTStewieTransportMessage data](self, "data");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v2, "length");
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v4, "appendFormat:", CFSTR(", data length=%lu"), v7);
  if (v6)

  -[CTStewieTransportMessage metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(", metadata=%@"), v8);

  objc_msgSend(v4, "appendString:", CFSTR(">"));
  return v4;
}

- (BOOL)isEqualToTransportMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  -[CTStewieTransportMessage msgId](self, "msgId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "msgId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 != v6)
  {
    -[CTStewieTransportMessage msgId](self, "msgId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "msgId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v18, "isEqual:"))
    {
      v7 = 0;
LABEL_13:

      goto LABEL_14;
    }
  }
  -[CTStewieTransportMessage data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 != v9)
  {
    -[CTStewieTransportMessage data](self, "data");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v17, "isEqual:"))
    {
      v7 = 0;
LABEL_11:

      goto LABEL_12;
    }
  }
  -[CTStewieTransportMessage metadata](self, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v11)
  {

    v7 = 1;
  }
  else
  {
    -[CTStewieTransportMessage metadata](self, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v12, "isEqual:", v13);

  }
  if (v8 != v9)
    goto LABEL_11;
LABEL_12:

  if (v5 != v6)
    goto LABEL_13;
LABEL_14:

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTStewieTransportMessage *v4;
  BOOL v5;

  v4 = (CTStewieTransportMessage *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTStewieTransportMessage isEqualToTransportMessage:](self, "isEqualToTransportMessage:", v4);
  }

  return v5;
}

+ (id)allowedSetOfClasses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v25 = (void *)MEMORY[0x1E0C99E60];
  v24 = objc_opt_class();
  v23 = objc_opt_class();
  v22 = objc_opt_class();
  v21 = objc_opt_class();
  v20 = objc_opt_class();
  v19 = objc_opt_class();
  v18 = objc_opt_class();
  v17 = objc_opt_class();
  v16 = objc_opt_class();
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  return (id)objc_msgSend(v25, "setWithObjects:", v24, v23, v22, v21, v20, v19, v18, v17, v16, v15, v14, v13, v2, v3, v4, v5, v6,
               v7,
               v8,
               v9,
               v10,
               v11,
               objc_opt_class(),
               0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTStewieTransportMessage msgId](self, "msgId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setMsgId:", v7);

  -[CTStewieTransportMessage data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setData:", v9);

  -[CTStewieTransportMessage metadata](self, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setMetadata:", v11);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CTStewieTransportMessage msgId](self, "msgId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("msgId"));

  -[CTStewieTransportMessage data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("data"));

  -[CTStewieTransportMessage metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("metadata"));

}

- (CTStewieTransportMessage)initWithCoder:(id)a3
{
  id v4;
  CTStewieTransportMessage *v5;
  uint64_t v6;
  NSString *msgId;
  uint64_t v8;
  NSData *data;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSDictionary *metadata;
  CTStewieTransportMessage *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CTStewieTransportMessage;
  v5 = -[CTStewieTransportMessage init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("msgId"));
    v6 = objc_claimAutoreleasedReturnValue();
    msgId = v5->_msgId;
    v5->_msgId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v8 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("metadata"));
    v17 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v17;

    v19 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)msgId
{
  return self->_msgId;
}

- (void)setMsgId:(id)a3
{
  objc_storeStrong((id *)&self->_msgId, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_msgId, 0);
}

@end
