@implementation ILMessageCommunication

- (ILMessageCommunication)initWithSender:(id)a3 dateReceived:(id)a4 messageBody:(id)a5
{
  id v9;
  ILMessageCommunication *v10;
  ILMessageCommunication *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ILMessageCommunication;
  v10 = -[ILCommunication initWithSender:dateReceived:](&v13, sel_initWithSender_dateReceived_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_messageBody, a5);

  return v11;
}

- (ILMessageCommunication)init
{

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[ILMessageCommunication isEqualToMessageCommunication:](self, "isEqualToMessageCommunication:", v4);

  return v5;
}

- (BOOL)isEqualToMessageCommunication:(ILMessageCommunication *)communication
{
  ILMessageCommunication *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v4 = communication;
  if (-[ILCommunication isEqualToCommunication:](self, "isEqualToCommunication:", v4))
  {
    -[ILMessageCommunication messageBody](self, "messageBody");
    v5 = objc_claimAutoreleasedReturnValue();
    -[ILMessageCommunication messageBody](v4, "messageBody");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (v5 | v6) == 0;
    if (v6)
      v7 = objc_msgSend((id)v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ILMessageCommunication;
  v3 = -[ILCommunication hash](&v7, sel_hash);
  -[ILMessageCommunication messageBody](self, "messageBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILMessageCommunication)initWithCoder:(id)a3
{
  id v4;
  ILMessageCommunication *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *messageBody;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ILMessageCommunication;
  v5 = -[ILCommunication initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_messageBody);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    messageBody = v5->_messageBody;
    v5->_messageBody = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ILMessageCommunication;
  v4 = a3;
  -[ILCommunication encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[ILMessageCommunication messageBody](self, "messageBody", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_messageBody);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

}

- (NSString)messageBody
{
  return self->_messageBody;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageBody, 0);
}

@end
