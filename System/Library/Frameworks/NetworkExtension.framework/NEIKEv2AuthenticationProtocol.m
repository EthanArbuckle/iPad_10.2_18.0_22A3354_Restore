@implementation NEIKEv2AuthenticationProtocol

- (NEIKEv2AuthenticationProtocol)initWithMethod:(unint64_t)a3
{
  NSObject *p_super;
  NEIKEv2AuthenticationProtocol *result;
  NSObject *v6;
  const char *v7;
  objc_super v8;
  uint8_t buf[16];

  p_super = &self->super;
  if (a3 == 14)
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    v7 = "Cannot [NEIKEv2AuthenticationProtocol initWithMethod:DigitalSignature], use initWithDigitalSignature instead";
LABEL_13:
    _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, v7, buf, 2u);
    goto LABEL_8;
  }
  if (a3 == 12)
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    *(_WORD *)buf = 0;
    v7 = "Cannot [NEIKEv2AuthenticationProtocol initWithMethod:GenericSecurePassword], use initWithSecurePassword instead";
    goto LABEL_13;
  }
  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2AuthenticationProtocol;
  result = -[NEIKEv2AuthenticationProtocol init](&v8, sel_init);
  if (result)
  {
    result->_method = a3;
    return result;
  }
  ne_log_obj();
  p_super = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_19BD16000, p_super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
  }
LABEL_11:

  return 0;
}

- (NEIKEv2AuthenticationProtocol)initWithDigitalSignature:(unint64_t)a3
{
  NEIKEv2AuthenticationProtocol *v4;
  NEIKEv2AuthenticationProtocol *v5;
  NEIKEv2AuthenticationProtocol *v6;
  NSObject *v8;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NEIKEv2AuthenticationProtocol;
  v4 = -[NEIKEv2AuthenticationProtocol init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_method = 14;
    v4->_digitalSignatureAlgorithm = a3;
    v6 = v4;
  }
  else
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_19BD16000, v8, OS_LOG_TYPE_FAULT, "[super init] failed", v9, 2u);
    }

  }
  return v5;
}

- (NEIKEv2AuthenticationProtocol)initWithSecurePassword:(unint64_t)a3
{
  NEIKEv2AuthenticationProtocol *v4;
  NEIKEv2AuthenticationProtocol *v5;
  NEIKEv2AuthenticationProtocol *v6;
  NSObject *v8;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NEIKEv2AuthenticationProtocol;
  v4 = -[NEIKEv2AuthenticationProtocol init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_method = 12;
    v4->_securePasswordMethod = a3;
    v6 = v4;
  }
  else
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_19BD16000, v8, OS_LOG_TYPE_FAULT, "[super init] failed", v9, 2u);
    }

  }
  return v5;
}

- (NEIKEv2AuthenticationProtocol)initWithNonStandardDigitalSignature:(unint64_t)a3
{
  NEIKEv2AuthenticationProtocol *v3;
  NEIKEv2AuthenticationProtocol *v4;

  if (a3 - 4 >= 0xFFFFFFFFFFFFFFFELL)
  {
    v4 = -[NEIKEv2AuthenticationProtocol initWithDigitalSignature:](self, "initWithDigitalSignature:");
    if (v4)
      v4->_isNonStandard = 1;
    self = v4;
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)description
{
  _BOOL4 v3;
  id v4;
  __CFString *String;
  __CFString *v6;
  uint64_t v7;
  id v8;
  __CFString *v9;

  if (-[NEIKEv2AuthenticationProtocol method](self, "method") == 14)
  {
    v3 = -[NEIKEv2AuthenticationProtocol isNonStandard](self, "isNonStandard");
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    String = NEIKEv2DigitalSignatureAlgorithmCreateString(-[NEIKEv2AuthenticationProtocol digitalSignatureAlgorithm](self, "digitalSignatureAlgorithm"));
    v6 = String;
    if (v3)
      v7 = objc_msgSend(v4, "initWithFormat:", CFSTR("DigitalSignatureNonStandard%@"), String);
    else
      v7 = objc_msgSend(v4, "initWithFormat:", CFSTR("DigitalSignature%@"), String);
  }
  else
  {
    if (-[NEIKEv2AuthenticationProtocol method](self, "method") != 12)
    {
      v9 = (__CFString *)NEIKEv2AuthenticationMethodCreateString(-[NEIKEv2AuthenticationProtocol method](self, "method"));
      return v9;
    }
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = (__CFString *)NEIKEv2SecurePasswordMethodCreateString(-[NEIKEv2AuthenticationProtocol securePasswordMethod](self, "securePasswordMethod"));
    v7 = objc_msgSend(v8, "initWithFormat:", CFSTR("SecurePassword%@"), v6);
  }
  v9 = (__CFString *)v7;

  return v9;
}

- (BOOL)isSignature
{
  unint64_t v2;

  v2 = -[NEIKEv2AuthenticationProtocol method](self, "method");
  return (v2 > 0xD) | (0xFFAu >> v2) & 1;
}

- (BOOL)isDigitalSignature
{
  return -[NEIKEv2AuthenticationProtocol method](self, "method") == 14;
}

- (BOOL)isSecurePassword
{
  return -[NEIKEv2AuthenticationProtocol method](self, "method") == 12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _BOOL4 v9;
  int v10;

  v4 = a3;
  if (v4 && objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[NEIKEv2AuthenticationProtocol method](self, "method");
    if (v6 == objc_msgSend(v5, "method")
      && (v7 = -[NEIKEv2AuthenticationProtocol digitalSignatureAlgorithm](self, "digitalSignatureAlgorithm"),
          v7 == objc_msgSend(v5, "digitalSignatureAlgorithm"))
      && (v8 = -[NEIKEv2AuthenticationProtocol securePasswordMethod](self, "securePasswordMethod"),
          v8 == objc_msgSend(v5, "securePasswordMethod")))
    {
      v9 = -[NEIKEv2AuthenticationProtocol isNonStandard](self, "isNonStandard");
      v10 = v9 ^ objc_msgSend(v5, "isNonStandard") ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _BOOL4 v6;
  uint64_t v7;

  v3 = -[NEIKEv2AuthenticationProtocol method](self, "method");
  v4 = v3 + 10000 * -[NEIKEv2AuthenticationProtocol digitalSignatureAlgorithm](self, "digitalSignatureAlgorithm");
  v5 = v4 + 100000 * -[NEIKEv2AuthenticationProtocol securePasswordMethod](self, "securePasswordMethod");
  v6 = -[NEIKEv2AuthenticationProtocol isNonStandard](self, "isNonStandard");
  v7 = 100;
  if (!v6)
    v7 = 0;
  return v5 + v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BOOL4 v5;
  void *v6;
  unint64_t v7;
  unint64_t v9;
  void *v10;

  if (-[NEIKEv2AuthenticationProtocol method](self, "method") == 14)
  {
    v5 = -[NEIKEv2AuthenticationProtocol isNonStandard](self, "isNonStandard");
    v6 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
    v7 = -[NEIKEv2AuthenticationProtocol digitalSignatureAlgorithm](self, "digitalSignatureAlgorithm");
    if (v5)
      return (id)objc_msgSend(v6, "initWithNonStandardDigitalSignature:", v7);
    else
      return (id)objc_msgSend(v6, "initWithDigitalSignature:", v7);
  }
  else
  {
    v9 = -[NEIKEv2AuthenticationProtocol method](self, "method");
    v10 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
    if (v9 == 12)
      return (id)objc_msgSend(v10, "initWithSecurePassword:", -[NEIKEv2AuthenticationProtocol securePasswordMethod](self, "securePasswordMethod"));
    else
      return (id)objc_msgSend(v10, "initWithMethod:", -[NEIKEv2AuthenticationProtocol method](self, "method"));
  }
}

- (BOOL)isNonStandard
{
  return self->_isNonStandard;
}

- (unint64_t)method
{
  return self->_method;
}

- (unint64_t)digitalSignatureAlgorithm
{
  return self->_digitalSignatureAlgorithm;
}

- (unint64_t)securePasswordMethod
{
  return self->_securePasswordMethod;
}

- (uint64_t)isRSA
{
  void *v1;
  unint64_t v2;
  uint64_t v3;

  if (result)
  {
    v1 = (void *)result;
    result = objc_msgSend((id)result, "method");
    if (result != 1)
    {
      if (result == 14)
      {
        v2 = objc_msgSend(v1, "digitalSignatureAlgorithm");
        if (v2 <= 6 && ((1 << v2) & 0x62) != 0)
          return 1;
      }
      v3 = objc_msgSend(v1, "method");
      if (v3 == 245)
        return 1;
      else
        return v3 == 14 && (unint64_t)(objc_msgSend(v1, "digitalSignatureAlgorithm") - 9) < 3;
    }
  }
  return result;
}

- (uint64_t)isECDSA
{
  void *v1;
  uint64_t v2;
  unint64_t v3;

  if (result)
  {
    v1 = (void *)result;
    v2 = objc_msgSend((id)result, "method");
    if ((unint64_t)(v2 - 9) >= 3)
    {
      if (v2 == 14)
      {
        v3 = objc_msgSend(v1, "digitalSignatureAlgorithm");
        if (v3 >= 9)
          return 0;
        else
          return (0x184u >> v3) & 1;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

@end
