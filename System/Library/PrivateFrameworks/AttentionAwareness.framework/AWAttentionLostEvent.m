@implementation AWAttentionLostEvent

- (void).cxx_destruct
{
  objc_storeStrong(&self->_associatedObject, 0);
}

- (void)validateMask
{
  if (-[AWAttentionEvent eventMask](self, "eventMask") != 1)
    __assert_rtn("-[AWAttentionLostEvent validateMask]", "SimpleFrameworkTypes.m", 799, "self.eventMask == AWAttentionEventMaskAttentionLost");
}

- (AWAttentionLostEvent)initWithTimestamp:(double)a3 tagIndex:(unint64_t)a4 attentionLostTimeout:(double)a5
{
  AWAttentionLostEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AWAttentionLostEvent;
  result = -[AWAttentionEvent initWithTimestamp:tagIndex:eventMask:](&v7, sel_initWithTimestamp_tagIndex_eventMask_, a4, 1, a3);
  if (result)
    result->_attentionLostTimeout = a5;
  return result;
}

- (double)attentionLostTimeout
{
  return self->_attentionLostTimeout;
}

- (void)updateWithConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id associatedObject;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AWAttentionLostEvent;
  v4 = a3;
  -[AWAttentionEvent updateWithConfig:](&v9, sel_updateWithConfig_, v4);
  objc_msgSend(v4, "attentionLostTimeoutDictionary", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_attentionLostTimeout);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  associatedObject = self->_associatedObject;
  self->_associatedObject = v7;

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double attentionLostTimeout;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWAttentionEvent timestamp](self, "timestamp");
  v7 = v6;
  attentionLostTimeout = self->_attentionLostTimeout;
  v9 = -[AWAttentionEvent tagIndex](self, "tagIndex");
  -[AWAttentionEvent tag](self, "tag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  tagDescription(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> (timestamp: %13.5f attentionLostTimeout %13.5f %@)"), v5, self, v7, *(_QWORD *)&attentionLostTimeout, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AWAttentionEvent timestamp](self, "timestamp");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timestamp"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("attentionLostTimeout"), self->_attentionLostTimeout);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[AWAttentionEvent tagIndex](self, "tagIndex"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("tagIndex"));

}

- (AWAttentionLostEvent)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  NSObject *v8;
  AWAttentionLostEvent *v9;
  unint64_t v11;
  double v12;
  objc_class *v13;
  void *v14;
  char v15;
  uint8_t buf[4];
  double v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v4 = a3;
  v5 = decodeDouble(v4, &v15, CFSTR("timestamp"));
  v6 = decodeDouble(v4, &v15, CFSTR("attentionLostTimeout"));
  v7 = decodeUInt64(v4, &v15, CFSTR("tagIndex"));

  if (v15)
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v11 = absTimeNS();
        if (v11 == -1)
          v12 = INFINITY;
        else
          v12 = (double)v11 / 1000000000.0;
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v17 = v12;
        v18 = 2112;
        v19 = v14;
        _os_log_error_impl(&dword_1AF589000, v8, OS_LOG_TYPE_ERROR, "%13.5f: failed to decode %@", buf, 0x16u);

      }
    }
    v9 = 0;
  }
  else
  {
    v9 = -[AWAttentionLostEvent initWithTimestamp:tagIndex:attentionLostTimeout:]([AWAttentionLostEvent alloc], "initWithTimestamp:tagIndex:attentionLostTimeout:", v7, v5, v6);
  }

  return v9;
}

- (id)associatedObject
{
  return self->_associatedObject;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
