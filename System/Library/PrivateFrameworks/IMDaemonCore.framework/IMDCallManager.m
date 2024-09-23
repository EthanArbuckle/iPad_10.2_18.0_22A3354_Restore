@implementation IMDCallManager

- (IMDCallManager)initWithServiceSession:(id)a3
{
  id v4;
  IMDCallManager *v5;
  IMDCallManager_Impl *v6;
  IMDCallManager_Impl *swiftImpl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMDCallManager;
  v5 = -[IMDCallManager init](&v9, sel_init);
  if (v5)
  {
    v6 = -[IMDCallManager_Impl initWithServiceSession:]([IMDCallManager_Impl alloc], "initWithServiceSession:", v4);
    swiftImpl = v5->_swiftImpl;
    v5->_swiftImpl = v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftImpl, 0);
}

@end
