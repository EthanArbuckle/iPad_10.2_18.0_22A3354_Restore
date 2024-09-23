@implementation BRCErrorGrouping

- (BRCErrorGrouping)initWithError:(id)a3 pcsChained:(BOOL)a4 enhancedDrivePrivacyEnabled:(BOOL)a5
{
  id v9;
  BRCErrorGrouping *v10;
  BRCErrorGrouping *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCErrorGrouping;
  v10 = -[BRCErrorGrouping init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_error, a3);
    v11->_isPCSChained = a4;
    v11->_isEnhancedDrivePrivacyEnabled = a5;
  }

  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  const char *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = "y";
  if (self->_isPCSChained)
    v6 = "y";
  else
    v6 = "n";
  if (!self->_isEnhancedDrivePrivacyEnabled)
    v5 = "n";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ error:%@ pcs:%s enhancedDrivePrivacyEnabled:%s>"), v4, self->_error, v6, v5);
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[NSError domain](self->_error, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSError code](self->_error, "code") + v4;

  if (self->_isPCSChained)
    return -(uint64_t)v5;
  else
    return v5;
}

- (BOOL)isEqualToErrorGrouping:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSInteger v8;
  void *v9;
  int isPCSChained;
  int isEnhancedDrivePrivacyEnabled;
  BOOL v12;

  v4 = a3;
  -[NSError domain](self->_error, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v7))
  {
    v8 = -[NSError code](self->_error, "code");
    objc_msgSend(v4, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == objc_msgSend(v9, "code")
      && (isPCSChained = self->_isPCSChained, isPCSChained == objc_msgSend(v4, "isPCSChained")))
    {
      isEnhancedDrivePrivacyEnabled = self->_isEnhancedDrivePrivacyEnabled;
      v12 = isEnhancedDrivePrivacyEnabled == objc_msgSend(v4, "isEnhancedDrivePrivacyEnabled");
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[BRCErrorGrouping isEqualToErrorGrouping:](self, "isEqualToErrorGrouping:", v4);

  return v5;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)isPCSChained
{
  return self->_isPCSChained;
}

- (BOOL)isEnhancedDrivePrivacyEnabled
{
  return self->_isEnhancedDrivePrivacyEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
