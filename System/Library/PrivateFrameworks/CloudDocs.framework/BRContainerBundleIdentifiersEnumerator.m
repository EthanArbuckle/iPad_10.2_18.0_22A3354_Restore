@implementation BRContainerBundleIdentifiersEnumerator

- (id)nextObject
{
  void *v3;
  __int128 v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  __int128 v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[NSEnumerator nextObject](self->_enumerator, "nextObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    *(_QWORD *)&v4 = 138412290;
    v9 = v4;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend(v3, "isEqualToString:", CFSTR("BRContainerIcons")) & 1) == 0)
      {
        if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.bird")))
          return v3;
        brc_bread_crumbs((uint64_t)"-[BRContainerBundleIdentifiersEnumerator nextObject]", 206);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v9;
          v11 = v5;
          _os_log_impl(&dword_19CBF0000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring bundle com.apple.bird%@", buf, 0xCu);
        }

      }
      -[NSEnumerator nextObject](self->_enumerator, "nextObject", v9);
      v7 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v7;
    }
    while (v7);
  }
  return v3;
}

- (BRContainerBundleIdentifiersEnumerator)initWithContainerPlist:(id)a3
{
  id v4;
  BRContainerBundleIdentifiersEnumerator *v5;
  uint64_t v6;
  NSEnumerator *enumerator;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRContainerBundleIdentifiersEnumerator;
  v5 = -[BRContainerBundleIdentifiersEnumerator init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "keyEnumerator");
    v6 = objc_claimAutoreleasedReturnValue();
    enumerator = v5->_enumerator;
    v5->_enumerator = (NSEnumerator *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumerator, 0);
}

@end
