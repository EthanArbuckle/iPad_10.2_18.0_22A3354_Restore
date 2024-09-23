@implementation MPMusicPlayerServerStateUpdateRecord

- (void)setHasNowPlaying:(BOOL)a3
{
  self->_hasNowPlaying = a3;
}

- (void)setNowPlaying:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlaying, a3);
}

- (void)setHasTimeMetadata:(BOOL)a3
{
  self->_hasTimeMetadata = a3;
}

- (void)setQueueDidChange:(BOOL)a3
{
  self->_queueDidChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItemIDs, 0);
  objc_storeStrong((id *)&self->_timeSnapshot, 0);
  objc_storeStrong((id *)&self->_nowPlaying, 0);
  objc_storeStrong((id *)&self->_queueDescriptor, 0);
}

- (MPMusicPlayerServerStateUpdateRecord)initWithCoder:(id)a3
{
  id v4;
  MPMusicPlayerServerStateUpdateRecord *v5;
  uint64_t v6;
  MPMusicPlayerQueueDescriptor *queueDescriptor;
  uint64_t v8;
  MPMusicPlayerControllerNowPlaying *nowPlaying;
  uint64_t v10;
  MPMusicPlayerControllerNowPlayingTimeSnapshot *timeSnapshot;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *contentItemIDs;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MPMusicPlayerServerStateUpdateRecord;
  v5 = -[MPMusicPlayerServerStateUpdateRecord init](&v18, sel_init);
  if (v5)
  {
    v5->_hasQueueDescriptor = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hd"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("d"));
    v6 = objc_claimAutoreleasedReturnValue();
    queueDescriptor = v5->_queueDescriptor;
    v5->_queueDescriptor = (MPMusicPlayerQueueDescriptor *)v6;

    v5->_hasNowPlaying = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hn"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("n"));
    v8 = objc_claimAutoreleasedReturnValue();
    nowPlaying = v5->_nowPlaying;
    v5->_nowPlaying = (MPMusicPlayerControllerNowPlaying *)v8;

    v5->_hasTimeSnapshot = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ht"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("t"));
    v10 = objc_claimAutoreleasedReturnValue();
    timeSnapshot = v5->_timeSnapshot;
    v5->_timeSnapshot = (MPMusicPlayerControllerNowPlayingTimeSnapshot *)v10;

    v5->_hasRepeatMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hr"));
    v5->_repeatMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("r"));
    v5->_hasShuffleMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hs"));
    v5->_shuffleMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("s"));
    v5->_hasContentItemIDs = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hi"));
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("i"));
    v15 = objc_claimAutoreleasedReturnValue();
    contentItemIDs = v5->_contentItemIDs;
    v5->_contentItemIDs = (NSArray *)v15;

    v5->_queueDidChange = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("qc"));
    v5->_itemDidEnd = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ie"));
    v5->_queueDidEnd = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("qe"));
    v5->_audioFormatDidChange = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("af"));
    v5->_hasTimeMetadata = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("tm"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 hasQueueDescriptor;
  id v5;

  hasQueueDescriptor = self->_hasQueueDescriptor;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", hasQueueDescriptor, CFSTR("hd"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_queueDescriptor, CFSTR("d"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasNowPlaying, CFSTR("hn"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nowPlaying, CFSTR("n"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasTimeSnapshot, CFSTR("ht"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeSnapshot, CFSTR("t"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasRepeatMode, CFSTR("hr"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_repeatMode, CFSTR("r"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasShuffleMode, CFSTR("hs"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_shuffleMode, CFSTR("s"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasContentItemIDs, CFSTR("hi"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contentItemIDs, CFSTR("i"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_queueDidChange, CFSTR("qc"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_itemDidEnd, CFSTR("ie"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_queueDidEnd, CFSTR("qe"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_audioFormatDidChange, CFSTR("af"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasTimeMetadata, CFSTR("tm"));

}

- (BOOL)hasQueueDescriptor
{
  return self->_hasQueueDescriptor;
}

- (void)setHasQueueDescriptor:(BOOL)a3
{
  self->_hasQueueDescriptor = a3;
}

- (MPMusicPlayerQueueDescriptor)queueDescriptor
{
  return self->_queueDescriptor;
}

- (void)setQueueDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_queueDescriptor, a3);
}

- (BOOL)hasNowPlaying
{
  return self->_hasNowPlaying;
}

- (MPMusicPlayerControllerNowPlaying)nowPlaying
{
  return self->_nowPlaying;
}

- (BOOL)hasTimeSnapshot
{
  return self->_hasTimeSnapshot;
}

- (void)setHasTimeSnapshot:(BOOL)a3
{
  self->_hasTimeSnapshot = a3;
}

- (MPMusicPlayerControllerNowPlayingTimeSnapshot)timeSnapshot
{
  return self->_timeSnapshot;
}

- (void)setTimeSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_timeSnapshot, a3);
}

- (BOOL)hasRepeatMode
{
  return self->_hasRepeatMode;
}

- (void)setHasRepeatMode:(BOOL)a3
{
  self->_hasRepeatMode = a3;
}

- (int64_t)repeatMode
{
  return self->_repeatMode;
}

- (void)setRepeatMode:(int64_t)a3
{
  self->_repeatMode = a3;
}

- (BOOL)hasShuffleMode
{
  return self->_hasShuffleMode;
}

- (void)setHasShuffleMode:(BOOL)a3
{
  self->_hasShuffleMode = a3;
}

- (int64_t)shuffleMode
{
  return self->_shuffleMode;
}

- (void)setShuffleMode:(int64_t)a3
{
  self->_shuffleMode = a3;
}

- (BOOL)hasContentItemIDs
{
  return self->_hasContentItemIDs;
}

- (void)setHasContentItemIDs:(BOOL)a3
{
  self->_hasContentItemIDs = a3;
}

- (NSArray)contentItemIDs
{
  return self->_contentItemIDs;
}

- (void)setContentItemIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)queueDidChange
{
  return self->_queueDidChange;
}

- (BOOL)itemDidEnd
{
  return self->_itemDidEnd;
}

- (void)setItemDidEnd:(BOOL)a3
{
  self->_itemDidEnd = a3;
}

- (BOOL)queueDidEnd
{
  return self->_queueDidEnd;
}

- (void)setQueueDidEnd:(BOOL)a3
{
  self->_queueDidEnd = a3;
}

- (BOOL)hasTimeMetadata
{
  return self->_hasTimeMetadata;
}

- (BOOL)audioFormatDidChange
{
  return self->_audioFormatDidChange;
}

- (void)setAudioFormatDidChange:(BOOL)a3
{
  self->_audioFormatDidChange = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
