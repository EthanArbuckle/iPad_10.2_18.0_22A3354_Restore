@implementation IMCTRCSUtilities

+ (BOOL)IMCarrierRequiresFirstTimeOnAlert
{
  id v2;
  unsigned __int8 v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
  v3 = objc_msgSend(v2, sel_carrierRequiresFirstTimeOnAlert);

  return v3;
}

+ (BOOL)IMCarrierRequiresFirstTimeOnAlertForPhoneNumber:(id)a3 simID:(id)a4
{
  return sub_19E323F48((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_carrierRequiresFirstTimeOnAlertForPhoneNumber_simID_);
}

+ (BOOL)IMRCSSupportedForPhoneNumber:(id)a3 simID:(id)a4
{
  return sub_19E323F48((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_supportedForPhoneNumber_simID_);
}

+ (BOOL)IMRCSGroupMessagingEnabledForPhoneNumber:(id)a3 simID:(id)a4
{
  return sub_19E324110((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_groupMessagingEnabledForPhoneNumber_simID_);
}

+ (int64_t)IMRCSGroupMessagingMaxGroupSizeForPhoneNumber:(id)a3 simID:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  sub_19E36F888();
  if (a4)
  {
    sub_19E36F888();
    a4 = v5;
  }
  v6 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
  v7 = (void *)sub_19E36F864();
  if (a4)
    v8 = (void *)sub_19E36F864();
  else
    v8 = 0;
  v9 = objc_msgSend(v6, sel_groupMessagingMaxGroupSizeForPhoneNumber_simID_, v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return (int64_t)v9;
}

+ (BOOL)IMRCSGroupTextReplicationSupportedForPhoneNumber:(id)a3 simID:(id)a4
{
  return sub_19E324110((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_groupTextReplicationSupportedForPhoneNumber_simID_);
}

+ (BOOL)IMRCSEnabledForPhoneNumber:(id)a3 simID:(id)a4
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 v10;

  v4 = a4;
  if (!a3)
  {
    v5 = 0;
    v7 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  v5 = sub_19E36F888();
  v7 = v6;
  if (!v4)
    goto LABEL_5;
LABEL_3:
  v8 = sub_19E36F888();
  v4 = v9;
LABEL_6:
  v10 = sub_19E324344(v5, v7, v8, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

- (IMCTRCSUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMCTRCSUtilities;
  return -[IMCTRCSUtilities init](&v3, sel_init);
}

@end
