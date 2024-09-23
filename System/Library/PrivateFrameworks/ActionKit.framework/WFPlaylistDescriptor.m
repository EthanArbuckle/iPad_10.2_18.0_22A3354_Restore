@implementation WFPlaylistDescriptor

- (WFPlaylistDescriptor)initWithEntireMusicLibrary
{
  WFPlaylistDescriptor *v2;
  WFPlaylistDescriptor *v3;
  WFPlaylistDescriptor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFPlaylistDescriptor;
  v2 = -[WFPlaylistDescriptor init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_entireMusicLibrary = 1;
    v4 = v2;
  }

  return v3;
}

- (WFPlaylistDescriptor)initWithPlaylistName:(id)a3 persistentIdentifier:(id)a4
{
  id v6;
  id v7;
  WFPlaylistDescriptor *v8;
  uint64_t v9;
  NSString *playlistName;
  WFPlaylistDescriptor *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFPlaylistDescriptor;
  v8 = -[WFPlaylistDescriptor init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    playlistName = v8->_playlistName;
    v8->_playlistName = (NSString *)v9;

    objc_storeStrong((id *)&v8->_persistentIdentifier, a4);
    v11 = v8;
  }

  return v8;
}

- (WFPlaylistDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WFPlaylistDescriptor *v8;
  WFPlaylistDescriptor *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playlistName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("persistentIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entireMusicLibrary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "BOOLValue"))
    v8 = -[WFPlaylistDescriptor initWithEntireMusicLibrary](self, "initWithEntireMusicLibrary");
  else
    v8 = -[WFPlaylistDescriptor initWithPlaylistName:persistentIdentifier:](self, "initWithPlaylistName:persistentIdentifier:", v5, v6);
  v9 = v8;

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFPlaylistDescriptor playlistName](self, "playlistName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("playlistName"));

  -[WFPlaylistDescriptor persistentIdentifier](self, "persistentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("persistentIdentifier"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[WFPlaylistDescriptor entireMusicLibrary](self, "entireMusicLibrary"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("entireMusicLibrary"));

}

- (BOOL)isEqual:(id)a3
{
  WFPlaylistDescriptor *v4;
  WFPlaylistDescriptor *v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;

  v4 = (WFPlaylistDescriptor *)a3;
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
      if (-[WFPlaylistDescriptor entireMusicLibrary](v5, "entireMusicLibrary")
        && -[WFPlaylistDescriptor entireMusicLibrary](self, "entireMusicLibrary"))
      {
        goto LABEL_5;
      }
      -[WFPlaylistDescriptor playlistName](v5, "playlistName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFPlaylistDescriptor playlistName](self, "playlistName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) != (v8 != 0))
      {
        -[WFPlaylistDescriptor playlistName](v5, "playlistName");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          -[WFPlaylistDescriptor playlistName](v5, "playlistName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFPlaylistDescriptor playlistName](self, "playlistName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqualToString:", v12);

          if (!v13)
            goto LABEL_18;
        }
        else
        {

        }
        -[WFPlaylistDescriptor persistentIdentifier](v5, "persistentIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFPlaylistDescriptor persistentIdentifier](self, "persistentIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) != (v8 != 0))
        {
          -[WFPlaylistDescriptor persistentIdentifier](v5, "persistentIdentifier");
          v14 = objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = (void *)v14;
            -[WFPlaylistDescriptor persistentIdentifier](v5, "persistentIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFPlaylistDescriptor persistentIdentifier](self, "persistentIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v16, "isEqualToNumber:", v17);

            if ((v18 & 1) == 0)
              goto LABEL_18;
          }
          else
          {

          }
LABEL_5:
          v6 = 1;
LABEL_19:

          goto LABEL_20;
        }
      }

LABEL_18:
      v6 = 0;
      goto LABEL_19;
    }
    v6 = 0;
  }
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  if (-[WFPlaylistDescriptor entireMusicLibrary](self, "entireMusicLibrary"))
    v3 = 3405691582;
  else
    v3 = 3133065982;
  -[WFPlaylistDescriptor playlistName](self, "playlistName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[WFPlaylistDescriptor persistentIdentifier](self, "persistentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;

  return v7;
}

- (BOOL)entireMusicLibrary
{
  return self->_entireMusicLibrary;
}

- (NSString)playlistName
{
  return self->_playlistName;
}

- (NSNumber)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_playlistName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
