@implementation AVPlayerItemErrorLog

- (id)_common_init
{
  AVPlayerItemErrorLogInternal *v3;

  v3 = objc_alloc_init(AVPlayerItemErrorLogInternal);
  self->_playerItemErrorLog = v3;
  if (v3)
  {
    CFRetain(v3);
    self->_playerItemErrorLog->logArray = 0;
  }
  else
  {

    return 0;
  }
  return self;
}

- (AVPlayerItemErrorLog)init
{
  AVPlayerItemErrorLog *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPlayerItemErrorLog;
  result = -[AVPlayerItemErrorLog init](&v3, sel_init);
  if (result)
    return (AVPlayerItemErrorLog *)-[AVPlayerItemErrorLog _common_init](result, "_common_init");
  return result;
}

- (AVPlayerItemErrorLog)initWithLogArray:(id)a3
{
  AVPlayerItemErrorLog *v4;
  uint64_t v5;
  AVPlayerItemErrorLog *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVPlayerItemErrorLog;
  v4 = -[AVPlayerItemErrorLog init](&v8, sel_init);
  if (!v4)
    return 0;
  v5 = -[AVPlayerItemErrorLog _common_init](v4, "_common_init");
  v6 = (AVPlayerItemErrorLog *)v5;
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
  objc_msgSend(v5, "appendFormat:", CFSTR("\n%@"), (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", -[AVPlayerItemErrorLog extendedLogData](self, "extendedLogData"), -[AVPlayerItemErrorLog extendedLogDataStringEncoding](self, "extendedLogDataStringEncoding")));
  return v5;
}

- (void)dealloc
{
  AVPlayerItemErrorLogInternal *playerItemErrorLog;
  objc_super v4;

  playerItemErrorLog = self->_playerItemErrorLog;
  if (playerItemErrorLog)
  {

    CFRelease(self->_playerItemErrorLog);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerItemErrorLog;
  -[AVPlayerItemErrorLog dealloc](&v4, sel_dealloc);
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
  AVPlayerItemErrorLogEvent *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_playerItemErrorLog->logArray, "count"));
  if (!v3)
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v4 = (void *)v3;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  logArray = self->_playerItemErrorLog->logArray;
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
        v10 = -[AVPlayerItemErrorLogEvent initWithDictionary:]([AVPlayerItemErrorLogEvent alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
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

- (id)_errorLogArray
{
  return self->_playerItemErrorLog->logArray;
}

@end
