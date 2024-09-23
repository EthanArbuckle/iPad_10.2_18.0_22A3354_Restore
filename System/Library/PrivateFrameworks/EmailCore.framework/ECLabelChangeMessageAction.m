@implementation ECLabelChangeMessageAction

- (ECLabelChangeMessageAction)initWithBuilder:(id)a3
{
  void (**v4)(id, ECLabelChangeMessageAction *);
  ECLabelChangeMessageAction *v5;
  objc_super v7;

  v4 = (void (**)(id, ECLabelChangeMessageAction *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ECLabelChangeMessageAction;
  v5 = -[ECLabelChangeMessageAction init](&v7, sel_init);
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

- (NSSet)labelsToAdd
{
  return self->_labelsToAdd;
}

- (void)setLabelsToAdd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSSet)labelsToRemove
{
  return self->_labelsToRemove;
}

- (void)setLabelsToRemove:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelsToRemove, 0);
  objc_storeStrong((id *)&self->_labelsToAdd, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_remoteIDs, 0);
}

@end
