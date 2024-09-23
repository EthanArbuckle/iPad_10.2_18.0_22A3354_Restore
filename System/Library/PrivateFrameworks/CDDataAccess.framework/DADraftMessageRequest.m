@implementation DADraftMessageRequest

- (DADraftMessageRequest)initWithRequestType:(int)a3 message:(id)a4 send:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  DADraftMessageRequest *v9;
  DADraftMessageRequest *v10;
  objc_super v12;

  v5 = a5;
  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DADraftMessageRequest;
  v9 = -[DAMailboxRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[DAMailboxRequest setRequestType:](v9, "setRequestType:", v6);
    -[DADraftMessageRequest setMessage:](v10, "setMessage:", v8);
    -[DADraftMessageRequest setSend:](v10, "setSend:", v5);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)DADraftMessageRequest;
  -[DADraftMessageRequest description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DADraftMessageRequest message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ subject \"%@\"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (DAMailMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (BOOL)send
{
  return self->_send;
}

- (void)setSend:(BOOL)a3
{
  self->_send = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
