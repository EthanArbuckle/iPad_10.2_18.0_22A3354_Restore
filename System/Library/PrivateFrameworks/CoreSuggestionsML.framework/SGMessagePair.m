@implementation SGMessagePair

- (SGMessagePair)initWithReply:(id)a3 prompt:(id)a4 handle:(id)a5 sentAt:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SGMessagePair *v15;
  SGMessagePair *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SGMessagePair;
  v15 = -[SGMessagePair init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_reply, a3);
    objc_storeStrong((id *)&v16->_prompt, a4);
    objc_storeStrong((id *)&v16->_handle, a5);
    objc_storeStrong((id *)&v16->_sentAt, a6);
  }

  return v16;
}

- (NSString)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
  objc_storeStrong((id *)&self->_reply, a3);
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setPrompt:(id)a3
{
  objc_storeStrong((id *)&self->_prompt, a3);
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (NSDate)sentAt
{
  return self->_sentAt;
}

- (void)setSentAt:(id)a3
{
  objc_storeStrong((id *)&self->_sentAt, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sentAt, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_reply, 0);
}

@end
