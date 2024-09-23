@implementation MPMovieAccessLog

- (id)_initWithAVItemAccessLog:(id)a3
{
  id v5;
  MPMovieAccessLog *v6;
  MPMovieAccessLog *v7;
  MPMovieAccessLog *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)MPMovieAccessLog;
    v6 = -[MPMovieAccessLog init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_accessLog, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSData)extendedLogData
{
  return -[AVPlayerItemAccessLog extendedLogData](self->_accessLog, "extendedLogData");
}

- (NSStringEncoding)extendedLogDataStringEncoding
{
  return -[AVPlayerItemAccessLog extendedLogDataStringEncoding](self->_accessLog, "extendedLogDataStringEncoding");
}

- (NSArray)events
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  MPMovieAccessLogEvent *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[AVPlayerItemAccessLog events](self->_accessLog, "events");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v2, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
          v10 = [MPMovieAccessLogEvent alloc];
          v11 = -[MPMovieAccessLogEvent _initWithAVItemAccessLogEvent:](v10, "_initWithAVItemAccessLogEvent:", v9, (_QWORD)v13);
          objc_msgSend(v3, "addObject:", v11);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = 0;
  }

  return (NSArray *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessLog, 0);
}

@end
