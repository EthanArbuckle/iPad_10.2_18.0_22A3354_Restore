@implementation AVPlayerItemErrorLogEvent

- (id)_common_init
{
  AVPlayerItemErrorLogEventInternal *v3;

  v3 = objc_alloc_init(AVPlayerItemErrorLogEventInternal);
  self->_playerItemErrorLogEvent = v3;
  if (v3)
  {
    CFRetain(v3);
    self->_playerItemErrorLogEvent->dict = 0;
  }
  else
  {

    return 0;
  }
  return self;
}

- (AVPlayerItemErrorLogEvent)init
{
  AVPlayerItemErrorLogEvent *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPlayerItemErrorLogEvent;
  result = -[AVPlayerItemErrorLogEvent init](&v3, sel_init);
  if (result)
    return (AVPlayerItemErrorLogEvent *)-[AVPlayerItemErrorLogEvent _common_init](result, "_common_init");
  return result;
}

- (AVPlayerItemErrorLogEvent)initWithDictionary:(id)a3
{
  AVPlayerItemErrorLogEvent *v4;
  uint64_t v5;
  AVPlayerItemErrorLogEvent *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVPlayerItemErrorLogEvent;
  v4 = -[AVPlayerItemErrorLogEvent init](&v8, sel_init);
  if (!v4)
    return 0;
  v5 = -[AVPlayerItemErrorLogEvent _common_init](v4, "_common_init");
  v6 = (AVPlayerItemErrorLogEvent *)v5;
  if (a3 && v5)
    *(_QWORD *)(*(_QWORD *)(v5 + 8) + 8) = a3;
  return v6;
}

- (void)dealloc
{
  AVPlayerItemErrorLogEventInternal *playerItemErrorLogEvent;
  objc_super v4;

  playerItemErrorLogEvent = self->_playerItemErrorLogEvent;
  if (playerItemErrorLogEvent)
  {

    CFRelease(self->_playerItemErrorLogEvent);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerItemErrorLogEvent;
  -[AVPlayerItemErrorLogEvent dealloc](&v4, sel_dealloc);
}

- (NSDate)date
{
  return (NSDate *)-[NSDictionary valueForKey:](self->_playerItemErrorLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC4190]);
}

- (NSString)URI
{
  return (NSString *)-[NSDictionary valueForKey:](self->_playerItemErrorLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC41C0]);
}

- (NSString)serverAddress
{
  return (NSString *)-[NSDictionary valueForKey:](self->_playerItemErrorLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC41B8]);
}

- (NSString)playbackSessionID
{
  return (NSString *)-[NSDictionary valueForKey:](self->_playerItemErrorLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC41B0]);
}

- (NSInteger)errorStatusCode
{
  NSInteger result;

  result = -[NSDictionary valueForKey:](self->_playerItemErrorLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC41A8]);
  if (result)
    return objc_msgSend((id)result, "integerValue");
  return result;
}

- (NSString)errorDomain
{
  return (NSString *)-[NSDictionary valueForKey:](self->_playerItemErrorLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC41A0]);
}

- (NSString)errorComment
{
  return (NSString *)-[NSDictionary valueForKey:](self->_playerItemErrorLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC4198]);
}

- (NSDictionary)allHTTPResponseHeaderFields
{
  return (NSDictionary *)-[NSDictionary valueForKey:](self->_playerItemErrorLogEvent->dict, "valueForKey:", *MEMORY[0x1E0CC4188]);
}

@end
