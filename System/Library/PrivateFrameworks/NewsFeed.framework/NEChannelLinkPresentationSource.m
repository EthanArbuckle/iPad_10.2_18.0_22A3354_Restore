@implementation NEChannelLinkPresentationSource

- (NEChannelLinkPresentationSource)initWithChannel:(id)a3
{
  id v4;
  NEChannelLinkPresentationSource *v5;
  uint64_t v6;
  NSString *title;
  void *v8;
  void *v9;
  uint64_t v10;
  NSURL *url;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEChannelLinkPresentationSource;
  v5 = -[NEChannelLinkPresentationSource init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nss_NewsURLForTagID:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v10;

  }
  return v5;
}

- (LPLinkMetadata)linkMetadata
{
  NELinkMetadataSource *v3;
  void *v4;
  void *v5;
  NELinkMetadataSource *v6;
  void *v7;

  v3 = [NELinkMetadataSource alloc];
  -[NEChannelLinkPresentationSource title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEChannelLinkPresentationSource url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NELinkMetadataSource initWithTitle:url:image:](v3, "initWithTitle:url:image:", v4, v5, 0);

  -[NELinkMetadataSource linkMetadata](v6, "linkMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (LPLinkMetadata *)v7;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
