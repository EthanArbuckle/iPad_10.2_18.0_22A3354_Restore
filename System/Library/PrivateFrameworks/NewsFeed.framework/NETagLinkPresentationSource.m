@implementation NETagLinkPresentationSource

- (NETagLinkPresentationSource)initWithTag:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  NETagLinkPresentationSource *v8;
  NELinkMetadataSource *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NELinkMetadataSource *linkMetadataSource;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NETagLinkPresentationSource;
  v8 = -[NETagLinkPresentationSource init](&v17, sel_init);
  if (v8)
  {
    v9 = [NELinkMetadataSource alloc];
    objc_msgSend(v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "nss_NewsURLForTagID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[NELinkMetadataSource initWithTitle:url:image:](v9, "initWithTitle:url:image:", v10, v13, v7);
    linkMetadataSource = v8->_linkMetadataSource;
    v8->_linkMetadataSource = (NELinkMetadataSource *)v14;

  }
  return v8;
}

- (NETagLinkPresentationSource)initWithTitle:(id)a3 url:(id)a4 image:(id)a5
{
  id v8;
  id v9;
  id v10;
  NETagLinkPresentationSource *v11;
  NELinkMetadataSource *v12;
  NELinkMetadataSource *linkMetadataSource;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NETagLinkPresentationSource;
  v11 = -[NETagLinkPresentationSource init](&v15, sel_init);
  if (v11)
  {
    v12 = -[NELinkMetadataSource initWithTitle:url:image:]([NELinkMetadataSource alloc], "initWithTitle:url:image:", v8, v9, v10);
    linkMetadataSource = v11->_linkMetadataSource;
    v11->_linkMetadataSource = v12;

  }
  return v11;
}

- (LPLinkMetadata)linkMetadata
{
  void *v2;
  void *v3;

  -[NETagLinkPresentationSource linkMetadataSource](self, "linkMetadataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "linkMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (LPLinkMetadata *)v3;
}

- (NELinkMetadataSource)linkMetadataSource
{
  return self->_linkMetadataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMetadataSource, 0);
}

@end
