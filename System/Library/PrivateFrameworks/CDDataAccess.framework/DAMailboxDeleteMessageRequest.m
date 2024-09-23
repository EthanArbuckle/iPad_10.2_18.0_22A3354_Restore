@implementation DAMailboxDeleteMessageRequest

- (id)initRequestWithMessageID:(id)a3
{
  id v4;
  DAMailboxDeleteMessageRequest *v5;
  DAMailboxDeleteMessageRequest *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DAMailboxDeleteMessageRequest;
  v5 = -[DAMailboxRequest init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[DAMailboxRequest setRequestType:](v5, "setRequestType:", 2);
    v7 = (void *)objc_msgSend(v4, "copy");
    -[DAMailboxRequest setMessageID:](v6, "setMessageID:", v7);

  }
  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[DAMailboxRequest messageID](self, "messageID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[DAMailboxRequest messageID](self, "messageID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      -[DAMailboxRequest messageID](self, "messageID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "messageID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)DAMailboxDeleteMessageRequest;
  -[DAMailboxDeleteMessageRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAMailboxRequest messageID](self, "messageID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ messageID \"%@\"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
