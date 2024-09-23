@implementation CNContactStoreContactsFetchResult

- (CNContactStoreContactsFetchResult)initWithContacts:(id)a3
{
  id v4;
  CNContactStoreContactsFetchResult *v5;
  uint64_t v6;
  NSArray *value;
  CNContactStoreContactsFetchResult *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNContactStoreContactsFetchResult;
  v5 = -[CNContactStoreContactsFetchResult init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    value = v5->_value;
    v5->_value = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (NSArray)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
