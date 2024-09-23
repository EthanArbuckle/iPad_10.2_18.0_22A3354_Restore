@implementation HMDMutableHomeManagerXPCMessageSendPolicyParameters

- (id)copyWithZone:(_NSZone *)a3
{
  HMDHomeManagerXPCMessageSendPolicyParameters *v4;

  v4 = -[HMDHomeManagerXPCMessageSendPolicyParameters initWithEntitlements:options:](+[HMDHomeManagerXPCMessageSendPolicyParameters allocWithZone:](HMDHomeManagerXPCMessageSendPolicyParameters, "allocWithZone:", a3), "initWithEntitlements:options:", -[HMDXPCMessageSendPolicyParameters entitlements](self, "entitlements"), -[HMDHomeManagerXPCMessageSendPolicyParameters options](self, "options"));
  -[HMDHomeManagerXPCMessageSendPolicyParameters setActive:](v4, "setActive:", -[HMDHomeManagerXPCMessageSendPolicyParameters isActive](self, "isActive"));
  return v4;
}

@end
