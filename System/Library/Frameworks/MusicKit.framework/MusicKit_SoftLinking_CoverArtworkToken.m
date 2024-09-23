@implementation MusicKit_SoftLinking_CoverArtworkToken

- (MusicKit_SoftLinking_CoverArtworkToken)initWithCoverArtworkRecipe:(id)a3 playlistName:(id)a4
{
  id v7;
  id v8;
  MusicKit_SoftLinking_CoverArtworkToken *v9;
  MusicKit_SoftLinking_CoverArtworkToken *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MusicKit_SoftLinking_CoverArtworkToken;
  v9 = -[MusicKit_SoftLinking_CoverArtworkToken init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coverArtworkRecipe, a3);
    objc_storeStrong((id *)&v10->_playlistName, a4);
  }

  return v10;
}

- (NSString)stringRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[MusicKit_SoftLinking_CoverArtworkRecipe stringRepresentation](self->_coverArtworkRecipe, "stringRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("rawCoverArtworkRecipe: %@, playlistName: %@"), v4, self->_playlistName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (MusicKit_SoftLinking_CoverArtworkRecipe)coverArtworkRecipe
{
  return self->_coverArtworkRecipe;
}

- (NSString)playlistName
{
  return self->_playlistName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playlistName, 0);
  objc_storeStrong((id *)&self->_coverArtworkRecipe, 0);
}

@end
