@implementation HMDRemoteEventRouterAccessControl

- (HMDRemoteEventRouterAccessControl)initWithAllowedUserTypes:(unint64_t)a3 deviceCategories:(unint64_t)a4
{
  HMDRemoteEventRouterAccessControl *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDRemoteEventRouterAccessControl;
  result = -[HMDRemoteEventRouterAccessControl init](&v7, sel_init);
  if (result)
  {
    result->_allowedUserTypes = a3;
    result->_allowedDeviceTypes = a4;
  }
  return result;
}

- (unint64_t)allowedUserTypes
{
  return self->_allowedUserTypes;
}

- (unint64_t)allowedDeviceTypes
{
  return self->_allowedDeviceTypes;
}

+ (id)allowAllUsersAndDevicesAccessControl
{
  if (allowAllUsersAndDevicesAccessControl_onceToken != -1)
    dispatch_once(&allowAllUsersAndDevicesAccessControl_onceToken, &__block_literal_global_161844);
  return (id)allowAllUsersAndDevicesAccessControl_accessControlPolicy;
}

+ (id)allowSharedAdminsAndAllDevicesAccessControl
{
  if (allowSharedAdminsAndAllDevicesAccessControl_onceToken != -1)
    dispatch_once(&allowSharedAdminsAndAllDevicesAccessControl_onceToken, &__block_literal_global_1_161842);
  return (id)allowSharedAdminsAndAllDevicesAccessControl_accessControlPolicy;
}

+ (unint64_t)remoteUserAccessControlFromNumber:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  objc_msgSend(v3, "unsignedIntegerValue");
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

+ (unint64_t)remoteDeviceAccessControlFromNumber:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  objc_msgSend(v3, "unsignedIntegerValue");
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

void __80__HMDRemoteEventRouterAccessControl_allowSharedAdminsAndAllDevicesAccessControl__block_invoke()
{
  HMDRemoteEventRouterAccessControl *v0;
  void *v1;

  v0 = -[HMDRemoteEventRouterAccessControl initWithAllowedUserTypes:deviceCategories:]([HMDRemoteEventRouterAccessControl alloc], "initWithAllowedUserTypes:deviceCategories:", 1, 3);
  v1 = (void *)allowSharedAdminsAndAllDevicesAccessControl_accessControlPolicy;
  allowSharedAdminsAndAllDevicesAccessControl_accessControlPolicy = (uint64_t)v0;

}

void __73__HMDRemoteEventRouterAccessControl_allowAllUsersAndDevicesAccessControl__block_invoke()
{
  HMDRemoteEventRouterAccessControl *v0;
  void *v1;

  v0 = -[HMDRemoteEventRouterAccessControl initWithAllowedUserTypes:deviceCategories:]([HMDRemoteEventRouterAccessControl alloc], "initWithAllowedUserTypes:deviceCategories:", 7, 3);
  v1 = (void *)allowAllUsersAndDevicesAccessControl_accessControlPolicy;
  allowAllUsersAndDevicesAccessControl_accessControlPolicy = (uint64_t)v0;

}

@end
