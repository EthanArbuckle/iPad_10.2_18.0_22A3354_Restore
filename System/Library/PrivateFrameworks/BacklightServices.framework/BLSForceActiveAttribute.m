@implementation BLSForceActiveAttribute

+ (id)forceActive
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithUserInitiated:", 0);
}

+ (id)forceActiveUserInitiated:(BOOL)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithUserInitiated:", a3);
}

- (BLSForceActiveAttribute)initWithUserInitiated:(BOOL)a3
{
  BLSForceActiveAttribute *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BLSForceActiveAttribute;
  result = -[BLSAttribute init](&v5, sel_init);
  if (result)
    result->_userInitiated = a3;
  return result;
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return -[BLSAttribute checkEntitlementSource:forSingleEntitlement:error:](self, "checkEntitlementSource:forSingleEntitlement:error:", a3, 0x1E621D1D8, a4);
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_userInitiated, CFSTR("userInitiated"));
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
  v4 = (id)objc_msgSend(v3, "appendBool:", self->_userInitiated);
  v5 = objc_msgSend(v3, "hash");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  BLSForceActiveAttribute *v4;
  _BOOL4 userInitiated;
  BOOL v6;

  v4 = (BLSForceActiveAttribute *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      userInitiated = self->_userInitiated;
      v6 = userInitiated == -[BLSForceActiveAttribute userInitiated](v4, "userInitiated");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BLSForceActiveAttribute)initWithXPCDictionary:(id)a3
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  v5 = xpc_dictionary_get_BOOL(v4, (const char *)objc_msgSend(CFSTR("userInitiated"), "UTF8String"));

  return -[BLSForceActiveAttribute initWithUserInitiated:](self, "initWithUserInitiated:", v5);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict;

  xdict = a3;
  xpc_dictionary_set_BOOL(xdict, (const char *)objc_msgSend(CFSTR("userInitiated"), "UTF8String"), self->_userInitiated);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSForceActiveAttribute)initWithCoder:(id)a3
{
  return -[BLSForceActiveAttribute initWithUserInitiated:](self, "initWithUserInitiated:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("userInitiated")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_userInitiated, CFSTR("userInitiated"));
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

@end
