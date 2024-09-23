@implementation BMSocialHighlightContact

- (unsigned)dataVersion
{
  return 3;
}

- (BMSocialHighlightContact)initWithHandle:(id)a3 isSignificant:(BOOL)a4 isMe:(BOOL)a5
{
  id v9;
  BMSocialHighlightContact *v10;
  BMSocialHighlightContact *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BMSocialHighlightContact;
  v10 = -[BMEventBase init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_handle, a3);
    v11->_isSignificant = a4;
    v11->_isMe = a5;
  }

  return v11;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v4;
  BMSocialHighlightContact *v5;

  if (a4 == 3)
  {
    v4 = a3;
    v5 = -[BMSocialHighlightContact initWithProtoData:]([BMSocialHighlightContact alloc], "initWithProtoData:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMSocialHighlightContact proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMSocialHighlightContact)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BMSocialHighlightContact *v8;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    objc_msgSend(v5, "handle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "handle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[BMSocialHighlightContact initWithHandle:isSignificant:isMe:](self, "initWithHandle:isSignificant:isMe:", v7, objc_msgSend(v5, "isSignificant"), objc_msgSend(v5, "isMe"));

      v8 = self;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BMSocialHighlightContact)initWithProtoData:(id)a3
{
  id v4;
  BMPBSocialHighlightContact *v5;
  BMSocialHighlightContact *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBSocialHighlightContact initWithData:]([BMPBSocialHighlightContact alloc], "initWithData:", v4);

    self = -[BMSocialHighlightContact initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setIsMe:", -[BMSocialHighlightContact isMe](self, "isMe"));
  objc_msgSend(v3, "setIsSignificant:", -[BMSocialHighlightContact isSignificant](self, "isSignificant"));
  -[BMSocialHighlightContact handle](self, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHandle:", v4);

  return v3;
}

- (BOOL)isSignificant
{
  return self->_isSignificant;
}

- (NSString)handle
{
  return self->_handle;
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
