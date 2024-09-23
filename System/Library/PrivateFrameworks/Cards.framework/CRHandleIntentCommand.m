@implementation CRHandleIntentCommand

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRHandleIntentCommand;
  v5 = -[CRBasicPayloadCommand copyWithZone:](&v9, sel_copyWithZone_);
  -[CRHandleIntentCommand intent](self, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setIntent:", v7);

  return v5;
}

- (INIntent)intent
{
  return self->_intent;
}

- (void)setIntent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intent, 0);
}

@end
