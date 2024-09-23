@implementation AVMetricHLSPlaylistRequestEvent

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetricHLSPlaylistRequestEvent;
  -[AVMetricEvent dealloc](&v3, sel_dealloc);
}

- (id)debugDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetricHLSPlaylistRequestEvent;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<AVMetricHLSPlaylistRequestEvent:%p %@ isMultivariantPlaylist:%d mediaType:%@ mediaResourceRequestEvent:%@>"), self, -[AVMetricEvent debugDescriptionForAttr](&v3, sel_debugDescriptionForAttr), self->_isMultivariantPlaylist, self->_mediaType, -[AVMetricMediaResourceRequestEvent debugDescription](self->_mediaResourceRequestEvent, "debugDescription"));
}

- (AVMetricHLSPlaylistRequestEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 url:(id)a6 isMultivariantPlaylist:(BOOL)a7 mediaType:(id)a8 mediaResourceRequestEvent:(id)a9
{
  AVMetricHLSPlaylistRequestEvent *v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AVMetricHLSPlaylistRequestEvent;
  v13 = *a4;
  v11 = -[AVMetricEvent initWithDate:mediaTime:sessionID:](&v14, sel_initWithDate_mediaTime_sessionID_, a3, &v13, a5, a6);
  if (v11)
  {
    v11->_mediaResourceRequestEvent = (AVMetricMediaResourceRequestEvent *)a9;
    v11->_isMultivariantPlaylist = a7;
    v11->_mediaType = (NSString *)a8;
  }
  return v11;
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)isMultivariantPlaylist
{
  return self->_isMultivariantPlaylist;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (AVMetricMediaResourceRequestEvent)mediaResourceRequestEvent
{
  return self->_mediaResourceRequestEvent;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v12;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("supports only keyed archivers"), v6, v7, v8, v9, v10, (uint64_t)v12.receiver), 0);
    objc_exception_throw(v11);
  }
  v12.receiver = self;
  v12.super_class = (Class)AVMetricHLSPlaylistRequestEvent;
  -[AVMetricEvent encodeWithCoder:](&v12, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeBool:forKey:", self->_isMultivariantPlaylist, CFSTR("isMultivariantPlaylist"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_mediaType, CFSTR("mediaType"));
}

- (AVMetricHLSPlaylistRequestEvent)initWithCoder:(id)a3
{
  AVMetricHLSPlaylistRequestEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMetricHLSPlaylistRequestEvent;
  v4 = -[AVMetricEvent initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_isMultivariantPlaylist = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isMultivariantPlaylist"));
    v4->_mediaType = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaType"));
  }
  return v4;
}

@end
