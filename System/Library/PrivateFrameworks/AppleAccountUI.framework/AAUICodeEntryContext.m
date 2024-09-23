@implementation AAUICodeEntryContext

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
  uint64_t v15;
  void *v16;

  v4 = (_QWORD *)objc_opt_new();
  v5 = -[NSString copy](self->_promptTitle, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSString copy](self->_promptMessage, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSString copy](self->_escapeTitle, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  v11 = objc_msgSend(self->_escapeAction, "copy");
  v12 = (void *)v4[4];
  v4[4] = v11;

  v13 = objc_msgSend(self->_codeEnteredAction, "copy");
  v14 = (void *)v4[5];
  v4[5] = v13;

  v15 = objc_msgSend(self->_cancelEntryAction, "copy");
  v16 = (void *)v4[6];
  v4[6] = v15;

  return v4;
}

- (NSString)promptTitle
{
  return self->_promptTitle;
}

- (void)setPromptTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)promptMessage
{
  return self->_promptMessage;
}

- (void)setPromptMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)escapeTitle
{
  return self->_escapeTitle;
}

- (void)setEscapeTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)escapeAction
{
  return self->_escapeAction;
}

- (void)setEscapeAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)codeEnteredAction
{
  return self->_codeEnteredAction;
}

- (void)setCodeEnteredAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)cancelEntryAction
{
  return self->_cancelEntryAction;
}

- (void)setCancelEntryAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelEntryAction, 0);
  objc_storeStrong(&self->_codeEnteredAction, 0);
  objc_storeStrong(&self->_escapeAction, 0);
  objc_storeStrong((id *)&self->_escapeTitle, 0);
  objc_storeStrong((id *)&self->_promptMessage, 0);
  objc_storeStrong((id *)&self->_promptTitle, 0);
}

@end
