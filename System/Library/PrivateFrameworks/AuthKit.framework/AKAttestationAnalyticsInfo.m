@implementation AKAttestationAnalyticsInfo

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSString copy](self->_endPointVIP, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v4[3] = self->_headerSize;
  v4[6] = self->_errorCode;
  v7 = -[NSString copy](self->_errorDomain, "copy");
  v8 = (void *)v4[5];
  v4[5] = v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAttestationAnalyticsInfo)initWithCoder:(id)a3
{
  id v4;
  AKAttestationAnalyticsInfo *v5;
  uint64_t v6;
  NSString *endPointVIP;
  uint64_t v8;
  NSString *requestMethod;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *errorDomain;

  v4 = a3;
  v5 = -[AKAttestationAnalyticsInfo init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_endPointVIP"));
    v6 = objc_claimAutoreleasedReturnValue();
    endPointVIP = v5->_endPointVIP;
    v5->_endPointVIP = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_requestMethod"));
    v8 = objc_claimAutoreleasedReturnValue();
    requestMethod = v5->_requestMethod;
    v5->_requestMethod = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_headerSize"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_headerSize = objc_msgSend(v10, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bodySize"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_bodySize = objc_msgSend(v11, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_errorCode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_errorCode = objc_msgSend(v12, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_errorDomain"));
    v13 = objc_claimAutoreleasedReturnValue();
    errorDomain = v5->_errorDomain;
    v5->_errorDomain = (NSString *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *endPointVIP;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  endPointVIP = self->_endPointVIP;
  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", endPointVIP, CFSTR("_endPointVIP"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_requestMethod, CFSTR("_requestMethod"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_headerSize);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("_headerSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_bodySize);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("_headerSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_errorCode);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("_errorCode"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_errorDomain, CFSTR("_errorDomain"));
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AKAttestationAnalyticsInfo: host: %@, headerSize: %lu, bodySize: %lu"), self->_endPointVIP, self->_headerSize, self->_bodySize);
}

- (NSString)endPointVIP
{
  return self->_endPointVIP;
}

- (void)setEndPointVIP:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)requestMethod
{
  return self->_requestMethod;
}

- (void)setRequestMethod:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)headerSize
{
  return self->_headerSize;
}

- (void)setHeaderSize:(unint64_t)a3
{
  self->_headerSize = a3;
}

- (unint64_t)bodySize
{
  return self->_bodySize;
}

- (void)setBodySize:(unint64_t)a3
{
  self->_bodySize = a3;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (int64_t)responseCode
{
  return self->_responseCode;
}

- (void)setResponseCode:(int64_t)a3
{
  self->_responseCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_requestMethod, 0);
  objc_storeStrong((id *)&self->_endPointVIP, 0);
}

@end
