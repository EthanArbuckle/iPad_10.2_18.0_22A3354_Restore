@implementation CRKCancelableBackedCatalystIDSSubscription

- (CRKCancelableBackedCatalystIDSSubscription)initWithCancelable:(id)a3
{
  id v5;
  CRKCancelableBackedCatalystIDSSubscription *v6;
  CRKCancelableBackedCatalystIDSSubscription *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKCancelableBackedCatalystIDSSubscription;
  v6 = -[CRKCancelableBackedCatalystIDSSubscription init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cancelable, a3);

  return v7;
}

- (void)cancel
{
  id v2;

  -[CRKCancelableBackedCatalystIDSSubscription cancelable](self, "cancelable");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (CRKCancelable)cancelable
{
  return self->_cancelable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelable, 0);
}

@end
