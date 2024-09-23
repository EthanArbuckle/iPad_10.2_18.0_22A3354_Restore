@implementation CKIMSimulatedAccount

- (void)setLoginHandle:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_loginHandle, a3);
  v5 = a3;
  objc_msgSend(v5, "ID");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[CKIMSimulatedAccount setLogin:](self, "setLogin:", v6);
}

- (IMHandle)loginHandle
{
  return self->_loginHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loginHandle, 0);
}

@end
