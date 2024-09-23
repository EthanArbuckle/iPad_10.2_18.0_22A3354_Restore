@implementation SUUIVideo

- (SUUIVideo)initWithVideoDictionary:(id)a3
{
  id v4;
  SUUIVideo *v5;
  void *v6;
  uint64_t v7;
  SUUIArtworkProviding *artworks;
  void *v9;
  uint64_t v10;
  void *url;
  uint64_t v12;
  NSURL *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUIVideo;
  v5 = -[SUUIVideo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("previewFrame"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUUIArtworkProvidingFactory artworkProviderForStoreResponse:](SUUIArtworkProvidingFactory, "artworkProviderForStoreResponse:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    artworks = v5->_artworks;
    v5->_artworks = (SUUIArtworkProviding *)v7;

    objc_msgSend(v4, "objectForKey:", CFSTR("video"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v9);
      url = v5->_url;
      v5->_url = (NSURL *)v10;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_8:

        goto LABEL_9;
      }
      objc_msgSend(v9, "objectForKey:", CFSTR("url"));
      url = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", url);
        v13 = v5->_url;
        v5->_url = (NSURL *)v12;

      }
    }

    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (SUUIArtworkProviding)artworks
{
  return self->_artworks;
}

- (NSURL)URL
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_artworks, 0);
}

@end
