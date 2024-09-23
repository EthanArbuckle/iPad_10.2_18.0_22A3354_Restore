@implementation CDPUIInfoViewModel

- (id)copyWithZone:(_NSZone *)a3
{
  CDPUIInfoViewModel *v4;
  uint64_t v5;
  NSString *title;
  uint64_t v7;
  NSString *message;
  uint64_t v9;
  CDPEscapeOption *option1;
  uint64_t v11;
  CDPEscapeOption *option2;

  v4 = -[CDPUIInfoViewModel init](+[CDPUIInfoViewModel allocWithZone:](CDPUIInfoViewModel, "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_title, "copy");
  title = v4->_title;
  v4->_title = (NSString *)v5;

  v7 = -[NSString copy](self->_message, "copy");
  message = v4->_message;
  v4->_message = (NSString *)v7;

  v9 = -[CDPEscapeOption copy](self->_option1, "copy");
  option1 = v4->_option1;
  v4->_option1 = (CDPEscapeOption *)v9;

  v11 = -[CDPEscapeOption copy](self->_option2, "copy");
  option2 = v4->_option2;
  v4->_option2 = (CDPEscapeOption *)v11;

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CDPEscapeOption)option1
{
  return self->_option1;
}

- (void)setOption1:(id)a3
{
  objc_storeStrong((id *)&self->_option1, a3);
}

- (CDPEscapeOption)option2
{
  return self->_option2;
}

- (void)setOption2:(id)a3
{
  objc_storeStrong((id *)&self->_option2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_option2, 0);
  objc_storeStrong((id *)&self->_option1, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
