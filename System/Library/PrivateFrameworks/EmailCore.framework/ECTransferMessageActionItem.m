@implementation ECTransferMessageActionItem

- (ECTransferMessageActionItem)initWithBuilder:(id)a3
{
  void (**v4)(id, ECTransferMessageActionItem *);
  ECTransferMessageActionItem *v5;
  objc_super v7;

  v4 = (void (**)(id, ECTransferMessageActionItem *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ECTransferMessageActionItem;
  v5 = -[ECTransferMessageActionItem init](&v7, sel_init);
  if (v5)
    v4[2](v4, v5);

  return v5;
}

- (ECTransferMessageActionItem)init
{
  -[ECTransferMessageActionItem doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ECTransferMessageActionItem init]", "ECTransferMessageAction.m", 27, "0");
}

- (NSString)sourceRemoteID
{
  return self->_sourceRemoteID;
}

- (void)setSourceRemoteID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (ECMessage)sourceMessage
{
  return self->_sourceMessage;
}

- (void)setSourceMessage:(id)a3
{
  objc_storeStrong((id *)&self->_sourceMessage, a3);
}

- (ECMessage)destinationMessage
{
  return self->_destinationMessage;
}

- (void)setDestinationMessage:(id)a3
{
  objc_storeStrong((id *)&self->_destinationMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationMessage, 0);
  objc_storeStrong((id *)&self->_sourceMessage, 0);
  objc_storeStrong((id *)&self->_sourceRemoteID, 0);
}

@end
