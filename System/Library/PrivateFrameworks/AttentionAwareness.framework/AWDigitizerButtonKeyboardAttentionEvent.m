@implementation AWDigitizerButtonKeyboardAttentionEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayUUID, 0);
}

- (void)validateMask
{
  if (-[AWAttentionEvent eventMask](self, "eventMask") != 8
    && -[AWAttentionEvent eventMask](self, "eventMask") != 2
    && -[AWAttentionEvent eventMask](self, "eventMask") != 4)
  {
    __assert_rtn("-[AWDigitizerButtonKeyboardAttentionEvent validateMask]", "SimpleFrameworkTypes.m", 1131, "self.eventMask == AWAttentionEventMaskDigitizer || self.eventMask == AWAttentionEventMaskButton || self.eventMask == AWAttentionEventMaskKeyboard");
  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t senderID;
  NSString *displayUUID;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWAttentionEvent timestamp](self, "timestamp");
  v7 = v6;
  senderID = self->_senderID;
  displayUUID = self->_displayUUID;
  v10 = -[AWAttentionEvent tagIndex](self, "tagIndex");
  -[AWAttentionEvent tag](self, "tag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  tagDescription(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> (timestamp: %13.5f sender %llu displayUUID %@ %@)"), v5, self, v7, senderID, displayUUID, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", -[AWAttentionEvent eventMask](self, "eventMask"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("eventMask"));

  -[AWAttentionEvent timestamp](self, "timestamp");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timestamp"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_senderID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("senderID"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_displayUUID, CFSTR("displayUUID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[AWAttentionEvent tagIndex](self, "tagIndex"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("tagIndex"));

}

- (AWDigitizerButtonKeyboardAttentionEvent)initWithCoder:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  AWDigitizerButtonKeyboardAttentionEvent *v11;
  unint64_t v13;
  double v14;
  objc_class *v15;
  void *v16;
  char v17;
  _BYTE buf[22];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v4 = a3;
  v5 = decodeDouble(v4, &v17, CFSTR("timestamp"));
  v6 = decodeUInt64(v4, &v17, CFSTR("senderID"));
  decodeString(v4, &v17, CFSTR("displayUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = decodeUInt64(v4, &v17, CFSTR("tagIndex"));
  v9 = decodeUInt64(v4, &v17, CFSTR("eventMask"));

  if (v17)
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v13 = absTimeNS();
        if (v13 == -1)
          v14 = INFINITY;
        else
          v14 = (double)v13 / 1000000000.0;
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        *(double *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v16;
        _os_log_error_impl(&dword_1AF589000, v10, OS_LOG_TYPE_ERROR, "%13.5f: failed to decode %@", buf, 0x16u);

      }
    }
    v11 = 0;
  }
  else
  {
    *(_QWORD *)buf = v6;
    *(_QWORD *)&buf[8] = v7;
    v11 = -[AWDigitizerButtonKeyboardAttentionEvent initWithTimestamp:tagIndex:eventMask:digitizerButtonKeyboardMetadata:]([AWDigitizerButtonKeyboardAttentionEvent alloc], "initWithTimestamp:tagIndex:eventMask:digitizerButtonKeyboardMetadata:", v8, v9, buf, v5);
  }

  return v11;
}

- (AWDigitizerButtonKeyboardAttentionEvent)initWithTimestamp:(double)a3 tagIndex:(unint64_t)a4 eventMask:(unint64_t)a5 digitizerButtonKeyboardMetadata:(AWDigitizerButtonKeyboardMetadata *)a6
{
  AWDigitizerButtonKeyboardAttentionEvent *v7;
  AWDigitizerButtonKeyboardAttentionEvent *v8;
  __CFString *var1;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AWDigitizerButtonKeyboardAttentionEvent;
  v7 = -[AWAttentionEvent initWithTimestamp:tagIndex:eventMask:](&v11, sel_initWithTimestamp_tagIndex_eventMask_, a4, a5, a3);
  v8 = v7;
  if (a6 && v7)
  {
    var1 = a6->var1;
    v7->_senderID = a6->var0;
    objc_storeStrong((id *)&v7->_displayUUID, var1);
  }
  return v8;
}

- (unint64_t)senderID
{
  return self->_senderID;
}

- (NSString)displayUUID
{
  return self->_displayUUID;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
