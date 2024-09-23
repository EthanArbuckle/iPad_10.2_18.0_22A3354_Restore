@implementation SUUILibraryItem

- (NSNumber)storeItemIdentifier
{
  void *v2;
  void *v3;

  -[SUUILibraryItem storeIdentifier](self, "storeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_storeFlavorIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[SUUIStoreIdentifier copyWithZone:](self->_storeIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)SUUILibraryItem;
  -[SUUILibraryItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [%@, %@]"), v4, self->_storeIdentifier, self->_storeFlavorIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;

  -[SUUILibraryItem storeItemIdentifier](self, "storeItemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_storeFlavorIdentifier, "hash") ^ v4;
  v6 = v5 ^ -[SUUIStoreIdentifier hash](self->_storeIdentifier, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  char v6;
  SUUIStoreIdentifier *storeIdentifier;
  NSString *storeFlavorIdentifier;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class()
    && (storeIdentifier = self->_storeIdentifier) != 0
    && (storeIdentifier == (SUUIStoreIdentifier *)v4[1] || -[SUUIStoreIdentifier isEqual:](storeIdentifier, "isEqual:")))
  {
    storeFlavorIdentifier = self->_storeFlavorIdentifier;
    if (storeFlavorIdentifier == (NSString *)v4[2])
      v6 = 1;
    else
      v6 = -[NSString isEqualToString:](storeFlavorIdentifier, "isEqualToString:");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (SUUIStoreIdentifier)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)storeFlavorIdentifier
{
  return self->_storeFlavorIdentifier;
}

- (void)setStoreFlavorIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeFlavorIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
}

@end
