@implementation NSCoder(XPCTransport)

- (uint64_t)hmd_isForXPCTransport
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("kXPCTransportTypeAssociationKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

- (id)hmd_message
{
  void *v1;
  void *v2;
  id v3;

  objc_getAssociatedObject(a1, CFSTR("kXPCMessageKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (uint64_t)hmd_homeManagerOptions
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "hmd_message");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return -1;
  objc_msgSend(a1, "hmd_message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "homeManagerOptions");

  return v4;
}

- (uint64_t)hmd_entitlements
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hmd_message");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "entitlements");

  return v2;
}

- (id)hmd_applicationBundleIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hmd_message");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "applicationBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)hmd_isForXPCTransportEntitledForSPIAccess
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hmd_message");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEntitledForSPIAccess");

  return v2;
}

- (uint64_t)hmd_isForXPCTransportAuthorizedForLocationAccess
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hmd_message");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isAuthorizedForLocationAccess");

  return v2;
}

- (uint64_t)hmd_isForXPCTransportEntitledForHomeLocationAccess
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hmd_message");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEntitledForHomeLocationAccess");

  return v2;
}

- (uint64_t)hmd_isForXPCTransportEntitledForAssistantIdentifiers
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hmd_message");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEntitledForAssistantIdentifiers");

  return v2;
}

- (uint64_t)hmd_isForXPCTransportEntitledForHomeLocationFeedbackAccess
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hmd_message");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEntitledForHomeLocationFeedbackAccess");

  return v2;
}

@end
