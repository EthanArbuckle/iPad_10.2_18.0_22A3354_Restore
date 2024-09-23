@implementation DIPage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend(v5, "encodeObject:forKey:", self->_attributes, CFSTR("attributes"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_page, CFSTR("pageNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subTitle, CFSTR("subTitle"));

  os_unfair_lock_unlock(p_lock);
}

- (DIPage)initWithCoder:(id)a3
{
  id v4;
  DIPage *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *attributes;
  uint64_t v17;
  NSString *title;
  uint64_t v19;
  NSString *subTitle;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v4 = a3;
  v5 = -[DIPage init](self, "init");
  if (v5)
  {
    v26 = (void *)MEMORY[0x24BDBCF20];
    v25 = objc_opt_class();
    v24 = objc_opt_class();
    v23 = objc_opt_class();
    v22 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v25, v24, v23, v22, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("attributes"));
    v15 = objc_claimAutoreleasedReturnValue();
    attributes = v5->_attributes;
    v5->_attributes = (NSArray *)v15;

    v5->_page = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pageNumber"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v17 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subTitle"));
    v19 = objc_claimAutoreleasedReturnValue();
    subTitle = v5->_subTitle;
    v5->_subTitle = (NSString *)v19;

  }
  return v5;
}

- (DIPage)initWithAttributes:(id)a3 title:(id)a4 subTitle:(id)a5 page:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  DIPage *v14;
  DIPage *v15;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = -[DIPage init](self, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_attributes, a3);
    v15->_page = a6;
    objc_storeStrong((id *)&v15->_title, a4);
    objc_storeStrong((id *)&v15->_subTitle, a5);
  }

  return v15;
}

- (DIPage)init
{
  DIPage *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIPage;
  result = -[DIPage init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)setAttributes:(id)a3
{
  NSArray *v4;
  NSArray *attributes;
  NSArray *v6;

  v6 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_attributes != v6)
  {
    v4 = (NSArray *)-[NSArray copyWithZone:](v6, "copyWithZone:", 0);
    attributes = self->_attributes;
    self->_attributes = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setPage:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_page = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_title != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    title = self->_title;
    self->_title = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setSubTitle:(id)a3
{
  NSString *v4;
  NSString *subTitle;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_subTitle != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    subTitle = self->_subTitle;
    self->_subTitle = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setServerValidationGroup:(id)a3
{
  NSDictionary *v4;
  NSDictionary *serverValidationGroup;
  NSDictionary *v6;

  v6 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_serverValidationGroup != v6)
  {
    v4 = (NSDictionary *)-[NSDictionary copyWithZone:](v6, "copyWithZone:", 0);
    serverValidationGroup = self->_serverValidationGroup;
    self->_serverValidationGroup = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSArray)attributes
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_attributes;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)page
{
  os_unfair_lock_s *p_lock;
  unint64_t page;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  page = self->_page;
  os_unfair_lock_unlock(p_lock);
  return page;
}

- (NSString)title
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_title;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)subTitle
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_subTitle;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSDictionary)serverValidationGroup
{
  os_unfair_lock_s *p_lock;
  NSDictionary *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_serverValidationGroup;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)description
{
  void *v3;
  os_unfair_lock_s *p_lock;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p;"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v3, "appendFormat:", CFSTR("page: '%lu'; "), self->_page);
  objc_msgSend(v3, "appendFormat:", CFSTR("title: '%@'; "), self->_title);
  objc_msgSend(v3, "appendFormat:", CFSTR("subTitle: '%@'; "), self->_subTitle);
  objc_msgSend(v3, "appendFormat:", CFSTR("attributes: \n"));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_attributes;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("    attribute: '%@'\n"), v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverValidationGroup, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
