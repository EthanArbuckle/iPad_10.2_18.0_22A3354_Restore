@implementation NSCoder(RemoteTransport)

- (uint64_t)hmd_isForRemoteTransport
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("kTransportTypeAssociationKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

- (uint64_t)hmd_isForRemoteTransportOnSameAccount
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("DeviceIsOnSameAccountKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

- (uint64_t)hmd_isForRemoteGatewayCoder
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("RemoteGateway"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

- (uint64_t)hmd_isForRemoteUserAdministrator
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("RemoteUserIsAdministrator"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

- (uint64_t)hmd_isForNonAdminSharedUser
{
  uint64_t result;

  result = objc_msgSend(a1, "hmd_isForRemoteTransport");
  if ((_DWORD)result)
  {
    if ((objc_msgSend(a1, "hmd_isForRemoteTransportOnSameAccount") & 1) != 0
      || (objc_msgSend(a1, "hmd_isForRemoteGatewayCoder") & 1) != 0)
    {
      return 0;
    }
    else
    {
      return objc_msgSend(a1, "hmd_isForRemoteUserAdministrator") ^ 1;
    }
  }
  return result;
}

- (id)hmd_user
{
  void *v1;
  id v2;

  objc_getAssociatedObject(a1, CFSTR("User"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (uint64_t)hmd_isForSharedUser
{
  uint64_t result;

  result = objc_msgSend(a1, "hmd_isForRemoteTransport");
  if ((_DWORD)result)
  {
    if ((objc_msgSend(a1, "hmd_isForRemoteTransportOnSameAccount") & 1) != 0)
      return 0;
    else
      return objc_msgSend(a1, "hmd_isForRemoteGatewayCoder") ^ 1;
  }
  return result;
}

- (uint64_t)hmd_dataVersion
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  objc_getAssociatedObject(a1, CFSTR("DataVersion"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 1;

  return v5;
}

- (id)hmd_supportedFeatures
{
  void *v1;
  id v2;

  objc_getAssociatedObject(a1, CFSTR("SupportedFeatures"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

@end
