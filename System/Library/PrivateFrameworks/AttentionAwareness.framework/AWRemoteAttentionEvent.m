@implementation AWRemoteAttentionEvent

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[AWAttentionEvent timestamp](self, "timestamp");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timestamp"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_usagePage);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("usagePage"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_usage);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("usage"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_senderID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("senderID"));

  objc_msgSend(v4, "encodeBool:forKey:", self->_buttonPressed, CFSTR("buttonPressed"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[AWAttentionEvent tagIndex](self, "tagIndex"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("tagIndex"));

}

- (AWRemoteAttentionEvent)initWithCoder:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  AWRemoteAttentionEvent *v12;
  unint64_t v14;
  double v15;
  objc_class *v16;
  void *v17;
  char v18;
  _BYTE buf[24];
  _BOOL8 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v4 = a3;
  v5 = decodeDouble(v4, &v18, CFSTR("timestamp"));
  v6 = decodeUInt64(v4, &v18, CFSTR("usagePage"));
  v7 = decodeUInt64(v4, &v18, CFSTR("usage"));
  v8 = decodeUInt64(v4, &v18, CFSTR("senderID"));
  v9 = decodeUInt64(v4, &v18, CFSTR("buttonPressed"));
  v10 = decodeUInt64(v4, &v18, CFSTR("tagIndex"));

  if (v18)
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v14 = absTimeNS();
        if (v14 == -1)
          v15 = INFINITY;
        else
          v15 = (double)v14 / 1000000000.0;
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        *(double *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v17;
        _os_log_error_impl(&dword_1AF589000, v11, OS_LOG_TYPE_ERROR, "%13.5f: failed to decode %@", buf, 0x16u);

      }
    }
    v12 = 0;
  }
  else
  {
    *(_QWORD *)buf = v6;
    *(_QWORD *)&buf[8] = v7;
    *(_QWORD *)&buf[16] = v8;
    v20 = v9 != 0;
    v12 = -[AWRemoteAttentionEvent initWithTimestamp:tagIndex:remoteMetadata:]([AWRemoteAttentionEvent alloc], "initWithTimestamp:tagIndex:remoteMetadata:", v10, buf, v5);
  }

  return v12;
}

- (void)validateMask
{
  if (-[AWAttentionEvent eventMask](self, "eventMask") != 32)
    __assert_rtn("-[AWRemoteAttentionEvent validateMask]", "SimpleFrameworkTypes.m", 1047, "self.eventMask == AWAttentionEventMaskRemote");
}

- (AWRemoteAttentionEvent)initWithTimestamp:(double)a3 tagIndex:(unint64_t)a4 remoteMetadata:(AWRemoteMetadata *)a5
{
  AWRemoteAttentionEvent *result;
  unint64_t var2;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AWRemoteAttentionEvent;
  result = -[AWAttentionEvent initWithTimestamp:tagIndex:eventMask:](&v8, sel_initWithTimestamp_tagIndex_eventMask_, a4, 32, a3);
  if (a5)
  {
    if (result)
    {
      result->_usagePage = a5->var0;
      var2 = a5->var2;
      result->_usage = a5->var1;
      result->_senderID = var2;
      result->_buttonPressed = a5->var3;
    }
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t usagePage;
  int64_t usage;
  unint64_t senderID;
  _BOOL8 buttonPressed;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWAttentionEvent timestamp](self, "timestamp");
  v7 = v6;
  usagePage = self->_usagePage;
  usage = self->_usage;
  senderID = self->_senderID;
  buttonPressed = self->_buttonPressed;
  v12 = -[AWAttentionEvent tagIndex](self, "tagIndex");
  -[AWAttentionEvent tag](self, "tag");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  tagDescription(v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> (timestamp: %13.5f usagePage %ld usage %ld senderID: %llu buttonPressed: %d %@)"), v5, self, v7, usagePage, usage, senderID, buttonPressed, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (int64_t)usagePage
{
  return self->_usagePage;
}

- (int64_t)usage
{
  return self->_usage;
}

- (unint64_t)senderID
{
  return self->_senderID;
}

- (BOOL)buttonPressed
{
  return self->_buttonPressed;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
