@implementation CXCallFailureContext

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXCallFailureContext title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CXCallFailureContext title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" title=%@"), v5);

  }
  -[CXCallFailureContext message](self, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CXCallFailureContext message](self, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" message=%@"), v7);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(" failureReason=%ld"), -[CXCallFailureContext failureReason](self, "failureReason"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" providerErrorCode=%ld"), -[CXCallFailureContext providerErrorCode](self, "providerErrorCode"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" providerEndedReason=%ld"), -[CXCallFailureContext providerEndedReason](self, "providerEndedReason"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" hasWiFiSettingsRemediation=%d"), -[CXCallFailureContext hasWiFiSettingsRemediation](self, "hasWiFiSettingsRemediation"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" hasCellularSettingsRemediation=%d"), -[CXCallFailureContext hasCellularSettingsRemediation](self, "hasCellularSettingsRemediation"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" hasDateAndTimeSettingsRemediation=%d"), -[CXCallFailureContext hasDateAndTimeSettingsRemediation](self, "hasDateAndTimeSettingsRemediation"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" hasLocationSettingsRemediation=%d"), -[CXCallFailureContext hasLocationSettingsRemediation](self, "hasLocationSettingsRemediation"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (id)sanitizedCopy
{
  return -[CXCallFailureContext sanitizedCopyWithZone:](self, "sanitizedCopyWithZone:", 0);
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CXCallFailureContext updateSanitizedCopy:withZone:](self, "updateSanitizedCopy:withZone:", v8, a4);
  -[CXCallFailureContext title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v6);

  -[CXCallFailureContext message](self, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMessage:", v7);

  objc_msgSend(v8, "setFailureReason:", -[CXCallFailureContext failureReason](self, "failureReason"));
  objc_msgSend(v8, "setProviderErrorCode:", -[CXCallFailureContext providerErrorCode](self, "providerErrorCode"));
  objc_msgSend(v8, "setProviderEndedReason:", -[CXCallFailureContext providerEndedReason](self, "providerEndedReason"));
  objc_msgSend(v8, "setHasWiFiSettingsRemediation:", -[CXCallFailureContext hasWiFiSettingsRemediation](self, "hasWiFiSettingsRemediation"));
  objc_msgSend(v8, "setHasCellularSettingsRemediation:", -[CXCallFailureContext hasCellularSettingsRemediation](self, "hasCellularSettingsRemediation"));
  objc_msgSend(v8, "setHasDateAndTimeSettingsRemediation:", -[CXCallFailureContext hasDateAndTimeSettingsRemediation](self, "hasDateAndTimeSettingsRemediation"));
  objc_msgSend(v8, "setHasLocationSettingsRemediation:", -[CXCallFailureContext hasLocationSettingsRemediation](self, "hasLocationSettingsRemediation"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CXCallFailureContext updateCopy:withZone:](self, "updateCopy:withZone:", v5, a3);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXCallFailureContext)initWithCoder:(id)a3
{
  id v4;
  CXCallFailureContext *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSString *message;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = -[CXCallFailureContext init](self, "init");
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_title);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_message);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v12;

    NSStringFromSelector(sel_failureReason);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_failureReason = objc_msgSend(v4, "decodeIntegerForKey:", v14);

    NSStringFromSelector(sel_providerErrorCode);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_providerErrorCode = objc_msgSend(v4, "decodeIntegerForKey:", v15);

    NSStringFromSelector(sel_providerEndedReason);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_providerEndedReason = objc_msgSend(v4, "decodeIntegerForKey:", v16);

    NSStringFromSelector(sel_hasWiFiSettingsRemediation);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasWiFiSettingsRemediation = objc_msgSend(v4, "decodeBoolForKey:", v17);

    NSStringFromSelector(sel_hasCellularSettingsRemediation);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasCellularSettingsRemediation = objc_msgSend(v4, "decodeBoolForKey:", v18);

    NSStringFromSelector(sel_hasDateAndTimeSettingsRemediation);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasDateAndTimeSettingsRemediation = objc_msgSend(v4, "decodeBoolForKey:", v19);

    NSStringFromSelector(sel_hasLocationSettingsRemediation);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasLocationSettingsRemediation = objc_msgSend(v4, "decodeBoolForKey:", v20);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  int64_t v11;
  void *v12;
  int64_t v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  _BOOL8 v21;
  id v22;

  v4 = a3;
  -[CXCallFailureContext title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_title);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[CXCallFailureContext message](self, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_message);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  v9 = -[CXCallFailureContext failureReason](self, "failureReason");
  NSStringFromSelector(sel_failureReason);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v9, v10);

  v11 = -[CXCallFailureContext providerErrorCode](self, "providerErrorCode");
  NSStringFromSelector(sel_providerErrorCode);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v11, v12);

  v13 = -[CXCallFailureContext providerEndedReason](self, "providerEndedReason");
  NSStringFromSelector(sel_providerEndedReason);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v13, v14);

  v15 = -[CXCallFailureContext hasWiFiSettingsRemediation](self, "hasWiFiSettingsRemediation");
  NSStringFromSelector(sel_hasWiFiSettingsRemediation);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v15, v16);

  v17 = -[CXCallFailureContext hasCellularSettingsRemediation](self, "hasCellularSettingsRemediation");
  NSStringFromSelector(sel_hasCellularSettingsRemediation);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v17, v18);

  v19 = -[CXCallFailureContext hasDateAndTimeSettingsRemediation](self, "hasDateAndTimeSettingsRemediation");
  NSStringFromSelector(sel_hasDateAndTimeSettingsRemediation);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v19, v20);

  v21 = -[CXCallFailureContext hasLocationSettingsRemediation](self, "hasLocationSettingsRemediation");
  NSStringFromSelector(sel_hasLocationSettingsRemediation);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v21, v22);

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)failureReason
{
  return self->_failureReason;
}

- (void)setFailureReason:(int64_t)a3
{
  self->_failureReason = a3;
}

- (int64_t)providerErrorCode
{
  return self->_providerErrorCode;
}

- (void)setProviderErrorCode:(int64_t)a3
{
  self->_providerErrorCode = a3;
}

- (int64_t)providerEndedReason
{
  return self->_providerEndedReason;
}

- (void)setProviderEndedReason:(int64_t)a3
{
  self->_providerEndedReason = a3;
}

- (BOOL)hasWiFiSettingsRemediation
{
  return self->_hasWiFiSettingsRemediation;
}

- (void)setHasWiFiSettingsRemediation:(BOOL)a3
{
  self->_hasWiFiSettingsRemediation = a3;
}

- (BOOL)hasCellularSettingsRemediation
{
  return self->_hasCellularSettingsRemediation;
}

- (void)setHasCellularSettingsRemediation:(BOOL)a3
{
  self->_hasCellularSettingsRemediation = a3;
}

- (BOOL)hasDateAndTimeSettingsRemediation
{
  return self->_hasDateAndTimeSettingsRemediation;
}

- (void)setHasDateAndTimeSettingsRemediation:(BOOL)a3
{
  self->_hasDateAndTimeSettingsRemediation = a3;
}

- (BOOL)hasLocationSettingsRemediation
{
  return self->_hasLocationSettingsRemediation;
}

- (void)setHasLocationSettingsRemediation:(BOOL)a3
{
  self->_hasLocationSettingsRemediation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
