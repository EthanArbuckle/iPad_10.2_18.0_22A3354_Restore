@implementation _LTSELFLoggingEventData

- (_LTSELFLoggingEventData)initWithType:(int64_t)a3 invocationId:(id)a4
{
  id v7;
  _LTSELFLoggingEventData *v8;
  _LTSELFLoggingEventData *v9;
  _LTSELFLoggingEventData *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_LTSELFLoggingEventData;
  v8 = -[_LTSELFLoggingEventData init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_invocationId, a4);
    v10 = v9;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_invocationId, CFSTR("invocationId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startInvocationOptions, CFSTR("startInvocationOptions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_qssSessionId, CFSTR("qssSessionId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_invocationEndedError, CFSTR("invocationEndedError"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_invocationCancelledReason, CFSTR("invocationCancelledReason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_translationPayload, CFSTR("translationPayload"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_translationLocalePair, CFSTR("translationLocalePair"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_translationTTSData, CFSTR("translationTTSData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_translationLIDData, CFSTR("translationLIDData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_untrustedClientIdentifier, CFSTR("untrustedClientIdentifier"));

}

- (_LTSELFLoggingEventData)initWithCoder:(id)a3
{
  id v4;
  _LTSELFLoggingEventData *v5;
  uint64_t v6;
  NSUUID *invocationId;
  uint64_t v8;
  _LTSELFLoggingInvocationOptions *startInvocationOptions;
  uint64_t v10;
  NSUUID *qssSessionId;
  uint64_t v12;
  NSError *invocationEndedError;
  uint64_t v14;
  NSString *invocationCancelledReason;
  uint64_t v16;
  NSString *translationPayload;
  uint64_t v18;
  _LTLocalePair *translationLocalePair;
  uint64_t v20;
  _LTSELFLoggingTranslationTTSData *translationTTSData;
  uint64_t v22;
  _LTSELFLoggingTranslationLIDData *translationLIDData;
  uint64_t v24;
  NSString *untrustedClientIdentifier;
  _LTSELFLoggingEventData *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)_LTSELFLoggingEventData;
  v5 = -[_LTSELFLoggingEventData init](&v28, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invocationId"));
    v6 = objc_claimAutoreleasedReturnValue();
    invocationId = v5->_invocationId;
    v5->_invocationId = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startInvocationOptions"));
    v8 = objc_claimAutoreleasedReturnValue();
    startInvocationOptions = v5->_startInvocationOptions;
    v5->_startInvocationOptions = (_LTSELFLoggingInvocationOptions *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("qssSessionId"));
    v10 = objc_claimAutoreleasedReturnValue();
    qssSessionId = v5->_qssSessionId;
    v5->_qssSessionId = (NSUUID *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invocationEndedError"));
    v12 = objc_claimAutoreleasedReturnValue();
    invocationEndedError = v5->_invocationEndedError;
    v5->_invocationEndedError = (NSError *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invocationCancelledReason"));
    v14 = objc_claimAutoreleasedReturnValue();
    invocationCancelledReason = v5->_invocationCancelledReason;
    v5->_invocationCancelledReason = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("translationPayload"));
    v16 = objc_claimAutoreleasedReturnValue();
    translationPayload = v5->_translationPayload;
    v5->_translationPayload = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("translationLocalePair"));
    v18 = objc_claimAutoreleasedReturnValue();
    translationLocalePair = v5->_translationLocalePair;
    v5->_translationLocalePair = (_LTLocalePair *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("translationTTSData"));
    v20 = objc_claimAutoreleasedReturnValue();
    translationTTSData = v5->_translationTTSData;
    v5->_translationTTSData = (_LTSELFLoggingTranslationTTSData *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("translationLIDData"));
    v22 = objc_claimAutoreleasedReturnValue();
    translationLIDData = v5->_translationLIDData;
    v5->_translationLIDData = (_LTSELFLoggingTranslationLIDData *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("untrustedClientIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    untrustedClientIdentifier = v5->_untrustedClientIdentifier;
    v5->_untrustedClientIdentifier = (NSString *)v24;

    v26 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _LTSELFLoggingEventData *v4;
  int64_t v5;
  void *v6;
  _LTSELFLoggingEventData *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = [_LTSELFLoggingEventData alloc];
  v5 = -[_LTSELFLoggingEventData type](self, "type");
  -[_LTSELFLoggingEventData invocationId](self, "invocationId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_LTSELFLoggingEventData initWithType:invocationId:](v4, "initWithType:invocationId:", v5, v6);

  -[_LTSELFLoggingEventData startInvocationOptions](self, "startInvocationOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTSELFLoggingEventData setStartInvocationOptions:](v7, "setStartInvocationOptions:", v8);

  -[_LTSELFLoggingEventData qssSessionId](self, "qssSessionId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTSELFLoggingEventData setQssSessionId:](v7, "setQssSessionId:", v9);

  -[_LTSELFLoggingEventData invocationEndedError](self, "invocationEndedError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTSELFLoggingEventData setInvocationEndedError:](v7, "setInvocationEndedError:", v10);

  -[_LTSELFLoggingEventData invocationCancelledReason](self, "invocationCancelledReason");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTSELFLoggingEventData setInvocationCancelledReason:](v7, "setInvocationCancelledReason:", v11);

  -[_LTSELFLoggingEventData translationPayload](self, "translationPayload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTSELFLoggingEventData setTranslationPayload:](v7, "setTranslationPayload:", v12);

  -[_LTSELFLoggingEventData translationLocalePair](self, "translationLocalePair");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTSELFLoggingEventData setTranslationLocalePair:](v7, "setTranslationLocalePair:", v13);

  -[_LTSELFLoggingEventData translationTTSData](self, "translationTTSData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");
  -[_LTSELFLoggingEventData setTranslationTTSData:](v7, "setTranslationTTSData:", v15);

  -[_LTSELFLoggingEventData untrustedClientIdentifier](self, "untrustedClientIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTSELFLoggingEventData setUntrustedClientIdentifier:](v7, "setUntrustedClientIdentifier:", v16);

  -[_LTSELFLoggingEventData trustedClientIdentifier](self, "trustedClientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTSELFLoggingEventData setTrustedClientIdentifier:](v7, "setTrustedClientIdentifier:", v17);

  -[_LTSELFLoggingEventData translationLIDData](self, "translationLIDData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");
  -[_LTSELFLoggingEventData setTranslationLIDData:](v7, "setTranslationLIDData:", v19);

  return v7;
}

- (int64_t)type
{
  return self->_type;
}

- (NSUUID)invocationId
{
  return self->_invocationId;
}

- (_LTSELFLoggingInvocationOptions)startInvocationOptions
{
  return self->_startInvocationOptions;
}

- (void)setStartInvocationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_startInvocationOptions, a3);
}

- (NSUUID)qssSessionId
{
  return self->_qssSessionId;
}

- (void)setQssSessionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSError)invocationEndedError
{
  return self->_invocationEndedError;
}

- (void)setInvocationEndedError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)invocationCancelledReason
{
  return self->_invocationCancelledReason;
}

- (void)setInvocationCancelledReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)translationPayload
{
  return self->_translationPayload;
}

- (void)setTranslationPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (_LTLocalePair)translationLocalePair
{
  return self->_translationLocalePair;
}

- (void)setTranslationLocalePair:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (_LTSELFLoggingTranslationTTSData)translationTTSData
{
  return self->_translationTTSData;
}

- (void)setTranslationTTSData:(id)a3
{
  objc_storeStrong((id *)&self->_translationTTSData, a3);
}

- (_LTSELFLoggingTranslationLIDData)translationLIDData
{
  return self->_translationLIDData;
}

- (void)setTranslationLIDData:(id)a3
{
  objc_storeStrong((id *)&self->_translationLIDData, a3);
}

- (NSString)untrustedClientIdentifier
{
  return self->_untrustedClientIdentifier;
}

- (void)setUntrustedClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)trustedClientIdentifier
{
  return self->_trustedClientIdentifier;
}

- (void)setTrustedClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedClientIdentifier, 0);
  objc_storeStrong((id *)&self->_untrustedClientIdentifier, 0);
  objc_storeStrong((id *)&self->_translationLIDData, 0);
  objc_storeStrong((id *)&self->_translationTTSData, 0);
  objc_storeStrong((id *)&self->_translationLocalePair, 0);
  objc_storeStrong((id *)&self->_translationPayload, 0);
  objc_storeStrong((id *)&self->_invocationCancelledReason, 0);
  objc_storeStrong((id *)&self->_invocationEndedError, 0);
  objc_storeStrong((id *)&self->_qssSessionId, 0);
  objc_storeStrong((id *)&self->_startInvocationOptions, 0);
  objc_storeStrong((id *)&self->_invocationId, 0);
}

@end
