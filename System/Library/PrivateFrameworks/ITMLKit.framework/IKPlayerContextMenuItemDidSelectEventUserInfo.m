@implementation IKPlayerContextMenuItemDidSelectEventUserInfo

- (IKPlayerContextMenuItemDidSelectEventUserInfo)initWithIdentifier:(id)a3
{
  id v4;
  IKPlayerContextMenuItemDidSelectEventUserInfo *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IKPlayerContextMenuItemDidSelectEventUserInfo;
  v5 = -[IKPlayerContextMenuItemDidSelectEventUserInfo init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

  }
  return v5;
}

- (NSDictionary)properties
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("identifier"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
