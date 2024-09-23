@implementation MPMovieErrorLogEvent

- (id)_initWithAVItemErrorLogEvent:(id)a3
{
  id v5;
  MPMovieErrorLogEvent *v6;
  MPMovieErrorLogEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPMovieErrorLogEvent;
  v6 = -[MPMovieErrorLogEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_event, a3);

  return v7;
}

- (NSDate)date
{
  return -[AVPlayerItemErrorLogEvent date](self->_event, "date");
}

- (NSString)URI
{
  return -[AVPlayerItemErrorLogEvent URI](self->_event, "URI");
}

- (NSString)serverAddress
{
  return -[AVPlayerItemErrorLogEvent serverAddress](self->_event, "serverAddress");
}

- (NSString)playbackSessionID
{
  return -[AVPlayerItemErrorLogEvent playbackSessionID](self->_event, "playbackSessionID");
}

- (NSInteger)errorStatusCode
{
  return -[AVPlayerItemErrorLogEvent errorStatusCode](self->_event, "errorStatusCode");
}

- (NSString)errorDomain
{
  return -[AVPlayerItemErrorLogEvent errorDomain](self->_event, "errorDomain");
}

- (NSString)errorComment
{
  return -[AVPlayerItemErrorLogEvent errorComment](self->_event, "errorComment");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

@end
