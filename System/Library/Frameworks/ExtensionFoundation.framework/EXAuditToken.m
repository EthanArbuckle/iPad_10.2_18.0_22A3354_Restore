@implementation EXAuditToken

+ ($115C4C562B26FF47E01F9F4EA65B5887)auditTokenForCurrentProcess
{
  __int128 v4;

  if (_EXAuditTokenForCurrentProcess_once != -1)
    dispatch_once(&_EXAuditTokenForCurrentProcess_once, &__block_literal_global_6);
  v4 = *(_OWORD *)(_EXAuditTokenForCurrentProcess_result + 16);
  *(_OWORD *)retstr->var0 = *(_OWORD *)_EXAuditTokenForCurrentProcess_result;
  *(_OWORD *)&retstr->var0[4] = v4;
  return result;
}

+ (BOOL)auditToken:(id *)a3 hasRequiredEntitlements:(id)a4 error:(id *)a5
{
  return _EXAuditTokenHasRequiredEntitlements(a3, a4, a5);
}

+ (id)auditToken:(id *)a3 entitlementValue:(id)a4 ofClass:(Class)a5
{
  return _EXAuditTokenGetEntitlementValue((uint64_t)a3, a4);
}

- (EXAuditToken)initWithAuditToken:(id *)a3
{
  EXAuditToken *result;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EXAuditToken;
  result = -[EXAuditToken init](&v6, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)a3->var0;
    *(_OWORD *)&result->_auditToken.val[4] = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)result->_auditToken.val = v5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBytes:length:forKey:", &self->_auditToken, 32, CFSTR("auditToken"));
}

- (EXAuditToken)initWithCoder:(id)a3
{
  _OWORD *v4;
  EXAuditToken *v5;
  __int128 v6;
  _OWORD v8[2];
  uint64_t v9;

  v9 = 0;
  v4 = (_OWORD *)objc_msgSend(objc_retainAutorelease(a3), "decodeBytesForKey:returnedLength:", CFSTR("auditToken"), &v9);
  v5 = 0;
  if (v4 && v9 == 32)
  {
    v6 = v4[1];
    v8[0] = *v4;
    v8[1] = v6;
    self = -[EXAuditToken initWithAuditToken:](self, "initWithAuditToken:", v8);
    v5 = self;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  __int128 v5;
  _OWORD v7[2];

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = *(_OWORD *)&self->_auditToken.val[4];
  v7[0] = *(_OWORD *)self->_auditToken.val;
  v7[1] = v5;
  return (id)objc_msgSend(v4, "initWithAuditToken:", v7);
}

- (BOOL)isEqual:(id)a3
{
  EXAuditToken *v4;
  BOOL v8;

  v4 = (EXAuditToken *)a3;
  if (v4)
    v8 = self == v4
      || *(_QWORD *)self->_auditToken.val == *(_QWORD *)v4->_auditToken.val
      && *(_QWORD *)&self->_auditToken.val[2] == *(_QWORD *)&v4->_auditToken.val[2]
      && *(_QWORD *)&self->_auditToken.val[4] == *(_QWORD *)&v4->_auditToken.val[4]
      && *(_QWORD *)&self->_auditToken.val[6] == *(_QWORD *)&v4->_auditToken.val[6];
  else
    v8 = 0;

  return v8;
}

- (unint64_t)hash
{
  __int128 v3;
  int v4;
  __int128 v5;
  audit_token_t v7;

  v3 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)v7.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&v7.val[4] = v3;
  v4 = audit_token_to_pidversion(&v7);
  v5 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)v7.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&v7.val[4] = v5;
  return audit_token_to_pid(&v7) ^ v4;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  objc_copyStruct(retstr, &self->_auditToken, 32, 1, 0);
  return result;
}

@end
