@implementation _GEOResourceManifestTileSetOverride

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GEOResourceManifestTileSetOverride)init
{
  _GEOResourceManifestTileSetOverride *result;

  result = (_GEOResourceManifestTileSetOverride *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (_GEOResourceManifestTileSetOverride)initWithStyle:(int)a3 size:(int)a4 scale:(int)a5
{
  _GEOResourceManifestTileSetOverride *v8;
  _GEOResourceManifestTileSetOverride *v9;
  _GEOResourceManifestTileSetOverride *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_GEOResourceManifestTileSetOverride;
  v8 = -[_GEOResourceManifestTileSetOverride init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_style = a3;
    v8->_size = a4;
    v8->_scale = a5;
    v10 = v8;
  }

  return v9;
}

- (_GEOResourceManifestTileSetOverride)initWithCoder:(id)a3
{
  id v4;
  _GEOResourceManifestTileSetOverride *v5;
  uint64_t v6;
  NSNumber *version;
  uint64_t v8;
  NSURL *baseURL;
  uint64_t v10;
  NSURL *localizationURL;
  _GEOResourceManifestTileSetOverride *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_GEOResourceManifestTileSetOverride;
  v5 = -[_GEOResourceManifestTileSetOverride init](&v14, sel_init);
  if (v5)
  {
    v5->_style = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("style"));
    v5->_size = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("size"));
    v5->_scale = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("scale"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v6 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizationURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    localizationURL = v5->_localizationURL;
    v5->_localizationURL = (NSURL *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *version;
  NSURL *baseURL;
  NSURL *localizationURL;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeInt32:forKey:", self->_style, CFSTR("style"));
  objc_msgSend(v8, "encodeInt32:forKey:", self->_size, CFSTR("size"));
  objc_msgSend(v8, "encodeInt32:forKey:", self->_scale, CFSTR("scale"));
  version = self->_version;
  if (version)
    objc_msgSend(v8, "encodeObject:forKey:", version, CFSTR("version"));
  baseURL = self->_baseURL;
  if (baseURL)
    objc_msgSend(v8, "encodeObject:forKey:", baseURL, CFSTR("baseURL"));
  localizationURL = self->_localizationURL;
  v7 = v8;
  if (localizationURL)
  {
    objc_msgSend(v8, "encodeObject:forKey:", localizationURL, CFSTR("localizationURL"));
    v7 = v8;
  }

}

- (int)style
{
  return self->_style;
}

- (int)size
{
  return self->_size;
}

- (int)scale
{
  return self->_scale;
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)localizationURL
{
  return self->_localizationURL;
}

- (void)setLocalizationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizationURL, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
