@implementation AATrustedContactHealthInfo

- (AATrustedContactHealthInfo)initWithID:(id)a3 lastValidCheckTimeStamp:(id)a4
{
  id v7;
  id v8;
  AATrustedContactHealthInfo *v9;
  AATrustedContactHealthInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AATrustedContactHealthInfo;
  v9 = -[AATrustedContactHealthInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_lastValidCheckTimestamp, a4);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("_identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastValidCheckTimestamp, CFSTR("_lastValidCheckTimestamp"));

}

- (AATrustedContactHealthInfo)initWithCoder:(id)a3
{
  id v4;
  AATrustedContactHealthInfo *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  NSDate *lastValidCheckTimestamp;

  v4 = a3;
  v5 = -[AATrustedContactHealthInfo init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastValidCheckTimestamp"));
    v8 = objc_claimAutoreleasedReturnValue();
    lastValidCheckTimestamp = v5->_lastValidCheckTimestamp;
    v5->_lastValidCheckTimestamp = (NSDate *)v8;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSUUID copy](self->_identifier, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSDate copy](self->_lastValidCheckTimestamp, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> Trusted Contact Health Info : Identifier: %@ \nLast Check Timestamp: %@"), objc_opt_class(), self, self->_identifier, self->_lastValidCheckTimestamp);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)lastValidCheckTimestamp
{
  return self->_lastValidCheckTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastValidCheckTimestamp, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
