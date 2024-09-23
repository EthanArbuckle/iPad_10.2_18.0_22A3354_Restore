@implementation WFPlayMusicActionContent

- (WFPlayMusicActionContent)initWithStoreIDs:(id)a3
{
  id v4;
  WFPlayMusicActionContent *v5;
  uint64_t v6;
  NSArray *storeIDs;
  WFPlayMusicActionContent *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFPlayMusicActionContent;
  v5 = -[WFPlayMusicActionContent init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    storeIDs = v5->_storeIDs;
    v5->_storeIDs = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (WFPlayMusicActionContent)initWithMediaCollection:(id)a3
{
  id v5;
  WFPlayMusicActionContent *v6;
  WFPlayMusicActionContent *v7;
  WFPlayMusicActionContent *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFPlayMusicActionContent;
  v6 = -[WFPlayMusicActionContent init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaCollection, a3);
    v8 = v7;
  }

  return v7;
}

- (WFPlayMusicActionContent)initWithPlaybackArchive:(id)a3
{
  id v5;
  WFPlayMusicActionContent *v6;
  WFPlayMusicActionContent *v7;
  WFPlayMusicActionContent *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFPlayMusicActionContent;
  v6 = -[WFPlayMusicActionContent init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_playbackArchive, a3);
    v8 = v7;
  }

  return v7;
}

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

- (NSArray)storeIDs
{
  return self->_storeIDs;
}

- (void)setStoreIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MPMediaItemCollection)mediaCollection
{
  return self->_mediaCollection;
}

- (void)setMediaCollection:(id)a3
{
  objc_storeStrong((id *)&self->_mediaCollection, a3);
}

- (MPPlaybackArchive)playbackArchive
{
  return self->_playbackArchive;
}

- (void)setPlaybackArchive:(id)a3
{
  objc_storeStrong((id *)&self->_playbackArchive, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackArchive, 0);
  objc_storeStrong((id *)&self->_mediaCollection, 0);
  objc_storeStrong((id *)&self->_storeIDs, 0);
}

@end
