@implementation DMFApplicationInstallProgress

- (DMFApplicationInstallProgress)initWithState:(unint64_t)a3 phase:(unint64_t)a4 fractionCompleted:(double)a5
{
  DMFApplicationInstallProgress *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DMFApplicationInstallProgress;
  result = -[DMFApplicationInstallProgress init](&v9, sel_init);
  if (result)
  {
    result->_state = a3;
    result->_phase = a4;
    result->_fractionCompleted = a5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFApplicationInstallProgress)initWithCoder:(id)a3
{
  id v4;
  DMFApplicationInstallProgress *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMFApplicationInstallProgress;
  v5 = -[DMFApplicationInstallProgress init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_state = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phase"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_phase = objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fractionCompleted"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v5->_fractionCompleted = v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[DMFApplicationInstallProgress state](self, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("state"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFApplicationInstallProgress phase](self, "phase"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("phase"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[DMFApplicationInstallProgress fractionCompleted](self, "fractionCompleted");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("fractionCompleted"));

}

- (BOOL)isEqual:(id)a3
{
  DMFApplicationInstallProgress *v4;
  DMFApplicationInstallProgress *v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;

  v4 = (DMFApplicationInstallProgress *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[DMFApplicationInstallProgress state](self, "state");
      if (v6 == -[DMFApplicationInstallProgress state](v5, "state")
        && (v7 = -[DMFApplicationInstallProgress phase](self, "phase"),
            v7 == -[DMFApplicationInstallProgress phase](v5, "phase")))
      {
        -[DMFApplicationInstallProgress fractionCompleted](self, "fractionCompleted");
        v9 = v8;
        -[DMFApplicationInstallProgress fractionCompleted](v5, "fractionCompleted");
        v11 = v9 == v10;
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@:%p {\nState              : "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DMFApplicationInstallProgress state](self, "state");
  if (v4 <= 5)
    objc_msgSend(v3, "appendString:", off_1E6ED7BD0[v4]);
  objc_msgSend(v3, "appendString:", CFSTR("\nPhase              : "));
  v5 = -[DMFApplicationInstallProgress phase](self, "phase");
  if (v5 <= 3)
    objc_msgSend(v3, "appendString:", off_1E6ED7C00[v5]);
  -[DMFApplicationInstallProgress fractionCompleted](self, "fractionCompleted");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nFraction Completed : %f\n}>"), v6);
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = -[DMFApplicationInstallProgress state](self, "state");
  v6 = -[DMFApplicationInstallProgress phase](self, "phase");
  -[DMFApplicationInstallProgress fractionCompleted](self, "fractionCompleted");
  return (id)objc_msgSend(v4, "initWithState:phase:fractionCompleted:", v5, v6);
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)phase
{
  return self->_phase;
}

- (double)fractionCompleted
{
  return self->_fractionCompleted;
}

@end
