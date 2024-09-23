@implementation FCMagazineGenre

- (FCMagazineGenre)init
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
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCMagazineGenre init]";
    v9 = 2080;
    v10 = "FCMagazineGenre.m";
    v11 = 1024;
    v12 = 24;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCMagazineGenre init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCMagazineGenre)initWithConfigDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  FCMagazineGenre *v7;

  v4 = a3;
  FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("genre"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("localizedDescription"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[FCMagazineGenre initWithGenre:localizedDescription:](self, "initWithGenre:localizedDescription:", v5, v6);
  return v7;
}

- (FCMagazineGenre)initWithGenre:(id)a3 localizedDescription:(id)a4
{
  id v6;
  id v7;
  FCMagazineGenre *v8;
  uint64_t v9;
  NSString *genre;
  uint64_t v11;
  NSString *localizedDescription;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCMagazineGenre;
  v8 = -[FCMagazineGenre init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    genre = v8->_genre;
    v8->_genre = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    localizedDescription = v8->_localizedDescription;
    v8->_localizedDescription = (NSString *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0DE7910];
    -[FCMagazineGenre genre](self, "genre");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "genre");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "nf_object:isEqualToObject:", v8, v9))
    {
      v10 = (void *)MEMORY[0x1E0DE7910];
      -[FCMagazineGenre localizedDescription](self, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "nf_object:isEqualToObject:", v11, v12);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[FCMagazineGenre genre](self, "genre");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[FCMagazineGenre localizedDescription](self, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

+ (id)magazineGenreWithGenre:(id)a3 localizedDescription:(id)a4
{
  id v5;
  id v6;
  FCMagazineGenre *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[FCMagazineGenre initWithGenre:localizedDescription:]([FCMagazineGenre alloc], "initWithGenre:localizedDescription:", v6, v5);

  return v7;
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_genre, 0);
}

@end
