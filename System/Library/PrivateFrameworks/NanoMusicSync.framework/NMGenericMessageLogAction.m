@implementation NMGenericMessageLogAction

+ (id)logActionWithMessage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMessage:", v4);

  return v5;
}

- (NMGenericMessageLogAction)initWithMessage:(id)a3
{
  id v5;
  NMGenericMessageLogAction *v6;
  NMGenericMessageLogAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NMGenericMessageLogAction;
  v6 = -[NMGenericMessageLogAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_message, a3);

  return v7;
}

- (id)logMessage
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
