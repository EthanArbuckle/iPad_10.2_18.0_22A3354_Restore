@implementation CNSensitiveContentUIEntitlementVerifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlementVerifier, 0);
}

- (CNSensitiveContentUIEntitlementVerifier)init
{
  CNSensitiveContentUIEntitlementVerifier *v2;
  CNEntitlementVerifier *v3;
  CNEntitlementVerifier *entitlementVerifier;
  CNSensitiveContentUIEntitlementVerifier *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNSensitiveContentUIEntitlementVerifier;
  v2 = -[CNSensitiveContentUIEntitlementVerifier init](&v7, sel_init);
  if (v2)
  {
    v3 = (CNEntitlementVerifier *)objc_alloc_init(MEMORY[0x1E0D13A30]);
    entitlementVerifier = v2->_entitlementVerifier;
    v2->_entitlementVerifier = v3;

    v5 = v2;
  }

  return v2;
}

- (BOOL)processHasScreentimeEntitlements
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint8_t v9[16];

  -[CNSensitiveContentUIEntitlementVerifier entitlementVerifier](self, "entitlementVerifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentProcessHasBooleanEntitlement:error:", CFSTR("com.apple.private.screentime-communication"), 0);

  -[CNSensitiveContentUIEntitlementVerifier entitlementVerifier](self, "entitlementVerifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 & objc_msgSend(v5, "currentProcessHasArrayWithStringValue:forAnyEntitlement:error:", CFSTR("com.apple.ScreenTimeAgent.communication"), &unk_1E20D37D8, 0);

  if ((v6 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_debug_impl(&dword_18AC56000, v7, OS_LOG_TYPE_DEBUG, "Missing screentime entitlements", v9, 2u);
    }

  }
  return v6;
}

- (BOOL)processCanReadCommunicationSafetySettings
{
  void *v2;
  char v3;
  NSObject *v4;
  uint8_t v6[16];

  -[CNSensitiveContentUIEntitlementVerifier entitlementVerifier](self, "entitlementVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentProcessHasArrayWithStringValue:forAnyEntitlement:error:", CFSTR("com.apple.communicationSafetySettings"), &unk_1E20D37F0, 0);

  if ((v3 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_debug_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEBUG, "Missing shared preference access for communication safety settings", v6, 2u);
    }

  }
  return v3;
}

- (BOOL)processHasCommunicationFilterEntitlements
{
  void *v2;
  char v3;
  NSObject *v4;
  uint8_t v6[16];

  -[CNSensitiveContentUIEntitlementVerifier entitlementVerifier](self, "entitlementVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentProcessHasBooleanEntitlement:error:", CFSTR("com.apple.private.communicationsfilter"), 0);

  if ((v3 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_debug_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEBUG, "Missing communcation filter entitlements", v6, 2u);
    }

  }
  return v3;
}

- (BOOL)processHasUserSafetyEntitlements
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  uint8_t v7[16];
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[CNSensitiveContentUIEntitlementVerifier entitlementVerifier](self, "entitlementVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = CFSTR("com.apple.developer.usersafety.client");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "currentProcessHasArrayWithStringValue:forAnyEntitlement:error:", CFSTR("analysis"), v3, 0);

  if ((v4 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_debug_impl(&dword_18AC56000, v5, OS_LOG_TYPE_DEBUG, "Missing user saftey entitlements", v7, 2u);
    }

  }
  return v4;
}

- (BOOL)canShowSensitiveContentUI
{
  NSObject *v4;
  uint8_t v5[16];

  if (-[CNSensitiveContentUIEntitlementVerifier processHasScreentimeEntitlements](self, "processHasScreentimeEntitlements")&& -[CNSensitiveContentUIEntitlementVerifier processCanReadCommunicationSafetySettings](self, "processCanReadCommunicationSafetySettings")&& -[CNSensitiveContentUIEntitlementVerifier processHasUserSafetyEntitlements](self, "processHasUserSafetyEntitlements"))
  {
    return 1;
  }
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_18AC56000, v4, OS_LOG_TYPE_ERROR, "Unable to show sensitive content UI, process is not correctly entitled", v5, 2u);
  }

  return 0;
}

- (CNEntitlementVerifier)entitlementVerifier
{
  return self->_entitlementVerifier;
}

- (void)setEntitlementVerifier:(id)a3
{
  objc_storeStrong((id *)&self->_entitlementVerifier, a3);
}

+ (id)log
{
  if (log_cn_once_token_1_20739 != -1)
    dispatch_once(&log_cn_once_token_1_20739, &__block_literal_global_20740);
  return (id)log_cn_once_object_1_20741;
}

void __46__CNSensitiveContentUIEntitlementVerifier_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNSensitiveContentUIEntitlementVerifier");
  v1 = (void *)log_cn_once_object_1_20741;
  log_cn_once_object_1_20741 = (uint64_t)v0;

}

@end
