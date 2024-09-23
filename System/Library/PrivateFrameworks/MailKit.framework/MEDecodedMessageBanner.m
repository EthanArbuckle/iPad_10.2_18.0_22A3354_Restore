@implementation MEDecodedMessageBanner

- (MEDecodedMessageBanner)initWithTitle:(NSString *)title primaryActionTitle:(NSString *)primaryActionTitle dismissable:(BOOL)dismissable
{
  NSString *v9;
  NSString *v10;
  MEDecodedMessageBanner *v11;
  MEDecodedMessageBanner *v12;
  objc_super v14;

  v9 = title;
  v10 = primaryActionTitle;
  v14.receiver = self;
  v14.super_class = (Class)MEDecodedMessageBanner;
  v11 = -[MEDecodedMessageBanner init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, title);
    objc_storeStrong((id *)&v12->_primaryActionTitle, primaryActionTitle);
    v12->_dismissable = dismissable;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEDecodedMessageBanner)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MEDecodedMessageBanner *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_primaryActionTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MEDecodedMessageBanner initWithTitle:primaryActionTitle:dismissable:](self, "initWithTitle:primaryActionTitle:dismissable:", v5, v6, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_dismissable")));

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MEDecodedMessageBanner title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_title"));

  -[MEDecodedMessageBanner primaryActionTitle](self, "primaryActionTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_primaryActionTitle"));

  objc_msgSend(v6, "encodeBool:forKey:", -[MEDecodedMessageBanner isDismissable](self, "isDismissable"), CFSTR("EFPropertyKey_dismissable"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  if ((objc_msgSend(v5, "isEqual:", objc_opt_class()) & 1) != 0)
  {
    v6 = v4;
    -[MEDecodedMessageBanner title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[MEDecodedMessageBanner primaryActionTitle](self, "primaryActionTitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "primaryActionTitle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;

  -[MEDecodedMessageBanner title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return 33 * v4 + -[MEDecodedMessageBanner isDismissable](self, "isDismissable") + 1089;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)primaryActionTitle
{
  return self->_primaryActionTitle;
}

- (BOOL)isDismissable
{
  return self->_dismissable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryActionTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
