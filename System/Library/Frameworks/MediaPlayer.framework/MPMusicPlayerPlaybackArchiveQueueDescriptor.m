@implementation MPMusicPlayerPlaybackArchiveQueueDescriptor

- (MPMusicPlayerPlaybackArchiveQueueDescriptor)initWithPlaybackArchive:(id)a3
{
  id v4;
  MPMusicPlayerPlaybackArchiveQueueDescriptor *v5;
  uint64_t v6;
  MPPlaybackArchive *playbackArchive;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPMusicPlayerPlaybackArchiveQueueDescriptor;
  v5 = -[MPMusicPlayerQueueDescriptor _init](&v9, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    playbackArchive = v5->_playbackArchive;
    v5->_playbackArchive = (MPPlaybackArchive *)v6;

  }
  return v5;
}

- (MPMusicPlayerPlaybackArchiveQueueDescriptor)initWithCoder:(id)a3
{
  id v4;
  MPMusicPlayerPlaybackArchiveQueueDescriptor *v5;
  uint64_t v6;
  MPPlaybackArchive *playbackArchive;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPMusicPlayerPlaybackArchiveQueueDescriptor;
  v5 = -[MPMusicPlayerQueueDescriptor initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playbackArchive"));
    v6 = objc_claimAutoreleasedReturnValue();
    playbackArchive = v5->_playbackArchive;
    v5->_playbackArchive = (MPPlaybackArchive *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPMusicPlayerPlaybackArchiveQueueDescriptor;
  v4 = a3;
  -[MPMusicPlayerQueueDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_playbackArchive, CFSTR("playbackArchive"), v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPMusicPlayerPlaybackArchiveQueueDescriptor;
  v4 = -[MPMusicPlayerQueueDescriptor copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 10, self->_playbackArchive);
  return v4;
}

- (BOOL)isEmpty
{
  return self->_playbackArchive == 0;
}

- (MPPlaybackArchive)playbackArchive
{
  return self->_playbackArchive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackArchive, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
