@implementation NUArticleContentSizeManager

- (NUArticleContentSizeManager)initWithTagSettings:(id)a3
{
  id v5;
  NUArticleContentSizeManager *v6;
  NUArticleContentSizeManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUArticleContentSizeManager;
  v6 = -[NUArticleContentSizeManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_tagSettings, a3);

  return v7;
}

- (id)contentSizeCategoryForArticle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "role") == 2)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "sourceChannel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NUArticleContentSizeManager tagSettings](self, "tagSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fontSizeForTagID:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[NUArticleContentSizeManager contentSizeCategoryForSize:](self, "contentSizeCategoryForSize:", objc_msgSend(v9, "integerValue"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)updateContentSizeCategory:(id)a3 forArticle:(id)a4
{
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(a4, "sourceChannel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[NUArticleContentSizeManager textSizeForContentSizeCategory:](self, "textSizeForContentSizeCategory:", v13);
    -[NUArticleContentSizeManager tagSettings](self, "tagSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFontSizeForTagID:fontSize:", v9, v10);

    -[NUArticleContentSizeManager tagSettings](self, "tagSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "syncForTagID:", v12);

  }
}

- (int64_t)contentScaleForArticle:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "role") == 2)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "sourceChannel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NUArticleContentSizeManager tagSettings](self, "tagSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentScaleForTagID:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v9, "unsignedIntegerValue");

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)updateContentScale:(int64_t)a3 forArticle:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(a4, "sourceChannel");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[NUArticleContentSizeManager tagSettings](self, "tagSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentScaleForTagID:contentScale:", v7, v8);

    -[NUArticleContentSizeManager tagSettings](self, "tagSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "syncForTagID:", v10);

  }
}

- (id)contentSizeCategoryForSize:(int64_t)a3
{
  id *v3;

  if ((unint64_t)(a3 - 1) > 0xB)
    v3 = (id *)MEMORY[0x24BDF76A0];
  else
    v3 = (id *)qword_24D5A3A38[a3 - 1];
  return *v3;
}

- (int64_t)textSizeForContentSizeCategory:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF7690]) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF76B8]) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF76A8]) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF76A0]) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF7688]) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF7680]) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF7678]) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF7660]) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF7658]) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF7650]) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF7648]) & 1) != 0)
  {
    v4 = 11;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDF7640]))
  {
    v4 = 12;
  }
  else
  {
    v4 = 4;
  }

  return v4;
}

- (FCTagSettings)tagSettings
{
  return self->_tagSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagSettings, 0);
}

@end
