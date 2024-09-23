@implementation CRKBLBookItem

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CRKBLBookItem title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKBLBookItem author](self, "author");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKBLBookItem path](self, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKBLBookItem storeIdentifier](self, "storeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKBLBookItem identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKBLBookItem legacyUniqueIdentifier](self, "legacyUniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCRKBookType(-[CRKBLBookItem type](self, "type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Title: %@\nAuthor: %@\nPath: %@\nStore Identifier: %@\n Identifier: %@\nLegacy Identifier: %@\nType: %@"), v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)legacyUniqueIdentifier
{
  return self->_legacyUniqueIdentifier;
}

- (void)setLegacyUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
