@implementation HFPlaybackArchive

- (HFPlaybackArchive)initWithMediaPlayerPlaybackArchive:(id)a3
{
  id v5;
  HFPlaybackArchive *v6;
  HFPlaybackArchive *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFPlaybackArchive;
  v6 = -[HFPlaybackArchive init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mediaPlayerPlaybackArchive, a3);

  return v7;
}

- (unint64_t)targetOptions
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;

  if (-[HFPlaybackArchive isShuffleEnabled](self, "isShuffleEnabled"))
    v3 = 2;
  else
    v3 = 0;
  v4 = -[HFPlaybackArchive isRepeatEnabled](self, "isRepeatEnabled");
  v5 = 4;
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (void)setTargetOptions:(unint64_t)a3
{
  -[HFPlaybackArchive setShuffleEnabled:](self, "setShuffleEnabled:", (a3 >> 1) & 1);
  -[HFPlaybackArchive setRepeatEnabled:](self, "setRepeatEnabled:", (a3 >> 2) & 1);
}

- (BOOL)isShuffleSupported
{
  void *v2;
  unint64_t v3;

  -[HFPlaybackArchive mediaPlayerPlaybackArchive](self, "mediaPlayerPlaybackArchive");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "supportedOptions") >> 1) & 1;

  return v3;
}

- (BOOL)isShuffleEnabled
{
  void *v2;
  char v3;

  -[HFPlaybackArchive mediaPlayerPlaybackArchive](self, "mediaPlayerPlaybackArchive");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValueForOption:", 1);

  return v3;
}

- (void)setShuffleEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HFPlaybackArchive mediaPlayerPlaybackArchive](self, "mediaPlayerPlaybackArchive");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBOOLValue:forOption:", v3, 1);

}

- (BOOL)isRepeatSupported
{
  void *v2;
  unint64_t v3;

  -[HFPlaybackArchive mediaPlayerPlaybackArchive](self, "mediaPlayerPlaybackArchive");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "supportedOptions") >> 2) & 1;

  return v3;
}

- (BOOL)isRepeatEnabled
{
  void *v2;
  char v3;

  -[HFPlaybackArchive mediaPlayerPlaybackArchive](self, "mediaPlayerPlaybackArchive");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValueForOption:", 2);

  return v3;
}

- (void)setRepeatEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HFPlaybackArchive mediaPlayerPlaybackArchive](self, "mediaPlayerPlaybackArchive");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBOOLValue:forOption:", v3, 2);

}

- (void)setAutoPlayEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HFPlaybackArchive mediaPlayerPlaybackArchive](self, "mediaPlayerPlaybackArchive");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBOOLValue:forOption:", v3, 3);

}

- (NSData)artworkImageData
{
  NSData *artworkImageData;
  NSData *v3;
  void *v4;
  void *v5;

  artworkImageData = self->_artworkImageData;
  if (artworkImageData)
  {
    v3 = artworkImageData;
  }
  else
  {
    -[HFPlaybackArchive mediaPlayerPlaybackArchive](self, "mediaPlayerPlaybackArchive");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "artworkImageData");
    v3 = (NSData *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (MPPlaybackArchive)mediaPlayerPlaybackArchive
{
  return self->_mediaPlayerPlaybackArchive;
}

- (void)setMediaPlayerPlaybackArchive:(id)a3
{
  objc_storeStrong((id *)&self->_mediaPlayerPlaybackArchive, a3);
}

- (BOOL)isAutoPlayEnabled
{
  return self->_autoPlayEnabled;
}

- (void)setArtworkImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkImageData, 0);
  objc_storeStrong((id *)&self->_mediaPlayerPlaybackArchive, 0);
}

@end
