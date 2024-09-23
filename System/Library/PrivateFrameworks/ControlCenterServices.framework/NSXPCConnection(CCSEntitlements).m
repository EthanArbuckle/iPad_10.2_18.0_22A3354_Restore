@implementation NSXPCConnection(CCSEntitlements)

- (uint64_t)ccs_hasEntitlementForModuleIdentifier:()CCSEntitlements
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BE0BDB8];
  objc_msgSend(a1, "_xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tokenFromXPCConnection:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.private.controlcenter.service.moduleidentifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v8, "containsObject:", v4) & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v7, "valueForEntitlement:", CFSTR("application-identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqual:", CFSTR("com.apple.control-center.controlcentertool")) & 1) != 0
      || (objc_msgSend(v11, "isEqual:", CFSTR("com.apple.internal.suiautomation")) & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      v10 = objc_msgSend(v11, "isEqual:", CFSTR("com.apple.springboard"));
    }

  }
  return v10;
}

- (uint64_t)ccs_hasEntitlementForListingModuleIdentifiers
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = (void *)MEMORY[0x24BE0BDB8];
  objc_msgSend(a1, "_xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "tokenFromXPCConnection:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "valueForEntitlement:", CFSTR("application-identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", CFSTR("com.apple.control-center.controlcentertool"));

  return v5;
}

- (uint64_t)ccs_hasEntitlementForForciblyEnablingModules
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = (void *)MEMORY[0x24BE0BDB8];
  objc_msgSend(a1, "_xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "tokenFromXPCConnection:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "valueForEntitlement:", CFSTR("application-identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", CFSTR("com.apple.control-center.controlcentertool")) & 1) != 0
    || (objc_msgSend(v4, "isEqual:", CFSTR("com.apple.internal.suiautomation")) & 1) != 0
    || (objc_msgSend(v4, "isEqual:", CFSTR("com.apple.springboard")) & 1) != 0
    || (objc_msgSend(v4, "isEqual:", CFSTR("com.apple.accessibility.AccessibilityUIServer")) & 1) != 0
    || (objc_msgSend(v4, "isEqual:", CFSTR("com.apple.internal.suiuntool.SystemExperienceAutomationAngel")) & 1) != 0
    || (objc_msgSend(v4, "isEqual:", CFSTR("com.apple.accessibility.heard")) & 1) != 0
    || (objc_msgSend(v4, "isEqual:", CFSTR("com.apple.tvremoted")) & 1) != 0
    || (objc_msgSend(v4, "isEqual:", CFSTR("com.apple.Music")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqual:", CFSTR("com.apple.amp.MusicUI.MusicUIEngagementExtension"));
  }

  return v5;
}

- (uint64_t)ccs_hasEntitlementForHandlingControlCenterOperation
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = (void *)MEMORY[0x24BE0BDB8];
  objc_msgSend(a1, "_xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "tokenFromXPCConnection:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "valueForEntitlement:", CFSTR("application-identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", CFSTR("com.apple.control-center.controlcentertool")) & 1) != 0
    || (objc_msgSend(v4, "isEqual:", CFSTR("com.apple.internal.suiautomation")) & 1) != 0
    || (objc_msgSend(v4, "isEqual:", CFSTR("com.apple.springboard")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqual:", CFSTR("com.apple.GameOverlayUI"));
  }

  return v5;
}

@end
