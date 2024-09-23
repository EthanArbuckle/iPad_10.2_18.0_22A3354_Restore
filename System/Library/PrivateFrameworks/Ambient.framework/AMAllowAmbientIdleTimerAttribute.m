@implementation AMAllowAmbientIdleTimerAttribute

+ (id)allowAmbientIdleTimer
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initForSleepFocus:", 0);
}

+ (id)allowAmbientIdleTimerForSleepFocus
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initForSleepFocus:", 1);
}

- (id)initForSleepFocus:(BOOL)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMAllowAmbientIdleTimerAttribute;
  result = -[BLSAttribute init](&v5, sel_init);
  if (result)
    *((_BYTE *)result + 8) = a3;
  return result;
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return -[BLSAttribute checkEntitlementSource:forSingleEntitlement:error:](self, "checkEntitlementSource:forSingleEntitlement:error:", a3, CFSTR("com.apple.ambient.attribute.allow-idle-timer"), a4);
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_forSleepFocus, CFSTR("forSleepFocus"), 1);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", self->_forSleepFocus);
  v5 = objc_msgSend(v3, "hash");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t forSleepFocus;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  forSleepFocus = self->_forSleepFocus;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__AMAllowAmbientIdleTimerAttribute_isEqual___block_invoke;
  v10[3] = &unk_25075FA18;
  v11 = v4;
  v7 = v4;
  v8 = (id)objc_msgSend(v5, "appendBool:counterpart:", forSleepFocus, v10);
  LOBYTE(forSleepFocus) = objc_msgSend(v5, "isEqual");

  return forSleepFocus;
}

uint64_t __44__AMAllowAmbientIdleTimerAttribute_isEqual___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
}

- (AMAllowAmbientIdleTimerAttribute)initWithXPCDictionary:(id)a3
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  v5 = xpc_dictionary_get_BOOL(v4, (const char *)objc_msgSend(CFSTR("forSleepFocus"), "UTF8String"));

  return (AMAllowAmbientIdleTimerAttribute *)-[AMAllowAmbientIdleTimerAttribute initForSleepFocus:](self, "initForSleepFocus:", v5);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict;

  xdict = a3;
  xpc_dictionary_set_BOOL(xdict, (const char *)objc_msgSend(CFSTR("forSleepFocus"), "UTF8String"), self->_forSleepFocus);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMAllowAmbientIdleTimerAttribute)initWithCoder:(id)a3
{
  return (AMAllowAmbientIdleTimerAttribute *)-[AMAllowAmbientIdleTimerAttribute initForSleepFocus:](self, "initForSleepFocus:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("forSleepFocus")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_forSleepFocus, CFSTR("forSleepFocus"));
}

- (BOOL)isForSleepFocus
{
  return self->_forSleepFocus;
}

@end
