@implementation CDPUIPiggybackingViewModel

- (id)copyWithZone:(_NSZone *)a3
{
  CDPUIPiggybackingViewModel *v4;
  uint64_t v5;
  NSString *iconName;
  uint64_t v7;
  NSString *title;
  uint64_t v9;
  NSString *message;
  uint64_t v11;
  NSString *footer;
  uint64_t v13;
  CDPEscapeOption *sendCodeOption;
  uint64_t v15;
  CDPRemoteValidationEscapeOffer *cantGetToDeviceOption;

  v4 = -[CDPUIPiggybackingViewModel init](+[CDPUIPiggybackingViewModel allocWithZone:](CDPUIPiggybackingViewModel, "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_iconName, "copy");
  iconName = v4->_iconName;
  v4->_iconName = (NSString *)v5;

  v7 = -[NSString copy](self->_title, "copy");
  title = v4->_title;
  v4->_title = (NSString *)v7;

  v9 = -[NSString copy](self->_message, "copy");
  message = v4->_message;
  v4->_message = (NSString *)v9;

  v11 = -[NSString copy](self->_footer, "copy");
  footer = v4->_footer;
  v4->_footer = (NSString *)v11;

  v13 = -[CDPEscapeOption copy](self->_sendCodeOption, "copy");
  sendCodeOption = v4->_sendCodeOption;
  v4->_sendCodeOption = (CDPEscapeOption *)v13;

  v15 = -[CDPRemoteValidationEscapeOffer copy](self->_cantGetToDeviceOption, "copy");
  cantGetToDeviceOption = v4->_cantGetToDeviceOption;
  v4->_cantGetToDeviceOption = (CDPRemoteValidationEscapeOffer *)v15;

  return v4;
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setIconName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CDPEscapeOption)sendCodeOption
{
  return self->_sendCodeOption;
}

- (void)setSendCodeOption:(id)a3
{
  objc_storeStrong((id *)&self->_sendCodeOption, a3);
}

- (CDPRemoteValidationEscapeOffer)cantGetToDeviceOption
{
  return self->_cantGetToDeviceOption;
}

- (void)setCantGetToDeviceOption:(id)a3
{
  objc_storeStrong((id *)&self->_cantGetToDeviceOption, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cantGetToDeviceOption, 0);
  objc_storeStrong((id *)&self->_sendCodeOption, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_iconName, 0);
}

@end
