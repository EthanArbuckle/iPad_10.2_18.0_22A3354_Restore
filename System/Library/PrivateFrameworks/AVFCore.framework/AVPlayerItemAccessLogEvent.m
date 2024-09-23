@implementation AVPlayerItemAccessLogEvent

- (id)_common_init
{
  AVPlayerItemAccessLogEventInternal *v3;

  v3 = objc_alloc_init(AVPlayerItemAccessLogEventInternal);
  self->_playerItemAccessLogEvent = v3;
  if (v3)
  {
    CFRetain(v3);
    self->_playerItemAccessLogEvent->dict = 0;
  }
  else
  {

    return 0;
  }
  return self;
}

- (AVPlayerItemAccessLogEvent)init
{
  AVPlayerItemAccessLogEvent *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPlayerItemAccessLogEvent;
  result = -[AVPlayerItemAccessLogEvent init](&v3, sel_init);
  if (result)
    return (AVPlayerItemAccessLogEvent *)-[AVPlayerItemAccessLogEvent _common_init](result, "_common_init");
  return result;
}

- (AVPlayerItemAccessLogEvent)initWithDictionary:(id)a3
{
  AVPlayerItemAccessLogEvent *v4;
  uint64_t v5;
  AVPlayerItemAccessLogEvent *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVPlayerItemAccessLogEvent;
  v4 = -[AVPlayerItemAccessLogEvent init](&v8, sel_init);
  if (!v4)
    return 0;
  v5 = -[AVPlayerItemAccessLogEvent _common_init](v4, "_common_init");
  v6 = (AVPlayerItemAccessLogEvent *)v5;
  if (a3 && v5)
    *(_QWORD *)(*(_QWORD *)(v5 + 8) + 8) = a3;
  return v6;
}

- (void)dealloc
{
  AVPlayerItemAccessLogEventInternal *playerItemAccessLogEvent;
  objc_super v4;

  playerItemAccessLogEvent = self->_playerItemAccessLogEvent;
  if (playerItemAccessLogEvent)
  {

    CFRelease(self->_playerItemAccessLogEvent);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerItemAccessLogEvent;
  -[AVPlayerItemAccessLogEvent dealloc](&v4, sel_dealloc);
}

- (NSInteger)numberOfMediaRequests
{
  id v2;

  v2 = -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC3320]);
  if (v2)
    return objc_msgSend(v2, "integerValue");
  else
    return -1;
}

- (NSDate)playbackStartDate
{
  return (NSDate *)-[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC3358]);
}

- (NSString)URI
{
  return (NSString *)-[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC33B0]);
}

- (NSString)serverAddress
{
  return (NSString *)-[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC3370]);
}

- (NSInteger)numberOfServerAddressChanges
{
  id v2;

  v2 = -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC3378]);
  if (v2)
    return objc_msgSend(v2, "integerValue");
  else
    return -1;
}

- (NSString)playbackSessionID
{
  return (NSString *)-[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC3350]);
}

- (NSTimeInterval)playbackStartOffset
{
  id v2;
  NSTimeInterval result;

  v2 = -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC3360]);
  if (!v2)
    return -1.0;
  objc_msgSend(v2, "doubleValue");
  return result;
}

- (NSTimeInterval)segmentsDownloadedDuration
{
  id v2;
  NSTimeInterval result;

  v2 = -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC32F0]);
  if (!v2)
    return -1.0;
  objc_msgSend(v2, "doubleValue");
  return result;
}

- (NSTimeInterval)durationWatched
{
  id v2;
  NSTimeInterval result;

  v2 = -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC3300]);
  if (!v2)
    return -1.0;
  objc_msgSend(v2, "doubleValue");
  return result;
}

- (NSInteger)numberOfStalls
{
  id v2;

  v2 = -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC3388]);
  if (v2)
    return objc_msgSend(v2, "integerValue");
  else
    return -1;
}

- (uint64_t)numberOfBytesTransferred
{
  id v2;

  v2 = -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC32D8]);
  if (v2)
    return objc_msgSend(v2, "longLongValue");
  else
    return -1;
}

- (NSTimeInterval)transferDuration
{
  id v2;
  NSTimeInterval result;

  v2 = -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC33A8]);
  if (!v2)
    return -1.0;
  objc_msgSend(v2, "doubleValue");
  return result;
}

- (double)observedBitrate
{
  id v2;
  double result;

  v2 = -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC3330]);
  if (!v2)
    return -1.0;
  objc_msgSend(v2, "doubleValue");
  return result;
}

- (double)currentObservedBitrate
{
  id v2;
  double result;

  v2 = -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC32E0]);
  if (!v2)
    return -1.0;
  objc_msgSend(v2, "doubleValue");
  return result;
}

- (double)indicatedBitrate
{
  id v2;
  double result;

  v2 = -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC3318]);
  if (!v2)
    return -1.0;
  objc_msgSend(v2, "doubleValue");
  return result;
}

- (double)indicatedAverageBitrate
{
  id v2;
  double result;

  v2 = -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC3310]);
  if (!v2)
    return -1.0;
  objc_msgSend(v2, "doubleValue");
  return result;
}

- (double)averageVideoBitrate
{
  id v2;
  double result;

  v2 = -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC32D0]);
  if (!v2)
    return -1.0;
  objc_msgSend(v2, "doubleValue");
  return result;
}

- (double)averageAudioBitrate
{
  id v2;
  double result;

  v2 = -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC32C8]);
  if (!v2)
    return -1.0;
  objc_msgSend(v2, "doubleValue");
  return result;
}

- (NSInteger)numberOfDroppedVideoFrames
{
  id v2;

  v2 = -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC32F8]);
  if (v2)
    return objc_msgSend(v2, "integerValue");
  else
    return -1;
}

- (NSTimeInterval)startupTime
{
  id v2;
  NSTimeInterval result;

  v2 = -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC3398]);
  if (!v2)
    return -1.0;
  objc_msgSend(v2, "doubleValue");
  return result;
}

- (NSInteger)downloadOverdue
{
  id v2;

  v2 = -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC32E8]);
  if (v2)
    return objc_msgSend(v2, "integerValue");
  else
    return -1;
}

- (int64_t)entryReasonCode
{
  id v2;

  v2 = -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC3308]);
  if (v2)
    return objc_msgSend(v2, "integerValue");
  else
    return -1;
}

- (double)observedMaxBitrate
{
  id v2;
  double result;

  v2 = -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC3340]);
  if (!v2)
    return -1.0;
  objc_msgSend(v2, "doubleValue");
  return result;
}

- (double)observedMinBitrate
{
  id v2;
  double result;

  v2 = -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC3348]);
  if (!v2)
    return -1.0;
  objc_msgSend(v2, "doubleValue");
  return result;
}

- (double)observedBitrateStandardDeviation
{
  id v2;
  double result;

  v2 = -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC3338]);
  if (!v2)
    return -1.0;
  objc_msgSend(v2, "doubleValue");
  return result;
}

- (NSString)playbackType
{
  return (NSString *)-[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC3368]);
}

- (NSInteger)mediaRequestsWWAN
{
  id v2;

  v2 = -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC3328]);
  if (v2)
    return objc_msgSend(v2, "integerValue");
  else
    return -1;
}

- (double)switchBitrate
{
  id v2;
  double result;

  v2 = -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC33A0]);
  if (!v2)
    return -1.0;
  objc_msgSend(v2, "doubleValue");
  return result;
}

- (id)performanceMetrics
{
  return -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC3390]);
}

- (id)serviceIdentifier
{
  return -[NSDictionary valueForKey:](self->_playerItemAccessLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC3380]);
}

@end
