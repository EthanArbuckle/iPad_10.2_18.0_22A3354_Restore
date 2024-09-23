@implementation FCPublisherVideoContentFeature

- (FCPublisherVideoContentFeature)init
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
  -[FCPublisherVideoContentFeature initWithPublisherTagID:](self, "initWithPublisherTagID:", &stru_1E464BC40);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPublisherVideoContentFeature init]";
    v9 = 2080;
    v10 = "FCPersonalizationFeature.m";
    v11 = 1024;
    v12 = 593;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPublisherVideoContentFeature init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCPublisherVideoContentFeature)initWithPublisherTagID:(id)a3
{
  id v5;
  FCPublisherVideoContentFeature *v6;
  FCPublisherVideoContentFeature *v7;
  uint64_t v8;
  NSString *personalizationIdentifier;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCPublisherVideoContentFeature;
  v6 = -[FCPersonalizationFeature init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->super._tagID, a3);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("f9"), CFSTR("+"), v5);
    v8 = objc_claimAutoreleasedReturnValue();
    personalizationIdentifier = v7->super._personalizationIdentifier;
    v7->super._personalizationIdentifier = (NSString *)v8;

  }
  return v7;
}

- (FCPublisherVideoContentFeature)initWithPersonalizationIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  FCPublisherVideoContentFeature *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "rangeOfString:", CFSTR("+"));
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "substringWithRange:", v5 + v6, objc_msgSend(v4, "length") - (v5 + v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[FCPublisherVideoContentFeature initWithPublisherTagID:](self, "initWithPublisherTagID:", v8);

    v7 = self;
  }

  return v7;
}

@end
