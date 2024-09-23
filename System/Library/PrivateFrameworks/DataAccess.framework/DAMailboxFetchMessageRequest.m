@implementation DAMailboxFetchMessageRequest

- (id)initRequestForBodyFormat:(int)a3 withMessageID:(id)a4 withBodySizeLimit:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  DAMailboxFetchMessageRequest *v9;
  DAMailboxFetchMessageRequest *v10;
  void *v11;
  objc_super v13;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DAMailboxFetchMessageRequest;
  v9 = -[DAMailboxRequest init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    -[DAMailboxRequest setRequestType:](v9, "setRequestType:", 3);
    v11 = (void *)objc_msgSend(v8, "copy");
    -[DAMailboxRequest setMessageID:](v10, "setMessageID:", v11);

    -[DAMailboxRequest setBodyFormat:](v10, "setBodyFormat:", v6);
    -[DAMailboxFetchMessageRequest setMaxSize:](v10, "setMaxSize:", v5);
  }

  return v10;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[DAMailboxRequest messageID](self, "messageID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@\n%d\n%d"), v4, -[DAMailboxFetchMessageRequest maxSize](self, "maxSize"), -[DAMailboxRequest bodyFormat](self, "bodyFormat"));

  v6 = objc_msgSend(v5, "hash");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  int v11;
  int v12;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    -[DAMailboxRequest messageID](self, "messageID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "messageID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9
      || (-[DAMailboxRequest messageID](self, "messageID"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "messageID"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqual:", v4)))
    {
      v11 = objc_msgSend(v7, "maxSize");
      if (v11 == -[DAMailboxFetchMessageRequest maxSize](self, "maxSize"))
      {
        v12 = objc_msgSend(v7, "bodyFormat");
        v10 = v12 == -[DAMailboxRequest bodyFormat](self, "bodyFormat");
      }
      else
      {
        v10 = 0;
      }
      if (v8 == v9)
        goto LABEL_11;
    }
    else
    {
      v10 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  v10 = 0;
LABEL_12:

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
  v8.super_class = (Class)DAMailboxFetchMessageRequest;
  -[DAMailboxFetchMessageRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAMailboxRequest messageID](self, "messageID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ messageID \"%@\", maxSize %d, bodyFormat %d"), v4, v5, -[DAMailboxFetchMessageRequest maxSize](self, "maxSize"), -[DAMailboxRequest bodyFormat](self, "bodyFormat"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)maxSize
{
  return self->_maxSize;
}

- (void)setMaxSize:(int)a3
{
  self->_maxSize = a3;
}

@end
