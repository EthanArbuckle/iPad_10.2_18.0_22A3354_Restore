@implementation FCPublisherTopicFeature

- (FCPublisherTopicFeature)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[FCPublisherTopicFeature initWithPublisherTagID:topicTagID:](self, "initWithPublisherTagID:topicTagID:", 0, 0);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPublisherTopicFeature init]";
    v9 = 2080;
    v10 = "FCPersonalizationFeature.m";
    v11 = 1024;
    v12 = 753;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPublisherTopicFeature init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCPublisherTopicFeature)initWithPersonalizationIdentifier:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  FCPublisherTopicFeature *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = objc_msgSend(v4, "rangeOfString:", CFSTR("+"));
  v7 = v6;
  v8 = objc_msgSend(v4, "rangeOfString:options:", CFSTR("+"), 4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL && v8 > v5)
  {
    v13 = v5 + v7;
    v14 = v8 - v13;
    v15 = v8 + v9;
    v16 = objc_msgSend(v4, "length") - (v8 + v9);
    objc_msgSend(v4, "substringWithRange:", v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "substringWithRange:", v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[FCPublisherTopicFeature initWithPublisherTagID:topicTagID:](self, "initWithPublisherTagID:topicTagID:", v17, v18);

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (FCPublisherTopicFeature)initWithPublisherTagID:(id)a3 topicTagID:(id)a4
{
  id v6;
  id v7;
  FCPublisherTopicFeature *v8;
  FCPublisherTopicFeature *v9;
  uint64_t v10;
  NSString *personalizationIdentifier;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FCPublisherTopicFeature;
  v8 = -[FCPersonalizationFeature init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    if (v6)
      -[FCPublisherTopicFeature setPublisherTagID:](v8, "setPublisherTagID:", v6);
    if (v7)
      -[FCPublisherTopicFeature setTopicTagID:](v9, "setTopicTagID:", v7);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@"), CFSTR("f4"), CFSTR("+"), v6, CFSTR("+"), v7);
    v10 = objc_claimAutoreleasedReturnValue();
    personalizationIdentifier = v9->super._personalizationIdentifier;
    v9->super._personalizationIdentifier = (NSString *)v10;

  }
  return v9;
}

- (NSArray)features
{
  FCTagIDFeature *v3;
  void *v4;
  FCTagIDFeature *v5;
  FCTagIDFeature *v6;
  void *v7;
  FCTagIDFeature *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = [FCTagIDFeature alloc];
  -[FCPublisherTopicFeature publisherTagID](self, "publisherTagID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCTagIDFeature initWithTagID:](v3, "initWithTagID:", v4);
  v11[0] = v5;
  v6 = [FCTagIDFeature alloc];
  -[FCPublisherTopicFeature topicTagID](self, "topicTagID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCTagIDFeature initWithTagID:](v6, "initWithTagID:", v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (NSString)publisherTagID
{
  return self->_publisherTagID;
}

- (void)setPublisherTagID:(id)a3
{
  objc_storeStrong((id *)&self->_publisherTagID, a3);
}

- (NSString)topicTagID
{
  return self->_topicTagID;
}

- (void)setTopicTagID:(id)a3
{
  objc_storeStrong((id *)&self->_topicTagID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicTagID, 0);
  objc_storeStrong((id *)&self->_publisherTagID, 0);
}

@end
