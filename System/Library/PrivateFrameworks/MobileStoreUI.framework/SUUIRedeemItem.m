@implementation SUUIRedeemItem

- (_NSRange)ageBandRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = 0x7FFFFFFFFFFFFFFFLL;
  v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)artworkURLForSize:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SUUIRedeemItem artworks](self, "artworks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artworkURLForSize:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)largestArtworkURL
{
  void *v2;
  void *v3;
  void *v4;

  -[SUUIRedeemItem artworks](self, "artworks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "largestArtwork");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUUIRedeemItem)initWithCoder:(id)a3
{
  id v4;
  SUUIRedeemItem *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIRedeemItem;
  v5 = -[SUUIRedeemItem init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItem setTitle:](v5, "setTitle:", v6);

    -[SUUIItem setItemIdentifier:](v5, "setItemIdentifier:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("itemIdentifier")));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("artworks"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRedeemItem setArtworks:](v5, "setArtworks:", v7);

    -[SUUIItem setItemKind:](v5, "setItemKind:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("itemKind")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SUUIItem title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("title"));

  objc_msgSend(v6, "encodeInt64:forKey:", -[SUUIItem itemIdentifier](self, "itemIdentifier"), CFSTR("itemIdentifier"));
  -[SUUIRedeemItem artworks](self, "artworks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("artworks"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[SUUIItem itemKind](self, "itemKind"), CFSTR("itemKind"));
}

- (SUUIArtworkProviding)artworks
{
  return self->_artworks;
}

- (void)setArtworks:(id)a3
{
  objc_storeStrong((id *)&self->_artworks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworks, 0);
}

@end
