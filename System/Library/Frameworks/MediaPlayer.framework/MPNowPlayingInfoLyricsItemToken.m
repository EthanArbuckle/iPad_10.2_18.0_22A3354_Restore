@implementation MPNowPlayingInfoLyricsItemToken

- (MPNowPlayingInfoLyricsItemToken)initWithIdentifier:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  MPNowPlayingInfoLyricsItemToken *v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MPNowPlayingInfoLyricsItemToken;
  v8 = -[MPNowPlayingInfoLyricsItemToken init](&v10, sel_init);
  if (v8)
    v8->_mediaRemoteLyricsItemToken = (void *)MRLyricsItemTokenCreate();

  return v8;
}

- (MPNowPlayingInfoLyricsItemToken)initWithMediaRemoteLyricsItemToken:(void *)a3
{
  MPNowPlayingInfoLyricsItemToken *v4;
  MPNowPlayingInfoLyricsItemToken *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPNowPlayingInfoLyricsItemToken;
  v4 = -[MPNowPlayingInfoLyricsItemToken init](&v7, sel_init);
  v5 = v4;
  if (a3 && v4)
    v4->_mediaRemoteLyricsItemToken = (void *)CFRetain(a3);
  return v5;
}

- (void)dealloc
{
  void *mediaRemoteLyricsItemToken;
  objc_super v4;

  mediaRemoteLyricsItemToken = self->_mediaRemoteLyricsItemToken;
  if (mediaRemoteLyricsItemToken)
    CFRelease(mediaRemoteLyricsItemToken);
  v4.receiver = self;
  v4.super_class = (Class)MPNowPlayingInfoLyricsItemToken;
  -[MPNowPlayingInfoLyricsItemToken dealloc](&v4, sel_dealloc);
}

- (NSString)identifier
{
  return (NSString *)MRLyricsItemTokenGetIdentifier();
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)MRLyricsItemTokenGetUserInfo();
}

- (void)mediaRemoteLyricsItemToken
{
  return self->_mediaRemoteLyricsItemToken;
}

@end
