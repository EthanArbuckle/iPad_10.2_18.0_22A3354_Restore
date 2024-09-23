@implementation MPNowPlayingInfoLyricsItem

- (MPNowPlayingInfoLyricsItem)initWithMediaRemoteLyricsItem:(void *)a3
{
  MPNowPlayingInfoLyricsItem *v3;
  MPNowPlayingInfoLyricsItem *v4;
  objc_super v6;

  v3 = (MPNowPlayingInfoLyricsItem *)a3;
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)MPNowPlayingInfoLyricsItem;
    v4 = -[MPNowPlayingInfoLyricsItem init](&v6, sel_init);
    if (v4)
      v4->_mediaRemoteLyricsItem = (void *)CFRetain(v3);
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)dealloc
{
  void *mediaRemoteLyricsItem;
  objc_super v4;

  mediaRemoteLyricsItem = self->_mediaRemoteLyricsItem;
  if (mediaRemoteLyricsItem)
    CFRelease(mediaRemoteLyricsItem);
  v4.receiver = self;
  v4.super_class = (Class)MPNowPlayingInfoLyricsItem;
  -[MPNowPlayingInfoLyricsItem dealloc](&v4, sel_dealloc);
}

- (void)mediaRemoteLyricsItem
{
  return self->_mediaRemoteLyricsItem;
}

- (MPNowPlayingInfoLyricsItem)initWithLyrics:(id)a3 userProvided:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  MPNowPlayingInfoLyricsItem *v7;

  v4 = a4;
  v6 = a3;
  v7 = -[MPNowPlayingInfoLyricsItem initWithLyrics:userProvided:token:]([MPNowPlayingInfoLyricsItem alloc], "initWithLyrics:userProvided:token:", v6, v4, 0);

  return v7;
}

- (MPNowPlayingInfoLyricsItem)initWithLyrics:(id)a3 userProvided:(BOOL)a4 token:(id)a5
{
  id v7;
  id v8;
  MPNowPlayingInfoLyricsItem *v9;
  objc_super v11;

  v7 = a3;
  v8 = a5;
  v11.receiver = self;
  v11.super_class = (Class)MPNowPlayingInfoLyricsItem;
  v9 = -[MPNowPlayingInfoLyricsItem init](&v11, sel_init);
  if (v9)
  {
    objc_msgSend(v8, "mediaRemoteLyricsItemToken");
    v9->_mediaRemoteLyricsItem = (void *)MRLyricsItemCreate();
  }

  return v9;
}

- (NSString)lyrics
{
  return (NSString *)MRLyricsItemGetLyrics();
}

- (BOOL)userProvided
{
  JUMPOUT(0x1940381F4);
}

- (MPNowPlayingInfoLyricsItemToken)token
{
  return -[MPNowPlayingInfoLyricsItemToken initWithMediaRemoteLyricsItemToken:]([MPNowPlayingInfoLyricsItemToken alloc], "initWithMediaRemoteLyricsItemToken:", MRLyricsItemGetToken());
}

@end
