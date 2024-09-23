@implementation MPArtworkConfiguration

void __45__MPArtworkConfiguration_systemConfiguration__block_invoke()
{
  MPArtworkConfiguration *v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MPArtworkConfiguration);
  v1 = (void *)systemConfiguration___systemConfiguration;
  systemConfiguration___systemConfiguration = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0D51200], "systemConfiguration");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)systemConfiguration___systemConfiguration, "setArtworkConfiguration:", v2);

}

- (void)setArtworkConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_artworkConfiguration, a3);
}

- (id)supportedSizesForMediaType:(unint64_t)a3 artworkType:(int64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;

  v6 = MLMediaTypeForMPMediaType(a3);
  -[MPArtworkConfiguration artworkConfiguration](self, "artworkConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "supportedSizesForMediaType:artworkType:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (ML3ArtworkConfiguration)artworkConfiguration
{
  return self->_artworkConfiguration;
}

+ (id)systemConfiguration
{
  if (systemConfiguration_onceToken != -1)
    dispatch_once(&systemConfiguration_onceToken, &__block_literal_global_48840);
  return (id)systemConfiguration___systemConfiguration;
}

- (MPArtworkConfiguration)initWithConfigurationDictionaries:(id)a3
{
  id v4;
  MPArtworkConfiguration *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPArtworkConfiguration;
  v5 = -[MPArtworkConfiguration init](&v8, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D51200]), "initWithConfigurationDictionaries:", v4);
    -[MPArtworkConfiguration setArtworkConfiguration:](v5, "setArtworkConfiguration:", v6);

  }
  return v5;
}

- (id)sizesToAutogenerateForMediaType:(unint64_t)a3 artworkType:(int64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;

  v6 = MLMediaTypeForMPMediaType(a3);
  -[MPArtworkConfiguration artworkConfiguration](self, "artworkConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizesToAutogenerateForMediaType:artworkType:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MPArtworkConfiguration artworkConfiguration](self, "artworkConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %@>\n"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkConfiguration, 0);
}

@end
