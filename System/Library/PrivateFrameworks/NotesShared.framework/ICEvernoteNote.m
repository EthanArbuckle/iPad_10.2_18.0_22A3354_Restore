@implementation ICEvernoteNote

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICEvernoteNote)init
{
  ICEvernoteNote *v2;
  ICEvernoteNote *v3;
  NSArray *tags;
  NSArray *v5;
  NSArray *resources;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICEvernoteNote;
  v2 = -[ICEvernoteNote init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    tags = v2->_tags;
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_tags = (NSArray *)MEMORY[0x1E0C9AA60];

    resources = v3->_resources;
    v3->_resources = v5;

  }
  return v3;
}

- (ICEvernoteNote)initWithCoder:(id)a3
{
  id v4;
  ICEvernoteNote *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *content;
  uint64_t v10;
  NSDate *created;
  uint64_t v12;
  NSDate *updated;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *tags;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSArray *resources;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ICEvernoteNote;
  v5 = -[ICEvernoteNote init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("content"));
    v8 = objc_claimAutoreleasedReturnValue();
    content = v5->_content;
    v5->_content = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("created"));
    v10 = objc_claimAutoreleasedReturnValue();
    created = v5->_created;
    v5->_created = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updated"));
    v12 = objc_claimAutoreleasedReturnValue();
    updated = v5->_updated;
    v5->_updated = (NSDate *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("tags"));
    v17 = objc_claimAutoreleasedReturnValue();
    tags = v5->_tags;
    v5->_tags = (NSArray *)v17;

    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("resources"));
    v22 = objc_claimAutoreleasedReturnValue();
    resources = v5->_resources;
    v5->_resources = (NSArray *)v22;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[ICEvernoteNote title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[ICEvernoteNote content](self, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("content"));

  -[ICEvernoteNote created](self, "created");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("created"));

  -[ICEvernoteNote updated](self, "updated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("updated"));

  -[ICEvernoteNote tags](self, "tags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("tags"));

  -[ICEvernoteNote resources](self, "resources");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("resources"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ICEvernoteNote title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICEvernoteNote content](self, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("title: %@\ncontent: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)created
{
  return self->_created;
}

- (void)setCreated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)updated
{
  return self->_updated;
}

- (void)setUpdated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)tags
{
  return self->_tags;
}

- (void)setTags:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)resources
{
  return self->_resources;
}

- (void)setResources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
