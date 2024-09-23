@implementation AVCSessionABTestConfiguration

- (id)description
{
  void *v3;
  id v4;
  const char *v5;
  const char *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)AVCSessionABTestConfiguration;
  v4 = -[AVCSessionABTestConfiguration description](&v8, sel_description);
  v5 = "YES";
  if (self->_oneToOneAuthenticationTagEnabled)
    v6 = "YES";
  else
    v6 = "NO";
  if (!self->_gftTLEEnabled)
    v5 = "NO";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("{ %@ oneToOneAuthenticationTagEnabled=%s, gftTLEEnabled=%s }"), v4, v6, v5);
}

+ (id)createWithDictionary:(id)a3
{
  AVCSessionABTestConfiguration *v4;

  v4 = objc_alloc_init(AVCSessionABTestConfiguration);
  if (a3)
  {
    -[AVCSessionABTestConfiguration setOneToOneAuthenticationTagEnabled:](v4, "setOneToOneAuthenticationTagEnabled:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionABTestOneOnOneAuthtagEnabled")), "BOOLValue"));
    -[AVCSessionABTestConfiguration setGftTLEEnabled:](v4, "setGftTLEEnabled:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionABTestGftTLEEnabled")), "BOOLValue"));
  }
  return v4;
}

- (id)dictionary
{
  uint64_t v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("vcSessionABTestOneOnOneAuthtagEnabled");
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_oneToOneAuthenticationTagEnabled);
  v5[1] = CFSTR("vcSessionABTestGftTLEEnabled");
  v6[0] = v3;
  v6[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_gftTLEEnabled);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setOneToOneAuthenticationTagEnabled:", -[AVCSessionABTestConfiguration isOneToOneAuthenticationTagEnabled](self, "isOneToOneAuthenticationTagEnabled"));
  objc_msgSend(v4, "setGftTLEEnabled:", -[AVCSessionABTestConfiguration isGftTLEEnabled](self, "isGftTLEEnabled"));
  return v4;
}

- (BOOL)isOneToOneAuthenticationTagEnabled
{
  return self->_oneToOneAuthenticationTagEnabled;
}

- (void)setOneToOneAuthenticationTagEnabled:(BOOL)a3
{
  self->_oneToOneAuthenticationTagEnabled = a3;
}

- (BOOL)isGftTLEEnabled
{
  return self->_gftTLEEnabled;
}

- (void)setGftTLEEnabled:(BOOL)a3
{
  self->_gftTLEEnabled = a3;
}

@end
