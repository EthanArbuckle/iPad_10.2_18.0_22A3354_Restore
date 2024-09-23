@implementation DAMailboxSetFlagsRequest

- (id)initRequestWithSetFlags:(unint64_t)a3 unsetFlags:(unint64_t)a4 message:(id)a5
{
  id v8;
  DAMailboxSetFlagsRequest *v9;
  DAMailboxSetFlagsRequest *v10;
  void *v11;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)DAMailboxSetFlagsRequest;
  v9 = -[DAMailboxRequest init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    -[DAMailboxRequest setRequestType:](v9, "setRequestType:", 0);
    -[DAMailboxSetFlagsRequest setOnFlags:](v10, "setOnFlags:", a3);
    -[DAMailboxSetFlagsRequest setOffFlags:](v10, "setOffFlags:", a4);
    v11 = (void *)objc_msgSend(v8, "copy");
    -[DAMailboxRequest setMessageID:](v10, "setMessageID:", v11);

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
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@\n%llu\n%llu"), v4, -[DAMailboxSetFlagsRequest onFlags](self, "onFlags"), -[DAMailboxSetFlagsRequest offFlags](self, "offFlags"));

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
  uint64_t v11;
  uint64_t v12;

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
      v11 = objc_msgSend(v7, "onFlags");
      if (v11 == -[DAMailboxSetFlagsRequest onFlags](self, "onFlags"))
      {
        v12 = objc_msgSend(v7, "offFlags");
        v10 = v12 == -[DAMailboxSetFlagsRequest offFlags](self, "offFlags");
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
  v8.super_class = (Class)DAMailboxSetFlagsRequest;
  -[DAMailboxSetFlagsRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAMailboxRequest messageID](self, "messageID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ messageID \"%@\", onFlags %llu, offFlags %llu"), v4, v5, -[DAMailboxSetFlagsRequest onFlags](self, "onFlags"), -[DAMailboxSetFlagsRequest offFlags](self, "offFlags"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)onFlags
{
  return self->_onFlags;
}

- (void)setOnFlags:(unint64_t)a3
{
  self->_onFlags = a3;
}

- (unint64_t)offFlags
{
  return self->_offFlags;
}

- (void)setOffFlags:(unint64_t)a3
{
  self->_offFlags = a3;
}

@end
