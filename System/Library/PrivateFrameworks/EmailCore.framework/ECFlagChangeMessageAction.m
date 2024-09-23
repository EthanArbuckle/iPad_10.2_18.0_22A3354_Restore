@implementation ECFlagChangeMessageAction

- (ECFlagChangeMessageAction)initWithBuilder:(id)a3
{
  void (**v4)(id, ECFlagChangeMessageAction *);
  ECFlagChangeMessageAction *v5;
  objc_super v7;

  v4 = (void (**)(id, ECFlagChangeMessageAction *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ECFlagChangeMessageAction;
  v5 = -[ECFlagChangeMessageAction init](&v7, sel_init);
  if (v5)
    v4[2](v4, v5);

  return v5;
}

- (NSSet)remoteIDs
{
  return self->_remoteIDs;
}

- (void)setRemoteIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)messages
{
  return self->_messages;
}

- (void)setMessages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (ECMessageFlagChange)flagChange
{
  return self->_flagChange;
}

- (void)setFlagChange:(id)a3
{
  objc_storeStrong((id *)&self->_flagChange, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flagChange, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_remoteIDs, 0);
}

@end
