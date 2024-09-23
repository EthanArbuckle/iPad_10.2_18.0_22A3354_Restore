@implementation MPMusicPlayerControllerNowPlaying

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  MPMediaItem *item;
  id v5;

  item = self->_item;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", item, CFSTR("item"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_audioFormat, CFSTR("audioFormat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemIdentifier, CFSTR("itemID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_artworkIdentifier, CFSTR("artworkID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_index, CFSTR("idx"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_count, CFSTR("count"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_itemUID, CFSTR("uid"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_audioFormat, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

+ (MPMusicPlayerControllerNowPlaying)nowPlayingWithItem:(id)a3 itemIdentifier:(id)a4 itemUID:(unint64_t)a5 artworkIdentifier:(id)a6 audioFormat:(id)a7 index:(int64_t)a8 count:(int64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_init");
  v20 = (void *)v19[1];
  v19[1] = v15;
  v21 = v15;

  v22 = (void *)v19[2];
  v19[2] = v18;
  v23 = v18;

  v24 = (void *)v19[3];
  v19[3] = v16;
  v25 = v16;

  v26 = (void *)v19[5];
  v19[4] = a5;
  v19[5] = v17;

  v19[6] = a8;
  v19[7] = a9;
  return (MPMusicPlayerControllerNowPlaying *)v19;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPMusicPlayerControllerNowPlaying;
  return -[MPMusicPlayerControllerNowPlaying init](&v3, sel_init);
}

- (MPMusicPlayerControllerNowPlaying)initWithCoder:(id)a3
{
  id v4;
  MPMusicPlayerControllerNowPlaying *v5;
  uint64_t v6;
  MPMediaItem *item;
  uint64_t v8;
  MPNowPlayingInfoAudioFormat *audioFormat;
  uint64_t v10;
  NSString *itemIdentifier;
  uint64_t v12;
  NSString *artworkIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MPMusicPlayerControllerNowPlaying;
  v5 = -[MPMusicPlayerControllerNowPlaying init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("item"));
    v6 = objc_claimAutoreleasedReturnValue();
    item = v5->_item;
    v5->_item = (MPMediaItem *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioFormat"));
    v8 = objc_claimAutoreleasedReturnValue();
    audioFormat = v5->_audioFormat;
    v5->_audioFormat = (MPNowPlayingInfoAudioFormat *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemID"));
    v10 = objc_claimAutoreleasedReturnValue();
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkID"));
    v12 = objc_claimAutoreleasedReturnValue();
    artworkIdentifier = v5->_artworkIdentifier;
    v5->_artworkIdentifier = (NSString *)v12;

    v5->_index = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("idx"));
    v5->_count = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("count"));
    v5->_itemUID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("uid"));
  }

  return v5;
}

- (MPMediaItem)item
{
  return self->_item;
}

- (MPNowPlayingInfoAudioFormat)audioFormat
{
  return self->_audioFormat;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (unint64_t)itemUID
{
  return self->_itemUID;
}

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

- (int64_t)index
{
  return self->_index;
}

- (int64_t)count
{
  return self->_count;
}

+ (MPMusicPlayerControllerNowPlaying)nowPlayingWithItem:(id)a3 itemIdentifier:(id)a4 artworkIdentifier:(id)a5 index:(int64_t)a6 count:(int64_t)a7
{
  return +[MPMusicPlayerControllerNowPlaying nowPlayingWithItem:itemIdentifier:itemUID:artworkIdentifier:audioFormat:index:count:](MPMusicPlayerControllerNowPlaying, "nowPlayingWithItem:itemIdentifier:itemUID:artworkIdentifier:audioFormat:index:count:", a3, a4, 0, a5, 0, a6, a7);
}

@end
