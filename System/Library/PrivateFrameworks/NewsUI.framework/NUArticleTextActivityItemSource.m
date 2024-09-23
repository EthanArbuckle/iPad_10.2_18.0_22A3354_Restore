@implementation NUArticleTextActivityItemSource

- (NUArticleTextActivityItemSource)initWithHeadline:(id)a3
{
  id v4;
  NUArticleTextActivityItemSource *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *itemTitle;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NUArticleTextActivityItemSource;
  v5 = -[NUArticleActivityItemSource initWithHeadline:](&v18, sel_initWithHeadline_, v4);
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6
      && (v7 = (void *)v6,
          objc_msgSend(v4, "sourceName"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          v8))
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v4, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sourceName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ - %@"), v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      itemTitle = v5->_itemTitle;
      v5->_itemTitle = (NSString *)v12;

    }
    else
    {
      objc_msgSend(v4, "title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v4, "title");
        v15 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v4, "sourceName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          v10 = v5->_itemTitle;
          v5->_itemTitle = (NSString *)&stru_24D5A3F98;
          goto LABEL_10;
        }
        objc_msgSend(v4, "sourceName");
        v15 = objc_claimAutoreleasedReturnValue();
      }
      v10 = v5->_itemTitle;
      v5->_itemTitle = (NSString *)v15;
    }
LABEL_10:

  }
  return v5;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5;
  __CFString *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDF7498]) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDF7480]) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDF74A8]) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDF7488]) & 1) != 0)
  {
    v6 = &stru_24D5A3F98;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilenotes.SharingExtension")))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUArticleTextActivityItemSource itemTitle](self, "itemTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[NUArticleTextActivityItemSource itemTitle](self, "itemTitle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("article-title"));

    }
    -[NUArticleActivityItemSource headline](self, "headline");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shortExcerpt");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[NUArticleActivityItemSource headline](self, "headline");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shortExcerpt");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("article-summary"));

    }
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NUArticleTextActivityItemSource itemTitle](self, "itemTitle");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("com.apple.mobilenotes.SharingExtension")) & 1) != 0)
    return CFSTR("com.apple.news.notes-metadata");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NUArticleTextActivityItemSource activityViewController:dataTypeIdentifierForActivityType:].cold.1();
  return &stru_24D5A3F98;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v5 = a4;
  -[NUArticleTextActivityItemSource itemTitle](self, "itemTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDF7488]);

  if (v7)
  {
    -[NUArticleActivityItemSource headline](self, "headline");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "title");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
LABEL_5:

      return v6;
    }
    v10 = (void *)v9;
    -[NUArticleActivityItemSource headline](self, "headline");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sourceName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
      -[NUArticleActivityItemSource headline](self, "headline");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sourceName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUArticleActivityItemSource headline](self, "headline");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "title");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: %@"), v14, v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v17;
      goto LABEL_5;
    }
  }
  return v6;
}

- (NSString)itemTitle
{
  return self->_itemTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemTitle, 0);
}

- (void)activityViewController:dataTypeIdentifierForActivityType:.cold.1()
{
  void *v0;
  int v1;
  const char *v2;
  __int16 v3;
  char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("case not implemented"));
  v1 = 136315906;
  v2 = "-[NUArticleTextActivityItemSource activityViewController:dataTypeIdentifierForActivityType:]";
  v3 = 2080;
  v4 = "NUArticleTextActivityItemSource.m";
  v5 = 1024;
  v6 = 86;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_216817000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);

}

@end
