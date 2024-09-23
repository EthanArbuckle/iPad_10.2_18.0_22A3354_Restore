@implementation FPTestingIngestion

- (FPTestingIngestion)initWithOperationIdentifier:(id)a3 itemIdentifier:(id)a4 item:(id)a5
{
  id v9;
  id v10;
  FPTestingIngestion *v11;
  FPTestingIngestion *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FPTestingIngestion;
  v11 = -[FPTestingOperation initWithOperationIdentifier:](&v14, sel_initWithOperationIdentifier_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_itemIdentifier, a4);
    objc_storeStrong((id *)&v12->_item, a5);
  }

  return v12;
}

- (int64_t)type
{
  return 0;
}

- (unint64_t)side
{
  return -[NSString hasPrefix:](self->_itemIdentifier, "hasPrefix:", CFSTR("__fp/fs/")) ^ 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FPTestingIngestion;
  v4 = a3;
  -[FPTestingOperation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_itemIdentifier, CFSTR("_itemIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_item, CFSTR("_item"));

}

- (FPTestingIngestion)initWithCoder:(id)a3
{
  id v4;
  FPTestingIngestion *v5;
  uint64_t v6;
  NSString *itemIdentifier;
  uint64_t v8;
  NSFileProviderItem *item;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPTestingIngestion;
  v5 = -[FPTestingOperation initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_itemIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_item"));
    v8 = objc_claimAutoreleasedReturnValue();
    item = v5->_item;
    v5->_item = (NSFileProviderItem *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSFileProviderItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
