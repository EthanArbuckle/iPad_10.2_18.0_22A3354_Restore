@implementation SUUIUber

- (SUUIUber)initWithUberDictionary:(id)a3
{
  id v4;
  SUUIUber *v5;
  void *v6;
  uint64_t v7;
  SUUIArtworkProviding *artworkProvider;
  void *v9;
  uint64_t v10;
  NSString *text;
  SUUIColorScheme *v12;
  SUUIColorScheme *colorScheme;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUIUber;
  v5 = -[SUUIUber init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("masterArt"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUUIArtworkProvidingFactory artworkProviderForStoreResponse:](SUUIArtworkProvidingFactory, "artworkProviderForStoreResponse:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    artworkProvider = v5->_artworkProvider;
    v5->_artworkProvider = (SUUIArtworkProviding *)v7;

    objc_msgSend(v4, "objectForKey:", CFSTR("description"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "copy");
      text = v5->_text;
      v5->_text = (NSString *)v10;

    }
    v12 = -[SUUIColorScheme initWithColorSchemeDictionary:]([SUUIColorScheme alloc], "initWithColorSchemeDictionary:", v4);
    colorScheme = v5->_colorScheme;
    v5->_colorScheme = v12;

  }
  return v5;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (NSString)text
{
  return self->_text;
}

- (SUUIArtworkProviding)artworkProvider
{
  return self->_artworkProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkProvider, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
}

@end
