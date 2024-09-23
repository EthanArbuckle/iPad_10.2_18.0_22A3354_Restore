@implementation NUArticleURLActivityItemSource

- (NUArticleURLActivityItemSource)initWithHeadline:(id)a3 URLModifier:(id)a4
{
  id v6;
  id v7;
  NUArticleURLActivityItemSource *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSURL *v17;
  uint64_t v18;
  NSURL *articleURL;
  void *v20;
  uint64_t v21;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)NUArticleURLActivityItemSource;
  v8 = -[NUArticleActivityItemSource initWithHeadline:](&v23, sel_initWithHeadline_, v6);
  if (v8)
  {
    objc_msgSend(v6, "articleID");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(v6, "sourceChannel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isPublic");

      if (v12)
      {
        v13 = (void *)MEMORY[0x24BDBCF48];
        v14 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v6, "articleID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("https://apple.news/%@"), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "URLWithString:", v16);
        v17 = (NSURL *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(v7, "modifyURL:", v17);
          v18 = objc_claimAutoreleasedReturnValue();

          v17 = (NSURL *)v18;
        }
        articleURL = v8->_articleURL;
        v8->_articleURL = v17;
        goto LABEL_9;
      }
    }
    objc_msgSend(v6, "contentURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v6, "contentURL");
      v21 = objc_claimAutoreleasedReturnValue();
      articleURL = v8->_articleURL;
      v8->_articleURL = (NSURL *)v21;
LABEL_9:

    }
  }

  return v8;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDF7468]) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.news.activity.OpenInSafari")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.news.activity.AddToSafariReadingList")))
  {
    -[NUArticleActivityItemSource headline](self, "headline");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDF7488]))
      -[NUArticleURLActivityItemSource bodyStringForMailMessage](self, "bodyStringForMailMessage");
    else
      -[NUArticleURLActivityItemSource articleURL](self, "articleURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)bodyStringForMailMessage
{
  NUHTMLBuilder *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NUHTMLBuilder *v11;
  id v12;
  id v13;
  NUHTMLBuilder *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  NUHTMLBuilder *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;

  v3 = objc_alloc_init(NUHTMLBuilder);
  -[NUArticleActivityItemSource headline](self, "headline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NUHTMLBuilder appendStrong:](v3, "appendStrong:", v5);

  v7 = -[NUHTMLBuilder appendBreak](v3, "appendBreak");
  -[NUArticleActivityItemSource headline](self, "headline");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sourceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NUHTMLBuilder appendText:](v3, "appendText:", v9);

  v11 = objc_alloc_init(NUHTMLBuilder);
  v12 = -[NUHTMLBuilder appendBreak](v11, "appendBreak");
  v13 = -[NUHTMLBuilder appendParagraph:](v11, "appendParagraph:", v3);
  v14 = objc_alloc_init(NUHTMLBuilder);
  -[NUArticleActivityItemSource headline](self, "headline");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "shortExcerpt");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[NUArticleActivityItemSource headline](self, "headline");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "shortExcerpt");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[NUHTMLBuilder appendText:](v14, "appendText:", v18);

    v20 = -[NUHTMLBuilder appendText:](v14, "appendText:", CFSTR(" "));
  }
  NUBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Read the full story"), &stru_24D5A3F98, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleURLActivityItemSource articleURL](self, "articleURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "absoluteString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[NUHTMLBuilder appendLink:withURL:](v14, "appendLink:withURL:", v22, v24);

  v26 = -[NUHTMLBuilder appendParagraph:](v11, "appendParagraph:", v14);
  -[NUArticleActivityItemSource headline](self, "headline");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sourceChannel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = objc_msgSend(v28, "isPublic");

  if ((_DWORD)v22)
  {
    v29 = objc_alloc_init(NUHTMLBuilder);
    objc_msgSend(MEMORY[0x24BDBCF48], "nss_MarketingPageURL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "absoluteString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = -[NUHTMLBuilder appendBreak](v29, "appendBreak");
    NUBundle();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Shared from"), &stru_24D5A3F98, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[NUHTMLBuilder appendText:](v29, "appendText:", v34);

    v36 = -[NUHTMLBuilder appendText:](v29, "appendText:", CFSTR(" "));
    NUBundle();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Apple News"), &stru_24D5A3F98, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[NUHTMLBuilder appendLink:withURL:](v29, "appendLink:withURL:", v38, v31);

    v40 = -[NUHTMLBuilder appendParagraph:](v11, "appendParagraph:", v29);
  }
  -[NUHTMLBuilder fullHTML](v11, "fullHTML");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (NSURL)articleURL
{
  return self->_articleURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleURL, 0);
}

@end
