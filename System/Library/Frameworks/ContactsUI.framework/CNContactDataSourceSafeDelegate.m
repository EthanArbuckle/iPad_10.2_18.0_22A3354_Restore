@implementation CNContactDataSourceSafeDelegate

- (CNContactDataSourceSafeDelegate)initWithDelegate:(id)a3
{
  id v4;
  CNContactDataSourceSafeDelegate *v5;
  CNContactDataSourceSafeDelegate *v6;
  CNContactDataSourceSafeDelegate *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNContactDataSourceSafeDelegate;
  v5 = -[CNContactDataSourceSafeDelegate init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = v6;
  }

  return v6;
}

- (void)contactDataSourceDidChange:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CNContactDataSourceSafeDelegate delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNContactDataSourceSafeDelegate delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactDataSourceDidChange:", v7);

  }
}

- (CNContactDataSourceDelegate)delegate
{
  return (CNContactDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
