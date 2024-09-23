@implementation NFDigitalCarKeyStartEvent

- (id)initFromContactlessPaymentStartEvent:(id)a3
{
  id v4;
  NFDigitalCarKeyStartEvent *v5;
  uint64_t v6;
  NSString *appletIdentifier;
  uint64_t v8;
  NSString *keyIdentifier;
  uint64_t v10;
  NSString *spIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFDigitalCarKeyStartEvent;
  v5 = -[NFDigitalCarKeyStartEvent init](&v13, sel_init);
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

    objc_msgSend(v4, "spIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    spIdentifier = v5->_spIdentifier;
    v5->_spIdentifier = (NSString *)v10;

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
  v7.super_class = (Class)NFDigitalCarKeyStartEvent;
  -[NFDigitalCarKeyStartEvent description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ { applet=%@ endpoint=%@ spid=%@ }"), v4, self->_appletIdentifier, self->_keyIdentifier, self->_spIdentifier);

  return v5;
}

- (id)asDictionary
{
  NSString *appletIdentifier;
  NSString *keyIdentifier;
  NSString *spIdentifier;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  appletIdentifier = self->_appletIdentifier;
  v6[0] = CFSTR("applet");
  v6[1] = CFSTR("endpoint");
  keyIdentifier = self->_keyIdentifier;
  spIdentifier = self->_spIdentifier;
  v7[0] = appletIdentifier;
  v7[1] = keyIdentifier;
  v6[2] = CFSTR("spIdentifier");
  v7[2] = spIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setApplet:(id)a3
{
  objc_storeStrong((id *)&self->_applet, a3);
}

- (NFDigitalCarKeyStartEvent)initWithCoder:(id)a3
{
  id v4;
  NFDigitalCarKeyStartEvent *v5;
  uint64_t v6;
  NSString *appletIdentifier;
  uint64_t v8;
  NSString *keyIdentifier;
  uint64_t v10;
  NSString *spIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFDigitalCarKeyStartEvent;
  v5 = -[NFDigitalCarKeyStartEvent init](&v13, sel_init);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("spIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    spIdentifier = v5->_spIdentifier;
    v5->_spIdentifier = (NSString *)v10;

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
  objc_msgSend(v5, "encodeObject:forKey:", self->_spIdentifier, CFSTR("spIdentifier"));

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

- (NSString)spIdentifier
{
  return self->_spIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_applet, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
}

@end
