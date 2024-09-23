@implementation _LTTaskContext

- (_LTTaskContext)initWithSessionID:(id)a3 taskHint:(int64_t)a4 localePair:(id)a5 deviceOS:(id)a6 deviceType:(id)a7 appIdentifier:(id)a8
{
  id v15;
  id v16;
  id v17;
  _LTTaskContext *v18;
  _LTTaskContext *v19;
  _LTTaskContext *v20;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)_LTTaskContext;
  v18 = -[_LTTaskContext init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sessionID, a3);
    v19->_taskHint = a4;
    objc_storeStrong((id *)&v19->_localePair, a5);
    objc_storeStrong((id *)&v19->_deviceOS, a6);
    objc_storeStrong((id *)&v19->_deviceType, a7);
    objc_storeStrong((id *)&v19->_appIdentifier, a8);
    v20 = v19;
  }

  return v19;
}

- (_LTTaskContext)initWithCoder:(id)a3
{
  id v4;
  _LTTaskContext *v5;
  uint64_t v6;
  NSString *sessionID;
  uint64_t v8;
  _LTLocalePair *localePair;
  uint64_t v10;
  NSString *deviceOS;
  uint64_t v12;
  NSString *deviceType;
  uint64_t v14;
  NSString *appIdentifier;
  _LTTaskContext *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_LTTaskContext;
  v5 = -[_LTTaskContext init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionID"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSString *)v6;

    v5->_taskHint = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("taskHint"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localePair"));
    v8 = objc_claimAutoreleasedReturnValue();
    localePair = v5->_localePair;
    v5->_localePair = (_LTLocalePair *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceOS"));
    v10 = objc_claimAutoreleasedReturnValue();
    deviceOS = v5->_deviceOS;
    v5->_deviceOS = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceType"));
    v12 = objc_claimAutoreleasedReturnValue();
    deviceType = v5->_deviceType;
    v5->_deviceType = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    appIdentifier = v5->_appIdentifier;
    v5->_appIdentifier = (NSString *)v14;

    v16 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sessionID;
  id v5;

  sessionID = self->_sessionID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sessionID, CFSTR("sessionID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_taskHint, CFSTR("taskHint"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localePair, CFSTR("localePair"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceOS, CFSTR("deviceOS"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceType, CFSTR("deviceType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appIdentifier, CFSTR("appIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (int64_t)taskHint
{
  return self->_taskHint;
}

- (_LTLocalePair)localePair
{
  return self->_localePair;
}

- (NSString)deviceOS
{
  return self->_deviceOS;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_deviceOS, 0);
  objc_storeStrong((id *)&self->_localePair, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
