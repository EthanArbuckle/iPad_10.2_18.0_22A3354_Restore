@implementation BSServiceConnection(Entitlements)

- (uint64_t)dnds_hasStateUpdatesEntitlementForClientIdentifier:()Entitlements
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.state.updates.client-identifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)dnds_hasAnyValidEntitlement
{
  void *v2;
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.behavior.resolution.client-identifiers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.mode.assertion.client-identifiers"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v3 = 1;
    }
    else
    {
      objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.state.request.client-identifiers"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count"))
      {
        v3 = 1;
      }
      else
      {
        objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.state.updates.client-identifiers"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "count"))
        {
          v3 = 1;
        }
        else
        {
          objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.settings.request.client-identifiers"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v7, "count"))
          {
            v3 = 1;
          }
          else
          {
            objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.settings.modify.client-identifiers"));
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v8, "count"))
            {
              v3 = 1;
            }
            else
            {
              objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.settings.updates.client-identifiers"));
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v9, "count"))
              {
                v3 = 1;
              }
              else
              {
                objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.modeconfiguration.request.client-identifiers"));
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v10, "count"))
                {
                  v3 = 1;
                }
                else
                {
                  objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.modeconfiguration.modify.client-identifiers"));
                  v11 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v11, "count"))
                  {
                    v3 = 1;
                  }
                  else
                  {
                    objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.modeconfiguration.updates.client-identifiers"));
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v15, "count"))
                    {
                      v3 = 1;
                    }
                    else
                    {
                      objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.modeconfiguration.availability.client-identifiers"));
                      v14 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v14, "count"))
                      {
                        v3 = 1;
                      }
                      else
                      {
                        objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.medevicestate.client-identifiers"));
                        v13 = (void *)objc_claimAutoreleasedReturnValue();
                        v3 = objc_msgSend(v13, "count") != 0;

                      }
                    }

                  }
                }

              }
            }

          }
        }

      }
    }

  }
  return v3;
}

- (id)_dnds_safeStringArrayEntitlementForKey:()Entitlements
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_respondsToSelector();
  v6 = (void *)MEMORY[0x1E0C9AA60];
  if (a1 && (v5 & 1) != 0)
  {
    objc_msgSend(a1, "remoteProcess");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForEntitlement:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_36);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "filteredArrayUsingPredicate:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = (void *)MEMORY[0x1E0C9AA60];
      }
    }

  }
  return v6;
}

- (uint64_t)dnds_hasStateRequestEntitlementForClientIdentifier:()Entitlements
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.state.request.client-identifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (uint64_t)dnds_hasBehaviorResolutionEntitlementForClientIdentifier:()Entitlements
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.behavior.resolution.client-identifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (uint64_t)dnds_hasEntitlementsToRequestAssertionWithDetails:()Entitlements clientIdentifier:
{
  return objc_msgSend(a1, "dnds_hasModeAssertionEntitlementForClientIdentifier:", a4);
}

- (uint64_t)dnds_hasModeAssertionEntitlementForClientIdentifier:()Entitlements
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.mode.assertion.client-identifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (uint64_t)dnds_hasUserRequestedModeAssertionEntitlementForClientIdentifier:()Entitlements
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.mode.assertion.user-requested.client-identifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (uint64_t)dnds_hasAuxiliaryStateModificationEntitlementForClientIdentifier:()Entitlements
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.auxiliary-state.modification.client-identifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (uint64_t)dnds_hasSettingsRequestEntitlementForClientIdentifier:()Entitlements
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.settings.request.client-identifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (uint64_t)dnds_hasSettingsModificationEntitlementForClientIdentifier:()Entitlements
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.settings.modify.client-identifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (uint64_t)dnds_hasSettingsUpdatesEntitlementForClientIdentifier:()Entitlements
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.settings.updates.client-identifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (uint64_t)dnds_hasModeConfigurationRequestEntitlementForClientIdentifier:()Entitlements
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.modeconfiguration.request.client-identifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (uint64_t)dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:()Entitlements
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.modeconfiguration.modify.client-identifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (uint64_t)dnds_hasModeConfigurationUpdatesEntitlementForClientIdentifier:()Entitlements
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.modeconfiguration.updates.client-identifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (uint64_t)dnds_hasModeConfigurationAvailabilityEntitlementForClientIdentifier:()Entitlements
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.modeconfiguration.availability.client-identifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (uint64_t)dnds_hasActiveModeUpdatesEntitlementForClientIdentifier:()Entitlements
{
  id v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;

  v4 = a3;
  v5 = objc_msgSend(a1, "dnds_hasModeConfigurationUpdatesEntitlementForClientIdentifier:", v4);
  v6 = objc_msgSend(a1, "dnds_hasModeAssertionEntitlementForClientIdentifier:", v4);
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.focus.activity-manager")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.FocusSettings")) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v7 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Focus-Settings.extension"));
  }
  if (v5)
    v8 = v6 & v7;
  else
    v8 = 0;

  return v8;
}

- (uint64_t)dnds_hasMeDeviceStateEntitlementForClientIdentifier:()Entitlements
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_dnds_safeStringArrayEntitlementForKey:", CFSTR("com.apple.private.donotdisturb.medevicestate.client-identifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (uint64_t)dnds_hasUserNotificationsCommunicationEntitlement
{
  void *v2;
  void *v3;
  uint64_t v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = a1;
  else
    v2 = 0;
  objc_msgSend(v2, "remoteProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasEntitlement:", CFSTR("com.apple.developer.usernotifications.communication"));

  return v4;
}

@end
