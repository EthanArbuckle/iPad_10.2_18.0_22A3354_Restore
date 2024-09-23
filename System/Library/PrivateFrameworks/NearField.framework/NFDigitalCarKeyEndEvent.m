@implementation NFDigitalCarKeyEndEvent

- (id)initFromContactlessPaymentEndEvent:(id)a3
{
  id v4;
  NFDigitalCarKeyEndEvent *v5;
  uint64_t v6;
  NSString *appletIdentifier;
  uint64_t v8;
  NSString *keyIdentifier;
  void *v10;
  void *v11;
  uint64_t v12;
  NSNumber *brandCode;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NFDigitalCarKeyEndEvent;
  v5 = -[NFDigitalCarKeyEndEvent init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "appletIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v6;

    objc_msgSend(v4, "keyIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v8;

    v5->_didError = objc_msgSend(v4, "didError");
    v5->_result = objc_msgSend(v4, "result");
    objc_msgSend(v4, "parsedInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "parsedInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PairingModeBrandCode"));
      v12 = objc_claimAutoreleasedReturnValue();
      brandCode = v5->_brandCode;
      v5->_brandCode = (NSNumber *)v12;

    }
  }

  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  NSString *appletIdentifier;
  NSString *keyIdentifier;
  const __CFString *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11.receiver = self;
  v11.super_class = (Class)NFDigitalCarKeyEndEvent;
  -[NFDigitalCarKeyEndEvent description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  appletIdentifier = self->_appletIdentifier;
  keyIdentifier = self->_keyIdentifier;
  if (self->_didError)
    v7 = CFSTR("yes");
  else
    v7 = CFSTR("no");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_result);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ { applet=%@ endpoint=%@ didError=%@ result=%@ brandCode=%@ }"), v4, appletIdentifier, keyIdentifier, v7, v8, self->_brandCode);

  return v9;
}

- (id)asDictionary
{
  NSString *appletIdentifier;
  NSString *keyIdentifier;
  const __CFString *v5;
  void *v6;
  NSNumber *brandCode;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  appletIdentifier = self->_appletIdentifier;
  v10[0] = CFSTR("applet");
  v10[1] = CFSTR("endpoint");
  keyIdentifier = self->_keyIdentifier;
  v11[0] = appletIdentifier;
  v11[1] = keyIdentifier;
  v5 = CFSTR("no");
  if (self->_didError)
    v5 = CFSTR("yes");
  v11[2] = v5;
  v10[2] = CFSTR("didError");
  v10[3] = CFSTR("result");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_result);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = CFSTR("brandCode");
  brandCode = self->_brandCode;
  v11[3] = v6;
  v11[4] = brandCode;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)appletIdentifier
{
  return self->_appletIdentifier;
}

- (void)_setApplet:(id)a3
{
  objc_storeStrong((id *)&self->_applet, a3);
}

- (NFDigitalCarKeyEndEvent)initWithCoder:(id)a3
{
  id v4;
  NFDigitalCarKeyEndEvent *v5;
  uint64_t v6;
  NSString *appletIdentifier;
  uint64_t v8;
  NSString *keyIdentifier;
  uint64_t v10;
  NSNumber *brandCode;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFDigitalCarKeyEndEvent;
  v5 = -[NFDigitalCarKeyEndEvent init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appletIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v8;

    v5->_didError = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("didError"));
    v5->_result = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("result"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brandCode"));
    v10 = objc_claimAutoreleasedReturnValue();
    brandCode = v5->_brandCode;
    v5->_brandCode = (NSNumber *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *appletIdentifier;
  id v5;

  appletIdentifier = self->_appletIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", appletIdentifier, CFSTR("appletIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyIdentifier, CFSTR("keyIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_didError, CFSTR("didError"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_result, CFSTR("result"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_brandCode, CFSTR("brandCode"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFApplet)applet
{
  return self->_applet;
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (BOOL)didError
{
  return self->_didError;
}

- (unsigned)result
{
  return self->_result;
}

- (NSNumber)brandCode
{
  return self->_brandCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brandCode, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_applet, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
}

@end
