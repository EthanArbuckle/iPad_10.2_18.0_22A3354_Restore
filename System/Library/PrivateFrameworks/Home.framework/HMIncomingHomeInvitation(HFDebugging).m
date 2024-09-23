@implementation HMIncomingHomeInvitation(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  objc_super v12;

  v12.receiver = a1;
  v12.super_class = (Class)&off_1F0454D88;
  objc_msgSendSuper2(&v12, sel_hf_stateDumpBuilderWithContext_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "inviter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("inviter"));

  objc_msgSend(a1, "homeName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("homeName"));

  objc_msgSend(a1, "homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("homeUUID"));

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(a1, "isInviteeRestrictedGuest");
    NSStringFromBOOL();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("isInviteeRestrictedGuest"));

    if (objc_msgSend(a1, "isInviteeRestrictedGuest"))
    {
      objc_msgSend(a1, "restrictedGuestSchedule");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "description");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v8)
        v10 = (const __CFString *)v8;
      else
        v10 = CFSTR("Always Allowed (aka nil)");
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("restrictedGuestSchedule"));

    }
  }
  return v2;
}

@end
