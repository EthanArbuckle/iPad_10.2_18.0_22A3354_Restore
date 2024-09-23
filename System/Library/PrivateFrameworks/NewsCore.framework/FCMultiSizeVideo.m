@implementation FCMultiSizeVideo

- (FCMultiSizeVideo)init
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
    v8 = "-[FCMultiSizeVideo init]";
    v9 = 2080;
    v10 = "FCMultiSizeVideo.m";
    v11 = 1024;
    v12 = 16;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCMultiSizeVideo init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCMultiSizeVideo)initWithConfigDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  FCMultiSizeVideo *v7;

  v4 = a3;
  FCAppConfigurationURLValue(v4, (uint64_t)CFSTR("videoSmall"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationURLValue(v4, (uint64_t)CFSTR("videoLarge"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[FCMultiSizeVideo initWithSmallVideoURL:largeVideoURL:](self, "initWithSmallVideoURL:largeVideoURL:", v5, v6);
  return v7;
}

- (FCMultiSizeVideo)initWithSmallVideoURL:(id)a3 largeVideoURL:(id)a4
{
  id v7;
  id v8;
  FCMultiSizeVideo *v9;
  FCMultiSizeVideo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCMultiSizeVideo;
  v9 = -[FCMultiSizeVideo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_small, a3);
    objc_storeStrong((id *)&v10->_large, a4);
  }

  return v10;
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
    -[FCMultiSizeVideo small](self, "small");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "small");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "nf_object:isEqualToObject:", v8, v9))
    {
      v10 = (void *)MEMORY[0x1E0DE7910];
      -[FCMultiSizeVideo large](self, "large");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "large");
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

  -[FCMultiSizeVideo small](self, "small");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[FCMultiSizeVideo large](self, "large");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSURL)small
{
  return self->_small;
}

- (NSURL)large
{
  return self->_large;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_large, 0);
  objc_storeStrong((id *)&self->_small, 0);
}

@end
