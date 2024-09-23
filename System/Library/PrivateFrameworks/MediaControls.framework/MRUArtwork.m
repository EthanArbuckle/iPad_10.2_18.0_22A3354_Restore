@implementation MRUArtwork

- (MRUArtwork)initWithMPCResponse:(id)a3
{
  id v5;
  MRUArtwork *v6;
  MRUArtwork *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUArtwork;
  v6 = -[MRUArtwork init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_response, a3);

  return v7;
}

- (MRUArtwork)initWithImage:(id)a3
{
  id v5;
  MRUArtwork *v6;
  MRUArtwork *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUArtwork;
  v6 = -[MRUArtwork init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_image, a3);

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MRUArtwork catalog](self, "catalog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ catalog: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  MRUArtwork *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (MRUArtwork *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MRUArtwork catalog](v4, "catalog");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "visualIdenticalityIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRUArtwork catalog](self, "catalog");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "visualIdenticalityIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v8)
        v9 = 1;
      else
        v9 = objc_msgSend(v6, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (MPArtworkCatalog)catalog
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (self->_image)
  {
    objc_msgSend(MEMORY[0x1E0CC2328], "staticArtworkCatalogWithImage:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MPCPlayerResponse tracklist](self->_response, "tracklist");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "playingItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadataObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "song");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "artworkCatalog");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (MPArtworkCatalog *)v2;
}

- (MPCPlayerResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

@end
