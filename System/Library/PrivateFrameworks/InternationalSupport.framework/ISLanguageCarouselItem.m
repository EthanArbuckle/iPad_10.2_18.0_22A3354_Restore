@implementation ISLanguageCarouselItem

- (ISLanguageCarouselItem)initWithLocale:(id)a3 data:(id)a4
{
  id v6;
  void *v7;
  ISLanguageCarouselItem *v8;

  v6 = a4;
  objc_msgSend(a3, "languageIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ISLanguageCarouselItem initWithLanguageIdentifier:data:](self, "initWithLanguageIdentifier:data:", v7, v6);

  return v8;
}

- (ISLanguageCarouselItem)initWithLanguageIdentifier:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  ISLanguageCarouselItem *v8;
  ISLanguageCarouselItem *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ISLanguageCarouselItem;
  v8 = -[ISLanguageCarouselItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ISLanguageCarouselItem setLanguageIdentifier:](v8, "setLanguageIdentifier:", v6);
    -[ISLanguageCarouselItem setData:](v9, "setData:", v7);
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ISLanguageCarouselItem;
  -[ISLanguageCarouselItem description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISLanguageCarouselItem languageIdentifier](self, "languageIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISLanguageCarouselItem data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", language = %@, data = %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSLocale)locale
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DC8];
  -[ISLanguageCarouselItem languageIdentifier](self, "languageIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeWithLocaleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSLocale *)v4;
}

- (NSString)languageIdentifier
{
  return self->_languageIdentifier;
}

- (void)setLanguageIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_languageIdentifier, a3);
}

- (id)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong(&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_data, 0);
  objc_storeStrong((id *)&self->_languageIdentifier, 0);
}

@end
