@implementation AFUpdateMessageRequest

- (id)_initWithMessage:(id)a3
{
  id v5;
  AFUpdateMessageRequest *v6;
  AFUpdateMessageRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFUpdateMessageRequest;
  v6 = -[AFSiriRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_message, a3);

  return v7;
}

- (id)message
{
  return self->_message;
}

- (id)createResponseWithMessageIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[AFObjectUpdatedSiriResponse _initWithRequest:objectIdentifier:]([AFObjectUpdatedSiriResponse alloc], "_initWithRequest:objectIdentifier:", self, v4);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFUpdateMessageRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_message, CFSTR("UpdateMessageRequestMessage"), v5.receiver, v5.super_class);

}

- (AFUpdateMessageRequest)initWithCoder:(id)a3
{
  id v4;
  AFUpdateMessageRequest *v5;
  uint64_t v6;
  STSiriMessage *message;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFUpdateMessageRequest;
  v5 = -[AFSiriRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UpdateMessageRequestMessage"));
    v6 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (STSiriMessage *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
