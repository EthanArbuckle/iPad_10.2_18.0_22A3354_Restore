@implementation AWAttentionEvent

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tag, 0);
}

- (AWAttentionEvent)initWithTimestamp:(double)a3 tagIndex:(unint64_t)a4 eventMask:(unint64_t)a5
{
  AWAttentionEvent *v8;
  AWAttentionEvent *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AWAttentionEvent;
  v8 = -[AWAttentionEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_timestamp = a3;
    v8->_tagIndex = a4;
    v8->_eventMask = a5;
    -[AWAttentionEvent validateMask](v8, "validateMask");
  }
  return v9;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (unint64_t)tagIndex
{
  return self->_tagIndex;
}

- (unint64_t)eventMask
{
  return self->_eventMask;
}

- (id)tag
{
  return self->_tag;
}

- (void)updateWithConfig:(id)a3
{
  void *v4;
  id tag;
  id v6;

  +[AWAttentionAwarenessClientConfig sharedClientConfig](AWAttentionAwarenessClientConfig, "sharedClientConfig", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tagForIndex:", self->_tagIndex);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  tag = self->_tag;
  self->_tag = v4;

}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t eventMask;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  eventMask = self->_eventMask;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", eventMask);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("eventMask"));

  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("timestamp"), self->_timestamp);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_tagIndex);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("tagIndex"));

}

- (AWAttentionEvent)initWithCoder:(id)a3
{
  id v4;
  AWAttentionEvent *v5;
  BOOL v6;
  NSObject *v7;
  AWAttentionEvent *v8;
  unint64_t v10;
  double v11;
  objc_class *v12;
  void *v13;
  objc_super v14;
  char v15;
  uint8_t buf[4];
  double v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0;
  v14.receiver = self;
  v14.super_class = (Class)AWAttentionEvent;
  v5 = -[AWAttentionEvent init](&v14, sel_init);
  if (!v5
    || ((v5->_eventMask = decodeUInt64(v4, &v15, CFSTR("eventMask")),
         v5->_timestamp = decodeDouble(v4, &v15, CFSTR("timestamp")),
         v5->_tagIndex = decodeUInt64(v4, &v15, CFSTR("tagIndex")),
         v5->_eventMask != 1)
      ? (v6 = v15 == 0)
      : (v6 = 0),
        v6))
  {
    v8 = v5;
  }
  else
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v10 = absTimeNS();
        if (v10 == -1)
          v11 = INFINITY;
        else
          v11 = (double)v10 / 1000000000.0;
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v17 = v11;
        v18 = 2112;
        v19 = v13;
        _os_log_error_impl(&dword_1AF589000, v7, OS_LOG_TYPE_ERROR, "%13.5f: failed to decode %@", buf, 0x16u);

      }
    }
    v8 = 0;
  }

  return v8;
}

- (void)validateMask
{
  unint64_t eventMask;
  BOOL v3;

  eventMask = self->_eventMask;
  v3 = eventMask == 32 || eventMask == 1;
  if (v3 || eventMask == 128)
    __assert_rtn("-[AWAttentionEvent validateMask]", "SimpleFrameworkTypes.m", 726, "_eventMask != AWAttentionEventMaskAttentionLost && _eventMask != AWAttentionEventMaskFaceDetect && _eventMask != AWAttentionEventMaskRemote");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  double timestamp;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  getEventMaskDescription(self->_eventMask);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  tagDescription(self->_tagIndex, self->_tag);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> (timestamp: %13.5f mask %@ %@)"), v5, self, *(_QWORD *)&timestamp, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
