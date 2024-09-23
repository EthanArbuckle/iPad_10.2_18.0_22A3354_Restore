@implementation MPCMRContentItemArtworkDataToken

- (MPCMRContentItemArtworkDataToken)initWithIdentifier:(id)a3 artworkIdentifier:(id)a4
{
  id v6;
  id v7;
  MPCMRContentItemArtworkDataToken *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSString *artworkIdentifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MPCMRContentItemArtworkDataToken;
  v8 = -[MPCMRContentItemArtworkDataToken init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    artworkIdentifier = v8->_artworkIdentifier;
    v8->_artworkIdentifier = (NSString *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  MPCMRContentItemArtworkDataToken *v4;
  MPCMRContentItemArtworkDataToken *v5;
  char v6;

  v4 = (MPCMRContentItemArtworkDataToken *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSString isEqual:](self->_identifier, "isEqual:", v5->_identifier))
        v6 = -[NSString isEqual:](self->_artworkIdentifier, "isEqual:", v5->_artworkIdentifier);
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPCMRContentItemArtworkDataToken *v4;
  void *v5;
  void *v6;
  MPCMRContentItemArtworkDataToken *v7;

  v4 = [MPCMRContentItemArtworkDataToken alloc];
  -[MPCMRContentItemArtworkDataToken identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCMRContentItemArtworkDataToken artworkIdentifier](self, "artworkIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPCMRContentItemArtworkDataToken initWithIdentifier:artworkIdentifier:](v4, "initWithIdentifier:artworkIdentifier:", v5, v6);

  return v7;
}

- (id)stringRepresentation
{
  void *v2;
  void *v3;

  -[MPCMRContentItemArtworkDataToken artworkIdentifier](self, "artworkIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
