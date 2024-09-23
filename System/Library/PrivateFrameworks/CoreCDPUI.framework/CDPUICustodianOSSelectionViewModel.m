@implementation CDPUICustodianOSSelectionViewModel

- (id)copyWithZone:(_NSZone *)a3
{
  CDPUICustodianOSSelectionViewModel *v4;
  uint64_t v5;
  NSString *title;
  uint64_t v7;
  NSString *message;
  uint64_t v9;
  UIImage *icon;
  uint64_t v11;
  NSArray *escapeOffers;
  uint64_t v13;
  NSArray *options;

  v4 = -[CDPUICustodianOSSelectionViewModel init](+[CDPUICustodianOSSelectionViewModel allocWithZone:](CDPUICustodianOSSelectionViewModel, "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_title, "copy");
  title = v4->_title;
  v4->_title = (NSString *)v5;

  v7 = -[NSString copy](self->_message, "copy");
  message = v4->_message;
  v4->_message = (NSString *)v7;

  v9 = -[UIImage copy](self->_icon, "copy");
  icon = v4->_icon;
  v4->_icon = (UIImage *)v9;

  v4->_tableViewStyle = self->_tableViewStyle;
  v11 = -[NSArray copy](self->_escapeOffers, "copy");
  escapeOffers = v4->_escapeOffers;
  v4->_escapeOffers = (NSArray *)v11;

  v13 = -[NSArray copy](self->_options, "copy");
  options = v4->_options;
  v4->_options = (NSArray *)v13;

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

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (int64_t)tableViewStyle
{
  return self->_tableViewStyle;
}

- (void)setTableViewStyle:(int64_t)a3
{
  self->_tableViewStyle = a3;
}

- (NSArray)escapeOffers
{
  return self->_escapeOffers;
}

- (void)setEscapeOffers:(id)a3
{
  objc_storeStrong((id *)&self->_escapeOffers, a3);
}

- (NSArray)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_escapeOffers, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
