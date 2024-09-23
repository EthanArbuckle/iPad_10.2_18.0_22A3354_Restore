@implementation NFContactlessPaymentStartEvent

- (NFContactlessPaymentStartEvent)initWithDictionary:(id)a3
{
  id v4;
  NFContactlessPaymentStartEvent *v5;
  uint64_t v6;
  NSString *appletIdentifier;
  uint64_t v8;
  NSString *keyIdentifier;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *spIdentifier;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NFContactlessPaymentStartEvent;
  v5 = -[NFContactlessPaymentStartEvent init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appletIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endPointIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("selectStatus"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_selectStatus = objc_msgSend(v10, "unsignedShortValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("paymentMode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_paymentMode = objc_msgSend(v11, "unsignedShortValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("spIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    spIdentifier = v5->_spIdentifier;
    v5->_spIdentifier = (NSString *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BackgroundTransaction"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_background = objc_msgSend(v14, "BOOLValue");

  }
  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)NFContactlessPaymentStartEvent;
  -[NFContactlessPaymentStartEvent description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ { applet=%@ endpoint=%@ select=0x%04x mode=0x%04x spid=%@ background=%d }"), v4, self->_appletIdentifier, self->_keyIdentifier, self->_selectStatus, self->_paymentMode, self->_spIdentifier, self->_background);

  return v5;
}

- (id)asDictionary
{
  id v3;
  NSString *appletIdentifier;
  NSString *keyIdentifier;
  void *v6;
  void *v7;
  NSString *spIdentifier;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  appletIdentifier = self->_appletIdentifier;
  keyIdentifier = self->_keyIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_selectStatus);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_paymentMode);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  spIdentifier = self->_spIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_background);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", appletIdentifier, CFSTR("applet"), keyIdentifier, CFSTR("endpoint"), v6, CFSTR("selectStatus"), v7, CFSTR("mode"), spIdentifier, CFSTR("spIdentifier"), v9, CFSTR("background"), 0);

  return v10;
}

- (id)appletIdentifier
{
  return self->_appletIdentifier;
}

- (void)_setApplet:(id)a3
{
  objc_storeStrong((id *)&self->_applet, a3);
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_keyIdentifier, a3);
}

- (NFContactlessPaymentStartEvent)initWithCoder:(id)a3
{
  id v4;
  NFContactlessPaymentStartEvent *v5;
  uint64_t v6;
  NSString *appletIdentifier;
  uint64_t v8;
  NSString *keyIdentifier;
  uint64_t v10;
  NSString *spIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFContactlessPaymentStartEvent;
  v5 = -[NFContactlessPaymentStartEvent init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appletIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endPointIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v8;

    v5->_selectStatus = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("selectStatus"));
    v5->_paymentMode = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("paymentMode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("spIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    spIdentifier = v5->_spIdentifier;
    v5->_spIdentifier = (NSString *)v10;

    v5->_background = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("BackgroundTransaction"));
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyIdentifier, CFSTR("endPointIdentifier"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_selectStatus, CFSTR("selectStatus"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_paymentMode, CFSTR("paymentMode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_spIdentifier, CFSTR("spIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_background, CFSTR("BackgroundTransaction"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFApplet)applet
{
  return self->_applet;
}

- (unsigned)selectStatus
{
  return self->_selectStatus;
}

- (unsigned)paymentMode
{
  return self->_paymentMode;
}

- (NSString)spIdentifier
{
  return self->_spIdentifier;
}

- (BOOL)background
{
  return self->_background;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spIdentifier, 0);
  objc_storeStrong((id *)&self->_applet, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
}

@end
