@implementation MPMovieAccessLogEvent

- (id)_initWithAVItemAccessLogEvent:(id)a3
{
  id v5;
  MPMovieAccessLogEvent *v6;
  MPMovieAccessLogEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPMovieAccessLogEvent;
  v6 = -[MPMovieAccessLogEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_event, a3);

  return v7;
}

- (NSUInteger)numberOfSegmentsDownloaded
{
  return -[AVPlayerItemAccessLogEvent numberOfMediaRequests](self->_event, "numberOfMediaRequests");
}

- (NSDate)playbackStartDate
{
  return -[AVPlayerItemAccessLogEvent playbackStartDate](self->_event, "playbackStartDate");
}

- (NSString)URI
{
  return -[AVPlayerItemAccessLogEvent URI](self->_event, "URI");
}

- (NSString)serverAddress
{
  return -[AVPlayerItemAccessLogEvent serverAddress](self->_event, "serverAddress");
}

- (NSUInteger)numberOfServerAddressChanges
{
  return -[AVPlayerItemAccessLogEvent numberOfServerAddressChanges](self->_event, "numberOfServerAddressChanges");
}

- (NSString)playbackSessionID
{
  return -[AVPlayerItemAccessLogEvent playbackSessionID](self->_event, "playbackSessionID");
}

- (NSTimeInterval)playbackStartOffset
{
  NSTimeInterval result;

  -[AVPlayerItemAccessLogEvent playbackStartOffset](self->_event, "playbackStartOffset");
  return result;
}

- (NSTimeInterval)segmentsDownloadedDuration
{
  NSTimeInterval result;

  -[AVPlayerItemAccessLogEvent segmentsDownloadedDuration](self->_event, "segmentsDownloadedDuration");
  return result;
}

- (NSTimeInterval)durationWatched
{
  NSTimeInterval result;

  -[AVPlayerItemAccessLogEvent durationWatched](self->_event, "durationWatched");
  return result;
}

- (NSInteger)numberOfStalls
{
  return -[AVPlayerItemAccessLogEvent numberOfStalls](self->_event, "numberOfStalls");
}

- (int64_t)numberOfBytesTransferred
{
  return -[AVPlayerItemAccessLogEvent numberOfBytesTransferred](self->_event, "numberOfBytesTransferred");
}

- (double)observedBitrate
{
  double result;

  -[AVPlayerItemAccessLogEvent observedBitrate](self->_event, "observedBitrate");
  return result;
}

- (double)indicatedBitrate
{
  double result;

  -[AVPlayerItemAccessLogEvent indicatedBitrate](self->_event, "indicatedBitrate");
  return result;
}

- (NSInteger)numberOfDroppedVideoFrames
{
  return -[AVPlayerItemAccessLogEvent numberOfDroppedVideoFrames](self->_event, "numberOfDroppedVideoFrames");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

@end
