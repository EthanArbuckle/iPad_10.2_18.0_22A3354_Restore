@implementation IKAppKeyboardHint

- (IKAppKeyboardHint)initWithBadge:(id)a3 text:(id)a4 searchTerm:(id)a5
{
  id v8;
  id v9;
  id v10;
  IKAppKeyboardHint *v11;
  uint64_t v12;
  NSString *badge;
  uint64_t v14;
  NSString *text;
  uint64_t v16;
  NSString *searchTerm;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)IKAppKeyboardHint;
  v11 = -[IKAppKeyboardHint init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    badge = v11->_badge;
    v11->_badge = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    text = v11->_text;
    v11->_text = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    searchTerm = v11->_searchTerm;
    v11->_searchTerm = (NSString *)v16;

  }
  return v11;
}

- (NSString)badge
{
  return self->_badge;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_badge, 0);
}

@end
