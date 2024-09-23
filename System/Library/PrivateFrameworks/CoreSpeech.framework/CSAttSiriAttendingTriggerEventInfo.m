@implementation CSAttSiriAttendingTriggerEventInfo

- (CSAttSiriAttendingTriggerEventInfo)initWithCoder:(id)a3
{
  id v4;
  CSAttSiriAttendingTriggerEventInfo *v5;
  uint64_t v6;
  CSAttSiriRequestContext *ctx;
  uint64_t v8;
  NSString *detectedToken;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSAttSiriAttendingTriggerEventInfo;
  v5 = -[CSAttSiriAttendingTriggerEventInfo init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RequestContext"));
    v6 = objc_claimAutoreleasedReturnValue();
    ctx = v5->_ctx;
    v5->_ctx = (CSAttSiriRequestContext *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DetectedToken"));
    v8 = objc_claimAutoreleasedReturnValue();
    detectedToken = v5->_detectedToken;
    v5->_detectedToken = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TriggerMachTime"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_triggerMachTime = objc_msgSend(v10, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TriggerAbsStartSampleId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_triggerAbsStartSampleId = objc_msgSend(v11, "unsignedLongLongValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  CSAttSiriRequestContext *ctx;
  id v5;
  void *v6;
  id v7;

  ctx = self->_ctx;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", ctx, CFSTR("RequestContext"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detectedToken, CFSTR("DetectedToken"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_triggerMachTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("TriggerMachTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_triggerAbsStartSampleId);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("TriggerAbsStartSampleId"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{attendingCtx: %@, detctedToken: %@, triggerMachTime=%llu, triggerStartSampleId=%llu}"), self->_ctx, self->_detectedToken, self->_triggerMachTime, self->_triggerAbsStartSampleId);
}

- (CSAttSiriRequestContext)ctx
{
  return self->_ctx;
}

- (void)setCtx:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)detectedToken
{
  return self->_detectedToken;
}

- (void)setDetectedToken:(id)a3
{
  objc_storeStrong((id *)&self->_detectedToken, a3);
}

- (unint64_t)triggerMachTime
{
  return self->_triggerMachTime;
}

- (void)setTriggerMachTime:(unint64_t)a3
{
  self->_triggerMachTime = a3;
}

- (unint64_t)triggerAbsStartSampleId
{
  return self->_triggerAbsStartSampleId;
}

- (void)setTriggerAbsStartSampleId:(unint64_t)a3
{
  self->_triggerAbsStartSampleId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedToken, 0);
  objc_storeStrong((id *)&self->_ctx, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
