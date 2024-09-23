@implementation CTPlanSetupDetails

- (CTPlanSetupDetails)initWithInBuddy:(BOOL)a3 carrierName:(id)a4 setupType:(unint64_t)a5 setupResult:(unint64_t)a6 duration:(unint64_t)a7
{
  id v13;
  CTPlanSetupDetails *v14;
  CTPlanSetupDetails *v15;
  objc_super v17;

  v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CTPlanSetupDetails;
  v14 = -[CTPlanSetupDetails init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_inBuddy = a3;
    objc_storeStrong((id *)&v14->_carrierName, a4);
    v15->_setupType = a5;
    v15->_setupResult = a6;
    v15->_duration = a7;
  }

  return v15;
}

- (id)description
{
  void *v3;
  _BOOL4 v4;
  const char *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTPlanSetupDetails inBuddy](self, "inBuddy");
  v5 = "NO";
  if (v4)
    v5 = "YES";
  objc_msgSend(v3, "appendFormat:", CFSTR(" inBuddy=%s"), v5);
  -[CTPlanSetupDetails carrierName](self, "carrierName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CTPlanSetupDetails carrierName](self, "carrierName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" carrierName=%@"), v7);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(" setupType=%s"), CTPlanSetupTypeAsString(-[CTPlanSetupDetails setupType](self, "setupType")));
  objc_msgSend(v3, "appendFormat:", CFSTR(" setupResult=%s"), CTPlanSetupResultTypeAsString(-[CTPlanSetupDetails setupResult](self, "setupResult")));
  objc_msgSend(v3, "appendFormat:", CFSTR(" duration=%lu"), -[CTPlanSetupDetails duration](self, "duration"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CTPlanSetupDetails *v4;
  _BOOL4 v5;
  BOOL v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v4 = (CTPlanSetupDetails *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[CTPlanSetupDetails inBuddy](self, "inBuddy"), v5 == -[CTPlanSetupDetails inBuddy](v4, "inBuddy")))
    {
      -[CTPlanSetupDetails carrierName](self, "carrierName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTPlanSetupDetails carrierName](v4, "carrierName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v8)
        && (v9 = -[CTPlanSetupDetails setupType](self, "setupType"),
            v9 == -[CTPlanSetupDetails setupType](v4, "setupType"))
        && (v10 = -[CTPlanSetupDetails setupResult](self, "setupResult"),
            v10 == -[CTPlanSetupDetails setupResult](v4, "setupResult")))
      {
        v11 = -[CTPlanSetupDetails duration](self, "duration");
        v6 = v11 == -[CTPlanSetupDetails duration](v4, "duration");
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTPlanSetupDetails)initWithCoder:(id)a3
{
  id v4;
  CTPlanSetupDetails *v5;
  uint64_t v6;
  NSString *carrierName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTPlanSetupDetails;
  v5 = -[CTPlanSetupDetails init](&v9, sel_init);
  if (v5)
  {
    v5->_inBuddy = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inBuddy"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("carrierName"));
    v6 = objc_claimAutoreleasedReturnValue();
    carrierName = v5->_carrierName;
    v5->_carrierName = (NSString *)v6;

    v5->_setupType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("setupType"));
    v5->_setupResult = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("setupResult"));
    v5->_duration = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("duration"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[CTPlanSetupDetails inBuddy](self, "inBuddy"), CFSTR("inBuddy"));
  -[CTPlanSetupDetails carrierName](self, "carrierName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("carrierName"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[CTPlanSetupDetails setupType](self, "setupType"), CFSTR("setupType"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTPlanSetupDetails setupResult](self, "setupResult"), CFSTR("setupResult"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTPlanSetupDetails duration](self, "duration"), CFSTR("duration"));

}

- (BOOL)inBuddy
{
  return self->_inBuddy;
}

- (void)setInBuddy:(BOOL)a3
{
  self->_inBuddy = a3;
}

- (NSString)carrierName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCarrierName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)setupType
{
  return self->_setupType;
}

- (void)setSetupType:(unint64_t)a3
{
  self->_setupType = a3;
}

- (unint64_t)setupResult
{
  return self->_setupResult;
}

- (void)setSetupResult:(unint64_t)a3
{
  self->_setupResult = a3;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierName, 0);
}

@end
