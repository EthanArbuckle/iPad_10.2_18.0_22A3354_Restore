@implementation CNUICoreContactPropertyFilterBuilder

+ (CNUICoreContactPropertyFilterBuilder)managedContactsFilterBuilder
{
  CNUICoreContactPropertyFilterBuilder *v2;

  v2 = objc_alloc_init(CNUICoreContactPropertyFilterBuilder);
  -[CNUICoreContactPropertyFilterBuilder setExcludeNickname:](v2, "setExcludeNickname:", 1);
  -[CNUICoreContactPropertyFilterBuilder setExcludePhoto:](v2, "setExcludePhoto:", 1);
  -[CNUICoreContactPropertyFilterBuilder setExcludeNote:](v2, "setExcludeNote:", 1);
  -[CNUICoreContactPropertyFilterBuilder setExcludeRelationships:](v2, "setExcludeRelationships:", 1);
  return v2;
}

+ (CNUICoreContactPropertyFilterBuilder)whitelistedContactsFilterBuilder
{
  CNUICoreContactPropertyFilterBuilder *v2;

  v2 = objc_alloc_init(CNUICoreContactPropertyFilterBuilder);
  -[CNUICoreContactPropertyFilterBuilder setExcludeNickname:](v2, "setExcludeNickname:", 1);
  -[CNUICoreContactPropertyFilterBuilder setExcludePhoto:](v2, "setExcludePhoto:", 0);
  -[CNUICoreContactPropertyFilterBuilder setExcludeNote:](v2, "setExcludeNote:", 1);
  -[CNUICoreContactPropertyFilterBuilder setExcludeRelationships:](v2, "setExcludeRelationships:", 1);
  return v2;
}

- (id)build
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNUICoreContactPropertyFilterBuilder excludeNickname](self, "excludeNickname"))
  {
    +[CNUICoreContactPropertyValueFilterFactory nicknameFilter](CNUICoreContactPropertyValueFilterFactory, "nicknameFilter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  if (-[CNUICoreContactPropertyFilterBuilder excludePhoto](self, "excludePhoto"))
  {
    +[CNUICoreContactPropertyValueFilterFactory photoFilter](CNUICoreContactPropertyValueFilterFactory, "photoFilter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  if (-[CNUICoreContactPropertyFilterBuilder excludeNote](self, "excludeNote"))
  {
    +[CNUICoreContactPropertyValueFilterFactory noteFilter](CNUICoreContactPropertyValueFilterFactory, "noteFilter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  if (-[CNUICoreContactPropertyFilterBuilder excludeRelationships](self, "excludeRelationships"))
  {
    +[CNUICoreContactPropertyValueFilterFactory relationshipsFilter](CNUICoreContactPropertyValueFilterFactory, "relationshipsFilter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  +[CNUICoreContactPropertyValueFilterFactory aggregatePropertyValueFilterWithValueFilters:](CNUICoreContactPropertyValueFilterFactory, "aggregatePropertyValueFilterWithValueFilters:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)excludeNickname
{
  return self->_excludeNickname;
}

- (void)setExcludeNickname:(BOOL)a3
{
  self->_excludeNickname = a3;
}

- (BOOL)excludePhoto
{
  return self->_excludePhoto;
}

- (void)setExcludePhoto:(BOOL)a3
{
  self->_excludePhoto = a3;
}

- (BOOL)excludeNote
{
  return self->_excludeNote;
}

- (void)setExcludeNote:(BOOL)a3
{
  self->_excludeNote = a3;
}

- (BOOL)excludeRelationships
{
  return self->_excludeRelationships;
}

- (void)setExcludeRelationships:(BOOL)a3
{
  self->_excludeRelationships = a3;
}

@end
