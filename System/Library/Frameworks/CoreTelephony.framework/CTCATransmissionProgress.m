@implementation CTCATransmissionProgress

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  const char *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCATransmissionProgress messageId](self, "messageId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", messageId=%@"), v4);

  -[CTCATransmissionProgress startedAt](self, "startedAt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", startedAt=%@"), v5);

  -[CTCATransmissionProgress estimatedDurationSeconds](self, "estimatedDurationSeconds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", estimatedDurationSeconds=%@"), v6);

  -[CTCATransmissionProgress progressPercents](self, "progressPercents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", progressPercents=%@"), v7);

  v8 = -[CTCATransmissionProgress payloadType](self, "payloadType");
  if (v8 > 7)
    v9 = "???";
  else
    v9 = off_1E1533D08[v8];
  objc_msgSend(v3, "appendFormat:", CFSTR(", payloadType=%s"), v9);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTCATransmissionProgress messageId](self, "messageId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setMessageId:", v7);

  -[CTCATransmissionProgress startedAt](self, "startedAt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setStartedAt:", v9);

  -[CTCATransmissionProgress estimatedDurationSeconds](self, "estimatedDurationSeconds");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setEstimatedDurationSeconds:", v11);

  -[CTCATransmissionProgress progressPercents](self, "progressPercents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setProgressPercents:", v13);

  objc_msgSend(v5, "setPayloadType:", -[CTCATransmissionProgress payloadType](self, "payloadType"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CTCATransmissionProgress messageId](self, "messageId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("messageId"));

  -[CTCATransmissionProgress startedAt](self, "startedAt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("startedAt"));

  -[CTCATransmissionProgress estimatedDurationSeconds](self, "estimatedDurationSeconds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("estimatedDurationSeconds"));

  -[CTCATransmissionProgress progressPercents](self, "progressPercents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("progressPercents"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[CTCATransmissionProgress payloadType](self, "payloadType"), CFSTR("payloadType"));
}

- (CTCATransmissionProgress)initWithCoder:(id)a3
{
  id v4;
  CTCATransmissionProgress *v5;
  uint64_t v6;
  NSString *messageId;
  uint64_t v8;
  NSDate *startedAt;
  uint64_t v10;
  NSNumber *estimatedDurationSeconds;
  uint64_t v12;
  NSNumber *progressPercents;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTCATransmissionProgress;
  v5 = -[CTCATransmissionProgress init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messageId"));
    v6 = objc_claimAutoreleasedReturnValue();
    messageId = v5->_messageId;
    v5->_messageId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startedAt"));
    v8 = objc_claimAutoreleasedReturnValue();
    startedAt = v5->_startedAt;
    v5->_startedAt = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("estimatedDurationSeconds"));
    v10 = objc_claimAutoreleasedReturnValue();
    estimatedDurationSeconds = v5->_estimatedDurationSeconds;
    v5->_estimatedDurationSeconds = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("progressPercents"));
    v12 = objc_claimAutoreleasedReturnValue();
    progressPercents = v5->_progressPercents;
    v5->_progressPercents = (NSNumber *)v12;

    v5->_payloadType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("payloadType"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(id)a3
{
  objc_storeStrong((id *)&self->_messageId, a3);
}

- (NSDate)startedAt
{
  return self->_startedAt;
}

- (void)setStartedAt:(id)a3
{
  objc_storeStrong((id *)&self->_startedAt, a3);
}

- (NSNumber)estimatedDurationSeconds
{
  return self->_estimatedDurationSeconds;
}

- (void)setEstimatedDurationSeconds:(id)a3
{
  objc_storeStrong((id *)&self->_estimatedDurationSeconds, a3);
}

- (NSNumber)progressPercents
{
  return self->_progressPercents;
}

- (void)setProgressPercents:(id)a3
{
  objc_storeStrong((id *)&self->_progressPercents, a3);
}

- (int64_t)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(int64_t)a3
{
  self->_payloadType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressPercents, 0);
  objc_storeStrong((id *)&self->_estimatedDurationSeconds, 0);
  objc_storeStrong((id *)&self->_startedAt, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
}

@end
