@implementation BLSPreventBacklightIdleAttribute

+ (id)preventIdle
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRestartTimerOnInvalidation:clearUserInteraction:", 0, 0);
}

+ (id)preventIdleAndRestartTimerOnInvalidation
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRestartTimerOnInvalidation:clearUserInteraction:", 1, 0);
}

+ (id)preventIdleClearUserInteractionAndRestartTimerOnInvalidation
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRestartTimerOnInvalidation:clearUserInteraction:", 1, 1);
}

- (BLSPreventBacklightIdleAttribute)initWithRestartTimerOnInvalidation:(BOOL)a3 clearUserInteraction:(BOOL)a4
{
  BLSPreventBacklightIdleAttribute *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BLSPreventBacklightIdleAttribute;
  result = -[BLSAttribute init](&v7, sel_init);
  if (result)
  {
    result->_restartTimerOnInvalidation = a3;
    result->_clearUserInteraction = a4;
  }
  return result;
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return -[BLSAttribute checkEntitlementSource:forSingleEntitlement:error:](self, "checkEntitlementSource:forSingleEntitlement:error:", a3, 0x1E621D1F8, a4);
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_restartTimerOnInvalidation, CFSTR("restart"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_clearUserInteraction, CFSTR("clearInteraction"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", self->_restartTimerOnInvalidation);
  v5 = (id)objc_msgSend(v3, "appendBool:", self->_clearUserInteraction);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  BLSPreventBacklightIdleAttribute *v4;
  BLSPreventBacklightIdleAttribute *v5;
  _BOOL4 restartTimerOnInvalidation;
  _BOOL4 clearUserInteraction;
  BOOL v8;

  v4 = (BLSPreventBacklightIdleAttribute *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      restartTimerOnInvalidation = self->_restartTimerOnInvalidation;
      if (restartTimerOnInvalidation == -[BLSPreventBacklightIdleAttribute restartTimerOnInvalidation](v5, "restartTimerOnInvalidation"))
      {
        clearUserInteraction = self->_clearUserInteraction;
        v8 = clearUserInteraction == -[BLSPreventBacklightIdleAttribute clearUserInteraction](v5, "clearUserInteraction");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BLSPreventBacklightIdleAttribute)initWithXPCDictionary:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  _BOOL8 v7;
  _BOOL8 v8;

  v4 = a3;
  v5 = (const char *)objc_msgSend(CFSTR("restart"), "UTF8String");
  v6 = (const char *)objc_msgSend(CFSTR("clearInteraction"), "UTF8String");
  v7 = xpc_dictionary_get_BOOL(v4, v5);
  v8 = xpc_dictionary_get_BOOL(v4, v6);

  return -[BLSPreventBacklightIdleAttribute initWithRestartTimerOnInvalidation:clearUserInteraction:](self, "initWithRestartTimerOnInvalidation:clearUserInteraction:", v7, v8);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  const char *v4;
  const char *v5;
  xpc_object_t xdict;

  xdict = a3;
  v4 = (const char *)objc_msgSend(CFSTR("restart"), "UTF8String");
  v5 = (const char *)objc_msgSend(CFSTR("clearInteraction"), "UTF8String");
  xpc_dictionary_set_BOOL(xdict, v4, self->_restartTimerOnInvalidation);
  xpc_dictionary_set_BOOL(xdict, v5, self->_clearUserInteraction);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSPreventBacklightIdleAttribute)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("restart"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("clearInteraction"));

  return -[BLSPreventBacklightIdleAttribute initWithRestartTimerOnInvalidation:clearUserInteraction:](self, "initWithRestartTimerOnInvalidation:clearUserInteraction:", v5, v6);
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 restartTimerOnInvalidation;
  id v5;

  restartTimerOnInvalidation = self->_restartTimerOnInvalidation;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", restartTimerOnInvalidation, CFSTR("restart"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_clearUserInteraction, CFSTR("clearInteraction"));

}

- (BOOL)restartTimerOnInvalidation
{
  return self->_restartTimerOnInvalidation;
}

- (BOOL)clearUserInteraction
{
  return self->_clearUserInteraction;
}

@end
