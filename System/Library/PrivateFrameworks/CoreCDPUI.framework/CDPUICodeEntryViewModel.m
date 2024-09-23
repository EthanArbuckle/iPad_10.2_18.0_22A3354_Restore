@implementation CDPUICodeEntryViewModel

- (id)copyWithZone:(_NSZone *)a3
{
  CDPUICodeEntryViewModel *v4;
  uint64_t v5;
  NSString *promptTitle;
  uint64_t v7;
  NSString *promptMessage;
  uint64_t v9;
  id codeEnteredAction;

  v4 = -[CDPUICodeEntryViewModel init](+[CDPUICodeEntryViewModel allocWithZone:](CDPUICodeEntryViewModel, "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_promptTitle, "copy");
  promptTitle = v4->_promptTitle;
  v4->_promptTitle = (NSString *)v5;

  v7 = -[NSString copy](self->_promptMessage, "copy");
  promptMessage = v4->_promptMessage;
  v4->_promptMessage = (NSString *)v7;

  v9 = objc_msgSend(self->_codeEnteredAction, "copy");
  codeEnteredAction = v4->_codeEnteredAction;
  v4->_codeEnteredAction = (id)v9;

  objc_storeStrong((id *)&v4->_escapeOffer, self->_escapeOffer);
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

- (CDPRemoteValidationEscapeOffer)escapeOffer
{
  return self->_escapeOffer;
}

- (void)setEscapeOffer:(id)a3
{
  objc_storeStrong((id *)&self->_escapeOffer, a3);
}

- (id)codeEnteredAction
{
  return self->_codeEnteredAction;
}

- (void)setCodeEnteredAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_codeEnteredAction, 0);
  objc_storeStrong((id *)&self->_escapeOffer, 0);
  objc_storeStrong((id *)&self->_promptMessage, 0);
  objc_storeStrong((id *)&self->_promptTitle, 0);
}

@end
