@implementation HMDRemoteMessagePolicy

- (HMDRemoteMessagePolicy)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)__initWithRequiresSecureMessage:(BOOL)a3 allowsAnonymousMessage:(BOOL)a4 requiresAccountMessage:(BOOL)a5 transportRestriction:(unint64_t)a6 roles:(unint64_t)a7
{
  id result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HMDRemoteMessagePolicy;
  result = -[HMDRemoteMessagePolicy init](&v13, sel_init);
  if (result)
  {
    *((_BYTE *)result + 8) = a3;
    *((_BYTE *)result + 9) = a4;
    *((_BYTE *)result + 10) = a5;
    *((_QWORD *)result + 2) = a6;
    *((_QWORD *)result + 3) = a7;
  }
  return result;
}

- (unint64_t)hash
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  unint64_t v9;

  v3 = -[HMDRemoteMessagePolicy requiresSecureMessage](self, "requiresSecureMessage");
  v4 = -[HMDRemoteMessagePolicy allowsAnonymousMessage](self, "allowsAnonymousMessage");
  v5 = 2;
  if (!v4)
    v5 = 0;
  v6 = v5 | v3;
  v7 = -[HMDRemoteMessagePolicy requiresAccountMessage](self, "requiresAccountMessage");
  v8 = 4;
  if (!v7)
    v8 = 0;
  v9 = v6 | v8 | (8 * -[HMDRemoteMessagePolicy transportRestriction](self, "transportRestriction"));
  return v9 ^ (16 * -[HMDRemoteMessagePolicy roles](self, "roles"));
}

- (BOOL)isEqual:(id)a3
{
  HMDRemoteMessagePolicy *v4;
  HMDRemoteMessagePolicy *v5;
  HMDRemoteMessagePolicy *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;

  v4 = (HMDRemoteMessagePolicy *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6
      && (v7 = -[HMDRemoteMessagePolicy requiresSecureMessage](self, "requiresSecureMessage"),
          v7 == -[HMDRemoteMessagePolicy requiresSecureMessage](v6, "requiresSecureMessage"))
      && (v8 = -[HMDRemoteMessagePolicy allowsAnonymousMessage](self, "allowsAnonymousMessage"),
          v8 == -[HMDRemoteMessagePolicy allowsAnonymousMessage](v6, "allowsAnonymousMessage"))
      && (v9 = -[HMDRemoteMessagePolicy requiresAccountMessage](self, "requiresAccountMessage"),
          v9 == -[HMDRemoteMessagePolicy requiresAccountMessage](v6, "requiresAccountMessage"))
      && (v10 = -[HMDRemoteMessagePolicy transportRestriction](self, "transportRestriction"),
          v10 == -[HMDRemoteMessagePolicy transportRestriction](v6, "transportRestriction")))
    {
      v11 = -[HMDRemoteMessagePolicy roles](self, "roles");
      v12 = v11 == -[HMDRemoteMessagePolicy roles](v6, "roles");
    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  +[HMDMutableRemoteMessagePolicy remoteMessagePolicyWithRequiresSecureMessage:allowsAnonymousMessage:requiresAccountMessage:transportRestriction:roles:](HMDMutableRemoteMessagePolicy, "remoteMessagePolicyWithRequiresSecureMessage:allowsAnonymousMessage:requiresAccountMessage:transportRestriction:roles:", -[HMDRemoteMessagePolicy requiresSecureMessage](self, "requiresSecureMessage", a3), -[HMDRemoteMessagePolicy allowsAnonymousMessage](self, "allowsAnonymousMessage"), -[HMDRemoteMessagePolicy requiresAccountMessage](self, "requiresAccountMessage"), -[HMDRemoteMessagePolicy transportRestriction](self, "transportRestriction"), -[HMDRemoteMessagePolicy roles](self, "roles"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)requiresSecureMessage
{
  return self->_requiresSecureMessage;
}

- (void)setRequiresSecureMessage:(BOOL)a3
{
  self->_requiresSecureMessage = a3;
}

- (BOOL)allowsAnonymousMessage
{
  return self->_allowsAnonymousMessage;
}

- (void)setAllowsAnonymousMessage:(BOOL)a3
{
  self->_allowsAnonymousMessage = a3;
}

- (BOOL)requiresAccountMessage
{
  return self->_requiresAccountMessage;
}

- (void)setRequiresAccountMessage:(BOOL)a3
{
  self->_requiresAccountMessage = a3;
}

- (unint64_t)transportRestriction
{
  return self->_transportRestriction;
}

- (void)setTransportRestriction:(unint64_t)a3
{
  self->_transportRestriction = a3;
}

- (unint64_t)roles
{
  return self->_roles;
}

- (void)setRoles:(unint64_t)a3
{
  self->_roles = a3;
}

+ (id)remoteMessagePolicyWithRequiresSecureMessage:(BOOL)a3 allowsAnonymousMessage:(BOOL)a4 requiresAccountMessage:(BOOL)a5 transportRestriction:(unint64_t)a6 roles:(unint64_t)a7
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "__initWithRequiresSecureMessage:allowsAnonymousMessage:requiresAccountMessage:transportRestriction:roles:", a3, a4, a5, a6, a7);
}

+ (id)defaultPolicy
{
  return (id)objc_msgSend(a1, "remoteMessagePolicyWithRequiresSecureMessage:allowsAnonymousMessage:requiresAccountMessage:transportRestriction:roles:", 0, 0, 0, -1, 0);
}

+ (id)defaultSecurePolicy
{
  return (id)objc_msgSend(a1, "remoteMessagePolicyWithRequiresSecureMessage:allowsAnonymousMessage:requiresAccountMessage:transportRestriction:roles:", 1, 0, 0, -1, 0);
}

+ (id)defaultSecurePrimaryResidentPolicy
{
  return (id)objc_msgSend(a1, "remoteMessagePolicyWithRequiresSecureMessage:allowsAnonymousMessage:requiresAccountMessage:transportRestriction:roles:", 1, 0, 0, -1, 8);
}

@end
