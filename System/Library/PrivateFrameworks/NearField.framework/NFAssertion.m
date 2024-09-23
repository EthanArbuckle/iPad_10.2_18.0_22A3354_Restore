@implementation NFAssertion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFAssertion)initWithCoder:(id)a3
{
  id v4;
  NFAssertion *v5;
  uint64_t v6;
  NSDate *assertionTime;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFAssertion;
  v5 = -[NFAssertion init](&v9, sel_init);
  if (v5)
  {
    v5->_assertionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NFAssertionType"));
    v5->_pid = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("NFAssertionPID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NFAssertionTime"));
    v6 = objc_claimAutoreleasedReturnValue();
    assertionTime = v5->_assertionTime;
    v5->_assertionTime = (NSDate *)v6;

  }
  return v5;
}

- (NFAssertion)initWithDictionary:(id)a3
{
  id v4;
  NFAssertion *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSDate *assertionTime;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFAssertion;
  v5 = -[NFAssertion init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFAssertionType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_assertionType = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFAssertionPID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_pid = objc_msgSend(v7, "intValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFAssertionTime"));
    v8 = objc_claimAutoreleasedReturnValue();
    assertionTime = v5->_assertionTime;
    v5->_assertionTime = (NSDate *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t assertionType;
  id v5;

  assertionType = self->_assertionType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", assertionType, CFSTR("NFAssertionType"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_pid, CFSTR("NFAssertionPID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assertionTime, CFSTR("NFAssertionTime"));

}

- (id)sessionID
{
  void *v2;
  void *v3;
  uint64_t pid;
  uint64_t v5;

  if (self->_assertionType)
  {
    v2 = 0;
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    pid = self->_pid;
    -[NSDate timeIntervalSinceReferenceDate](self->_assertionTime, "timeIntervalSinceReferenceDate");
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Assertion-PowerUp-%d-%lf"), pid, v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)description
{
  unint64_t assertionType;
  const __CFString *v3;

  assertionType = self->_assertionType;
  if (assertionType > 5)
    v3 = CFSTR("Unknown");
  else
    v3 = off_1E3B53878[assertionType];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion Type = %@ for PID %d, taken at %@"), v3, self->_pid, self->_assertionTime);
}

- (BOOL)isEqual:(id)a3
{
  NFAssertion *v4;
  unint64_t assertionType;
  int pid;
  NSDate *assertionTime;
  void *v8;
  char v9;

  v4 = (NFAssertion *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (assertionType = self->_assertionType, assertionType == -[NFAssertion assertionType](v4, "assertionType"))
      && (pid = self->_pid, pid == -[NFAssertion pid](v4, "pid")))
    {
      assertionTime = self->_assertionTime;
      -[NFAssertion assertionTime](v4, "assertionTime");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NSDate isEqual:](assertionTime, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_assertionType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_pid);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[NSDate hash](self->_assertionTime, "hash");

  return v7;
}

- (unint64_t)assertionType
{
  return self->_assertionType;
}

- (int)pid
{
  return self->_pid;
}

- (NSDate)assertionTime
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionTime, 0);
}

@end
