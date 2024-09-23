@implementation HMDMutableRemoteMessagePolicy

- (id)copyWithZone:(_NSZone *)a3
{
  +[HMDRemoteMessagePolicy remoteMessagePolicyWithRequiresSecureMessage:allowsAnonymousMessage:requiresAccountMessage:transportRestriction:roles:](HMDRemoteMessagePolicy, "remoteMessagePolicyWithRequiresSecureMessage:allowsAnonymousMessage:requiresAccountMessage:transportRestriction:roles:", -[HMDRemoteMessagePolicy requiresSecureMessage](self, "requiresSecureMessage", a3), -[HMDRemoteMessagePolicy allowsAnonymousMessage](self, "allowsAnonymousMessage"), -[HMDRemoteMessagePolicy requiresAccountMessage](self, "requiresAccountMessage"), -[HMDRemoteMessagePolicy transportRestriction](self, "transportRestriction"), -[HMDRemoteMessagePolicy roles](self, "roles"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)remoteMessagePolicyWithRequiresSecureMessage:(BOOL)a3 allowsAnonymousMessage:(BOOL)a4 requiresAccountMessage:(BOOL)a5 transportRestriction:(unint64_t)a6 roles:(unint64_t)a7
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "__initWithRequiresSecureMessage:allowsAnonymousMessage:requiresAccountMessage:transportRestriction:roles:", a3, a4, a5, a6, a7);
}

@end
