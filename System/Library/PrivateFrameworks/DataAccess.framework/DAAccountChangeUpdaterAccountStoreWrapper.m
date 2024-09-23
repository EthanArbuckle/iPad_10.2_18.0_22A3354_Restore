@implementation DAAccountChangeUpdaterAccountStoreWrapper

- (DAAccountChangeUpdaterAccountStoreWrapper)initWithAccountStore:(id)a3
{
  id v5;
  DAAccountChangeUpdaterAccountStoreWrapper *v6;
  DAAccountChangeUpdaterAccountStoreWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DAAccountChangeUpdaterAccountStoreWrapper;
  v6 = -[DAAccountChangeUpdaterAccountStoreWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (void)addAccount:(id)a3 withCompletionHandler:(id)a4
{
  -[ACAccountStore saveAccount:withCompletionHandler:](self->_store, "saveAccount:withCompletionHandler:", a3, a4);
}

- (void)updateAccount:(id)a3 withCompletionHandler:(id)a4
{
  -[ACAccountStore saveAccount:withCompletionHandler:](self->_store, "saveAccount:withCompletionHandler:", a3, a4);
}

- (void)removeAccount:(id)a3 completion:(id)a4
{
  -[ACAccountStore removeAccount:withDeleteSync:completion:](self->_store, "removeAccount:withDeleteSync:completion:", a3, 0, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
