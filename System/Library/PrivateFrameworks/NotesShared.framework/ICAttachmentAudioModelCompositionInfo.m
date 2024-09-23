@implementation ICAttachmentAudioModelCompositionInfo

- (ICAttachmentAudioModelCompositionInfo)initWithURL:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  ICAttachmentAudioModelCompositionInfo *v8;
  uint64_t v9;
  NSURL *url;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICAttachmentAudioModelCompositionInfo;
  v8 = -[ICAttachmentAudioModelCompositionInfo init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    url = v8->_url;
    v8->_url = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_asset, a4);
  }

  return v8;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (AVAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (AVAssetTrack)track
{
  return self->_track;
}

- (void)setTrack:(id)a3
{
  objc_storeStrong((id *)&self->_track, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_track, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
