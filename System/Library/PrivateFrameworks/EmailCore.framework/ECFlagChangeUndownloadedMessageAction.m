@implementation ECFlagChangeUndownloadedMessageAction

- (ECFlagChangeUndownloadedMessageAction)initWithBuilder:(id)a3
{
  void (**v4)(id, ECFlagChangeUndownloadedMessageAction *);
  ECFlagChangeUndownloadedMessageAction *v5;
  objc_super v7;

  v4 = (void (**)(id, ECFlagChangeUndownloadedMessageAction *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ECFlagChangeUndownloadedMessageAction;
  v5 = -[ECFlagChangeUndownloadedMessageAction init](&v7, sel_init);
  if (v5)
    v4[2](v4, v5);

  return v5;
}

- (NSString)oldestPersistedRemoteID
{
  return self->_oldestPersistedRemoteID;
}

- (void)setOldestPersistedRemoteID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
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
  objc_storeStrong((id *)&self->_oldestPersistedRemoteID, 0);
}

@end
