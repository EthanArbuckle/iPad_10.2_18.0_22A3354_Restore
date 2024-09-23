@implementation AVPlayerItemAccessLog

- (id)_common_init
{
  AVPlayerItemAccessLogInternal *v3;
  AVPlayerItemAccessLogInternal *v4;

  v3 = objc_alloc_init(AVPlayerItemAccessLogInternal);
  if (!v3)
  {
    self->_playerItemAccessLog = 0;
    goto LABEL_5;
  }
  v4 = (AVPlayerItemAccessLogInternal *)CFRetain(v3);
  self->_playerItemAccessLog = v4;
  if (!v4)
  {
LABEL_5:

    return 0;
  }
  v4->logArray = 0;
  return self;
}

- (AVPlayerItemAccessLog)init
{
  AVPlayerItemAccessLog *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPlayerItemAccessLog;
  result = -[AVPlayerItemAccessLog init](&v3, sel_init);
  if (result)
    return (AVPlayerItemAccessLog *)-[AVPlayerItemAccessLog _common_init](result, "_common_init");
  return result;
}

- (AVPlayerItemAccessLog)initWithLogArray:(id)a3
{
  AVPlayerItemAccessLog *v4;
  uint64_t v5;
  AVPlayerItemAccessLog *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVPlayerItemAccessLog;
  v4 = -[AVPlayerItemAccessLog init](&v8, sel_init);
  if (!v4)
    return 0;
  v5 = -[AVPlayerItemAccessLog _common_init](v4, "_common_init");
  v6 = (AVPlayerItemAccessLog *)v5;
  if (a3 && v5)
    *(_QWORD *)(*(_QWORD *)(v5 + 8) + 8) = a3;
  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  v5 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>"), NSStringFromClass(v4), self);
  objc_msgSend(v5, "appendFormat:", CFSTR("\n%@"), (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", -[AVPlayerItemAccessLog extendedLogData](self, "extendedLogData"), -[AVPlayerItemAccessLog extendedLogDataStringEncoding](self, "extendedLogDataStringEncoding")));
  return v5;
}

- (void)dealloc
{
  AVPlayerItemAccessLogInternal *playerItemAccessLog;
  AVPlayerItemAccessLogInternal *v4;
  objc_super v5;

  playerItemAccessLog = self->_playerItemAccessLog;
  if (playerItemAccessLog)
  {

    v4 = self->_playerItemAccessLog;
    if (v4)
      CFRelease(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVPlayerItemAccessLog;
  -[AVPlayerItemAccessLog dealloc](&v5, sel_dealloc);
}

- (NSData)extendedLogData
{
  FigPlaybackItemLogCreateW3CLogData();
  return 0;
}

- (NSStringEncoding)extendedLogDataStringEncoding
{
  return 4;
}

- (NSArray)events
{
  uint64_t v3;
  void *v4;
  NSArray *logArray;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  AVPlayerItemAccessLogEvent *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_playerItemAccessLog->logArray, "count"));
  if (!v3)
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v4 = (void *)v3;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  logArray = self->_playerItemAccessLog->logArray;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](logArray, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(logArray);
        v10 = -[AVPlayerItemAccessLogEvent initWithDictionary:]([AVPlayerItemAccessLogEvent alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](logArray, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  return (NSArray *)v4;
}

- (id)_accessLogArray
{
  return self->_playerItemAccessLog->logArray;
}

@end
