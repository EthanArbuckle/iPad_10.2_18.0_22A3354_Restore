@implementation CNContactSection

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[CNContactSection title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  v6 = -[CNContactSection range](self, "range");
  objc_msgSend(v4, "setRange:", v6, v7);
  -[CNContactSection identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v8);

  -[CNContactSection sortKey](self, "sortKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortKey:", v9);

  return v4;
}

- (NSString)sortKey
{
  return self->_sortKey;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setSortKey:(id)a3
{
  objc_storeStrong((id *)&self->_sortKey, a3);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (id)description
{
  void *v3;
  NSString *title;
  NSString *identifier;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0D13A08];
  title = self->_title;
  identifier = self->_identifier;
  NSStringFromRange(self->_range);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForObject:withNamesAndObjects:", self, CFSTR("title"), title, CFSTR("identifier"), identifier, CFSTR("range"), v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
