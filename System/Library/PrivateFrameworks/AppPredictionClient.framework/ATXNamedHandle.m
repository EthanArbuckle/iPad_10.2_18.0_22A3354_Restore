@implementation ATXNamedHandle

- (ATXNamedHandle)initWithName:(id)a3 handle:(id)a4 contactIdentifier:(id)a5 handleType:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ATXNamedHandle *v14;
  uint64_t v15;
  NSString *name;
  uint64_t v17;
  NSString *handle;
  uint64_t v19;
  NSString *contactIdentifier;
  uint64_t v21;
  NSString *handleType;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)ATXNamedHandle;
  v14 = -[ATXNamedHandle init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    name = v14->_name;
    v14->_name = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    handle = v14->_handle;
    v14->_handle = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    contactIdentifier = v14->_contactIdentifier;
    v14->_contactIdentifier = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    handleType = v14->_handleType;
    v14->_handleType = (NSString *)v21;

  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[ATXNamedHandle name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[ATXNamedHandle handle](self, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("handle"));

  -[ATXNamedHandle contactIdentifier](self, "contactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("contactIdentifier"));

  -[ATXNamedHandle handleType](self, "handleType");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("handleType"));

}

- (ATXNamedHandle)initWithCoder:(id)a3
{
  id v4;
  ATXNamedHandle *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *handle;
  uint64_t v10;
  NSString *contactIdentifier;
  uint64_t v12;
  NSString *handleType;
  ATXNamedHandle *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ATXNamedHandle;
  v5 = -[ATXNamedHandle init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handle"));
    v8 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handleType"));
    v12 = objc_claimAutoreleasedReturnValue();
    handleType = v5->_handleType;
    v5->_handleType = (NSString *)v12;

    v14 = v5;
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)handleType
{
  return self->_handleType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleType, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
