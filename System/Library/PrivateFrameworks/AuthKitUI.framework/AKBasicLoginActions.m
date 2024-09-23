@implementation AKBasicLoginActions

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = objc_msgSend(self->_authenticateAction, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = objc_msgSend(self->_ak_cancelAction, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = objc_msgSend(self->_createIDAction, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  v11 = objc_msgSend(self->_useIDAction, "copy");
  v12 = (void *)v4[4];
  v4[4] = v11;

  v13 = objc_msgSend(self->_forgotPasswordAction, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (id)authenticateAction
{
  return self->_authenticateAction;
}

- (void)setAuthenticateAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)ak_cancelAction
{
  return self->_ak_cancelAction;
}

- (void)setAk_cancelAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)createIDAction
{
  return self->_createIDAction;
}

- (void)setCreateIDAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)useIDAction
{
  return self->_useIDAction;
}

- (void)setUseIDAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)forgotIDAction
{
  return self->_forgotIDAction;
}

- (void)setForgotIDAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)forgotPasswordAction
{
  return self->_forgotPasswordAction;
}

- (void)setForgotPasswordAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_forgotPasswordAction, 0);
  objc_storeStrong(&self->_forgotIDAction, 0);
  objc_storeStrong(&self->_useIDAction, 0);
  objc_storeStrong(&self->_createIDAction, 0);
  objc_storeStrong(&self->_ak_cancelAction, 0);
  objc_storeStrong(&self->_authenticateAction, 0);
}

@end
