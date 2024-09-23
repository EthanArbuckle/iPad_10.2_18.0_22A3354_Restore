@implementation EMSenderBlockingAction

- (EMSenderBlockingAction)initWithMessageListItems:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 blockSender:(BOOL)a6
{
  EMSenderBlockingAction *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EMSenderBlockingAction;
  result = -[EMMessageChangeAction initWithMessageListItems:origin:actor:](&v8, sel_initWithMessageListItems_origin_actor_, a3, a4, a5);
  if (result)
    result->_blockSender = a6;
  return result;
}

- (int64_t)signpostType
{
  if (self->_blockSender)
    return 11;
  else
    return 12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMSenderBlockingAction)initWithCoder:(id)a3
{
  id v4;
  EMSenderBlockingAction *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EMSenderBlockingAction;
  v5 = -[EMMessageChangeAction initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_blockSender = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_blockSender"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)EMSenderBlockingAction;
  -[EMMessageChangeAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[EMSenderBlockingAction blockSender](self, "blockSender"), CFSTR("EFPropertyKey_blockSender"));

}

- (BOOL)blockSender
{
  return self->_blockSender;
}

@end
