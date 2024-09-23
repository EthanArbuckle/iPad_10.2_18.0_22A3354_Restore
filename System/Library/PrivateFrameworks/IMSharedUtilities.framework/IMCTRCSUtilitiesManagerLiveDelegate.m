@implementation IMCTRCSUtilitiesManagerLiveDelegate

- (_TtC17IMSharedUtilitiesP33_CDA2CBCEBC7ECDABD170E61A465583F135IMCTRCSUtilitiesManagerLiveDelegate)init
{
  return (_TtC17IMSharedUtilitiesP33_CDA2CBCEBC7ECDABD170E61A465583F135IMCTRCSUtilitiesManagerLiveDelegate *)sub_19E31DBF0();
}

- (void)registerServiceCapabilityNotifications
{
  void *v3;
  id v4;
  id v5;
  _TtC17IMSharedUtilitiesP33_CDA2CBCEBC7ECDABD170E61A465583F135IMCTRCSUtilitiesManagerLiveDelegate *v6;

  v3 = (void *)objc_opt_self();
  v6 = self;
  v4 = objc_msgSend(v3, sel_sharedInstance);
  v5 = objc_msgSend(v4, sel_ctSubscriptionInfo);

  sub_19E31E13C((uint64_t)sub_19E31E070, 0);
}

- (BOOL)supportedForPhoneNumber:(id)a3 simID:(id)a4
{
  return sub_19E321018(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_19E31E7F4);
}

- (id)revokeIntervalForPhoneNumber:(id)a3 simID:(id)a4
{
  return sub_19E320D14(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_19E31EA94);
}

- (BOOL)enabledByDefaultForContext:(id)a3
{
  id v4;
  _TtC17IMSharedUtilitiesP33_CDA2CBCEBC7ECDABD170E61A465583F135IMCTRCSUtilitiesManagerLiveDelegate *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_19E31F154(v4);

  return self & 1;
}

- (id)subscriptionsWithRCSSupport
{
  void *v3;
  _TtC17IMSharedUtilitiesP33_CDA2CBCEBC7ECDABD170E61A465583F135IMCTRCSUtilitiesManagerLiveDelegate *v4;
  id v5;
  id v6;
  _TtC17IMSharedUtilitiesP33_CDA2CBCEBC7ECDABD170E61A465583F135IMCTRCSUtilitiesManagerLiveDelegate *v7;
  void *v8;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_sharedInstance);
  v6 = objc_msgSend(v5, sel_ctSubscriptionInfo);

  if (v6)
  {
    v7 = (_TtC17IMSharedUtilitiesP33_CDA2CBCEBC7ECDABD170E61A465583F135IMCTRCSUtilitiesManagerLiveDelegate *)objc_msgSend(v6, sel___im_subscriptionsWithRCSSupport);

    sub_19E24B854(0, &qword_1EE500820);
    sub_19E36F960();

    v4 = v7;
  }

  sub_19E24B854(0, &qword_1EE500820);
  v8 = (void *)sub_19E36F954();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)subscriptionContextForForSimID:(id)a3 phoneNumber:(id)a4
{
  id v4;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _TtC17IMSharedUtilitiesP33_CDA2CBCEBC7ECDABD170E61A465583F135IMCTRCSUtilitiesManagerLiveDelegate *v11;
  id v12;

  v4 = a4;
  if (!a3)
  {
    v6 = 0;
    v8 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v6 = sub_19E36F888();
  v8 = v7;
  if (!v4)
    goto LABEL_5;
LABEL_3:
  v9 = sub_19E36F888();
  v4 = v10;
LABEL_6:
  v11 = self;
  v12 = sub_19E322528(v6, v8, v9, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

- (id)copyCarrierBundleValueForSubscriptionContext:(id)a3 keyHierarchy:(id)a4 defaultValue:(id)a5 valueIfError:(id)a6
{
  id v10;
  _TtC17IMSharedUtilitiesP33_CDA2CBCEBC7ECDABD170E61A465583F135IMCTRCSUtilitiesManagerLiveDelegate *v11;
  id v12;
  _TtC17IMSharedUtilitiesP33_CDA2CBCEBC7ECDABD170E61A465583F135IMCTRCSUtilitiesManagerLiveDelegate *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  _OWORD v21[2];
  _OWORD v22[2];
  __int128 v23;
  uint64_t v24;

  sub_19E36F960();
  if (a5)
  {
    v10 = a3;
    v11 = self;
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    sub_19E36FC0C();
    swift_unknownObjectRelease();
    if (a6)
    {
LABEL_3:
      sub_19E36FC0C();
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    memset(v22, 0, sizeof(v22));
    v12 = a3;
    v13 = self;
    swift_unknownObjectRetain();
    if (a6)
      goto LABEL_3;
  }
  memset(v21, 0, sizeof(v21));
LABEL_6:
  sub_19E31F564((uint64_t)a3, (uint64_t)v22, (uint64_t)v21, &v23);

  swift_bridgeObjectRelease();
  sub_19E322284((uint64_t)v21);
  sub_19E322284((uint64_t)v22);
  v14 = v24;
  if (!v24)
    return 0;
  v15 = sub_19E323360(&v23, v24);
  v16 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v15);
  v18 = (char *)v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v16 + 16))(v18);
  v19 = (void *)sub_19E36FE04();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v14);
  sub_19E323384((uint64_t)&v23);
  return v19;
}

- (BOOL)getBoolFromDomain:(id)a3 forKey:(id)a4 defaultValue:(BOOL)a5
{
  uint64_t v5;
  void *v7;
  _TtC17IMSharedUtilitiesP33_CDA2CBCEBC7ECDABD170E61A465583F135IMCTRCSUtilitiesManagerLiveDelegate *v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a5;
  sub_19E36F888();
  sub_19E36F888();
  v7 = (void *)objc_opt_self();
  v8 = self;
  v9 = objc_msgSend(v7, sel_sharedInstance);
  v10 = (void *)sub_19E36F864();
  v11 = (void *)sub_19E36F864();
  LOBYTE(v5) = objc_msgSend(v9, sel_getBoolFromDomain_forKey_defaultValue_, v10, v11, v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v5;
}

- (void)setBool:(BOOL)a3 forDomain:(id)a4 forKey:(id)a5
{
  _BOOL8 v5;
  void *v7;
  _TtC17IMSharedUtilitiesP33_CDA2CBCEBC7ECDABD170E61A465583F135IMCTRCSUtilitiesManagerLiveDelegate *v8;
  id v9;
  void *v10;
  id v11;

  v5 = a3;
  sub_19E36F888();
  sub_19E36F888();
  v7 = (void *)objc_opt_self();
  v8 = self;
  v9 = objc_msgSend(v7, sel_sharedInstance);
  v10 = (void *)sub_19E36F864();
  v11 = (id)sub_19E36F864();
  objc_msgSend(v9, sel_setBool_forDomain_forKey_, v5, v10, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (void).cxx_destruct
{
  swift_release();
}

- (void)systemConfigurationChanged:(id)a3 withConfiguration:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  _TtC17IMSharedUtilitiesP33_CDA2CBCEBC7ECDABD170E61A465583F135IMCTRCSUtilitiesManagerLiveDelegate *v11;

  v6 = a3;
  v7 = a4;
  v11 = self;
  v8 = objc_msgSend(v6, sel_labelID);
  if (v8)
  {
    v9 = v8;
    sub_19E36F888();

    v10 = MEMORY[0x1E0C80A78](v11);
    MEMORY[0x1E0C80A78](v10);
    sub_19E36FAF8();

    swift_bridgeObjectRelease();
  }
  else
  {

  }
}

- (void)activeSubscriptionsDidChange
{
  _TtC17IMSharedUtilitiesP33_CDA2CBCEBC7ECDABD170E61A465583F135IMCTRCSUtilitiesManagerLiveDelegate *v2;

  v2 = self;
  sub_19E31E13C((uint64_t)sub_19E31FDB0, 0);

}

@end
