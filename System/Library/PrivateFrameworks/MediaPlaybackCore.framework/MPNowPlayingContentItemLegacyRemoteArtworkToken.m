@implementation MPNowPlayingContentItemLegacyRemoteArtworkToken

- (MPNowPlayingContentItemLegacyRemoteArtworkToken)initWithIdentifier:(id)a3 artworkProperties:(id)a4 artworkIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPNowPlayingContentItemLegacyRemoteArtworkToken *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  MPExportableArtworkProperties *artworkProperties;
  uint64_t v16;
  NSString *artworkIdentifier;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MPNowPlayingContentItemLegacyRemoteArtworkToken;
  v11 = -[MPNowPlayingContentItemLegacyRemoteArtworkToken init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    artworkProperties = v11->_artworkProperties;
    v11->_artworkProperties = (MPExportableArtworkProperties *)v14;

    v16 = objc_msgSend(v10, "copy");
    artworkIdentifier = v11->_artworkIdentifier;
    v11->_artworkIdentifier = (NSString *)v16;

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  MPNowPlayingContentItemLegacyRemoteArtworkToken *v4;
  MPNowPlayingContentItemLegacyRemoteArtworkToken *v5;
  BOOL v6;

  v4 = (MPNowPlayingContentItemLegacyRemoteArtworkToken *)a3;
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
      v6 = -[NSString isEqualToString:](self->_identifier, "isEqualToString:", v5->_identifier)
        && -[MPExportableArtworkProperties isEqual:](self->_artworkProperties, "isEqual:", v5->_artworkProperties)&& -[NSString isEqualToString:](self->_artworkIdentifier, "isEqualToString:", v5->_artworkIdentifier);

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
  MPNowPlayingContentItemLegacyRemoteArtworkToken *v4;
  void *v5;
  void *v6;
  void *v7;
  MPNowPlayingContentItemLegacyRemoteArtworkToken *v8;

  v4 = [MPNowPlayingContentItemLegacyRemoteArtworkToken alloc];
  -[MPNowPlayingContentItemLegacyRemoteArtworkToken identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPNowPlayingContentItemLegacyRemoteArtworkToken artworkProperties](self, "artworkProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPNowPlayingContentItemLegacyRemoteArtworkToken artworkIdentifier](self, "artworkIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MPNowPlayingContentItemLegacyRemoteArtworkToken initWithIdentifier:artworkProperties:artworkIdentifier:](v4, "initWithIdentifier:artworkProperties:artworkIdentifier:", v5, v6, v7);

  return v8;
}

- (id)stringRepresentation
{
  void *v2;
  void *v3;

  -[MPNowPlayingContentItemLegacyRemoteArtworkToken artworkIdentifier](self, "artworkIdentifier");
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

- (MPExportableArtworkProperties)artworkProperties
{
  return self->_artworkProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkProperties, 0);
  objc_storeStrong((id *)&self->_artworkIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
