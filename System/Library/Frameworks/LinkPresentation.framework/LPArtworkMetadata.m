@implementation LPArtworkMetadata

- (LPArtworkMetadata)init
{
  LPArtworkMetadata *v2;
  LPArtworkMetadata *v3;
  LPArtworkMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LPArtworkMetadata;
  v2 = -[LPArtworkMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    v4 = v2;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPArtworkMetadata)initWithCoder:(id)a3
{
  id v4;
  LPArtworkMetadata *v5;
  uint64_t v6;
  NSURL *URL;
  uint64_t v8;
  uint64_t v9;
  NSDictionary *colors;
  LPArtworkMetadata *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LPArtworkMetadata;
  v5 = -[LPArtworkMetadata init](&v13, sel_init);
  if (v5)
  {
    v5->_version = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("version"));
    decodeURLForKey(v4, CFSTR("URL"));
    v6 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    v8 = objc_opt_class();
    objc_msgSend(v4, "_lp_strictlyDecodeDictionaryOfObjectsWithKeysOfClass:andObjectsOfClass:forKey:", v8, objc_opt_class(), CFSTR("colors"));
    v9 = objc_claimAutoreleasedReturnValue();
    colors = v5->_colors;
    v5->_colors = (NSDictionary *)v9;

    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(v4, "_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_URL, CFSTR("URL"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_colors, CFSTR("colors"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPArtworkMetadata *v4;
  void *v5;
  void *v6;
  LPArtworkMetadata *v7;

  v4 = +[LPArtworkMetadata allocWithZone:](LPArtworkMetadata, "allocWithZone:", a3);
  if (v4)
  {
    v4->_version = -[LPArtworkMetadata version](self, "version");
    -[LPArtworkMetadata URL](self, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPArtworkMetadata setURL:](v4, "setURL:", v5);

    -[LPArtworkMetadata colors](self, "colors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPArtworkMetadata setColors:](v4, "setColors:", v6);

    v7 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  void **v6;
  void **v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LPArtworkMetadata;
  if (-[LPArtworkMetadata isEqual:](&v9, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      v7 = v6;
      if (*((_DWORD *)v6 + 2) == self->_version && (objectsAreEqual_0(v6[2], self->_URL) & 1) != 0)
        v5 = objectsAreEqual_0(v7[3], self->_colors);
      else
        v5 = 0;

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSURL hash](self->_URL, "hash");
}

- (unsigned)version
{
  return self->_version;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)colors
{
  return self->_colors;
}

- (void)setColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
