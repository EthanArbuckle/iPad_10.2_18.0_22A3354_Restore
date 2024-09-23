@implementation SUUIPlayableAsset

- (SUUIPlayableAsset)init
{
  SUUIPlayableAsset *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUIPlayableAsset;
  result = -[SUUIPlayableAsset init](&v3, sel_init);
  if (result)
  {
    result->_initialPlaybackTime = NAN;
    result->_playbackDuration = NAN;
  }
  return result;
}

- (SUUIPlayableAsset)initWithContentURL:(id)a3
{
  id v5;
  SUUIPlayableAsset *v6;
  SUUIPlayableAsset *v7;

  v5 = a3;
  v6 = -[SUUIPlayableAsset init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contentURL, a3);

  return v7;
}

- (SUUIPlayableAsset)initWithVideoViewElement:(id)a3 assetViewElement:(id)a4
{
  id v6;
  id v7;
  SUUIPlayableAsset *v8;
  SUUIPlayableAsset *v9;
  uint64_t v10;
  NSURL *contentURL;
  double v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSURL *keyCertificateURL;
  uint64_t v17;
  NSURL *keyServerURL;
  double v19;

  v6 = a3;
  v7 = a4;
  v8 = -[SUUIPlayableAsset init](self, "init");
  v9 = v8;
  if (v7 && v8)
  {
    objc_msgSend(v7, "URL");
    v10 = objc_claimAutoreleasedReturnValue();
    contentURL = v9->_contentURL;
    v9->_contentURL = (NSURL *)v10;

    objc_msgSend(v7, "initialPlaybackTime");
    v9->_initialPlaybackTime = v12;
    v13 = objc_msgSend(v7, "itemIdentifier");
    v9->_storeItemIdentifier = v13;
    if (!v13)
      v9->_storeItemIdentifier = objc_msgSend(v6, "itemIdentifier");
    objc_msgSend(v7, "secureKeyDeliveryType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_shouldUseITunesStoreSecureKeyDelivery = objc_msgSend(v14, "isEqualToString:", 0x2511FEF28);

    v9->_ITunesStream = objc_msgSend(v7, "isITunesStream");
    objc_msgSend(v7, "keyCertificateURL");
    v15 = objc_claimAutoreleasedReturnValue();
    keyCertificateURL = v9->_keyCertificateURL;
    v9->_keyCertificateURL = (NSURL *)v15;

    objc_msgSend(v7, "keyServerURL");
    v17 = objc_claimAutoreleasedReturnValue();
    keyServerURL = v9->_keyServerURL;
    v9->_keyServerURL = (NSURL *)v17;

    objc_msgSend(v7, "playbackDuration");
    v9->_playbackDuration = v19;
  }

  return v9;
}

- (SUUIPlayableAsset)initWithVideo:(id)a3
{
  id v4;
  SUUIPlayableAsset *v5;
  SUUIPlayableAsset *v6;
  uint64_t v7;
  NSURL *contentURL;

  v4 = a3;
  v5 = -[SUUIPlayableAsset init](self, "init");
  v6 = v5;
  if (v4 && v5)
  {
    objc_msgSend(v4, "URL");
    v7 = objc_claimAutoreleasedReturnValue();
    contentURL = v6->_contentURL;
    v6->_contentURL = (NSURL *)v7;

  }
  return v6;
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (void)setContentURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)initialPlaybackTime
{
  return self->_initialPlaybackTime;
}

- (void)setInitialPlaybackTime:(double)a3
{
  self->_initialPlaybackTime = a3;
}

- (BOOL)isITunesStream
{
  return self->_ITunesStream;
}

- (NSURL)keyCertificateURL
{
  return self->_keyCertificateURL;
}

- (NSURL)keyServerURL
{
  return self->_keyServerURL;
}

- (double)playbackDuration
{
  return self->_playbackDuration;
}

- (void)setPlaybackDuration:(double)a3
{
  self->_playbackDuration = a3;
}

- (BOOL)shouldUseITunesStoreSecureKeyDelivery
{
  return self->_shouldUseITunesStoreSecureKeyDelivery;
}

- (void)setShouldUseITunesStoreSecureKeyDelivery:(BOOL)a3
{
  self->_shouldUseITunesStoreSecureKeyDelivery = a3;
}

- (int64_t)storeItemIdentifier
{
  return self->_storeItemIdentifier;
}

- (void)setStoreItemIdentifier:(int64_t)a3
{
  self->_storeItemIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyServerURL, 0);
  objc_storeStrong((id *)&self->_keyCertificateURL, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
}

@end
