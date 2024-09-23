@implementation CTNRStatus

+ (id)default
{
  return -[CTNRStatus initWithSASwitchVisible:saSwitchConfigurable:saDisabledByBaseband:saDisabledReasonMask:nsaDisabledByBaseband:nsaDisabledReasonMask:]([CTNRStatus alloc], "initWithSASwitchVisible:saSwitchConfigurable:saDisabledByBaseband:saDisabledReasonMask:nsaDisabledByBaseband:nsaDisabledReasonMask:", 0, 0, 1, 0, 1, 0);
}

- (CTNRStatus)initWithSASwitchVisible:(BOOL)a3 saSwitchConfigurable:(BOOL)a4 saDisabledByBaseband:(BOOL)a5 saDisabledReasonMask:(unint64_t)a6 nsaDisabledByBaseband:(BOOL)a7 nsaDisabledReasonMask:(unint64_t)a8
{
  CTNRStatus *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CTNRStatus;
  result = -[CTNRStatus init](&v15, sel_init);
  if (result)
  {
    result->_saSwitchVisible = a3;
    result->_saSwitchConfigurable = a4;
    result->_saDisabled = a5;
    result->_nsaDisabled = a7;
    result->_saDisabledReasonMask = a6;
    result->_nsaDisabledReasonMask = a8;
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CTNRStatus isSASwitchVisible](self, "isSASwitchVisible"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CTNRStatus isSASwitchConfigurable](self, "isSASwitchConfigurable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" SA switch=(visible:%@, configurable:%@)"), v4, v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CTNRStatus isSADisabled](self, "isSADisabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CTNRStatus saDisabledReasonMask](self, "saDisabledReasonMask"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" SA=(disabled:%@, reasonMask:%@)"), v6, v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CTNRStatus isNSADisabled](self, "isNSADisabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CTNRStatus nsaDisabledReasonMask](self, "nsaDisabledReasonMask"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" NSA=(disabled:%@, reasonMask:%@)"), v8, v9);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CTNRStatus *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  unint64_t v8;
  _BOOL4 v9;
  BOOL v10;
  unint64_t v12;

  v4 = (CTNRStatus *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[CTNRStatus isSASwitchVisible](self, "isSASwitchVisible"),
          v5 == -[CTNRStatus isSASwitchVisible](v4, "isSASwitchVisible"))
      && (v6 = -[CTNRStatus isSASwitchConfigurable](self, "isSASwitchConfigurable"),
          v6 == -[CTNRStatus isSASwitchConfigurable](v4, "isSASwitchConfigurable"))
      && (v7 = -[CTNRStatus isSADisabled](self, "isSADisabled"), v7 == -[CTNRStatus isSADisabled](v4, "isSADisabled"))
      && (v8 = -[CTNRStatus saDisabledReasonMask](self, "saDisabledReasonMask"),
          v8 == -[CTNRStatus saDisabledReasonMask](v4, "saDisabledReasonMask"))
      && (v9 = -[CTNRStatus isNSADisabled](self, "isNSADisabled"), v9 == -[CTNRStatus isNSADisabled](v4, "isNSADisabled")))
    {
      v12 = -[CTNRStatus nsaDisabledReasonMask](self, "nsaDisabledReasonMask");
      v10 = v12 == -[CTNRStatus nsaDisabledReasonMask](v4, "nsaDisabledReasonMask");
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSASwitchVisible:saSwitchConfigurable:saDisabledByBaseband:saDisabledReasonMask:nsaDisabledByBaseband:nsaDisabledReasonMask:", -[CTNRStatus isSASwitchVisible](self, "isSASwitchVisible"), -[CTNRStatus isSASwitchConfigurable](self, "isSASwitchConfigurable"), -[CTNRStatus isSADisabled](self, "isSADisabled"), -[CTNRStatus saDisabledReasonMask](self, "saDisabledReasonMask"), -[CTNRStatus isNSADisabled](self, "isNSADisabled"), -[CTNRStatus nsaDisabledReasonMask](self, "nsaDisabledReasonMask"));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTNRStatus isSASwitchVisible](self, "isSASwitchVisible"), CFSTR("saSwitchVisible"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CTNRStatus isSASwitchConfigurable](self, "isSASwitchConfigurable"), CFSTR("saSwitchConfigurable"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CTNRStatus isSADisabled](self, "isSADisabled"), CFSTR("saDisabled"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CTNRStatus saDisabledReasonMask](self, "saDisabledReasonMask"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("saDisabledReasonMask"));

  objc_msgSend(v4, "encodeBool:forKey:", -[CTNRStatus isNSADisabled](self, "isNSADisabled"), CFSTR("nsaDisabled"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CTNRStatus nsaDisabledReasonMask](self, "nsaDisabledReasonMask"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("nsaDisabledReasonMask"));

}

- (CTNRStatus)initWithCoder:(id)a3
{
  id v4;
  CTNRStatus *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTNRStatus;
  v5 = -[CTNRStatus init](&v9, sel_init);
  if (v5)
  {
    v5->_saSwitchVisible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("saSwitchVisible"));
    v5->_saSwitchConfigurable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("saSwitchConfigurable"));
    v5->_saDisabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("saDisabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("saDisabledReasonMask"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_saDisabledReasonMask = objc_msgSend(v6, "unsignedIntegerValue");

    v5->_nsaDisabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("nsaDisabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nsaDisabledReasonMask"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_nsaDisabledReasonMask = objc_msgSend(v7, "unsignedIntegerValue");

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isSASwitchVisible
{
  return self->_saSwitchVisible;
}

- (void)setSaSwitchVisible:(BOOL)a3
{
  self->_saSwitchVisible = a3;
}

- (BOOL)isSASwitchConfigurable
{
  return self->_saSwitchConfigurable;
}

- (void)setSaSwitchConfigurable:(BOOL)a3
{
  self->_saSwitchConfigurable = a3;
}

- (BOOL)isSADisabled
{
  return self->_saDisabled;
}

- (void)setSaDisabled:(BOOL)a3
{
  self->_saDisabled = a3;
}

- (unint64_t)saDisabledReasonMask
{
  return self->_saDisabledReasonMask;
}

- (void)setSaDisabledReasonMask:(unint64_t)a3
{
  self->_saDisabledReasonMask = a3;
}

- (BOOL)isNSADisabled
{
  return self->_nsaDisabled;
}

- (void)setNsaDisabled:(BOOL)a3
{
  self->_nsaDisabled = a3;
}

- (unint64_t)nsaDisabledReasonMask
{
  return self->_nsaDisabledReasonMask;
}

- (void)setNsaDisabledReasonMask:(unint64_t)a3
{
  self->_nsaDisabledReasonMask = a3;
}

@end
