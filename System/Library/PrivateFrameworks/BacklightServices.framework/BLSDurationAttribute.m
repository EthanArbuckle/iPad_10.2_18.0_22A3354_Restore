@implementation BLSDurationAttribute

+ (id)cancelAfterInterval:(double)a3
{
  return -[BLSDurationAttribute initWithDuration:]([BLSInvalidationDurationAttribute alloc], "initWithDuration:", a3);
}

+ (id)warnAfterInterval:(double)a3
{
  return -[BLSDurationAttribute initWithDuration:]([BLSWarningDurationAttribute alloc], "initWithDuration:", a3);
}

+ (id)timeoutAfterInterval:(double)a3
{
  return -[BLSDurationAttribute initWithDuration:]([BLSTimeoutDurationAttribute alloc], "initWithDuration:", a3);
}

- (BLSDurationAttribute)initWithDuration:(double)a3
{
  BLSDurationAttribute *v4;
  NSObject *v5;
  BLSDurationAttribute *v6;
  BLSDurationAttribute *v7;
  objc_super v9;

  v4 = self;
  if (-[BLSDurationAttribute isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    bls_assertions_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BLSDurationAttribute initWithDuration:].cold.1(v5);

    v6 = 0;
  }
  else
  {
    v9.receiver = v4;
    v9.super_class = (Class)BLSDurationAttribute;
    v7 = -[BLSAttribute init](&v9, sel_init);
    if (v7)
      v7->_duration = a3;
    v4 = v7;
    v6 = v4;
  }

  return v6;
}

- (BOOL)canBePaused
{
  return 0;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", CFSTR("duration"), 1, self->_duration);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendDouble:", self->_duration);
  v5 = objc_msgSend(v3, "hash");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  BLSDurationAttribute *v4;
  BLSDurationAttribute *v5;
  double duration;
  double v7;
  uint64_t v8;
  BOOL v9;

  v4 = (BLSDurationAttribute *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      duration = self->_duration;
      -[BLSDurationAttribute duration](v5, "duration");
      if (duration == v7)
      {
        v8 = objc_opt_class();
        v9 = v8 == objc_opt_class();
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (BLSDurationAttribute)initWithXPCDictionary:(id)a3
{
  id v4;
  double v5;

  v4 = a3;
  v5 = xpc_dictionary_get_double(v4, (const char *)objc_msgSend(CFSTR("duration"), "UTF8String"));

  return -[BLSDurationAttribute initWithDuration:](self, "initWithDuration:", v5);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict;

  xdict = a3;
  xpc_dictionary_set_double(xdict, (const char *)objc_msgSend(CFSTR("duration"), "UTF8String"), self->_duration);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSDurationAttribute)initWithCoder:(id)a3
{
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("duration"));
  return -[BLSDurationAttribute initWithDuration:](self, "initWithDuration:");
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("duration"), self->_duration);
}

- (double)duration
{
  return self->_duration;
}

- (void)initWithDuration:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B0C75000, log, OS_LOG_TYPE_FAULT, "BLSDurationAttribute initialized without valid subclass", v1, 2u);
}

@end
