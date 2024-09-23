@implementation HMDDatabaseCKOperationCompletionEvent

- (HMDDatabaseCKOperationCompletionEvent)initWithContainerIdentifier:(id)a3
{
  id v5;
  HMDDatabaseCKOperationCompletionEvent *v6;
  HMDDatabaseCKOperationCompletionEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDDatabaseCKOperationCompletionEvent;
  v6 = -[HMMLogEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_containerIdentifier, a3);

  return v7;
}

- (NSString)containerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end
