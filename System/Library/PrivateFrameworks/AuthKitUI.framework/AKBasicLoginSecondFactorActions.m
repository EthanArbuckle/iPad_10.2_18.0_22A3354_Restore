@implementation AKBasicLoginSecondFactorActions

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = objc_msgSend(self->_regenerateCodeAction, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = objc_msgSend(self->_codeEnteredAction, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = objc_msgSend(self->_ak_cancelAction, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  return v4;
}

- (id)regenerateCodeAction
{
  return self->_regenerateCodeAction;
}

- (void)setRegenerateCodeAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)codeEnteredAction
{
  return self->_codeEnteredAction;
}

- (void)setCodeEnteredAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)ak_cancelAction
{
  return self->_ak_cancelAction;
}

- (void)setAk_cancelAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_ak_cancelAction, 0);
  objc_storeStrong(&self->_codeEnteredAction, 0);
  objc_storeStrong(&self->_regenerateCodeAction, 0);
}

@end
