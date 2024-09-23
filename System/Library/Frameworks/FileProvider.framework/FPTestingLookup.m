@implementation FPTestingLookup

- (FPTestingLookup)initWithOperationIdentifier:(id)a3 itemIdentifier:(id)a4
{
  id v7;
  FPTestingLookup *v8;
  FPTestingLookup *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FPTestingLookup;
  v8 = -[FPTestingOperation initWithOperationIdentifier:](&v11, sel_initWithOperationIdentifier_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_itemIdentifier, a4);

  return v9;
}

- (int64_t)type
{
  return 1;
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
  v5.super_class = (Class)FPTestingLookup;
  v4 = a3;
  -[FPTestingOperation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_itemIdentifier, CFSTR("_itemIdentifier"), v5.receiver, v5.super_class);

}

- (FPTestingLookup)initWithCoder:(id)a3
{
  id v4;
  FPTestingLookup *v5;
  uint64_t v6;
  NSString *itemIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPTestingLookup;
  v5 = -[FPTestingOperation initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_itemIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
