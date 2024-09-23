@implementation MNTracePlayerTimelineStream

- (MNTracePlayerTimelineStream)initWithData:(id)a3
{
  id v5;
  MNTracePlayerTimelineStream *v6;
  MNTracePlayerTimelineStream *v7;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNTracePlayerTimelineStream;
  v6 = -[MNTracePlayerTimelineStream init](&v10, sel_init);
  if (v6)
  {
    if (!objc_msgSend(v5, "count"))
    {
      GEOFindOrCreateLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v12 = "-[MNTracePlayerTimelineStream initWithData:]";
        v13 = 2080;
        v14 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTracePlayerTimelineStream.m";
        v15 = 1024;
        v16 = 44;
        v17 = 2080;
        v18 = "data.count > 0";
        _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
      }

    }
    objc_storeStrong((id *)&v6->_data, a3);
    v6->_nextIndex = 0x7FFFFFFFFFFFFFFFLL;
    v6->_nextUpdatePosition = 978307200.0;
    v7 = v6;
  }

  return v6;
}

- (void)triggerNextUpdate
{
  unint64_t nextIndex;
  void *v4;
  double v5;
  double v6;
  void (**handler)(id, unint64_t, void *, double);
  void *v8;
  NSArray *data;
  unint64_t v10;
  double v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  nextIndex = self->_nextIndex;
  if (nextIndex >= -[NSArray count](self->_data, "count"))
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "-[MNTracePlayerTimelineStream triggerNextUpdate]";
      v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTracePlayerTimelineStream.m";
      v18 = 1024;
      v19 = 57;
      _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
    }

  }
  else
  {
    if (self->_handler)
    {
      -[NSArray objectAtIndex:](self->_data, "objectAtIndex:", nextIndex);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "position");
      v6 = v5;

      handler = (void (**)(id, unint64_t, void *, double))self->_handler;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      handler[2](handler, nextIndex, v8, v6);

    }
    data = self->_data;
    v10 = self->_nextIndex + 1;
    self->_nextIndex = v10;
    if (v10 >= -[NSArray count](data, "count"))
    {
      self->_nextIndex = 0x7FFFFFFFFFFFFFFFLL;
      self->_nextUpdatePosition = 978307200.0;
    }
    else
    {
      -[NSArray objectAtIndex:](self->_data, "objectAtIndex:", self->_nextIndex);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "position");
      self->_nextUpdatePosition = v11;

    }
  }
}

- (void)jumpToPosition:(double)a3
{
  _MNTracePlayerTimelineStreamSearchObject *v4;
  unint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  void *v8;
  double v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = -[_MNTracePlayerTimelineStreamSearchObject initWithPosition:]([_MNTracePlayerTimelineStreamSearchObject alloc], "initWithPosition:", a3);
  v5 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](self->_data, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, -[NSArray count](self->_data, "count"), 1024, &__block_literal_global_38);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315906;
      v12 = "-[MNTracePlayerTimelineStream jumpToPosition:]";
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTracePlayerTimelineStream.m";
      v15 = 1024;
      v16 = 88;
      v17 = 2080;
      v18 = "nextIndex != NSNotFound";
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v11, 0x26u);
    }

  }
  v6 = -[NSArray count](self->_data, "count");
  if (v5 >= v6 - 1)
    v7 = v6 - 1;
  else
    v7 = v5;
  self->_nextIndex = v7;
  -[NSArray objectAtIndex:](self->_data, "objectAtIndex:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "position");
  self->_nextUpdatePosition = v9;

}

uint64_t __46__MNTracePlayerTimelineStream_jumpToPosition___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "position");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "position");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)nextIndex
{
  return self->_nextIndex;
}

- (double)nextUpdatePosition
{
  return self->_nextUpdatePosition;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
