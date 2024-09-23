@implementation MPNowPlayingInfoLyricsEvent

- (MPNowPlayingInfoLyricsEvent)initWithMediaRemoteLyricsEvent:(void *)a3
{
  MPNowPlayingInfoLyricsEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPNowPlayingInfoLyricsEvent;
  v4 = -[MPNowPlayingInfoLyricsEvent init](&v6, sel_init);
  if (v4)
    v4->_mediaRemoteLyricsEvent = (void *)CFRetain(a3);
  return v4;
}

- (void)dealloc
{
  void *mediaRemoteLyricsEvent;
  objc_super v4;

  mediaRemoteLyricsEvent = self->_mediaRemoteLyricsEvent;
  if (mediaRemoteLyricsEvent)
    CFRelease(mediaRemoteLyricsEvent);
  v4.receiver = self;
  v4.super_class = (Class)MPNowPlayingInfoLyricsEvent;
  -[MPNowPlayingInfoLyricsEvent dealloc](&v4, sel_dealloc);
}

- (NSDate)startDate
{
  return (NSDate *)MRLyricsEventGetStartDate();
}

- (NSDate)endDate
{
  return (NSDate *)MRLyricsEventGetEndDate();
}

- (MPNowPlayingInfoLyricsItemToken)token
{
  return -[MPNowPlayingInfoLyricsItemToken initWithMediaRemoteLyricsItemToken:]([MPNowPlayingInfoLyricsItemToken alloc], "initWithMediaRemoteLyricsItemToken:", MRLyricsEventGetToken());
}

- (void)mediaRemoteLyricsEvent
{
  return self->_mediaRemoteLyricsEvent;
}

@end
