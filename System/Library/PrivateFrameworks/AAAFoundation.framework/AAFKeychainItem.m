@implementation AAFKeychainItem

- (NSData)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (AAFKeychainItemDescriptor)descriptor
{
  return self->_descriptor;
}

- (AAFKeychainItem)initWithAttributes:(id)a3
{
  id v4;
  AAFKeychainItem *v5;
  AAFKeychainItemDescriptor *v6;
  AAFKeychainItemDescriptor *descriptor;
  uint64_t v8;
  NSData *value;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AAFKeychainItem;
  v5 = -[AAFKeychainItem init](&v11, sel_init);
  if (v5)
  {
    v6 = -[AAFKeychainItemDescriptor initWithAttributes:]([AAFKeychainItemDescriptor alloc], "initWithAttributes:", v4);
    descriptor = v5->_descriptor;
    v5->_descriptor = v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70D8]);
    v8 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSData *)v8;

  }
  return v5;
}

- (AAFKeychainItem)initWithDescriptor:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  AAFKeychainItem *v9;
  AAFKeychainItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAFKeychainItem;
  v9 = -[AAFKeychainItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_descriptor, a3);
    objc_storeStrong((id *)&v10->_value, a4);
  }

  return v10;
}

- (id)itemAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AAFKeychainItem descriptor](self, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_value, *MEMORY[0x1E0CD70D8]);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

@end
