uint64_t static SettingsBundle.appLaunchUpsell.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1EF28B3B0 != -1)
    swift_once();
  v2 = sub_1BA4360DC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EF28F2E0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

unint64_t sub_1BA413300()
{
  unint64_t result;

  result = qword_1ED5C1360;
  if (!qword_1ED5C1360)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for SettingsArticleAccess, &type metadata for SettingsArticleAccess);
    atomic_store(result, (unint64_t *)&qword_1ED5C1360);
  }
  return result;
}

unint64_t sub_1BA413348()
{
  unint64_t result;

  result = qword_1EF28F2F8;
  if (!qword_1EF28F2F8)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for BundleTrialStatus, &type metadata for BundleTrialStatus);
    atomic_store(result, (unint64_t *)&qword_1EF28F2F8);
  }
  return result;
}

ValueMetadata *type metadata accessor for SettingsArticleAccess()
{
  return &type metadata for SettingsArticleAccess;
}

uint64_t _s16NewsSubscription21SettingsArticleAccessOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_1BA4133EC + 4 * byte_1BA446B55[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1BA413420 + 4 * byte_1BA446B50[v4]))();
}

uint64_t sub_1BA413420(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA413428(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA413430);
  return result;
}

uint64_t sub_1BA41343C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA413444);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1BA413448(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA413450(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BundleTrialStatus()
{
  return &type metadata for BundleTrialStatus;
}

ValueMetadata *type metadata accessor for Settings.AppLaunch()
{
  return &type metadata for Settings.AppLaunch;
}

ValueMetadata *type metadata accessor for Settings.Features()
{
  return &type metadata for Settings.Features;
}

ValueMetadata *type metadata accessor for Settings.PurchaseFlow()
{
  return &type metadata for Settings.PurchaseFlow;
}

ValueMetadata *type metadata accessor for Settings.SubscriptionLink()
{
  return &type metadata for Settings.SubscriptionLink;
}

ValueMetadata *type metadata accessor for Settings.PaywallConfigs()
{
  return &type metadata for Settings.PaywallConfigs;
}

uint64_t type metadata accessor for Settings.PaywallConfigs.ConfigOverrides(uint64_t a1)
{
  return sub_1BA2F2D68(a1, (uint64_t *)&unk_1ED5BCD50);
}

uint64_t sub_1BA4134D0()
{
  return sub_1BA41359C();
}

uint64_t sub_1BA4134DC()
{
  return type metadata accessor for Settings.PaywallConfigs.ConfigOverrides(0);
}

ValueMetadata *type metadata accessor for Settings.BestOffers()
{
  return &type metadata for Settings.BestOffers;
}

uint64_t type metadata accessor for Settings.BestOffers.ConfigOverrides(uint64_t a1)
{
  return sub_1BA2F2D68(a1, (uint64_t *)&unk_1ED5BCD08);
}

uint64_t sub_1BA413508()
{
  return sub_1BA41359C();
}

uint64_t sub_1BA413514()
{
  return type metadata accessor for Settings.BestOffers.ConfigOverrides(0);
}

ValueMetadata *type metadata accessor for Settings.AccessChecks()
{
  return &type metadata for Settings.AccessChecks;
}

ValueMetadata *type metadata accessor for Settings.Entitlements()
{
  return &type metadata for Settings.Entitlements;
}

ValueMetadata *type metadata accessor for Settings.Subscriptions()
{
  return &type metadata for Settings.Subscriptions;
}

ValueMetadata *type metadata accessor for Settings.PostPurchaseOnboardingFlow()
{
  return &type metadata for Settings.PostPurchaseOnboardingFlow;
}

ValueMetadata *type metadata accessor for Settings.BundleSubscriptions()
{
  return &type metadata for Settings.BundleSubscriptions;
}

ValueMetadata *type metadata accessor for Settings.ALaCarteSubscriptions()
{
  return &type metadata for Settings.ALaCarteSubscriptions;
}

uint64_t type metadata accessor for Settings.ALaCarteSubscriptions.SIWAConfigOverrides(uint64_t a1)
{
  return sub_1BA2F2D68(a1, (uint64_t *)&unk_1EF28F330);
}

uint64_t sub_1BA413590()
{
  return sub_1BA41359C();
}

uint64_t sub_1BA41359C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1BA4135D4()
{
  return type metadata accessor for Settings.ALaCarteSubscriptions.SIWAConfigOverrides(0);
}

ValueMetadata *type metadata accessor for Settings.PaidBundleViaOffer()
{
  return &type metadata for Settings.PaidBundleViaOffer;
}

ValueMetadata *type metadata accessor for Settings.WebAccess()
{
  return &type metadata for Settings.WebAccess;
}

unint64_t sub_1BA4135FC()
{
  unint64_t result;

  result = qword_1EF28F380;
  if (!qword_1EF28F380)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for BundleTrialStatus, &type metadata for BundleTrialStatus);
    atomic_store(result, (unint64_t *)&qword_1EF28F380);
  }
  return result;
}

unint64_t sub_1BA413640()
{
  unint64_t result;

  result = qword_1ED5C1368;
  if (!qword_1ED5C1368)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for SettingsArticleAccess, &type metadata for SettingsArticleAccess);
    atomic_store(result, (unint64_t *)&qword_1ED5C1368);
  }
  return result;
}

unint64_t sub_1BA413684()
{
  unint64_t result;

  result = qword_1EF28F3A0;
  if (!qword_1EF28F3A0)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF28F3A0);
  }
  return result;
}

unint64_t sub_1BA4136D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF28F3B0;
  if (!qword_1EF28F3B0)
  {
    sub_1BA2FF340(255, &qword_1EF28F3A8, MEMORY[0x1E0DEAFA0], MEMORY[0x1E0DB5980], MEMORY[0x1E0DB5770]);
    result = MEMORY[0x1BCCDC37C](MEMORY[0x1E0DB5780], v1);
    atomic_store(result, (unint64_t *)&qword_1EF28F3B0);
  }
  return result;
}

void sub_1BA413740(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), unint64_t *a4, uint64_t a5)
{
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    a3(255);
    sub_1BA2F25C8(a4, a3, a5);
    v9 = sub_1BA436220();
    if (!v10)
      atomic_store(v9, a2);
  }
}

void sub_1BA4137C0(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    sub_1BA2FC03C(255, a3, a4, MEMORY[0x1E0DB5820]);
    v5 = sub_1BA4383B0();
    if (!v6)
      atomic_store(v5, a2);
  }
}

void sub_1BA413820()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF28F3B8)
  {
    sub_1BA2FC03C(255, (unint64_t *)&qword_1ED5BE5C0, MEMORY[0x1E0DEA968], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
    sub_1BA413898();
    v0 = sub_1BA436220();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF28F3B8);
  }
}

unint64_t sub_1BA413898()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF28EF88;
  if (!qword_1EF28EF88)
  {
    sub_1BA2FC03C(255, (unint64_t *)&qword_1ED5BE5C0, MEMORY[0x1E0DEA968], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1BCCDC37C](MEMORY[0x1E0DB5978], v1);
    atomic_store(result, (unint64_t *)&qword_1EF28EF88);
  }
  return result;
}

unint64_t sub_1BA4138F8()
{
  unint64_t result;

  result = qword_1EF28F3C8;
  if (!qword_1EF28F3C8)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for BundleTrialStatus, &type metadata for BundleTrialStatus);
    atomic_store(result, (unint64_t *)&qword_1EF28F3C8);
  }
  return result;
}

unint64_t sub_1BA41393C()
{
  unint64_t result;

  result = qword_1EF28F3E0;
  if (!qword_1EF28F3E0)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for BundleTrialStatus, &type metadata for BundleTrialStatus);
    atomic_store(result, (unint64_t *)&qword_1EF28F3E0);
  }
  return result;
}

void sub_1BA413980(uint64_t a1, unint64_t *a2, void (*a3)(void))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3();
    v4 = sub_1BA436220();
    if (!v5)
      atomic_store(v4, a2);
  }
}

unint64_t sub_1BA4139D8()
{
  unint64_t result;

  result = qword_1ED5C1358;
  if (!qword_1ED5C1358)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for SettingsArticleAccess, &type metadata for SettingsArticleAccess);
    atomic_store(result, (unint64_t *)&qword_1ED5C1358);
  }
  return result;
}

unint64_t sub_1BA413A1C()
{
  unint64_t result;

  result = qword_1ED5C1350;
  if (!qword_1ED5C1350)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for SettingsArticleAccess, &type metadata for SettingsArticleAccess);
    atomic_store(result, (unint64_t *)&qword_1ED5C1350);
  }
  return result;
}

uint64_t dispatch thunk of PaidBundleViaOfferFeatureAvailabilityType.paywallsEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PaidBundleViaOfferFeatureAvailabilityType.subscriptionsDeeplinkEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PaidBundleViaOfferFeatureAvailabilityType.mastheadBannerEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of PaidBundleViaOfferFeatureAvailabilityType.iconBadgeEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of PaidBundleViaOfferFeatureAvailabilityType.iconBadgeMercuryEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of PaidBundleViaOfferFeatureAvailabilityType.localNotificationEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of PaidBundleViaOfferFeatureAvailabilityType.appLaunchUpsellEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of PaidBundleViaOfferFeatureAvailabilityType.isPaidBundleViaOfferEligible.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of PaidBundleViaOfferFeatureAvailabilityType.refreshPaidBundleViaOfferEligibility()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t __swift_memcpy9_1(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for DefaultPaidBundleViaOfferFeatureAvailability(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[9])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DefaultPaidBundleViaOfferFeatureAvailability(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for DefaultPaidBundleViaOfferFeatureAvailability()
{
  return &type metadata for DefaultPaidBundleViaOfferFeatureAvailability;
}

uint64_t sub_1BA413B84()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t sub_1BA413B8C()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t sub_1BA413B94()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t sub_1BA413B9C()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 3);
}

uint64_t sub_1BA413BA4()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 4);
}

uint64_t sub_1BA413BAC()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 5);
}

uint64_t sub_1BA413BB4()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 6);
}

uint64_t sub_1BA413BBC()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 7);
}

uint64_t sub_1BA413BC4()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t sub_1BA413BD0()
{
  sub_1BA309808();
  swift_allocObject();
  return sub_1BA436928();
}

Swift::Bool __swiftcall AMSMarketingItem.isBundleHardwareOffer()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;

  v0 = sub_1BA414C74();
  v1 = v0;
  v2 = *(_QWORD *)(v0 + 16);
  if (!v2)
  {
LABEL_21:
    swift_bridgeObjectRelease();
    LOBYTE(v0) = 0;
    return v0;
  }
  v3 = 0;
  v4 = MEMORY[0x1E0DEA968];
  while (1)
  {
    if (v3 >= *(_QWORD *)(v1 + 16))
    {
      __break(1u);
      return v0;
    }
    v5 = *(_QWORD *)(v1 + 32 + 8 * v3);
    if (*(_QWORD *)(v5 + 16))
      break;
LABEL_4:
    if (++v3 == v2)
      goto LABEL_21;
  }
  swift_bridgeObjectRetain();
  v6 = sub_1BA31A888(0x6C69626967696C65, 0xEF65707954797469);
  if ((v7 & 1) == 0)
    goto LABEL_3;
  sub_1BA31AA58(*(_QWORD *)(v5 + 56) + 32 * v6, (uint64_t)&v18);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_3;
  v18 = v16;
  v19 = v17;
  v16 = 0x4552415744524148;
  v17 = 0xEA0000000000315FLL;
  sub_1BA3596FC();
  v8 = v4;
  v9 = sub_1BA4380E0();
  swift_bridgeObjectRelease();
  if (v9)
    goto LABEL_10;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_10;
  v10 = sub_1BA31A888(0x5465636976726573, 0xEC00000073657079);
  if ((v11 & 1) == 0)
    goto LABEL_10;
  sub_1BA31AA58(*(_QWORD *)(v5 + 56) + 32 * v10, (uint64_t)&v18);
  sub_1BA2FC03C(0, (unint64_t *)&qword_1ED5BE5C0, v4, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_3:
    LOBYTE(v0) = swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  v12 = MEMORY[0x4552415744524158];
  if (!MEMORY[0x4552415744524158])
  {
LABEL_18:
    swift_bridgeObjectRelease();
LABEL_10:
    LOBYTE(v0) = swift_bridgeObjectRelease();
    v4 = v8;
    goto LABEL_4;
  }
  v13 = 0x4552415744524170;
  while (1)
  {
    v14 = *(_QWORD *)v13;
    v18 = *(_QWORD *)(v13 - 8);
    v19 = v14;
    v16 = 0x554C505F5357454ELL;
    v17 = 0xE900000000000053;
    if (!sub_1BA4380E0())
      break;
    v13 += 16;
    if (!--v12)
      goto LABEL_18;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v0) = 1;
  return v0;
}

Swift::Bool __swiftcall AMSMarketingItem.isCIPOffer()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;

  v0 = sub_1BA414C74();
  v1 = v0;
  v2 = *(_QWORD *)(v0 + 16);
  if (!v2)
  {
LABEL_23:
    swift_bridgeObjectRelease();
    LOBYTE(v0) = 0;
    return v0;
  }
  v3 = 0;
  v4 = MEMORY[0x1E0DEA968];
  while (1)
  {
    if (v3 >= *(_QWORD *)(v1 + 16))
    {
      __break(1u);
      return v0;
    }
    v5 = *(_QWORD *)(v1 + 32 + 8 * v3);
    if (*(_QWORD *)(v5 + 16))
      break;
LABEL_4:
    if (++v3 == v2)
      goto LABEL_23;
  }
  swift_bridgeObjectRetain();
  v6 = sub_1BA31A888(0x6C69626967696C65, 0xEF65707954797469);
  if ((v7 & 1) == 0 || (sub_1BA31AA58(*(_QWORD *)(v5 + 56) + 32 * v6, (uint64_t)&v18), (swift_dynamicCast() & 1) == 0))
  {
LABEL_3:
    LOBYTE(v0) = swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  v8 = v17[0];
  v9 = v17[1];
  v18 = v17[0];
  v19 = v17[1];
  strcpy((char *)v17, "HARD_BUNDLE");
  HIDWORD(v17[1]) = -352321536;
  sub_1BA3596FC();
  if (sub_1BA4380E0())
  {
    v18 = v8;
    v19 = v9;
    strcpy((char *)v17, "EXTENDED_OFFER");
    HIBYTE(v17[1]) = -18;
    v10 = sub_1BA4380E0();
    swift_bridgeObjectRelease();
    if (v10 || !*(_QWORD *)(v5 + 16))
      goto LABEL_3;
  }
  else
  {
    swift_bridgeObjectRelease();
    if (!*(_QWORD *)(v5 + 16))
      goto LABEL_3;
  }
  v11 = sub_1BA31A888(0x5465636976726573, 0xEC00000073657079);
  if ((v12 & 1) == 0)
    goto LABEL_3;
  sub_1BA31AA58(*(_QWORD *)(v5 + 56) + 32 * v11, (uint64_t)&v18);
  sub_1BA2FC03C(0, (unint64_t *)&qword_1ED5BE5C0, v4, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_3;
  v13 = *(_QWORD *)(v17[0] + 16);
  if (!v13)
  {
    swift_bridgeObjectRelease();
    goto LABEL_3;
  }
  v14 = (uint64_t *)(v17[0] + 40);
  while (1)
  {
    v15 = *v14;
    v18 = *(v14 - 1);
    v19 = v15;
    strcpy((char *)v17, "NEWS_PLUS");
    WORD1(v17[1]) = 0;
    HIDWORD(v17[1]) = -385875968;
    if (!sub_1BA4380E0())
      break;
    v14 += 2;
    if (!--v13)
    {
      swift_bridgeObjectRelease();
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v0) = 1;
  return v0;
}

uint64_t AMSMarketingItem.priceString(for:)(void *a1)
{
  return sub_1BA4142C0(a1, 0x726F466563697270, 0xEF79616C70736944);
}

uint64_t AMSMarketingItem.priceDiff(for:)(void *a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;

  AMSMarketingItem.value(for:offerDictKey:key:)(a1, 0xD000000000000010, 0x80000001BA45B290, 0x6669446563697270, 0xE900000000000066, &v3);
  if (v4)
  {
    if (swift_dynamicCast())
      return v2;
    else
      return 0;
  }
  else
  {
    sub_1BA319F10((uint64_t)&v3);
    return 0;
  }
}

uint64_t AMSMarketingItem.priceDiffString(for:)(void *a1)
{
  return sub_1BA4142C0(a1, 0xD000000000000013, 0x80000001BA45B2B0);
}

uint64_t sub_1BA4142C0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  AMSMarketingItem.value(for:offerDictKey:key:)(a1, 0xD000000000000010, 0x80000001BA45B290, a2, a3, &v5);
  if (v6)
  {
    if (swift_dynamicCast())
      return v4;
    else
      return 0;
  }
  else
  {
    sub_1BA319F10((uint64_t)&v5);
    return 0;
  }
}

BOOL AMSMarketingItem.trialEligible(for:)(void *a1)
{
  uint64_t v1;
  __int128 v3;
  __int128 v4;
  uint64_t v5;

  AMSMarketingItem.value(for:offerDictKey:key:)(a1, 0x7363697274656DLL, 0xE700000000000000, 0x6C69626967696C65, 0xEF65707954797469, &v4);
  if (v5)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v4 = v3;
      sub_1BA3596FC();
      v1 = sub_1BA4380E0();
      swift_bridgeObjectRelease();
      return v1 == 0;
    }
  }
  else
  {
    sub_1BA319F10((uint64_t)&v4);
  }
  return 0;
}

uint64_t AMSMarketingItem.upsellScenario(for:)@<X0>(char *a1@<X8>)
{
  void *v1;
  id v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t result;
  unint64_t v9;
  char v10;
  char v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v3 = objc_msgSend(v1, sel_rawValues);
  sub_1BA36E548();
  v4 = sub_1BA437BD0();

  if (*(_QWORD *)(v4 + 16) && (v5 = sub_1BA31A888(1635018093, 0xE400000000000000), (v6 & 1) != 0))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v5);
    swift_unknownObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v16 = v7;
    sub_1BA414DF0();
    result = swift_dynamicCast();
    if ((result & 1) != 0)
    {
      if (*(_QWORD *)(v15 + 16) && (v9 = sub_1BA31A888(0x7363697274656DLL, 0xE700000000000000), (v10 & 1) != 0))
      {
        sub_1BA31AA58(*(_QWORD *)(v15 + 56) + 32 * v9, (uint64_t)&v16);
      }
      else
      {
        v16 = 0u;
        v17 = 0u;
      }
      swift_bridgeObjectRelease();
      if (!*((_QWORD *)&v17 + 1))
        goto LABEL_24;
      result = swift_dynamicCast();
      if ((result & 1) == 0)
        goto LABEL_8;
      if (*(_QWORD *)(v15 + 16) && (v12 = sub_1BA31A888(0x63536C6C65737075, 0xEE006F6972616E65), (v13 & 1) != 0))
      {
        sub_1BA31AA58(*(_QWORD *)(v15 + 56) + 32 * v12, (uint64_t)&v16);
      }
      else
      {
        v16 = 0u;
        v17 = 0u;
      }
      swift_bridgeObjectRelease();
      if (!*((_QWORD *)&v17 + 1))
      {
LABEL_24:
        result = sub_1BA319F10((uint64_t)&v16);
        goto LABEL_8;
      }
      result = swift_dynamicCast();
      if ((result & 1) != 0)
      {
        v16 = v15;
        sub_1BA3596FC();
        if (!sub_1BA4380E0())
        {
          result = swift_bridgeObjectRelease();
          v11 = 1;
          goto LABEL_9;
        }
        v16 = v15;
        if (!sub_1BA4380E0())
        {
          result = swift_bridgeObjectRelease();
          v11 = 2;
          goto LABEL_9;
        }
        v16 = v15;
        if (!sub_1BA4380E0())
        {
          result = swift_bridgeObjectRelease();
          v11 = 3;
          goto LABEL_9;
        }
        v16 = v15;
        v14 = sub_1BA4380E0();
        result = swift_bridgeObjectRelease();
        if (!v14)
        {
          v11 = 4;
          goto LABEL_9;
        }
      }
    }
  }
  else
  {
    result = swift_bridgeObjectRelease();
  }
LABEL_8:
  v11 = 0;
LABEL_9:
  *a1 = v11;
  return result;
}

uint64_t AMSMarketingItem.value(for:offerDictKey:key:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _OWORD *a6@<X8>)
{
  void *v6;
  id v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t result;
  unint64_t v19;
  char v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  unint64_t v35;
  char v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;

  v13 = objc_msgSend(v6, sel_rawValues);
  sub_1BA36E548();
  v14 = sub_1BA437BD0();

  if (!*(_QWORD *)(v14 + 16))
    goto LABEL_46;
  v15 = sub_1BA31A888(0x7475626972747461, 0xEA00000000007365);
  if ((v16 & 1) == 0)
    goto LABEL_46;
  v17 = *(_QWORD *)(*(_QWORD *)(v14 + 56) + 8 * v15);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v44 = v17;
  sub_1BA414DF0();
  result = swift_dynamicCast();
  if ((result & 1) == 0)
    goto LABEL_47;
  if (*(_QWORD *)(v43 + 16) && (v19 = sub_1BA31A888(0x73726566666FLL, 0xE600000000000000), (v20 & 1) != 0))
  {
    sub_1BA31AA58(*(_QWORD *)(v43 + 56) + 32 * v19, (uint64_t)&v44);
  }
  else
  {
    v44 = 0u;
    v45 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v45 + 1))
  {
    result = sub_1BA319F10((uint64_t)&v44);
    goto LABEL_47;
  }
  sub_1BA2FC03C(0, (unint64_t *)&unk_1ED5BCBE0, MEMORY[0x1E0DEE9B8] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
  result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_47:
    *a6 = 0u;
    a6[1] = 0u;
    return result;
  }
  v21 = objc_msgSend(a1, sel_buyParams);
  if (!v21)
    goto LABEL_46;
  v22 = v21;
  v41 = AMSBuyParams.purchaseID.getter();
  v24 = v23;

  if (!v24)
    goto LABEL_46;
  v25 = *(_QWORD *)(v43 + 16);
  if (!v25)
  {
LABEL_45:
    swift_bridgeObjectRelease();
LABEL_46:
    result = swift_bridgeObjectRelease();
    goto LABEL_47;
  }
  v39 = a4;
  v40 = a5;
  v26 = v43 + 32;
  while (1)
  {
    sub_1BA31AA58(v26, (uint64_t)&v44);
    if ((swift_dynamicCast() & 1) == 0)
      goto LABEL_15;
    if (!*(_QWORD *)(v43 + 16))
      goto LABEL_14;
    v27 = sub_1BA31A888(0x6D61726150797562, 0xE900000000000073);
    if ((v28 & 1) == 0)
      goto LABEL_14;
    sub_1BA31AA58(*(_QWORD *)(v43 + 56) + 32 * v27, (uint64_t)&v44);
    if ((swift_dynamicCast() & 1) == 0)
      goto LABEL_14;
    v42 = objc_allocWithZone(MEMORY[0x1E0CFDA08]);
    v29 = (void *)sub_1BA437C18();
    swift_bridgeObjectRelease();
    v30 = objc_msgSend(v42, sel_initWithString_, v29);

    v31 = AMSBuyParams.purchaseID.getter();
    v33 = v32;

    if (!v33)
    {
LABEL_14:
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    if (v31 == v41 && v33 == v24)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v34 = sub_1BA4383C8();
      swift_bridgeObjectRelease();
      if ((v34 & 1) == 0)
        goto LABEL_14;
    }
    if (*(_QWORD *)(v43 + 16))
    {
      swift_bridgeObjectRetain();
      v35 = sub_1BA31A888(a2, a3);
      if ((v36 & 1) != 0)
      {
        sub_1BA31AA58(*(_QWORD *)(v43 + 56) + 32 * v35, (uint64_t)&v44);
      }
      else
      {
        v44 = 0u;
        v45 = 0u;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      v44 = 0u;
      v45 = 0u;
    }
    swift_bridgeObjectRelease();
    if (!*((_QWORD *)&v45 + 1))
      goto LABEL_42;
    if ((swift_dynamicCast() & 1) != 0)
      break;
LABEL_15:
    v26 += 32;
    if (!--v25)
      goto LABEL_45;
  }
  if (*(_QWORD *)(v43 + 16))
  {
    swift_bridgeObjectRetain();
    v37 = sub_1BA31A888(v39, v40);
    if ((v38 & 1) != 0)
    {
      sub_1BA31AA58(*(_QWORD *)(v43 + 56) + 32 * v37, (uint64_t)&v44);
    }
    else
    {
      v44 = 0u;
      v45 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v44 = 0u;
    v45 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v45 + 1))
  {
LABEL_42:
    sub_1BA319F10((uint64_t)&v44);
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (uint64_t)sub_1BA32B974(&v44, a6);
}

uint64_t sub_1BA414C74()
{
  void *v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v1 = objc_msgSend(v0, sel_rawValues);
  sub_1BA36E548();
  v2 = sub_1BA437BD0();

  if (*(_QWORD *)(v2 + 16) && (v3 = sub_1BA31A888(0x7475626972747461, 0xEA00000000007365), (v4 & 1) != 0))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v3);
    swift_unknownObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v9 = v5;
    sub_1BA414DF0();
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*(_QWORD *)(v11 + 16) && (v6 = sub_1BA31A888(0x73726566666FLL, 0xE600000000000000), (v7 & 1) != 0))
      {
        sub_1BA31AA58(*(_QWORD *)(v11 + 56) + 32 * v6, (uint64_t)&v9);
      }
      else
      {
        v9 = 0u;
        v10 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v10 + 1))
      {
        sub_1BA414E58();
        if (swift_dynamicCast())
          return v11;
      }
      else
      {
        sub_1BA319F10((uint64_t)&v9);
      }
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return MEMORY[0x1E0DEE9D8];
}

void sub_1BA414DF0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5BCBB0)
  {
    v0 = sub_1BA437BE8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5BCBB0);
  }
}

void sub_1BA414E58()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5C1C80)
  {
    sub_1BA414DF0();
    v0 = sub_1BA437E34();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5C1C80);
  }
}

uint64_t InvalidEmailAddressAlert.title.getter()
{
  return 0;
}

uint64_t InvalidEmailAddressAlert.message.getter()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for Localized();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_1BA435E00();

  return v2;
}

uint64_t InvalidEmailAddressAlert.preferredActionButton.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x1E0DB9128];
  v3 = sub_1BA436FC4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t InvalidEmailAddressAlert.acceptButton.getter()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for Localized();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_1BA435E00();

  return v2;
}

uint64_t InvalidEmailAddressAlert.rejectButton.getter()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for Localized();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_1BA435E00();

  return v2;
}

uint64_t sub_1BA415140()
{
  return 0;
}

uint64_t sub_1BA41514C()
{
  return InvalidEmailAddressAlert.message.getter();
}

uint64_t sub_1BA415160()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for Localized();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_1BA435E00();

  return v2;
}

uint64_t sub_1BA415224()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for Localized();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_1BA435E00();

  return v2;
}

ValueMetadata *type metadata accessor for InvalidEmailAddressAlert()
{
  return &type metadata for InvalidEmailAddressAlert;
}

uint64_t AppleIDAuthenticationErrorAlert.title.getter()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for Localized();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_1BA435E00();

  return v2;
}

uint64_t AppleIDAuthenticationErrorAlert.message.getter()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for Localized();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1BA435E00();

  v2 = sub_1BA437C54();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t AppleIDAuthenticationErrorAlert.preferredActionButton.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x1E0DB9128];
  v3 = sub_1BA436FC4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t AppleIDAuthenticationErrorAlert.acceptButton.getter()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for Localized();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_1BA435E00();

  return v2;
}

uint64_t AppleIDAuthenticationErrorAlert.rejectButton.getter()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for Localized();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_1BA435E00();

  return v2;
}

uint64_t sub_1BA415664()
{
  return AppleIDAuthenticationErrorAlert.title.getter();
}

uint64_t sub_1BA415678()
{
  return AppleIDAuthenticationErrorAlert.message.getter();
}

uint64_t sub_1BA41568C()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for Localized();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_1BA435E00();

  return v2;
}

uint64_t sub_1BA415750()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for Localized();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_1BA435E00();

  return v2;
}

ValueMetadata *type metadata accessor for AppleIDAuthenticationErrorAlert()
{
  return &type metadata for AppleIDAuthenticationErrorAlert;
}

uint64_t ArticlePurchaseOffer.purchaseID.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ArticlePurchaseOffer.purchaseType.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

_QWORD *sub_1BA415854(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ArticlePurchaseOffer(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

_QWORD *assignWithTake for ArticlePurchaseOffer(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

ValueMetadata *type metadata accessor for ArticlePurchaseOffer()
{
  return &type metadata for ArticlePurchaseOffer;
}

uint64_t dispatch thunk of ArticlePurchaseOffersProviderType.purchaseOffers(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

unint64_t *sub_1BA415930(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  unint64_t *v16;
  uint64_t v18;
  uint64_t ObjectType;
  uint64_t (*v20)(_QWORD *, uint64_t, uint64_t);
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(_QWORD *__return_ptr, char *, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  char v34;
  int EnumCaseMultiPayload;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t *v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t *v47;
  id v48;
  void *v49;
  _QWORD *v50;
  void *v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  id v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  id v70;
  char v71;
  _QWORD v72[4];
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;

  v2 = v1;
  v4 = type metadata accessor for OfferAction();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend(*(id *)(v2 + 16), sel_configuration);
  if (!v9)
  {
    __break(1u);
    goto LABEL_56;
  }
  v10 = v9;
  if ((objc_msgSend(v9, sel_respondsToSelector_, sel_paidBundleConfig) & 1) == 0)
    goto LABEL_10;
  v11 = objc_msgSend(v10, sel_paidBundleConfig);
  swift_unknownObjectRelease();
  v12 = objc_msgSend(a1, sel_headline);
  if (!v12)
  {
LABEL_56:
    __break(1u);
    JUMPOUT(0x1BA4160BCLL);
  }
  v13 = v12;
  if ((objc_msgSend(v12, sel_respondsToSelector_, sel_role) & 1) == 0)
  {

LABEL_10:
    swift_unknownObjectRelease();
    return 0;
  }
  v14 = objc_msgSend(v13, sel_role);
  swift_unknownObjectRelease();
  if (v14 == (id)2)
  {
    v15 = 3;
  }
  else
  {
    if (v14 != (id)3)
    {
LABEL_23:

      return 0;
    }
    v15 = 2;
  }
  v18 = *(_QWORD *)(v2 + 32);
  ObjectType = swift_getObjectType();
  LOBYTE(v72[0]) = 6;
  v20 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v18 + 24);
  swift_unknownObjectRetain();
  LOBYTE(v18) = v20(v72, ObjectType, v18);
  swift_unknownObjectRelease();
  if ((v18 & 1) != 0)
    v21 = objc_msgSend(v11, sel_servicesBundleSubscriptionButtonConfigurationsByType);
  else
    v21 = objc_msgSend(v11, sel_subscriptionButtonConfigurationsByType);
  v16 = (unint64_t *)v21;
  if (!v16)
  {

    return v16;
  }
  sub_1BA2F299C(0, (unint64_t *)&qword_1ED5BE710);
  sub_1BA2F299C(0, &qword_1ED5BBF98);
  sub_1BA36C000();
  v22 = sub_1BA437BD0();

  v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithUnsignedInteger_, v15);
  v24 = sub_1BA372D40(v23, v22);

  swift_bridgeObjectRelease();
  if (!v24)
    goto LABEL_23;
  v25 = objc_msgSend(v24, sel_targetType);
  v70 = v24;
  switch((unint64_t)v25)
  {
    case 0uLL:
      sub_1BA437F18();
      sub_1BA2F299C(0, (unint64_t *)&qword_1ED5BE730);
      v37 = (void *)sub_1BA438080();
      sub_1BA436AA8();

      return 0;
    case 1uLL:
    case 3uLL:
      v26 = *(_QWORD *)(v2 + 32);
      v27 = swift_getObjectType();
      v71 = 6;
      v28 = *(void (**)(_QWORD *__return_ptr, char *, uint64_t, uint64_t))(v26 + 32);
      swift_unknownObjectRetain();
      v28(v72, &v71, v27, v26);
      swift_unknownObjectRelease();
      v29 = v73;
      if (!v73)
      {
        v48 = objc_msgSend(v11, sel_offeredBundlePurchaseIDs);
        if (v48)
        {
          v49 = v48;
          v50 = (_QWORD *)sub_1BA437DE0();

          if (v50[2])
          {
            v51 = v11;
            v52 = v50[4];
            v53 = v50[5];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            sub_1BA41624C();
            v16 = (unint64_t *)swift_allocObject();
            *((_OWORD *)v16 + 1) = xmmword_1BA43A710;
            v16[4] = v52;
            v16[5] = v53;
            v16[6] = 1;

            return v16;
          }

          swift_bridgeObjectRelease();
        }
        else
        {

        }
        return 0;
      }
      v64 = v72[1];
      v65 = v72[0];
      v62 = v72[3];
      v63 = v72[2];
      v67 = v75;
      v68 = v74;
      v66 = v76;
      v61 = v77;
      v60 = v78;
      v30 = *(_QWORD *)(v73 + 16);
      if (!v30)
      {

        goto LABEL_47;
      }
      v31 = v73 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
      v32 = *(_QWORD *)(v5 + 72);
      v59 = v73;
      swift_bridgeObjectRetain();
      v69 = v11;
      break;
    case 2uLL:
      v16 = (unint64_t *)objc_msgSend(v11, sel_offeredBundlePurchaseIDs);
      if (v16)
      {
        v38 = sub_1BA437DE0();

        v39 = sub_1BA4160CC(v2);
        v40 = *(_QWORD *)(v38 + 16);
        if (v40)
        {
          v41 = v39;
          swift_bridgeObjectRetain();
          v68 = v38;
          v42 = (unint64_t *)(v38 + 40);
          v16 = (unint64_t *)MEMORY[0x1E0DEE9D8];
          do
          {
            v44 = *(v42 - 1);
            v43 = *v42;
            swift_bridgeObjectRetain();
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v16 = sub_1BA31A750(0, v16[2] + 1, 1, v16);
            v46 = v16[2];
            v45 = v16[3];
            if (v46 >= v45 >> 1)
              v16 = sub_1BA31A750((_QWORD *)(v45 > 1), v46 + 1, 1, v16);
            v42 += 2;
            v16[2] = v46 + 1;
            v47 = &v16[3 * v46];
            v47[4] = v44;
            v47[5] = v43;
            v47[6] = v41;
            --v40;
          }
          while (v40);

          swift_bridgeObjectRelease_n();
        }
        else
        {
          swift_bridgeObjectRelease();

          return (unint64_t *)MEMORY[0x1E0DEE9D8];
        }
      }
      else
      {

      }
      return v16;
    default:

      return 0;
  }
  while (1)
  {
    sub_1BA329C1C(v31, (uint64_t)v8);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload)
    {
      if (EnumCaseMultiPayload == 1)
      {
        sub_1BA320D68();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v36 = sub_1BA435EFC();
        (*(void (**)(char *, uint64_t))(*(_QWORD *)(v36 - 8) + 8))(v8, v36);
      }
      goto LABEL_26;
    }
    v33 = (void *)*((_QWORD *)v8 + 2);
    v34 = v8[90];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v34 & 1) != 0)
      break;

    v11 = v69;
    v24 = v70;
LABEL_26:
    v31 += v32;
    if (!--v30)
    {

      v29 = v59;
      swift_bridgeObjectRelease();
LABEL_47:
      sub_1BA320CD0(v65, v64, v63, v62, v29, v68, v67, v66, v61, v60);
      return 0;
    }
  }
  v54 = v59;
  swift_bridgeObjectRelease();
  v55 = AMSBuyParams.purchaseID.getter();
  v57 = v56;

  v58 = v70;
  if (!v57)
  {

    v29 = v54;
    goto LABEL_47;
  }
  sub_1BA41624C();
  v16 = (unint64_t *)swift_allocObject();
  *((_OWORD *)v16 + 1) = xmmword_1BA43A710;
  v16[4] = v55;
  v16[5] = v57;
  v16[6] = 2;
  sub_1BA320CD0(v65, v64, v63, v62, v54, v68, v67, v66, v61, v60);

  return v16;
}

uint64_t sub_1BA4160CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t ObjectType;
  void (*v3)(uint64_t *__return_ptr, char *, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  Swift::Bool v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;

  v1 = *(_QWORD *)(a1 + 32);
  ObjectType = swift_getObjectType();
  v17 = 4;
  v3 = *(void (**)(uint64_t *__return_ptr, char *, uint64_t, uint64_t))(v1 + 40);
  swift_unknownObjectRetain();
  v3(&v18, &v17, ObjectType, v1);
  swift_unknownObjectRelease();
  v4 = v22;
  if (v22)
  {
    v5 = v18;
    v6 = v19;
    v7 = v20;
    v8 = v21;
    v9 = v23;
    v10 = v25;
    v11 = v26;
    v12 = v27;
    if ((v23 & 1) != 0)
    {
      sub_1BA320CD0(v18, v19, v20, v21, v22, v23, v24, v25, v26, v27);
    }
    else
    {
      v16 = v24;
      swift_bridgeObjectRetain();
      v13 = v12;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v15 = AMSMarketingItem.isBundleHardwareOffer()();
      sub_1BA320CD0(v5, v6, v7, v8, v4, v9, v16, v10, v11, v12);
      sub_1BA320CD0(v5, v6, v7, v8, v4, v9, v16, v10, v11, v12);
      if (v15)
        return 4;
    }
  }
  return 1;
}

unint64_t *sub_1BA41622C(void *a1)
{
  return sub_1BA415930(a1);
}

void sub_1BA41624C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5BBFC0)
  {
    v0 = sub_1BA4383B0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5BBFC0);
  }
}

id sub_1BA4162A0()
{
  _QWORD *v0;
  id v1;
  uint64_t inited;
  void **v3;
  void *v4;
  void *v5;
  double v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(_QWORD *__return_ptr, uint64_t, uint64_t);
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v29[6];

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC1288]), sel_init);
  objc_msgSend(v1, sel_setAlignment_, 1);
  objc_msgSend(v1, sel_setLineBreakMode_, 0);
  objc_msgSend(v1, sel_setMaximumLineHeight_, 19.0);
  objc_msgSend(v1, sel_setMinimumLineHeight_, 19.0);
  sub_1BA328BE8();
  inited = swift_initStackObject();
  v3 = (void **)MEMORY[0x1E0DC1138];
  *(_OWORD *)(inited + 16) = xmmword_1BA43CE80;
  v4 = *v3;
  *(_QWORD *)(inited + 32) = *v3;
  v5 = (void *)objc_opt_self();
  v6 = *MEMORY[0x1E0DC1440];
  swift_bridgeObjectRetain();
  v7 = v4;
  v8 = objc_msgSend(v5, sel_systemFontOfSize_weight_, 15.0, v6);
  v9 = sub_1BA2F299C(0, (unint64_t *)&unk_1ED5C0280);
  *(_QWORD *)(inited + 40) = v8;
  v10 = (void *)*MEMORY[0x1E0DC1178];
  *(_QWORD *)(inited + 64) = v9;
  *(_QWORD *)(inited + 72) = v10;
  v11 = sub_1BA2F299C(0, (unint64_t *)&unk_1ED5C0260);
  *(_QWORD *)(inited + 80) = v1;
  v12 = (void *)*MEMORY[0x1E0DC1140];
  *(_QWORD *)(inited + 104) = v11;
  *(_QWORD *)(inited + 112) = v12;
  v13 = v0[5];
  v14 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v13);
  v15 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v14 + 24);
  v16 = v10;
  v17 = v1;
  v18 = v12;
  v15(v29, v13, v14);
  v19 = (void *)v29[0];
  v20 = v29[1];
  v21 = (void *)v29[2];
  v22 = (void *)v29[3];
  v23 = (void *)v29[4];

  *(_QWORD *)(inited + 144) = sub_1BA2F299C(0, &qword_1ED5C0290);
  *(_QWORD *)(inited + 120) = v20;
  sub_1BA392D48(inited);
  v24 = objc_allocWithZone(MEMORY[0x1E0CB3498]);
  v25 = (void *)sub_1BA437C18();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_1BA328CA4();
  v26 = (void *)sub_1BA437BC4();
  swift_bridgeObjectRelease();
  v27 = objc_msgSend(v24, sel_initWithString_attributes_, v25, v26);

  return v27;
}

void sub_1BA41653C(void *a1)
{
  _QWORD *v1;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[6];

  v3 = objc_msgSend(a1, sel_titleLabel);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_setTextAlignment_, 1);

  }
  v5 = objc_msgSend(a1, sel_titleLabel);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setNumberOfLines_, 2);

  }
  v7 = objc_msgSend(a1, sel_titleLabel);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, sel_setAdjustsFontSizeToFitWidth_, 1);

  }
  v9 = objc_msgSend(a1, sel_titleLabel);
  if (v9)
  {
    v10 = v9;
    objc_msgSend((id)objc_opt_self(), sel_labelFontSize);
    objc_msgSend(v10, sel_setMinimumScaleFactor_, 10.0 / v11);

  }
  v12 = v1[5];
  v13 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v12);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v13 + 24))(v19, v12, v13);
  v14 = (void *)v19[0];
  v15 = (void *)v19[1];
  v16 = (void *)v19[2];
  v18 = (id)v19[3];
  v17 = (void *)v19[4];

  objc_msgSend(a1, sel_setBackgroundColor_, v18);
}

id sub_1BA4166B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t inited;
  void **v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void **__return_ptr, uint64_t, uint64_t);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(void **__return_ptr, uint64_t, uint64_t);
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  uint64_t v50;
  void **v51;
  void *v52;
  void *v53;
  double v54;
  id v55;
  id v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(void **__return_ptr, uint64_t, uint64_t);
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  id v70;
  id v72;
  uint64_t v73;
  _QWORD *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  id v82;

  v5 = v4;
  if (a4)
  {
    sub_1BA328BE8();
    inited = swift_initStackObject();
    v7 = (void **)MEMORY[0x1E0DC1140];
    *(_OWORD *)(inited + 16) = xmmword_1BA43A7B0;
    v8 = *v7;
    *(_QWORD *)(inited + 32) = *v7;
    v74 = v4 + 2;
    v9 = v4[5];
    v10 = v4[6];
    __swift_project_boxed_opaque_existential_1(v4 + 2, v9);
    v11 = *(void (**)(void **__return_ptr, uint64_t, uint64_t))(v10 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v72 = v8;
    v11(&v75, v9, v10);
    v12 = v75;
    v13 = v76;
    v14 = v77;
    v15 = v78;
    v16 = v79;
    v17 = v80;
    v18 = v81;

    v73 = sub_1BA2F299C(0, &qword_1ED5C0290);
    *(_QWORD *)(inited + 40) = v18;
    v19 = (void *)*MEMORY[0x1E0DC1138];
    *(_QWORD *)(inited + 64) = v73;
    *(_QWORD *)(inited + 72) = v19;
    v20 = (void *)objc_opt_self();
    v21 = *MEMORY[0x1E0DC1420];
    v22 = v19;
    v23 = objc_msgSend(v20, sel_systemFontOfSize_weight_, 13.0, v21);
    v24 = sub_1BA2F299C(0, (unint64_t *)&unk_1ED5C0280);
    *(_QWORD *)(inited + 104) = v24;
    *(_QWORD *)(inited + 80) = v23;
    sub_1BA392D48(inited);
    v25 = objc_allocWithZone(MEMORY[0x1E0CB3498]);
    v26 = (void *)sub_1BA437C18();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_1BA328CA4();
    v27 = (void *)sub_1BA437BC4();
    swift_bridgeObjectRelease();
    v28 = objc_msgSend(v25, sel_initWithString_attributes_, v26, v27);

    v29 = swift_initStackObject();
    *(_OWORD *)(v29 + 16) = xmmword_1BA43A7B0;
    *(_QWORD *)(v29 + 32) = v22;
    v30 = v22;
    *(_QWORD *)(v29 + 40) = objc_msgSend(v20, sel_systemFontOfSize_, 11.0);
    *(_QWORD *)(v29 + 64) = v24;
    *(_QWORD *)(v29 + 72) = v72;
    v32 = v5[5];
    v31 = v5[6];
    __swift_project_boxed_opaque_existential_1(v74, v32);
    v33 = *(void (**)(void **__return_ptr, uint64_t, uint64_t))(v31 + 16);
    v34 = v72;
    v33(&v75, v32, v31);
    v35 = v75;
    v36 = v76;
    v37 = v77;
    v38 = v78;
    v39 = v79;
    v40 = v80;
    v41 = v81;

    *(_QWORD *)(v29 + 104) = v73;
    *(_QWORD *)(v29 + 80) = v41;
    sub_1BA392D48(v29);
    v42 = objc_allocWithZone(MEMORY[0x1E0CB3498]);
    v43 = (void *)sub_1BA437C18();
    swift_bridgeObjectRelease();
    v44 = (void *)sub_1BA437BC4();
    swift_bridgeObjectRelease();
    v45 = objc_msgSend(v42, sel_initWithString_attributes_, v43, v44);

    v46 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3778]), sel_initWithAttributedString_, v28);
    v47 = objc_allocWithZone(MEMORY[0x1E0CB3498]);
    v48 = (void *)sub_1BA437C18();
    v49 = objc_msgSend(v47, sel_initWithString_, v48);

    objc_msgSend(v46, sel_appendAttributedString_, v49);
    objc_msgSend(v46, sel_appendAttributedString_, v45);
  }
  else
  {
    sub_1BA328BE8();
    v50 = swift_initStackObject();
    v51 = (void **)MEMORY[0x1E0DC1138];
    *(_OWORD *)(v50 + 16) = xmmword_1BA43A7B0;
    v52 = *v51;
    *(_QWORD *)(v50 + 32) = *v51;
    v53 = (void *)objc_opt_self();
    v54 = *MEMORY[0x1E0DC1420];
    swift_bridgeObjectRetain();
    v55 = v52;
    v56 = objc_msgSend(v53, sel_systemFontOfSize_weight_, 13.0, v54);
    v57 = sub_1BA2F299C(0, (unint64_t *)&unk_1ED5C0280);
    *(_QWORD *)(v50 + 40) = v56;
    v58 = (void *)*MEMORY[0x1E0DC1140];
    *(_QWORD *)(v50 + 64) = v57;
    *(_QWORD *)(v50 + 72) = v58;
    v60 = v4[5];
    v59 = v4[6];
    __swift_project_boxed_opaque_existential_1(v4 + 2, v60);
    v61 = *(void (**)(void **__return_ptr, uint64_t, uint64_t))(v59 + 16);
    v62 = v58;
    v61(&v75, v60, v59);
    v63 = v75;
    v64 = v76;
    v65 = v77;
    v66 = v78;
    v67 = v79;
    v68 = v80;
    v69 = v81;

    *(_QWORD *)(v50 + 104) = sub_1BA2F299C(0, &qword_1ED5C0290);
    *(_QWORD *)(v50 + 80) = v69;
    sub_1BA392D48(v50);
    v70 = objc_allocWithZone(MEMORY[0x1E0CB3498]);
    v45 = (id)sub_1BA437C18();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_1BA328CA4();
    v28 = (id)sub_1BA437BC4();
    swift_bridgeObjectRelease();
    v46 = objc_msgSend(v70, sel_initWithString_attributes_, v45, v28);
  }

  return v46;
}

uint64_t sub_1BA416C54()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SubscriptionOffersStyler()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for BundlePaywallTopOffsetConfiguration()
{
  return &type metadata for BundlePaywallTopOffsetConfiguration;
}

uint64_t Assembly.assemblies.getter()
{
  return swift_bridgeObjectRetain();
}

id Assembly.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id Assembly.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BA416D1C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  _BYTE v19[224];
  _QWORD v20[9];
  char v21;
  _OWORD v22[8];
  char v23;
  _OWORD v24[14];

  sub_1BA3674D4();
  sub_1BA437018();
  sub_1BA3676A8((uint64_t)v19, (uint64_t)&v23);
  sub_1BA3DD8A0();
  sub_1BA436DE4();
  sub_1BA3676A8((uint64_t)&v23, (uint64_t)v24);
  v20[0] = v9;
  v20[1] = v10;
  v20[2] = v11;
  v20[3] = v12;
  v20[4] = v13;
  v20[5] = v14;
  v20[6] = v15;
  v20[7] = v16;
  v20[8] = v17;
  v21 = v18;
  sub_1BA417580(0, &qword_1EF28F4E0, (uint64_t (*)(uint64_t))type metadata accessor for HideMyEmailSignupBlueprintHeaderView, &qword_1EF28C148, (uint64_t)&unk_1BA43C6D0);
  v3 = sub_1BA437EC4();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v8 + OBJC_IVAR____TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider_headerRenderer), *(_QWORD *)(v8+ OBJC_IVAR____TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider_headerRenderer+ 24));
  v4 = (char *)sub_1BA436C10();
  v22[4] = v24[4];
  v22[5] = v24[5];
  v22[6] = v24[6];
  v22[7] = v24[7];
  v22[0] = v24[0];
  v22[1] = v24[1];
  v22[2] = v24[2];
  v22[3] = v24[3];
  v5 = objc_msgSend(a3, sel_traitCollection);
  sub_1BA4335A8((int)v20, v4, (double *)v22);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_1BA416F00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  void *v16;
  char *v17;
  char *v18;
  id v19;
  void *v20;
  id v21;
  char *v22;
  id v23;
  void *v24;
  _QWORD v26[2];
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  _QWORD v44[9];
  char v45;
  _OWORD v46[6];
  _BYTE v47[224];
  _OWORD v48[14];

  v26[1] = a3;
  v3 = sub_1BA436D3C();
  v31 = *(_QWORD *)(v3 - 8);
  v32 = v3;
  MEMORY[0x1E0C80A78](v3, v4);
  v30 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA3674D4();
  sub_1BA437018();
  sub_1BA3676A8((uint64_t)&v43, (uint64_t)v47);
  sub_1BA3DD8A0();
  sub_1BA436DE4();
  v6 = v33;
  v7 = v34;
  v9 = v35;
  v8 = v36;
  v28 = v36;
  v29 = v34;
  v11 = v37;
  v10 = v38;
  v12 = v40;
  v26[0] = v39;
  v13 = v41;
  v14 = v42;
  sub_1BA3676A8((uint64_t)v47, (uint64_t)v48);
  v44[0] = v6;
  v44[1] = v7;
  v44[2] = v9;
  v44[3] = v8;
  v44[4] = v11;
  v44[5] = v10;
  v44[6] = v26[0];
  v44[7] = v12;
  v44[8] = v13;
  v45 = v14;
  sub_1BA417580(0, &qword_1EF28F4D0, (uint64_t (*)(uint64_t))type metadata accessor for HideMyEmailSignupBlueprintFooterView, &qword_1EF28F4D8, (uint64_t)&unk_1BA448070);
  v15 = sub_1BA437EC4();
  v16 = v27;
  __swift_project_boxed_opaque_existential_1(&v27[OBJC_IVAR____TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider_footerRenderer], *(_QWORD *)&v27[OBJC_IVAR____TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider_footerRenderer+ 24]);
  v17 = (char *)sub_1BA436C10();
  v46[0] = v48[8];
  v46[1] = v48[9];
  v46[2] = v48[10];
  v46[3] = v48[11];
  v46[4] = v48[12];
  v46[5] = v48[13];
  sub_1BA3941A0((uint64_t)v44, v17, (double *)v46);

  v18 = (char *)sub_1BA436C10();
  v19 = *(id *)&v18[OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintFooterView_button];

  v20 = (void *)sub_1BA436C7C();
  *(_QWORD *)(swift_allocObject() + 16) = v16;
  v21 = v16;

  swift_release();
  v22 = (char *)sub_1BA436C10();
  v23 = *(id *)&v22[OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintFooterView_privacyLabel];

  objc_msgSend(v23, sel_setDelegate_, v21);
  v24 = (void *)sub_1BA436C1C();
  (*(void (**)(char *, _QWORD, uint64_t))(v31 + 104))(v30, *MEMORY[0x1E0DB7218], v32);
  sub_1BA436D48();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v15;
}

uint64_t sub_1BA4171E8(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;
  uint64_t ObjectType;

  result = MEMORY[0x1BCCDC4E4](a1 + OBJC_IVAR____TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider_delegate);
  if (result)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(result
                               + OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_eventHandler)
                   + 40);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v2 + 72))(ObjectType, v2);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for HideMyEmailSignupBlueprintViewHeaderFooterProvider()
{
  return objc_opt_self();
}

uint64_t sub_1BA4172EC()
{
  sub_1BA417580(0, &qword_1EF28F4E0, (uint64_t (*)(uint64_t))type metadata accessor for HideMyEmailSignupBlueprintHeaderView, &qword_1EF28C148, (uint64_t)&unk_1BA43C6D0);
  sub_1BA437EDC();
  sub_1BA417580(0, &qword_1EF28F4D0, (uint64_t (*)(uint64_t))type metadata accessor for HideMyEmailSignupBlueprintFooterView, &qword_1EF28F4D8, (uint64_t)&unk_1BA448070);
  return sub_1BA437EDC();
}

uint64_t sub_1BA417378(uint64_t a1, uint64_t a2, void **a3)
{
  return sub_1BA416D1C(a1, a2, *a3);
}

uint64_t sub_1BA41739C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_1BA416F00(a1, a2, *a3);
}

uint64_t sub_1BA417554()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1BA417578()
{
  uint64_t v0;

  return sub_1BA4171E8(*(_QWORD *)(v0 + 16));
}

void sub_1BA417580(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), unint64_t *a4, uint64_t a5)
{
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    a3(255);
    sub_1BA2F25C8(a4, a3, a5);
    v9 = sub_1BA436C28();
    if (!v10)
      atomic_store(v9, a2);
  }
}

unint64_t sub_1BA417600()
{
  unint64_t result;

  result = qword_1ED5BED50;
  if (!qword_1ED5BED50)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED5BED50);
  }
  return result;
}

NewsSubscription::PaywallContentType_optional __swiftcall PaywallContentType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  NewsSubscription::PaywallContentType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1BA4382C0();
  result.value = swift_bridgeObjectRelease();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t PaywallContentType.rawValue.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6F69647561;
  if (*v0 != 1)
    v1 = 0x657061707377656ELL;
  if (*v0)
    return v1;
  else
    return 0x746C7561666564;
}

uint64_t sub_1BA417708(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1BA319298(*a1, *a2);
}

uint64_t sub_1BA417714()
{
  sub_1BA43844C();
  sub_1BA437CB4();
  swift_bridgeObjectRelease();
  return sub_1BA438470();
}

uint64_t sub_1BA4177B4()
{
  sub_1BA437CB4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BA417830()
{
  sub_1BA43844C();
  sub_1BA437CB4();
  swift_bridgeObjectRelease();
  return sub_1BA438470();
}

NewsSubscription::PaywallContentType_optional sub_1BA4178CC(Swift::String *a1)
{
  return PaywallContentType.init(rawValue:)(*a1);
}

void sub_1BA4178D8(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE700000000000000;
  v4 = 0xE500000000000000;
  v5 = 0x6F69647561;
  if (v2 != 1)
  {
    v5 = 0x657061707377656ELL;
    v4 = 0xE900000000000072;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x746C7561666564;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_1BA417938()
{
  sub_1BA417B9C();
  return sub_1BA437DA4();
}

uint64_t sub_1BA417994()
{
  sub_1BA417B9C();
  return sub_1BA437D8C();
}

uint64_t PaywallContentType.description.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6F69647541;
  if (*v0 != 1)
    v1 = 0x657061707377654ELL;
  if (*v0)
    return v1;
  else
    return 0x746C7561666544;
}

unint64_t sub_1BA417A40()
{
  unint64_t result;

  result = qword_1EF28F4E8;
  if (!qword_1EF28F4E8)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for PaywallContentType, &type metadata for PaywallContentType);
    atomic_store(result, (unint64_t *)&qword_1EF28F4E8);
  }
  return result;
}

uint64_t sub_1BA417A84()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6F69647541;
  if (*v0 != 1)
    v1 = 0x657061707377654ELL;
  if (*v0)
    return v1;
  else
    return 0x746C7561666544;
}

uint64_t storeEnumTagSinglePayload for PaywallContentType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_1BA417B2C + 4 * byte_1BA4473B5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1BA417B60 + 4 * byte_1BA4473B0[v4]))();
}

uint64_t sub_1BA417B60(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA417B68(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA417B70);
  return result;
}

uint64_t sub_1BA417B7C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA417B84);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1BA417B88(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA417B90(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

unint64_t sub_1BA417B9C()
{
  unint64_t result;

  result = qword_1ED5BBB78;
  if (!qword_1ED5BBB78)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for PaywallContentType, &type metadata for PaywallContentType);
    atomic_store(result, (unint64_t *)&qword_1ED5BBB78);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ArticleAccess(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
  {
    v6 = *a1;
    v7 = v6 >= 2;
    v8 = (v6 + 2147483646) & 0x7FFFFFFF;
    if (!v7)
      v8 = -1;
    if (v8 + 1 >= 2)
      return v8;
    else
      return 0;
  }
  else
  {
    v2 = a2 + 2;
    if (a2 + 2 >= 0xFFFF00)
      v3 = 4;
    else
      v3 = 2;
    if (v2 >> 8 < 0xFF)
      v3 = 1;
    if (v2 >= 0x100)
      v4 = v3;
    else
      v4 = 0;
    return ((uint64_t (*)(void))((char *)&loc_1BA417C30 + 4 * byte_1BA447500[v4]))();
  }
}

uint64_t storeEnumTagSinglePayload for ArticleAccess(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 2;
  if (a3 + 2 >= 0xFFFF00)
    v4 = 4;
  else
    v4 = 2;
  if (v3 >> 8 < 0xFF)
    v4 = 1;
  if (v3 >= 0x100)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xFE)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_1BA417CE8 + 4 * byte_1BA44750A[v5]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1BA417D1C + 4 * byte_1BA447505[v5]))();
}

uint64_t sub_1BA417D1C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA417D24(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA417D2CLL);
  return result;
}

uint64_t sub_1BA417D38(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA417D40);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1BA417D44(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA417D4C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA417D58(unsigned __int8 *a1)
{
  unsigned int v1;
  BOOL v2;
  int v3;

  v1 = *a1;
  v2 = v1 >= 2;
  v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2)
    return (v3 + 1);
  else
    return 0;
}

_BYTE *sub_1BA417D74(_BYTE *result, int a2)
{
  if (a2)
    *result = a2 + 1;
  return result;
}

uint64_t PaidBundleViaOfferSettings.allowPaywalls.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowPaywalls);
}

uint64_t PaidBundleViaOfferSettings.allowSubscriptionsDeeplink.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowSubscriptionsDeeplink);
}

uint64_t PaidBundleViaOfferSettings.allowMastheadBanner.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowMastheadBanner);
}

uint64_t PaidBundleViaOfferSettings.allowIconBadge.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowIconBadge);
}

uint64_t PaidBundleViaOfferSettings.allowIconBadgeMercury.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowIconBadgeMercury);
}

uint64_t PaidBundleViaOfferSettings.allowLocalNotification.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowLocalNotification);
}

uint64_t PaidBundleViaOfferSettings.allowAppLaunchUpsell.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowAppLaunchUpsell);
}

id PaidBundleViaOfferSettings.__allocating_init(allowPaywalls:allowSubscriptionsDeeplink:allowMastheadBanner:allowIconBadge:allowIconBadgeMercury:allowLocalNotification:allowUpsell:allowAppLaunchUpsell:)(char a1, char a2, char a3, char a4, char a5, char a6, char a7, char a8)
{
  objc_class *v8;
  _BYTE *v17;
  objc_super v19;

  v17 = objc_allocWithZone(v8);
  v17[OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowPaywalls] = a1;
  v17[OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowSubscriptionsDeeplink] = a2;
  v17[OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowMastheadBanner] = a3;
  v17[OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowIconBadge] = a4;
  v17[OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowIconBadgeMercury] = a5;
  v17[OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowLocalNotification] = a6;
  v17[OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowUpsell] = a7;
  v17[OBJC_IVAR____TtC16NewsSubscription26PaidBundleViaOfferSettings_allowAppLaunchUpsell] = a8;
  v19.receiver = v17;
  v19.super_class = v8;
  return objc_msgSendSuper2(&v19, sel_init);
}

id PaidBundleViaOfferSettings.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void PaidBundleViaOfferSettings.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PaidBundleViaOfferSettings.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for PaidBundleViaOfferSettings()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PaidBundleViaOfferSettings.__allocating_init(allowPaywalls:allowSubscriptionsDeeplink:allowMastheadBanner:allowIconBadge:allowIconBadgeMercury:allowLocalNotification:allowUpsell:allowAppLaunchUpsell:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t sub_1BA417F98()
{
  uint64_t v0;

  sub_1BA3110FC(v0 + 16);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  __swift_destroy_boxed_opaque_existential_1(v0 + 88);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HideMyEmailSignupEventHandler()
{
  return objc_opt_self();
}

uint64_t AppLaunchMethod.IndirectMethod.hash(into:)()
{
  return sub_1BA438458();
}

BOOL static AppLaunchMethod.IndirectMethod.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AppLaunchMethod.IndirectMethod.hashValue.getter()
{
  sub_1BA43844C();
  sub_1BA438458();
  return sub_1BA438470();
}

BOOL static AppLaunchMethod.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2;
  int v3;

  v2 = *a1;
  v3 = *a2;
  if (v2 == 3)
    return v3 == 3;
  if (v3 == 3)
    return 0;
  return v2 == v3;
}

BOOL sub_1BA4180B0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2;
  int v3;

  v2 = *a1;
  v3 = *a2;
  if (v2 == 3)
    return v3 == 3;
  if (v3 == 3)
    return 0;
  return v2 == v3;
}

BOOL AppLaunchMethod.isWidget.getter()
{
  unsigned __int8 *v0;

  return *v0 == 1;
}

BOOL AppLaunchMethod.isNotification.getter()
{
  _BYTE *v0;

  return *v0 == 0;
}

uint64_t AppLaunchMethodChecker.appActivationURLHandler.getter()
{
  return swift_retain();
}

uint64_t AppLaunchMethodChecker.launchMethod.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *a1 = *(_BYTE *)(v1 + 24);
  return result;
}

uint64_t AppLaunchMethodChecker.__allocating_init(appActivationURLHandler:notificationLaunchStatusProvider:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  AppLaunchMethodChecker.init(appActivationURLHandler:notificationLaunchStatusProvider:)(a1, a2, a3);
  return v6;
}

uint64_t sub_1BA4181A8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1BA4181CC()
{
  uint64_t result;
  uint64_t v1;
  _BYTE *v2;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = result;
    v2 = (_BYTE *)(result + 24);
    swift_beginAccess();
    if (*(_BYTE *)(v1 + 24) == 3)
      *v2 = 2;
    return swift_release();
  }
  return result;
}

uint64_t sub_1BA418248()
{
  return sub_1BA4181CC();
}

uint64_t sub_1BA418250(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;
  uint64_t ObjectType;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v7 = result;
    sub_1BA30A140(a1, (uint64_t)&v14, (uint64_t)&unk_1EF28F5F8, (uint64_t)&unk_1EF28F600, (uint64_t)&protocol descriptor for NotificationActionIdentifierProviding, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))sub_1BA34A4C0);
    if (v15)
    {
      sub_1BA2F3654(&v14, (uint64_t)v16);
      ObjectType = swift_getObjectType();
      v9 = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(ObjectType, a4);
      v10 = v17;
      v11 = v18;
      __swift_project_boxed_opaque_existential_1(v16, v17);
      v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v10, v11);
      LOBYTE(v10) = sub_1BA3329A8(v12, v13, v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v10 & 1) != 0)
      {
        swift_beginAccess();
        *(_BYTE *)(v7 + 24) = 0;
      }
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    }
    else
    {
      swift_release();
      return sub_1BA3067F0((uint64_t)&v14, (uint64_t)&unk_1EF28F5F8, (uint64_t)&unk_1EF28F600, (uint64_t)&protocol descriptor for NotificationActionIdentifierProviding, (uint64_t (*)(_QWORD))sub_1BA34A4C0);
    }
  }
  return result;
}

uint64_t sub_1BA4183B0()
{
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BA4183DC(uint64_t a1)
{
  uint64_t *v1;

  return sub_1BA418250(a1, v1[2], v1[3], v1[4]);
}

uint64_t AppLaunchMethodChecker.deinit()
{
  uint64_t v0;

  swift_release();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t AppLaunchMethodChecker.__deallocating_deinit()
{
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1BA418438()
{
  return swift_retain();
}

uint64_t AppLaunchMethodChecker.patterns.getter()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;

  v0 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8];
  sub_1BA2F3474(0, (unint64_t *)&qword_1ED5C1D00, (uint64_t (*)(uint64_t))MEMORY[0x1E0DB3FF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  sub_1BA4366C4();
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1BA43A710;
  sub_1BA2F3474(0, (unint64_t *)&unk_1ED5BBFA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DB3FB0], v0);
  v2 = sub_1BA4366A0();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1BA43A710;
  v6 = (uint64_t *)(v5 + v4);
  *v6 = sub_1BA437C3C();
  v6[1] = v7;
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x1E0DB3FA0], v2);
  v8 = sub_1BA3937C8(MEMORY[0x1E0DEE9D8]);
  MEMORY[0x1BCCD9FB8](42, 0xE100000000000000, 0, 0, 0, 0, 0, 0, v5, v8);
  return v1;
}

uint64_t AppLaunchMethodChecker.processURL(for:)()
{
  uint64_t v0;
  uint64_t result;

  result = swift_beginAccess();
  if (*(_BYTE *)(v0 + 24) == 3)
    *(_BYTE *)(v0 + 24) = 1;
  return result;
}

uint64_t sub_1BA4185FC()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;

  v0 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8];
  sub_1BA2F3474(0, (unint64_t *)&qword_1ED5C1D00, (uint64_t (*)(uint64_t))MEMORY[0x1E0DB3FF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  sub_1BA4366C4();
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1BA43A710;
  sub_1BA2F3474(0, (unint64_t *)&unk_1ED5BBFA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DB3FB0], v0);
  v2 = sub_1BA4366A0();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1BA43A710;
  v6 = (uint64_t *)(v5 + v4);
  *v6 = sub_1BA437C3C();
  v6[1] = v7;
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x1E0DB3FA0], v2);
  v8 = sub_1BA3937C8(MEMORY[0x1E0DEE9D8]);
  MEMORY[0x1BCCD9FB8](42, 0xE100000000000000, 0, 0, 0, 0, 0, 0, v5, v8);
  return v1;
}

uint64_t sub_1BA418764()
{
  _QWORD *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t result;

  v1 = *v0;
  v2 = (_BYTE *)(*v0 + 24);
  result = swift_beginAccess();
  if (*(_BYTE *)(v1 + 24) == 3)
    *v2 = 1;
  return result;
}

Swift::Void __swiftcall AppLaunchMethodChecker.sceneDidEnterBackground()()
{
  uint64_t v0;

  swift_beginAccess();
  *(_BYTE *)(v0 + 24) = 3;
}

uint64_t sub_1BA4187F4()
{
  uint64_t v0;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v0 + 24) = 3;
  return result;
}

unint64_t sub_1BA41882C()
{
  unint64_t result;

  result = qword_1EF28F5F0;
  if (!qword_1EF28F5F0)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for AppLaunchMethod.IndirectMethod, &type metadata for AppLaunchMethod.IndirectMethod);
    atomic_store(result, (unint64_t *)&qword_1EF28F5F0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AppLaunchMethod(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
  {
    v6 = *a1;
    v7 = v6 >= 3;
    v8 = v6 - 3;
    if (!v7)
      v8 = -1;
    if (v8 + 1 >= 2)
      return v8;
    else
      return 0;
  }
  else
  {
    v2 = a2 + 3;
    if (a2 + 3 >= 0xFFFF00)
      v3 = 4;
    else
      v3 = 2;
    if (v2 >> 8 < 0xFF)
      v3 = 1;
    if (v2 >= 0x100)
      v4 = v3;
    else
      v4 = 0;
    return ((uint64_t (*)(void))((char *)&loc_1BA4188C0 + 4 * byte_1BA447620[v4]))();
  }
}

uint64_t storeEnumTagSinglePayload for AppLaunchMethod(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 3;
  if (a3 + 3 >= 0xFFFF00)
    v4 = 4;
  else
    v4 = 2;
  if (v3 >> 8 < 0xFF)
    v4 = 1;
  if (v3 >= 0x100)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xFD)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_1BA418968 + 4 * byte_1BA44762A[v5]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1BA41899C + 4 * byte_1BA447625[v5]))();
}

uint64_t sub_1BA41899C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA4189A4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA4189ACLL);
  return result;
}

uint64_t sub_1BA4189B8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA4189C0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1BA4189C4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA4189CC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1BA4189D8(_BYTE *result, int a2)
{
  if (a2)
    *result = a2 + 2;
  return result;
}

uint64_t storeEnumTagSinglePayload for AppLaunchMethod.IndirectMethod(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_1BA418A34 + 4 * byte_1BA447634[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1BA418A68 + 4 * byte_1BA44762F[v4]))();
}

uint64_t sub_1BA418A68(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA418A70(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA418A78);
  return result;
}

uint64_t sub_1BA418A84(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA418A8CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1BA418A90(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA418A98(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t dispatch thunk of AppLaunchMethodCheckerType.appActivationURLHandler.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t method lookup function for AppLaunchMethodChecker()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AppLaunchMethodChecker.__allocating_init(appActivationURLHandler:notificationLaunchStatusProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t LandingPageDecision.CloseButtonVisibility.shouldHideCloseButton.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL static LandingPageDecision.CloseButtonVisibility.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t LandingPageDecision.CloseButtonVisibility.hash(into:)()
{
  return sub_1BA438458();
}

uint64_t LandingPageDecision.CloseButtonVisibility.hashValue.getter()
{
  sub_1BA43844C();
  sub_1BA438458();
  return sub_1BA438470();
}

uint64_t LandingPageDecider.landingPage(for:)()
{
  sub_1BA418DA4();
  swift_allocObject();
  return sub_1BA43697C();
}

uint64_t sub_1BA418BA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v10;
  _QWORD *v11;
  void *v13;
  _QWORD *v14;

  if (a6)
  {
    MEMORY[0x1E0C80A78](a1, a2);
    sub_1BA41A474();
    sub_1BA4369DC();
    v10 = (void *)sub_1BA4363C4();
    v11 = (_QWORD *)swift_allocObject();
    v11[2] = a3;
    v11[3] = a4;
    v11[4] = a1;
    v11[5] = a2;
  }
  else
  {
    sub_1BA4369DC();
    v13 = (void *)sub_1BA43688C();
    sub_1BA436958();
    swift_release();

    v10 = (void *)sub_1BA4363C4();
    v14 = (_QWORD *)swift_allocObject();
    v14[2] = a1;
    v14[3] = a2;
    v14[4] = a3;
    v14[5] = a4;
  }
  swift_retain();
  swift_retain();
  sub_1BA4368F8();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_1BA418D98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_1BA418BA0(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24));
}

void sub_1BA418DA4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5BBE10)
  {
    type metadata accessor for LandingPageDecision(255);
    v0 = sub_1BA436988();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5BBE10);
  }
}

uint64_t type metadata accessor for LandingPageDecision(uint64_t a1)
{
  return sub_1BA2F2D68(a1, (uint64_t *)&unk_1ED5BBE30);
}

uint64_t sub_1BA418E0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 40));
  sub_1BA32F3A4();
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1BA43A710;
  *(_QWORD *)(v5 + 32) = a2;
  *(_QWORD *)(v5 + 40) = a3;
  swift_bridgeObjectRetain();
  v6 = sub_1BA437A14();
  swift_bridgeObjectRelease();
  return v6;
}

void sub_1BA418EB8(unint64_t *a1, uint64_t a2, void (*a3)(void), uint64_t a4, void (*a5)(char *), uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _BYTE *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  _BYTE *v33;
  _QWORD v34[2];
  void (*v35)(char *);

  v11 = type metadata accessor for LandingPageDecision(0);
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *a1;
  if (!(v15 >> 62))
  {
    v16 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v16)
      goto LABEL_3;
LABEL_21:
    swift_bridgeObjectRelease();
    sub_1BA41A4F8();
    v32 = (void *)swift_allocError();
    *v33 = 0;
    a3();

    return;
  }
  swift_bridgeObjectRetain();
  if (!sub_1BA43826C())
    goto LABEL_21;
LABEL_3:
  v35 = a5;
  v34[1] = a6;
  if ((v15 & 0xC000000000000001) != 0)
  {
    v17 = (void *)MEMORY[0x1BCCDBAF4](0, v15);
LABEL_6:
    swift_bridgeObjectRelease();
    if ((objc_msgSend(v17, sel_respondsToSelector_, sel_role) & 1) != 0
      && objc_msgSend(v17, sel_role) == (id)3)
    {
      v18 = (objc_msgSend(v17, sel_respondsToSelector_, sel_hideModalCloseButton) & 1) != 0
         && (objc_msgSend(v17, sel_hideModalCloseButton) & 1) != 0;
      v28 = objc_msgSend(v17, sel_identifier);
      v29 = sub_1BA437C3C();
      v31 = v30;

      *(_QWORD *)v14 = v29;
      *((_QWORD *)v14 + 1) = v31;
      v14[16] = v18;
      goto LABEL_19;
    }
    v19 = objc_msgSend(*(id *)(a2 + 56), sel_configuration);
    if (v19)
    {
      v20 = v19;
      if ((objc_msgSend(v19, sel_respondsToSelector_, sel_paidBundleConfig) & 1) != 0)
      {
        v21 = objc_msgSend(v20, sel_paidBundleConfig);
        swift_unknownObjectRelease();
        v22 = objc_msgSend(v21, sel_defaultLandingPageArticleID);

        if (v22)
        {
          v23 = sub_1BA437C3C();
          v25 = v24;

          *(_QWORD *)v14 = v23;
          *((_QWORD *)v14 + 1) = v25;
          v14[16] = 0;
LABEL_19:
          swift_storeEnumTagMultiPayload();
          v35(v14);
          swift_unknownObjectRelease();
          sub_1BA3000D8((uint64_t)v14, type metadata accessor for LandingPageDecision);
          return;
        }
      }
      else
      {
        swift_unknownObjectRelease();
      }
      sub_1BA41A4F8();
      v26 = (void *)swift_allocError();
      *v27 = 1;
      a3();

      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_24;
  }
  if (*(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v17 = *(void **)(v15 + 32);
    swift_unknownObjectRetain();
    goto LABEL_6;
  }
  __break(1u);
LABEL_24:
  __break(1u);
}

uint64_t sub_1BA4191D4@<X0>(uint64_t a1@<X8>)
{
  id v2;
  void *v3;
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  sub_1BA36CAD4(MEMORY[0x1E0DEE9E0]);
  v2 = objc_allocWithZone(MEMORY[0x1E0CFDB08]);
  sub_1BA2FF1AC(0, (unint64_t *)&qword_1ED5BE720);
  v3 = (void *)sub_1BA437BC4();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v2, sel_initWithDictionary_, v3);

  v5 = byte_1ED5C1E60;
  v7 = qword_1ED5C1E68;
  v6 = unk_1ED5C1E70;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = MEMORY[0x1E0DEE9D8];
  *(_BYTE *)(a1 + 40) = 0;
  *(_BYTE *)(a1 + 48) = v5;
  *(_QWORD *)(a1 + 56) = v7;
  *(_QWORD *)(a1 + 64) = v6;
  *(_QWORD *)(a1 + 72) = v4;
  return swift_bridgeObjectRetain();
}

void sub_1BA4192BC(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4, void (*a5)(void), uint64_t a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(void);
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *);

  v26 = a6;
  v27 = a5;
  v33 = a4;
  v34 = a3;
  v28 = a2;
  v7 = type metadata accessor for LandingPageDecision(0);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)a1;
  v12 = *(_QWORD *)(a1 + 8);
  v13 = *(_QWORD *)(a1 + 24);
  v31 = *(_QWORD *)(a1 + 16);
  v32 = v11;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_BYTE *)(a1 + 40);
  v30 = *(unsigned __int8 *)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 64);
  v29 = *(_QWORD *)(a1 + 56);
  v17 = *(void **)(a1 + 72);
  swift_bridgeObjectRetain();
  v18 = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  LOBYTE(a1) = AMSMarketingItem.isCIPOffer()();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
    goto LABEL_4;
  if ((v15 & 1) != 0)
    goto LABEL_5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v19 = v18;
  HIDWORD(v25) = AMSMarketingItem.isBundleHardwareOffer()();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v25 & 0x100000000) != 0)
  {
LABEL_4:
    *(_QWORD *)v10 = v32;
    *((_QWORD *)v10 + 1) = v12;
    *((_QWORD *)v10 + 2) = v31;
    *((_QWORD *)v10 + 3) = v13;
    *((_QWORD *)v10 + 4) = v14;
    v10[40] = v15;
    v10[48] = v30;
    *((_QWORD *)v10 + 7) = v29;
    *((_QWORD *)v10 + 8) = v16;
    *((_QWORD *)v10 + 9) = v18;
    type metadata accessor for LandingPageDecision.AMSSheet(0);
    swift_storeEnumTagMultiPayload();
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v20 = v18;
  }
  else
  {
LABEL_5:
    v21 = sub_1BA419528(v28);
    if (!v22)
    {
      sub_1BA41A4F8();
      v23 = (void *)swift_allocError();
      *v24 = 1;
      v27();

      return;
    }
    *(_QWORD *)v10 = v21;
    *((_QWORD *)v10 + 1) = v22;
    v10[16] = 0;
    swift_storeEnumTagMultiPayload();
  }
  v34(v10);
  sub_1BA3000D8((uint64_t)v10, type metadata accessor for LandingPageDecision);
}

id sub_1BA419528(uint64_t a1)
{
  uint64_t v2;
  uint64_t ObjectType;
  uint64_t v4;
  id result;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  char v11;
  uint64_t v12[4];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v2 = *(_QWORD *)(a1 + 72);
  ObjectType = swift_getObjectType();
  v11 = 6;
  (*(void (**)(uint64_t *__return_ptr, char *, uint64_t, uint64_t))(v2 + 32))(v12, &v11, ObjectType, v2);
  v4 = v13;
  sub_1BA320CD0(v12[0], v12[1], v12[2], v12[3], v13, v14, v15, v16, v17, v18);
  result = objc_msgSend(*(id *)(a1 + 56), sel_configuration);
  v6 = result;
  if (v4)
  {
    if (result)
    {
      if ((objc_msgSend(result, sel_respondsToSelector_, sel_paidBundleConfig) & 1) != 0)
      {
        v7 = objc_msgSend(v6, sel_paidBundleConfig);
        swift_unknownObjectRelease();
        v8 = objc_msgSend(v7, sel_defaultServicesBundleLandingPageArticleID);
        goto LABEL_8;
      }
      goto LABEL_10;
    }
    __break(1u);
  }
  else if (result)
  {
    if ((objc_msgSend(result, sel_respondsToSelector_, sel_paidBundleConfig) & 1) != 0)
    {
      v7 = objc_msgSend(v6, sel_paidBundleConfig);
      swift_unknownObjectRelease();
      v8 = objc_msgSend(v7, sel_defaultLandingPageArticleID);
LABEL_8:
      v9 = v8;

      if (v9)
      {
        v10 = sub_1BA437C3C();

        return (id)v10;
      }
      return 0;
    }
LABEL_10:
    swift_unknownObjectRelease();
    return 0;
  }
  __break(1u);
  return result;
}

uint64_t LandingPageDecider.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t LandingPageDecider.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

unint64_t sub_1BA419718()
{
  unint64_t result;

  result = qword_1EF28F608;
  if (!qword_1EF28F608)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for LandingPageDecision.CloseButtonVisibility, &type metadata for LandingPageDecision.CloseButtonVisibility);
    atomic_store(result, (unint64_t *)&qword_1EF28F608);
  }
  return result;
}

uint64_t sub_1BA41975C()
{
  sub_1BA418DA4();
  swift_allocObject();
  return sub_1BA43697C();
}

ValueMetadata *type metadata accessor for CampaignRouteTarget()
{
  return &type metadata for CampaignRouteTarget;
}

uint64_t initializeBufferWithCopyOfBuffer for LandingPageDecision(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v11 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for LandingPageDecision.AMSSheet(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v6 = a2[1];
        *(_QWORD *)a1 = *a2;
        *(_QWORD *)(a1 + 8) = v6;
        v7 = a2[3];
        *(_QWORD *)(a1 + 16) = a2[2];
        *(_QWORD *)(a1 + 24) = v7;
        *(_QWORD *)(a1 + 32) = a2[4];
        *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
        *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
        v8 = a2[8];
        *(_QWORD *)(a1 + 56) = a2[7];
        *(_QWORD *)(a1 + 64) = v8;
        v9 = (void *)a2[9];
        *(_QWORD *)(a1 + 72) = v9;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v10 = v9;
      }
      else
      {
        v13 = sub_1BA435EFC();
        (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(a1, a2, v13);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      v12 = a2[1];
      *(_QWORD *)a1 = *a2;
      *(_QWORD *)(a1 + 8) = v12;
      *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t type metadata accessor for LandingPageDecision.AMSSheet(uint64_t a1)
{
  return sub_1BA2F2D68(a1, qword_1ED5BBE18);
}

void destroy for LandingPageDecision(uint64_t a1)
{
  uint64_t v2;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    type metadata accessor for LandingPageDecision.AMSSheet(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

    }
    else
    {
      v2 = sub_1BA435EFC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t initializeWithCopy for LandingPageDecision(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    type metadata accessor for LandingPageDecision.AMSSheet(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v4 = *(_QWORD *)(a2 + 8);
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = v4;
      v5 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 24) = v5;
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
      *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
      v6 = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 64) = v6;
      v7 = *(void **)(a2 + 72);
      *(_QWORD *)(a1 + 72) = v7;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v8 = v7;
    }
    else
    {
      v10 = sub_1BA435EFC();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    v9 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v9;
    *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for LandingPageDecision(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;

  if (a1 != a2)
  {
    sub_1BA3000D8(a1, type metadata accessor for LandingPageDecision);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for LandingPageDecision.AMSSheet(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
        *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
        *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
        *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
        *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
        *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
        *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
        *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
        v4 = *(void **)(a2 + 72);
        *(_QWORD *)(a1 + 72) = v4;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v5 = v4;
      }
      else
      {
        v6 = sub_1BA435EFC();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
      *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for LandingPageDecision(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = type metadata accessor for LandingPageDecision.AMSSheet(0);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    else
    {
      v7 = sub_1BA435EFC();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for LandingPageDecision(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_1BA3000D8((uint64_t)a1, type metadata accessor for LandingPageDecision);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = type metadata accessor for LandingPageDecision.AMSSheet(0);
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
      }
      else
      {
        v7 = sub_1BA435EFC();
        (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
        swift_storeEnumTagMultiPayload();
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1BA419E50()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for LandingPageDecision.AMSSheet(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for LandingPageDecision.CloseButtonVisibility()
{
  return &type metadata for LandingPageDecision.CloseButtonVisibility;
}

uint64_t initializeBufferWithCopyOfBuffer for LandingPageDecision.AMSSheet(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v11 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = a2[1];
      *(_QWORD *)a1 = *a2;
      *(_QWORD *)(a1 + 8) = v6;
      v7 = a2[3];
      *(_QWORD *)(a1 + 16) = a2[2];
      *(_QWORD *)(a1 + 24) = v7;
      *(_QWORD *)(a1 + 32) = a2[4];
      *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
      *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
      v8 = a2[8];
      *(_QWORD *)(a1 + 56) = a2[7];
      *(_QWORD *)(a1 + 64) = v8;
      v9 = (void *)a2[9];
      *(_QWORD *)(a1 + 72) = v9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v10 = v9;
    }
    else
    {
      v12 = sub_1BA435EFC();
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(a1, a2, v12);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void destroy for LandingPageDecision.AMSSheet(uint64_t a1)
{
  uint64_t v2;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
  else
  {
    v2 = sub_1BA435EFC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  }
}

uint64_t initializeWithCopy for LandingPageDecision.AMSSheet(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v4;
    v5 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = v5;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
    *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
    v6 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 64) = v6;
    v7 = *(void **)(a2 + 72);
    *(_QWORD *)(a1 + 72) = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v8 = v7;
  }
  else
  {
    v9 = sub_1BA435EFC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for LandingPageDecision.AMSSheet(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;

  if (a1 != a2)
  {
    sub_1BA3000D8(a1, type metadata accessor for LandingPageDecision.AMSSheet);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
      *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      v4 = *(void **)(a2 + 72);
      *(_QWORD *)(a1 + 72) = v4;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v5 = v4;
    }
    else
    {
      v6 = sub_1BA435EFC();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for LandingPageDecision.AMSSheet(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = sub_1BA435EFC();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithTake for LandingPageDecision.AMSSheet(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_1BA3000D8((uint64_t)a1, type metadata accessor for LandingPageDecision.AMSSheet);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = sub_1BA435EFC();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_1BA41A374()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1BA435EFC();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t dispatch thunk of LandingPageDeciderType.landingPage(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t method lookup function for LandingPageDecider()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1BA41A3F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;

  v1 = *(_QWORD *)(v0 + 72);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(ObjectType, v1);
}

void sub_1BA41A43C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1BA4192BC(a1, a2, *(void (**)(char *))(v2 + 16), *(_QWORD *)(v2 + 24), *(void (**)(void))(v2 + 32), *(_QWORD *)(v2 + 40));
}

uint64_t sub_1BA41A458()
{
  uint64_t *v0;

  return sub_1BA418E0C(v0[2], v0[3], v0[4]);
}

void sub_1BA41A474()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5BBE40)
  {
    sub_1BA2FF1AC(255, &qword_1ED5BBE48);
    v0 = sub_1BA437E34();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5BBE40);
  }
}

void sub_1BA41A4DC(unint64_t *a1, uint64_t a2)
{
  uint64_t v2;

  sub_1BA418EB8(a1, a2, *(void (**)(void))(v2 + 16), *(_QWORD *)(v2 + 24), *(void (**)(char *))(v2 + 32), *(_QWORD *)(v2 + 40));
}

unint64_t sub_1BA41A4F8()
{
  unint64_t result;

  result = qword_1EF28F610;
  if (!qword_1EF28F610)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA447AA0, &type metadata for LandingPageDecider.Errors);
    atomic_store(result, (unint64_t *)&qword_1EF28F610);
  }
  return result;
}

uint64_t _s16NewsSubscription19LandingPageDecisionO21CloseButtonVisibilityOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1BA41A588 + 4 * byte_1BA447895[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1BA41A5BC + 4 * byte_1BA447890[v4]))();
}

uint64_t sub_1BA41A5BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA41A5C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA41A5CCLL);
  return result;
}

uint64_t sub_1BA41A5D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA41A5E0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BA41A5E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA41A5EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LandingPageDecider.Errors()
{
  return &type metadata for LandingPageDecider.Errors;
}

unint64_t sub_1BA41A60C()
{
  unint64_t result;

  result = qword_1EF28F620;
  if (!qword_1EF28F620)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA447A78, &type metadata for LandingPageDecider.Errors);
    atomic_store(result, (unint64_t *)&qword_1EF28F620);
  }
  return result;
}

uint64_t sub_1BA41A654()
{
  uint64_t result;

  result = sub_1BA437C18();
  qword_1ED5BB348 = result;
  return result;
}

uint64_t sub_1BA41A688()
{
  uint64_t result;

  result = sub_1BA437C18();
  qword_1ED5BB340 = result;
  return result;
}

uint64_t CampaignClickRecorder.patterns.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CampaignClickRecorder.__allocating_init(patterns:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  CampaignClickRecorder.init(patterns:)(a1);
  return v2;
}

uint64_t CampaignClickRecorder.init(patterns:)(uint64_t a1)
{
  uint64_t v1;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_msgSend(objc_allocWithZone((Class)BridgedCampaignClickRecorder), sel_init);
  *(_QWORD *)(v1 + 16) = a1;
  *(_QWORD *)(v1 + 24) = v3;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CFDBA0]), sel_init);
  if (qword_1ED5BB748 != -1)
    swift_once();
  objc_msgSend(v4, sel_addBagKey_valueType_, qword_1ED5BB348, 6);
  if (qword_1ED5BB740 != -1)
    swift_once();
  objc_msgSend(v4, sel_addBagKey_valueType_, qword_1ED5BB340, 5);
  v5 = (void *)objc_opt_self();
  v6 = (void *)sub_1BA437C18();
  v7 = (void *)sub_1BA437C18();
  objc_msgSend(v5, sel_registerBagKeySet_forProfile_profileVersion_, v4, v6, v7);

  return v1;
}

uint64_t CampaignClickRecorder.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return v0;
}

uint64_t CampaignClickRecorder.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

void sub_1BA41A8A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  void *v15;
  _QWORD v16[6];

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  swift_retain();
  v9 = (void *)sub_1BA437C18();
  v10 = (void *)sub_1BA437C18();
  v11 = objc_msgSend((id)objc_opt_self(), sel_bagForProfile_profileVersion_, v9, v10);

  if (qword_1ED5BB748 != -1)
    swift_once();
  v12 = objc_msgSend(v11, sel_dictionaryForKey_, qword_1ED5BB348);
  v13 = objc_msgSend(v12, sel_valuePromise);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = sub_1BA388F94;
  v14[5] = v8;
  v16[4] = sub_1BA41CD20;
  v16[5] = v14;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 1107296256;
  v16[2] = sub_1BA3355E0;
  v16[3] = &block_descriptor_43_2;
  v15 = _Block_copy(v16);
  swift_retain();
  swift_release();
  objc_msgSend(v13, sel_addFinishBlock_, v15);
  _Block_release(v15);

}

void sub_1BA41AA78(void *a1, id a2, void (*a3)(void), uint64_t a4, void (*a5)())
{
  id v7;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _BYTE *v14;
  void *v15;
  _BYTE *v16;
  void *v17;
  _BYTE *v18;
  _BYTE *v19;
  id v20;
  _OWORD v21[2];
  _OWORD v22[2];
  _OWORD v23[2];

  if (a2)
  {
    v7 = a2;
    ((void (*)(id))a3)(a2);

  }
  else if (a1)
  {
    v20 = a1;
    v9 = (void *)sub_1BA437C18();
    v10 = objc_msgSend(v20, sel_objectForKey_, v9);

    if (v10)
    {
      sub_1BA4380EC();
      swift_unknownObjectRelease();
      sub_1BA32B974(v22, v23);
      v11 = (void *)sub_1BA437C18();
      v12 = objc_msgSend(v20, sel_objectForKey_, v11);

      if (v12)
      {
        sub_1BA4380EC();
        swift_unknownObjectRelease();
        sub_1BA32B974(v21, v22);
        sub_1BA31AA58((uint64_t)v23, (uint64_t)v21);
        if ((swift_dynamicCast() & 1) != 0)
        {
          sub_1BA31AA58((uint64_t)v22, (uint64_t)v21);
          sub_1BA2FC03C(0, (unint64_t *)&qword_1ED5BE5C0, MEMORY[0x1E0DEA968], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
          if ((swift_dynamicCast() & 1) != 0)
          {
            a5();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

            __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
            return;
          }
          swift_bridgeObjectRelease();
        }
        sub_1BA41C750();
        v17 = (void *)swift_allocError();
        *v19 = 0;
        a3();

        __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
      }
      else
      {
        sub_1BA41C750();
        v17 = (void *)swift_allocError();
        *v18 = 0;
        a3();

      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);

    }
    else
    {
      sub_1BA41C750();
      v15 = (void *)swift_allocError();
      *v16 = 0;
      a3();

    }
  }
  else
  {
    sub_1BA41C750();
    v13 = (void *)swift_allocError();
    *v14 = 0;
    a3();

  }
}

void sub_1BA41AD98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  void *v15;
  _QWORD v16[6];

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  swift_retain();
  v9 = (void *)sub_1BA437C18();
  v10 = (void *)sub_1BA437C18();
  v11 = objc_msgSend((id)objc_opt_self(), sel_bagForProfile_profileVersion_, v9, v10);

  if (qword_1ED5BB740 != -1)
    swift_once();
  v12 = objc_msgSend(v11, sel_URLForKey_, qword_1ED5BB340);
  v13 = objc_msgSend(v12, sel_valuePromise);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = sub_1BA3CE5B4;
  v14[5] = v8;
  v16[4] = sub_1BA41CD10;
  v16[5] = v14;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 1107296256;
  v16[2] = sub_1BA3355E0;
  v16[3] = &block_descriptor_34;
  v15 = _Block_copy(v16);
  swift_retain();
  swift_release();
  objc_msgSend(v13, sel_addFinishBlock_, v15);
  _Block_release(v15);

}

void sub_1BA41AF68(void *a1, id a2, void (*a3)(void), uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  _BYTE *v16;

  if (a1 && (v8 = objc_msgSend(a1, sel_absoluteString)) != 0)
  {
    v9 = v8;
    v10 = sub_1BA437C3C();
    v12 = v11;

    a5(v10, v12);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (a2)
    {
      v13 = a2;
      ((void (*)(id))a3)(a2);
      v14 = a2;
    }
    else
    {
      sub_1BA41C750();
      v15 = swift_allocError();
      *v16 = 1;
      a3();
      v14 = (id)v15;
    }

  }
}

uint64_t sub_1BA41B048(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  BOOL v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 1;
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
    return 1;
  if (v2 >= v3)
    v4 = a1;
  else
    v4 = a2;
  if (v2 >= v3)
    v5 = a2;
  else
    v5 = a1;
  v32 = v4;
  v33 = v4 + 56;
  v6 = -1 << *(_BYTE *)(v4 + 32);
  if (-v6 < 64)
    v7 = ~(-1 << -(char)v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v4 + 56);
  v31 = (unint64_t)(63 - v6) >> 6;
  v9 = v5 + 56;
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRetain();
  v11 = 0;
  while (1)
  {
    while (1)
    {
      v12 = v11;
      if (!v8)
        break;
      v13 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v14 = v13 | (v11 << 6);
      if (*(_QWORD *)(v5 + 16))
        goto LABEL_31;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_50;
    }
    if (v15 >= v31)
      goto LABEL_48;
    v16 = *(_QWORD *)(v33 + 8 * v15);
    ++v11;
    if (!v16)
    {
      v11 = v12 + 2;
      if (v12 + 2 >= v31)
        goto LABEL_48;
      v16 = *(_QWORD *)(v33 + 8 * v11);
      if (!v16)
      {
        v11 = v12 + 3;
        if (v12 + 3 >= v31)
          goto LABEL_48;
        v16 = *(_QWORD *)(v33 + 8 * v11);
        if (!v16)
          break;
      }
    }
LABEL_30:
    v8 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
    if (*(_QWORD *)(v5 + 16))
    {
LABEL_31:
      v18 = (uint64_t *)(*(_QWORD *)(v32 + 48) + 16 * v14);
      v20 = *v18;
      v19 = v18[1];
      sub_1BA43844C();
      swift_bridgeObjectRetain();
      sub_1BA437CB4();
      v21 = sub_1BA438470();
      v22 = -1 << *(_BYTE *)(v5 + 32);
      v23 = v21 & ~v22;
      if (((*(_QWORD *)(v9 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) != 0)
      {
        v24 = *(_QWORD *)(v5 + 48);
        v25 = (_QWORD *)(v24 + 16 * v23);
        v26 = *v25 == v20 && v25[1] == v19;
        if (v26 || (sub_1BA4383C8() & 1) != 0)
        {
LABEL_44:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v30 = 0;
LABEL_45:
          sub_1BA340B1C();
          return v30;
        }
        v27 = ~v22;
        while (1)
        {
          v23 = (v23 + 1) & v27;
          if (((*(_QWORD *)(v9 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
            break;
          v28 = (_QWORD *)(v24 + 16 * v23);
          v29 = *v28 == v20 && v28[1] == v19;
          if (v29 || (sub_1BA4383C8() & 1) != 0)
            goto LABEL_44;
        }
      }
      result = swift_bridgeObjectRelease();
    }
  }
  v17 = v12 + 4;
  if (v12 + 4 >= v31)
  {
LABEL_48:
    swift_bridgeObjectRelease();
    v30 = 1;
    goto LABEL_45;
  }
  v16 = *(_QWORD *)(v33 + 8 * v17);
  if (v16)
  {
    v11 = v12 + 4;
    goto LABEL_30;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= v31)
      goto LABEL_48;
    v16 = *(_QWORD *)(v33 + 8 * v11);
    ++v17;
    if (v16)
      goto LABEL_30;
  }
LABEL_50:
  __break(1u);
  return result;
}

void sub_1BA41B328(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD *v27;

  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a1;
  *(_QWORD *)(v10 + 24) = a2;
  v11 = *(void **)(a5 + 24);
  swift_retain();
  v12 = (void *)sub_1BA437C18();
  v13 = (void *)sub_1BA437C18();
  v14 = objc_msgSend(v11, sel_recordCampaignClickWithReportUrl_campaignUrl_, v12, v13);

  v15 = (_QWORD *)swift_allocObject();
  v15[2] = sub_1BA2FAE68;
  v15[3] = v10;
  v15[4] = a3;
  v15[5] = a4;
  v26 = sub_1BA41C718;
  v27 = v15;
  v16 = MEMORY[0x1E0C809B0];
  v22 = MEMORY[0x1E0C809B0];
  v23 = 1107296256;
  v24 = sub_1BA363818;
  v25 = &block_descriptor_35;
  v17 = _Block_copy(&v22);
  swift_retain();
  swift_release();
  v18 = objc_msgSend(v14, sel_then_, v17);
  _Block_release(v17);

  if (v18)
  {
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = a3;
    *(_QWORD *)(v19 + 24) = a4;
    v26 = sub_1BA41C748;
    v27 = (_QWORD *)v19;
    v22 = v16;
    v23 = 1107296256;
    v24 = sub_1BA3333A8;
    v25 = &block_descriptor_18_3;
    v20 = _Block_copy(&v22);
    swift_retain();
    swift_release();
    v21 = objc_msgSend(v18, sel_error_, v20);
    _Block_release(v20);

  }
  else
  {
    __break(1u);
  }
}

double sub_1BA41B548@<D0>(uint64_t a1@<X0>, void (*a2)()@<X1>, void (*a3)(void)@<X3>, _OWORD *a4@<X8>)
{
  void *v7;
  _BYTE *v8;
  double result;
  void *v10;
  _BYTE v11[24];
  uint64_t v12;

  sub_1BA32BA5C(a1, (uint64_t)v11);
  if (!v12)
  {
    sub_1BA32B92C((uint64_t)v11, (uint64_t)&qword_1ED5BE7D0, MEMORY[0x1E0DEE9B8] + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1BA2FC03C);
    goto LABEL_5;
  }
  sub_1BA2F299C(0, &qword_1ED5BB290);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    sub_1BA41C750();
    v7 = (void *)swift_allocError();
    *v8 = 6;
    a3();

    goto LABEL_6;
  }
  a2();

LABEL_6:
  result = 0.0;
  *a4 = 0u;
  a4[1] = 0u;
  return result;
}

void sub_1BA41B650(void *a1, void (*a2)(uint64_t))
{
  void *v3;
  id v4;
  uint64_t v5;
  _BYTE *v6;

  if (a1)
  {
    v3 = a1;
    v4 = a1;
    v5 = (uint64_t)v3;
  }
  else
  {
    sub_1BA41C750();
    v5 = swift_allocError();
    v3 = (void *)v5;
    *v6 = 6;
  }
  a2(v5);

}

void sub_1BA41B6BC(void (*a1)(_QWORD *), uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  void *v15;
  _BYTE *v16;
  _QWORD v17[2];

  if ((sub_1BA41C7C0(a6, a7, a10) & 1) != 0)
  {
    sub_1BA41B7A0(a6, a7);
    v17[0] = a8;
    v17[1] = a9;
    a1(v17);
  }
  else
  {
    sub_1BA41C750();
    v15 = (void *)swift_allocError();
    *v16 = 2;
    a3();

  }
}

void sub_1BA41B7A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  if ((sub_1BA41B924() & 1) == 0)
  {
    sub_1BA4369DC();
    v5 = (_QWORD *)swift_allocObject();
    v5[2] = v2;
    v5[3] = a1;
    v5[4] = a2;
    swift_retain();
    swift_bridgeObjectRetain();
    v6 = (void *)sub_1BA43688C();
    sub_1BA2F299C(0, &qword_1ED5BB290);
    sub_1BA4368D4();
    swift_release();
    swift_release();

    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = a1;
    *(_QWORD *)(v7 + 24) = a2;
    swift_bridgeObjectRetain();
    v8 = (void *)sub_1BA43688C();
    sub_1BA4368E0();
    swift_release();
    swift_release();

    v9 = (id)sub_1BA43688C();
    sub_1BA436904();
    swift_release();
    swift_release();

  }
}

uint64_t sub_1BA41B924()
{
  id v0;
  uint64_t v1;
  id v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;

  v0 = objc_msgSend((id)objc_opt_self(), sel_ams_sharedAccountStore);
  v1 = (uint64_t)objc_msgSend(v0, sel_ams_localiTunesAccount);

  if (v1)
  {
    v2 = objc_msgSend((id)v1, sel_ams_cookies);
    if (v2)
    {
      v3 = v2;
      sub_1BA2F299C(0, &qword_1EF28F640);
      v4 = sub_1BA437DE0();

      if (v4 >> 62)
        goto LABEL_24;
      v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      for (; v5; v5 = sub_1BA43826C())
      {
        v6 = 4;
        while (1)
        {
          v7 = (v4 & 0xC000000000000001) != 0
             ? (id)MEMORY[0x1BCCDBAF4](v6 - 4, v4)
             : *(id *)(v4 + 8 * v6);
          v8 = v7;
          v9 = v6 - 3;
          if (__OFADD__(v6 - 4, 1))
            break;
          v10 = objc_msgSend(v7, sel_name);
          v11 = sub_1BA437C3C();
          v13 = v12;

          if (v11 == 0x69635F7078 && v13 == 0xE500000000000000)
          {

            swift_bridgeObjectRelease();
LABEL_20:
            swift_bridgeObjectRelease();
            v1 = 1;
            goto LABEL_21;
          }
          v15 = sub_1BA4383C8();

          swift_bridgeObjectRelease();
          if ((v15 & 1) != 0)
          {

            goto LABEL_20;
          }
          ++v6;
          if (v9 == v5)
            goto LABEL_16;
        }
        __break(1u);
LABEL_24:
        swift_bridgeObjectRetain();
      }
LABEL_16:

      swift_bridgeObjectRelease();
      v1 = 0;
LABEL_21:
      swift_bridgeObjectRelease();
    }
    else
    {

      return 0;
    }
  }
  return v1;
}

uint64_t sub_1BA41BB44()
{
  uint64_t v0;

  if (qword_1ED5C0D38 != -1)
    swift_once();
  sub_1BA437F24();
  sub_1BA306EEC();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1BA43A710;
  sub_1BA2F2B30(0, (unint64_t *)&qword_1ED5BE7B0);
  sub_1BA43823C();
  *(_QWORD *)(v0 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v0 + 64) = sub_1BA307848();
  *(_QWORD *)(v0 + 32) = 0;
  *(_QWORD *)(v0 + 40) = 0xE000000000000000;
  sub_1BA436AA8();
  return swift_bridgeObjectRelease();
}

void CampaignClickRecorder.processURL(for:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v1 = sub_1BA435EFC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1, v3);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1BA43658C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA2F3474(0, (unint64_t *)&qword_1ED5BBF30, (uint64_t (*)(uint64_t))MEMORY[0x1E0DB6EB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DB3F28]);
  sub_1BA436688();
  sub_1BA43655C();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  v11 = sub_1BA435E84();
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  sub_1BA4369DC();
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = v0;
  v14[3] = v11;
  v14[4] = v13;
  swift_retain();
  swift_bridgeObjectRetain();
  v15 = (void *)sub_1BA43688C();
  sub_1BA4368D4();
  swift_release();
  swift_release();

  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v0;
  v16[3] = v11;
  v16[4] = v13;
  swift_retain();
  swift_bridgeObjectRetain();
  v17 = (void *)sub_1BA43688C();
  sub_1BA2F299C(0, &qword_1ED5BB290);
  sub_1BA4368D4();
  swift_release();
  swift_release();

  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v11;
  *(_QWORD *)(v18 + 24) = v13;
  v19 = (void *)sub_1BA43688C();
  sub_1BA4368E0();
  swift_release();
  swift_release();

  v20 = (void *)sub_1BA43688C();
  sub_1BA436904();
  swift_release();
  swift_release();

}

uint64_t sub_1BA41BF00(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  sub_1BA2FC03C(0, a2, a3, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DB4D08]);
  swift_allocObject();
  return sub_1BA43697C();
}

uint64_t sub_1BA41BF58()
{
  uint64_t v0;

  return sub_1BA41BF00(v0, (unint64_t *)&unk_1ED5BB270, (uint64_t)&type metadata for CampaignClickRecorder.ProcessRedirectValue);
}

uint64_t sub_1BA41BF88()
{
  sub_1BA2FC03C(0, &qword_1ED5BB280, MEMORY[0x1E0DEA968], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DB4D08]);
  swift_allocObject();
  return sub_1BA43697C();
}

uint64_t sub_1BA41C008()
{
  return sub_1BA41BF88();
}

uint64_t sub_1BA41C024()
{
  sub_1BA41C6B0();
  swift_allocObject();
  return sub_1BA43697C();
}

uint64_t sub_1BA41C090()
{
  return sub_1BA41C024();
}

uint64_t sub_1BA41C0B4(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v30 = a4;
  v31 = a5;
  sub_1BA2F3474(0, &qword_1ED5C2050, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v10 = MEMORY[0x1E0C80A78](v8, v9);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10, v13);
  v15 = (char *)&v30 - v14;
  v16 = *a1;
  if (qword_1ED5C0D38 != -1)
    swift_once();
  sub_1BA306EEC();
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_1BA43A7B0;
  v18 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v17 + 56) = MEMORY[0x1E0DEA968];
  v19 = sub_1BA307848();
  *(_QWORD *)(v17 + 64) = v19;
  *(_QWORD *)(v17 + 32) = a2;
  *(_QWORD *)(v17 + 40) = a3;
  swift_bridgeObjectRetain();
  v20 = objc_msgSend(v16, sel_response, v30, v31);
  if (!v20)
    goto LABEL_9;
  v21 = v20;
  v22 = objc_msgSend(v20, sel_URL);

  if (v22)
  {
    sub_1BA435ECC();

    v23 = sub_1BA435EFC();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v12, 0, 1, v23);
  }
  else
  {
    v23 = sub_1BA435EFC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v12, 1, 1, v23);
  }
  sub_1BA36BD90((uint64_t)v12, (uint64_t)v15);
  sub_1BA435EFC();
  v24 = *(_QWORD *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v15, 1, v23) == 1)
  {
    sub_1BA32B92C((uint64_t)v15, (uint64_t)&qword_1ED5C2050, (uint64_t)MEMORY[0x1E0CAFFF8], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1BA2F3474);
LABEL_9:
    v25 = (uint64_t *)(v17 + 72);
    *(_QWORD *)(v17 + 96) = v18;
    *(_QWORD *)(v17 + 104) = v19;
    goto LABEL_10;
  }
  v28 = sub_1BA435E84();
  v26 = v29;
  (*(void (**)(char *, uint64_t))(v24 + 8))(v15, v23);
  v25 = (uint64_t *)(v17 + 72);
  *(_QWORD *)(v17 + 96) = v18;
  *(_QWORD *)(v17 + 104) = v19;
  if (v26)
  {
    *v25 = v28;
    goto LABEL_11;
  }
LABEL_10:
  *v25 = 0;
  v26 = 0xE000000000000000;
LABEL_11:
  *(_QWORD *)(v17 + 80) = v26;
  sub_1BA437F30();
  sub_1BA436AA8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BA41C360(void **a1)
{
  uint64_t v1;

  return sub_1BA41C0B4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t)"Successfully registered campaign click with figaro for campaign url: %@ && redirect url: %@", 91);
}

void sub_1BA41C384(void *a1)
{
  id v1;
  uint64_t v2;
  char v3;

  v1 = a1;
  sub_1BA2F2B30(0, (unint64_t *)&qword_1ED5BE7B0);
  if (swift_dynamicCast())
  {

    if (v3 == 2)
      return;
  }
  else
  {

  }
  if (qword_1ED5C0D38 != -1)
    swift_once();
  sub_1BA437F24();
  sub_1BA306EEC();
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1BA43A710;
  sub_1BA43823C();
  *(_QWORD *)(v2 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v2 + 64) = sub_1BA307848();
  *(_QWORD *)(v2 + 32) = 0;
  *(_QWORD *)(v2 + 40) = 0xE000000000000000;
  sub_1BA436AA8();
  swift_bridgeObjectRelease();
}

unint64_t sub_1BA41C4F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF28F630;
  if (!qword_1EF28F630)
  {
    v1 = type metadata accessor for CampaignClickRecorder();
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for CampaignClickRecorder, v1);
    atomic_store(result, (unint64_t *)&qword_1EF28F630);
  }
  return result;
}

uint64_t type metadata accessor for CampaignClickRecorder()
{
  return objc_opt_self();
}

void sub_1BA41C558()
{
  CampaignClickRecorder.processURL(for:)();
}

uint64_t method lookup function for CampaignClickRecorder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CampaignClickRecorder.__allocating_init(patterns:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t destroy for CampaignClickRecorder.ProcessRedirectValue()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s16NewsSubscription21CampaignClickRecorderC20ProcessRedirectValueVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for CampaignClickRecorder.ProcessRedirectValue(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for CampaignClickRecorder.ProcessRedirectValue(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for CampaignClickRecorder.ProcessRedirectValue()
{
  return &type metadata for CampaignClickRecorder.ProcessRedirectValue;
}

void sub_1BA41C6B0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF28F638)
  {
    sub_1BA2F299C(255, &qword_1ED5BB290);
    v0 = sub_1BA436988();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF28F638);
  }
}

double sub_1BA41C718@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_1BA41B548(a1, *(void (**)())(v2 + 16), *(void (**)(void))(v2 + 32), a2);
}

uint64_t sub_1BA41C724()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1BA41C748(void *a1)
{
  uint64_t v1;

  sub_1BA41B650(a1, *(void (**)(uint64_t))(v1 + 16));
}

unint64_t sub_1BA41C750()
{
  unint64_t result;

  result = qword_1ED5BB288;
  if (!qword_1ED5BB288)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA447C34, &type metadata for CampaignClickRecorder.CampaignLinkRecordingError);
    atomic_store(result, (unint64_t *)&qword_1ED5BB288);
  }
  return result;
}

void sub_1BA41C794(void (*a1)(_QWORD *), uint64_t a2, void (*a3)(void), uint64_t a4)
{
  uint64_t *v4;

  sub_1BA41B6BC(a1, a2, a3, a4, v4[2], v4[3], v4[4], v4[5], v4[6], v4[7]);
}

uint64_t sub_1BA41C7C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t *v29;
  uint64_t (*v30)(void);
  uint64_t v31;
  char v32;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  void (*v39)(char *, unint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;

  v63 = a3;
  v3 = sub_1BA435D64();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940];
  sub_1BA2F3474(0, &qword_1ED5BC1A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v58 - v11;
  v13 = sub_1BA435DF4();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13, v15);
  v64 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA2F3474(0, &qword_1ED5C2050, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], v8);
  MEMORY[0x1E0C80A78](v17, v18);
  v20 = (char *)&v58 - v19;
  v21 = sub_1BA435EFC();
  MEMORY[0x1E0C80A78](v21, v22);
  v24 = (char *)&v58 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = v25;
  v28 = v27;
  sub_1BA435EE4();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v20, 1, v28) == 1)
  {
    v29 = &qword_1ED5C2050;
    v30 = MEMORY[0x1E0CAFFF8];
    v31 = (uint64_t)v20;
LABEL_5:
    sub_1BA32B92C(v31, (uint64_t)v29, (uint64_t)v30, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1BA2F3474);
LABEL_6:
    v32 = 0;
    return v32 & 1;
  }
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v24, v20, v28);
  sub_1BA435D88();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v24, v28);
    v29 = &qword_1ED5BC1A8;
    v30 = MEMORY[0x1E0CAE890];
    v31 = (uint64_t)v12;
    goto LABEL_5;
  }
  v34 = v64;
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v64, v12, v13);
  v35 = sub_1BA435D70();
  if (!v35)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v34, v13);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v24, v28);
    goto LABEL_6;
  }
  v60 = v26;
  v61 = v28;
  v59 = v14;
  v62 = v13;
  v66 = MEMORY[0x1E0DEE9E8];
  v36 = *(_QWORD *)(v35 + 16);
  if (v36)
  {
    v37 = v35 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v38 = *(_QWORD *)(v4 + 72);
    v39 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    do
    {
      v39(v7, v37, v3);
      v40 = sub_1BA435D4C();
      sub_1BA426E70(&v65, v40, v41);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
      v37 += v38;
      --v36;
    }
    while (v36);
  }
  swift_bridgeObjectRelease();
  v42 = v63;
  v43 = *(_QWORD *)(v63 + 16);
  v44 = MEMORY[0x1E0DEE9D8];
  if (v43)
  {
    v65 = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
    sub_1BA3A1C5C(0, v43, 0);
    v44 = v65;
    v45 = (uint64_t *)(v42 + 40);
    do
    {
      v46 = *(v45 - 1);
      v47 = *v45;
      v65 = v44;
      v48 = *(_QWORD *)(v44 + 16);
      v49 = *(_QWORD *)(v44 + 24);
      swift_bridgeObjectRetain();
      if (v48 >= v49 >> 1)
      {
        sub_1BA3A1C5C(v49 > 1, v48 + 1, 1);
        v44 = v65;
      }
      v45 += 2;
      *(_QWORD *)(v44 + 16) = v48 + 1;
      v50 = v44 + 16 * v48;
      *(_QWORD *)(v50 + 32) = v46;
      *(_QWORD *)(v50 + 40) = v47;
      --v43;
    }
    while (v43);
    swift_bridgeObjectRelease();
  }
  v51 = v61;
  v52 = v62;
  v53 = sub_1BA37B818(v44);
  swift_bridgeObjectRelease();
  v54 = v24;
  v55 = v60;
  if (*(_QWORD *)(v66 + 16) && *(_QWORD *)(v53 + 16))
  {
    v56 = swift_bridgeObjectRetain();
    v57 = sub_1BA41B048(v56, v53);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v32 = v57 ^ 1;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v32 = 0;
  }
  (*(void (**)(char *, uint64_t))(v59 + 8))(v64, v52);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v54, v51);
  return v32 & 1;
}

uint64_t sub_1BA41CC38()
{
  uint64_t v0;

  return sub_1BA41BF00(v0, &qword_1ED5BB280, MEMORY[0x1E0DEA968]);
}

uint64_t objectdestroyTm_1()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BA41CC98()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BA41CCBC(void **a1)
{
  uint64_t v1;

  return sub_1BA41C0B4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t)"Successfully obtained xp_ci token for campaign url: %@ && register url: %@", 74);
}

void sub_1BA41CCE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_1BA41B328(a1, a2, a3, a4, *(_QWORD *)(v4 + 16));
}

void sub_1BA41CD10(void *a1, void *a2)
{
  uint64_t v2;

  sub_1BA41AF68(a1, a2, *(void (**)(void))(v2 + 16), *(_QWORD *)(v2 + 24), *(void (**)(uint64_t, uint64_t))(v2 + 32));
}

void sub_1BA41CD20(void *a1, void *a2)
{
  uint64_t v2;

  sub_1BA41AA78(a1, a2, *(void (**)(void))(v2 + 16), *(_QWORD *)(v2 + 24), *(void (**)())(v2 + 32));
}

uint64_t storeEnumTagSinglePayload for CampaignClickRecorder.CampaignLinkRecordingError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_1BA41CD78 + 4 * byte_1BA447AE5[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_1BA41CDAC + 4 * byte_1BA447AE0[v4]))();
}

uint64_t sub_1BA41CDAC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA41CDB4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA41CDBCLL);
  return result;
}

uint64_t sub_1BA41CDC8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA41CDD0);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_1BA41CDD4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA41CDDC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CampaignClickRecorder.CampaignLinkRecordingError()
{
  return &type metadata for CampaignClickRecorder.CampaignLinkRecordingError;
}

unint64_t sub_1BA41CDFC()
{
  unint64_t result;

  result = qword_1EF28F648;
  if (!qword_1EF28F648)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA447C0C, &type metadata for CampaignClickRecorder.CampaignLinkRecordingError);
    atomic_store(result, (unint64_t *)&qword_1EF28F648);
  }
  return result;
}

unint64_t FCPostPurchaseOnboardingConfigurationType.debugDescription.getter(uint64_t a1)
{
  unint64_t result;

  result = 0xD000000000000014;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      result = 0xD00000000000001BLL;
      break;
    case 4:
    case 5:
      result = 0xD000000000000017;
      break;
    case 6:
      result = 0xD000000000000016;
      break;
    case 7:
      result = 0xD000000000000021;
      break;
    case 8:
      result = 0xD000000000000022;
      break;
    default:
      result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

unint64_t sub_1BA41CF30()
{
  uint64_t *v0;

  return FCPostPurchaseOnboardingConfigurationType.debugDescription.getter(*v0);
}

uint64_t sub_1BA41CF38(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1BA41CF70 + 4 * byte_1BA447CD0[a1]))(0x69746E6564657263, 0xEA00000000006C61);
}

uint64_t sub_1BA41CF70()
{
  return 0x496C656E6E616863;
}

uint64_t sub_1BA41CF8C()
{
  return 0x7275507070416E69;
}

uint64_t sub_1BA41CFB0()
{
  return 0x74706965636572;
}

uint64_t sub_1BA41CFC8()
{
  return 0x6C69616D65;
}

uint64_t sub_1BA41CFDC()
{
  return 0x744164616F6C7075;
}

unint64_t sub_1BA41D000()
{
  return 0xD000000000000013;
}

uint64_t sub_1BA41D01C(_QWORD *a1)
{
  __int128 *v1;
  uint64_t v2;
  __int128 *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  _BYTE v16[16];
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;

  v3 = v1;
  sub_1BA41E7E0(0, &qword_1EF28F668, MEMORY[0x1E0DED170]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v8);
  v10 = &v16[-v9];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA41E79C();
  sub_1BA438488();
  v11 = v3[1];
  v12 = *((_QWORD *)v3 + 4);
  v13 = *((_QWORD *)v3 + 5);
  v17 = *v3;
  v18 = v11;
  v19 = v12;
  v20 = v13;
  v14 = v3[4];
  v21 = v3[3];
  v22 = v14;
  v16[15] = 0;
  sub_1BA3F9504();
  sub_1BA43838C();
  if (!v2)
  {
    LOBYTE(v17) = 1;
    sub_1BA438368();
    LOBYTE(v17) = 2;
    sub_1BA438368();
    LOBYTE(v17) = 3;
    sub_1BA438368();
    LOBYTE(v17) = 4;
    sub_1BA438344();
    LOBYTE(v17) = 5;
    sub_1BA438380();
    type metadata accessor for SiwaCredentialUploadData();
    LOBYTE(v17) = 6;
    sub_1BA435FBC();
    sub_1BA3C7E94((unint64_t *)&unk_1ED5BB5E8, MEMORY[0x1E0CB0890]);
    sub_1BA43838C();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v10, v6);
}

uint64_t sub_1BA41D260@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  char v45;

  v34 = a2;
  v4 = sub_1BA435FBC();
  v37 = *(_QWORD *)(v4 - 8);
  v38 = v4;
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA41E7E0(0, &qword_1EF28F658, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x1E0DED048]);
  v9 = v8;
  v10 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v11);
  v13 = (char *)&v33 - v12;
  v14 = type metadata accessor for SiwaCredentialUploadData();
  v16 = MEMORY[0x1E0C80A78](v14, v15);
  v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((_QWORD *)v18 + 18) = 0;
  v36 = &v18[*(int *)(v16 + 40)];
  sub_1BA435F38();
  v19 = a1[3];
  v35 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v19);
  sub_1BA41E79C();
  sub_1BA43847C();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
    return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v36, v38);
  }
  else
  {
    v20 = v7;
    v45 = 0;
    sub_1BA3F9A7C();
    v21 = v9;
    sub_1BA438320();
    v22 = v40;
    v23 = v41;
    v24 = v42;
    *(_OWORD *)v18 = v39;
    *((_OWORD *)v18 + 1) = v22;
    *((_QWORD *)v18 + 4) = v23;
    *((_QWORD *)v18 + 5) = v24;
    v25 = v44;
    *((_OWORD *)v18 + 3) = v43;
    *((_OWORD *)v18 + 4) = v25;
    LOBYTE(v39) = 1;
    *((_QWORD *)v18 + 10) = sub_1BA4382FC();
    *((_QWORD *)v18 + 11) = v26;
    LOBYTE(v39) = 2;
    *((_QWORD *)v18 + 12) = sub_1BA4382FC();
    *((_QWORD *)v18 + 13) = v27;
    LOBYTE(v39) = 3;
    *((_QWORD *)v18 + 14) = sub_1BA4382FC();
    *((_QWORD *)v18 + 15) = v28;
    LOBYTE(v39) = 4;
    *((_QWORD *)v18 + 16) = sub_1BA4382CC();
    *((_QWORD *)v18 + 17) = v29;
    LOBYTE(v39) = 5;
    *((_QWORD *)v18 + 18) = sub_1BA438314();
    LOBYTE(v39) = 6;
    sub_1BA3C7E94(&qword_1ED5BEA58, MEMORY[0x1E0CB08C0]);
    v30 = v20;
    v31 = v38;
    sub_1BA438320();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v21);
    (*(void (**)(char *, char *, uint64_t))(v37 + 40))(v36, v30, v31);
    sub_1BA36FD24((uint64_t)v18, v34);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
    return sub_1BA41E638((uint64_t)v18);
  }
}

uint64_t sub_1BA41D6E0()
{
  unsigned __int8 *v0;

  return sub_1BA41CF38(*v0);
}

uint64_t sub_1BA41D6E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1BA41E9E0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BA41D70C()
{
  sub_1BA41E79C();
  return sub_1BA438494();
}

uint64_t sub_1BA41D734()
{
  sub_1BA41E79C();
  return sub_1BA4384A0();
}

uint64_t sub_1BA41D75C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BA41D260(a1, a2);
}

uint64_t sub_1BA41D770(_QWORD *a1)
{
  return sub_1BA41D01C(a1);
}

uint64_t sub_1BA41D784(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 40));
  if (qword_1EF28B128 != -1)
    swift_once();
  sub_1BA2F3474(0, (unint64_t *)&qword_1ED5BE7A0, (uint64_t (*)(uint64_t))sub_1BA32C178, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1BA43A710;
  v5 = *(_QWORD *)(a2 + 80);
  v4 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(v3 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v3 + 64) = sub_1BA307848();
  *(_QWORD *)(v3 + 32) = v5;
  *(_QWORD *)(v3 + 40) = v4;
  swift_bridgeObjectRetain();
  sub_1BA437F30();
  sub_1BA436AA8();
  v6 = swift_bridgeObjectRelease();
  MEMORY[0x1E0C80A78](v6, v7);
  sub_1BA41E748();
  swift_allocObject();
  return sub_1BA43697C();
}

uint64_t sub_1BA41D8E4(_BYTE *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint8_t *v19;
  uint64_t result;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  const char *v29;
  uint64_t v30;
  uint8_t *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v39 = a2;
  v6 = sub_1BA435FBC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for SiwaCredentialUploadData();
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*a1)
  {
    if (qword_1ED5BBF70 != -1)
      swift_once();
    v25 = sub_1BA436AD8();
    __swift_project_value_buffer(v25, (uint64_t)qword_1ED5C85E0);
    v26 = sub_1BA436AC0();
    v27 = sub_1BA437F30();
    if (!os_log_type_enabled(v26, v27))
      goto LABEL_22;
    v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v28 = 0;
    v29 = "SIWACredentialUploader successfully uploaded the credential";
LABEL_18:
    _os_log_impl(&dword_1BA2EF000, v26, v27, v29, v28, 2u);
    v31 = v28;
    goto LABEL_21;
  }
  if (*a1 != 1)
  {
    if (qword_1ED5BBF70 != -1)
      swift_once();
    v30 = sub_1BA436AD8();
    __swift_project_value_buffer(v30, (uint64_t)qword_1ED5C85E0);
    v26 = sub_1BA436AC0();
    v27 = sub_1BA437F24();
    if (!os_log_type_enabled(v26, v27))
      goto LABEL_22;
    v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v28 = 0;
    v29 = "SIWACredentialUploader failed to uploaded the credential with error. Will not retry.";
    goto LABEL_18;
  }
  v36 = a3;
  if (qword_1ED5BBF70 != -1)
    swift_once();
  v15 = sub_1BA436AD8();
  __swift_project_value_buffer(v15, (uint64_t)qword_1ED5C85E0);
  v16 = sub_1BA436AC0();
  v17 = sub_1BA437F24();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    v35 = v3;
    v19 = v18;
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_1BA2EF000, v16, v17, "SIWACredentialUploader failed to uploaded the credential with error. Error is retry eligible.", v18, 2u);
    MEMORY[0x1BCCDC430](v19, -1, -1);
  }

  a3 = v36;
  if (*(uint64_t *)(v36 + 144) > 4)
  {
    v26 = sub_1BA436AC0();
    v32 = sub_1BA437F24();
    if (!os_log_type_enabled(v26, v32))
    {
LABEL_22:

      __swift_project_boxed_opaque_existential_1((_QWORD *)(v39 + 56), *(_QWORD *)(v39 + 80));
      v34 = *(_QWORD *)(a3 + 88);
      v37 = *(_QWORD *)(a3 + 80);
      v38 = v34;
      swift_bridgeObjectRetain();
      sub_1BA437CE4();
      swift_bridgeObjectRetain();
      sub_1BA437CE4();
      swift_bridgeObjectRelease();
      sub_1BA36FAEC(v37, v38);
      swift_release();
      return swift_bridgeObjectRelease();
    }
    v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_1BA2EF000, v26, v32, "Credential upload attempts has reached a limit. Will not retry.", v33, 2u);
    v31 = v33;
LABEL_21:
    MEMORY[0x1BCCDC430](v31, -1, -1);
    goto LABEL_22;
  }
  result = sub_1BA36FD24(v36, (uint64_t)v14);
  v21 = *((_QWORD *)v14 + 18);
  v22 = __OFADD__(v21, 1);
  v23 = v21 + 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *((_QWORD *)v14 + 18) = v23;
    sub_1BA435FB0();
    (*(void (**)(char *, char *, uint64_t))(v7 + 40))(&v14[*(int *)(v11 + 40)], v10, v6);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v39 + 56), *(_QWORD *)(v39 + 80));
    v24 = *(_QWORD *)(a3 + 88);
    v37 = *(_QWORD *)(a3 + 80);
    v38 = v24;
    swift_bridgeObjectRetain();
    sub_1BA437CE4();
    swift_bridgeObjectRetain();
    sub_1BA437CE4();
    swift_bridgeObjectRelease();
    sub_1BA36F83C(v37, v38, (uint64_t)v14);
    swift_release();
    swift_bridgeObjectRelease();
    return sub_1BA41E638((uint64_t)v14);
  }
  return result;
}

void sub_1BA41DD44(void *a1)
{
  uint64_t v2;
  id v3;
  id v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSObject *oslog;
  uint64_t v11;

  if (qword_1ED5BBF70 != -1)
    swift_once();
  v2 = sub_1BA436AD8();
  __swift_project_value_buffer(v2, (uint64_t)qword_1ED5C85E0);
  v3 = a1;
  v4 = a1;
  oslog = sub_1BA436AC0();
  v5 = sub_1BA437F24();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v11 = v7;
    *(_DWORD *)v6 = 136315138;
    swift_getErrorValue();
    v8 = sub_1BA438410();
    sub_1BA348AF8(v8, v9, &v11);
    sub_1BA4380A4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1BA2EF000, oslog, v5, "SIWACredentialUploader failed to uploaded the credential with error. Will not retry: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BCCDC430](v7, -1, -1);
    MEMORY[0x1BCCDC430](v6, -1, -1);

  }
  else
  {

  }
}

uint64_t *sub_1BA41DF1C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v18)(char *, char *, uint64_t);
  char *v19;
  char *v20;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v16 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v16 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    v7 = a2[5];
    a1[4] = a2[4];
    a1[5] = v7;
    v8 = a2[7];
    a1[6] = a2[6];
    a1[7] = v8;
    v9 = a2[9];
    a1[8] = a2[8];
    a1[9] = v9;
    v10 = a2[11];
    a1[10] = a2[10];
    a1[11] = v10;
    v11 = a2[13];
    a1[12] = a2[12];
    a1[13] = v11;
    v12 = a2[15];
    a1[14] = a2[14];
    a1[15] = v12;
    v13 = a2[17];
    a1[16] = a2[16];
    a1[17] = v13;
    v14 = *(int *)(a3 + 40);
    v20 = (char *)a2 + v14;
    v19 = (char *)a1 + v14;
    a1[18] = a2[18];
    v15 = sub_1BA435FBC();
    v18 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v18(v19, v20, v15);
  }
  return v3;
}

uint64_t sub_1BA41E068(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 40);
  v5 = sub_1BA435FBC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_1BA41E0F0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v16)(char *, char *, uint64_t);
  char *v17;
  char *v18;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  v10 = a2[13];
  a1[12] = a2[12];
  a1[13] = v10;
  v11 = a2[15];
  a1[14] = a2[14];
  a1[15] = v11;
  v12 = a2[17];
  a1[16] = a2[16];
  a1[17] = v12;
  v13 = *(int *)(a3 + 40);
  v18 = (char *)a2 + v13;
  v17 = (char *)a1 + v13;
  a1[18] = a2[18];
  v14 = sub_1BA435FBC();
  v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v16(v17, v18, v14);
  return a1;
}

_QWORD *sub_1BA41E210(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  a1[13] = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[14] = a2[14];
  a1[15] = a2[15];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[16] = a2[16];
  a1[17] = a2[17];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[18] = a2[18];
  v6 = *(int *)(a3 + 40);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1BA435FBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_1BA41E394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  v6 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v6;
  v7 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  v8 = *(int *)(a3 + 40);
  v9 = a2 + v8;
  v10 = a1 + v8;
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  v11 = sub_1BA435FBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10, v9, v11);
  return a1;
}

_QWORD *sub_1BA41E418(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  v10 = a2[9];
  a1[8] = a2[8];
  a1[9] = v10;
  swift_bridgeObjectRelease();
  v11 = a2[11];
  a1[10] = a2[10];
  a1[11] = v11;
  swift_bridgeObjectRelease();
  v12 = a2[13];
  a1[12] = a2[12];
  a1[13] = v12;
  swift_bridgeObjectRelease();
  v13 = a2[15];
  a1[14] = a2[14];
  a1[15] = v13;
  swift_bridgeObjectRelease();
  v14 = a2[17];
  a1[16] = a2[16];
  a1[17] = v14;
  swift_bridgeObjectRelease();
  a1[18] = a2[18];
  v15 = *(int *)(a3 + 40);
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = sub_1BA435FBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v16, v17, v18);
  return a1;
}

uint64_t sub_1BA41E50C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BA41E518(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_1BA435FBC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 40), a2, v8);
  }
}

uint64_t sub_1BA41E594()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BA41E5A0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_1BA435FBC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 40), a2, a2, v7);
  }
  return result;
}

uint64_t sub_1BA41E614()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1BA41E638(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SiwaCredentialUploadData();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BA41E674()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for SiwaCredentialUploadData();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = v3 + *(int *)(v1 + 40);
  v5 = sub_1BA435FBC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_deallocObject();
}

void sub_1BA41E740(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v4;

  sub_1BA3F1764(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(uint64_t **)(v4 + 24));
}

void sub_1BA41E748()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF28F650)
  {
    v0 = sub_1BA436988();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF28F650);
  }
}

unint64_t sub_1BA41E79C()
{
  unint64_t result;

  result = qword_1EF28F660;
  if (!qword_1EF28F660)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA447F34, &type metadata for SiwaCredentialUploadData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF28F660);
  }
  return result;
}

void sub_1BA41E7E0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1BA41E79C();
    v7 = a3(a1, &type metadata for SiwaCredentialUploadData.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t storeEnumTagSinglePayload for SiwaCredentialUploadData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_1BA41E888 + 4 * byte_1BA447CDC[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_1BA41E8BC + 4 * byte_1BA447CD7[v4]))();
}

uint64_t sub_1BA41E8BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA41E8C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA41E8CCLL);
  return result;
}

uint64_t sub_1BA41E8D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA41E8E0);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_1BA41E8E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA41E8EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiwaCredentialUploadData.CodingKeys()
{
  return &type metadata for SiwaCredentialUploadData.CodingKeys;
}

unint64_t sub_1BA41E90C()
{
  unint64_t result;

  result = qword_1EF28F670;
  if (!qword_1EF28F670)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA447F0C, &type metadata for SiwaCredentialUploadData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF28F670);
  }
  return result;
}

unint64_t sub_1BA41E954()
{
  unint64_t result;

  result = qword_1EF28F678;
  if (!qword_1EF28F678)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA447E7C, &type metadata for SiwaCredentialUploadData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF28F678);
  }
  return result;
}

unint64_t sub_1BA41E99C()
{
  unint64_t result;

  result = qword_1EF28F680;
  if (!qword_1EF28F680)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA447EA4, &type metadata for SiwaCredentialUploadData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF28F680);
  }
  return result;
}

uint64_t sub_1BA41E9E0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x69746E6564657263 && a2 == 0xEA00000000006C61;
  if (v2 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x496C656E6E616863 && a2 == 0xE900000000000064 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7275507070416E69 && a2 == 0xEF64496573616863 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x74706965636572 && a2 == 0xE700000000000000 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6C69616D65 && a2 == 0xE500000000000000 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x744164616F6C7075 && a2 == 0xEE007374706D6574 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000001BA45BC20)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    v6 = sub_1BA4383C8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 6;
    else
      return 7;
  }
}

uint64_t dispatch thunk of PurchaseObserver.purchaseDidSucceed(purchaseContext:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of PurchaseObserver.purchaseDidSucceed(for:transaction:chargeCurrencyCode:purchaseContext:ongoingPurchaseEntry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(void))(a9 + 16))();
}

uint64_t dispatch thunk of PurchaseObserver.purchaseDidSucceedOutsideNewsApp(for:purchaseContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of PurchaseObserver.purchaseDidFail(error:purchaseContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of PurchaseObserver.purchaseDidFail(for:transactionState:transactionError:purchaseContext:ongoingPurchaseEntry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 40))();
}

uint64_t dispatch thunk of PurchaseObserver.purchaseDidFailWithInvalidReceipt(for:purchaseContext:ongoingPurchaseEntry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 48))();
}

uint64_t sub_1BA41ED50@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  __int128 v4;
  uint64_t v5;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA2F2B7C(0, (unint64_t *)&unk_1ED5C2180);
  result = sub_1BA436448();
  if (v5)
    return sub_1BA2F3654(&v4, a2);
  __break(1u);
  return result;
}

uint64_t sub_1BA41EDD4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BA2FA568(a1, (uint64_t (*)(_QWORD))type metadata accessor for PurchaseContextEntriesManager, (uint64_t (*)(uint64_t))sub_1BA357018, (uint64_t)&off_1E7217C28, a2);
}

id sub_1BA41EDF0(_QWORD *a1)
{
  id result;
  uint64_t v2;
  objc_class *v3;
  char *v4;
  char *v5;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA2F2B7C(0, (unint64_t *)&unk_1ED5C2130);
  result = (id)sub_1BA436448();
  if (v7)
  {
    v2 = v8;
    v3 = (objc_class *)type metadata accessor for BridgedFamilyStatusManager();
    v4 = (char *)objc_allocWithZone(v3);
    v5 = &v4[OBJC_IVAR____TtC16NewsSubscription26BridgedFamilyStatusManager_familyStatusManager];
    *(_QWORD *)v5 = v7;
    *((_QWORD *)v5 + 1) = v2;
    v6.receiver = v4;
    v6.super_class = v3;
    return objc_msgSendSuper2(&v6, sel_init);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BA41EE9C(_QWORD *a1)
{
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  _BYTE *v5;
  _QWORD *v6;
  id v7;
  void (*v8)(id, _UNKNOWN **);
  id v9;
  objc_super v10;
  uint64_t v11;
  uint64_t v12;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA2F2B7C(0, &qword_1ED5C2088);
  result = sub_1BA436448();
  v2 = v11;
  if (v11)
  {
    v3 = v12;
    v4 = (objc_class *)type metadata accessor for SubscriptionActivationEligibilityProvider();
    v5 = objc_allocWithZone(v4);
    *(_QWORD *)&v5[OBJC_IVAR____TtC16NewsSubscription41SubscriptionActivationEligibilityProvider_observers] = MEMORY[0x1E0DEE9D8];
    v5[OBJC_IVAR____TtC16NewsSubscription41SubscriptionActivationEligibilityProvider_didProcessInitialOffer] = 0;
    v6 = &v5[OBJC_IVAR____TtC16NewsSubscription41SubscriptionActivationEligibilityProvider_offerManager];
    *v6 = v2;
    v6[1] = v3;
    v10.receiver = v5;
    v10.super_class = v4;
    swift_unknownObjectRetain();
    v7 = objc_msgSendSuper2(&v10, sel_init);
    swift_getObjectType();
    v8 = *(void (**)(id, _UNKNOWN **))(v3 + 72);
    v9 = v7;
    v8(v9, &off_1E721BBE8);

    swift_unknownObjectRelease();
    return (uint64_t)v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BA41EFBC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_1BA41EFE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1BA41ED50((_QWORD *)(v1 + 16), a1);
}

char *sub_1BA41EFE8(double a1, double a2, double a3, double a4)
{
  char *v4;
  objc_class *ObjectType;
  uint64_t v10;
  id v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  objc_super v18;

  ObjectType = (objc_class *)swift_getObjectType();
  v10 = OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintFooterView_button;
  v11 = objc_allocWithZone((Class)sub_1BA436C88());
  v12 = v4;
  *(_QWORD *)&v4[v10] = objc_msgSend(v11, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v13 = OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintFooterView_privacyLabel;
  type metadata accessor for UnselectableLinkEnabledTextView();
  *(_QWORD *)&v12[v13] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v18.receiver = v12;
  v18.super_class = ObjectType;
  v14 = (char *)objc_msgSendSuper2(&v18, sel_initWithFrame_, a1, a2, a3, a4);
  v15 = *(_QWORD *)&v14[OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintFooterView_button];
  v16 = v14;
  objc_msgSend(v16, sel_addSubview_, v15);
  objc_msgSend(v16, sel_addSubview_, *(_QWORD *)&v16[OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintFooterView_privacyLabel]);

  return v16;
}

uint64_t type metadata accessor for HideMyEmailSignupBlueprintFooterView()
{
  return objc_opt_self();
}

id sub_1BA41F27C()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;

  v1 = *v0;
  v2 = (void *)sub_1BA436C7C();

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintFooterView_privacyLabel), sel_setDelegate_, 0);
}

void sub_1BA41F2D0()
{
  sub_1BA41F32C(&qword_1EF28F4D8, (uint64_t)&unk_1BA448070);
  JUMPOUT(0x1BCCDAE28);
}

uint64_t sub_1BA41F308()
{
  return sub_1BA41F32C((unint64_t *)&unk_1EF28F6C0, (uint64_t)&unk_1BA448038);
}

uint64_t sub_1BA41F32C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for HideMyEmailSignupBlueprintFooterView();
    result = MEMORY[0x1BCCDC37C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for PaywallHostType(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF)
    v3 = swift_unknownObjectRetain();
  *a1 = v3;
  return a1;
}

unint64_t destroy for PaywallHostType(unint64_t *a1)
{
  unint64_t result;

  result = *a1;
  if (result >= 0xFFFFFFFF)
    return swift_unknownObjectRelease();
  return result;
}

unint64_t *assignWithCopy for PaywallHostType(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a1;
  v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF)
      swift_unknownObjectRetain();
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_unknownObjectRelease();
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
  }
  return a1;
}

unint64_t *assignWithTake for PaywallHostType(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a2;
  if (*a1 < 0xFFFFFFFF)
    goto LABEL_5;
  if (v3 < 0xFFFFFFFF)
  {
    swift_unknownObjectRelease();
LABEL_5:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_unknownObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PaywallHostType(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 > 0x7FFFFFF9 && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 2147483642);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 5;
  if (v4 >= 7)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PaywallHostType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFA)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 2147483642;
    if (a3 >= 0x7FFFFFFA)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFA)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 5;
  }
  return result;
}

ValueMetadata *type metadata accessor for PaywallHostType()
{
  return &type metadata for PaywallHostType;
}

uint64_t dispatch thunk of PurchaseOriginatorIdentifier.sourceChannelID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PurchaseOriginatorIdentifier.sessionID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t AMSBuyParams.purchaseID.getter()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  v1 = objc_msgSend(v0, sel_dictionary);
  if (!v1)
  {
    v8 = 0u;
    v9 = 0u;
LABEL_12:
    sub_1BA319F10((uint64_t)&v8);
    return 0;
  }
  v2 = v1;
  v3 = sub_1BA437BD0();

  strcpy((char *)&v8, "salableAdamId");
  HIWORD(v8) = -4864;
  sub_1BA438194();
  if (*(_QWORD *)(v3 + 16) && (v4 = sub_1BA31A9F4((uint64_t)&v7), (v5 & 1) != 0))
  {
    sub_1BA31AA58(*(_QWORD *)(v3 + 56) + 32 * v4, (uint64_t)&v8);
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_1BA31AA24((uint64_t)&v7);
  if (!*((_QWORD *)&v9 + 1))
    goto LABEL_12;
  if (swift_dynamicCast())
    return v7;
  else
    return 0;
}

uint64_t static String.manageSubscriptionURL.getter()
{
  return sub_1BA41F718((uint64_t *)&unk_1EF28F730);
}

uint64_t static String.manageSubscriptionURL.setter(uint64_t a1, uint64_t a2)
{
  return sub_1BA41F778(a1, a2, qword_1EF28F730, &qword_1EF28F730[1]);
}

uint64_t (*static String.manageSubscriptionURL.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t static String.flexiblePaywall.getter()
{
  return sub_1BA41F718(&qword_1EF28F740);
}

uint64_t sub_1BA41F718(uint64_t *a1)
{
  uint64_t v2;

  swift_beginAccess();
  v2 = *a1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t static String.flexiblePaywall.setter(uint64_t a1, uint64_t a2)
{
  return sub_1BA41F778(a1, a2, &qword_1EF28F740, &qword_1EF28F748);
}

uint64_t sub_1BA41F778(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  swift_beginAccess();
  *a3 = a1;
  *a4 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static String.flexiblePaywall.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

__n128 __swift_memcpy128_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t getEnumTagSinglePayload for HideMyEmailSignupBlueprintHeaderLayoutAttributes(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 128))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for HideMyEmailSignupBlueprintHeaderLayoutAttributes(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 128) = v3;
  return result;
}

ValueMetadata *type metadata accessor for HideMyEmailSignupBlueprintHeaderLayoutAttributes()
{
  return &type metadata for HideMyEmailSignupBlueprintHeaderLayoutAttributes;
}

uint64_t PurchaseConversionLocation.pageContext.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)nullsub_4 + 4 * byte_1BA448150[*v0]))(0x6E776F6E6B6E55, 0xE700000000000000);
}

uint64_t sub_1BA41F8E8()
{
  return 0x656C6369747241;
}

uint64_t sub_1BA41F8FC()
{
  return 0x6C656E6E616843;
}

uint64_t sub_1BA41F910()
{
  return 0x6C63697472416E49;
}

uint64_t sub_1BA41F930()
{
  return 0x6441646565466E49;
}

unint64_t sub_1BA41F948()
{
  return 0xD000000000000014;
}

uint64_t sub_1BA41F964()
{
  return 0x50676E69646E614CLL;
}

uint64_t sub_1BA41F984()
{
  return 0x2B7377654ELL;
}

uint64_t sub_1BA41F998()
{
  return 0x6F69647541;
}

uint64_t sub_1BA41F9AC()
{
  return 0x6575737349666450;
}

uint64_t sub_1BA41F9C4()
{
  return 0x656C7A7A7550;
}

uint64_t sub_1BA41F9D8()
{
  return 0x73614D7961646F54;
}

NewsSubscription::PurchaseConversionLocation_optional __swiftcall PurchaseConversionLocation.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  NewsSubscription::PurchaseConversionLocation_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1BA4382C0();
  result.value = swift_bridgeObjectRelease();
  v5 = 16;
  if (v3 < 0x10)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t PurchaseConversionLocation.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1BA41FA84 + 4 * byte_1BA448160[*v0]))(0x6E776F6E6B6E75, 0xE700000000000000);
}

uint64_t sub_1BA41FA84()
{
  return 0x747241664F706F74;
}

uint64_t sub_1BA41FAA4()
{
  return 0x616843664F706F74;
}

uint64_t sub_1BA41FAC4()
{
  return 0x7779615064726168;
}

uint64_t sub_1BA41FAE4()
{
  return 0x6974737265746E69;
}

uint64_t sub_1BA41FB08()
{
  return 0x6C63697472416E69;
}

uint64_t sub_1BA41FB28()
{
  return 0x6441646565466E69;
}

unint64_t sub_1BA41FB40()
{
  return 0xD000000000000014;
}

uint64_t sub_1BA41FB78()
{
  return 0x50676E69646E616CLL;
}

uint64_t sub_1BA41FB98()
{
  return 0x656E697A6167616DLL;
}

unint64_t sub_1BA41FBB8()
{
  return 0xD000000000000012;
}

uint64_t sub_1BA41FBD4()
{
  return 0x6565466F69647561;
}

uint64_t sub_1BA41FBF0()
{
  return 0x6664506575737369;
}

uint64_t sub_1BA41FC08()
{
  return 0x656C7A7A7570;
}

uint64_t sub_1BA41FC1C()
{
  return 0x73614D7961646F74;
}

uint64_t sub_1BA41FC40()
{
  return sub_1BA3187E8();
}

uint64_t sub_1BA41FC4C()
{
  sub_1BA43844C();
  PurchaseConversionLocation.rawValue.getter();
  sub_1BA437CB4();
  swift_bridgeObjectRelease();
  return sub_1BA438470();
}

uint64_t sub_1BA41FCB0()
{
  PurchaseConversionLocation.rawValue.getter();
  sub_1BA437CB4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BA41FD00()
{
  sub_1BA43844C();
  PurchaseConversionLocation.rawValue.getter();
  sub_1BA437CB4();
  swift_bridgeObjectRelease();
  return sub_1BA438470();
}

NewsSubscription::PurchaseConversionLocation_optional sub_1BA41FD60(Swift::String *a1)
{
  return PurchaseConversionLocation.init(rawValue:)(*a1);
}

uint64_t sub_1BA41FD6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = PurchaseConversionLocation.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1BA41FD90()
{
  sub_1BA420324();
  return sub_1BA437DA4();
}

uint64_t sub_1BA41FDEC()
{
  sub_1BA420324();
  return sub_1BA437D8C();
}

NewsSubscription::PurchaseUserAction_optional __swiftcall PurchaseUserAction.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  NewsSubscription::PurchaseUserAction_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1BA4382C0();
  result.value = swift_bridgeObjectRelease();
  v5 = 5;
  if (v3 < 5)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t PurchaseUserAction.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1BA41FEC0 + 4 * byte_1BA448170[*v0]))(0x6E776F6E6B6E75, 0xE700000000000000);
}

uint64_t sub_1BA41FEC0()
{
  return 0x6B6E694C70656564;
}

unint64_t sub_1BA41FED8()
{
  return 0xD000000000000016;
}

unint64_t sub_1BA41FF30()
{
  unint64_t result;

  result = qword_1EF28F750;
  if (!qword_1EF28F750)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for PurchaseConversionLocation, &type metadata for PurchaseConversionLocation);
    atomic_store(result, (unint64_t *)&qword_1EF28F750);
  }
  return result;
}

void sub_1BA41FF74(char *a1)
{
  sub_1BA31911C(*a1);
}

unint64_t sub_1BA41FF84()
{
  unint64_t result;

  result = qword_1EF28F758;
  if (!qword_1EF28F758)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for PurchaseUserAction, &type metadata for PurchaseUserAction);
    atomic_store(result, (unint64_t *)&qword_1EF28F758);
  }
  return result;
}

void sub_1BA41FFC8()
{
  char *v0;

  sub_1BA326F5C(*v0);
}

void sub_1BA41FFD0(uint64_t a1)
{
  char *v1;

  sub_1BA372F48(a1, *v1);
}

void sub_1BA41FFD8(uint64_t a1)
{
  char *v1;

  sub_1BA327250(a1, *v1);
}

NewsSubscription::PurchaseUserAction_optional sub_1BA41FFE0(Swift::String *a1)
{
  return PurchaseUserAction.init(rawValue:)(*a1);
}

uint64_t sub_1BA41FFEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = PurchaseUserAction.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1BA420010()
{
  sub_1BA4202E0();
  return sub_1BA437DA4();
}

uint64_t sub_1BA42006C()
{
  sub_1BA4202E0();
  return sub_1BA437D8C();
}

uint64_t getEnumTagSinglePayload for PurchaseConversionLocation(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF1)
    goto LABEL_17;
  if (a2 + 15 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 15) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 15;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 15;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 15;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x10;
  v8 = v6 - 16;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PurchaseConversionLocation(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 15 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 15) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF1)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF0)
    return ((uint64_t (*)(void))((char *)&loc_1BA420194 + 4 * byte_1BA44817A[v4]))();
  *a1 = a2 + 15;
  return ((uint64_t (*)(void))((char *)sub_1BA4201C8 + 4 * byte_1BA448175[v4]))();
}

uint64_t sub_1BA4201C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA4201D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA4201D8);
  return result;
}

uint64_t sub_1BA4201E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA4201ECLL);
  *(_BYTE *)result = a2 + 15;
  return result;
}

uint64_t sub_1BA4201F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA4201F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PurchaseConversionLocation()
{
  return &type metadata for PurchaseConversionLocation;
}

uint64_t storeEnumTagSinglePayload for PurchaseUserAction(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_1BA420260 + 4 * byte_1BA448184[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1BA420294 + 4 * byte_1BA44817F[v4]))();
}

uint64_t sub_1BA420294(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA42029C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA4202A4);
  return result;
}

uint64_t sub_1BA4202B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA4202B8);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1BA4202BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA4202C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PurchaseUserAction()
{
  return &type metadata for PurchaseUserAction;
}

unint64_t sub_1BA4202E0()
{
  unint64_t result;

  result = qword_1ED5BB720;
  if (!qword_1ED5BB720)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for PurchaseUserAction, &type metadata for PurchaseUserAction);
    atomic_store(result, (unint64_t *)&qword_1ED5BB720);
  }
  return result;
}

unint64_t sub_1BA420324()
{
  unint64_t result;

  result = qword_1ED5BB830;
  if (!qword_1ED5BB830)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for PurchaseConversionLocation, &type metadata for PurchaseConversionLocation);
    atomic_store(result, (unint64_t *)&qword_1ED5BB830);
  }
  return result;
}

uint64_t sub_1BA420368(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1BA4203A0 + 4 * byte_1BA448400[a1]))(0x6573616863727570, 0xEA00000000004449);
}

uint64_t sub_1BA4203A0()
{
  return 0x6843656372756F73;
}

uint64_t sub_1BA4203C4()
{
  return 0x6E656B6F5471;
}

uint64_t sub_1BA4203D8()
{
  return 0x6E676961706D6163;
}

uint64_t sub_1BA4203EC()
{
  return 0x6563697270;
}

unint64_t sub_1BA420400()
{
  return 0xD000000000000015;
}

uint64_t sub_1BA42041C()
{
  return 0x4664657669727261;
}

uint64_t sub_1BA420440()
{
  unsigned __int8 *v0;

  return sub_1BA420368(*v0);
}

uint64_t sub_1BA420448@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1BA421324(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BA42046C()
{
  sub_1BA4206E0();
  return sub_1BA438494();
}

uint64_t sub_1BA420494()
{
  sub_1BA4206E0();
  return sub_1BA4384A0();
}

uint64_t PurchaseAdContext.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];

  sub_1BA420B48(0, &qword_1EF28F760, MEMORY[0x1E0DED170]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v6);
  v8 = &v10[-v7];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA4206E0();
  sub_1BA438488();
  v10[15] = 0;
  sub_1BA438368();
  if (!v1)
  {
    v10[14] = 1;
    sub_1BA438368();
    v10[13] = 2;
    sub_1BA438368();
    v10[12] = 3;
    sub_1BA438344();
    v10[11] = 4;
    sub_1BA438368();
    type metadata accessor for PurchaseAdContext();
    v10[10] = 5;
    sub_1BA435FBC();
    sub_1BA3C7E94((unint64_t *)&unk_1ED5BB5E8, MEMORY[0x1E0CB0890]);
    sub_1BA43838C();
    v10[9] = 6;
    sub_1BA438374();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v8, v4);
}

unint64_t sub_1BA4206E0()
{
  unint64_t result;

  result = qword_1EF28F768;
  if (!qword_1EF28F768)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA448594, &type metadata for PurchaseAdContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF28F768);
  }
  return result;
}

uint64_t PurchaseAdContext.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  _QWORD v28[2];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  char *v34;
  char v35;
  char v36;
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;

  v29 = a2;
  v3 = sub_1BA435FBC();
  v30 = *(_QWORD *)(v3 - 8);
  v31 = v3;
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA420B48(0, &qword_1EF28F770, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x1E0DED048]);
  v32 = v7;
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)v28 - v10;
  v12 = type metadata accessor for PurchaseAdContext();
  MEMORY[0x1E0C80A78](v12, v13);
  v15 = (_QWORD *)((char *)v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = a1[3];
  v33 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  sub_1BA4206E0();
  v17 = v34;
  sub_1BA43847C();
  if (v17)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  v34 = v6;
  v18 = v31;
  v19 = v32;
  v41 = 0;
  *v15 = sub_1BA4382FC();
  v15[1] = v20;
  v40 = 1;
  v15[2] = sub_1BA4382FC();
  v15[3] = v21;
  v39 = 2;
  v15[4] = sub_1BA4382FC();
  v15[5] = v22;
  v38 = 3;
  v15[6] = sub_1BA4382CC();
  v15[7] = v23;
  v37 = 4;
  v28[1] = 0;
  v24 = v18;
  v15[8] = sub_1BA4382FC();
  v15[9] = v25;
  v36 = 5;
  sub_1BA3C7E94(&qword_1ED5BEA58, MEMORY[0x1E0CB08C0]);
  v26 = v34;
  sub_1BA438320();
  (*(void (**)(char *, char *, uint64_t))(v30 + 32))((char *)v15 + *(int *)(v12 + 36), v26, v24);
  v35 = 6;
  LOBYTE(v26) = sub_1BA438308();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v19);
  *((_BYTE *)v15 + *(int *)(v12 + 40)) = v26 & 1;
  sub_1BA38B208((uint64_t)v15, v29);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  return sub_1BA3B4DDC((uint64_t)v15);
}

void sub_1BA420B48(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1BA4206E0();
    v7 = a3(a1, &type metadata for PurchaseAdContext.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_1BA420BA4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return PurchaseAdContext.init(from:)(a1, a2);
}

uint64_t sub_1BA420BB8(_QWORD *a1)
{
  return PurchaseAdContext.encode(to:)(a1);
}

_QWORD *initializeBufferWithCopyOfBuffer for PurchaseAdContext(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  char *v17;
  char *v18;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    v10 = a2[7];
    a1[6] = a2[6];
    a1[7] = v10;
    v11 = a2[9];
    v12 = *(int *)(a3 + 36);
    v17 = (char *)a2 + v12;
    v18 = (char *)a1 + v12;
    a1[8] = a2[8];
    a1[9] = v11;
    v13 = sub_1BA435FBC();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v18, v17, v13);
    *((_BYTE *)v4 + *(int *)(a3 + 40)) = *((_BYTE *)a2 + *(int *)(a3 + 40));
  }
  return v4;
}

uint64_t destroy for PurchaseAdContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 36);
  v5 = sub_1BA435FBC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for PurchaseAdContext(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  char *v15;

  v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  v8 = a2[7];
  a1[6] = a2[6];
  a1[7] = v8;
  v9 = a2[9];
  v10 = *(int *)(a3 + 36);
  v15 = (char *)a1 + v10;
  v11 = (char *)a2 + v10;
  a1[8] = a2[8];
  a1[9] = v9;
  v12 = sub_1BA435FBC();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v15, v11, v12);
  *((_BYTE *)a1 + *(int *)(a3 + 40)) = *((_BYTE *)a2 + *(int *)(a3 + 40));
  return a1;
}

_QWORD *assignWithCopy for PurchaseAdContext(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 36);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1BA435FBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *((_BYTE *)a1 + *(int *)(a3 + 40)) = *((_BYTE *)a2 + *(int *)(a3 + 40));
  return a1;
}

_OWORD *initializeWithTake for PurchaseAdContext(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  v8 = *(int *)(a3 + 36);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_1BA435FBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  *((_BYTE *)a1 + *(int *)(a3 + 40)) = *((_BYTE *)a2 + *(int *)(a3 + 40));
  return a1;
}

_QWORD *assignWithTake for PurchaseAdContext(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  v10 = a2[9];
  a1[8] = a2[8];
  a1[9] = v10;
  swift_bridgeObjectRelease();
  v11 = *(int *)(a3 + 36);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = sub_1BA435FBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  *((_BYTE *)a1 + *(int *)(a3 + 40)) = *((_BYTE *)a2 + *(int *)(a3 + 40));
  return a1;
}

uint64_t getEnumTagSinglePayload for PurchaseAdContext()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BA421084(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_1BA435FBC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 36), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for PurchaseAdContext()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BA42110C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_1BA435FBC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 36), a2, a2, v7);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for PurchaseAdContext.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_1BA4211CC + 4 * byte_1BA44840C[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_1BA421200 + 4 * byte_1BA448407[v4]))();
}

uint64_t sub_1BA421200(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA421208(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA421210);
  return result;
}

uint64_t sub_1BA42121C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA421224);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_1BA421228(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA421230(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PurchaseAdContext.CodingKeys()
{
  return &type metadata for PurchaseAdContext.CodingKeys;
}

unint64_t sub_1BA421250()
{
  unint64_t result;

  result = qword_1EF28F778;
  if (!qword_1EF28F778)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA44856C, &type metadata for PurchaseAdContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF28F778);
  }
  return result;
}

unint64_t sub_1BA421298()
{
  unint64_t result;

  result = qword_1EF28F780;
  if (!qword_1EF28F780)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA4484DC, &type metadata for PurchaseAdContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF28F780);
  }
  return result;
}

unint64_t sub_1BA4212E0()
{
  unint64_t result;

  result = qword_1EF28F788;
  if (!qword_1EF28F788)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA448504, &type metadata for PurchaseAdContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF28F788);
  }
  return result;
}

uint64_t sub_1BA421324(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6573616863727570 && a2 == 0xEA00000000004449;
  if (v2 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6843656372756F73 && a2 == 0xEF44496C656E6E61 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E656B6F5471 && a2 == 0xE600000000000000 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E676961706D6163 && a2 == 0xEA00000000004449 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6563697270 && a2 == 0xE500000000000000 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000001BA45BD90 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x4664657669727261 && a2 == 0xED000064416D6F72)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    v6 = sub_1BA4383C8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 6;
    else
      return 7;
  }
}

uint64_t destroy for PaywallConfig(_QWORD *a1)
{
  if (*a1 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[13] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[26] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[39] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[52] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PaywallConfig(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;

  if (*(_QWORD *)a2 == 1)
  {
    v4 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v4;
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    v6 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v6;
  }
  else
  {
    v7 = *(_QWORD *)(a2 + 8);
    v8 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v7;
    v9 = *(_QWORD *)(a2 + 24);
    v10 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 16) = v8;
    *(_QWORD *)(a1 + 24) = v9;
    v11 = *(_QWORD *)(a2 + 40);
    v12 = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 32) = v10;
    *(_QWORD *)(a1 + 40) = v11;
    v13 = *(_QWORD *)(a2 + 56);
    v14 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 48) = v12;
    *(_QWORD *)(a1 + 56) = v13;
    v15 = *(_QWORD *)(a2 + 80);
    v74 = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 64) = v14;
    *(_QWORD *)(a1 + 72) = v74;
    v16 = *(_QWORD *)(a2 + 88);
    v79 = *(_QWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 80) = v15;
    *(_QWORD *)(a1 + 88) = v16;
    *(_QWORD *)(a1 + 96) = v79;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  v17 = *(_QWORD *)(a2 + 104);
  if (v17 == 1)
  {
    v18 = *(_OWORD *)(a2 + 184);
    *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
    *(_OWORD *)(a1 + 184) = v18;
    *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
    v19 = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 120) = v19;
    v20 = *(_OWORD *)(a2 + 152);
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
    *(_OWORD *)(a1 + 152) = v20;
  }
  else
  {
    v21 = *(_QWORD *)(a2 + 112);
    v22 = *(_QWORD *)(a2 + 120);
    *(_QWORD *)(a1 + 104) = v17;
    *(_QWORD *)(a1 + 112) = v21;
    v23 = *(_QWORD *)(a2 + 128);
    v24 = *(_QWORD *)(a2 + 136);
    *(_QWORD *)(a1 + 120) = v22;
    *(_QWORD *)(a1 + 128) = v23;
    v25 = *(_QWORD *)(a2 + 144);
    v26 = *(_QWORD *)(a2 + 152);
    *(_QWORD *)(a1 + 136) = v24;
    *(_QWORD *)(a1 + 144) = v25;
    v27 = *(_QWORD *)(a2 + 160);
    v28 = *(_QWORD *)(a2 + 168);
    *(_QWORD *)(a1 + 152) = v26;
    *(_QWORD *)(a1 + 160) = v27;
    v29 = *(_QWORD *)(a2 + 184);
    v75 = *(_QWORD *)(a2 + 176);
    *(_QWORD *)(a1 + 168) = v28;
    *(_QWORD *)(a1 + 176) = v75;
    v30 = *(_QWORD *)(a2 + 192);
    v80 = *(_QWORD *)(a2 + 200);
    *(_QWORD *)(a1 + 184) = v29;
    *(_QWORD *)(a1 + 192) = v30;
    *(_QWORD *)(a1 + 200) = v80;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  v31 = *(_QWORD *)(a2 + 208);
  if (v31 == 1)
  {
    v32 = *(_OWORD *)(a2 + 288);
    *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
    *(_OWORD *)(a1 + 288) = v32;
    *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
    v33 = *(_OWORD *)(a2 + 224);
    *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
    *(_OWORD *)(a1 + 224) = v33;
    v34 = *(_OWORD *)(a2 + 256);
    *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
    *(_OWORD *)(a1 + 256) = v34;
  }
  else
  {
    v35 = *(_QWORD *)(a2 + 216);
    v36 = *(_QWORD *)(a2 + 224);
    *(_QWORD *)(a1 + 208) = v31;
    *(_QWORD *)(a1 + 216) = v35;
    v37 = *(_QWORD *)(a2 + 232);
    v38 = *(_QWORD *)(a2 + 240);
    *(_QWORD *)(a1 + 224) = v36;
    *(_QWORD *)(a1 + 232) = v37;
    v39 = *(_QWORD *)(a2 + 248);
    v40 = *(_QWORD *)(a2 + 256);
    *(_QWORD *)(a1 + 240) = v38;
    *(_QWORD *)(a1 + 248) = v39;
    v41 = *(_QWORD *)(a2 + 264);
    v42 = *(_QWORD *)(a2 + 272);
    *(_QWORD *)(a1 + 256) = v40;
    *(_QWORD *)(a1 + 264) = v41;
    v43 = *(_QWORD *)(a2 + 288);
    v76 = *(_QWORD *)(a2 + 280);
    *(_QWORD *)(a1 + 272) = v42;
    *(_QWORD *)(a1 + 280) = v76;
    v44 = *(_QWORD *)(a2 + 296);
    v81 = *(_QWORD *)(a2 + 304);
    *(_QWORD *)(a1 + 288) = v43;
    *(_QWORD *)(a1 + 296) = v44;
    *(_QWORD *)(a1 + 304) = v81;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  v45 = *(_QWORD *)(a2 + 312);
  if (v45 == 1)
  {
    v46 = *(_OWORD *)(a2 + 392);
    *(_OWORD *)(a1 + 376) = *(_OWORD *)(a2 + 376);
    *(_OWORD *)(a1 + 392) = v46;
    *(_QWORD *)(a1 + 408) = *(_QWORD *)(a2 + 408);
    v47 = *(_OWORD *)(a2 + 328);
    *(_OWORD *)(a1 + 312) = *(_OWORD *)(a2 + 312);
    *(_OWORD *)(a1 + 328) = v47;
    v48 = *(_OWORD *)(a2 + 360);
    *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 344);
    *(_OWORD *)(a1 + 360) = v48;
  }
  else
  {
    v49 = *(_QWORD *)(a2 + 320);
    v50 = *(_QWORD *)(a2 + 328);
    *(_QWORD *)(a1 + 312) = v45;
    *(_QWORD *)(a1 + 320) = v49;
    v51 = *(_QWORD *)(a2 + 336);
    v52 = *(_QWORD *)(a2 + 344);
    *(_QWORD *)(a1 + 328) = v50;
    *(_QWORD *)(a1 + 336) = v51;
    v53 = *(_QWORD *)(a2 + 352);
    v54 = *(_QWORD *)(a2 + 360);
    *(_QWORD *)(a1 + 344) = v52;
    *(_QWORD *)(a1 + 352) = v53;
    v55 = *(_QWORD *)(a2 + 368);
    v56 = *(_QWORD *)(a2 + 376);
    *(_QWORD *)(a1 + 360) = v54;
    *(_QWORD *)(a1 + 368) = v55;
    v57 = *(_QWORD *)(a2 + 392);
    v77 = *(_QWORD *)(a2 + 384);
    *(_QWORD *)(a1 + 376) = v56;
    *(_QWORD *)(a1 + 384) = v77;
    v58 = *(_QWORD *)(a2 + 400);
    v82 = *(_QWORD *)(a2 + 408);
    *(_QWORD *)(a1 + 392) = v57;
    *(_QWORD *)(a1 + 400) = v58;
    *(_QWORD *)(a1 + 408) = v82;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  v59 = *(_QWORD *)(a2 + 416);
  if (v59 == 1)
  {
    v60 = *(_OWORD *)(a2 + 496);
    *(_OWORD *)(a1 + 480) = *(_OWORD *)(a2 + 480);
    *(_OWORD *)(a1 + 496) = v60;
    *(_QWORD *)(a1 + 512) = *(_QWORD *)(a2 + 512);
    v61 = *(_OWORD *)(a2 + 432);
    *(_OWORD *)(a1 + 416) = *(_OWORD *)(a2 + 416);
    *(_OWORD *)(a1 + 432) = v61;
    v62 = *(_OWORD *)(a2 + 464);
    *(_OWORD *)(a1 + 448) = *(_OWORD *)(a2 + 448);
    *(_OWORD *)(a1 + 464) = v62;
  }
  else
  {
    v63 = *(_QWORD *)(a2 + 424);
    v64 = *(_QWORD *)(a2 + 432);
    *(_QWORD *)(a1 + 416) = v59;
    *(_QWORD *)(a1 + 424) = v63;
    v65 = *(_QWORD *)(a2 + 440);
    v66 = *(_QWORD *)(a2 + 448);
    *(_QWORD *)(a1 + 432) = v64;
    *(_QWORD *)(a1 + 440) = v65;
    v67 = *(_QWORD *)(a2 + 456);
    v68 = *(_QWORD *)(a2 + 464);
    *(_QWORD *)(a1 + 448) = v66;
    *(_QWORD *)(a1 + 456) = v67;
    v69 = *(_QWORD *)(a2 + 472);
    v70 = *(_QWORD *)(a2 + 480);
    *(_QWORD *)(a1 + 464) = v68;
    *(_QWORD *)(a1 + 472) = v69;
    v71 = *(_QWORD *)(a2 + 496);
    v78 = *(_QWORD *)(a2 + 488);
    *(_QWORD *)(a1 + 480) = v70;
    *(_QWORD *)(a1 + 488) = v78;
    v72 = *(_QWORD *)(a2 + 504);
    v83 = *(_QWORD *)(a2 + 512);
    *(_QWORD *)(a1 + 496) = v71;
    *(_QWORD *)(a1 + 504) = v72;
    *(_QWORD *)(a1 + 512) = v83;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  *(_QWORD *)(a1 + 520) = *(_QWORD *)(a2 + 520);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PaywallConfig(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 *v16;
  uint64_t v17;
  __int128 *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 *v29;
  uint64_t v30;
  __int128 *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 *v42;
  __int128 *v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 *v55;
  __int128 *v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;

  v4 = *(_QWORD *)a1;
  v5 = *a2;
  if (v4 == 1)
  {
    if (v5 == 1)
    {
      v6 = *(_OWORD *)a2;
      v7 = *((_OWORD *)a2 + 2);
      *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
      *(_OWORD *)(a1 + 32) = v7;
      *(_OWORD *)a1 = v6;
      v8 = *((_OWORD *)a2 + 3);
      v9 = *((_OWORD *)a2 + 4);
      v10 = *((_OWORD *)a2 + 5);
      *(_QWORD *)(a1 + 96) = a2[12];
      *(_OWORD *)(a1 + 64) = v9;
      *(_OWORD *)(a1 + 80) = v10;
      *(_OWORD *)(a1 + 48) = v8;
    }
    else
    {
      *(_QWORD *)a1 = v5;
      *(_QWORD *)(a1 + 8) = a2[1];
      *(_QWORD *)(a1 + 16) = a2[2];
      *(_QWORD *)(a1 + 24) = a2[3];
      *(_QWORD *)(a1 + 32) = a2[4];
      *(_QWORD *)(a1 + 40) = a2[5];
      *(_QWORD *)(a1 + 48) = a2[6];
      *(_QWORD *)(a1 + 56) = a2[7];
      *(_QWORD *)(a1 + 64) = a2[8];
      *(_QWORD *)(a1 + 72) = a2[9];
      *(_QWORD *)(a1 + 80) = a2[10];
      *(_QWORD *)(a1 + 88) = a2[11];
      *(_QWORD *)(a1 + 96) = a2[12];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v5 == 1)
  {
    sub_1BA422A68(a1);
    v12 = *((_OWORD *)a2 + 1);
    v11 = *((_OWORD *)a2 + 2);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v12;
    *(_OWORD *)(a1 + 32) = v11;
    v14 = *((_OWORD *)a2 + 4);
    v13 = *((_OWORD *)a2 + 5);
    v15 = *((_OWORD *)a2 + 3);
    *(_QWORD *)(a1 + 96) = a2[12];
    *(_OWORD *)(a1 + 64) = v14;
    *(_OWORD *)(a1 + 80) = v13;
    *(_OWORD *)(a1 + 48) = v15;
  }
  else
  {
    *(_QWORD *)a1 = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 8) = a2[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 16) = a2[2];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 24) = a2[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 32) = a2[4];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 40) = a2[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 48) = a2[6];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 56) = a2[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 64) = a2[8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 72) = a2[9];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 80) = a2[10];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 88) = a2[11];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 96) = a2[12];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  v16 = (__int128 *)(a1 + 104);
  v18 = (__int128 *)(a2 + 13);
  v17 = a2[13];
  if (*(_QWORD *)(a1 + 104) == 1)
  {
    if (v17 == 1)
    {
      v19 = *v18;
      v20 = *(_OWORD *)(a2 + 17);
      *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 15);
      *(_OWORD *)(a1 + 136) = v20;
      *v16 = v19;
      v21 = *(_OWORD *)(a2 + 19);
      v22 = *(_OWORD *)(a2 + 21);
      v23 = *(_OWORD *)(a2 + 23);
      *(_QWORD *)(a1 + 200) = a2[25];
      *(_OWORD *)(a1 + 168) = v22;
      *(_OWORD *)(a1 + 184) = v23;
      *(_OWORD *)(a1 + 152) = v21;
    }
    else
    {
      *(_QWORD *)(a1 + 104) = v17;
      *(_QWORD *)(a1 + 112) = a2[14];
      *(_QWORD *)(a1 + 120) = a2[15];
      *(_QWORD *)(a1 + 128) = a2[16];
      *(_QWORD *)(a1 + 136) = a2[17];
      *(_QWORD *)(a1 + 144) = a2[18];
      *(_QWORD *)(a1 + 152) = a2[19];
      *(_QWORD *)(a1 + 160) = a2[20];
      *(_QWORD *)(a1 + 168) = a2[21];
      *(_QWORD *)(a1 + 176) = a2[22];
      *(_QWORD *)(a1 + 184) = a2[23];
      *(_QWORD *)(a1 + 192) = a2[24];
      *(_QWORD *)(a1 + 200) = a2[25];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v17 == 1)
  {
    sub_1BA422A68(a1 + 104);
    v25 = *(_OWORD *)(a2 + 15);
    v24 = *(_OWORD *)(a2 + 17);
    *v16 = *v18;
    *(_OWORD *)(a1 + 120) = v25;
    *(_OWORD *)(a1 + 136) = v24;
    v27 = *(_OWORD *)(a2 + 21);
    v26 = *(_OWORD *)(a2 + 23);
    v28 = *(_OWORD *)(a2 + 19);
    *(_QWORD *)(a1 + 200) = a2[25];
    *(_OWORD *)(a1 + 168) = v27;
    *(_OWORD *)(a1 + 184) = v26;
    *(_OWORD *)(a1 + 152) = v28;
  }
  else
  {
    *(_QWORD *)(a1 + 104) = v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 112) = a2[14];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 120) = a2[15];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 128) = a2[16];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 136) = a2[17];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 144) = a2[18];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 152) = a2[19];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 160) = a2[20];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 168) = a2[21];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 176) = a2[22];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 184) = a2[23];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 192) = a2[24];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 200) = a2[25];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  v29 = (__int128 *)(a1 + 208);
  v31 = (__int128 *)(a2 + 26);
  v30 = a2[26];
  if (*(_QWORD *)(a1 + 208) == 1)
  {
    if (v30 == 1)
    {
      v32 = *v31;
      v33 = *((_OWORD *)a2 + 15);
      *(_OWORD *)(a1 + 224) = *((_OWORD *)a2 + 14);
      *(_OWORD *)(a1 + 240) = v33;
      *v29 = v32;
      v34 = *((_OWORD *)a2 + 16);
      v35 = *((_OWORD *)a2 + 17);
      v36 = *((_OWORD *)a2 + 18);
      *(_QWORD *)(a1 + 304) = a2[38];
      *(_OWORD *)(a1 + 272) = v35;
      *(_OWORD *)(a1 + 288) = v36;
      *(_OWORD *)(a1 + 256) = v34;
    }
    else
    {
      *(_QWORD *)(a1 + 208) = v30;
      *(_QWORD *)(a1 + 216) = a2[27];
      *(_QWORD *)(a1 + 224) = a2[28];
      *(_QWORD *)(a1 + 232) = a2[29];
      *(_QWORD *)(a1 + 240) = a2[30];
      *(_QWORD *)(a1 + 248) = a2[31];
      *(_QWORD *)(a1 + 256) = a2[32];
      *(_QWORD *)(a1 + 264) = a2[33];
      *(_QWORD *)(a1 + 272) = a2[34];
      *(_QWORD *)(a1 + 280) = a2[35];
      *(_QWORD *)(a1 + 288) = a2[36];
      *(_QWORD *)(a1 + 296) = a2[37];
      *(_QWORD *)(a1 + 304) = a2[38];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v30 == 1)
  {
    sub_1BA422A68(a1 + 208);
    v38 = *((_OWORD *)a2 + 14);
    v37 = *((_OWORD *)a2 + 15);
    *v29 = *v31;
    *(_OWORD *)(a1 + 224) = v38;
    *(_OWORD *)(a1 + 240) = v37;
    v40 = *((_OWORD *)a2 + 17);
    v39 = *((_OWORD *)a2 + 18);
    v41 = *((_OWORD *)a2 + 16);
    *(_QWORD *)(a1 + 304) = a2[38];
    *(_OWORD *)(a1 + 272) = v40;
    *(_OWORD *)(a1 + 288) = v39;
    *(_OWORD *)(a1 + 256) = v41;
  }
  else
  {
    *(_QWORD *)(a1 + 208) = v30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 216) = a2[27];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 224) = a2[28];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 232) = a2[29];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 240) = a2[30];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 248) = a2[31];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 256) = a2[32];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 264) = a2[33];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 272) = a2[34];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 280) = a2[35];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 288) = a2[36];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 296) = a2[37];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 304) = a2[38];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  v42 = (__int128 *)(a1 + 312);
  v43 = (__int128 *)(a2 + 39);
  v44 = a2[39];
  if (*(_QWORD *)(a1 + 312) == 1)
  {
    if (v44 == 1)
    {
      v45 = *v43;
      v46 = *(_OWORD *)(a2 + 43);
      *(_OWORD *)(a1 + 328) = *(_OWORD *)(a2 + 41);
      *(_OWORD *)(a1 + 344) = v46;
      *v42 = v45;
      v47 = *(_OWORD *)(a2 + 45);
      v48 = *(_OWORD *)(a2 + 47);
      v49 = *(_OWORD *)(a2 + 49);
      *(_QWORD *)(a1 + 408) = a2[51];
      *(_OWORD *)(a1 + 376) = v48;
      *(_OWORD *)(a1 + 392) = v49;
      *(_OWORD *)(a1 + 360) = v47;
    }
    else
    {
      *(_QWORD *)(a1 + 312) = v44;
      *(_QWORD *)(a1 + 320) = a2[40];
      *(_QWORD *)(a1 + 328) = a2[41];
      *(_QWORD *)(a1 + 336) = a2[42];
      *(_QWORD *)(a1 + 344) = a2[43];
      *(_QWORD *)(a1 + 352) = a2[44];
      *(_QWORD *)(a1 + 360) = a2[45];
      *(_QWORD *)(a1 + 368) = a2[46];
      *(_QWORD *)(a1 + 376) = a2[47];
      *(_QWORD *)(a1 + 384) = a2[48];
      *(_QWORD *)(a1 + 392) = a2[49];
      *(_QWORD *)(a1 + 400) = a2[50];
      *(_QWORD *)(a1 + 408) = a2[51];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v44 == 1)
  {
    sub_1BA422A68(a1 + 312);
    v51 = *(_OWORD *)(a2 + 41);
    v50 = *(_OWORD *)(a2 + 43);
    *v42 = *v43;
    *(_OWORD *)(a1 + 328) = v51;
    *(_OWORD *)(a1 + 344) = v50;
    v53 = *(_OWORD *)(a2 + 47);
    v52 = *(_OWORD *)(a2 + 49);
    v54 = *(_OWORD *)(a2 + 45);
    *(_QWORD *)(a1 + 408) = a2[51];
    *(_OWORD *)(a1 + 376) = v53;
    *(_OWORD *)(a1 + 392) = v52;
    *(_OWORD *)(a1 + 360) = v54;
  }
  else
  {
    *(_QWORD *)(a1 + 312) = v44;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 320) = a2[40];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 328) = a2[41];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 336) = a2[42];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 344) = a2[43];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 352) = a2[44];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 360) = a2[45];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 368) = a2[46];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 376) = a2[47];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 384) = a2[48];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 392) = a2[49];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 400) = a2[50];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 408) = a2[51];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  v55 = (__int128 *)(a1 + 416);
  v56 = (__int128 *)(a2 + 52);
  v57 = a2[52];
  if (*(_QWORD *)(a1 + 416) == 1)
  {
    if (v57 == 1)
    {
      v58 = *v56;
      v59 = *((_OWORD *)a2 + 28);
      *(_OWORD *)(a1 + 432) = *((_OWORD *)a2 + 27);
      *(_OWORD *)(a1 + 448) = v59;
      *v55 = v58;
      v60 = *((_OWORD *)a2 + 29);
      v61 = *((_OWORD *)a2 + 30);
      v62 = *((_OWORD *)a2 + 31);
      *(_QWORD *)(a1 + 512) = a2[64];
      *(_OWORD *)(a1 + 480) = v61;
      *(_OWORD *)(a1 + 496) = v62;
      *(_OWORD *)(a1 + 464) = v60;
    }
    else
    {
      *(_QWORD *)(a1 + 416) = v57;
      *(_QWORD *)(a1 + 424) = a2[53];
      *(_QWORD *)(a1 + 432) = a2[54];
      *(_QWORD *)(a1 + 440) = a2[55];
      *(_QWORD *)(a1 + 448) = a2[56];
      *(_QWORD *)(a1 + 456) = a2[57];
      *(_QWORD *)(a1 + 464) = a2[58];
      *(_QWORD *)(a1 + 472) = a2[59];
      *(_QWORD *)(a1 + 480) = a2[60];
      *(_QWORD *)(a1 + 488) = a2[61];
      *(_QWORD *)(a1 + 496) = a2[62];
      *(_QWORD *)(a1 + 504) = a2[63];
      *(_QWORD *)(a1 + 512) = a2[64];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v57 == 1)
  {
    sub_1BA422A68(a1 + 416);
    v64 = *((_OWORD *)a2 + 27);
    v63 = *((_OWORD *)a2 + 28);
    *v55 = *v56;
    *(_OWORD *)(a1 + 432) = v64;
    *(_OWORD *)(a1 + 448) = v63;
    v66 = *((_OWORD *)a2 + 30);
    v65 = *((_OWORD *)a2 + 31);
    v67 = *((_OWORD *)a2 + 29);
    *(_QWORD *)(a1 + 512) = a2[64];
    *(_OWORD *)(a1 + 480) = v66;
    *(_OWORD *)(a1 + 496) = v65;
    *(_OWORD *)(a1 + 464) = v67;
  }
  else
  {
    *(_QWORD *)(a1 + 416) = v57;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 424) = a2[53];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 432) = a2[54];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 440) = a2[55];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 448) = a2[56];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 456) = a2[57];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 464) = a2[58];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 472) = a2[59];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 480) = a2[60];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 488) = a2[61];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 496) = a2[62];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 504) = a2[63];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 512) = a2[64];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  *(_QWORD *)(a1 + 520) = a2[65];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1BA422A68(uint64_t a1)
{
  destroy for PaywallResourceByLocationConfig();
  return a1;
}

void *__swift_memcpy528_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x210uLL);
}

uint64_t assignWithTake for PaywallConfig(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  if (*(_QWORD *)a1 == 1)
    goto LABEL_4;
  if (*(_QWORD *)a2 == 1)
  {
    sub_1BA422A68(a1);
LABEL_4:
    v4 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v4;
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    v6 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v6;
    goto LABEL_6;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
LABEL_6:
  v7 = *(_QWORD *)(a2 + 104);
  if (*(_QWORD *)(a1 + 104) == 1)
  {
LABEL_9:
    v8 = *(_OWORD *)(a2 + 184);
    *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
    *(_OWORD *)(a1 + 184) = v8;
    *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
    v9 = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 120) = v9;
    v10 = *(_OWORD *)(a2 + 152);
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
    *(_OWORD *)(a1 + 152) = v10;
    goto LABEL_11;
  }
  if (v7 == 1)
  {
    sub_1BA422A68(a1 + 104);
    goto LABEL_9;
  }
  *(_QWORD *)(a1 + 104) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  swift_bridgeObjectRelease();
LABEL_11:
  v11 = *(_QWORD *)(a2 + 208);
  if (*(_QWORD *)(a1 + 208) == 1)
  {
LABEL_14:
    v12 = *(_OWORD *)(a2 + 288);
    *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
    *(_OWORD *)(a1 + 288) = v12;
    *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
    v13 = *(_OWORD *)(a2 + 224);
    *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
    *(_OWORD *)(a1 + 224) = v13;
    v14 = *(_OWORD *)(a2 + 256);
    *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
    *(_OWORD *)(a1 + 256) = v14;
    goto LABEL_16;
  }
  if (v11 == 1)
  {
    sub_1BA422A68(a1 + 208);
    goto LABEL_14;
  }
  *(_QWORD *)(a1 + 208) = v11;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  swift_bridgeObjectRelease();
LABEL_16:
  if (*(_QWORD *)(a1 + 312) == 1)
  {
LABEL_19:
    v16 = *(_OWORD *)(a2 + 392);
    *(_OWORD *)(a1 + 376) = *(_OWORD *)(a2 + 376);
    *(_OWORD *)(a1 + 392) = v16;
    *(_QWORD *)(a1 + 408) = *(_QWORD *)(a2 + 408);
    v17 = *(_OWORD *)(a2 + 328);
    *(_OWORD *)(a1 + 312) = *(_OWORD *)(a2 + 312);
    *(_OWORD *)(a1 + 328) = v17;
    v18 = *(_OWORD *)(a2 + 360);
    *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 344);
    *(_OWORD *)(a1 + 360) = v18;
    goto LABEL_21;
  }
  v15 = *(_QWORD *)(a2 + 312);
  if (v15 == 1)
  {
    sub_1BA422A68(a1 + 312);
    goto LABEL_19;
  }
  *(_QWORD *)(a1 + 312) = v15;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a2 + 320);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 344) = *(_QWORD *)(a2 + 344);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 352) = *(_QWORD *)(a2 + 352);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 360) = *(_QWORD *)(a2 + 360);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 376) = *(_QWORD *)(a2 + 376);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 384) = *(_QWORD *)(a2 + 384);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 392) = *(_QWORD *)(a2 + 392);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 400) = *(_QWORD *)(a2 + 400);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 408) = *(_QWORD *)(a2 + 408);
  swift_bridgeObjectRelease();
LABEL_21:
  if (*(_QWORD *)(a1 + 416) != 1)
  {
    v19 = *(_QWORD *)(a2 + 416);
    if (v19 != 1)
    {
      *(_QWORD *)(a1 + 416) = v19;
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 424) = *(_QWORD *)(a2 + 424);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 432) = *(_QWORD *)(a2 + 432);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 440) = *(_QWORD *)(a2 + 440);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 448) = *(_QWORD *)(a2 + 448);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 456) = *(_QWORD *)(a2 + 456);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 464) = *(_QWORD *)(a2 + 464);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 472) = *(_QWORD *)(a2 + 472);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 480) = *(_QWORD *)(a2 + 480);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 488) = *(_QWORD *)(a2 + 488);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 496) = *(_QWORD *)(a2 + 496);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 504) = *(_QWORD *)(a2 + 504);
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 512) = *(_QWORD *)(a2 + 512);
      swift_bridgeObjectRelease();
      goto LABEL_26;
    }
    sub_1BA422A68(a1 + 416);
  }
  v20 = *(_OWORD *)(a2 + 496);
  *(_OWORD *)(a1 + 480) = *(_OWORD *)(a2 + 480);
  *(_OWORD *)(a1 + 496) = v20;
  *(_QWORD *)(a1 + 512) = *(_QWORD *)(a2 + 512);
  v21 = *(_OWORD *)(a2 + 432);
  *(_OWORD *)(a1 + 416) = *(_OWORD *)(a2 + 416);
  *(_OWORD *)(a1 + 432) = v21;
  v22 = *(_OWORD *)(a2 + 464);
  *(_OWORD *)(a1 + 448) = *(_OWORD *)(a2 + 448);
  *(_OWORD *)(a1 + 464) = v22;
LABEL_26:
  *(_QWORD *)(a1 + 520) = *(_QWORD *)(a2 + 520);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PaywallConfig(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 528))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 520);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PaywallConfig(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 520) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 528) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 528) = 0;
    if (a2)
      *(_QWORD *)(result + 520) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for PaywallConfig()
{
  return &type metadata for PaywallConfig;
}

uint64_t destroy for PaywallResourceByLocationConfig()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for PaywallResourceByLocationConfig(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for PaywallResourceByLocationConfig(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PaywallResourceByLocationConfig(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PaywallResourceByLocationConfig(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 104))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PaywallResourceByLocationConfig(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 104) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 104) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for PaywallResourceByLocationConfig()
{
  return &type metadata for PaywallResourceByLocationConfig;
}

uint64_t sub_1BA4235E8(__int128 *a1)
{
  const void *v1;
  const void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  const void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60[33];
  uint64_t v61[13];
  uint64_t v62[13];
  _OWORD v63[6];
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  _OWORD v72[6];
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82[66];
  _QWORD v83[66];
  uint64_t v84;
  _OWORD v85[33];
  _BYTE v86[528];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;

  v2 = v1;
  memcpy(v86, v2, sizeof(v86));
  sub_1BA2F3474(0, &qword_1ED5BECE8, (uint64_t (*)(uint64_t))type metadata accessor for PaywallResource, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v6 = MEMORY[0x1E0C80A78](v4, v5);
  v8 = (uint64_t *)((char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v6, v9);
  v11 = (uint64_t *)((char *)&v50 - v10);
  v12 = a1[7];
  v13 = a1[5];
  v93 = a1[6];
  v94 = v12;
  v14 = a1[7];
  v15 = a1[9];
  v95 = a1[8];
  v96 = v15;
  v16 = a1[3];
  v17 = a1[1];
  v89 = a1[2];
  v90 = v16;
  v18 = a1[3];
  v19 = a1[5];
  v91 = a1[4];
  v92 = v19;
  v20 = a1[1];
  v87 = *a1;
  v88 = v20;
  v60[6] = v93;
  v60[7] = v14;
  v21 = a1[9];
  v60[8] = v95;
  v60[9] = v21;
  v60[2] = v89;
  v60[3] = v18;
  v60[4] = v91;
  v60[5] = v13;
  v60[0] = v87;
  v60[1] = v17;
  sub_1BA320C44((uint64_t)v2 + 520, (uint64_t)&v81, (uint64_t (*)(_QWORD))sub_1BA428220);
  sub_1BA320C44((uint64_t)&v81, (uint64_t)&v84, (uint64_t (*)(_QWORD))sub_1BA428220);
  v22 = v84;
  if (!v84)
    goto LABEL_6;
  v23 = a1[7];
  v85[6] = a1[6];
  v85[7] = v23;
  v24 = a1[9];
  v85[8] = a1[8];
  v85[9] = v24;
  v25 = a1[3];
  v85[2] = a1[2];
  v85[3] = v25;
  v26 = a1[5];
  v85[4] = a1[4];
  v85[5] = v26;
  v27 = a1[1];
  v85[0] = *a1;
  v85[1] = v27;
  PaywallModel.tag.getter();
  v29 = objc_msgSend(v28, sel_identifier);
  swift_unknownObjectRelease();
  v30 = sub_1BA437C3C();
  v32 = v31;

  if (!*(_QWORD *)(v22 + 16) || (v33 = sub_1BA31A888(v30, v32), (v34 & 1) == 0))
  {
    swift_bridgeObjectRelease();
LABEL_6:
    sub_1BA3848DC(v83);
    goto LABEL_7;
  }
  v35 = (const void *)(*(_QWORD *)(v22 + 56) + 528 * v33);
  memcpy(v82, v35, sizeof(v82));
  memmove(v83, v35, 0x210uLL);
  nullsub_1(v83);
  sub_1BA384948(v82);
  swift_bridgeObjectRelease();
LABEL_7:
  sub_1BA4282A0((uint64_t)v83, (uint64_t)v85, (unint64_t *)&unk_1ED5C07B0);
  sub_1BA4282A0((uint64_t)v85, (uint64_t)v83, (unint64_t *)&unk_1ED5C07B0);
  sub_1BA4282EC(v60, (uint64_t)v83, v61);
  sub_1BA384C44((uint64_t)v85);
  sub_1BA4282A0((uint64_t)v61, (uint64_t)v72, (unint64_t *)&unk_1ED5BFA40);
  if (*(_QWORD *)&v72[0] != 1)
  {
    v78 = v72[4];
    v79 = v72[5];
    v80 = v73;
    v74 = v72[0];
    v75 = v72[1];
    v77 = v72[3];
    v76 = v72[2];
    sub_1BA426AA8((uint64_t)&v87);
    v37 = v36;
    sub_1BA391830(v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1BA384FC4);
    if (v37)
    {
      v38 = type metadata accessor for PaywallResource();
      sub_1BA2F25C8(&qword_1ED5BEC98, (uint64_t (*)(uint64_t))type metadata accessor for PaywallResource, (uint64_t)&unk_1BA4486D0);
      sub_1BA437E04();
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 48))(v11, 1, v38) != 1)
      {
        v46 = *v11;
        v47 = v11[1];
        swift_bridgeObjectRetain();
        sub_1BA3000D8((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for PaywallResource);
        if (qword_1ED5C0D40 == -1)
          goto LABEL_21;
        goto LABEL_23;
      }
      sub_1BA4263CC((uint64_t)v11);
    }
  }
  v56 = v93;
  v57 = v94;
  v58 = v95;
  v59 = v96;
  v52 = v89;
  v53 = v90;
  v54 = v91;
  v55 = v92;
  v50 = v87;
  v51 = v88;
  memcpy(v60, v86, sizeof(v60));
  nullsub_1(v60);
  sub_1BA4282A0((uint64_t)v60, (uint64_t)v82, (unint64_t *)&unk_1ED5C07B0);
  sub_1BA4282EC(&v50, (uint64_t)v82, v62);
  sub_1BA4282A0((uint64_t)v62, (uint64_t)v63, (unint64_t *)&unk_1ED5BFA40);
  if (*(_QWORD *)&v63[0] == 1)
    goto LABEL_15;
  v69 = v63[4];
  v70 = v63[5];
  v71 = v64;
  v65 = v63[0];
  v66 = v63[1];
  v68 = v63[3];
  v67 = v63[2];
  sub_1BA426AA8((uint64_t)&v87);
  v40 = v39;
  sub_1BA391830(v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1BA384FC4);
  if (!v40)
    goto LABEL_15;
  v41 = type metadata accessor for PaywallResource();
  sub_1BA2F25C8(&qword_1ED5BEC98, (uint64_t (*)(uint64_t))type metadata accessor for PaywallResource, (uint64_t)&unk_1BA4486D0);
  sub_1BA437E04();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 48))(v8, 1, v41) != 1)
  {
    v46 = *v8;
    v47 = v8[1];
    swift_bridgeObjectRetain();
    sub_1BA3000D8((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for PaywallResource);
    if (qword_1ED5C0D40 == -1)
    {
LABEL_21:
      sub_1BA2F3474(0, (unint64_t *)&qword_1ED5BE7A0, (uint64_t (*)(uint64_t))sub_1BA32C178, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
      v48 = swift_allocObject();
      *(_OWORD *)(v48 + 16) = xmmword_1BA43A710;
      *(_QWORD *)(v48 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v48 + 64) = sub_1BA307848();
      *(_QWORD *)(v48 + 32) = v46;
      *(_QWORD *)(v48 + 40) = v47;
      swift_bridgeObjectRetain();
      sub_1BA437F30();
      sub_1BA436AA8();
      swift_bridgeObjectRelease();
      return v46;
    }
LABEL_23:
    swift_once();
    goto LABEL_21;
  }
  sub_1BA4263CC((uint64_t)v8);
LABEL_15:
  if (qword_1ED5C0D40 != -1)
    swift_once();
  sub_1BA2F3474(0, (unint64_t *)&qword_1ED5BE7A0, (uint64_t (*)(uint64_t))sub_1BA32C178, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_1BA43A710;
  v56 = v93;
  v57 = v94;
  v58 = v95;
  v59 = v96;
  v52 = v89;
  v53 = v90;
  v54 = v91;
  v55 = v92;
  v50 = v87;
  v51 = v88;
  v43 = PaywallModel.description.getter();
  v45 = v44;
  *(_QWORD *)(v42 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v42 + 64) = sub_1BA307848();
  *(_QWORD *)(v42 + 32) = v43;
  *(_QWORD *)(v42 + 40) = v45;
  sub_1BA437F30();
  sub_1BA436AA8();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1BA423D58(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  _QWORD *v58;
  _QWORD *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  _QWORD *v76;
  _QWORD *v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  _QWORD *v94;
  _QWORD *v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  int64_t v104;
  _QWORD *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  _QWORD *v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  int64_t v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  _QWORD *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  _QWORD *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  unint64_t v163;
  uint64_t v164;
  unint64_t v165;
  _QWORD *v166;
  uint64_t v167;
  uint64_t v168;
  _QWORD *v169;
  unint64_t v170;
  uint64_t v171;
  unint64_t v172;
  uint64_t v173;
  _QWORD *v174;
  unint64_t v175;
  unint64_t v176;
  _QWORD *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  unint64_t v183;
  _QWORD *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  unint64_t v192;
  unint64_t v193;
  _QWORD *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  unint64_t v198;
  unint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  unint64_t v207;
  uint64_t v208;
  unint64_t v209;
  _QWORD *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  unint64_t v215;
  uint64_t v216;
  unint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  unint64_t v226;
  unint64_t v227;
  _QWORD *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  unint64_t v242;
  unint64_t v243;
  _QWORD *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  unint64_t *v249;
  unint64_t v250;
  uint64_t v251;
  uint64_t v252;
  unint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  unint64_t v257;
  uint64_t inited;
  _QWORD *v259;
  uint64_t v260;
  _QWORD *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  _QWORD *v265;
  uint64_t v266;
  uint64_t v267;
  unint64_t v268;
  unint64_t v269;
  _QWORD *v270;
  uint64_t v271;
  uint64_t *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v276;
  int64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  unint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  unint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  _QWORD *v294;
  uint64_t v295;
  int64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  __int128 v330;
  uint64_t v331;
  _QWORD *v332;
  uint64_t v333;
  unint64_t v334;
  unint64_t v335;
  uint64_t v336;
  uint64_t v337;
  unint64_t v338;
  uint64_t v339;
  uint64_t v340;
  unint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  _QWORD *v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  _QWORD *v350;
  _QWORD *v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354[16];
  uint64_t v355;
  _QWORD *v356;
  _QWORD v357[13];
  _QWORD v358[13];
  _QWORD v359[13];
  _QWORD v360[13];
  _QWORD v361[14];

  v352 = a1;
  sub_1BA2F3474(0, &qword_1ED5BECE8, (uint64_t (*)(uint64_t))type metadata accessor for PaywallResource, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v2, v3);
  v353 = (uint64_t)&v276 - v4;
  v349 = type metadata accessor for PaywallResource();
  v348 = *(_QWORD *)(v349 - 8);
  MEMORY[0x1E0C80A78](v349, v5);
  v351 = (uint64_t *)((char *)&v276 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BA426368();
  v280 = v7;
  v8 = (_QWORD *)swift_allocObject();
  sub_1BA4282A0(v1, (uint64_t)v361, (unint64_t *)&unk_1ED5BFA40);
  v346 = v8 + 4;
  sub_1BA4282A0((uint64_t)v361, (uint64_t)(v8 + 4), (unint64_t *)&unk_1ED5BFA40);
  sub_1BA4282A0(v1 + 104, (uint64_t)v360, (unint64_t *)&unk_1ED5BFA40);
  sub_1BA4282A0((uint64_t)v360, (uint64_t)(v8 + 17), (unint64_t *)&unk_1ED5BFA40);
  sub_1BA4282A0(v1 + 208, (uint64_t)v359, (unint64_t *)&unk_1ED5BFA40);
  sub_1BA4282A0((uint64_t)v359, (uint64_t)(v8 + 30), (unint64_t *)&unk_1ED5BFA40);
  sub_1BA4282A0(v1 + 312, (uint64_t)v358, (unint64_t *)&unk_1ED5BFA40);
  sub_1BA4282A0((uint64_t)v358, (uint64_t)(v8 + 43), (unint64_t *)&unk_1ED5BFA40);
  v347 = v1;
  sub_1BA4282A0(v1 + 416, (uint64_t)v357, (unint64_t *)&unk_1ED5BFA40);
  sub_1BA4282A0((uint64_t)v357, (uint64_t)(v8 + 56), (unint64_t *)&unk_1ED5BFA40);
  v9 = v8[4];
  v10 = v8[5];
  v342 = v8[6];
  v341 = v8[7];
  v343 = v8[8];
  v340 = v8[9];
  v345 = v8[10];
  v11 = v8[12];
  v344 = v8[11];
  v13 = v8[13];
  v12 = v8[14];
  v14 = v8[15];
  v15 = v8[16];
  sub_1BA391830(v361, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1BA384B64);
  sub_1BA391830(v360, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1BA384B64);
  sub_1BA391830(v359, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1BA384B64);
  sub_1BA391830(v358, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1BA384B64);
  sub_1BA391830(v357, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1BA384B64);
  if (v9 != 1)
  {
    v334 = v15;
    v335 = v14;
    v336 = v12;
    v337 = v13;
    v338 = v11;
    v339 = v10;
    v16 = v342;
    v17 = v341;
    v18 = v340;
    sub_1BA384B64(v9);
    v19 = sub_1BA31A28C(0, 1, 1, MEMORY[0x1E0DEE9D8]);
    v15 = v19[2];
    v20 = v19[3];
    v350 = v19;
    v21 = v15 + 1;
    if (v15 >= v20 >> 1)
      goto LABEL_109;
    goto LABEL_4;
  }
  v350 = (_QWORD *)MEMORY[0x1E0DEE9D8];
LABEL_5:
  v18 = v8[17];
  if (v18 != 1)
  {
    v29 = v8[18];
    v28 = v8[19];
    v30 = v8[21];
    v334 = v8[20];
    v335 = v28;
    v31 = v8[22];
    v32 = v8[23];
    v33 = v8[24];
    v34 = v8[25];
    v35 = v8[26];
    v36 = v8[28];
    v345 = v8[27];
    v37 = v8[29];
    v336 = v35;
    v337 = v37;
    swift_bridgeObjectRetain();
    v340 = v18;
    swift_bridgeObjectRetain();
    v341 = v29;
    v18 = v334;
    v38 = v335;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v344 = v30;
    swift_bridgeObjectRetain();
    v343 = v31;
    swift_bridgeObjectRetain();
    v342 = v32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v339 = v34;
    v9 = v336;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v338 = v36;
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v350 = sub_1BA31A28C(0, v350[2] + 1, 1, v350);
    v15 = v350[2];
    v39 = v350[3];
    if (v15 >= v39 >> 1)
      v350 = sub_1BA31A28C((_QWORD *)(v39 > 1), v15 + 1, 1, v350);
    v40 = v350;
    v350[2] = v15 + 1;
    v41 = &v40[13 * v15];
    v42 = v341;
    v41[4] = v340;
    v41[5] = v42;
    v41[6] = v38;
    v41[7] = v18;
    v43 = v343;
    v41[8] = v344;
    v41[9] = v43;
    v41[10] = v342;
    v41[11] = v33;
    v41[12] = v339;
    v41[13] = v9;
    v44 = v338;
    v41[14] = v345;
    v41[15] = v44;
    v41[16] = v337;
  }
  v17 = v8[30];
  if (v17 != 1)
  {
    v46 = v8[31];
    v45 = v8[32];
    v48 = v8[33];
    v47 = v8[34];
    v49 = v8[35];
    v50 = v8[36];
    v51 = v8[37];
    v334 = v8[38];
    v335 = v51;
    v52 = v8[39];
    v53 = v8[40];
    v54 = v8[42];
    v336 = v8[41];
    v337 = v52;
    v338 = v54;
    swift_bridgeObjectRetain();
    v339 = v17;
    swift_bridgeObjectRetain();
    v340 = v46;
    v17 = v334;
    v55 = v335;
    swift_bridgeObjectRetain();
    v345 = v45;
    swift_bridgeObjectRetain();
    v341 = v48;
    v18 = v336;
    swift_bridgeObjectRetain();
    v342 = v47;
    v56 = v337;
    swift_bridgeObjectRetain();
    v344 = v49;
    swift_bridgeObjectRetain();
    v343 = v50;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9 = v53;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v350 = sub_1BA31A28C(0, v350[2] + 1, 1, v350);
    v15 = v350[2];
    v57 = v350[3];
    if (v15 >= v57 >> 1)
      v350 = sub_1BA31A28C((_QWORD *)(v57 > 1), v15 + 1, 1, v350);
    v58 = v350;
    v350[2] = v15 + 1;
    v59 = &v58[13 * v15];
    v60 = v340;
    v59[4] = v339;
    v59[5] = v60;
    v61 = v341;
    v59[6] = v345;
    v59[7] = v61;
    v62 = v344;
    v59[8] = v342;
    v59[9] = v62;
    v59[10] = v343;
    v59[11] = v55;
    v59[12] = v17;
    v59[13] = v56;
    v59[14] = v9;
    v59[15] = v18;
    v59[16] = v338;
  }
  v63 = v8[43];
  if (v63 != 1)
  {
    v65 = v8[44];
    v64 = v8[45];
    v67 = v8[46];
    v66 = v8[47];
    v68 = v8[48];
    v345 = v8[49];
    v69 = v8[50];
    v70 = v8[51];
    v9 = v8[52];
    v71 = v8[53];
    v336 = v64;
    v337 = v71;
    v72 = v8[55];
    v335 = v8[54];
    v338 = v72;
    swift_bridgeObjectRetain();
    v339 = v63;
    v73 = v70;
    swift_bridgeObjectRetain();
    v340 = v65;
    v18 = v336;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v341 = v67;
    v17 = v335;
    swift_bridgeObjectRetain();
    v342 = v66;
    v74 = v337;
    swift_bridgeObjectRetain();
    v344 = v68;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v343 = v69;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v350 = sub_1BA31A28C(0, v350[2] + 1, 1, v350);
    v15 = v350[2];
    v75 = v350[3];
    if (v15 >= v75 >> 1)
      v350 = sub_1BA31A28C((_QWORD *)(v75 > 1), v15 + 1, 1, v350);
    v76 = v350;
    v350[2] = v15 + 1;
    v77 = &v76[13 * v15];
    v78 = v340;
    v77[4] = v339;
    v77[5] = v78;
    v79 = v341;
    v77[6] = v18;
    v77[7] = v79;
    v80 = v344;
    v77[8] = v342;
    v77[9] = v80;
    v81 = v343;
    v77[10] = v345;
    v77[11] = v81;
    v77[12] = v73;
    v77[13] = v9;
    v77[14] = v74;
    v77[15] = v17;
    v77[16] = v338;
  }
  v82 = v8[56];
  if (v82 != 1)
  {
    v84 = v8[57];
    v83 = v8[58];
    v86 = v8[59];
    v85 = v8[60];
    v87 = v8[61];
    v345 = v8[62];
    v88 = v8[63];
    v89 = v8[64];
    v9 = v8[65];
    v90 = v8[66];
    v336 = v83;
    v337 = v90;
    v335 = v8[67];
    v338 = v8[68];
    swift_bridgeObjectRetain();
    v339 = v82;
    v91 = v89;
    swift_bridgeObjectRetain();
    v340 = v84;
    v18 = v336;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v341 = v86;
    v17 = v335;
    swift_bridgeObjectRetain();
    v342 = v85;
    v92 = v337;
    swift_bridgeObjectRetain();
    v344 = v87;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v343 = v88;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v350 = sub_1BA31A28C(0, v350[2] + 1, 1, v350);
    v15 = v350[2];
    v93 = v350[3];
    if (v15 >= v93 >> 1)
      v350 = sub_1BA31A28C((_QWORD *)(v93 > 1), v15 + 1, 1, v350);
    v94 = v350;
    v350[2] = v15 + 1;
    v95 = &v94[13 * v15];
    v96 = v340;
    v95[4] = v339;
    v95[5] = v96;
    v97 = v341;
    v95[6] = v18;
    v95[7] = v97;
    v98 = v344;
    v95[8] = v342;
    v95[9] = v98;
    v99 = v343;
    v95[10] = v345;
    v95[11] = v99;
    v95[12] = v91;
    v95[13] = v9;
    v95[14] = v92;
    v95[15] = v17;
    v95[16] = v338;
  }
  swift_setDeallocating();
  sub_1BA2FC080(0, (unint64_t *)&unk_1ED5BFA40);
  v279 = v100;
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v356 = v350;
  v16 = *(_QWORD *)(v347 + 520);
  if (v16)
  {
    v101 = *(_QWORD *)(v16 + 64);
    v276 = v16 + 64;
    v102 = 1 << *(_BYTE *)(v16 + 32);
    v103 = -1;
    if (v102 < 64)
      v103 = ~(-1 << v102);
    v21 = v103 & v101;
    v277 = (unint64_t)(v102 + 63) >> 6;
    swift_bridgeObjectRetain_n();
    v104 = 0;
    v278 = v16;
    while (1)
    {
      if (v21)
      {
        v295 = (v21 - 1) & v21;
        v296 = v104;
        v111 = __clz(__rbit64(v21)) | (v104 << 6);
      }
      else
      {
        v20 = v104 + 1;
        if (__OFADD__(v104, 1))
        {
          __break(1u);
          goto LABEL_108;
        }
        if ((uint64_t)v20 >= v277)
          goto LABEL_84;
        v112 = *(_QWORD *)(v276 + 8 * v20);
        v113 = v104 + 1;
        if (!v112)
        {
          v113 = v104 + 2;
          if (v104 + 2 >= v277)
            goto LABEL_84;
          v112 = *(_QWORD *)(v276 + 8 * v113);
          if (!v112)
          {
            v113 = v104 + 3;
            if (v104 + 3 >= v277)
              goto LABEL_84;
            v112 = *(_QWORD *)(v276 + 8 * v113);
            if (!v112)
            {
              v113 = v104 + 4;
              if (v104 + 4 >= v277)
                goto LABEL_84;
              v112 = *(_QWORD *)(v276 + 8 * v113);
              if (!v112)
              {
                v20 = v104 + 5;
                if (v104 + 5 >= v277)
                {
LABEL_84:
                  swift_release();
                  swift_bridgeObjectRelease();
                  break;
                }
                v112 = *(_QWORD *)(v276 + 8 * v20);
                if (!v112)
                {
                  while (1)
                  {
                    v113 = v20 + 1;
                    if (__OFADD__(v20, 1))
                      break;
                    if (v113 >= v277)
                      goto LABEL_84;
                    v112 = *(_QWORD *)(v276 + 8 * v113);
                    ++v20;
                    if (v112)
                      goto LABEL_52;
                  }
LABEL_108:
                  __break(1u);
LABEL_109:
                  v350 = sub_1BA31A28C((_QWORD *)(v20 > 1), v21, 1, v350);
LABEL_4:
                  v22 = v350;
                  v350[2] = v21;
                  v23 = &v22[13 * v15];
                  v24 = v339;
                  v23[4] = v9;
                  v23[5] = v24;
                  v23[6] = v16;
                  v23[7] = v17;
                  v23[8] = v343;
                  v23[9] = v18;
                  v25 = v344;
                  v23[10] = v345;
                  v23[11] = v25;
                  v26 = v337;
                  v23[12] = v338;
                  v23[13] = v26;
                  v27 = v335;
                  v23[14] = v336;
                  v23[15] = v27;
                  v23[16] = v334;
                  goto LABEL_5;
                }
                v113 = v104 + 5;
              }
            }
          }
        }
LABEL_52:
        v295 = (v112 - 1) & v112;
        v296 = v113;
        v111 = __clz(__rbit64(v112)) + (v113 << 6);
      }
      v114 = (uint64_t *)(*(_QWORD *)(v16 + 56) + 528 * v111);
      v346 = (_QWORD *)*v114;
      v115 = v114[1];
      v116 = v114[2];
      v298 = v114[3];
      v297 = v114[4];
      v299 = v114[5];
      v300 = v115;
      v292 = v114[6];
      v293 = v116;
      v291 = v114[7];
      v347 = v114[8];
      v345 = v114[9];
      v344 = v114[10];
      v117 = v114[12];
      v343 = v114[11];
      v118 = v114[13];
      v322 = v114[14];
      v323 = v118;
      v119 = v114[15];
      v320 = v114[16];
      v321 = v119;
      v120 = v114[17];
      v318 = v114[18];
      v319 = v120;
      v121 = v114[19];
      v316 = v114[20];
      v317 = v121;
      v309 = v114[21];
      v306 = v114[22];
      v304 = v114[23];
      v122 = v114[24];
      v301 = v114[25];
      v302 = v122;
      v331 = v114[26];
      v123 = v114[27];
      v329 = v114[28];
      *(_QWORD *)&v330 = v123;
      v124 = v114[29];
      v327 = v114[30];
      v328 = v124;
      v125 = v114[31];
      v325 = v114[32];
      v326 = v125;
      v324 = v114[33];
      v313 = v114[34];
      v311 = v114[35];
      v308 = v114[36];
      v305 = v114[37];
      v303 = v114[38];
      v339 = v114[39];
      v126 = v114[40];
      v337 = v114[41];
      v338 = v126;
      v127 = v114[42];
      v335 = v114[43];
      v336 = v127;
      v128 = v114[44];
      v333 = v114[45];
      v334 = v128;
      v332 = (_QWORD *)v114[46];
      v129 = v114[47];
      v314 = v114[48];
      v315 = v129;
      v312 = v114[49];
      v310 = v114[50];
      v307 = v114[51];
      v350 = (_QWORD *)v114[52];
      v342 = v114[53];
      v341 = v114[54];
      v130 = v114[56];
      v340 = v114[55];
      v15 = v114[57];
      v131 = v114[58];
      v132 = v114[59];
      v290 = v114[60];
      v133 = v114[61];
      v17 = v114[62];
      v134 = v114[63];
      v18 = v114[64];
      v135 = (_QWORD *)swift_allocObject();
      v136 = v117;
      v137 = v343;
      v138 = v344;
      v139 = v345;
      v141 = v291;
      v140 = v292;
      v142 = v298;
      v143 = v299;
      v144 = v297;
      v145 = v293;
      v146 = v300;
      v147 = v135;
      v148 = (uint64_t)v346;
      v135[4] = v346;
      v294 = v135 + 4;
      v149 = v347;
      v135[5] = v146;
      v135[6] = v145;
      v135[7] = v142;
      v135[8] = v144;
      v135[9] = v143;
      v135[10] = v140;
      v135[11] = v141;
      v135[12] = v149;
      v135[13] = v139;
      v135[14] = v138;
      v135[15] = v137;
      v135[16] = v136;
      v150 = v322;
      v135[17] = v323;
      v135[18] = v150;
      v151 = v320;
      v135[19] = v321;
      v135[20] = v151;
      v152 = v318;
      v135[21] = v319;
      v135[22] = v152;
      v153 = v316;
      v135[23] = v317;
      v135[24] = v153;
      v154 = v306;
      v135[25] = v309;
      v135[26] = v154;
      v155 = v302;
      v135[27] = v304;
      v135[28] = v155;
      v156 = v331;
      v135[29] = v301;
      v135[30] = v156;
      v157 = v329;
      v135[31] = v330;
      v135[32] = v157;
      v158 = v327;
      v135[33] = v328;
      v135[34] = v158;
      v159 = v325;
      v135[35] = v326;
      v135[36] = v159;
      v160 = v313;
      v135[37] = v324;
      v135[38] = v160;
      v161 = v308;
      v135[39] = v311;
      v135[40] = v161;
      v162 = v303;
      v135[41] = v305;
      v135[42] = v162;
      v163 = v338;
      v135[43] = v339;
      v135[44] = v163;
      v164 = v336;
      v135[45] = v337;
      v135[46] = v164;
      v165 = v334;
      v135[47] = v335;
      v135[48] = v165;
      v166 = v332;
      v135[49] = v333;
      v135[50] = v166;
      v167 = v314;
      v135[51] = v315;
      v135[52] = v167;
      v168 = v310;
      v135[53] = v312;
      v135[54] = v168;
      v169 = v350;
      v135[55] = v307;
      v135[56] = v169;
      v170 = v341;
      v135[57] = v342;
      v135[58] = v170;
      v135[59] = v340;
      v135[60] = v130;
      v288 = v15;
      v289 = v130;
      v135[61] = v15;
      v135[62] = v131;
      v286 = v132;
      v287 = v131;
      v135[63] = v132;
      v9 = v290;
      v135[64] = v290;
      v284 = v17;
      v285 = v133;
      v135[65] = v133;
      v135[66] = v17;
      v282 = v18;
      v283 = v134;
      v135[67] = v134;
      v135[68] = v18;
      if (v148 == 1)
      {
        sub_1BA384B64(1);
        sub_1BA384B64(v323);
        sub_1BA384B64(v331);
        sub_1BA384B64(v339);
        sub_1BA384B64((uint64_t)v350);
        v350 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      }
      else
      {
        v171 = v145;
        v172 = v140;
        v18 = v141;
        v281 = v136;
        sub_1BA384B64(v148);
        sub_1BA384B64(v323);
        sub_1BA384B64(v331);
        sub_1BA384B64(v339);
        sub_1BA384B64((uint64_t)v350);
        v173 = v171;
        v17 = v172;
        sub_1BA384B64((uint64_t)v346);
        v174 = sub_1BA31A28C(0, 1, 1, MEMORY[0x1E0DEE9D8]);
        v176 = v174[2];
        v175 = v174[3];
        v15 = v176 + 1;
        if (v176 >= v175 >> 1)
          v174 = sub_1BA31A28C((_QWORD *)(v175 > 1), v176 + 1, 1, v174);
        v174[2] = v15;
        v350 = v174;
        v177 = &v174[13 * v176];
        v178 = v300;
        v177[4] = v346;
        v177[5] = v178;
        v179 = v298;
        v177[6] = v173;
        v177[7] = v179;
        v180 = v299;
        v177[8] = v297;
        v177[9] = v180;
        v177[10] = v172;
        v177[11] = v18;
        v181 = v345;
        v177[12] = v347;
        v177[13] = v181;
        v182 = v343;
        v177[14] = v344;
        v177[15] = v182;
        v177[16] = v281;
      }
      v183 = v147[17];
      if (v183 == 1)
      {
        v184 = v350;
      }
      else
      {
        v186 = v147[18];
        v185 = v147[19];
        v18 = v147[21];
        v338 = v147[20];
        v188 = v147[22];
        v187 = v147[23];
        v189 = v147[25];
        v339 = v147[24];
        v190 = v147[26];
        v347 = v147[27];
        v191 = v147[29];
        v346 = (_QWORD *)v147[28];
        v340 = v191;
        swift_bridgeObjectRetain();
        v341 = v183;
        swift_bridgeObjectRetain();
        v342 = v186;
        v192 = v338;
        swift_bridgeObjectRetain();
        v345 = v185;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v344 = v188;
        swift_bridgeObjectRetain();
        v343 = v187;
        v9 = v339;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v184 = v350;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v184 = sub_1BA31A28C(0, v184[2] + 1, 1, v184);
        v17 = v184[2];
        v193 = v184[3];
        v15 = v17 + 1;
        if (v17 >= v193 >> 1)
          v184 = sub_1BA31A28C((_QWORD *)(v193 > 1), v17 + 1, 1, v184);
        v184[2] = v15;
        v194 = &v184[13 * v17];
        v195 = v342;
        v194[4] = v341;
        v194[5] = v195;
        v194[6] = v345;
        v194[7] = v192;
        v196 = v344;
        v194[8] = v18;
        v194[9] = v196;
        v194[10] = v343;
        v194[11] = v9;
        v194[12] = v189;
        v194[13] = v190;
        v197 = (uint64_t)v346;
        v194[14] = v347;
        v194[15] = v197;
        v194[16] = v340;
      }
      v198 = v147[30];
      if (v198 == 1)
      {
        v350 = v184;
      }
      else
      {
        v200 = v147[31];
        v199 = v147[32];
        v18 = v147[34];
        v337 = v147[33];
        v338 = v199;
        v201 = v147[35];
        v202 = v147[36];
        v203 = v147[37];
        v204 = v147[38];
        v339 = v147[39];
        v347 = v147[40];
        v205 = v147[42];
        v346 = (_QWORD *)v147[41];
        v340 = v205;
        swift_bridgeObjectRetain();
        v341 = v198;
        v206 = v204;
        swift_bridgeObjectRetain();
        v342 = v200;
        v208 = v337;
        v207 = v338;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v345 = v201;
        swift_bridgeObjectRetain();
        v344 = v202;
        swift_bridgeObjectRetain();
        v343 = v203;
        v9 = v339;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v184 = sub_1BA31A28C(0, v184[2] + 1, 1, v184);
        v17 = v184[2];
        v209 = v184[3];
        v15 = v17 + 1;
        if (v17 >= v209 >> 1)
          v184 = sub_1BA31A28C((_QWORD *)(v209 > 1), v17 + 1, 1, v184);
        v184[2] = v15;
        v350 = v184;
        v210 = &v184[13 * v17];
        v211 = v342;
        v210[4] = v341;
        v210[5] = v211;
        v210[6] = v207;
        v210[7] = v208;
        v212 = v345;
        v210[8] = v18;
        v210[9] = v212;
        v213 = v343;
        v210[10] = v344;
        v210[11] = v213;
        v210[12] = v206;
        v210[13] = v9;
        v214 = (uint64_t)v346;
        v210[14] = v347;
        v210[15] = v214;
        v210[16] = v340;
      }
      v215 = v147[43];
      if (v215 == 1)
      {
        v8 = v350;
      }
      else
      {
        v216 = v147[44];
        v218 = v147[46];
        v217 = v147[47];
        v337 = v147[45];
        v338 = v217;
        v219 = v147[48];
        v220 = v147[49];
        v221 = v147[50];
        v339 = v147[51];
        v18 = v147[52];
        v222 = v147[53];
        v223 = v147[55];
        v347 = v147[54];
        v340 = v223;
        swift_bridgeObjectRetain();
        v341 = v215;
        v224 = v222;
        swift_bridgeObjectRetain();
        v342 = v216;
        v225 = v337;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v343 = v218;
        v226 = v338;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v346 = (_QWORD *)v219;
        swift_bridgeObjectRetain();
        v345 = v220;
        swift_bridgeObjectRetain();
        v344 = v221;
        v9 = v339;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v8 = v350;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v8 = sub_1BA31A28C(0, v8[2] + 1, 1, v8);
        v17 = v8[2];
        v227 = v8[3];
        v15 = v17 + 1;
        if (v17 >= v227 >> 1)
          v8 = sub_1BA31A28C((_QWORD *)(v227 > 1), v17 + 1, 1, v8);
        v8[2] = v15;
        v228 = &v8[13 * v17];
        v229 = v342;
        v228[4] = v341;
        v228[5] = v229;
        v230 = v343;
        v228[6] = v225;
        v228[7] = v230;
        v231 = (uint64_t)v346;
        v228[8] = v226;
        v228[9] = v231;
        v232 = v344;
        v228[10] = v345;
        v228[11] = v232;
        v228[12] = v9;
        v228[13] = v18;
        v233 = v347;
        v228[14] = v224;
        v228[15] = v233;
        v228[16] = v340;
      }
      v234 = v147[56];
      if (v234 != 1)
      {
        v235 = v147[57];
        v338 = v147[58];
        v236 = v147[59];
        v339 = v147[60];
        v237 = v147[61];
        v238 = v147[62];
        v350 = (_QWORD *)v147[63];
        v340 = v147[64];
        v18 = v147[65];
        v239 = v147[66];
        v347 = v147[67];
        v341 = v147[68];
        swift_bridgeObjectRetain();
        v342 = v234;
        v240 = v239;
        swift_bridgeObjectRetain();
        v343 = v235;
        v17 = v338;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v344 = v236;
        v241 = v339;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v346 = (_QWORD *)v237;
        swift_bridgeObjectRetain();
        v345 = v238;
        swift_bridgeObjectRetain();
        v9 = v340;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v8 = sub_1BA31A28C(0, v8[2] + 1, 1, v8);
        v243 = v8[2];
        v242 = v8[3];
        v15 = v243 + 1;
        if (v243 >= v242 >> 1)
          v8 = sub_1BA31A28C((_QWORD *)(v242 > 1), v243 + 1, 1, v8);
        v8[2] = v15;
        v105 = &v8[13 * v243];
        v106 = v343;
        v105[4] = v342;
        v105[5] = v106;
        v107 = v344;
        v105[6] = v17;
        v105[7] = v107;
        v108 = (uint64_t)v346;
        v105[8] = v241;
        v105[9] = v108;
        v109 = v350;
        v105[10] = v345;
        v105[11] = v109;
        v105[12] = v9;
        v105[13] = v18;
        v110 = v347;
        v105[14] = v240;
        v105[15] = v110;
        v105[16] = v341;
      }
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      sub_1BA426D14((uint64_t)v8);
      v16 = v278;
      v21 = v295;
      v104 = v296;
    }
  }
  v244 = v356;
  v245 = MEMORY[0x1E0DEE9E8];
  v355 = MEMORY[0x1E0DEE9E8];
  v333 = v356[2];
  if (v333)
  {
    v332 = v356 + 4;
    sub_1BA2F3474(0, &qword_1ED5C0320, (uint64_t (*)(uint64_t))sub_1BA3867E8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    v331 = v246;
    v329 = (uint64_t)v244;
    swift_bridgeObjectRetain_n();
    v247 = 0;
    v330 = xmmword_1BA4485F0;
    while (1)
    {
      v248 = v247;
      v249 = &v332[13 * v247];
      v343 = v249[12];
      v342 = v248 + 1;
      v347 = v249[11];
      v250 = v249[9];
      v350 = (_QWORD *)v249[10];
      v252 = v249[7];
      v251 = v249[8];
      v253 = v249[5];
      v344 = v249[6];
      v254 = v344;
      v255 = v249[4];
      v345 = v249[3];
      v256 = v249[2];
      v346 = (_QWORD *)v249[1];
      v257 = *v249;
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v330;
      *(_QWORD *)(inited + 32) = v257;
      v334 = inited + 32;
      *(_QWORD *)(inited + 40) = v256;
      *(_QWORD *)(inited + 48) = v255;
      *(_QWORD *)(inited + 56) = v253;
      *(_QWORD *)(inited + 64) = v254;
      *(_QWORD *)(inited + 72) = v252;
      *(_QWORD *)(inited + 80) = v251;
      v259 = v350;
      *(_QWORD *)(inited + 88) = v250;
      *(_QWORD *)(inited + 96) = v259;
      *(_QWORD *)(inited + 104) = v347;
      swift_bridgeObjectRetain();
      v341 = v257;
      swift_bridgeObjectRetain_n();
      v340 = v256;
      swift_bridgeObjectRetain_n();
      v339 = v255;
      swift_bridgeObjectRetain_n();
      v338 = v253;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v337 = v252;
      swift_bridgeObjectRetain_n();
      v336 = v251;
      swift_bridgeObjectRetain_n();
      v335 = v250;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v260 = 32;
      v261 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v262 = v349;
      v263 = v348;
      do
      {
        if (!*(_QWORD *)(inited + v260))
        {
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v263 + 56))(v353, 1, 1, v262);
LABEL_90:
          sub_1BA4263CC(v353);
          goto LABEL_91;
        }
        sub_1BA2F25C8(&qword_1ED5BEC98, (uint64_t (*)(uint64_t))type metadata accessor for PaywallResource, (uint64_t)&unk_1BA4486D0);
        v264 = v353;
        sub_1BA437E04();
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v263 + 48))(v264, 1, v262) == 1)
          goto LABEL_90;
        v265 = v351;
        sub_1BA320C44(v353, (uint64_t)v351, (uint64_t (*)(_QWORD))type metadata accessor for PaywallResource);
        if ((*((_BYTE *)v265 + *(int *)(v262 + 28)) & 1) != 0)
        {
          v267 = *v265;
          v266 = v265[1];
          swift_bridgeObjectRetain();
          sub_1BA3000D8((uint64_t)v265, (uint64_t (*)(_QWORD))type metadata accessor for PaywallResource);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v261 = sub_1BA319F68(0, v261[2] + 1, 1, v261);
          v269 = v261[2];
          v268 = v261[3];
          if (v269 >= v268 >> 1)
            v261 = sub_1BA319F68((_QWORD *)(v268 > 1), v269 + 1, 1, v261);
          v261[2] = v269 + 1;
          v270 = &v261[2 * v269];
          v270[4] = v267;
          v270[5] = v266;
          v262 = v349;
          v263 = v348;
        }
        else
        {
          sub_1BA3000D8((uint64_t)v265, (uint64_t (*)(_QWORD))type metadata accessor for PaywallResource);
        }
LABEL_91:
        v260 += 8;
      }
      while (v260 != 112);
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      sub_1BA3867E8(0);
      swift_arrayDestroy();
      v271 = v261[2];
      if (v271)
      {
        v272 = v261 + 5;
        do
        {
          v273 = *(v272 - 1);
          v274 = *v272;
          swift_bridgeObjectRetain();
          sub_1BA426E70(v354, v273, v274);
          swift_bridgeObjectRelease();
          v272 += 2;
          --v271;
        }
        while (v271);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v247 = v342;
      if (v342 == v333)
      {
        swift_bridgeObjectRelease_n();
        v245 = v355;
        break;
      }
    }
  }
  swift_bridgeObjectRelease();
  return v245;
}

uint64_t sub_1BA425934(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1BA425968 + 4 * byte_1BA448600[a1]))(0x73756C507377656ELL, 0xE800000000000000);
}

uint64_t sub_1BA425968()
{
  return 0x6F69647561;
}

unint64_t sub_1BA42597C()
{
  return 0xD000000000000016;
}

uint64_t sub_1BA4259E4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1BA425A20 + 4 * byte_1BA448606[a1]))(0x53656C6369747261, 0xEB0000000074666FLL);
}

unint64_t sub_1BA425A20()
{
  return 0xD000000000000011;
}

void sub_1BA425AE4()
{
  JUMPOUT(0x1BA425AF8);
}

uint64_t sub_1BA425B04()
{
  return 0x6565466F69647561;
}

uint64_t sub_1BA425B20()
{
  return 0x6148656C7A7A7570;
}

uint64_t sub_1BA425B3C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[2];
  uint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  _QWORD *v32;
  char v33;
  char v34;
  char v35;
  char v36;

  v27 = a2;
  sub_1BA384908(0);
  v5 = MEMORY[0x1E0C80A78](v3, v4);
  v28 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5, v7);
  v29 = (char *)v26 - v8;
  sub_1BA42C0FC(0, &qword_1ED5C02E8, (void (*)(void))sub_1BA42C154);
  v31 = v9;
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9, v11);
  v13 = (char *)v26 - v12;
  v14 = type metadata accessor for PaywallResource();
  MEMORY[0x1E0C80A78](v14, v15);
  v17 = (_QWORD *)((char *)v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA42C154();
  v30 = v13;
  v18 = (uint64_t)v32;
  sub_1BA43847C();
  if (v18)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v20 = (uint64_t)v29;
  v19 = v30;
  v32 = a1;
  v36 = 0;
  *v17 = sub_1BA4382FC();
  v17[1] = v21;
  v22 = sub_1BA4369B8();
  v35 = 1;
  sub_1BA2F25C8(&qword_1ED5BEAF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DB4DC8], MEMORY[0x1E0DB4DF0]);
  v26[1] = v22;
  sub_1BA4382E4();
  v23 = v14;
  sub_1BA320C44(v20, (uint64_t)v17 + *(int *)(v14 + 20), (uint64_t (*)(_QWORD))sub_1BA384908);
  v34 = 2;
  v24 = (uint64_t)v28;
  sub_1BA4382E4();
  sub_1BA320C44(v24, (uint64_t)v17 + *(int *)(v23 + 24), (uint64_t (*)(_QWORD))sub_1BA384908);
  v33 = 3;
  LOBYTE(v24) = sub_1BA4382D8();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v19, v31);
  *((_BYTE *)v17 + *(int *)(v23 + 28)) = v24;
  sub_1BA320D24((uint64_t)v17, v27, (uint64_t (*)(_QWORD))type metadata accessor for PaywallResource);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  return sub_1BA3000D8((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for PaywallResource);
}

uint64_t sub_1BA425EC4()
{
  unsigned __int8 *v0;

  return sub_1BA425934(*v0);
}

uint64_t sub_1BA425ECC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1BA428D84(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BA425EF0()
{
  sub_1BA42A14C();
  return sub_1BA438494();
}

uint64_t sub_1BA425F18()
{
  sub_1BA42A14C();
  return sub_1BA4384A0();
}

void *sub_1BA425F40@<X0>(_QWORD *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2;
  void *result;
  _BYTE v5[528];

  result = sub_1BA428FE4(a1, v5);
  if (!v2)
    return memcpy(a2, v5, 0x210uLL);
  return result;
}

uint64_t sub_1BA425F90()
{
  unsigned __int8 *v0;

  return sub_1BA4259E4(*v0);
}

uint64_t sub_1BA425F98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1BA42A23C(a1, a2);
  *a3 = result;
  return result;
}

void sub_1BA425FBC(_BYTE *a1@<X8>)
{
  *a1 = 13;
}

uint64_t sub_1BA425FC8()
{
  sub_1BA42B260();
  return sub_1BA438494();
}

uint64_t sub_1BA425FF0()
{
  sub_1BA42B260();
  return sub_1BA4384A0();
}

__n128 sub_1BA426018@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  __int128 v6;
  _OWORD v7[6];
  uint64_t v8;

  sub_1BA42A79C(a1, v7);
  if (!v2)
  {
    v5 = v7[5];
    *(_OWORD *)(a2 + 64) = v7[4];
    *(_OWORD *)(a2 + 80) = v5;
    *(_QWORD *)(a2 + 96) = v8;
    v6 = v7[1];
    *(_OWORD *)a2 = v7[0];
    *(_OWORD *)(a2 + 16) = v6;
    result = (__n128)v7[3];
    *(_OWORD *)(a2 + 32) = v7[2];
    *(__n128 *)(a2 + 48) = result;
  }
  return result;
}

uint64_t sub_1BA426074()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1BA4260A8 + 4 * byte_1BA448613[*v0]))(0x656372756F736572, 0xEA00000000006449);
}

uint64_t sub_1BA4260A8()
{
  return 0x567377654E6E696DLL;
}

uint64_t sub_1BA4260D8()
{
  return 0x7250646C756F6873;
}

uint64_t sub_1BA4260FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1BA42C33C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BA426120()
{
  sub_1BA42C154();
  return sub_1BA438494();
}

uint64_t sub_1BA426148()
{
  sub_1BA42C154();
  return sub_1BA4384A0();
}

uint64_t sub_1BA426170@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BA425B3C(a1, a2);
}

uint64_t sub_1BA426184@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t (*v9)(_QWORD);
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  sub_1BA384908(0);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA320D24(v2 + *(int *)(a1 + 20), (uint64_t)v8, v9);
  v10 = sub_1BA4369B8();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a2, v8, v10);
  sub_1BA4369AC();
  return sub_1BA3000D8((uint64_t)v8, (uint64_t (*)(_QWORD))sub_1BA384908);
}

uint64_t sub_1BA426258@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t (*v9)(_QWORD);
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  sub_1BA384908(0);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA320D24(v2 + *(int *)(a1 + 24), (uint64_t)v8, v9);
  v10 = sub_1BA4369B8();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a2, v8, v10);
  sub_1BA4369A0();
  return sub_1BA3000D8((uint64_t)v8, (uint64_t (*)(_QWORD))sub_1BA384908);
}

uint64_t type metadata accessor for PaywallResource()
{
  uint64_t result;

  result = qword_1ED5BECA8;
  if (!qword_1ED5BECA8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1BA426368()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5C0308)
  {
    sub_1BA2FC080(255, (unint64_t *)&unk_1ED5BFA40);
    v0 = sub_1BA4383B0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5C0308);
  }
}

uint64_t sub_1BA4263CC(uint64_t a1)
{
  uint64_t v2;

  sub_1BA2F3474(0, &qword_1ED5BECE8, (uint64_t (*)(uint64_t))type metadata accessor for PaywallResource, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *sub_1BA426420()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  _QWORD *v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD v71[13];
  _QWORD v72[13];
  _QWORD v73[13];
  _QWORD v74[13];
  _QWORD v75[13];
  _QWORD v76[13];
  _QWORD v77[13];
  _QWORD v78[14];

  sub_1BA4282A0(v0, (uint64_t)v78, (unint64_t *)&unk_1ED5BFA40);
  sub_1BA4282A0((uint64_t)v78, (uint64_t)v71, (unint64_t *)&unk_1ED5BFA40);
  sub_1BA4282A0(v0 + 208, (uint64_t)v77, (unint64_t *)&unk_1ED5BFA40);
  sub_1BA4282A0((uint64_t)v77, (uint64_t)v72, (unint64_t *)&unk_1ED5BFA40);
  sub_1BA4282A0(v0 + 104, (uint64_t)v76, (unint64_t *)&unk_1ED5BFA40);
  sub_1BA4282A0((uint64_t)v76, (uint64_t)v73, (unint64_t *)&unk_1ED5BFA40);
  sub_1BA4282A0(v0 + 312, (uint64_t)v75, (unint64_t *)&unk_1ED5BFA40);
  sub_1BA4282A0((uint64_t)v75, (uint64_t)v74, (unint64_t *)&unk_1ED5BFA40);
  v1 = v71[0];
  v2 = v71[1];
  v3 = v71[2];
  v66 = v71[4];
  v70 = v71[3];
  v4 = v71[7];
  v64 = v71[6];
  v65 = v71[5];
  v6 = v71[8];
  v5 = v71[9];
  v7 = v71[10];
  v8 = v71[11];
  v9 = v71[12];
  sub_1BA391830(v78, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1BA384B64);
  sub_1BA391830(v77, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1BA384B64);
  sub_1BA391830(v76, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1BA384B64);
  sub_1BA391830(v75, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1BA384B64);
  if (v1 == 1)
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  else
  {
    v63 = v2;
    sub_1BA384B64(v1);
    v10 = sub_1BA31A28C(0, 1, 1, MEMORY[0x1E0DEE9D8]);
    v12 = v10[2];
    v11 = v10[3];
    if (v12 >= v11 >> 1)
      v10 = sub_1BA31A28C((_QWORD *)(v11 > 1), v12 + 1, 1, v10);
    v10[2] = v12 + 1;
    v13 = &v10[13 * v12];
    v13[4] = v1;
    v13[5] = v63;
    v13[6] = v3;
    v13[7] = v70;
    v13[8] = v66;
    v13[9] = v65;
    v13[10] = v64;
    v13[11] = v4;
    v13[12] = v6;
    v13[13] = v5;
    v13[14] = v7;
    v13[15] = v8;
    v13[16] = v9;
  }
  v14 = v72[0];
  if (v72[0] != 1)
  {
    v15 = v72[1];
    v16 = v72[2];
    v17 = v72[5];
    v53 = v72[3];
    v56 = v72[4];
    v18 = v72[6];
    v19 = v72[7];
    v20 = v72[8];
    v21 = v72[9];
    v22 = v72[10];
    v59 = v72[11];
    v62 = v72[12];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v67 = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v10 = sub_1BA31A28C(0, v10[2] + 1, 1, v10);
    v24 = v10[2];
    v23 = v10[3];
    if (v24 >= v23 >> 1)
      v10 = sub_1BA31A28C((_QWORD *)(v23 > 1), v24 + 1, 1, v10);
    v10[2] = v24 + 1;
    v25 = &v10[13 * v24];
    v25[4] = v14;
    v25[5] = v15;
    v25[6] = v16;
    v25[7] = v53;
    v25[8] = v56;
    v25[9] = v17;
    v25[10] = v18;
    v25[11] = v19;
    v25[12] = v67;
    v25[13] = v21;
    v25[14] = v22;
    v25[15] = v59;
    v25[16] = v62;
  }
  v26 = v73[0];
  if (v73[0] != 1)
  {
    v27 = v73[1];
    v28 = v73[2];
    v29 = v73[3];
    v30 = v73[6];
    v51 = v73[4];
    v54 = v73[5];
    v31 = v73[7];
    v32 = v73[8];
    v33 = v73[9];
    v34 = v73[11];
    v57 = v73[10];
    v60 = v73[12];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v68 = v28;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v10 = sub_1BA31A28C(0, v10[2] + 1, 1, v10);
    v36 = v10[2];
    v35 = v10[3];
    if (v36 >= v35 >> 1)
      v10 = sub_1BA31A28C((_QWORD *)(v35 > 1), v36 + 1, 1, v10);
    v10[2] = v36 + 1;
    v37 = &v10[13 * v36];
    v37[4] = v26;
    v37[5] = v27;
    v37[6] = v68;
    v37[7] = v29;
    v37[8] = v51;
    v37[9] = v54;
    v37[10] = v30;
    v37[11] = v31;
    v37[12] = v32;
    v37[13] = v33;
    v37[14] = v57;
    v37[15] = v34;
    v37[16] = v60;
  }
  v38 = v74[0];
  if (v74[0] != 1)
  {
    v39 = v74[1];
    v40 = v74[2];
    v41 = v74[3];
    v52 = v74[4];
    v55 = v74[5];
    v42 = v74[6];
    v43 = v74[7];
    v44 = v74[8];
    v45 = v74[9];
    v46 = v74[11];
    v58 = v74[10];
    v61 = v74[12];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v69 = v40;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v10 = sub_1BA31A28C(0, v10[2] + 1, 1, v10);
    v48 = v10[2];
    v47 = v10[3];
    if (v48 >= v47 >> 1)
      v10 = sub_1BA31A28C((_QWORD *)(v47 > 1), v48 + 1, 1, v10);
    v10[2] = v48 + 1;
    v49 = &v10[13 * v48];
    v49[4] = v38;
    v49[5] = v39;
    v49[6] = v69;
    v49[7] = v41;
    v49[8] = v52;
    v49[9] = v55;
    v49[10] = v42;
    v49[11] = v43;
    v49[12] = v44;
    v49[13] = v45;
    v49[14] = v58;
    v49[15] = v46;
    v49[16] = v61;
  }
  sub_1BA2FC080(0, (unint64_t *)&unk_1ED5BFA40);
  swift_arrayDestroy();
  return v10;
}

void sub_1BA426AA8(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_1BA426ADC@<X0>(uint64_t a1@<X0>, unsigned int a2@<W8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 128);
  if ((*(_BYTE *)(a1 + 144) & 1) != 0)
  {
    if (v3 == 2)
    {
      if (a2 <= 1)
      {
        v4 = v2[2];
LABEL_15:
        v5 = v4;
        goto LABEL_16;
      }
      v4 = v2[3];
      if (v4)
        goto LABEL_15;
      v5 = v2[2];
    }
    else
    {
      v4 = v2[4];
      if (v4)
        goto LABEL_15;
      v5 = v2[5];
    }
  }
  else
  {
    if (v3 != 2)
    {
      v4 = v2[5];
      goto LABEL_15;
    }
    if (a2 <= 1)
    {
      v4 = *v2;
      goto LABEL_15;
    }
    v4 = v2[1];
    if (v4)
      goto LABEL_15;
    v5 = *v2;
  }
  swift_bridgeObjectRetain();
LABEL_16:
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_1BA426BC4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_1BA319F68(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_1BA4382A8();
  __break(1u);
  return result;
}

uint64_t sub_1BA426D14(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v15 = v4 + v2;
  else
    v15 = v4;
  v3 = sub_1BA31A28C(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = (unint64_t)&v3[13 * v9 + 4];
  if (a1 + 32 < v10 + 104 * v8 && v10 < a1 + 32 + 104 * v8)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = v3[2];
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_1BA4382A8();
  __break(1u);
  return result;
}

uint64_t sub_1BA426E70(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_1BA43844C();
  swift_bridgeObjectRetain();
  sub_1BA437CB4();
  v8 = sub_1BA438470();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1BA4383C8() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1BA4383C8() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1BA4278B8(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1BA42701C(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  char *v25;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v3 = v2;
  v6 = sub_1BA437900();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, MEMORY[0x1E0D5D228]);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_1BA2F25C8(&qword_1ED5C0CB0, v11, MEMORY[0x1E0D5D230]);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_1BA437BF4();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  v15 = v10;
  v16 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v27 = v3;
    v28 = a1;
    v29 = ~v13;
    v30 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    while (1)
    {
      v19 = v15;
      v20 = v18;
      v18(v9, *(_QWORD *)(v15 + 48) + v17 * v14, v6);
      sub_1BA2F25C8(&qword_1ED5C0CB8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D5D228], MEMORY[0x1E0D5D238]);
      v21 = sub_1BA437C0C();
      v22 = *(void (**)(char *, uint64_t))(v30 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v14 = (v14 + 1) & v29;
      v15 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v16 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v27;
        a1 = v28;
        v23 = v30;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v31, v6);
    v20(v28, *(_QWORD *)(*v27 + 48) + v17 * v14, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    v23 = v7;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = v31;
    v18(v9, v31, v6);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    sub_1BA427A50((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_1BA427278()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  sub_1BA385270();
  v3 = sub_1BA4381AC();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_1BA43844C();
      sub_1BA437CB4();
      result = sub_1BA438470();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_1BA427550()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, unint64_t, uint64_t);
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  _QWORD *v36;
  uint64_t v37;

  v1 = v0;
  v2 = sub_1BA437900();
  v37 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  sub_1BA385820();
  v7 = sub_1BA4381AC();
  v8 = v7;
  if (*(_QWORD *)(v6 + 16))
  {
    v9 = 1 << *(_BYTE *)(v6 + 32);
    v10 = *(_QWORD *)(v6 + 56);
    v36 = (_QWORD *)(v6 + 56);
    if (v9 < 64)
      v11 = ~(-1 << v9);
    else
      v11 = -1;
    v12 = v11 & v10;
    v34 = v0;
    v35 = (unint64_t)(v9 + 63) >> 6;
    v13 = v7 + 56;
    result = swift_retain();
    v15 = 0;
    while (1)
    {
      if (v12)
      {
        v17 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v18 = v17 | (v15 << 6);
      }
      else
      {
        v19 = v15 + 1;
        if (__OFADD__(v15, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v35)
          goto LABEL_33;
        v20 = v36[v19];
        ++v15;
        if (!v20)
        {
          v15 = v19 + 1;
          if (v19 + 1 >= v35)
            goto LABEL_33;
          v20 = v36[v15];
          if (!v20)
          {
            v15 = v19 + 2;
            if (v19 + 2 >= v35)
              goto LABEL_33;
            v20 = v36[v15];
            if (!v20)
            {
              v21 = v19 + 3;
              if (v21 >= v35)
              {
LABEL_33:
                swift_release();
                v1 = v34;
                v33 = 1 << *(_BYTE *)(v6 + 32);
                if (v33 > 63)
                  bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v36 = -1 << v33;
                *(_QWORD *)(v6 + 16) = 0;
                break;
              }
              v20 = v36[v21];
              if (!v20)
              {
                while (1)
                {
                  v15 = v21 + 1;
                  if (__OFADD__(v21, 1))
                    goto LABEL_39;
                  if (v15 >= v35)
                    goto LABEL_33;
                  v20 = v36[v15];
                  ++v21;
                  if (v20)
                    goto LABEL_23;
                }
              }
              v15 = v21;
            }
          }
        }
LABEL_23:
        v12 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v15 << 6);
      }
      v22 = v6;
      v23 = *(_QWORD *)(v6 + 48);
      v24 = *(_QWORD *)(v37 + 72);
      v25 = *(void (**)(char *, unint64_t, uint64_t))(v37 + 32);
      v25(v5, v23 + v24 * v18, v2);
      sub_1BA2F25C8(&qword_1ED5C0CB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D5D228], MEMORY[0x1E0D5D230]);
      result = sub_1BA437BF4();
      v26 = -1 << *(_BYTE *)(v8 + 32);
      v27 = result & ~v26;
      v28 = v27 >> 6;
      if (((-1 << v27) & ~*(_QWORD *)(v13 + 8 * (v27 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v29 = 0;
        v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v31 = v28 == v30;
          if (v28 == v30)
            v28 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v13 + 8 * v28);
        }
        while (v32 == -1);
        v16 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v25)(*(_QWORD *)(v8 + 48) + v16 * v24, v5, v2);
      ++*(_QWORD *)(v8 + 16);
      v6 = v22;
    }
  }
  result = swift_release();
  *v1 = v8;
  return result;
}

uint64_t sub_1BA4278B8(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_1BA427278();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_1BA383D34();
      goto LABEL_22;
    }
    sub_1BA427C54();
  }
  v11 = *v4;
  sub_1BA43844C();
  sub_1BA437CB4();
  result = sub_1BA438470();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_1BA4383C8(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_1BA4383E0();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_1BA4383C8();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

uint64_t sub_1BA427A50(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, unint64_t, uint64_t);
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = a1;
  v6 = sub_1BA437900();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(*v3 + 16);
  v12 = *(_QWORD *)(*v3 + 24);
  v26 = v3;
  if (v12 > v11 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_1BA427550();
  }
  else
  {
    if (v12 > v11)
    {
      sub_1BA383EE0();
      goto LABEL_12;
    }
    sub_1BA427EFC();
  }
  v13 = *v3;
  sub_1BA2F25C8(&qword_1ED5C0CB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D5D228], MEMORY[0x1E0D5D230]);
  v14 = sub_1BA437BF4();
  v15 = -1 << *(_BYTE *)(v13 + 32);
  a2 = v14 & ~v15;
  if (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v16 = ~v15;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v18(v10, *(_QWORD *)(v13 + 48) + v17 * a2, v6);
      sub_1BA2F25C8(&qword_1ED5C0CB8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D5D228], MEMORY[0x1E0D5D238]);
      v19 = sub_1BA437C0C();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
      if ((v19 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v16;
    }
    while (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v20 = v27;
  v21 = *v26;
  *(_QWORD *)(*v26 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v21 + 48) + *(_QWORD *)(v7 + 72) * a2, v20, v6);
  v23 = *(_QWORD *)(v21 + 16);
  v24 = __OFADD__(v23, 1);
  v25 = v23 + 1;
  if (!v24)
  {
    *(_QWORD *)(v21 + 16) = v25;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_1BA4383E0();
  __break(1u);
  return result;
}

uint64_t sub_1BA427C54()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  sub_1BA385270();
  v3 = sub_1BA4381AC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_1BA43844C();
    swift_bridgeObjectRetain();
    sub_1BA437CB4();
    result = sub_1BA438470();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1BA427EFC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  int64_t v34;

  v1 = v0;
  v2 = sub_1BA437900();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v0;
  sub_1BA385820();
  v8 = sub_1BA4381AC();
  v9 = v8;
  if (!*(_QWORD *)(v7 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v9;
    return result;
  }
  v10 = 1 << *(_BYTE *)(v7 + 32);
  v11 = *(_QWORD *)(v7 + 56);
  v32 = v0;
  v33 = v7 + 56;
  if (v10 < 64)
    v12 = ~(-1 << v10);
  else
    v12 = -1;
  v13 = v12 & v11;
  v34 = (unint64_t)(v10 + 63) >> 6;
  v14 = v8 + 56;
  result = swift_retain();
  v16 = 0;
  while (1)
  {
    if (v13)
    {
      v18 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v34)
      goto LABEL_33;
    v21 = *(_QWORD *)(v33 + 8 * v20);
    ++v16;
    if (!v21)
    {
      v16 = v20 + 1;
      if (v20 + 1 >= v34)
        goto LABEL_33;
      v21 = *(_QWORD *)(v33 + 8 * v16);
      if (!v21)
      {
        v16 = v20 + 2;
        if (v20 + 2 >= v34)
          goto LABEL_33;
        v21 = *(_QWORD *)(v33 + 8 * v16);
        if (!v21)
          break;
      }
    }
LABEL_23:
    v13 = (v21 - 1) & v21;
    v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    v23 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v6, *(_QWORD *)(v7 + 48) + v23 * v19, v2);
    sub_1BA2F25C8(&qword_1ED5C0CB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D5D228], MEMORY[0x1E0D5D230]);
    result = sub_1BA437BF4();
    v24 = -1 << *(_BYTE *)(v9 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v14 + 8 * (v25 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v14 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v29 = v26 == v28;
        if (v26 == v28)
          v26 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v14 + 8 * v26);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v9 + 48) + v17 * v23, v6, v2);
    ++*(_QWORD *)(v9 + 16);
  }
  v22 = v20 + 3;
  if (v22 >= v34)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v32;
    goto LABEL_35;
  }
  v21 = *(_QWORD *)(v33 + 8 * v22);
  if (v21)
  {
    v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    v16 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v16 >= v34)
      goto LABEL_33;
    v21 = *(_QWORD *)(v33 + 8 * v16);
    ++v22;
    if (v21)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_1BA428220(uint64_t a1)
{
  sub_1BA2F3474(a1, (unint64_t *)&unk_1ED5C0CD0, (uint64_t (*)(uint64_t))sub_1BA42823C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
}

void sub_1BA42823C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5C0CC0)
  {
    v0 = sub_1BA437BE8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5C0CC0);
  }
}

uint64_t sub_1BA4282A0(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v5;

  sub_1BA2FC080(0, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1BA4282EC@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  unsigned __int8 v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  unsigned __int8 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _QWORD v136[4];
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;

  v4 = a1[7];
  v217 = a1[6];
  v218 = v4;
  v5 = a1[9];
  v219 = a1[8];
  v220 = v5;
  v6 = a1[3];
  v213 = a1[2];
  v214 = v6;
  v7 = a1[5];
  v215 = a1[4];
  v216 = v7;
  v8 = a1[1];
  v211 = *a1;
  v212 = v8;
  sub_1BA4282A0(a2, (uint64_t)v136, (unint64_t *)&unk_1ED5C07B0);
  result = sub_1BA384924((uint64_t)v136);
  if ((_DWORD)result != 1)
  {
    v23 = v217;
    if ((unint64_t)v217 >> 62)
    {
      if ((unint64_t)v217 >> 62 == 1)
      {
        v114 = v197;
        v117 = v196;
        v120 = v195;
        v123 = v194;
        v17 = v193;
        v24 = v192;
        v15 = v191;
        v25 = v190;
        v26 = v189;
        v12 = v188;
        v11 = v187;
        v10 = v186;
        v22 = v185;
        result = sub_1BA384B64(v185);
        v16 = v24;
        v14 = v25;
        v13 = v26;
        v19 = v120;
        v18 = v123;
        v21 = v114;
        v20 = v117;
        goto LABEL_35;
      }
      v98 = v160;
      v101 = v159;
      v91 = v162;
      v95 = v161;
      v109 = v164;
      v111 = v163;
      v107 = v165;
      v89 = v166;
      v121 = v169;
      v125 = v168;
      v118 = v170;
      v113 = v167;
      v115 = v171;
      v64 = v173;
      v65 = v174;
      v73 = v172;
      v74 = v176;
      v66 = v175;
      v67 = v178;
      v68 = v180;
      v69 = v181;
      v70 = v182;
      v71 = v183;
      v72 = v179;
      v75 = v177;
      v76 = v184;
      v33 = v218;
      v104 = v213;
      v34 = *((_QWORD *)&v217 + 1);
      v35 = *((_QWORD *)&v216 + 1);
      v78 = *((_QWORD *)&v217 + 1);
      v80 = *((_QWORD *)&v216 + 1);
      v36 = v215;
      v77 = v216;
      v37 = v214;
      v38 = (void *)*((_QWORD *)&v213 + 1);
      v86 = (void *)*((_QWORD *)&v213 + 1);
      v39 = *((_QWORD *)&v212 + 1);
      v82 = v215;
      v84 = *((_QWORD *)&v212 + 1);
      sub_1BA310D10((uint64_t)&v211);
      sub_1BA310E24(v39, v104, v38, v37, *((uint64_t *)&v37 + 1), v36, *((uint64_t *)&v36 + 1), v77, v35, v23, v34, v33, *((void **)&v33 + 1));
      swift_bridgeObjectRetain();
      v40 = *((id *)&v33 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      LOBYTE(v34) = AMSMarketingItem.isCIPOffer()();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1BA310FD4(v84, v104, v86, v37, *((uint64_t *)&v37 + 1), v82, *((uint64_t *)&v36 + 1), v77, v80, v23, v78, v33, *((void **)&v33 + 1));
      sub_1BA310EC0((uint64_t)&v211);
      if ((v34 & 1) == 0 && v212 == 2)
      {
        v22 = v73;
        if (v73 == 1)
        {
          v17 = v113;
          v12 = v91;
          v11 = v95;
          v15 = v107;
          result = sub_1BA384B64(v101);
          v16 = v89;
          v14 = v109;
          v13 = v111;
          v18 = v125;
          v20 = v118;
          v19 = v121;
          v21 = v115;
          v10 = v98;
          v22 = v101;
          goto LABEL_35;
        }
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v10 = v64;
        swift_bridgeObjectRetain();
        v11 = v65;
        swift_bridgeObjectRetain();
        v12 = v66;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v15 = v67;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v17 = v68;
        swift_bridgeObjectRetain();
        v49 = v69;
        swift_bridgeObjectRetain();
        v19 = v70;
        swift_bridgeObjectRetain();
        result = swift_bridgeObjectRetain();
        v13 = v74;
        v14 = v75;
        v16 = v72;
LABEL_30:
        v18 = v49;
        v20 = result;
        v21 = v76;
        goto LABEL_35;
      }
      v10 = v98;
      v22 = v101;
      v12 = v91;
      v11 = v95;
      v20 = v118;
      v21 = v115;
      if (!(_BYTE)v212)
      {
        v45 = (void *)v211;
        if ((objc_msgSend((id)swift_unknownObjectRetain(), sel_respondsToSelector_, sel_hasAudioTrack) & 1) != 0)
        {
          v46 = objc_msgSend(v45, sel_hasAudioTrack);
          swift_unknownObjectRelease();
          if ((v46 & 1) != 0 && v73 != 1)
          {
            v198 = v73;
            v199 = v64;
            v200 = v65;
            v201 = v66;
            v202 = v74;
            v203 = v75;
            v204 = v67;
            v205 = v72;
            v206 = v68;
            v207 = v69;
            v208 = v70;
            v209 = v71;
            v210 = v76;
            v132 = v217;
            v133 = v218;
            v134 = v219;
            v135 = v220;
            v128 = v213;
            v129 = v214;
            v130 = v215;
            v131 = v216;
            v126 = v211;
            v127 = v212;
            sub_1BA426AA8((uint64_t)&v126);
            v48 = v47;
            swift_bridgeObjectRelease();
            if (v48)
            {
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              v10 = v64;
              swift_bridgeObjectRetain();
              v11 = v65;
              swift_bridgeObjectRetain();
              v12 = v66;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              v15 = v67;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              v49 = v69;
              swift_bridgeObjectRetain();
              v19 = v70;
              swift_bridgeObjectRetain();
              result = swift_bridgeObjectRetain();
              v22 = v73;
              v13 = v74;
              v14 = v75;
              v16 = v72;
              v17 = v68;
              goto LABEL_30;
            }
          }
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
      v17 = v113;
      result = sub_1BA384B64(v101);
      v16 = v89;
      v15 = v107;
      v14 = v109;
      v13 = v111;
      v18 = v125;
      v19 = v121;
      goto LABEL_35;
    }
    v22 = v136[0];
    v10 = v136[1];
    v11 = v136[2];
    v12 = v136[3];
    v27 = v137;
    v28 = v138;
    v29 = v139;
    v30 = v140;
    v112 = v141;
    v31 = v142;
    v19 = v143;
    v20 = v144;
    v21 = v145;
    if ((v213 & 1) == 0 && v212 == 2)
    {
      if (v146 == 1)
      {
        v17 = v141;
        v32 = v136[0];
        v108 = v138;
        v110 = v137;
        v106 = v139;
        v124 = v142;
LABEL_10:
        result = sub_1BA384B64(v32);
        v16 = v30;
        v15 = v106;
        v14 = v108;
        v13 = v110;
        v18 = v124;
        goto LABEL_35;
      }
      v102 = v153;
      v105 = v158;
      v119 = v156;
      v122 = v157;
      v116 = v155;
      v50 = v154;
      v96 = v151;
      v99 = v152;
      v51 = v150;
      v93 = v149;
      v88 = v148;
      v52 = v146;
      v53 = v147;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v17 = v50;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      result = swift_bridgeObjectRetain();
      v22 = v52;
      v10 = v53;
      v11 = v88;
      v12 = v93;
      v13 = v51;
      goto LABEL_28;
    }
    if (!(_BYTE)v212)
    {
      v79 = v147;
      v81 = v146;
      v85 = v154;
      v87 = v148;
      v92 = v149;
      v96 = v151;
      v83 = v150;
      v99 = v152;
      v102 = v153;
      v116 = v155;
      v119 = v156;
      v122 = v157;
      v124 = v142;
      v105 = v158;
      v106 = v139;
      v108 = v138;
      v110 = v137;
      v90 = v140;
      v41 = (void *)v211;
      if ((objc_msgSend((id)swift_unknownObjectRetain(), sel_respondsToSelector_, sel_hasAudioTrack) & 1) != 0)
      {
        v42 = objc_msgSend(v41, sel_hasAudioTrack);
        swift_unknownObjectRelease();
        v30 = v90;
        v31 = v124;
        v28 = v108;
        v27 = v110;
        v29 = v106;
        if ((v42 & 1) != 0)
        {
          if (v81 == 1)
            goto LABEL_36;
          v198 = v81;
          v199 = v79;
          v200 = v87;
          v201 = v92;
          v202 = v83;
          v203 = v96;
          v204 = v99;
          v205 = v102;
          v206 = v85;
          v207 = v116;
          v208 = v119;
          v209 = v122;
          v210 = v105;
          v132 = v217;
          v133 = v218;
          v134 = v219;
          v135 = v220;
          v128 = v213;
          v129 = v214;
          v130 = v215;
          v131 = v216;
          v126 = v211;
          v127 = v212;
          sub_1BA426AA8((uint64_t)&v126);
          v44 = v43;
          swift_bridgeObjectRelease();
          if (!v44)
          {
LABEL_36:
            v17 = v112;
            v32 = v22;
            v30 = v90;
            goto LABEL_10;
          }
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v17 = v85;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          result = swift_bridgeObjectRetain();
          v22 = v81;
          v10 = v79;
          v11 = v87;
          v12 = v92;
          v13 = v83;
LABEL_28:
          v14 = v96;
          v15 = v99;
          v16 = v102;
          v21 = v105;
          v18 = v116;
          v19 = v119;
          v20 = v122;
          goto LABEL_35;
        }
      }
      else
      {
        swift_unknownObjectRelease();
        v30 = v90;
        v31 = v124;
        v28 = v108;
        v27 = v110;
        v29 = v106;
      }
    }
    v17 = v112;
    v54 = v22;
    v55 = v11;
    v56 = v12;
    v57 = v27;
    v58 = v28;
    v59 = v29;
    v94 = v56;
    v97 = v55;
    v100 = v10;
    v103 = v54;
    v60 = v21;
    v61 = v20;
    v62 = v19;
    v63 = v31;
    result = sub_1BA384B64(v54);
    v16 = v30;
    v15 = v59;
    v14 = v58;
    v13 = v57;
    v18 = v63;
    v19 = v62;
    v20 = v61;
    v21 = v60;
    v10 = v100;
    v22 = v103;
    v12 = v94;
    v11 = v97;
    goto LABEL_35;
  }
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 1;
LABEL_35:
  *a3 = v22;
  a3[1] = v10;
  a3[2] = v11;
  a3[3] = v12;
  a3[4] = v13;
  a3[5] = v14;
  a3[6] = v15;
  a3[7] = v16;
  a3[8] = v17;
  a3[9] = v18;
  a3[10] = v19;
  a3[11] = v20;
  a3[12] = v21;
  return result;
}

uint64_t sub_1BA428D84(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x73756C507377656ELL && a2 == 0xE800000000000000;
  if (v2 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F69647561 && a2 == 0xE500000000000000 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x80000001BA45BEA0 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000001BA45BEC0 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6574726143616C61 && a2 == 0xE800000000000000 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000001BA45BEE0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v6 = sub_1BA4383C8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

void *sub_1BA428FE4@<X0>(_QWORD *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  char *v12;
  void *result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  _QWORD *v137;
  uint64_t v138[66];
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  unint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  char v205;
  uint64_t v206;

  v135 = a2;
  sub_1BA42C0FC(0, &qword_1ED5C02E0, (void (*)(void))sub_1BA42A14C);
  v136 = v4;
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v66 - v7;
  v9 = a1[3];
  v137 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_1BA42A14C();
  v10 = v8;
  sub_1BA43847C();
  if (v2)
    return (void *)__swift_destroy_boxed_opaque_existential_1((uint64_t)v137);
  v134 = v5;
  LOBYTE(v138[0]) = 0;
  v11 = sub_1BA42A190();
  v12 = v10;
  sub_1BA4382E4();
  v133 = 0;
  LOBYTE(v138[0]) = 1;
  v14 = v151;
  v15 = v150;
  v16 = v149;
  v17 = v148;
  v132 = v147;
  v18 = v139;
  v123 = v140;
  v124 = v141;
  v126 = v142;
  v127 = v143;
  v125 = v144;
  v121 = v146;
  v122 = v145;
  sub_1BA384B64(v139);
  v19 = v133;
  sub_1BA4382E4();
  v133 = v19;
  v131 = v17;
  v129 = v15;
  v130 = v16;
  v128 = v14;
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v134 + 8))(v10, v136);
    sub_1BA384FC4(v18);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v137);
    return (void *)sub_1BA384FC4(v18);
  }
  v107 = v18;
  v20 = v146;
  v21 = v147;
  v22 = v148;
  v23 = v149;
  v24 = v150;
  LOBYTE(v138[0]) = 2;
  v114 = v151;
  v119 = v140;
  v120 = v139;
  v25 = v141;
  v117 = v143;
  v118 = v142;
  v115 = v145;
  v116 = v144;
  sub_1BA384B64(v139);
  v106 = v11;
  v26 = v133;
  sub_1BA4382E4();
  v112 = v20;
  v113 = v25;
  v110 = v22;
  v111 = v21;
  v108 = v24;
  v109 = v23;
  if (v26)
  {
    v27 = v26;
    (*(void (**)(char *, uint64_t))(v134 + 8))(v12, v136);
    sub_1BA384FC4(v120);
    v28 = v107;
    sub_1BA384FC4(v107);
    LODWORD(v135) = 0;
    LODWORD(v136) = 0;
    v29 = (uint64_t)v137;
  }
  else
  {
    v30 = v149;
    v31 = v150;
    v32 = v151;
    LOBYTE(v138[0]) = 3;
    v33 = v148;
    v34 = v147;
    v35 = v139;
    v99 = v140;
    v100 = v141;
    v101 = v142;
    v102 = v143;
    v103 = v144;
    v104 = v145;
    v105 = v146;
    sub_1BA384B64(v139);
    v80 = 0;
    sub_1BA4382E4();
    v133 = 0;
    v91 = v34;
    v92 = v35;
    v89 = v30;
    v90 = v33;
    v87 = v32;
    v88 = v31;
    v36 = v145;
    v37 = v146;
    v38 = v148;
    v39 = v149;
    v40 = v150;
    v41 = v151;
    LOBYTE(v138[0]) = 4;
    v84 = v147;
    v42 = v139;
    v81 = v140;
    v82 = v141;
    v83 = v142;
    v85 = v143;
    v86 = v144;
    sub_1BA384B64(v139);
    v43 = v133;
    sub_1BA4382E4();
    v133 = v43;
    v78 = v36;
    v79 = v37;
    v76 = v40;
    v77 = v41;
    v74 = v38;
    v75 = v39;
    v73 = v42;
    if (v43)
    {
      (*(void (**)(char *, uint64_t))(v134 + 8))(v12, v136);
      sub_1BA384FC4(v42);
      sub_1BA384FC4(v92);
      sub_1BA384FC4(v120);
      v28 = v107;
      sub_1BA384FC4(v107);
      LODWORD(v136) = 0;
      LODWORD(v135) = 1;
      v29 = (uint64_t)v137;
    }
    else
    {
      v71 = v140;
      v72 = v141;
      v67 = v139;
      v68 = v142;
      v69 = v143;
      v70 = v144;
      v44 = v145;
      v106 = v146;
      v45 = v147;
      v46 = v148;
      v47 = v149;
      v48 = v150;
      v49 = v151;
      sub_1BA42823C();
      v205 = 5;
      v97 = v49;
      v96 = v48;
      v95 = v47;
      v94 = v46;
      v93 = v45;
      v50 = v67;
      v98 = v44;
      v51 = v106;
      sub_1BA384B64(v67);
      sub_1BA42A1D4();
      v52 = v136;
      v53 = v133;
      sub_1BA4382E4();
      v133 = v53;
      v54 = v124;
      v55 = v132;
      v56 = v131;
      v57 = v130;
      if (!v53)
      {
        (*(void (**)(char *, uint64_t))(v134 + 8))(v12, v52);
        v136 = v206;
        v138[0] = v107;
        v138[1] = v123;
        v138[2] = v54;
        v138[3] = v126;
        v138[4] = v127;
        v138[5] = v125;
        v138[6] = v122;
        v138[7] = v121;
        v138[8] = v55;
        v138[9] = v56;
        v138[10] = v57;
        v138[11] = v129;
        v138[12] = v128;
        v138[13] = v120;
        v138[14] = v119;
        v138[15] = v113;
        v138[16] = v118;
        v138[17] = v117;
        v138[18] = v116;
        v138[19] = v115;
        v138[20] = v112;
        v138[21] = v111;
        v138[22] = v110;
        v138[23] = v109;
        v138[24] = v108;
        v138[25] = v114;
        v138[26] = v92;
        v138[27] = v99;
        v138[28] = v100;
        v138[29] = v101;
        v138[30] = v102;
        v138[31] = v103;
        v138[32] = v104;
        v138[33] = v105;
        v138[34] = v91;
        v138[35] = v90;
        v138[36] = v89;
        v138[37] = v88;
        v138[38] = v87;
        v138[39] = v73;
        v138[40] = v81;
        v138[41] = v82;
        v138[42] = v83;
        v138[43] = v85;
        v138[44] = v86;
        v138[45] = v78;
        v138[46] = v79;
        v138[47] = v84;
        v138[48] = v74;
        v138[49] = v75;
        v138[50] = v76;
        v138[51] = v77;
        v138[52] = v50;
        v138[53] = v71;
        v138[54] = v72;
        v138[55] = v68;
        v138[56] = v69;
        v138[57] = v70;
        v138[58] = v98;
        v138[59] = v51;
        v138[60] = v93;
        v138[61] = v94;
        v138[62] = v95;
        v138[63] = v96;
        v138[64] = v97;
        v138[65] = v206;
        sub_1BA384948(v138);
        sub_1BA384FC4(v67);
        sub_1BA384FC4(v73);
        sub_1BA384FC4(v92);
        sub_1BA384FC4(v120);
        v58 = v132;
        v59 = v107;
        v60 = v123;
        v62 = v126;
        v61 = v127;
        v63 = v125;
        v64 = v121;
        v65 = v122;
        sub_1BA384FC4(v107);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v137);
        v139 = v59;
        v140 = v60;
        v141 = v124;
        v142 = v62;
        v143 = v61;
        v144 = v63;
        v145 = v65;
        v146 = v64;
        v147 = v58;
        v148 = v131;
        v149 = v130;
        v150 = v129;
        v151 = v128;
        v152 = v120;
        v153 = v119;
        v154 = v113;
        v155 = v118;
        v156 = v117;
        v157 = v116;
        v158 = v115;
        v159 = v112;
        v160 = v111;
        v161 = v110;
        v162 = v109;
        v163 = v108;
        v164 = v114;
        v165 = v92;
        v166 = v99;
        v167 = v100;
        v168 = v101;
        v169 = v102;
        v170 = v103;
        v171 = v104;
        v172 = v105;
        v173 = v91;
        v174 = v90;
        v175 = v89;
        v176 = v88;
        v177 = v87;
        v178 = v73;
        v179 = v81;
        v180 = v82;
        v181 = v83;
        v182 = v85;
        v183 = v86;
        v184 = v78;
        v185 = v79;
        v186 = v84;
        v187 = v74;
        v188 = v75;
        v189 = v76;
        v190 = v77;
        v191 = v67;
        v192 = v71;
        v193 = v72;
        v194 = v68;
        v195 = v69;
        v196 = v70;
        v197 = v98;
        v198 = v106;
        v199 = v93;
        v200 = v94;
        v201 = v95;
        v202 = v96;
        v203 = v97;
        v204 = v136;
        sub_1BA385BC8(&v139);
        return memcpy(v135, v138, 0x210uLL);
      }
      (*(void (**)(char *, uint64_t))(v134 + 8))(v12, v52);
      sub_1BA384FC4(v50);
      sub_1BA384FC4(v73);
      sub_1BA384FC4(v92);
      sub_1BA384FC4(v120);
      v28 = v107;
      sub_1BA384FC4(v107);
      LODWORD(v135) = 1;
      LODWORD(v136) = 1;
      v29 = (uint64_t)v137;
    }
    v27 = v80;
  }
  __swift_destroy_boxed_opaque_existential_1(v29);
  sub_1BA384FC4(v28);
  result = (void *)sub_1BA384FC4(v120);
  if (v27)
  {
    if ((_DWORD)v135)
      goto LABEL_14;
  }
  else
  {
    result = (void *)sub_1BA384FC4(v92);
    if ((v135 & 1) != 0)
    {
LABEL_14:
      result = (void *)sub_1BA384FC4(v73);
      if ((v136 & 1) != 0)
        return (void *)sub_1BA384FC4(v67);
      return result;
    }
  }
  if ((_DWORD)v136)
    return (void *)sub_1BA384FC4(v67);
  return result;
}

unint64_t sub_1BA42A14C()
{
  unint64_t result;

  result = qword_1ED5BEB98;
  if (!qword_1ED5BEB98)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA448938, &type metadata for PaywallConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5BEB98);
  }
  return result;
}

unint64_t sub_1BA42A190()
{
  unint64_t result;

  result = qword_1ED5BFA38;
  if (!qword_1ED5BFA38)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA448680, &type metadata for PaywallResourceByLocationConfig);
    atomic_store(result, (unint64_t *)&qword_1ED5BFA38);
  }
  return result;
}

unint64_t sub_1BA42A1D4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[2];

  result = qword_1ED5C0CC8;
  if (!qword_1ED5C0CC8)
  {
    sub_1BA42823C();
    v2 = v1;
    v3 = sub_1BA385778();
    v4[0] = MEMORY[0x1E0DEA9A0];
    v4[1] = v3;
    result = MEMORY[0x1BCCDC37C](MEMORY[0x1E0DEA0D8], v2, v4);
    atomic_store(result, (unint64_t *)&qword_1ED5C0CC8);
  }
  return result;
}

uint64_t sub_1BA42A23C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x53656C6369747261 && a2 == 0xEB0000000074666FLL;
  if (v2 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001BA45BF00 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001BA45BF20 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x80000001BA45BF40 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001BA45BF60 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x48656C6369747261 && a2 == 0xEB00000000647261 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x64726148666470 && a2 == 0xE700000000000000 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x536C656E6E616863 && a2 == 0xEB0000000074666FLL || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x656E697A6167616DLL && a2 == 0xEC00000064656546 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001BA45BF80 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x80000001BA45BFA0 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x6565466F69647561 && a2 == 0xE900000000000064 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x6148656C7A7A7570 && a2 == 0xEA00000000006472)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else
  {
    v6 = sub_1BA4383C8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 12;
    else
      return 13;
  }
}

uint64_t sub_1BA42A79C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  char v42;
  uint64_t v43;

  sub_1BA42C0FC(0, &qword_1ED5C02F8, (void (*)(void))sub_1BA42B260);
  v40 = v5;
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v27 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA42B260();
  sub_1BA43847C();
  v41 = a1;
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  v37 = v6;
  sub_1BA386804(0);
  v42 = 0;
  sub_1BA42B2A4();
  sub_1BA4382E4();
  v10 = v43;
  v42 = 1;
  swift_bridgeObjectRetain();
  sub_1BA4382E4();
  v35 = v10;
  v11 = v43;
  v42 = 2;
  swift_bridgeObjectRetain();
  sub_1BA4382E4();
  v34 = v11;
  v12 = v43;
  v42 = 3;
  swift_bridgeObjectRetain();
  sub_1BA4382E4();
  v36 = v12;
  v13 = v43;
  v42 = 4;
  swift_bridgeObjectRetain();
  sub_1BA4382E4();
  v33 = v13;
  v14 = v43;
  v42 = 5;
  swift_bridgeObjectRetain();
  sub_1BA4382E4();
  v42 = 6;
  v39 = v43;
  swift_bridgeObjectRetain();
  sub_1BA4382E4();
  v42 = 7;
  v38 = v43;
  swift_bridgeObjectRetain();
  sub_1BA4382E4();
  v42 = 8;
  v32 = v43;
  swift_bridgeObjectRetain();
  sub_1BA4382E4();
  v31 = v14;
  v42 = 9;
  v15 = v43;
  swift_bridgeObjectRetain();
  sub_1BA4382E4();
  v42 = 10;
  v30 = v43;
  swift_bridgeObjectRetain();
  sub_1BA4382E4();
  v42 = 11;
  v28 = v43;
  swift_bridgeObjectRetain();
  sub_1BA4382E4();
  v42 = 12;
  v29 = v43;
  swift_bridgeObjectRetain();
  sub_1BA4382E4();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v9, v40);
  v40 = v43;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v27 = v15;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v16 = v38;
  swift_bridgeObjectRelease();
  v17 = v39;
  swift_bridgeObjectRelease();
  v18 = v31;
  swift_bridgeObjectRelease();
  v19 = v33;
  swift_bridgeObjectRelease();
  v20 = v36;
  swift_bridgeObjectRelease();
  v21 = v34;
  swift_bridgeObjectRelease();
  v22 = v35;
  result = swift_bridgeObjectRelease();
  *a2 = v22;
  a2[1] = v21;
  a2[2] = v20;
  a2[3] = v19;
  a2[4] = v18;
  a2[5] = v17;
  v24 = v32;
  a2[6] = v16;
  a2[7] = v24;
  v25 = v30;
  a2[8] = v27;
  a2[9] = v25;
  v26 = v29;
  a2[10] = v28;
  a2[11] = v26;
  a2[12] = v40;
  return result;
}

unint64_t sub_1BA42B260()
{
  unint64_t result;

  result = qword_1ED5BFA20;
  if (!qword_1ED5BFA20)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA4488E8, &type metadata for PaywallResourceByLocationConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5BFA20);
  }
  return result;
}

unint64_t sub_1BA42B2A4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_1ED5C0188;
  if (!qword_1ED5C0188)
  {
    sub_1BA386804(255);
    v2 = v1;
    v3 = sub_1BA2F25C8(&qword_1ED5BECA0, (uint64_t (*)(uint64_t))type metadata accessor for PaywallResource, (uint64_t)&unk_1BA4488C0);
    result = MEMORY[0x1BCCDC37C](MEMORY[0x1E0DEAF40], v2, &v3);
    atomic_store(result, (unint64_t *)&qword_1ED5C0188);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PaywallResourceByLocationConfig.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF4)
    goto LABEL_17;
  if (a2 + 12 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 12) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 12;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 12;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 12;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xD;
  v8 = v6 - 13;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PaywallResourceByLocationConfig.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 12 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 12) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF3)
    return ((uint64_t (*)(void))((char *)&loc_1BA42B3F8 + 4 * byte_1BA448631[v4]))();
  *a1 = a2 + 12;
  return ((uint64_t (*)(void))((char *)sub_1BA42B42C + 4 * byte_1BA44862C[v4]))();
}

uint64_t sub_1BA42B42C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA42B434(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA42B43CLL);
  return result;
}

uint64_t sub_1BA42B448(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA42B450);
  *(_BYTE *)result = a2 + 12;
  return result;
}

uint64_t sub_1BA42B454(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA42B45C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PaywallResourceByLocationConfig.CodingKeys()
{
  return &type metadata for PaywallResourceByLocationConfig.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for PaywallConfig.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_1BA42B4C4 + 4 * byte_1BA44863B[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1BA42B4F8 + 4 * byte_1BA448636[v4]))();
}

uint64_t sub_1BA42B4F8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA42B500(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA42B508);
  return result;
}

uint64_t sub_1BA42B514(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA42B51CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_1BA42B520(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA42B528(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PaywallConfig.CodingKeys()
{
  return &type metadata for PaywallConfig.CodingKeys;
}

_QWORD *sub_1BA42B544(_QWORD *a1, char *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *(_QWORD *)a2;
    *v4 = *(_QWORD *)a2;
    v4 = (_QWORD *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *((_QWORD *)a2 + 1);
    *a1 = *(_QWORD *)a2;
    a1[1] = v7;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = &a2[v8];
    v11 = sub_1BA4369B8();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      sub_1BA384908(0);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v16 = a3[6];
    v17 = (char *)v4 + v16;
    v18 = &a2[v16];
    if (v13(&a2[v16], 1, v11))
    {
      sub_1BA384908(0);
      memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v17, v18, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v17, 0, 1, v11);
    }
    *((_BYTE *)v4 + a3[7]) = a2[a3[7]];
  }
  return v4;
}

uint64_t sub_1BA42B6C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t result;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_1BA4369B8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v8 = a1 + *(int *)(a2 + 24);
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v7)(v8, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  return result;
}

_QWORD *sub_1BA42B774(_QWORD *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;

  v6 = *((_QWORD *)a2 + 1);
  *a1 = *(_QWORD *)a2;
  a1[1] = v6;
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = &a2[v7];
  v10 = sub_1BA4369B8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    sub_1BA384908(0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v14 = a3[6];
  v15 = (char *)a1 + v14;
  v16 = &a2[v14];
  if (v12(&a2[v14], 1, v10))
  {
    sub_1BA384908(0);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v15, v16, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v15, 0, 1, v10);
  }
  *((_BYTE *)a1 + a3[7]) = a2[a3[7]];
  return a1;
}

char *sub_1BA42B8C4(char *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  int v18;
  int v19;
  uint64_t v20;

  *(_QWORD *)a1 = *a2;
  *((_QWORD *)a1 + 1) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = (char *)a2 + v6;
  v9 = sub_1BA4369B8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    sub_1BA384908(0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  v15 = a3[6];
  v16 = &a1[v15];
  v17 = (char *)a2 + v15;
  v18 = v11(&a1[v15], 1, v9);
  v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v16, v17, v9);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    sub_1BA384908(0);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v16, v17, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
LABEL_13:
  a1[a3[7]] = *((_BYTE *)a2 + a3[7]);
  return a1;
}

_OWORD *sub_1BA42BAAC(_OWORD *a1, char *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;

  *a1 = *(_OWORD *)a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = &a2[v6];
  v9 = sub_1BA4369B8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    sub_1BA384908(0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v13 = a3[6];
  v14 = (char *)a1 + v13;
  v15 = &a2[v13];
  if (v11(&a2[v13], 1, v9))
  {
    sub_1BA384908(0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v14, v15, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  *((_BYTE *)a1 + a3[7]) = a2[a3[7]];
  return a1;
}

char *sub_1BA42BBEC(char *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  int v19;
  int v20;
  uint64_t v21;

  v6 = a2[1];
  *(_QWORD *)a1 = *a2;
  *((_QWORD *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  v7 = a3[5];
  v8 = &a1[v7];
  v9 = (char *)a2 + v7;
  v10 = sub_1BA4369B8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    sub_1BA384908(0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  v16 = a3[6];
  v17 = &a1[v16];
  v18 = (char *)a2 + v16;
  v19 = v12(&a1[v16], 1, v10);
  v20 = v12(v18, 1, v10);
  if (!v19)
  {
    if (!v20)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v17, v18, v10);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v17, v10);
    goto LABEL_12;
  }
  if (v20)
  {
LABEL_12:
    sub_1BA384908(0);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v17, v18, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v17, 0, 1, v10);
LABEL_13:
  a1[a3[7]] = *((_BYTE *)a2 + a3[7]);
  return a1;
}

uint64_t sub_1BA42BDC4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BA42BDD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    sub_1BA384908(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_1BA42BE4C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BA42BE58(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    sub_1BA384908(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

void sub_1BA42BECC()
{
  unint64_t v0;

  sub_1BA384908(319);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

unint64_t sub_1BA42BF50()
{
  unint64_t result;

  result = qword_1EF28F790;
  if (!qword_1EF28F790)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA4487E0, &type metadata for PaywallConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF28F790);
  }
  return result;
}

unint64_t sub_1BA42BF98()
{
  unint64_t result;

  result = qword_1EF28F798;
  if (!qword_1EF28F798)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA448898, &type metadata for PaywallResourceByLocationConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF28F798);
  }
  return result;
}

unint64_t sub_1BA42BFE0()
{
  unint64_t result;

  result = qword_1ED5BFA30;
  if (!qword_1ED5BFA30)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA448808, &type metadata for PaywallResourceByLocationConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5BFA30);
  }
  return result;
}

unint64_t sub_1BA42C028()
{
  unint64_t result;

  result = qword_1ED5BFA28;
  if (!qword_1ED5BFA28)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA448830, &type metadata for PaywallResourceByLocationConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5BFA28);
  }
  return result;
}

unint64_t sub_1BA42C070()
{
  unint64_t result;

  result = qword_1ED5BEBA8;
  if (!qword_1ED5BEBA8)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA448750, &type metadata for PaywallConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5BEBA8);
  }
  return result;
}

unint64_t sub_1BA42C0B8()
{
  unint64_t result;

  result = qword_1ED5BEBA0;
  if (!qword_1ED5BEBA0)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA448778, &type metadata for PaywallConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5BEBA0);
  }
  return result;
}

void sub_1BA42C0FC(uint64_t a1, unint64_t *a2, void (*a3)(void))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3();
    v4 = sub_1BA438338();
    if (!v5)
      atomic_store(v4, a2);
  }
}

unint64_t sub_1BA42C154()
{
  unint64_t result;

  result = qword_1ED5BEC78;
  if (!qword_1ED5BEC78)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA448A40, &type metadata for PaywallResource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5BEC78);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for PaywallResource.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_1BA42C1E4 + 4 * byte_1BA448645[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1BA42C218 + 4 * byte_1BA448640[v4]))();
}

uint64_t sub_1BA42C218(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA42C220(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA42C228);
  return result;
}

uint64_t sub_1BA42C234(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA42C23CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1BA42C240(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA42C248(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PaywallResource.CodingKeys()
{
  return &type metadata for PaywallResource.CodingKeys;
}

unint64_t sub_1BA42C268()
{
  unint64_t result;

  result = qword_1EF28F7A0;
  if (!qword_1EF28F7A0)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA448A18, &type metadata for PaywallResource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF28F7A0);
  }
  return result;
}

unint64_t sub_1BA42C2B0()
{
  unint64_t result;

  result = qword_1ED5BEC88;
  if (!qword_1ED5BEC88)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA448988, &type metadata for PaywallResource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5BEC88);
  }
  return result;
}

unint64_t sub_1BA42C2F8()
{
  unint64_t result;

  result = qword_1ED5BEC80;
  if (!qword_1ED5BEC80)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA4489B0, &type metadata for PaywallResource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5BEC80);
  }
  return result;
}

uint64_t sub_1BA42C33C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x656372756F736572 && a2 == 0xEA00000000006449;
  if (v2 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x567377654E6E696DLL && a2 == 0xEE006E6F69737265 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x567377654E78616DLL && a2 == 0xEE006E6F69737265 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7250646C756F6873 && a2 == 0xED00006D72617765)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_1BA4383C8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t ArticleAccessMap.map.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ArticleAccessMap.map.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*ArticleAccessMap.map.modify())()
{
  return nullsub_1;
}

NewsSubscription::ArticleAccessMap __swiftcall ArticleAccessMap.init(map:)(NewsSubscription::ArticleAccessMap map)
{
  NewsSubscription::ArticleAccessMap *v1;

  v1->map._rawValue = map.map._rawValue;
  return map;
}

uint64_t ArticleAccessMap.articleAccess(for:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  char v9;
  char v10;

  v5 = *v3;
  if (*(_QWORD *)(v5 + 16))
  {
    v7 = result;
    swift_bridgeObjectRetain();
    v8 = sub_1BA31A888(v7, a2);
    if ((v9 & 1) != 0)
      v10 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v8);
    else
      v10 = 2;
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 2;
  }
  *a3 = v10;
  return result;
}

ValueMetadata *type metadata accessor for ArticleAccessMap()
{
  return &type metadata for ArticleAccessMap;
}

uint64_t dispatch thunk of BundleSubscriptionDetectionManagerType.showWelcomePage()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

id sub_1BA42C638()
{
  void *v0;
  void *v1;
  objc_class *ObjectType;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  objc_super v8;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  if (qword_1ED5BBF70 != -1)
    swift_once();
  v3 = sub_1BA436AD8();
  __swift_project_value_buffer(v3, (uint64_t)qword_1ED5C85E0);
  v4 = sub_1BA436AC0();
  v5 = sub_1BA437F30();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1BA2EF000, v4, v5, "De-initializing BundleSubscriptionManager!", v6, 2u);
    MEMORY[0x1BCCDC430](v6, -1, -1);
  }

  v8.receiver = v1;
  v8.super_class = ObjectType;
  return objc_msgSendSuper2(&v8, sel_dealloc);
}

void sub_1BA42C8F0()
{
  void *v0;
  void *v1;

  swift_getObjectType();
  sub_1BA2FAE14();
  sub_1BA4369DC();
  v0 = (void *)sub_1BA43688C();
  sub_1BA4368F8();
  swift_release();

  v1 = (void *)sub_1BA43688C();
  sub_1BA436904();
  swift_release();
  swift_release();

}

uint64_t sub_1BA42C9B0()
{
  swift_getObjectType();
  return sub_1BA436244();
}

uint64_t sub_1BA42C9F4()
{
  swift_getObjectType();
  return sub_1BA43625C();
}

uint64_t sub_1BA42CA30()
{
  swift_getObjectType();
  return sub_1BA436250();
}

uint64_t storeEnumTagSinglePayload for BundleSubscriptionDetectionManager.LegacyFamilyMemberPresentationStatusEvent(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1BA42CBD4 + 4 * asc_1BA448AC0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1BA42CBF4 + 4 * byte_1BA448AC5[v4]))();
}

_BYTE *sub_1BA42CBD4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1BA42CBF4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BA42CBFC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BA42CC04(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BA42CC0C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BA42CC14(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for BundleSubscriptionDetectionManager.LegacyFamilyMemberPresentationStatusEvent()
{
  return &type metadata for BundleSubscriptionDetectionManager.LegacyFamilyMemberPresentationStatusEvent;
}

void sub_1BA42CC30()
{
  sub_1BA42CC60();
}

void sub_1BA42CC60()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;

  swift_getObjectType();
  v0 = sub_1BA436724();
  MEMORY[0x1E0C80A78](v0, v1);
  v2 = (char *)&loc_1BA42CCE0 + dword_1BA42D16C[sub_1BA42D2EC()];
  __asm { BR              X10 }
}

void sub_1BA42CCF0()
{
  uint64_t v0;

  sub_1BA2F299C(0, (unint64_t *)&qword_1ED5BE730);
  *(_QWORD *)(v0 - 104) = sub_1BA438080();
  sub_1BA437F30();
  sub_1BA436AA8();

}

uint64_t sub_1BA42CD68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (_QWORD *)(v2
                + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_postPurchaseOnboardingManager);
  v4 = *(_QWORD *)(v2
                 + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_postPurchaseOnboardingManager
                 + 24);
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 16))(6, v1, v0, v4, v5);
}

uint64_t sub_1BA42D188()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  sub_1BA42D2EC();
  if (qword_1ED5BBF70 != -1)
    swift_once();
  v0 = sub_1BA436AD8();
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED5C85E0);
  v1 = sub_1BA436AC0();
  v2 = sub_1BA437F30();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v3 = 67109120;
    sub_1BA4380A4();
    _os_log_impl(&dword_1BA2EF000, v1, v2, "Post Purchase Onboarding Requires Presentation: %{BOOL}d.", v3, 8u);
    MEMORY[0x1BCCDC430](v3, -1, -1);
  }

  sub_1BA2FC03C(0, (unint64_t *)&qword_1ED5C0F10, MEMORY[0x1E0DEAFA0], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DB4D08]);
  swift_allocObject();
  return sub_1BA436928();
}

uint64_t sub_1BA42D2EC()
{
  uint64_t v0;
  char *v1;
  void *v2;
  unint64_t v3;
  id v4;
  unsigned int v5;
  uint64_t result;
  void *v7;
  id v8;
  char v9;
  char v10;
  char v11;
  uint64_t v12;
  unsigned int v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[24];
  uint64_t v21;

  swift_getObjectType();
  v1 = (char *)objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_bundleSubscriptionManager), sel_cachedSubscription);
  if (objc_getAssociatedObject(v1, v1 + 1))
  {
    sub_1BA4380EC();
    swift_unknownObjectRelease();
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  sub_1BA2FBFDC((uint64_t)&v18, (uint64_t)v20);
  if (v21)
  {
    sub_1BA2F299C(0, (unint64_t *)&qword_1ED5BE710);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v2 = v17;
      v3 = (unint64_t)objc_msgSend(v17, sel_integerValue);
      if (v3 == -1)
        goto LABEL_18;
      goto LABEL_10;
    }
  }
  else
  {
    sub_1BA319F10((uint64_t)v20);
  }
  v2 = 0;
  v3 = 0;
LABEL_10:
  if (objc_getAssociatedObject(v1, (const void *)~v3))
  {
    sub_1BA4380EC();
    swift_unknownObjectRelease();
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  sub_1BA2FBFDC((uint64_t)&v18, (uint64_t)v20);
  if (v21)
  {
    sub_1BA2F299C(0, (unint64_t *)&qword_1ED5BE710);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v4 = v17;
      v5 = objc_msgSend(v4, sel_integerValue);

      if ((((v5 - 182) ^ v3) & 1) == 0)
        goto LABEL_27;
      goto LABEL_19;
    }
  }
  else
  {
    sub_1BA319F10((uint64_t)v20);
  }
LABEL_18:

  if (((v3 ^ 0xFFFFFF4A) & 1) == 0)
  {
LABEL_27:

    return 0;
  }
LABEL_19:
  result = (uint64_t)objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_configurationManager), sel_configuration);
  if (!result)
  {
    __break(1u);
    return result;
  }
  v7 = (void *)result;
  if ((objc_msgSend((id)result, sel_respondsToSelector_, sel_paidBundleConfig) & 1) == 0)
  {

    swift_unknownObjectRelease();
    return 0;
  }
  v8 = objc_msgSend(v7, sel_paidBundleConfig);
  swift_unknownObjectRelease();
  if (!objc_msgSend(v8, sel_areMagazinesEnabled))
  {

    goto LABEL_27;
  }
  if (objc_msgSend(v1, sel_isPaidBundleViaOfferActivated))
  {
    v9 = sub_1BA42E238(7, v8);

    if ((v9 & 1) != 0)
      return 5;
    return 0;
  }
  if (objc_msgSend(v1, sel_isAmplifyUser))
  {
    v10 = sub_1BA42E238(6, v8);

    return (v10 & 1) != 0;
  }
  if (objc_msgSend(v1, sel_isServicesBundleUser))
  {
    v11 = sub_1BA42E238(5, v8);

    if ((v11 & 1) == 0)
      return 0;
    return 2;
  }
  else if ((sub_1BA42E238(4, v8) & 1) != 0)
  {
    v13 = objc_msgSend(v1, sel_isPurchaser);

    if (v13)
      return 0;
    else
      return 3;
  }
  else
  {
    if (qword_1EF28B340 != -1)
      swift_once();
    sub_1BA2F2D28((unint64_t *)&unk_1EF28F7E8, v12, (uint64_t (*)(uint64_t))type metadata accessor for BundleSubscriptionDetectionManager, (uint64_t)&unk_1BA448C84);
    sub_1BA43610C();
    if ((v20[0] & 1) != 0 || (objc_msgSend(v1, sel_isPurchaser) & 1) != 0)
    {

      return 0;
    }
    v14 = objc_msgSend(v8, sel_familySharingLandingPageArticleID);
    if (!v14)
    {
      sub_1BA2F299C(0, (unint64_t *)&qword_1ED5BE730);
      v16 = (void *)sub_1BA438080();
      sub_1BA437F30();
      sub_1BA436AA8();

      return 0;
    }
    v15 = v14;

    return 4;
  }
}

void sub_1BA42D770()
{
  uint64_t v0;
  void *v1;

  sub_1BA437F24();
  sub_1BA306EEC();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1BA43A710;
  sub_1BA2F2B30(0, (unint64_t *)&qword_1ED5BE7B0);
  sub_1BA43823C();
  *(_QWORD *)(v0 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v0 + 64) = sub_1BA307848();
  *(_QWORD *)(v0 + 32) = 0;
  *(_QWORD *)(v0 + 40) = 0xE000000000000000;
  sub_1BA2F299C(0, (unint64_t *)&qword_1ED5BE730);
  v1 = (void *)sub_1BA438080();
  sub_1BA436AA8();
  swift_bridgeObjectRelease();

}

void sub_1BA42D880(void (*a1)(void *, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v5 = a3 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x1BCCDC4E4](v5);
  if (v6)
  {
    v7 = (void *)v6;
    if ((sub_1BA42D9A4() & 1) != 0)
    {
      v8 = swift_allocObject();
      *(_QWORD *)(v8 + 16) = a1;
      *(_QWORD *)(v8 + 24) = a2;
      swift_retain();
      sub_1BA42CC60();

      swift_release();
      return;
    }

  }
  v9 = sub_1BA437138();
  sub_1BA2F2D28(&qword_1EF28C560, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0DBA0A0], MEMORY[0x1E0DBA0A8]);
  v10 = (void *)swift_allocError();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(v11, *MEMORY[0x1E0DBA098], v9);
  a1(v10, 1);

}

uint64_t sub_1BA42D9A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  uint64_t result;
  void *v17;
  id v18;
  double v19;
  double v20;
  uint64_t (*v21)(char *, uint64_t);
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  void (*v38)(char *, uint64_t);
  id v39;
  os_log_t v40;
  uint64_t v41;
  _QWORD v42[2];
  int v43;
  void (*v44)(char *, uint64_t);
  os_log_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v1 = sub_1BA435FBC();
  v2 = *(_QWORD *)(v1 - 8);
  v4 = MEMORY[0x1E0C80A78](v1, v3);
  v6 = (char *)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v4, v7);
  v10 = (char *)v42 - v9;
  MEMORY[0x1E0C80A78](v8, v11);
  v13 = (char *)v42 - v12;
  v14 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_bundleSubscriptionManager), sel_cachedSubscription);
  v15 = objc_msgSend(v14, sel_initialPurchaseTimestamp);

  if (!v15)
    return 0;
  result = (uint64_t)objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_configurationManager), sel_configuration);
  if (!result)
    goto LABEL_17;
  v17 = (void *)result;
  if ((objc_msgSend((id)result, sel_respondsToSelector_, sel_paidBundleConfig) & 1) == 0)
  {

    swift_unknownObjectRelease();
    return 0;
  }
  v18 = objc_msgSend(v17, sel_paidBundleConfig);
  swift_unknownObjectRelease();
  objc_msgSend(v15, sel_doubleValue);
  sub_1BA435F8C();
  sub_1BA435FB0();
  sub_1BA435F50();
  v20 = v19;
  v21 = *(uint64_t (**)(char *, uint64_t))(v2 + 8);
  result = v21(v10, v1);
  if ((~*(_QWORD *)&v20 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (v20 <= -9.22337204e18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v20 >= 9.22337204e18)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    return result;
  }
  if ((uint64_t)objc_msgSend(v18, sel_maxAllowedSubscriptionDetectionTime) < (uint64_t)v20)
  {
    v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3578]), sel_init);
    objc_msgSend(v22, sel_setTimeStyle_, 1);
    objc_msgSend(v22, sel_setDateStyle_, 1);
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v6, v13, v1);
    sub_1BA2F299C(0, (unint64_t *)&qword_1ED5BE730);
    v23 = v22;
    v24 = v18;
    v25 = v23;
    v26 = v24;
    v27 = sub_1BA438080();
    v28 = sub_1BA437F30();
    v29 = v28;
    if (os_log_type_enabled(v27, v28))
    {
      v30 = swift_slowAlloc();
      v44 = (void (*)(char *, uint64_t))v21;
      v31 = v30;
      v46 = swift_slowAlloc();
      v48 = v46;
      *(_DWORD *)v31 = 136315394;
      v42[1] = v31 + 4;
      v45 = v27;
      v32 = (void *)sub_1BA435F68();
      v33 = objc_msgSend(v25, sel_stringFromDate_, v32);
      v43 = v29;
      v34 = v33;

      v35 = sub_1BA437C3C();
      v37 = v36;

      v47 = sub_1BA348AF8(v35, v37, &v48);
      sub_1BA4380A4();

      swift_bridgeObjectRelease();
      v38 = v44;
      v44(v6, v1);
      *(_WORD *)(v31 + 12) = 2048;
      v39 = objc_msgSend(v26, sel_maxAllowedSubscriptionDetectionTime);

      v47 = (uint64_t)v39;
      sub_1BA4380A4();

      v40 = v45;
      _os_log_impl(&dword_1BA2EF000, v45, (os_log_type_t)v43, "BundleSubscriptionDetectionManager: User does not qualify for onboarding flow since the purchase date=%s has surpassed maximum allowed subscription detection time=%lld. Nothing will be presented.", (uint8_t *)v31, 0x16u);
      v41 = v46;
      swift_arrayDestroy();
      MEMORY[0x1BCCDC430](v41, -1, -1);
      MEMORY[0x1BCCDC430](v31, -1, -1);

      v38(v13, v1);
    }
    else
    {

      v21(v6, v1);
      v21(v13, v1);
    }
    return 0;
  }
  v21(v13, v1);

  return 1;
}

uint64_t sub_1BA42DE68()
{
  void *v0;
  void *v1;
  uint64_t v2;

  sub_1BA2FAE14();
  sub_1BA4369DC();
  v0 = (void *)sub_1BA43688C();
  sub_1BA4368EC();
  swift_release();

  v1 = (void *)sub_1BA43688C();
  v2 = sub_1BA436904();
  swift_release();

  return v2;
}

void (*sub_1BA42DF24())(void (*a1)(void *, uint64_t), uint64_t a2)
{
  swift_allocObject();
  swift_unknownObjectWeakInit();
  return sub_1BA42E3A4;
}

uint64_t sub_1BA42DF70()
{
  return sub_1BA4363D0();
}

uint64_t sub_1BA42DF98(uint64_t a1, uint64_t a2)
{
  return sub_1BA2F2D28((unint64_t *)&unk_1EF28F7E8, a2, (uint64_t (*)(uint64_t))type metadata accessor for BundleSubscriptionDetectionManager, (uint64_t)&unk_1BA448C84);
}

uint64_t sub_1BA42DFC4()
{
  return sub_1BA42E3AC();
}

uint64_t sub_1BA42DFD8()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1BA42DFFC(char a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t ObjectType;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  swift_getObjectType();
  if ((a1 & 1) != 0)
  {
    sub_1BA2F299C(0, (unint64_t *)&qword_1ED5BE730);
    v10 = (void *)sub_1BA438080();
    sub_1BA437F30();
    sub_1BA436AA8();

    return;
  }
  if (*(_QWORD *)(v1
                 + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_presentationOperationManager))
  {
    v3 = *(_QWORD *)(v1
                   + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_presentationOperationManager
                   + 8);
    ObjectType = swift_getObjectType();
    swift_unknownObjectRetain();
    MEMORY[0x1BCCDABE8](ObjectType, v3);
    sub_1BA4364FC();
    swift_release();
    v5 = sub_1BA4371F8();
    if ((v5 & 1) != 0)
    {
      MEMORY[0x1E0C80A78](v5, v6);
      sub_1BA2FAE14();
      sub_1BA4369DC();
      v7 = (void *)sub_1BA43688C();
      sub_1BA4368F8();
      swift_release();

      v8 = (void *)sub_1BA43688C();
      sub_1BA436904();
      swift_unknownObjectRelease();
      swift_release();
      swift_release();

      return;
    }
    swift_unknownObjectRelease();
  }
  sub_1BA2F299C(0, (unint64_t *)&qword_1ED5BE730);
  v9 = (void *)sub_1BA438080();
  sub_1BA437F30();
  sub_1BA436AA8();

}

uint64_t sub_1BA42E238(uint64_t a1, id a2)
{
  uint64_t result;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;

  result = (uint64_t)objc_msgSend(a2, sel_postPurchaseOnboardingConfigurationsByType);
  if (result)
  {
    v4 = (void *)result;
    sub_1BA2F299C(0, (unint64_t *)&qword_1ED5BE710);
    sub_1BA37EE1C();
    sub_1BA36C000();
    v5 = sub_1BA437BD0();

    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithUnsignedInteger_, a1);
    v7 = v6;
    if (*(_QWORD *)(v5 + 16) && (v8 = sub_1BA31A944((uint64_t)v6), (v9 & 1) != 0))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v8);
      swift_bridgeObjectRetain();

      swift_bridgeObjectRelease();
      if (v10 >> 62)
      {
        swift_bridgeObjectRetain();
        v11 = sub_1BA43826C();
        swift_bridgeObjectRelease();
      }
      else
      {
        v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (v11)
        return 1;
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return 0;
  }
  return result;
}

uint64_t sub_1BA42E380()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1BA42E3A4(void (*a1)(void *, uint64_t), uint64_t a2)
{
  uint64_t v2;

  sub_1BA42D880(a1, a2, v2);
}

uint64_t sub_1BA42E3AC()
{
  swift_getObjectType();
  return sub_1BA2F43C8();
}

uint64_t dispatch thunk of DynamicViewControllerResultDelegate.dynamicViewController(_:purchaseDidSucceed:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of DynamicViewControllerResultDelegate.dynamicViewController(_:purchaseDidFail:error:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

void sub_1BA42E3FC(void *a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t ObjectType;
  void (*v28)(void *, uint64_t, void *, uint64_t, uint64_t);
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;

  v33 = a1;
  sub_1BA3090BC();
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = type metadata accessor for PurchaseContext();
  v9 = *(_QWORD *)(v32 - 8);
  MEMORY[0x1E0C80A78](v32, v10);
  v31 = (uint64_t)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED5C0D38 != -1)
    swift_once();
  sub_1BA306EEC();
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1BA43A7B0;
  v35 = a2;
  sub_1BA42F660(0, &qword_1EF28F8A0, (uint64_t)&unk_1EF28F8A8, 0x1E0CFDA30, (void (*)(uint64_t, uint64_t, uint64_t))sub_1BA2F299C);
  v13 = a2;
  v14 = sub_1BA437C78();
  v16 = v15;
  v17 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v12 + 56) = MEMORY[0x1E0DEA968];
  v18 = sub_1BA307848();
  *(_QWORD *)(v12 + 64) = v18;
  *(_QWORD *)(v12 + 32) = v14;
  *(_QWORD *)(v12 + 40) = v16;
  v35 = a3;
  v19 = a3;
  sub_1BA42F660(0, (unint64_t *)&unk_1ED5BCCC0, (uint64_t)&qword_1ED5BE7B0, MEMORY[0x1E0DEDAF0], (void (*)(uint64_t, uint64_t, uint64_t))sub_1BA2F2B30);
  v20 = sub_1BA437C78();
  *(_QWORD *)(v12 + 96) = v17;
  *(_QWORD *)(v12 + 104) = v18;
  *(_QWORD *)(v12 + 72) = v20;
  *(_QWORD *)(v12 + 80) = v21;
  sub_1BA437F30();
  sub_1BA436AA8();
  swift_bridgeObjectRelease();
  if (a2)
  {
    sub_1BA42E730(v33);
  }
  else if (a3)
  {
    v22 = v34;
    v23 = v34 + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_purchaseContext;
    swift_beginAccess();
    sub_1BA3E0FA8(v23, (uint64_t)v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, v32) == 1)
    {
      sub_1BA3000D8((uint64_t)v8, (uint64_t (*)(_QWORD))sub_1BA3090BC);
    }
    else
    {
      v24 = v31;
      sub_1BA320C44((uint64_t)v8, v31, (uint64_t (*)(_QWORD))type metadata accessor for PurchaseContext);
      v25 = (_QWORD *)(v22 + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_resultDelegate);
      swift_beginAccess();
      if (*v25)
      {
        v26 = v25[1];
        swift_endAccess();
        ObjectType = swift_getObjectType();
        v28 = *(void (**)(void *, uint64_t, void *, uint64_t, uint64_t))(v26 + 16);
        v29 = a3;
        swift_unknownObjectRetain();
        v28(v33, v24, a3, ObjectType, v26);

        swift_unknownObjectRelease();
        sub_1BA3000D8(v24, (uint64_t (*)(_QWORD))type metadata accessor for PurchaseContext);
      }
      else
      {
        v30 = a3;
        sub_1BA3000D8(v24, (uint64_t (*)(_QWORD))type metadata accessor for PurchaseContext);
        swift_endAccess();

      }
    }
  }
}

uint64_t sub_1BA42E730(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD aBlock[6];

  v2 = v1;
  sub_1BA3090BC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v8 = MEMORY[0x1E0C80A78](v4, v7);
  v9 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&aBlock[-1] - v11;
  v13 = v2 + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_purchaseContext;
  swift_beginAccess();
  sub_1BA3E0FA8(v13, (uint64_t)v12);
  v14 = type metadata accessor for PurchaseContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v9, 1, 1, v14);
  swift_beginAccess();
  sub_1BA31FF8C((uint64_t)v9, v13);
  swift_endAccess();
  v15 = *(void **)(v2 + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_bundleSubscriptionManager);
  v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1BA3E0FA8((uint64_t)v12, (uint64_t)v9);
  v17 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v18 = (v6 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  v19 = swift_allocObject();
  sub_1BA320C44((uint64_t)v9, v19 + v17, (uint64_t (*)(_QWORD))sub_1BA3090BC);
  *(_QWORD *)(v19 + v18) = v16;
  *(_QWORD *)(v19 + ((v18 + 15) & 0xFFFFFFFFFFFFFFF8)) = a1;
  aBlock[4] = sub_1BA42F85C;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BA31F64C;
  aBlock[3] = &block_descriptor_37;
  v20 = _Block_copy(aBlock);
  v21 = a1;
  swift_release();
  objc_msgSend(v15, sel_refreshBundleSubscriptionWithCachePolicy_hideBundleDetectionUI_completion_, 3, 1, v20);
  _Block_release(v20);
  return sub_1BA3000D8((uint64_t)v12, (uint64_t (*)(_QWORD))sub_1BA3090BC);
}

void sub_1BA42E964(void *a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t ObjectType;
  void (*v28)(void *, uint64_t, void *, uint64_t, uint64_t);
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;

  v33 = a1;
  sub_1BA3090BC();
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = type metadata accessor for PurchaseContext();
  v9 = *(_QWORD *)(v32 - 8);
  MEMORY[0x1E0C80A78](v32, v10);
  v31 = (uint64_t)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED5C0D38 != -1)
    swift_once();
  sub_1BA306EEC();
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1BA43A7B0;
  v35 = a2;
  sub_1BA42F660(0, (unint64_t *)&unk_1EF28F880, (uint64_t)&unk_1EF28C3B0, 0x1E0CFDBF8, (void (*)(uint64_t, uint64_t, uint64_t))sub_1BA2F299C);
  v13 = a2;
  v14 = sub_1BA437C78();
  v16 = v15;
  v17 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v12 + 56) = MEMORY[0x1E0DEA968];
  v18 = sub_1BA307848();
  *(_QWORD *)(v12 + 64) = v18;
  *(_QWORD *)(v12 + 32) = v14;
  *(_QWORD *)(v12 + 40) = v16;
  v35 = a3;
  v19 = a3;
  sub_1BA42F660(0, (unint64_t *)&unk_1ED5BCCC0, (uint64_t)&qword_1ED5BE7B0, MEMORY[0x1E0DEDAF0], (void (*)(uint64_t, uint64_t, uint64_t))sub_1BA2F2B30);
  v20 = sub_1BA437C78();
  *(_QWORD *)(v12 + 96) = v17;
  *(_QWORD *)(v12 + 104) = v18;
  *(_QWORD *)(v12 + 72) = v20;
  *(_QWORD *)(v12 + 80) = v21;
  sub_1BA437F30();
  sub_1BA436AA8();
  swift_bridgeObjectRelease();
  if (a2)
  {
    sub_1BA42E730(v33);
  }
  else if (a3)
  {
    v22 = v34;
    v23 = v34 + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_purchaseContext;
    swift_beginAccess();
    sub_1BA3E0FA8(v23, (uint64_t)v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, v32) == 1)
    {
      sub_1BA3000D8((uint64_t)v8, (uint64_t (*)(_QWORD))sub_1BA3090BC);
    }
    else
    {
      v24 = v31;
      sub_1BA320C44((uint64_t)v8, v31, (uint64_t (*)(_QWORD))type metadata accessor for PurchaseContext);
      v25 = (_QWORD *)(v22 + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_resultDelegate);
      swift_beginAccess();
      if (*v25)
      {
        v26 = v25[1];
        swift_endAccess();
        ObjectType = swift_getObjectType();
        v28 = *(void (**)(void *, uint64_t, void *, uint64_t, uint64_t))(v26 + 16);
        v29 = a3;
        swift_unknownObjectRetain();
        v28(v33, v24, a3, ObjectType, v26);

        swift_unknownObjectRelease();
        sub_1BA3000D8(v24, (uint64_t (*)(_QWORD))type metadata accessor for PurchaseContext);
      }
      else
      {
        v30 = a3;
        sub_1BA3000D8(v24, (uint64_t (*)(_QWORD))type metadata accessor for PurchaseContext);
        swift_endAccess();

      }
    }
  }
}

void sub_1BA42ECA4(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void (*a6)(id, void *, void *))
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a3;
  v11 = a4;
  v12 = a1;
  v13 = a5;
  a6(v10, a4, a5);

}

uint64_t sub_1BA42ED28(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t (*v20)(_QWORD);
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t ObjectType;
  uint64_t result;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  _QWORD v38[6];
  _QWORD v39[5];

  sub_1BA3090BC();
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = (char *)v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for PurchaseContext();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12, v14);
  v16 = (char *)v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = a3 + 16;
  if (qword_1ED5C0D38 != -1)
    swift_once();
  sub_1BA306EEC();
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_1BA43A710;
  *(_QWORD *)(v18 + 56) = sub_1BA2F299C(0, &qword_1ED5C0D18);
  *(_QWORD *)(v18 + 64) = sub_1BA42F8B8();
  *(_QWORD *)(v18 + 32) = a1;
  v19 = a1;
  sub_1BA437F30();
  sub_1BA436AA8();
  swift_bridgeObjectRelease();
  sub_1BA3E0FA8(a2, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    v20 = (uint64_t (*)(_QWORD))sub_1BA3090BC;
    v21 = (uint64_t)v11;
    goto LABEL_12;
  }
  sub_1BA320C44((uint64_t)v11, (uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for PurchaseContext);
  if (!objc_msgSend(v19, sel_isSubscribed))
  {
    v20 = (uint64_t (*)(_QWORD))type metadata accessor for PurchaseContext;
    v21 = (uint64_t)v16;
LABEL_12:
    sub_1BA3000D8(v21, v20);
    swift_beginAccess();
    result = MEMORY[0x1BCCDC4E4](v17);
    if (result)
    {
      v29 = (void *)result;
      sub_1BA2F8BB0(result + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_router, (uint64_t)v39);

      v30 = v39[4];
      __swift_project_boxed_opaque_existential_1(v39, v39[3]);
      v38[4] = &type metadata for PurchaseReceiptVerificationFailureAlert;
      v38[5] = sub_1BA32097C();
      sub_1BA4374A4();
      swift_allocObject();
      sub_1BA437468();
      (*(void (**)(void))(v30 + 80))();
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
    }
    return result;
  }
  v22 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_1ED5C1CE0 != -1)
    swift_once();
  objc_msgSend(v22, sel_postNotificationName_object_userInfo_, qword_1ED5C1CD0, 0, 0);

  swift_beginAccess();
  v23 = MEMORY[0x1BCCDC4E4](v17);
  if (v23)
  {
    v24 = (void *)v23;
    v25 = (_QWORD *)(v23 + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_resultDelegate);
    swift_beginAccess();
    if (*v25)
    {
      v26 = v25[1];
      swift_unknownObjectRetain();

      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, char *, uint64_t, uint64_t))(v26 + 8))(a4, v16, ObjectType, v26);
      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
  swift_beginAccess();
  v31 = MEMORY[0x1BCCDC4E4](v17);
  if (v31)
  {
    v32 = (void *)v31;
    if (*((_QWORD *)v16 + 2) == 4)
    {
      *(_QWORD *)(swift_allocObject() + 16) = v31;
      v33 = v32;
      sub_1BA43637C();

      swift_release();
    }
    else
    {
      if (qword_1ED5BBF70 != -1)
        swift_once();
      v34 = sub_1BA436AD8();
      __swift_project_value_buffer(v34, (uint64_t)qword_1ED5C85E0);
      v35 = sub_1BA436AC0();
      v36 = sub_1BA437F30();
      if (os_log_type_enabled(v35, v36))
      {
        v37 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v37 = 0;
        _os_log_impl(&dword_1BA2EF000, v35, v36, "Purchase type is not a bundle via offer. Skipping welcome onboarding.", v37, 2u);
        MEMORY[0x1BCCDC430](v37, -1, -1);
      }

    }
  }
  return sub_1BA3000D8((uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for PurchaseContext);
}

uint64_t sub_1BA42F1F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  id v16;
  uint64_t v17;
  _QWORD *v19;
  uint64_t v20;
  uint64_t ObjectType;
  id v22;
  _BYTE v23[24];

  sub_1BA3090BC();
  v5 = MEMORY[0x1E0C80A78](v3, v4);
  v7 = &v23[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v5, v8);
  v10 = &v23[-v9];
  v11 = type metadata accessor for PurchaseContext();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11, v13);
  v15 = &v23[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_1ED5C1CC8 != -1)
    swift_once();
  objc_msgSend(v16, sel_postNotificationName_object_userInfo_, qword_1ED5C1CB8, 0, 0);

  v17 = v1 + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_purchaseContext;
  swift_beginAccess();
  sub_1BA3E0FA8(v17, (uint64_t)v10);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
    return sub_1BA3000D8((uint64_t)v10, (uint64_t (*)(_QWORD))sub_1BA3090BC);
  sub_1BA320C44((uint64_t)v10, (uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for PurchaseContext);
  v19 = (_QWORD *)(v1 + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_resultDelegate);
  swift_beginAccess();
  if (*v19)
  {
    v20 = v19[1];
    swift_endAccess();
    ObjectType = swift_getObjectType();
    swift_unknownObjectRetain();
    v22 = (id)AMSError();
    (*(void (**)(uint64_t, _BYTE *, id, uint64_t, uint64_t))(v20 + 16))(a1, v15, v22, ObjectType, v20);
    swift_unknownObjectRelease();

    sub_1BA3000D8((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for PurchaseContext);
  }
  else
  {
    sub_1BA3000D8((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for PurchaseContext);
    swift_endAccess();
  }
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v7, 1, 1, v11);
  swift_beginAccess();
  sub_1BA31FF8C((uint64_t)v7, v17);
  return swift_endAccess();
}

uint64_t sub_1BA42F5F4()
{
  return type metadata accessor for DynamicViewControllerDelegate();
}

void sub_1BA42F5FC(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;

  v1 = objc_msgSend(a1, sel_topViewController);
  if (v1)
  {
    v3 = v1;
    objc_opt_self();
    v2 = swift_dynamicCastObjCClass();
    if (v2)
      sub_1BA42F1F8(v2);

  }
}

void sub_1BA42F660(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t))
{
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    a5(255, a3, a4);
    v6 = sub_1BA438098();
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t sub_1BA42F6B4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1BA42F6D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_1BA3090BC();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = v0 + v3;
  v6 = type metadata accessor for PurchaseContext();
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v0 + v3, 1, v6))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1BA30EB78(*(_QWORD *)(v5 + 72), *(_QWORD *)(v5 + 80), *(_QWORD *)(v5 + 88), *(_QWORD *)(v5 + 96), *(_QWORD *)(v5 + 104), *(_QWORD *)(v5 + 112), *(_BYTE *)(v5 + 120));
    v7 = v5 + *(int *)(v6 + 52);
    v8 = type metadata accessor for PostPurchaseDestination();
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v7, 1, v8)
      && swift_getEnumCaseMultiPayload() == 1)
    {
      v9 = sub_1BA435EFC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v7, v9);
    }
    v10 = v5 + *(int *)(v6 + 64);
    v11 = sub_1BA435EFC();
    v12 = *(_QWORD *)(v11 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  }
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1BA42F85C(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  sub_1BA3090BC();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_1BA42ED28(a1, v1 + v5, *(_QWORD *)(v1 + v6), *(_QWORD *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFF8)));
}

unint64_t sub_1BA42F8B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF28F890;
  if (!qword_1EF28F890)
  {
    v1 = sub_1BA2F299C(255, &qword_1ED5C0D18);
    result = MEMORY[0x1BCCDC37C](MEMORY[0x1E0DEFD08], v1);
    atomic_store(result, (unint64_t *)&qword_1EF28F890);
  }
  return result;
}

uint64_t sub_1BA42F910()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1BA42F934()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (_QWORD *)(*(_QWORD *)(v0 + 16)
                + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_postPurchaseOnboardingManager);
  v2 = v1[3];
  v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 8))(8, v2, v3);
}

uint64_t sub_1BA42F988(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BA42F9B0(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DBB468], (uint64_t (*)(_QWORD, uint64_t, uint64_t))MEMORY[0x1E0DBB480]);
}

uint64_t sub_1BA42F99C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1BA42F9B0(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DBB470], (uint64_t (*)(_QWORD, uint64_t, uint64_t))MEMORY[0x1E0DBB488]);
}

uint64_t sub_1BA42F9B0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t (*a5)(_QWORD, uint64_t, uint64_t))
{
  uint64_t ObjectType;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    ObjectType = swift_getObjectType();
    v10 = *(_QWORD *)(a3 + OBJC_IVAR____TtC16NewsSubscription37FlexiblePaywallCollectionViewDelegate_viewportMonitor);
    sub_1BA437318();
    v11 = sub_1BA43730C();
    a4(v10, v11, ObjectType, a2);
    return swift_release();
  }
  else
  {
    objc_opt_self();
    result = swift_dynamicCastObjCClass();
    if (result)
    {
      v13 = swift_getObjectType();
      return a5(*(_QWORD *)(a3 + OBJC_IVAR____TtC16NewsSubscription37FlexiblePaywallCollectionViewDelegate_viewportMonitor), v13, a2);
    }
  }
  return result;
}

uint64_t type metadata accessor for FlexiblePaywallCollectionViewDelegate()
{
  return objc_opt_self();
}

void sub_1BA43011C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5C1C68)
  {
    sub_1BA4370FC();
    v0 = sub_1BA437E34();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5C1C68);
  }
}

uint64_t SubscriptionFeatureAvailabilityType.allowCIPBestOffer.getter()
{
  return 0;
}

uint64_t SubscriptionFeatureAvailabilityType.allowSIWAOnMac.getter()
{
  return 0;
}

uint64_t dispatch thunk of SubscriptionFeatureAvailabilityType.allowStatusCheck.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of SubscriptionFeatureAvailabilityType.allowInAppMessages.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SubscriptionFeatureAvailabilityType.allowCIPBestOffer.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of SubscriptionFeatureAvailabilityType.allowSIWAOnMac.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of SubscriptionFeatureAvailabilityType.allowPaidBundleViaOffer.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t __swift_memcpy5_1(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for DefaultSubscriptionFeatureAvailability(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[5])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DefaultSubscriptionFeatureAvailability(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 5) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 5) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for DefaultSubscriptionFeatureAvailability()
{
  return &type metadata for DefaultSubscriptionFeatureAvailability;
}

uint64_t static Databases.Subscription.name.getter()
{
  return 0x7069726373627553;
}

uint64_t static Databases.Subscription.location.getter()
{
  uint64_t v0;

  if (qword_1ED5C0E68 != -1)
    swift_once();
  v0 = qword_1ED5C1B88;
  swift_bridgeObjectRetain();
  return v0;
}

ValueMetadata *type metadata accessor for Databases()
{
  return &type metadata for Databases;
}

ValueMetadata *type metadata accessor for Databases.Subscription()
{
  return &type metadata for Databases.Subscription;
}

uint64_t sub_1BA430304()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *i;
  unint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v1 + 16);
  if (!v2)
    return 0;
  for (i = (uint64_t *)(v1 + 56); ; i += 10)
  {
    v4 = i[5];
    if ((v4 >> 61) < 2)
      break;
    if (!--v2)
      return 0;
  }
  v5 = *(i - 3);
  sub_1BA3149F0(v5, *(i - 2), *(i - 1), *i, i[1], i[2], i[3], i[4], v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t PurchaseContext.init(purchaseID:purchaseType:purchaseSessionID:sourceChannelID:webAccessOptIn:conversionLocation:userAction:traits:hideMyEmailShareSelection:postPurchaseDestination:hidePostPurchaseOnboarding:isDirectBuy:financeURL:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, unsigned __int8 *a10, unsigned __int8 *a11, uint64_t a12, uint64_t *a13, uint64_t a14, unsigned __int8 a15, unsigned __int8 a16, uint64_t a17)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  int v56;
  int v57;
  uint64_t v58;

  v54 = a8;
  v52 = a6;
  v53 = a7;
  v40 = a4;
  v41 = a3;
  v58 = a17;
  v56 = a15;
  v57 = a16;
  v55 = a14;
  v51 = a12;
  v21 = sub_1BA435FE0();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x1E0C80A78](v21, v23);
  v25 = (char *)&v40 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = *a10;
  v50 = *a11;
  v27 = *a13;
  v48 = a13[1];
  v49 = v27;
  v28 = a13[2];
  v46 = a13[3];
  v47 = v28;
  v29 = a13[4];
  v44 = a13[5];
  v45 = v29;
  LODWORD(v24) = *((unsigned __int8 *)a13 + 48);
  v42 = v26;
  v43 = v24;
  v30 = (int *)type metadata accessor for PurchaseContext();
  v31 = a9 + v30[16];
  v32 = sub_1BA435EFC();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v31, 1, 1, v32);
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = v41;
  if (a5)
  {
    v33 = v40;
  }
  else
  {
    sub_1BA435FD4();
    v33 = sub_1BA435FC8();
    a5 = v34;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v25, v21);
  }
  *(_QWORD *)(a9 + 24) = v33;
  *(_QWORD *)(a9 + 32) = a5;
  v35 = v53;
  *(_QWORD *)(a9 + 40) = v52;
  *(_QWORD *)(a9 + 48) = v35;
  *(_BYTE *)(a9 + 56) = v54 & 1;
  *(_BYTE *)(a9 + 57) = v42;
  *(_BYTE *)(a9 + 58) = v50;
  v36 = v49;
  *(_QWORD *)(a9 + 64) = v51;
  *(_QWORD *)(a9 + 72) = v36;
  v37 = v47;
  *(_QWORD *)(a9 + 80) = v48;
  *(_QWORD *)(a9 + 88) = v37;
  v38 = v45;
  *(_QWORD *)(a9 + 96) = v46;
  *(_QWORD *)(a9 + 104) = v38;
  *(_QWORD *)(a9 + 112) = v44;
  *(_BYTE *)(a9 + 120) = v43;
  sub_1BA3501F4(v55, a9 + v30[13]);
  *(_BYTE *)(a9 + v30[14]) = v56 & 1;
  *(_BYTE *)(a9 + v30[15]) = v57 & 1;
  return sub_1BA350250(v58, v31);
}

uint64_t PurchaseContext.purchaseID.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PurchaseContext.purchaseID.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*PurchaseContext.purchaseID.modify())()
{
  return nullsub_1;
}

uint64_t PurchaseContext.purchaseType.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t PurchaseContext.purchaseType.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t (*PurchaseContext.purchaseType.modify())()
{
  return nullsub_1;
}

uint64_t PurchaseContext.purchaseSessionID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PurchaseContext.purchaseSessionID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return result;
}

uint64_t (*PurchaseContext.purchaseSessionID.modify())()
{
  return nullsub_1;
}

uint64_t PurchaseContext.sourceChannelID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PurchaseContext.sourceChannelID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  return result;
}

uint64_t (*PurchaseContext.sourceChannelID.modify())()
{
  return nullsub_1;
}

uint64_t PurchaseContext.webAccessOptIn.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 56);
}

uint64_t PurchaseContext.webAccessOptIn.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 56) = result;
  return result;
}

uint64_t (*PurchaseContext.webAccessOptIn.modify())()
{
  return nullsub_1;
}

void PurchaseContext.conversionLocation.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 57);
}

_BYTE *PurchaseContext.conversionLocation.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 57) = *result;
  return result;
}

uint64_t (*PurchaseContext.conversionLocation.modify())()
{
  return nullsub_1;
}

void PurchaseContext.userAction.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 58);
}

_BYTE *PurchaseContext.userAction.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 58) = *result;
  return result;
}

uint64_t (*PurchaseContext.userAction.modify())()
{
  return nullsub_1;
}

uint64_t PurchaseContext.traits.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PurchaseContext.traits.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 64) = a1;
  return result;
}

uint64_t (*PurchaseContext.traits.modify())()
{
  return nullsub_1;
}

uint64_t PurchaseContext.hideMyEmailShareSelection.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v2 = *(_QWORD *)(v1 + 72);
  v3 = *(_QWORD *)(v1 + 80);
  v4 = *(_QWORD *)(v1 + 88);
  v5 = *(_QWORD *)(v1 + 96);
  v6 = *(_QWORD *)(v1 + 104);
  v7 = *(_QWORD *)(v1 + 112);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  v8 = *(_BYTE *)(v1 + 120);
  *(_BYTE *)(a1 + 48) = v8;
  return sub_1BA327BA8(v2, v3, v4, v5, v6, v7, v8);
}

__n128 PurchaseContext.hideMyEmailShareSelection.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  __n128 result;
  __n128 v6;
  __int128 v7;

  v6 = (__n128)a1[1];
  v7 = *a1;
  v2 = *((_QWORD *)a1 + 4);
  v3 = *((_QWORD *)a1 + 5);
  v4 = *((_BYTE *)a1 + 48);
  sub_1BA30EB78(*(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 104), *(_QWORD *)(v1 + 112), *(_BYTE *)(v1 + 120));
  *(_OWORD *)(v1 + 72) = v7;
  result = v6;
  *(__n128 *)(v1 + 88) = v6;
  *(_QWORD *)(v1 + 104) = v2;
  *(_QWORD *)(v1 + 112) = v3;
  *(_BYTE *)(v1 + 120) = v4;
  return result;
}

uint64_t (*PurchaseContext.hideMyEmailShareSelection.modify())()
{
  return nullsub_1;
}

uint64_t PurchaseContext.postPurchaseDestination.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for PurchaseContext();
  return sub_1BA3213B8(v1 + *(int *)(v3 + 52), a1, (unint64_t *)&qword_1ED5C2900, (void (*)(uint64_t))type metadata accessor for PostPurchaseDestination);
}

uint64_t PurchaseContext.hidePostPurchaseOnboarding.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for PurchaseContext() + 56));
}

uint64_t PurchaseContext.isDirectBuy.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for PurchaseContext() + 60));
}

uint64_t PurchaseContext.isDirectBuy.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for PurchaseContext();
  *(_BYTE *)(v1 + *(int *)(result + 60)) = a1;
  return result;
}

uint64_t (*PurchaseContext.isDirectBuy.modify())(_QWORD)
{
  type metadata accessor for PurchaseContext();
  return nullsub_1;
}

uint64_t PurchaseContext.financeURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for PurchaseContext();
  return sub_1BA3213B8(v1 + *(int *)(v3 + 64), a1, &qword_1ED5C2050, (void (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
}

uint64_t PurchaseContext.financeURL.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for PurchaseContext() + 64);
  return sub_1BA350250(a1, v3);
}

uint64_t (*PurchaseContext.financeURL.modify())(_QWORD)
{
  type metadata accessor for PurchaseContext();
  return nullsub_1;
}

uint64_t sub_1BA430A24(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1BA430A5C + 4 * byte_1BA448EA0[a1]))(0x6573616863727570, 0xEA00000000004449);
}

unint64_t sub_1BA430A6C()
{
  return 0xD000000000000011;
}

uint64_t sub_1BA430A88()
{
  return 0x6843656372756F73;
}

uint64_t sub_1BA430AAC()
{
  return 0x7365636341626577;
}

unint64_t sub_1BA430AD0()
{
  return 0xD000000000000012;
}

uint64_t sub_1BA430B68()
{
  return 0x7463657269447369;
}

uint64_t sub_1BA430B88()
{
  return 0x5565636E616E6966;
}

uint64_t sub_1BA430BA0()
{
  unsigned __int8 *v0;

  return sub_1BA430A24(*v0);
}

uint64_t sub_1BA430BA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1BA432D48(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1BA430BCC()
{
  sub_1BA431020();
  return sub_1BA438494();
}

uint64_t sub_1BA430BF4()
{
  sub_1BA431020();
  return sub_1BA4384A0();
}

uint64_t PurchaseContext.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char v11;
  __int128 v12;
  _OWORD v14[3];
  char v15;
  char v16;

  v3 = v1;
  sub_1BA4318E4(0, &qword_1EF28F920, MEMORY[0x1E0DED170]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v8);
  v10 = (char *)v14 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BA431020();
  sub_1BA438488();
  LOBYTE(v14[0]) = 0;
  sub_1BA438368();
  if (!v2)
  {
    *(_QWORD *)&v14[0] = *(_QWORD *)(v3 + 16);
    v16 = 1;
    sub_1BA431064();
    sub_1BA43838C();
    LOBYTE(v14[0]) = 2;
    sub_1BA438368();
    LOBYTE(v14[0]) = 3;
    sub_1BA438368();
    LOBYTE(v14[0]) = 4;
    sub_1BA438374();
    LOBYTE(v14[0]) = *(_BYTE *)(v3 + 57);
    v16 = 5;
    sub_1BA4310A8();
    sub_1BA43838C();
    LOBYTE(v14[0]) = *(_BYTE *)(v3 + 58);
    v16 = 6;
    sub_1BA4310EC();
    sub_1BA43838C();
    *(_QWORD *)&v14[0] = *(_QWORD *)(v3 + 64);
    v16 = 7;
    sub_1BA431130();
    sub_1BA431A0C(&qword_1EF28F940, (uint64_t (*)(void))sub_1BA431184, MEMORY[0x1E0DEAF10]);
    sub_1BA43838C();
    v11 = *(_BYTE *)(v3 + 120);
    v12 = *(_OWORD *)(v3 + 88);
    v14[0] = *(_OWORD *)(v3 + 72);
    v14[1] = v12;
    v14[2] = *(_OWORD *)(v3 + 104);
    v15 = v11;
    v16 = 8;
    sub_1BA4311C8();
    sub_1BA43838C();
    type metadata accessor for PurchaseContext();
    LOBYTE(v14[0]) = 9;
    type metadata accessor for PostPurchaseDestination();
    sub_1BA2F25C8(&qword_1EF28F958, (uint64_t (*)(uint64_t))type metadata accessor for PostPurchaseDestination, (uint64_t)&protocol conformance descriptor for PostPurchaseDestination);
    sub_1BA438350();
    LOBYTE(v14[0]) = 10;
    sub_1BA438374();
    LOBYTE(v14[0]) = 11;
    sub_1BA438374();
    LOBYTE(v14[0]) = 12;
    sub_1BA435EFC();
    sub_1BA2F25C8(&qword_1EF28EDE8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0010]);
    sub_1BA438350();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

unint64_t sub_1BA431020()
{
  unint64_t result;

  result = qword_1ED5BB6D8;
  if (!qword_1ED5BB6D8)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA4490B4, &type metadata for PurchaseContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5BB6D8);
  }
  return result;
}

unint64_t sub_1BA431064()
{
  unint64_t result;

  result = qword_1EF28F928;
  if (!qword_1EF28F928)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for PurchaseType, &type metadata for PurchaseType);
    atomic_store(result, (unint64_t *)&qword_1EF28F928);
  }
  return result;
}

unint64_t sub_1BA4310A8()
{
  unint64_t result;

  result = qword_1EF28F930;
  if (!qword_1EF28F930)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for PurchaseConversionLocation, &type metadata for PurchaseConversionLocation);
    atomic_store(result, (unint64_t *)&qword_1EF28F930);
  }
  return result;
}

unint64_t sub_1BA4310EC()
{
  unint64_t result;

  result = qword_1EF28F938;
  if (!qword_1EF28F938)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for PurchaseUserAction, &type metadata for PurchaseUserAction);
    atomic_store(result, (unint64_t *)&qword_1EF28F938);
  }
  return result;
}

void sub_1BA431130()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED5BB9E8)
  {
    v0 = sub_1BA437E34();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED5BB9E8);
  }
}

unint64_t sub_1BA431184()
{
  unint64_t result;

  result = qword_1EF28F948;
  if (!qword_1EF28F948)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for PurchaseTraits, &type metadata for PurchaseTraits);
    atomic_store(result, (unint64_t *)&qword_1EF28F948);
  }
  return result;
}

unint64_t sub_1BA4311C8()
{
  unint64_t result;

  result = qword_1EF28F950;
  if (!qword_1EF28F950)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for HideMyEmailShareSelection, &type metadata for HideMyEmailShareSelection);
    atomic_store(result, (unint64_t *)&qword_1EF28F950);
  }
  return result;
}

uint64_t PurchaseContext.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  __int128 v35;
  uint64_t *v36;
  int *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  _QWORD *v43;
  char *v44;
  uint64_t *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  char v49;
  char v50;

  v39 = a2;
  sub_1BA2F34CC(0, &qword_1ED5C2050, (void (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v38 - v5;
  sub_1BA2F34CC(0, (unint64_t *)&qword_1ED5C2900, (void (*)(uint64_t))type metadata accessor for PostPurchaseDestination);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v38 - v9;
  sub_1BA4318E4(0, (unint64_t *)&unk_1ED5BBA68, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x1E0DED048]);
  v40 = v11;
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11, v13);
  v15 = (char *)&v38 - v14;
  v16 = type metadata accessor for PurchaseContext();
  v18 = MEMORY[0x1E0C80A78](v16, v17);
  v20 = (uint64_t *)((char *)&v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21 = *(int *)(v18 + 64);
  v45 = v20;
  v22 = (uint64_t)v20 + v21;
  v23 = sub_1BA435EFC();
  v24 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56);
  v42 = v22;
  v24(v22, 1, 1, v23);
  v25 = a1[3];
  v43 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v25);
  sub_1BA431020();
  v41 = v15;
  v26 = (uint64_t)v44;
  sub_1BA43847C();
  if (v26)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
    return sub_1BA30A0C8(v42, &qword_1ED5C2050, (void (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
  }
  else
  {
    v44 = v10;
    v27 = v12;
    v38 = (int *)v16;
    v28 = v39;
    LOBYTE(v46) = 0;
    v29 = sub_1BA4382FC();
    v30 = v45;
    *v45 = v29;
    v30[1] = v31;
    v50 = 1;
    sub_1BA431940();
    sub_1BA438320();
    v30[2] = v46;
    LOBYTE(v46) = 2;
    v30[3] = sub_1BA4382FC();
    v30[4] = v32;
    LOBYTE(v46) = 3;
    v30[5] = sub_1BA4382FC();
    v30[6] = v33;
    LOBYTE(v46) = 4;
    *((_BYTE *)v30 + 56) = sub_1BA438308() & 1;
    v50 = 5;
    sub_1BA431984();
    sub_1BA438320();
    *((_BYTE *)v30 + 57) = v46;
    v50 = 6;
    sub_1BA4319C8();
    sub_1BA438320();
    *((_BYTE *)v30 + 58) = v46;
    sub_1BA431130();
    v50 = 7;
    sub_1BA431A0C((unint64_t *)&unk_1ED5BB9F0, (uint64_t (*)(void))sub_1BA431A70, MEMORY[0x1E0DEAF40]);
    sub_1BA438320();
    v30[8] = v46;
    v50 = 8;
    sub_1BA431AB4();
    sub_1BA438320();
    v34 = v49;
    v35 = v47;
    *(_OWORD *)(v30 + 9) = v46;
    *(_OWORD *)(v30 + 11) = v35;
    *(_OWORD *)(v30 + 13) = v48;
    *((_BYTE *)v30 + 120) = v34;
    type metadata accessor for PostPurchaseDestination();
    LOBYTE(v46) = 9;
    sub_1BA2F25C8(&qword_1EF28F960, (uint64_t (*)(uint64_t))type metadata accessor for PostPurchaseDestination, (uint64_t)&protocol conformance descriptor for PostPurchaseDestination);
    sub_1BA4382E4();
    sub_1BA3501F4((uint64_t)v44, (uint64_t)v45 + v38[13]);
    LOBYTE(v46) = 10;
    *((_BYTE *)v45 + v38[14]) = sub_1BA438308() & 1;
    LOBYTE(v46) = 11;
    *((_BYTE *)v45 + v38[15]) = sub_1BA438308() & 1;
    LOBYTE(v46) = 12;
    sub_1BA2F25C8(&qword_1EF28EE08, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0038]);
    sub_1BA4382E4();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v41, v40);
    sub_1BA350250((uint64_t)v6, v42);
    v36 = v45;
    sub_1BA30E9DC((uint64_t)v45, v28);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
    return sub_1BA3000D8((uint64_t)v36, (uint64_t (*)(_QWORD))type metadata accessor for PurchaseContext);
  }
}

void sub_1BA4318E4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1BA431020();
    v7 = a3(a1, &type metadata for PurchaseContext.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

unint64_t sub_1BA431940()
{
  unint64_t result;

  result = qword_1ED5BB640;
  if (!qword_1ED5BB640)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for PurchaseType, &type metadata for PurchaseType);
    atomic_store(result, (unint64_t *)&qword_1ED5BB640);
  }
  return result;
}

unint64_t sub_1BA431984()
{
  unint64_t result;

  result = qword_1ED5BB838;
  if (!qword_1ED5BB838)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for PurchaseConversionLocation, &type metadata for PurchaseConversionLocation);
    atomic_store(result, (unint64_t *)&qword_1ED5BB838);
  }
  return result;
}

unint64_t sub_1BA4319C8()
{
  unint64_t result;

  result = qword_1ED5BB728;
  if (!qword_1ED5BB728)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for PurchaseUserAction, &type metadata for PurchaseUserAction);
    atomic_store(result, (unint64_t *)&qword_1ED5BB728);
  }
  return result;
}

uint64_t sub_1BA431A0C(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    sub_1BA431130();
    v8 = v7;
    v9 = a2();
    result = MEMORY[0x1BCCDC37C](a3, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1BA431A70()
{
  unint64_t result;

  result = qword_1ED5BB6D0;
  if (!qword_1ED5BB6D0)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for PurchaseTraits, &type metadata for PurchaseTraits);
    atomic_store(result, (unint64_t *)&qword_1ED5BB6D0);
  }
  return result;
}

unint64_t sub_1BA431AB4()
{
  unint64_t result;

  result = qword_1ED5BB820;
  if (!qword_1ED5BB820)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for HideMyEmailShareSelection, &type metadata for HideMyEmailShareSelection);
    atomic_store(result, (unint64_t *)&qword_1ED5BB820);
  }
  return result;
}

uint64_t sub_1BA431AF8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return PurchaseContext.init(from:)(a1, a2);
}

uint64_t sub_1BA431B0C(_QWORD *a1)
{
  return PurchaseContext.encode(to:)(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for PurchaseContext(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v29;
  uint64_t v30;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v19 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    v6 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v6;
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    v7 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v7;
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_BYTE *)(a1 + 56) = *((_BYTE *)a2 + 56);
    *(_WORD *)(a1 + 57) = *(_WORD *)((char *)a2 + 57);
    v8 = a2[9];
    *(_QWORD *)(a1 + 64) = a2[8];
    v9 = a2[10];
    v10 = a2[11];
    v12 = a2[12];
    v11 = a2[13];
    v30 = a2[14];
    v29 = *((_BYTE *)a2 + 120);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BA327BA8(v8, v9, v10, v12, v11, v30, v29);
    *(_QWORD *)(a1 + 72) = v8;
    *(_QWORD *)(a1 + 80) = v9;
    *(_QWORD *)(a1 + 88) = v10;
    *(_QWORD *)(a1 + 96) = v12;
    *(_QWORD *)(a1 + 104) = v11;
    *(_QWORD *)(a1 + 112) = v30;
    *(_BYTE *)(a1 + 120) = v29;
    v13 = a3[13];
    v14 = (void *)(a1 + v13);
    v15 = (char *)a2 + v13;
    v16 = type metadata accessor for PostPurchaseDestination();
    v17 = *(_QWORD *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      sub_1BA2F34CC(0, (unint64_t *)&qword_1ED5C2900, (void (*)(uint64_t))type metadata accessor for PostPurchaseDestination);
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v20 = sub_1BA435EFC();
        (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v14, v15, v20);
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v14, v15, *(_QWORD *)(v17 + 64));
      }
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
    v21 = a3[15];
    *(_BYTE *)(a1 + a3[14]) = *((_BYTE *)a2 + a3[14]);
    *(_BYTE *)(a1 + v21) = *((_BYTE *)a2 + v21);
    v22 = a3[16];
    v23 = (void *)(a1 + v22);
    v24 = (char *)a2 + v22;
    v25 = sub_1BA435EFC();
    v26 = *(_QWORD *)(v25 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25))
    {
      sub_1BA2F34CC(0, &qword_1ED5C2050, (void (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
      memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v26 + 16))(v23, v24, v25);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
    }
  }
  return a1;
}

uint64_t destroy for PurchaseContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BA30EB78(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_BYTE *)(a1 + 120));
  v4 = a1 + *(int *)(a2 + 52);
  v5 = type metadata accessor for PostPurchaseDestination();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5)
    && swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_1BA435EFC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
  }
  v7 = a1 + *(int *)(a2 + 64);
  v8 = sub_1BA435EFC();
  v9 = *(_QWORD *)(v8 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  return result;
}

uint64_t initializeWithCopy for PurchaseContext(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  uint64_t v28;

  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v8 = *(_QWORD *)(a2 + 80);
  v9 = *(_QWORD *)(a2 + 88);
  v11 = *(_QWORD *)(a2 + 96);
  v10 = *(_QWORD *)(a2 + 104);
  v28 = *(_QWORD *)(a2 + 112);
  v27 = *(_BYTE *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BA327BA8(v7, v8, v9, v11, v10, v28, v27);
  *(_QWORD *)(a1 + 72) = v7;
  *(_QWORD *)(a1 + 80) = v8;
  *(_QWORD *)(a1 + 88) = v9;
  *(_QWORD *)(a1 + 96) = v11;
  *(_QWORD *)(a1 + 104) = v10;
  *(_QWORD *)(a1 + 112) = v28;
  *(_BYTE *)(a1 + 120) = v27;
  v12 = a3[13];
  v13 = (void *)(a1 + v12);
  v14 = (const void *)(a2 + v12);
  v15 = type metadata accessor for PostPurchaseDestination();
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    sub_1BA2F34CC(0, (unint64_t *)&qword_1ED5C2900, (void (*)(uint64_t))type metadata accessor for PostPurchaseDestination);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v18 = sub_1BA435EFC();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v13, v14, v18);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v13, v14, *(_QWORD *)(v16 + 64));
    }
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  v19 = a3[15];
  *(_BYTE *)(a1 + a3[14]) = *(_BYTE *)(a2 + a3[14]);
  *(_BYTE *)(a1 + v19) = *(_BYTE *)(a2 + v19);
  v20 = a3[16];
  v21 = (void *)(a1 + v20);
  v22 = (const void *)(a2 + v20);
  v23 = sub_1BA435EFC();
  v24 = *(_QWORD *)(v23 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    sub_1BA2F34CC(0, &qword_1ED5C2050, (void (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v24 + 16))(v21, v22, v23);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  return a1;
}

uint64_t assignWithCopy for PurchaseContext(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(void *, uint64_t, uint64_t);
  int v26;
  uint64_t v27;
  size_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(void *, uint64_t, uint64_t);
  int v37;
  int v38;
  uint64_t v39;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  *(_BYTE *)(a1 + 58) = *(_BYTE *)(a2 + 58);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 72);
  v7 = *(_QWORD *)(a2 + 80);
  v8 = *(_QWORD *)(a2 + 88);
  v9 = *(_QWORD *)(a2 + 96);
  v10 = *(_QWORD *)(a2 + 104);
  v11 = *(_QWORD *)(a2 + 112);
  v12 = *(_BYTE *)(a2 + 120);
  sub_1BA327BA8(v6, v7, v8, v9, v10, v11, v12);
  v13 = *(_QWORD *)(a1 + 72);
  v14 = *(_QWORD *)(a1 + 80);
  v15 = *(_QWORD *)(a1 + 88);
  v16 = *(_QWORD *)(a1 + 96);
  v17 = *(_QWORD *)(a1 + 104);
  v18 = *(_QWORD *)(a1 + 112);
  *(_QWORD *)(a1 + 72) = v6;
  *(_QWORD *)(a1 + 80) = v7;
  *(_QWORD *)(a1 + 88) = v8;
  *(_QWORD *)(a1 + 96) = v9;
  *(_QWORD *)(a1 + 104) = v10;
  *(_QWORD *)(a1 + 112) = v11;
  v19 = *(_BYTE *)(a1 + 120);
  *(_BYTE *)(a1 + 120) = v12;
  sub_1BA30EB78(v13, v14, v15, v16, v17, v18, v19);
  v20 = a3[13];
  v21 = (void *)(a1 + v20);
  v22 = (void *)(a2 + v20);
  v23 = type metadata accessor for PostPurchaseDestination();
  v24 = *(_QWORD *)(v23 - 8);
  v25 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v24 + 48);
  LODWORD(v9) = v25(v21, 1, v23);
  v26 = v25(v22, 1, v23);
  if ((_DWORD)v9)
  {
    if (v26)
      goto LABEL_6;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v29 = sub_1BA435EFC();
      (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v21, v22, v29);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v21, v22, *(_QWORD *)(v24 + 64));
    }
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  else
  {
    if (v26)
    {
      sub_1BA3000D8((uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for PostPurchaseDestination);
LABEL_6:
      sub_1BA2F34CC(0, (unint64_t *)&qword_1ED5C2900, (void (*)(uint64_t))type metadata accessor for PostPurchaseDestination);
      v28 = *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64);
LABEL_7:
      memcpy(v21, v22, v28);
      goto LABEL_15;
    }
    if (a1 != a2)
    {
      sub_1BA3000D8((uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for PostPurchaseDestination);
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        v28 = *(_QWORD *)(v24 + 64);
        goto LABEL_7;
      }
      v30 = sub_1BA435EFC();
      (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v21, v22, v30);
      swift_storeEnumTagMultiPayload();
    }
  }
LABEL_15:
  *(_BYTE *)(a1 + a3[14]) = *(_BYTE *)(a2 + a3[14]);
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  v31 = a3[16];
  v32 = (void *)(a1 + v31);
  v33 = (void *)(a2 + v31);
  v34 = sub_1BA435EFC();
  v35 = *(_QWORD *)(v34 - 8);
  v36 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v35 + 48);
  v37 = v36(v32, 1, v34);
  v38 = v36(v33, 1, v34);
  if (!v37)
  {
    if (!v38)
    {
      (*(void (**)(void *, void *, uint64_t))(v35 + 24))(v32, v33, v34);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v35 + 8))(v32, v34);
    goto LABEL_20;
  }
  if (v38)
  {
LABEL_20:
    sub_1BA2F34CC(0, &qword_1ED5C2050, (void (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
    memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v35 + 16))(v32, v33, v34);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
  return a1;
}

uint64_t initializeWithTake for PurchaseContext(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  void *v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v6 = *(_OWORD *)(a2 + 72);
  v7 = *(_OWORD *)(a2 + 88);
  v8 = *(_OWORD *)(a2 + 104);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = v8;
  *(_OWORD *)(a1 + 88) = v7;
  v9 = a3[13];
  v10 = (void *)(a1 + v9);
  v11 = (const void *)(a2 + v9);
  *(_OWORD *)(a1 + 72) = v6;
  v12 = type metadata accessor for PostPurchaseDestination();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    sub_1BA2F34CC(0, (unint64_t *)&qword_1ED5C2900, (void (*)(uint64_t))type metadata accessor for PostPurchaseDestination);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v15 = sub_1BA435EFC();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v10, v11, v15);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v10, v11, *(_QWORD *)(v13 + 64));
    }
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  v16 = a3[15];
  *(_BYTE *)(a1 + a3[14]) = *(_BYTE *)(a2 + a3[14]);
  *(_BYTE *)(a1 + v16) = *(_BYTE *)(a2 + v16);
  v17 = a3[16];
  v18 = (void *)(a1 + v17);
  v19 = (const void *)(a2 + v17);
  v20 = sub_1BA435EFC();
  v21 = *(_QWORD *)(v20 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
  {
    sub_1BA2F34CC(0, &qword_1ED5C2050, (void (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v21 + 32))(v18, v19, v20);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  }
  return a1;
}

uint64_t assignWithTake for PurchaseContext(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(void *, uint64_t, uint64_t);
  int v22;
  int v23;
  uint64_t v24;
  size_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(void *, uint64_t, uint64_t);
  int v35;
  int v36;
  uint64_t v37;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  v8 = *(_BYTE *)(a2 + 120);
  v9 = *(_QWORD *)(a1 + 72);
  v10 = *(_QWORD *)(a1 + 80);
  v11 = *(_QWORD *)(a1 + 88);
  v12 = *(_QWORD *)(a1 + 96);
  v13 = *(_QWORD *)(a1 + 104);
  v14 = *(_QWORD *)(a1 + 112);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  v15 = *(_BYTE *)(a1 + 120);
  *(_BYTE *)(a1 + 120) = v8;
  sub_1BA30EB78(v9, v10, v11, v12, v13, v14, v15);
  v16 = a3[13];
  v17 = (void *)(a1 + v16);
  v18 = (void *)(a2 + v16);
  v19 = type metadata accessor for PostPurchaseDestination();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  v22 = v21(v17, 1, v19);
  v23 = v21(v18, 1, v19);
  if (v22)
  {
    if (v23)
      goto LABEL_6;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v26 = sub_1BA435EFC();
      (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v26 - 8) + 32))(v17, v18, v26);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v17, v18, *(_QWORD *)(v20 + 64));
    }
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  else
  {
    if (v23)
    {
      sub_1BA3000D8((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for PostPurchaseDestination);
LABEL_6:
      sub_1BA2F34CC(0, (unint64_t *)&qword_1ED5C2900, (void (*)(uint64_t))type metadata accessor for PostPurchaseDestination);
      v25 = *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64);
LABEL_7:
      memcpy(v17, v18, v25);
      goto LABEL_15;
    }
    if (a1 != a2)
    {
      sub_1BA3000D8((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for PostPurchaseDestination);
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        v25 = *(_QWORD *)(v20 + 64);
        goto LABEL_7;
      }
      v27 = sub_1BA435EFC();
      (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v17, v18, v27);
      swift_storeEnumTagMultiPayload();
    }
  }
LABEL_15:
  v28 = a3[15];
  *(_BYTE *)(a1 + a3[14]) = *(_BYTE *)(a2 + a3[14]);
  *(_BYTE *)(a1 + v28) = *(_BYTE *)(a2 + v28);
  v29 = a3[16];
  v30 = (void *)(a1 + v29);
  v31 = (void *)(a2 + v29);
  v32 = sub_1BA435EFC();
  v33 = *(_QWORD *)(v32 - 8);
  v34 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v33 + 48);
  v35 = v34(v30, 1, v32);
  v36 = v34(v31, 1, v32);
  if (!v35)
  {
    if (!v36)
    {
      (*(void (**)(void *, void *, uint64_t))(v33 + 40))(v30, v31, v32);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v33 + 8))(v30, v32);
    goto LABEL_20;
  }
  if (v36)
  {
LABEL_20:
    sub_1BA2F34CC(0, &qword_1ED5C2050, (void (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v33 + 32))(v30, v31, v32);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
  return a1;
}

uint64_t getEnumTagSinglePayload for PurchaseContext()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BA432A28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    sub_1BA2F34CC(0, (unint64_t *)&qword_1ED5C2900, (void (*)(uint64_t))type metadata accessor for PostPurchaseDestination);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 52);
    }
    else
    {
      sub_1BA2F34CC(0, &qword_1ED5C2050, (void (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
      v10 = v12;
      v9 = *(_QWORD *)(v12 - 8);
      v11 = *(int *)(a3 + 64);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t sub_1BA432AE8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    sub_1BA2F34CC(0, (unint64_t *)&qword_1ED5C2900, (void (*)(uint64_t))type metadata accessor for PostPurchaseDestination);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 52);
    }
    else
    {
      sub_1BA2F34CC(0, &qword_1ED5C2050, (void (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
      v10 = v12;
      v9 = *(_QWORD *)(v12 - 8);
      v11 = *(int *)(a4 + 64);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for PurchaseContext.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 12 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 12) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF3)
    return ((uint64_t (*)(void))((char *)&loc_1BA432BF0 + 4 * byte_1BA448EB2[v4]))();
  *a1 = a2 + 12;
  return ((uint64_t (*)(void))((char *)sub_1BA432C24 + 4 * byte_1BA448EAD[v4]))();
}

uint64_t sub_1BA432C24(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA432C2C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA432C34);
  return result;
}

uint64_t sub_1BA432C40(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA432C48);
  *(_BYTE *)result = a2 + 12;
  return result;
}

uint64_t sub_1BA432C4C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA432C54(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PurchaseContext.CodingKeys()
{
  return &type metadata for PurchaseContext.CodingKeys;
}

unint64_t sub_1BA432C74()
{
  unint64_t result;

  result = qword_1EF28F968;
  if (!qword_1EF28F968)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA44908C, &type metadata for PurchaseContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF28F968);
  }
  return result;
}

unint64_t sub_1BA432CBC()
{
  unint64_t result;

  result = qword_1ED5BB6E8;
  if (!qword_1ED5BB6E8)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA448FFC, &type metadata for PurchaseContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5BB6E8);
  }
  return result;
}

unint64_t sub_1BA432D04()
{
  unint64_t result;

  result = qword_1ED5BB6E0;
  if (!qword_1ED5BB6E0)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA449024, &type metadata for PurchaseContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED5BB6E0);
  }
  return result;
}

uint64_t sub_1BA432D48(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6573616863727570 && a2 == 0xEA00000000004449;
  if (v2 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6573616863727570 && a2 == 0xEC00000065707954 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001BA455560 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6843656372756F73 && a2 == 0xEF44496C656E6E61 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7365636341626577 && a2 == 0xEE006E4974704F73 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001BA45C690 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6974634172657375 && a2 == 0xEA00000000006E6FLL || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x737469617274 && a2 == 0xE600000000000000 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x80000001BA45C6B0 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x80000001BA45C6D0 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x80000001BA45C6F0 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x7463657269447369 && a2 == 0xEB00000000797542 || (sub_1BA4383C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x5565636E616E6966 && a2 == 0xEA00000000004C52)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else
  {
    v6 = sub_1BA4383C8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 12;
    else
      return 13;
  }
}

uint64_t type metadata accessor for AlacartePaywallRenderer()
{
  return objc_opt_self();
}

void sub_1BA4332E8(uint64_t a1, uint64_t a2, char *a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v17 = *(id *)&a3[OBJC_IVAR____TtC16NewsSubscription19AlacartePaywallView_titleTextView];
  objc_msgSend(v17, sel_setAttributedText_, *(_QWORD *)(a2 + 256));
  v19 = *(id *)&a3[OBJC_IVAR____TtC16NewsSubscription19AlacartePaywallView_subscribeButton];
  objc_msgSend(v19, sel_setAttributedTitle_forState_, *(_QWORD *)(a2 + 272), 0);
  v6 = *(void **)&a3[OBJC_IVAR____TtC16NewsSubscription19AlacartePaywallView_webAuthButton];
  v18 = v6;
  objc_msgSend(v6, sel_setAttributedTitle_forState_, *(_QWORD *)(a2 + 280), 0);
  v7 = type metadata accessor for AlacartePaywallViewModel();
  objc_msgSend(v6, sel_setHidden_, *(unsigned __int8 *)(a1 + *(int *)(v7 + 48)));
  v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3778]), sel_initWithAttributedString_, *(_QWORD *)(a2 + 264));
  v8 = *MEMORY[0x1E0DC1160];
  v9 = (void *)sub_1BA435EA8();
  v10 = objc_msgSend(v20, sel_mutableString);
  v11 = (void *)sub_1BA437C18();
  v12 = objc_msgSend(v10, sel_rangeOfString_, v11);
  v14 = v13;

  objc_msgSend(v20, sel_addAttribute_value_range_, v8, v9, v12, v14);
  v15 = *(void **)&a3[OBJC_IVAR____TtC16NewsSubscription19AlacartePaywallView_descriptionTextView];
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3498]), sel_initWithAttributedString_, v20);
  objc_msgSend(v15, sel_setAttributedText_, v16);

  objc_msgSend(v15, sel_setHidden_, *(unsigned __int8 *)(a1 + *(int *)(v7 + 52)));
  objc_msgSend(a3, sel_setFrame_, *(double *)a2, *(double *)(a2 + 8), *(double *)(a2 + 16), *(double *)(a2 + 24));
  objc_msgSend(*(id *)&a3[OBJC_IVAR____TtC16NewsSubscription19AlacartePaywallView_gradientMaskView], sel_setFrame_, *(double *)(a2 + 64), *(double *)(a2 + 72), *(double *)(a2 + 80), *(double *)(a2 + 88));
  objc_msgSend(*(id *)&a3[OBJC_IVAR____TtC16NewsSubscription19AlacartePaywallView_contentView], sel_setFrame_, *(double *)(a2 + 32), *(double *)(a2 + 40), *(double *)(a2 + 48), *(double *)(a2 + 56));
  objc_msgSend(v17, sel_setFrame_, *(double *)(a2 + 96), *(double *)(a2 + 104), *(double *)(a2 + 112), *(double *)(a2 + 120));
  objc_msgSend(v15, sel_setFrame_, *(double *)(a2 + 160), *(double *)(a2 + 168), *(double *)(a2 + 176), *(double *)(a2 + 184));
  objc_msgSend(v19, sel_setFrame_, *(double *)(a2 + 128), *(double *)(a2 + 136), *(double *)(a2 + 144), *(double *)(a2 + 152));
  objc_msgSend(v18, sel_setFrame_, *(double *)(a2 + 192), *(double *)(a2 + 200), *(double *)(a2 + 208), *(double *)(a2 + 216));
  objc_msgSend(*(id *)&a3[OBJC_IVAR____TtC16NewsSubscription19AlacartePaywallView_bottomHairline], sel_setFrame_, *(double *)(a2 + 224), *(double *)(a2 + 232), *(double *)(a2 + 240), *(double *)(a2 + 248));

}

id sub_1BA4335A8(int a1, char *a2, double *a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t inited;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void **v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  char *v34;
  void *v36;
  CGRect v37;

  v4 = v3;
  objc_msgSend(a2, sel_setFrame_, *a3, a3[1], a3[2], a3[3]);
  objc_msgSend(*(id *)&a2[OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintHeaderView_publisherLogo], sel_setFrame_, a3[4], a3[5], a3[6], a3[7]);
  v7 = *(void **)&a2[OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintHeaderView_headline];
  objc_msgSend(v7, sel_setFrame_, a3[8], a3[9], a3[10], a3[11]);
  v8 = *(void **)&a2[OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintHeaderView_subheadline];
  objc_msgSend(v8, sel_setFrame_, a3[12], a3[13], a3[14], a3[15]);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 40));
  v9 = sub_1BA35621C();
  v36 = v7;
  objc_msgSend(v7, sel_setAttributedText_, v9);

  v10 = *__swift_project_boxed_opaque_existential_1((_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 40));
  sub_1BA328BE8();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BA43CE80;
  v12 = (void *)*MEMORY[0x1E0DC1138];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
  v13 = sub_1BA2F299C(0, (unint64_t *)&unk_1ED5C0280);
  v14 = v12;
  v15 = sub_1BA437FF0();
  v16 = (void **)MEMORY[0x1E0DC1178];
  *(_QWORD *)(inited + 40) = v15;
  v17 = *v16;
  *(_QWORD *)(inited + 64) = v13;
  *(_QWORD *)(inited + 72) = v17;
  v18 = objc_allocWithZone(MEMORY[0x1E0DC1288]);
  v19 = v17;
  v20 = objc_msgSend(v18, sel_init);
  objc_msgSend(v20, sel_setAlignment_, 1);
  v21 = sub_1BA2F299C(0, &qword_1EF28CA48);
  *(_QWORD *)(inited + 80) = v20;
  v22 = (void *)*MEMORY[0x1E0DC1140];
  *(_QWORD *)(inited + 104) = v21;
  *(_QWORD *)(inited + 112) = v22;
  v23 = *(void **)(v10 + 64);
  v24 = v22;
  v25 = objc_msgSend(v23, sel_tertiaryColor);
  v26 = sub_1BA356E40(v25);

  *(_QWORD *)(inited + 144) = sub_1BA2F299C(0, &qword_1ED5C0290);
  if (!v26)
    v26 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
  *(_QWORD *)(inited + 120) = v26;
  sub_1BA392D48(inited);
  v27 = objc_allocWithZone(MEMORY[0x1E0CB3498]);
  swift_bridgeObjectRetain();
  v28 = (void *)sub_1BA437C18();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_1BA328CA4();
  v29 = (void *)sub_1BA437BC4();
  swift_bridgeObjectRelease();
  v30 = objc_msgSend(v27, sel_initWithString_attributes_, v28, v29);

  objc_msgSend(v8, sel_setAttributedText_, v30);
  MEMORY[0x1E0C80A78](v31, v32);
  sub_1BA2F299C(0, &qword_1ED5C0298);
  sub_1BA4369DC();
  sub_1BA2F299C(0, (unint64_t *)&qword_1ED5BE660);
  v33 = (void *)sub_1BA437F6C();
  *(_QWORD *)(swift_allocObject() + 16) = a2;
  v34 = a2;
  sub_1BA4368E0();
  swift_release();
  swift_release();

  swift_release();
  objc_msgSend(v36, sel_setNumberOfLines_, 0);
  objc_msgSend(v36, sel_setLineBreakMode_, 0);
  objc_msgSend(v8, sel_setNumberOfLines_, 0);
  objc_msgSend(v8, sel_setLineBreakMode_, 0);
  objc_msgSend(v8, sel_frame);
  objc_msgSend(v8, sel__setFirstLineCapFrameOriginY_, CGRectGetMinY(v37));
  return objc_msgSend(v8, sel_sizeToFit);
}

uint64_t sub_1BA433A78(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;

  v7 = a1[10];
  v8 = a1[11];
  __swift_project_boxed_opaque_existential_1(a1 + 7, v7);
  v9 = *(_QWORD *)(a2 + 64);
  objc_msgSend(a3, sel_frame);
  return (*(uint64_t (**)(uint64_t, id, uint64_t, uint64_t, double, double))(v8 + 8))(v9, objc_msgSend(a4, sel_userInterfaceStyle), v7, v8, v10, v11);
}

uint64_t type metadata accessor for HideMyEmailSignupBlueprintHeaderViewRenderer()
{
  return objc_opt_self();
}

uint64_t sub_1BA433B4C()
{
  uint64_t v0;

  return sub_1BA433A78(*(_QWORD **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32), *(void **)(v0 + 40));
}

uint64_t sub_1BA433B68()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1BA433B8C(_QWORD *a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(*(_QWORD *)(v1 + 16)
                + OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintHeaderView_publisherLogo);
  objc_msgSend(v2, sel_setImage_, *a1);
  return objc_msgSend(v2, sel_setContentMode_, 1);
}

uint64_t sub_1BA433BE8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BA433C0C()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

id sub_1BA433CF0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UnselectableLinkEnabledTextView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for UnselectableLinkEnabledTextView()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for HideMyEmailSignupViewController()
{
  return objc_opt_self();
}

uint64_t sub_1BA433F34()
{
  return sub_1BA436D00();
}

void sub_1BA433F5C()
{
  char *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  objc_super v19;

  v19.receiver = v0;
  v19.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v19, sel_viewDidLoad);
  v1 = *(void **)&v0[OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_blueprintViewController];
  objc_msgSend(v0, sel_addChildViewController_, v1);
  v2 = objc_msgSend(v0, sel_view);
  if (!v2)
  {
    __break(1u);
    goto LABEL_7;
  }
  v3 = v2;
  v4 = objc_msgSend(v1, sel_view);
  if (!v4)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v5 = v4;
  objc_msgSend(v3, sel_addSubview_, v4);

  objc_msgSend(v1, sel_didMoveToParentViewController_, v0);
  v6 = objc_msgSend(v1, sel_view);
  if (!v6)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v7 = v6;
  v8 = objc_msgSend(v0, sel_view);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, sel_bounds);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    objc_msgSend(v7, sel_setFrame_, v11, v13, v15, v17);
    v18 = objc_msgSend(v0, sel_traitCollection);
    sub_1BA435330();

    return;
  }
LABEL_9:
  __break(1u);
}

uint64_t sub_1BA4342A8(uint64_t a1)
{
  char *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v18;
  char v19;

  v2 = v1;
  v4 = type metadata accessor for PurchaseContext();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](v4, v7);
  v8 = &v1[OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_purchasePresenter];
  v9 = *(_QWORD *)&v1[OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_purchasePresenter + 24];
  v10 = *((_QWORD *)v8 + 4);
  __swift_project_boxed_opaque_existential_1(v8, v9);
  v18 = 0;
  v19 = 2;
  PurchasePresenterType.presentPurchase(on:with:type:)((uint64_t)v2, a1, &v18, v9, v10);
  sub_1BA30747C();
  v11 = (void *)sub_1BA437F6C();
  v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1BA30E9DC(a1, (uint64_t)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v12;
  sub_1BA30EBD0((uint64_t)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13);
  sub_1BA4368E0();
  swift_release();

  swift_release();
  v15 = (void *)sub_1BA437F6C();
  *(_QWORD *)(swift_allocObject() + 16) = v2;
  v16 = v2;
  sub_1BA436904();
  swift_release();
  swift_release();

  return swift_release();
}

void sub_1BA434480(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  _QWORD aBlock[6];

  v6 = type metadata accessor for PurchaseContext();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6, v9);
  v10 = (char *)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *a1;
  swift_beginAccess();
  v12 = MEMORY[0x1BCCDC4E4](a2 + 16);
  if (v12)
  {
    v13 = (void *)v12;
    sub_1BA30E9DC(a3, (uint64_t)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
    v14 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v15 = (v8 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
    v16 = swift_allocObject();
    sub_1BA30EBD0((uint64_t)v10, v16 + v14);
    *(_QWORD *)(v16 + v15) = v13;
    *(_QWORD *)(v16 + ((v15 + 15) & 0xFFFFFFFFFFFFFFF8)) = v11;
    aBlock[4] = sub_1BA4352E4;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BA2F358C;
    aBlock[3] = &block_descriptor_39;
    v17 = _Block_copy(aBlock);
    v18 = v13;
    v19 = v11;
    swift_release();
    objc_msgSend(v18, sel_dismissViewControllerAnimated_completion_, 1, v17);
    _Block_release(v17);

  }
}

uint64_t sub_1BA434604(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t ObjectType;

  if (!*(_QWORD *)(result + 16))
  {
    v4 = result;
    if (*(_BYTE *)(result + 120) != 2
      || (v5 = *(_QWORD *)(result + 96),
          v6 = *(_QWORD *)(result + 72),
          v7 = *(_QWORD *)(result + 104) | *(_QWORD *)(result + 112),
          v8 = *(_QWORD *)(result + 88) | *(_QWORD *)(result + 80),
          v7 | v6 | v5 | v8)
      && ((v9 = v7 | v5 | v8, v6 == 1) ? (v10 = v9 == 0) : (v10 = 0), !v10))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a2 + OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_eventHandler)
                      + 40);
      ObjectType = swift_getObjectType();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(a3, v4, ObjectType, v11);
    }
  }
  return result;
}

uint64_t sub_1BA4346AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t result;
  uint64_t v11;
  uint64_t ObjectType;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = sub_1BA437330();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, a3, v5);
  result = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v9, v5);
  if ((_DWORD)result == *MEMORY[0x1E0DBB9D0])
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  else
  {
    if ((_DWORD)result == *MEMORY[0x1E0DBB9A8])
    {
      v11 = *(_QWORD *)(*(_QWORD *)(v3 + OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_eventHandler)
                      + 40);
      ObjectType = swift_getObjectType();
      return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 32))(ObjectType, v11);
    }
    if ((_DWORD)result != *MEMORY[0x1E0DBB9C8] && (_DWORD)result != *MEMORY[0x1E0DBB9B0])
    {
      if ((_DWORD)result == *MEMORY[0x1E0DBB9D8])
        return result;
      if ((_DWORD)result != *MEMORY[0x1E0DBB9F0])
        return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
  }
  v14 = *(_QWORD *)(*(_QWORD *)(v3 + OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_eventHandler)
                  + 40);
  v15 = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 40))(v15, v14);
}

void sub_1BA434818()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_navigationController);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v1, sel_navigationBar);

    sub_1BA437FFC();
  }
}

uint64_t sub_1BA4348A8()
{
  swift_getObjectType();
  return sub_1BA4373A8();
}

uint64_t sub_1BA4348FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t ObjectType;

  v4 = *(_QWORD *)(*(_QWORD *)(v2 + OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_eventHandler)
                 + 40);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a2, ObjectType, v4);
}

uint64_t sub_1BA43494C()
{
  swift_getObjectType();
  return sub_1BA4373A8();
}

uint64_t sub_1BA4349A0()
{
  swift_getObjectType();
  return sub_1BA437390();
}

uint64_t sub_1BA4349E4()
{
  swift_getObjectType();
  return sub_1BA43739C();
}

uint64_t sub_1BA434A28()
{
  swift_getObjectType();
  return sub_1BA4373A8();
}

uint64_t sub_1BA434A7C()
{
  swift_getObjectType();
  return sub_1BA4373B4();
}

uint64_t sub_1BA434AC0()
{
  swift_getObjectType();
  return sub_1BA4373B4();
}

uint64_t sub_1BA434B04()
{
  swift_getObjectType();
  return sub_1BA4373B4();
}

uint64_t sub_1BA434B48()
{
  swift_getObjectType();
  return sub_1BA4373B4();
}

uint64_t sub_1BA434B8C()
{
  swift_getObjectType();
  return sub_1BA4373B4();
}

uint64_t sub_1BA434BD0()
{
  swift_getObjectType();
  return sub_1BA4373B4();
}

uint64_t sub_1BA434C14()
{
  swift_getObjectType();
  return sub_1BA4373B4();
}

uint64_t sub_1BA434C5C()
{
  swift_getObjectType();
  return sub_1BA43742C();
}

uint64_t sub_1BA434CA0()
{
  swift_getObjectType();
  return sub_1BA4373A8();
}

uint64_t sub_1BA434CF4()
{
  swift_getObjectType();
  return sub_1BA4373CC();
}

uint64_t sub_1BA434D48()
{
  swift_getObjectType();
  return sub_1BA43733C();
}

uint64_t sub_1BA434D84()
{
  swift_getObjectType();
  return sub_1BA43733C();
}

uint64_t sub_1BA434DC0()
{
  swift_getObjectType();
  return sub_1BA437384();
}

uint64_t sub_1BA434DFC()
{
  swift_getObjectType();
  return sub_1BA43733C();
}

uint64_t sub_1BA434E38()
{
  swift_getObjectType();
  return sub_1BA43733C();
}

uint64_t sub_1BA434E74()
{
  swift_getObjectType();
  return sub_1BA43739C();
}

uint64_t sub_1BA434EB8()
{
  swift_getObjectType();
  return sub_1BA437360();
}

uint64_t sub_1BA434EFC()
{
  swift_getObjectType();
  return sub_1BA437360();
}

uint64_t sub_1BA434F40()
{
  return sub_1BA437084();
}

uint64_t sub_1BA434F68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_eventHandler)
                 + 40);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 64))(ObjectType, v1);
}

uint64_t sub_1BA434FA4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1BA434FC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = type metadata accessor for PurchaseContext();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_release();
  v3 = v0 + ((v2 + 24) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BA30EB78(*(_QWORD *)(v3 + 72), *(_QWORD *)(v3 + 80), *(_QWORD *)(v3 + 88), *(_QWORD *)(v3 + 96), *(_QWORD *)(v3 + 104), *(_QWORD *)(v3 + 112), *(_BYTE *)(v3 + 120));
  v4 = v3 + *(int *)(v1 + 52);
  v5 = type metadata accessor for PostPurchaseDestination();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5)
    && swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_1BA435EFC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
  }
  v7 = v3 + *(int *)(v1 + 64);
  v8 = sub_1BA435EFC();
  v9 = *(_QWORD *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  return swift_deallocObject();
}

void sub_1BA435104(void **a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PurchaseContext() - 8) + 80);
  sub_1BA434480(a1, *(_QWORD *)(v1 + 16), v1 + ((v3 + 24) & ~v3));
}

uint64_t sub_1BA435160()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1BA435184()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v1 = type metadata accessor for PurchaseContext();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BA30EB78(*(_QWORD *)(v5 + 72), *(_QWORD *)(v5 + 80), *(_QWORD *)(v5 + 88), *(_QWORD *)(v5 + 96), *(_QWORD *)(v5 + 104), *(_QWORD *)(v5 + 112), *(_BYTE *)(v5 + 120));
  v6 = v0 + v3 + *(int *)(v1 + 52);
  v7 = type metadata accessor for PostPurchaseDestination();
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7)
    && swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_1BA435EFC();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  v9 = v5 + *(int *)(v1 + 64);
  v10 = sub_1BA435EFC();
  v11 = *(_QWORD *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  v12 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF8;

  return swift_deallocObject();
}

uint64_t sub_1BA4352E4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(type metadata accessor for PurchaseContext() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_1BA434604(v0 + v2, *(_QWORD *)(v0 + v3), *(_QWORD *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFF8)));
}

void sub_1BA435330()
{
  char *v0;
  char *v1;
  _QWORD *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];

  v1 = &v0[OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_styler];
  sub_1BA2F8BB0((uint64_t)&v0[OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_styler], (uint64_t)v11);
  v2 = __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  v3 = objc_msgSend(v0, sel_view);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(*(id *)(*v2 + 64), sel_backgroundColor);
    v6 = sub_1BA356E40(v5);

    if (!v6)
      v6 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v6);

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
    v7 = __swift_project_boxed_opaque_existential_1(v1, *((_QWORD *)v1 + 3));
    sub_1BA437060();
    v8 = (void *)sub_1BA436FAC();
    swift_release();
    v9 = objc_msgSend(*(id *)(*v7 + 64), sel_backgroundColor);
    v10 = sub_1BA356E40(v9);

    if (!v10)
      v10 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
    objc_msgSend(v8, sel_setBackgroundColor_, v10);

    objc_msgSend(v8, sel_setSeparatorStyle_, 0);
  }
  else
  {
    __break(1u);
  }
}

BOOL static PurchaseErrorAlert.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PurchaseErrorAlert.hash(into:)()
{
  return sub_1BA438458();
}

uint64_t PurchaseErrorAlert.hashValue.getter()
{
  sub_1BA43844C();
  sub_1BA438458();
  return sub_1BA438470();
}

unint64_t sub_1BA435558()
{
  unint64_t result;

  result = qword_1EF28FAA0;
  if (!qword_1EF28FAA0)
  {
    result = MEMORY[0x1BCCDC37C](&protocol conformance descriptor for PurchaseErrorAlert, &type metadata for PurchaseErrorAlert);
    atomic_store(result, (unint64_t *)&qword_1EF28FAA0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for PurchaseErrorAlert(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_1BA4355E8 + 4 * byte_1BA449475[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1BA43561C + 4 * byte_1BA449470[v4]))();
}

uint64_t sub_1BA43561C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA435624(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BA43562CLL);
  return result;
}

uint64_t sub_1BA435638(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BA435640);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1BA435644(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BA43564C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PurchaseErrorAlert()
{
  return &type metadata for PurchaseErrorAlert;
}

uint64_t storeEnumTagSinglePayload for PurchaseLookupError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1BA4356A8 + 4 * byte_1BA44947A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1BA4356C8 + 4 * byte_1BA44947F[v4]))();
}

_BYTE *sub_1BA4356A8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1BA4356C8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BA4356D0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BA4356D8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BA4356E0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BA4356E8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for PurchaseLookupError()
{
  return &type metadata for PurchaseLookupError;
}

unint64_t sub_1BA435708()
{
  unint64_t result;

  result = qword_1EF28FAA8;
  if (!qword_1EF28FAA8)
  {
    result = MEMORY[0x1BCCDC37C](&unk_1BA449574, &type metadata for PurchaseLookupError);
    atomic_store(result, (unint64_t *)&qword_1EF28FAA8);
  }
  return result;
}

void sub_1BA43574C(char *a1, double *a2, uint64_t a3, uint64_t a4, char a5)
{
  void *v7;
  id v8;
  uint64_t inited;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  char *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;

  v7 = *(void **)&a1[OBJC_IVAR____TtC16NewsSubscription30HideMyEmailSignupAlternateView_email];
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC1288]), sel_init);
  objc_msgSend(v8, sel_setLineBreakMode_, 5);
  sub_1BA328BE8();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BA43CE80;
  v10 = (void *)*MEMORY[0x1E0DC1138];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
  v11 = sub_1BA2F299C(0, (unint64_t *)&unk_1ED5C0280);
  swift_bridgeObjectRetain();
  v12 = v10;
  *(_QWORD *)(inited + 40) = sub_1BA437FF0();
  v13 = (void *)*MEMORY[0x1E0DC1140];
  *(_QWORD *)(inited + 64) = v11;
  *(_QWORD *)(inited + 72) = v13;
  v14 = (void *)objc_opt_self();
  v15 = v13;
  v34 = v14;
  v16 = objc_msgSend(v14, sel_labelColor);
  v17 = sub_1BA2F299C(0, &qword_1ED5C0290);
  *(_QWORD *)(inited + 80) = v16;
  v18 = (void *)*MEMORY[0x1E0DC1178];
  *(_QWORD *)(inited + 104) = v17;
  *(_QWORD *)(inited + 112) = v18;
  *(_QWORD *)(inited + 144) = sub_1BA2F299C(0, (unint64_t *)&unk_1ED5C0260);
  *(_QWORD *)(inited + 120) = v8;
  v19 = v18;
  v20 = v8;
  sub_1BA392D48(inited);
  v21 = objc_allocWithZone(MEMORY[0x1E0CB3498]);
  v22 = (void *)sub_1BA437C18();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_1BA328CA4();
  v23 = (void *)sub_1BA437BC4();
  swift_bridgeObjectRelease();
  v24 = objc_msgSend(v21, sel_initWithString_attributes_, v22, v23);

  objc_msgSend(v7, sel_setAttributedText_, v24);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v35 + 16), *(_QWORD *)(v35 + 40));
  v25 = sub_1BA356130(a5);
  if (v25)
  {
    v26 = v25;
    v27 = a1;
  }
  else
  {
    v27 = a1;
    v26 = objc_msgSend(a1, sel_tintColor);
    if (!v26)
    {
LABEL_9:
      __break(1u);
      return;
    }
  }
  v28 = *(void **)&v27[OBJC_IVAR____TtC16NewsSubscription30HideMyEmailSignupAlternateView_checkmark];
  v29 = (void *)sub_1BA437C18();
  v30 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_, v29);

  if (!v30)
  {
    __break(1u);
    goto LABEL_9;
  }
  v31 = objc_msgSend(v30, sel_imageWithTintColor_renderingMode_, v26, 1);

  objc_msgSend(v28, sel_setImage_, v31);
  objc_msgSend(v28, sel_setHidden_, (a5 & 1) == 0);
  objc_msgSend(v7, sel_setFrame_, a2[1], a2[2], a2[3], a2[4]);
  objc_msgSend(v28, sel_setFrame_, a2[5], a2[6], a2[7], a2[8]);
  objc_msgSend(v7, sel_setNumberOfLines_, 1);
  v32 = objc_msgSend(*(id *)(*__swift_project_boxed_opaque_existential_1((_QWORD *)(v35 + 16), *(_QWORD *)(v35 + 40)) + 64), sel_backgroundColor);
  v33 = sub_1BA356E40(v32);

  if (!v33)
    v33 = objc_msgSend(v34, sel_systemBackgroundColor);
  objc_msgSend(a1, sel_setBackgroundColor_, v33);

}

uint64_t type metadata accessor for HideMyEmailSignupAlternateViewRenderer()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_1BA435C74()
{
  return MEMORY[0x1E0CADF10]();
}

uint64_t sub_1BA435C80()
{
  return MEMORY[0x1E0CADF50]();
}

uint64_t sub_1BA435C8C()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1BA435C98()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1BA435CA4()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1BA435CB0()
{
  return MEMORY[0x1E0CAE0D0]();
}

uint64_t sub_1BA435CBC()
{
  return MEMORY[0x1E0CAE0E0]();
}

uint64_t sub_1BA435CC8()
{
  return MEMORY[0x1E0CAE108]();
}

uint64_t sub_1BA435CD4()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1BA435CE0()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1BA435CEC()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1BA435CF8()
{
  return MEMORY[0x1E0CAE390]();
}

uint64_t sub_1BA435D04()
{
  return MEMORY[0x1E0CAE3C8]();
}

uint64_t sub_1BA435D10()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1BA435D1C()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t sub_1BA435D28()
{
  return MEMORY[0x1E0CAE638]();
}

uint64_t sub_1BA435D34()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_1BA435D40()
{
  return MEMORY[0x1E0CAE668]();
}

uint64_t sub_1BA435D4C()
{
  return MEMORY[0x1E0CAE670]();
}

uint64_t sub_1BA435D58()
{
  return MEMORY[0x1E0CAE678]();
}

uint64_t sub_1BA435D64()
{
  return MEMORY[0x1E0CAE690]();
}

uint64_t sub_1BA435D70()
{
  return MEMORY[0x1E0CAE768]();
}

uint64_t sub_1BA435D7C()
{
  return MEMORY[0x1E0CAE778]();
}

uint64_t sub_1BA435D88()
{
  return MEMORY[0x1E0CAE7C8]();
}

uint64_t sub_1BA435D94()
{
  return MEMORY[0x1E0CAE7D0]();
}

uint64_t sub_1BA435DA0()
{
  return MEMORY[0x1E0CAE7E0]();
}

uint64_t sub_1BA435DAC()
{
  return MEMORY[0x1E0CAE7F0]();
}

uint64_t sub_1BA435DB8()
{
  return MEMORY[0x1E0CAE800]();
}

uint64_t sub_1BA435DC4()
{
  return MEMORY[0x1E0CAE808]();
}

uint64_t sub_1BA435DD0()
{
  return MEMORY[0x1E0CAE818]();
}

uint64_t sub_1BA435DDC()
{
  return MEMORY[0x1E0CAE848]();
}

uint64_t sub_1BA435DE8()
{
  return MEMORY[0x1E0CAE878]();
}

uint64_t sub_1BA435DF4()
{
  return MEMORY[0x1E0CAE890]();
}

uint64_t sub_1BA435E00()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_1BA435E0C()
{
  return MEMORY[0x1E0CAF8D8]();
}

uint64_t sub_1BA435E18()
{
  return MEMORY[0x1E0CAF8E8]();
}

uint64_t sub_1BA435E24()
{
  return MEMORY[0x1E0CAF8F8]();
}

uint64_t sub_1BA435E30()
{
  return MEMORY[0x1E0CAF900]();
}

uint64_t sub_1BA435E3C()
{
  return MEMORY[0x1E0CAF910]();
}

uint64_t sub_1BA435E48()
{
  return MEMORY[0x1E0CAF920]();
}

uint64_t sub_1BA435E54()
{
  return MEMORY[0x1E0CAF930]();
}

uint64_t sub_1BA435E60()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1BA435E6C()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1BA435E78()
{
  return MEMORY[0x1E0CAFD90]();
}

uint64_t sub_1BA435E84()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1BA435E90()
{
  return MEMORY[0x1E0CAFDD8]();
}

uint64_t sub_1BA435E9C()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_1BA435EA8()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1BA435EB4()
{
  return MEMORY[0x1E0CAFE78]();
}

uint64_t sub_1BA435EC0()
{
  return MEMORY[0x1E0CAFE80]();
}

uint64_t sub_1BA435ECC()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1BA435ED8()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1BA435EE4()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1BA435EF0()
{
  return MEMORY[0x1E0CAFF98]();
}

uint64_t sub_1BA435EFC()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1BA435F08()
{
  return MEMORY[0x1E0CB00A0]();
}

uint64_t sub_1BA435F14()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1BA435F20()
{
  return MEMORY[0x1E0CB01F8]();
}

uint64_t sub_1BA435F2C()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1BA435F38()
{
  return MEMORY[0x1E0CB0588]();
}

uint64_t sub_1BA435F44()
{
  return MEMORY[0x1E0CB05C8]();
}

uint64_t sub_1BA435F50()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t sub_1BA435F5C()
{
  return MEMORY[0x1E0CB0680]();
}

uint64_t sub_1BA435F68()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1BA435F74()
{
  return MEMORY[0x1E0CB06D0]();
}

uint64_t sub_1BA435F80()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_1BA435F8C()
{
  return MEMORY[0x1E0CB07B0]();
}

uint64_t sub_1BA435F98()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1BA435FA4()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1BA435FB0()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1BA435FBC()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1BA435FC8()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1BA435FD4()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1BA435FE0()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1BA435FEC()
{
  return MEMORY[0x1E0CB0AC0]();
}

uint64_t sub_1BA435FF8()
{
  return MEMORY[0x1E0CB0AE8]();
}

uint64_t sub_1BA436004()
{
  return MEMORY[0x1E0CB0C38]();
}

uint64_t sub_1BA436010()
{
  return MEMORY[0x1E0CB0C48]();
}

uint64_t sub_1BA43601C()
{
  return MEMORY[0x1E0CB0CB0]();
}

uint64_t sub_1BA436028()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1BA436034()
{
  return MEMORY[0x1E0CB0D80]();
}

uint64_t sub_1BA436040()
{
  return MEMORY[0x1E0CB0DB8]();
}

uint64_t sub_1BA43604C()
{
  return MEMORY[0x1E0CB0DF0]();
}

uint64_t sub_1BA436058()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1BA436064()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_1BA436070()
{
  return MEMORY[0x1E0CB11B8]();
}

uint64_t sub_1BA43607C()
{
  return MEMORY[0x1E0CB11E0]();
}

uint64_t sub_1BA436088()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1BA436094()
{
  return MEMORY[0x1E0CB15E8]();
}

uint64_t sub_1BA4360A0()
{
  return MEMORY[0x1E0CB1608]();
}

uint64_t sub_1BA4360AC()
{
  return MEMORY[0x1E0DC1A38]();
}

uint64_t sub_1BA4360B8()
{
  return MEMORY[0x1E0DC1A48]();
}

uint64_t sub_1BA4360C4()
{
  return MEMORY[0x1E0CB1658]();
}

uint64_t sub_1BA4360D0()
{
  return MEMORY[0x1E0DB5488]();
}

uint64_t sub_1BA4360DC()
{
  return MEMORY[0x1E0DB5490]();
}

uint64_t sub_1BA4360E8()
{
  return MEMORY[0x1E0DB54A0]();
}

uint64_t sub_1BA4360F4()
{
  return MEMORY[0x1E0DB54B0]();
}

uint64_t sub_1BA436100()
{
  return MEMORY[0x1E0DB54B8]();
}

uint64_t sub_1BA43610C()
{
  return MEMORY[0x1E0DB54C0]();
}

uint64_t sub_1BA436118()
{
  return MEMORY[0x1E0DB54C8]();
}

uint64_t sub_1BA436124()
{
  return MEMORY[0x1E0DB54F8]();
}

uint64_t sub_1BA436130()
{
  return MEMORY[0x1E0DB5510]();
}

uint64_t sub_1BA43613C()
{
  return MEMORY[0x1E0DB5518]();
}

uint64_t sub_1BA436148()
{
  return MEMORY[0x1E0DB5520]();
}

uint64_t _s11TeaSettings0B0C16NewsSubscriptionE10BestOffersV15ConfigOverridesCfd_0()
{
  return MEMORY[0x1E0DB5548]();
}

uint64_t sub_1BA436160()
{
  return MEMORY[0x1E0DB55A8]();
}

uint64_t sub_1BA43616C()
{
  return MEMORY[0x1E0DB55C0]();
}

uint64_t sub_1BA436178()
{
  return MEMORY[0x1E0DB5600]();
}

uint64_t sub_1BA436184()
{
  return MEMORY[0x1E0DB5610]();
}

uint64_t sub_1BA436190()
{
  return MEMORY[0x1E0DB5700]();
}

uint64_t sub_1BA43619C()
{
  return MEMORY[0x1E0DB5708]();
}

uint64_t sub_1BA4361A8()
{
  return MEMORY[0x1E0DB5778]();
}

uint64_t sub_1BA4361B4()
{
  return MEMORY[0x1E0DB57B0]();
}

uint64_t sub_1BA4361C0()
{
  return MEMORY[0x1E0DB57C8]();
}

uint64_t sub_1BA4361CC()
{
  return MEMORY[0x1E0DB57F0]();
}

uint64_t sub_1BA4361D8()
{
  return MEMORY[0x1E0DB5808]();
}

uint64_t sub_1BA4361E4()
{
  return MEMORY[0x1E0DB5818]();
}

uint64_t sub_1BA4361F0()
{
  return MEMORY[0x1E0DB5830]();
}

uint64_t sub_1BA4361FC()
{
  return MEMORY[0x1E0DB5838]();
}

uint64_t sub_1BA436208()
{
  return MEMORY[0x1E0DB5858]();
}

uint64_t sub_1BA436214()
{
  return MEMORY[0x1E0DB5860]();
}

uint64_t sub_1BA436220()
{
  return MEMORY[0x1E0DB5878]();
}

uint64_t sub_1BA43622C()
{
  return MEMORY[0x1E0DB5890]();
}

uint64_t sub_1BA436238()
{
  return MEMORY[0x1E0DB5928]();
}

uint64_t sub_1BA436244()
{
  return MEMORY[0x1E0DB5930]();
}

uint64_t sub_1BA436250()
{
  return MEMORY[0x1E0DB5938]();
}

uint64_t sub_1BA43625C()
{
  return MEMORY[0x1E0DB5940]();
}

uint64_t sub_1BA436268()
{
  return MEMORY[0x1E0DB5D98]();
}

uint64_t sub_1BA436274()
{
  return MEMORY[0x1E0DB5E00]();
}

uint64_t sub_1BA436280()
{
  return MEMORY[0x1E0DB5E78]();
}

uint64_t sub_1BA43628C()
{
  return MEMORY[0x1E0DB60A0]();
}

uint64_t sub_1BA436298()
{
  return MEMORY[0x1E0DB60F0]();
}

uint64_t sub_1BA4362A4()
{
  return MEMORY[0x1E0DB60F8]();
}

uint64_t sub_1BA4362B0()
{
  return MEMORY[0x1E0DB6148]();
}

uint64_t sub_1BA4362BC()
{
  return MEMORY[0x1E0CF8618]();
}

uint64_t sub_1BA4362C8()
{
  return MEMORY[0x1E0CF8638]();
}

uint64_t sub_1BA4362D4()
{
  return MEMORY[0x1E0DB65C8]();
}

uint64_t sub_1BA4362E0()
{
  return MEMORY[0x1E0D20EF8]();
}

uint64_t sub_1BA4362EC()
{
  return MEMORY[0x1E0DB3020]();
}

uint64_t sub_1BA4362F8()
{
  return MEMORY[0x1E0DB3030]();
}

uint64_t sub_1BA436304()
{
  return MEMORY[0x1E0DB3038]();
}

uint64_t sub_1BA436310()
{
  return MEMORY[0x1E0DB3060]();
}

uint64_t sub_1BA43631C()
{
  return MEMORY[0x1E0DB3068]();
}

uint64_t sub_1BA436328()
{
  return MEMORY[0x1E0DB3070]();
}

uint64_t sub_1BA436334()
{
  return MEMORY[0x1E0DB31E0]();
}

uint64_t sub_1BA436340()
{
  return MEMORY[0x1E0DB31E8]();
}

uint64_t sub_1BA43634C()
{
  return MEMORY[0x1E0DB31F0]();
}

uint64_t sub_1BA436358()
{
  return MEMORY[0x1E0DB31F8]();
}

uint64_t sub_1BA436364()
{
  return MEMORY[0x1E0DB3210]();
}

uint64_t sub_1BA436370()
{
  return MEMORY[0x1E0DB3220]();
}

uint64_t sub_1BA43637C()
{
  return MEMORY[0x1E0DB3268]();
}

uint64_t sub_1BA436388()
{
  return MEMORY[0x1E0DB3328]();
}

uint64_t sub_1BA436394()
{
  return MEMORY[0x1E0DB3330]();
}

uint64_t sub_1BA4363A0()
{
  return MEMORY[0x1E0DB3338]();
}

uint64_t sub_1BA4363AC()
{
  return MEMORY[0x1E0DB33C0]();
}

uint64_t sub_1BA4363B8()
{
  return MEMORY[0x1E0DB33C8]();
}

uint64_t sub_1BA4363C4()
{
  return MEMORY[0x1E0DB3458]();
}

uint64_t sub_1BA4363D0()
{
  return MEMORY[0x1E0DB34D8]();
}

uint64_t sub_1BA4363DC()
{
  return MEMORY[0x1E0DB34E8]();
}

uint64_t sub_1BA4363E8()
{
  return MEMORY[0x1E0DB3500]();
}

uint64_t sub_1BA4363F4()
{
  return MEMORY[0x1E0DB3508]();
}

uint64_t sub_1BA436400()
{
  return MEMORY[0x1E0DB35C0]();
}

uint64_t sub_1BA43640C()
{
  return MEMORY[0x1E0DB35C8]();
}

uint64_t sub_1BA436418()
{
  return MEMORY[0x1E0DB35D0]();
}

uint64_t sub_1BA436424()
{
  return MEMORY[0x1E0DB35D8]();
}

uint64_t sub_1BA436430()
{
  return MEMORY[0x1E0DB35E0]();
}

uint64_t sub_1BA43643C()
{
  return MEMORY[0x1E0DB35E8]();
}

uint64_t sub_1BA436448()
{
  return MEMORY[0x1E0DB35F0]();
}

uint64_t sub_1BA436454()
{
  return MEMORY[0x1E0DB36F0]();
}

uint64_t sub_1BA436460()
{
  return MEMORY[0x1E0DB3778]();
}

uint64_t sub_1BA43646C()
{
  return MEMORY[0x1E0DB3788]();
}

uint64_t sub_1BA436478()
{
  return MEMORY[0x1E0DB37B8]();
}

uint64_t sub_1BA436484()
{
  return MEMORY[0x1E0DB37C0]();
}

uint64_t sub_1BA436490()
{
  return MEMORY[0x1E0DB3850]();
}

uint64_t sub_1BA43649C()
{
  return MEMORY[0x1E0DB3880]();
}

uint64_t sub_1BA4364A8()
{
  return MEMORY[0x1E0DB3890]();
}

uint64_t sub_1BA4364B4()
{
  return MEMORY[0x1E0DB3898]();
}

uint64_t sub_1BA4364C0()
{
  return MEMORY[0x1E0DB38A8]();
}

uint64_t sub_1BA4364CC()
{
  return MEMORY[0x1E0DB38B0]();
}

uint64_t sub_1BA4364D8()
{
  return MEMORY[0x1E0DB38B8]();
}

uint64_t sub_1BA4364E4()
{
  return MEMORY[0x1E0DB38F8]();
}

uint64_t sub_1BA4364F0()
{
  return MEMORY[0x1E0DB3908]();
}

uint64_t sub_1BA4364FC()
{
  return MEMORY[0x1E0DB3910]();
}

uint64_t sub_1BA436508()
{
  return MEMORY[0x1E0DB3918]();
}

uint64_t sub_1BA436514()
{
  return MEMORY[0x1E0DB3920]();
}

uint64_t sub_1BA436520()
{
  return MEMORY[0x1E0DB3A40]();
}

uint64_t sub_1BA43652C()
{
  return MEMORY[0x1E0DB3A48]();
}

uint64_t sub_1BA436538()
{
  return MEMORY[0x1E0DB3A50]();
}

uint64_t sub_1BA436544()
{
  return MEMORY[0x1E0DB3A60]();
}

uint64_t sub_1BA436550()
{
  return MEMORY[0x1E0DB3AB8]();
}

uint64_t sub_1BA43655C()
{
  return MEMORY[0x1E0DB3AD0]();
}

uint64_t sub_1BA436568()
{
  return MEMORY[0x1E0DB3AE0]();
}

uint64_t sub_1BA436574()
{
  return MEMORY[0x1E0DB3AE8]();
}

uint64_t sub_1BA436580()
{
  return MEMORY[0x1E0DB3AF0]();
}

uint64_t sub_1BA43658C()
{
  return MEMORY[0x1E0DB3B00]();
}

uint64_t sub_1BA436598()
{
  return MEMORY[0x1E0DB3C88]();
}

uint64_t sub_1BA4365A4()
{
  return MEMORY[0x1E0DB3C98]();
}

uint64_t sub_1BA4365B0()
{
  return MEMORY[0x1E0DB3CA0]();
}

uint64_t sub_1BA4365BC()
{
  return MEMORY[0x1E0DB3CA8]();
}

uint64_t sub_1BA4365C8()
{
  return MEMORY[0x1E0DB3CB0]();
}

uint64_t sub_1BA4365D4()
{
  return MEMORY[0x1E0DB3CC0]();
}

uint64_t sub_1BA4365E0()
{
  return MEMORY[0x1E0DB3CD0]();
}

uint64_t sub_1BA4365EC()
{
  return MEMORY[0x1E0DB3D10]();
}

uint64_t sub_1BA4365F8()
{
  return MEMORY[0x1E0DB3D50]();
}

uint64_t sub_1BA436604()
{
  return MEMORY[0x1E0DB3DA0]();
}

uint64_t sub_1BA436610()
{
  return MEMORY[0x1E0DB3DA8]();
}

uint64_t sub_1BA43661C()
{
  return MEMORY[0x1E0DB3EB0]();
}

uint64_t sub_1BA436628()
{
  return MEMORY[0x1E0DB3EB8]();
}

uint64_t sub_1BA436634()
{
  return MEMORY[0x1E0DB3EC0]();
}

uint64_t sub_1BA436640()
{
  return MEMORY[0x1E0DB3EC8]();
}

uint64_t sub_1BA43664C()
{
  return MEMORY[0x1E0DB3ED0]();
}

uint64_t sub_1BA436658()
{
  return MEMORY[0x1E0DB3ED8]();
}

uint64_t sub_1BA436664()
{
  return MEMORY[0x1E0DB3EE0]();
}

uint64_t sub_1BA436670()
{
  return MEMORY[0x1E0DB3EE8]();
}

uint64_t sub_1BA43667C()
{
  return MEMORY[0x1E0DB3EF0]();
}

uint64_t sub_1BA436688()
{
  return MEMORY[0x1E0DB3F20]();
}

uint64_t sub_1BA436694()
{
  return MEMORY[0x1E0DB3F28]();
}

uint64_t sub_1BA4366A0()
{
  return MEMORY[0x1E0DB3FB0]();
}

uint64_t sub_1BA4366AC()
{
  return MEMORY[0x1E0DB3FC0]();
}

uint64_t sub_1BA4366B8()
{
  return MEMORY[0x1E0DB3FD0]();
}

uint64_t sub_1BA4366C4()
{
  return MEMORY[0x1E0DB3FF8]();
}

uint64_t sub_1BA4366D0()
{
  return MEMORY[0x1E0DB40F8]();
}

uint64_t sub_1BA4366DC()
{
  return MEMORY[0x1E0DB4120]();
}

uint64_t sub_1BA4366E8()
{
  return MEMORY[0x1E0DB4188]();
}

uint64_t sub_1BA4366F4()
{
  return MEMORY[0x1E0DB4198]();
}

uint64_t sub_1BA436700()
{
  return MEMORY[0x1E0DB4238]();
}

uint64_t sub_1BA43670C()
{
  return MEMORY[0x1E0DB4240]();
}

uint64_t sub_1BA436718()
{
  return MEMORY[0x1E0DB4248]();
}

uint64_t sub_1BA436724()
{
  return MEMORY[0x1E0DB4250]();
}

uint64_t sub_1BA436730()
{
  return MEMORY[0x1E0DB43A8]();
}

uint64_t sub_1BA43673C()
{
  return MEMORY[0x1E0DB43B0]();
}

uint64_t sub_1BA436748()
{
  return MEMORY[0x1E0DB43B8]();
}

uint64_t sub_1BA436754()
{
  return MEMORY[0x1E0DB4418]();
}

uint64_t sub_1BA436760()
{
  return MEMORY[0x1E0DB4428]();
}

uint64_t sub_1BA43676C()
{
  return MEMORY[0x1E0DB4500]();
}

uint64_t sub_1BA436778()
{
  return MEMORY[0x1E0DB6620]();
}

uint64_t sub_1BA436784()
{
  return MEMORY[0x1E0DB4548]();
}

uint64_t sub_1BA436790()
{
  return MEMORY[0x1E0DB4558]();
}

uint64_t sub_1BA43679C()
{
  return MEMORY[0x1E0DB45C8]();
}

uint64_t sub_1BA4367A8()
{
  return MEMORY[0x1E0DB45D0]();
}

uint64_t sub_1BA4367B4()
{
  return MEMORY[0x1E0DB46B8]();
}

uint64_t sub_1BA4367C0()
{
  return MEMORY[0x1E0DB46E8]();
}

uint64_t sub_1BA4367CC()
{
  return MEMORY[0x1E0DB48F8]();
}

uint64_t sub_1BA4367D8()
{
  return MEMORY[0x1E0DB4910]();
}

uint64_t sub_1BA4367E4()
{
  return MEMORY[0x1E0DB4918]();
}

uint64_t sub_1BA4367F0()
{
  return MEMORY[0x1E0DB4958]();
}

uint64_t sub_1BA4367FC()
{
  return MEMORY[0x1E0DB4960]();
}

uint64_t sub_1BA436808()
{
  return MEMORY[0x1E0DB4970]();
}

uint64_t sub_1BA436814()
{
  return MEMORY[0x1E0DB4988]();
}

uint64_t sub_1BA436820()
{
  return MEMORY[0x1E0DB4990]();
}

uint64_t sub_1BA43682C()
{
  return MEMORY[0x1E0DB49A8]();
}

uint64_t sub_1BA436838()
{
  return MEMORY[0x1E0DB49B8]();
}

uint64_t sub_1BA436844()
{
  return MEMORY[0x1E0DB49C0]();
}

uint64_t sub_1BA436850()
{
  return MEMORY[0x1E0DB49E8]();
}

uint64_t sub_1BA43685C()
{
  return MEMORY[0x1E0DB49F0]();
}

uint64_t sub_1BA436868()
{
  return MEMORY[0x1E0DB4A20]();
}

uint64_t sub_1BA436874()
{
  return MEMORY[0x1E0DB4AA0]();
}

uint64_t sub_1BA436880()
{
  return MEMORY[0x1E0DB4AA8]();
}

uint64_t sub_1BA43688C()
{
  return MEMORY[0x1E0DB4AB8]();
}

uint64_t sub_1BA436898()
{
  return MEMORY[0x1E0DB4AC8]();
}

uint64_t sub_1BA4368A4()
{
  return MEMORY[0x1E0DB4AD8]();
}

uint64_t sub_1BA4368B0()
{
  return MEMORY[0x1E0DB4AE0]();
}

uint64_t sub_1BA4368BC()
{
  return MEMORY[0x1E0DB4B68]();
}

uint64_t sub_1BA4368C8()
{
  return MEMORY[0x1E0DB4BC8]();
}

uint64_t sub_1BA4368D4()
{
  return MEMORY[0x1E0DB4BF8]();
}

uint64_t sub_1BA4368E0()
{
  return MEMORY[0x1E0DB4C00]();
}

uint64_t sub_1BA4368EC()
{
  return MEMORY[0x1E0DB4C08]();
}

uint64_t sub_1BA4368F8()
{
  return MEMORY[0x1E0DB4C10]();
}

uint64_t sub_1BA436904()
{
  return MEMORY[0x1E0DB4C30]();
}

uint64_t sub_1BA436910()
{
  return MEMORY[0x1E0DB4C38]();
}

uint64_t sub_1BA43691C()
{
  return MEMORY[0x1E0DB4C48]();
}

uint64_t sub_1BA436928()
{
  return MEMORY[0x1E0DB4C58]();
}

uint64_t sub_1BA436934()
{
  return MEMORY[0x1E0DB4C60]();
}

uint64_t sub_1BA436940()
{
  return MEMORY[0x1E0DB4C70]();
}

uint64_t sub_1BA43694C()
{
  return MEMORY[0x1E0DB4C78]();
}

uint64_t sub_1BA436958()
{
  return MEMORY[0x1E0DB4C80]();
}

uint64_t sub_1BA436964()
{
  return MEMORY[0x1E0DB4C88]();
}

uint64_t sub_1BA436970()
{
  return MEMORY[0x1E0DB4C90]();
}

uint64_t sub_1BA43697C()
{
  return MEMORY[0x1E0DB4CC0]();
}

uint64_t sub_1BA436988()
{
  return MEMORY[0x1E0DB4D08]();
}

uint64_t sub_1BA436994()
{
  return MEMORY[0x1E0DB4D80]();
}

uint64_t sub_1BA4369A0()
{
  return MEMORY[0x1E0DB4DA0]();
}

uint64_t sub_1BA4369AC()
{
  return MEMORY[0x1E0DB4DA8]();
}

uint64_t sub_1BA4369B8()
{
  return MEMORY[0x1E0DB4DC8]();
}

uint64_t sub_1BA4369C4()
{
  return MEMORY[0x1E0DB4E60]();
}

uint64_t sub_1BA4369D0()
{
  return MEMORY[0x1E0DB4E78]();
}

uint64_t sub_1BA4369DC()
{
  return MEMORY[0x1E0DB4E88]();
}

uint64_t sub_1BA4369E8()
{
  return MEMORY[0x1E0DB4EC0]();
}

uint64_t sub_1BA4369F4()
{
  return MEMORY[0x1E0DB4FA8]();
}

uint64_t sub_1BA436A00()
{
  return MEMORY[0x1E0DB50A8]();
}

uint64_t sub_1BA436A0C()
{
  return MEMORY[0x1E0DB50B0]();
}

uint64_t sub_1BA436A18()
{
  return MEMORY[0x1E0DB50C0]();
}

uint64_t sub_1BA436A24()
{
  return MEMORY[0x1E0DB50D0]();
}

uint64_t sub_1BA436A30()
{
  return MEMORY[0x1E0DB50E8]();
}

uint64_t sub_1BA436A3C()
{
  return MEMORY[0x1E0D81DB8]();
}

uint64_t sub_1BA436A48()
{
  return MEMORY[0x1E0D81DC0]();
}

uint64_t sub_1BA436A54()
{
  return MEMORY[0x1E0D61380]();
}

uint64_t sub_1BA436A60()
{
  return MEMORY[0x1E0D61388]();
}

uint64_t sub_1BA436A6C()
{
  return MEMORY[0x1E0D61390]();
}

uint64_t sub_1BA436A78()
{
  return MEMORY[0x1E0D61478]();
}

uint64_t sub_1BA436A84()
{
  return MEMORY[0x1E0D61490]();
}

uint64_t sub_1BA436A90()
{
  return MEMORY[0x1E0D61498]();
}

uint64_t sub_1BA436A9C()
{
  return MEMORY[0x1E0D614A0]();
}

uint64_t sub_1BA436AA8()
{
  return MEMORY[0x1E0DF2078]();
}

uint64_t sub_1BA436AB4()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1BA436AC0()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1BA436ACC()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1BA436AD8()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1BA436AE4()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t sub_1BA436AF0()
{
  return MEMORY[0x1E0DB2A28]();
}

uint64_t sub_1BA436AFC()
{
  return MEMORY[0x1E0DB2A30]();
}

uint64_t sub_1BA436B08()
{
  return MEMORY[0x1E0DB2A40]();
}

uint64_t sub_1BA436B14()
{
  return MEMORY[0x1E0DB2A48]();
}

uint64_t sub_1BA436B20()
{
  return MEMORY[0x1E0DB2A58]();
}

uint64_t sub_1BA436B2C()
{
  return MEMORY[0x1E0DB2A60]();
}

uint64_t sub_1BA436B38()
{
  return MEMORY[0x1E0DB2A68]();
}

uint64_t sub_1BA436B44()
{
  return MEMORY[0x1E0DB2A70]();
}

uint64_t sub_1BA436B50()
{
  return MEMORY[0x1E0DB2A78]();
}

uint64_t sub_1BA436B5C()
{
  return MEMORY[0x1E0DB2A90]();
}

uint64_t sub_1BA436B68()
{
  return MEMORY[0x1E0DB2A98]();
}

uint64_t sub_1BA436B74()
{
  return MEMORY[0x1E0DB2AA8]();
}

uint64_t sub_1BA436B80()
{
  return MEMORY[0x1E0DB2AB0]();
}

uint64_t sub_1BA436B8C()
{
  return MEMORY[0x1E0DB2AE8]();
}

uint64_t sub_1BA436B98()
{
  return MEMORY[0x1E0DB2B10]();
}

uint64_t sub_1BA436BA4()
{
  return MEMORY[0x1E0DB2D60]();
}

uint64_t sub_1BA436BB0()
{
  return MEMORY[0x1E0DB2D70]();
}

uint64_t sub_1BA436BBC()
{
  return MEMORY[0x1E0DB2D90]();
}

uint64_t sub_1BA436BC8()
{
  return MEMORY[0x1E0DB2DA0]();
}

uint64_t sub_1BA436BD4()
{
  return MEMORY[0x1E0DB2DB8]();
}

uint64_t sub_1BA436BE0()
{
  return MEMORY[0x1E0DB2E08]();
}

uint64_t sub_1BA436BEC()
{
  return MEMORY[0x1E0DB2E18]();
}

uint64_t sub_1BA436BF8()
{
  return MEMORY[0x1E0DB2E30]();
}

uint64_t sub_1BA436C04()
{
  return MEMORY[0x1E0DB2E40]();
}

uint64_t sub_1BA436C10()
{
  return MEMORY[0x1E0DB6718]();
}

uint64_t sub_1BA436C1C()
{
  return MEMORY[0x1E0DB6720]();
}

uint64_t sub_1BA436C28()
{
  return MEMORY[0x1E0DB6728]();
}

uint64_t sub_1BA436C34()
{
  return MEMORY[0x1E0DB6840]();
}

uint64_t sub_1BA436C40()
{
  return MEMORY[0x1E0DB6848]();
}

uint64_t sub_1BA436C4C()
{
  return MEMORY[0x1E0DB6898]();
}

uint64_t sub_1BA436C58()
{
  return MEMORY[0x1E0DB68A8]();
}

uint64_t sub_1BA436C64()
{
  return MEMORY[0x1E0DB6A08]();
}

uint64_t sub_1BA436C70()
{
  return MEMORY[0x1E0DB6A28]();
}

uint64_t sub_1BA436C7C()
{
  return MEMORY[0x1E0DB6C28]();
}

uint64_t sub_1BA436C88()
{
  return MEMORY[0x1E0DB6C30]();
}

uint64_t sub_1BA436C94()
{
  return MEMORY[0x1E0DB6C60]();
}

uint64_t sub_1BA436CA0()
{
  return MEMORY[0x1E0DB6C88]();
}

uint64_t sub_1BA436CAC()
{
  return MEMORY[0x1E0DB6D40]();
}

uint64_t sub_1BA436CB8()
{
  return MEMORY[0x1E0DB6D48]();
}

uint64_t sub_1BA436CC4()
{
  return MEMORY[0x1E0DB6EB0]();
}

uint64_t sub_1BA436CD0()
{
  return MEMORY[0x1E0DB6ED8]();
}

uint64_t sub_1BA436CDC()
{
  return MEMORY[0x1E0DB6EE0]();
}

uint64_t sub_1BA436CE8()
{
  return MEMORY[0x1E0DB6EE8]();
}

uint64_t sub_1BA436CF4()
{
  return MEMORY[0x1E0DB6F90]();
}

uint64_t sub_1BA436D00()
{
  return MEMORY[0x1E0DB6FF0]();
}

uint64_t sub_1BA436D0C()
{
  return MEMORY[0x1E0DB6FF8]();
}

uint64_t sub_1BA436D18()
{
  return MEMORY[0x1E0DB7000]();
}

uint64_t sub_1BA436D24()
{
  return MEMORY[0x1E0DB7008]();
}

uint64_t sub_1BA436D30()
{
  return MEMORY[0x1E0DB7010]();
}

uint64_t sub_1BA436D3C()
{
  return MEMORY[0x1E0DB7228]();
}

uint64_t sub_1BA436D48()
{
  return MEMORY[0x1E0DB7238]();
}

uint64_t sub_1BA436D54()
{
  return MEMORY[0x1E0DB72D8]();
}

uint64_t sub_1BA436D60()
{
  return MEMORY[0x1E0DB72E0]();
}

uint64_t sub_1BA436D6C()
{
  return MEMORY[0x1E0DB72F0]();
}

uint64_t sub_1BA436D78()
{
  return MEMORY[0x1E0DB7448]();
}

uint64_t sub_1BA436D84()
{
  return MEMORY[0x1E0DB7498]();
}

uint64_t sub_1BA436D90()
{
  return MEMORY[0x1E0DB74A0]();
}

uint64_t sub_1BA436D9C()
{
  return MEMORY[0x1E0DB7660]();
}

uint64_t sub_1BA436DA8()
{
  return MEMORY[0x1E0DB7668]();
}

uint64_t sub_1BA436DB4()
{
  return MEMORY[0x1E0DB76B0]();
}

uint64_t sub_1BA436DC0()
{
  return MEMORY[0x1E0DB7830]();
}

uint64_t sub_1BA436DCC()
{
  return MEMORY[0x1E0DB7838]();
}

uint64_t sub_1BA436DD8()
{
  return MEMORY[0x1E0DB7AC0]();
}

uint64_t sub_1BA436DE4()
{
  return MEMORY[0x1E0DB7AC8]();
}

uint64_t sub_1BA436DF0()
{
  return MEMORY[0x1E0DB7B60]();
}

uint64_t sub_1BA436DFC()
{
  return MEMORY[0x1E0DB7D18]();
}

uint64_t sub_1BA436E08()
{
  return MEMORY[0x1E0DB7D38]();
}

uint64_t sub_1BA436E14()
{
  return MEMORY[0x1E0DB7D40]();
}

uint64_t sub_1BA436E20()
{
  return MEMORY[0x1E0DB7D48]();
}

uint64_t sub_1BA436E2C()
{
  return MEMORY[0x1E0DB7D50]();
}

uint64_t sub_1BA436E38()
{
  return MEMORY[0x1E0DB7E98]();
}

uint64_t sub_1BA436E44()
{
  return MEMORY[0x1E0DB7EA0]();
}

uint64_t sub_1BA436E50()
{
  return MEMORY[0x1E0DB7F70]();
}

uint64_t sub_1BA436E5C()
{
  return MEMORY[0x1E0DB7FC8]();
}

uint64_t sub_1BA436E68()
{
  return MEMORY[0x1E0DB8018]();
}

uint64_t sub_1BA436E74()
{
  return MEMORY[0x1E0DB8020]();
}

uint64_t sub_1BA436E80()
{
  return MEMORY[0x1E0DB8048]();
}

uint64_t sub_1BA436E8C()
{
  return MEMORY[0x1E0DB8058]();
}

uint64_t sub_1BA436E98()
{
  return MEMORY[0x1E0DB8068]();
}

uint64_t sub_1BA436EA4()
{
  return MEMORY[0x1E0DB8078]();
}

uint64_t sub_1BA436EB0()
{
  return MEMORY[0x1E0DB8088]();
}

uint64_t sub_1BA436EBC()
{
  return MEMORY[0x1E0DB80B0]();
}

uint64_t sub_1BA436EC8()
{
  return MEMORY[0x1E0DB81C8]();
}

uint64_t sub_1BA436ED4()
{
  return MEMORY[0x1E0DB81D0]();
}

uint64_t sub_1BA436EE0()
{
  return MEMORY[0x1E0DB8228]();
}

uint64_t sub_1BA436EEC()
{
  return MEMORY[0x1E0DB8230]();
}

uint64_t sub_1BA436EF8()
{
  return MEMORY[0x1E0DB8238]();
}

uint64_t sub_1BA436F04()
{
  return MEMORY[0x1E0DB8280]();
}

uint64_t sub_1BA436F10()
{
  return MEMORY[0x1E0DB82D0]();
}

uint64_t sub_1BA436F1C()
{
  return MEMORY[0x1E0DB8418]();
}

uint64_t sub_1BA436F28()
{
  return MEMORY[0x1E0DB8430]();
}

uint64_t sub_1BA436F34()
{
  return MEMORY[0x1E0DB8470]();
}

uint64_t sub_1BA436F40()
{
  return MEMORY[0x1E0DB8598]();
}

uint64_t sub_1BA436F4C()
{
  return MEMORY[0x1E0DB85C8]();
}

uint64_t sub_1BA436F58()
{
  return MEMORY[0x1E0DB85E0]();
}

uint64_t sub_1BA436F64()
{
  return MEMORY[0x1E0DB8890]();
}

uint64_t sub_1BA436F70()
{
  return MEMORY[0x1E0DB8898]();
}

uint64_t sub_1BA436F7C()
{
  return MEMORY[0x1E0DB88A0]();
}

uint64_t sub_1BA436F88()
{
  return MEMORY[0x1E0DB8CA8]();
}

uint64_t sub_1BA436F94()
{
  return MEMORY[0x1E0DB8F18]();
}

uint64_t sub_1BA436FA0()
{
  return MEMORY[0x1E0DB8FE0]();
}

uint64_t sub_1BA436FAC()
{
  return MEMORY[0x1E0DB8FE8]();
}

uint64_t sub_1BA436FB8()
{
  return MEMORY[0x1E0DB8FF8]();
}

uint64_t sub_1BA436FC4()
{
  return MEMORY[0x1E0DB9140]();
}

uint64_t sub_1BA436FD0()
{
  return MEMORY[0x1E0DB9400]();
}

uint64_t sub_1BA436FDC()
{
  return MEMORY[0x1E0DB9408]();
}

uint64_t sub_1BA436FE8()
{
  return MEMORY[0x1E0DB9430]();
}

uint64_t sub_1BA436FF4()
{
  return MEMORY[0x1E0DB9448]();
}

uint64_t sub_1BA437000()
{
  return MEMORY[0x1E0DB94E0]();
}

uint64_t sub_1BA43700C()
{
  return MEMORY[0x1E0DB94F0]();
}

uint64_t sub_1BA437018()
{
  return MEMORY[0x1E0DB94F8]();
}

uint64_t sub_1BA437024()
{
  return MEMORY[0x1E0DB9518]();
}

uint64_t sub_1BA437030()
{
  return MEMORY[0x1E0DB9978]();
}

uint64_t sub_1BA43703C()
{
  return MEMORY[0x1E0DB9980]();
}

uint64_t sub_1BA437048()
{
  return MEMORY[0x1E0DB99F8]();
}

uint64_t sub_1BA437054()
{
  return MEMORY[0x1E0DB9A10]();
}

uint64_t sub_1BA437060()
{
  return MEMORY[0x1E0DB9AA8]();
}

uint64_t sub_1BA43706C()
{
  return MEMORY[0x1E0DB9B18]();
}

uint64_t sub_1BA437078()
{
  return MEMORY[0x1E0DB9B20]();
}

uint64_t sub_1BA437084()
{
  return MEMORY[0x1E0DB9B28]();
}

uint64_t sub_1BA437090()
{
  return MEMORY[0x1E0DB9B30]();
}

uint64_t sub_1BA43709C()
{
  return MEMORY[0x1E0DB9C50]();
}

uint64_t sub_1BA4370A8()
{
  return MEMORY[0x1E0DB9C90]();
}

uint64_t sub_1BA4370B4()
{
  return MEMORY[0x1E0DB9CA0]();
}

uint64_t sub_1BA4370C0()
{
  return MEMORY[0x1E0DB9DE8]();
}

uint64_t sub_1BA4370CC()
{
  return MEMORY[0x1E0DB9DF0]();
}

uint64_t sub_1BA4370D8()
{
  return MEMORY[0x1E0DB9E00]();
}

uint64_t sub_1BA4370E4()
{
  return MEMORY[0x1E0DB9E08]();
}

uint64_t sub_1BA4370F0()
{
  return MEMORY[0x1E0DB9E10]();
}

uint64_t sub_1BA4370FC()
{
  return MEMORY[0x1E0DB9E20]();
}

uint64_t sub_1BA437108()
{
  return MEMORY[0x1E0DB9E30]();
}

uint64_t sub_1BA437114()
{
  return MEMORY[0x1E0DB9E38]();
}

uint64_t sub_1BA437120()
{
  return MEMORY[0x1E0DB9FB8]();
}

uint64_t sub_1BA43712C()
{
  return MEMORY[0x1E0DB9FD0]();
}

uint64_t sub_1BA437138()
{
  return MEMORY[0x1E0DBA0A0]();
}

uint64_t sub_1BA437144()
{
  return MEMORY[0x1E0DBA228]();
}

uint64_t sub_1BA437150()
{
  return MEMORY[0x1E0DBA240]();
}

uint64_t sub_1BA43715C()
{
  return MEMORY[0x1E0DBA360]();
}

uint64_t sub_1BA437168()
{
  return MEMORY[0x1E0DBA368]();
}

uint64_t sub_1BA437174()
{
  return MEMORY[0x1E0DBA370]();
}

uint64_t sub_1BA437180()
{
  return MEMORY[0x1E0DBA378]();
}

uint64_t sub_1BA43718C()
{
  return MEMORY[0x1E0DBA5F8]();
}

uint64_t sub_1BA437198()
{
  return MEMORY[0x1E0DBA6A0]();
}

uint64_t sub_1BA4371A4()
{
  return MEMORY[0x1E0DBA6D8]();
}

uint64_t sub_1BA4371B0()
{
  return MEMORY[0x1E0DBA6E8]();
}

uint64_t sub_1BA4371BC()
{
  return MEMORY[0x1E0DBA6F0]();
}

uint64_t sub_1BA4371C8()
{
  return MEMORY[0x1E0DBAB10]();
}

uint64_t sub_1BA4371D4()
{
  return MEMORY[0x1E0DBAB28]();
}

uint64_t sub_1BA4371E0()
{
  return MEMORY[0x1E0DBAB50]();
}

uint64_t sub_1BA4371EC()
{
  return MEMORY[0x1E0DBAB58]();
}

uint64_t sub_1BA4371F8()
{
  return MEMORY[0x1E0DBADD0]();
}

uint64_t sub_1BA437204()
{
  return MEMORY[0x1E0DBAE20]();
}

uint64_t sub_1BA437210()
{
  return MEMORY[0x1E0DBAE28]();
}

uint64_t sub_1BA43721C()
{
  return MEMORY[0x1E0DBAFE8]();
}

uint64_t sub_1BA437228()
{
  return MEMORY[0x1E0DBB000]();
}

uint64_t sub_1BA437234()
{
  return MEMORY[0x1E0DBB020]();
}

uint64_t sub_1BA437240()
{
  return MEMORY[0x1E0DBB040]();
}

uint64_t sub_1BA43724C()
{
  return MEMORY[0x1E0DBB060]();
}

uint64_t sub_1BA437258()
{
  return MEMORY[0x1E0DBB1C0]();
}

uint64_t sub_1BA437264()
{
  return MEMORY[0x1E0DBB2C0]();
}

uint64_t sub_1BA437270()
{
  return MEMORY[0x1E0DBB2C8]();
}

uint64_t sub_1BA43727C()
{
  return MEMORY[0x1E0DBB400]();
}

uint64_t sub_1BA437288()
{
  return MEMORY[0x1E0DBB408]();
}

uint64_t sub_1BA437294()
{
  return MEMORY[0x1E0DBB468]();
}

uint64_t sub_1BA4372A0()
{
  return MEMORY[0x1E0DBB470]();
}

uint64_t sub_1BA4372AC()
{
  return MEMORY[0x1E0DBB480]();
}

uint64_t sub_1BA4372B8()
{
  return MEMORY[0x1E0DBB488]();
}

uint64_t sub_1BA4372C4()
{
  return MEMORY[0x1E0DBB4F8]();
}

uint64_t sub_1BA4372D0()
{
  return MEMORY[0x1E0DBB508]();
}

uint64_t sub_1BA4372DC()
{
  return MEMORY[0x1E0DBB560]();
}

uint64_t sub_1BA4372E8()
{
  return MEMORY[0x1E0DBB5B8]();
}

uint64_t sub_1BA4372F4()
{
  return MEMORY[0x1E0DBB5C0]();
}

uint64_t sub_1BA437300()
{
  return MEMORY[0x1E0DBB5C8]();
}

uint64_t sub_1BA43730C()
{
  return MEMORY[0x1E0DBB840]();
}

uint64_t sub_1BA437318()
{
  return MEMORY[0x1E0DBB858]();
}

uint64_t sub_1BA437324()
{
  return MEMORY[0x1E0DBB898]();
}

uint64_t sub_1BA437330()
{
  return MEMORY[0x1E0DBBA00]();
}

uint64_t sub_1BA43733C()
{
  return MEMORY[0x1E0DBBA80]();
}

uint64_t sub_1BA437348()
{
  return MEMORY[0x1E0DBBA88]();
}

uint64_t sub_1BA437354()
{
  return MEMORY[0x1E0DBBA90]();
}

uint64_t sub_1BA437360()
{
  return MEMORY[0x1E0DBBA98]();
}

uint64_t sub_1BA43736C()
{
  return MEMORY[0x1E0DBBAA0]();
}

uint64_t sub_1BA437378()
{
  return MEMORY[0x1E0DBBAA8]();
}

uint64_t sub_1BA437384()
{
  return MEMORY[0x1E0DBBAB0]();
}

uint64_t sub_1BA437390()
{
  return MEMORY[0x1E0DBBAB8]();
}

uint64_t sub_1BA43739C()
{
  return MEMORY[0x1E0DBBAC0]();
}

uint64_t sub_1BA4373A8()
{
  return MEMORY[0x1E0DBBAC8]();
}

uint64_t sub_1BA4373B4()
{
  return MEMORY[0x1E0DBBAD0]();
}

uint64_t sub_1BA4373C0()
{
  return MEMORY[0x1E0DBBAD8]();
}

uint64_t sub_1BA4373CC()
{
  return MEMORY[0x1E0DBBAE0]();
}

uint64_t sub_1BA4373D8()
{
  return MEMORY[0x1E0DBBAE8]();
}

uint64_t sub_1BA4373E4()
{
  return MEMORY[0x1E0DBBAF0]();
}

uint64_t sub_1BA4373F0()
{
  return MEMORY[0x1E0DBBAF8]();
}

uint64_t sub_1BA4373FC()
{
  return MEMORY[0x1E0DBBB00]();
}

uint64_t sub_1BA437408()
{
  return MEMORY[0x1E0DBBB08]();
}

uint64_t sub_1BA437414()
{
  return MEMORY[0x1E0DBBB10]();
}

uint64_t sub_1BA437420()
{
  return MEMORY[0x1E0DBBB18]();
}

uint64_t sub_1BA43742C()
{
  return MEMORY[0x1E0DBBB20]();
}

uint64_t sub_1BA437438()
{
  return MEMORY[0x1E0DBBB30]();
}

uint64_t sub_1BA437444()
{
  return MEMORY[0x1E0DBBB40]();
}

uint64_t sub_1BA437450()
{
  return MEMORY[0x1E0DBBD68]();
}

uint64_t sub_1BA43745C()
{
  return MEMORY[0x1E0DBBF70]();
}

uint64_t sub_1BA437468()
{
  return MEMORY[0x1E0DBC248]();
}

uint64_t sub_1BA437474()
{
  return MEMORY[0x1E0DBC250]();
}

uint64_t sub_1BA437480()
{
  return MEMORY[0x1E0DBC258]();
}

uint64_t sub_1BA43748C()
{
  return MEMORY[0x1E0DBC260]();
}

uint64_t sub_1BA437498()
{
  return MEMORY[0x1E0DBC270]();
}

uint64_t sub_1BA4374A4()
{
  return MEMORY[0x1E0DBC290]();
}

uint64_t sub_1BA4374B0()
{
  return MEMORY[0x1E0DBC300]();
}

uint64_t sub_1BA4374BC()
{
  return MEMORY[0x1E0DBC308]();
}

uint64_t sub_1BA4374C8()
{
  return MEMORY[0x1E0DBC330]();
}

uint64_t sub_1BA4374D4()
{
  return MEMORY[0x1E0DBC4D8]();
}

uint64_t sub_1BA4374E0()
{
  return MEMORY[0x1E0DBC4E0]();
}

uint64_t sub_1BA4374EC()
{
  return MEMORY[0x1E0DBC4E8]();
}

uint64_t sub_1BA4374F8()
{
  return MEMORY[0x1E0DBC510]();
}

uint64_t sub_1BA437504()
{
  return MEMORY[0x1E0DBC518]();
}

uint64_t sub_1BA437510()
{
  return MEMORY[0x1E0DBC520]();
}

uint64_t sub_1BA43751C()
{
  return MEMORY[0x1E0DBC640]();
}

uint64_t sub_1BA437528()
{
  return MEMORY[0x1E0DBC650]();
}

uint64_t sub_1BA437534()
{
  return MEMORY[0x1E0DBC660]();
}

uint64_t sub_1BA437540()
{
  return MEMORY[0x1E0DBC668]();
}

uint64_t sub_1BA43754C()
{
  return MEMORY[0x1E0DBC670]();
}

uint64_t sub_1BA437558()
{
  return MEMORY[0x1E0DBC678]();
}

uint64_t sub_1BA437564()
{
  return MEMORY[0x1E0DBC680]();
}

uint64_t sub_1BA437570()
{
  return MEMORY[0x1E0DBC690]();
}

uint64_t sub_1BA43757C()
{
  return MEMORY[0x1E0DBC698]();
}

uint64_t sub_1BA437588()
{
  return MEMORY[0x1E0DBC6A0]();
}

uint64_t sub_1BA437594()
{
  return MEMORY[0x1E0DBC6A8]();
}

uint64_t sub_1BA4375A0()
{
  return MEMORY[0x1E0DBC6B0]();
}

uint64_t sub_1BA4375AC()
{
  return MEMORY[0x1E0DBC6B8]();
}

uint64_t sub_1BA4375B8()
{
  return MEMORY[0x1E0DBC760]();
}

uint64_t sub_1BA4375C4()
{
  return MEMORY[0x1E0DBC818]();
}

uint64_t sub_1BA4375D0()
{
  return MEMORY[0x1E0DBC820]();
}

uint64_t sub_1BA4375DC()
{
  return MEMORY[0x1E0DBC898]();
}

uint64_t sub_1BA4375E8()
{
  return MEMORY[0x1E0DBC8A0]();
}

uint64_t sub_1BA4375F4()
{
  return MEMORY[0x1E0DBC9A0]();
}

uint64_t sub_1BA437600()
{
  return MEMORY[0x1E0DC23D8]();
}

uint64_t sub_1BA43760C()
{
  return MEMORY[0x1E0D52E40]();
}

uint64_t sub_1BA437618()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1BA437624()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_1BA437630()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1BA43763C()
{
  return MEMORY[0x1E0DEF580]();
}

uint64_t sub_1BA437648()
{
  return MEMORY[0x1E0DEF598]();
}

uint64_t sub_1BA437654()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1BA437660()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1BA43766C()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1BA437678()
{
  return MEMORY[0x1E0D5A218]();
}

uint64_t sub_1BA437684()
{
  return MEMORY[0x1E0D5A640]();
}

uint64_t sub_1BA437690()
{
  return MEMORY[0x1E0D5A7C0]();
}

uint64_t sub_1BA43769C()
{
  return MEMORY[0x1E0D5A7E0]();
}

uint64_t sub_1BA4376A8()
{
  return MEMORY[0x1E0D5A810]();
}

uint64_t sub_1BA4376B4()
{
  return MEMORY[0x1E0D5A918]();
}

uint64_t sub_1BA4376C0()
{
  return MEMORY[0x1E0D5A990]();
}

uint64_t sub_1BA4376CC()
{
  return MEMORY[0x1E0D5A9C8]();
}

uint64_t sub_1BA4376D8()
{
  return MEMORY[0x1E0D5A9D8]();
}

uint64_t sub_1BA4376E4()
{
  return MEMORY[0x1E0D5A9E8]();
}

uint64_t sub_1BA4376F0()
{
  return MEMORY[0x1E0D5A9F0]();
}

uint64_t sub_1BA4376FC()
{
  return MEMORY[0x1E0D5AA20]();
}

uint64_t sub_1BA437708()
{
  return MEMORY[0x1E0D5AA28]();
}

uint64_t sub_1BA437714()
{
  return MEMORY[0x1E0D5AA30]();
}

uint64_t sub_1BA437720()
{
  return MEMORY[0x1E0D5AD30]();
}

uint64_t sub_1BA43772C()
{
  return MEMORY[0x1E0D5AD38]();
}

uint64_t sub_1BA437738()
{
  return MEMORY[0x1E0D5AEC0]();
}

uint64_t sub_1BA437744()
{
  return MEMORY[0x1E0D5AEF0]();
}

uint64_t sub_1BA437750()
{
  return MEMORY[0x1E0D5AF00]();
}

uint64_t sub_1BA43775C()
{
  return MEMORY[0x1E0D5B5D0]();
}

uint64_t sub_1BA437768()
{
  return MEMORY[0x1E0D5B5D8]();
}

uint64_t sub_1BA437774()
{
  return MEMORY[0x1E0D5B608]();
}

uint64_t sub_1BA437780()
{
  return MEMORY[0x1E0D5BB00]();
}

uint64_t sub_1BA43778C()
{
  return MEMORY[0x1E0D5BB08]();
}

uint64_t sub_1BA437798()
{
  return MEMORY[0x1E0D5BCC8]();
}

uint64_t sub_1BA4377A4()
{
  return MEMORY[0x1E0D5BDA8]();
}

uint64_t sub_1BA4377B0()
{
  return MEMORY[0x1E0D5BDB0]();
}

uint64_t sub_1BA4377BC()
{
  return MEMORY[0x1E0D5BDB8]();
}

uint64_t sub_1BA4377C8()
{
  return MEMORY[0x1E0D5BDC0]();
}

uint64_t sub_1BA4377D4()
{
  return MEMORY[0x1E0D5BDC8]();
}

uint64_t sub_1BA4377E0()
{
  return MEMORY[0x1E0D5BDD8]();
}

uint64_t sub_1BA4377EC()
{
  return MEMORY[0x1E0D5BDE0]();
}

uint64_t sub_1BA4377F8()
{
  return MEMORY[0x1E0D5BDE8]();
}

uint64_t sub_1BA437804()
{
  return MEMORY[0x1E0D5BDF0]();
}

uint64_t sub_1BA437810()
{
  return MEMORY[0x1E0D5BDF8]();
}

uint64_t sub_1BA43781C()
{
  return MEMORY[0x1E0D5BE10]();
}

uint64_t sub_1BA437828()
{
  return MEMORY[0x1E0D5BE18]();
}

uint64_t sub_1BA437834()
{
  return MEMORY[0x1E0D5BE20]();
}

uint64_t sub_1BA437840()
{
  return MEMORY[0x1E0D5BE28]();
}

uint64_t sub_1BA43784C()
{
  return MEMORY[0x1E0D5BE30]();
}

uint64_t sub_1BA437858()
{
  return MEMORY[0x1E0D5C0B8]();
}

uint64_t sub_1BA437864()
{
  return MEMORY[0x1E0D5C0D8]();
}

uint64_t sub_1BA437870()
{
  return MEMORY[0x1E0D5C5A8]();
}

uint64_t sub_1BA43787C()
{
  return MEMORY[0x1E0D5C5B8]();
}

uint64_t sub_1BA437888()
{
  return MEMORY[0x1E0D5C5C0]();
}

uint64_t sub_1BA437894()
{
  return MEMORY[0x1E0D5C688]();
}

uint64_t sub_1BA4378A0()
{
  return MEMORY[0x1E0D5C698]();
}

uint64_t sub_1BA4378AC()
{
  return MEMORY[0x1E0D5CB38]();
}

uint64_t sub_1BA4378B8()
{
  return MEMORY[0x1E0D5CB78]();
}

uint64_t sub_1BA4378C4()
{
  return MEMORY[0x1E0D5CB80]();
}

uint64_t sub_1BA4378D0()
{
  return MEMORY[0x1E0D5CD18]();
}

uint64_t sub_1BA4378DC()
{
  return MEMORY[0x1E0D5CE48]();
}

uint64_t sub_1BA4378E8()
{
  return MEMORY[0x1E0D5CED0]();
}

uint64_t sub_1BA4378F4()
{
  return MEMORY[0x1E0D5CEE0]();
}

uint64_t sub_1BA437900()
{
  return MEMORY[0x1E0D5D228]();
}

uint64_t sub_1BA43790C()
{
  return MEMORY[0x1E0D5D2A0]();
}

uint64_t sub_1BA437918()
{
  return MEMORY[0x1E0D5D838]();
}

uint64_t sub_1BA437924()
{
  return MEMORY[0x1E0D5D8A0]();
}

uint64_t sub_1BA437930()
{
  return MEMORY[0x1E0D5D8B0]();
}

uint64_t sub_1BA43793C()
{
  return MEMORY[0x1E0D5D8C8]();
}

uint64_t sub_1BA437948()
{
  return MEMORY[0x1E0D5D8D8]();
}

uint64_t sub_1BA437954()
{
  return MEMORY[0x1E0D5D8E0]();
}

uint64_t sub_1BA437960()
{
  return MEMORY[0x1E0D5D908]();
}

uint64_t sub_1BA43796C()
{
  return MEMORY[0x1E0D5DEE8]();
}

uint64_t sub_1BA437978()
{
  return MEMORY[0x1E0D5DEF0]();
}

uint64_t sub_1BA437984()
{
  return MEMORY[0x1E0D5DF20]();
}

uint64_t sub_1BA437990()
{
  return MEMORY[0x1E0D5DF28]();
}

uint64_t sub_1BA43799C()
{
  return MEMORY[0x1E0D5DF30]();
}

uint64_t sub_1BA4379A8()
{
  return MEMORY[0x1E0D5DF38]();
}

uint64_t sub_1BA4379B4()
{
  return MEMORY[0x1E0D5DF40]();
}

uint64_t sub_1BA4379C0()
{
  return MEMORY[0x1E0D5DF58]();
}

uint64_t sub_1BA4379CC()
{
  return MEMORY[0x1E0D5DF60]();
}

uint64_t sub_1BA4379D8()
{
  return MEMORY[0x1E0D5E000]();
}

uint64_t sub_1BA4379E4()
{
  return MEMORY[0x1E0D5E008]();
}

uint64_t sub_1BA4379F0()
{
  return MEMORY[0x1E0D5E218]();
}

uint64_t sub_1BA4379FC()
{
  return MEMORY[0x1E0D5E228]();
}

uint64_t sub_1BA437A08()
{
  return MEMORY[0x1E0D5E238]();
}

uint64_t sub_1BA437A14()
{
  return MEMORY[0x1E0D5E630]();
}

uint64_t sub_1BA437A20()
{
  return MEMORY[0x1E0D5E720]();
}

uint64_t sub_1BA437A2C()
{
  return MEMORY[0x1E0D5E820]();
}

uint64_t sub_1BA437A38()
{
  return MEMORY[0x1E0D5E830]();
}

uint64_t sub_1BA437A44()
{
  return MEMORY[0x1E0D5E880]();
}

uint64_t sub_1BA437A50()
{
  return MEMORY[0x1E0D5EB08]();
}

uint64_t sub_1BA437A5C()
{
  return MEMORY[0x1E0D5EB10]();
}

uint64_t sub_1BA437A68()
{
  return MEMORY[0x1E0D5EB18]();
}

uint64_t sub_1BA437A74()
{
  return MEMORY[0x1E0D5EB20]();
}

uint64_t sub_1BA437A80()
{
  return MEMORY[0x1E0D5EB38]();
}

uint64_t sub_1BA437A8C()
{
  return MEMORY[0x1E0D5EB40]();
}

uint64_t sub_1BA437A98()
{
  return MEMORY[0x1E0D5ED90]();
}

uint64_t sub_1BA437AA4()
{
  return MEMORY[0x1E0D5EDA0]();
}

uint64_t sub_1BA437AB0()
{
  return MEMORY[0x1E0D5EDC0]();
}

uint64_t sub_1BA437ABC()
{
  return MEMORY[0x1E0D5F0D8]();
}

uint64_t sub_1BA437AC8()
{
  return MEMORY[0x1E0D5F6E8]();
}

uint64_t sub_1BA437AD4()
{
  return MEMORY[0x1E0D5F6F0]();
}

uint64_t sub_1BA437AE0()
{
  return MEMORY[0x1E0D5F6F8]();
}

uint64_t sub_1BA437AEC()
{
  return MEMORY[0x1E0D5F788]();
}

uint64_t sub_1BA437AF8()
{
  return MEMORY[0x1E0D5F7D8]();
}

uint64_t sub_1BA437B04()
{
  return MEMORY[0x1E0D5F9C8]();
}

uint64_t sub_1BA437B10()
{
  return MEMORY[0x1E0D5F9D0]();
}

uint64_t sub_1BA437B1C()
{
  return MEMORY[0x1E0D5F9D8]();
}

uint64_t sub_1BA437B28()
{
  return MEMORY[0x1E0D5FAF0]();
}

uint64_t sub_1BA437B34()
{
  return MEMORY[0x1E0D5FAF8]();
}

uint64_t sub_1BA437B40()
{
  return MEMORY[0x1E0D5FB00]();
}

uint64_t sub_1BA437B4C()
{
  return MEMORY[0x1E0D5FCF0]();
}

uint64_t sub_1BA437B58()
{
  return MEMORY[0x1E0D601C0]();
}

uint64_t sub_1BA437B64()
{
  return MEMORY[0x1E0D601E0]();
}

uint64_t sub_1BA437B70()
{
  return MEMORY[0x1E0D60380]();
}

uint64_t sub_1BA437B7C()
{
  return MEMORY[0x1E0D60530]();
}

uint64_t sub_1BA437B88()
{
  return MEMORY[0x1E0D60538]();
}

uint64_t sub_1BA437B94()
{
  return MEMORY[0x1E0D60540]();
}

uint64_t sub_1BA437BA0()
{
  return MEMORY[0x1E0D60548]();
}

uint64_t sub_1BA437BAC()
{
  return MEMORY[0x1E0D60550]();
}

uint64_t sub_1BA437BB8()
{
  return MEMORY[0x1E0D60558]();
}

uint64_t sub_1BA437BC4()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1BA437BD0()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1BA437BDC()
{
  return MEMORY[0x1E0DB5110]();
}

uint64_t sub_1BA437BE8()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1BA437BF4()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1BA437C00()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1BA437C0C()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1BA437C18()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1BA437C24()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1BA437C30()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1BA437C3C()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1BA437C48()
{
  return MEMORY[0x1E0CB1988]();
}

uint64_t sub_1BA437C54()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1BA437C60()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1BA437C6C()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1BA437C78()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1BA437C84()
{
  return MEMORY[0x1E0DEA610]();
}

uint64_t sub_1BA437C90()
{
  return MEMORY[0x1E0DB5180]();
}

uint64_t sub_1BA437C9C()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1BA437CA8()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_1BA437CB4()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1BA437CC0()
{
  return MEMORY[0x1E0DBCA38]();
}

uint64_t sub_1BA437CCC()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1BA437CD8()
{
  return MEMORY[0x1E0DEA7D0]();
}

uint64_t sub_1BA437CE4()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1BA437CF0()
{
  return MEMORY[0x1E0DEA840]();
}

uint64_t sub_1BA437CFC()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1BA437D08()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_1BA437D14()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1BA437D20()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_1BA437D2C()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_1BA437D38()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1BA437D44()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_1BA437D50()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1BA437D5C()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1BA437D68()
{
  return MEMORY[0x1E0DB5960]();
}

uint64_t sub_1BA437D74()
{
  return MEMORY[0x1E0DB5968]();
}

uint64_t sub_1BA437D80()
{
  return MEMORY[0x1E0DB5970]();
}

uint64_t sub_1BA437D8C()
{
  return MEMORY[0x1E0DEACA0]();
}

uint64_t sub_1BA437D98()
{
  return MEMORY[0x1E0DEACB8]();
}

uint64_t sub_1BA437DA4()
{
  return MEMORY[0x1E0DEAD18]();
}

uint64_t sub_1BA437DB0()
{
  return MEMORY[0x1E0DEAD30]();
}

uint64_t sub_1BA437DBC()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1BA437DC8()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1BA437DD4()
{
  return MEMORY[0x1E0CB1AE0]();
}

uint64_t sub_1BA437DE0()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1BA437DEC()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1BA437DF8()
{
  return MEMORY[0x1E0DB51F8]();
}

uint64_t sub_1BA437E04()
{
  return MEMORY[0x1E0DB5200]();
}

uint64_t sub_1BA437E10()
{
  return MEMORY[0x1E0DB5218]();
}

uint64_t sub_1BA437E1C()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1BA437E28()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1BA437E34()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1BA437E40()
{
  return MEMORY[0x1E0DBCA88]();
}

uint64_t sub_1BA437E4C()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1BA437E58()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1BA437E64()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1BA437E70()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1BA437E7C()
{
  return MEMORY[0x1E0DEB388]();
}

uint64_t sub_1BA437E88()
{
  return MEMORY[0x1E0CB1C00]();
}

uint64_t sub_1BA437E94()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1BA437EA0()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_1BA437EAC()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_1BA437EB8()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1BA437EC4()
{
  return MEMORY[0x1E0DBCAD0]();
}

uint64_t sub_1BA437ED0()
{
  return MEMORY[0x1E0DBCAD8]();
}

uint64_t sub_1BA437EDC()
{
  return MEMORY[0x1E0DBCAE0]();
}

uint64_t sub_1BA437EE8()
{
  return MEMORY[0x1E0DBCAE8]();
}

uint64_t sub_1BA437EF4()
{
  return MEMORY[0x1E0DBCAF0]();
}

uint64_t sub_1BA437F00()
{
  return MEMORY[0x1E0D60890]();
}

uint64_t sub_1BA437F0C()
{
  return MEMORY[0x1E0DBCB50]();
}

uint64_t sub_1BA437F18()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1BA437F24()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1BA437F30()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1BA437F3C()
{
  return MEMORY[0x1E0DBCC18]();
}

uint64_t sub_1BA437F48()
{
  return MEMORY[0x1E0DB5368]();
}

uint64_t sub_1BA437F54()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1BA437F60()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1BA437F6C()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1BA437F78()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1BA437F84()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1BA437F90()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t sub_1BA437F9C()
{
  return MEMORY[0x1E0D60988]();
}

uint64_t sub_1BA437FA8()
{
  return MEMORY[0x1E0DBCC70]();
}

uint64_t sub_1BA437FB4()
{
  return MEMORY[0x1E0DBCC80]();
}

uint64_t sub_1BA437FC0()
{
  return MEMORY[0x1E0DC2D40]();
}

uint64_t sub_1BA437FCC()
{
  return MEMORY[0x1E0DBCD00]();
}

uint64_t sub_1BA437FD8()
{
  return MEMORY[0x1E0DB6540]();
}

uint64_t sub_1BA437FE4()
{
  return MEMORY[0x1E0DBCD68]();
}

uint64_t sub_1BA437FF0()
{
  return MEMORY[0x1E0DBCD78]();
}

uint64_t sub_1BA437FFC()
{
  return MEMORY[0x1E0DBCDE0]();
}

uint64_t sub_1BA438008()
{
  return MEMORY[0x1E0DC2FC0]();
}

uint64_t sub_1BA438014()
{
  return MEMORY[0x1E0D60A78]();
}

uint64_t sub_1BA438020()
{
  return MEMORY[0x1E0DBCE78]();
}

uint64_t sub_1BA43802C()
{
  return MEMORY[0x1E0DBCEE8]();
}

uint64_t sub_1BA438038()
{
  return MEMORY[0x1E0CB20E0]();
}

uint64_t sub_1BA438044()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1BA438050()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1BA43805C()
{
  return MEMORY[0x1E0DEFCF0]();
}

uint64_t sub_1BA438068()
{
  return MEMORY[0x1E0CB23A0]();
}

uint64_t sub_1BA438074()
{
  return MEMORY[0x1E0CB23A8]();
}

uint64_t sub_1BA438080()
{
  return MEMORY[0x1E0DF22B8]();
}

uint64_t sub_1BA43808C()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1BA438098()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1BA4380A4()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1BA4380B0()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1BA4380BC()
{
  return MEMORY[0x1E0CB2480]();
}

uint64_t sub_1BA4380C8()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1BA4380D4()
{
  return MEMORY[0x1E0CB24B0]();
}

uint64_t sub_1BA4380E0()
{
  return MEMORY[0x1E0CB24B8]();
}

uint64_t sub_1BA4380EC()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1BA4380F8()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1BA438104()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1BA438110()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1BA43811C()
{
  return MEMORY[0x1E0DEC0A8]();
}

uint64_t sub_1BA438128()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1BA438134()
{
  return MEMORY[0x1E0DEC0C8]();
}

uint64_t sub_1BA438140()
{
  return MEMORY[0x1E0DEC0D0]();
}

uint64_t sub_1BA43814C()
{
  return MEMORY[0x1E0DEC0D8]();
}

uint64_t sub_1BA438158()
{
  return MEMORY[0x1E0DEC100]();
}

uint64_t sub_1BA438164()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1BA438170()
{
  return MEMORY[0x1E0DEC120]();
}

uint64_t sub_1BA43817C()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1BA438188()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1BA438194()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1BA4381A0()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1BA4381AC()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1BA4381B8()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1BA4381C4()
{
  return MEMORY[0x1E0DEC268]();
}

uint64_t sub_1BA4381D0()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1BA4381DC()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1BA4381E8()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1BA4381F4()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1BA438200()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1BA43820C()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1BA438218()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1BA438224()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1BA438230()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1BA43823C()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1BA438248()
{
  return MEMORY[0x1E0DECBA8]();
}

uint64_t sub_1BA438254()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1BA438260()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1BA43826C()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1BA438278()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1BA438284()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1BA438290()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1BA43829C()
{
  return MEMORY[0x1E0DECD58]();
}

uint64_t sub_1BA4382A8()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1BA4382B4()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1BA4382C0()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1BA4382CC()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_1BA4382D8()
{
  return MEMORY[0x1E0DECF60]();
}

uint64_t sub_1BA4382E4()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1BA4382F0()
{
  return MEMORY[0x1E0DECFA0]();
}

uint64_t sub_1BA4382FC()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1BA438308()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1BA438314()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_1BA438320()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1BA43832C()
{
  return MEMORY[0x1E0DED008]();
}

uint64_t sub_1BA438338()
{
  return MEMORY[0x1E0DED048]();
}

uint64_t sub_1BA438344()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_1BA438350()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1BA43835C()
{
  return MEMORY[0x1E0DED0D0]();
}

uint64_t sub_1BA438368()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1BA438374()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1BA438380()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1BA43838C()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1BA438398()
{
  return MEMORY[0x1E0DED138]();
}

uint64_t sub_1BA4383A4()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1BA4383B0()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1BA4383BC()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1BA4383C8()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1BA4383D4()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1BA4383E0()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1BA4383EC()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1BA4383F8()
{
  return MEMORY[0x1E0CB2628]();
}

uint64_t sub_1BA438404()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t sub_1BA438410()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1BA43841C()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1BA438428()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1BA438434()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1BA438440()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1BA43844C()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1BA438458()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1BA438464()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1BA438470()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1BA43847C()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1BA438488()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1BA438494()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1BA4384A0()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t AMSError()
{
  return MEMORY[0x1E0CFD800]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF0](retstr, t, angle);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t NFInternalBuild()
{
  return MEMORY[0x1E0D60AB0]();
}

uint64_t NFStoreDemoMode()
{
  return MEMORY[0x1E0D60AC0]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

uint64_t NewsCoreUserDefaults()
{
  return MEMORY[0x1E0D588F0]();
}

uint64_t TSAccessibilitySpeakAndDoNotBeInterrupted()
{
  return MEMORY[0x1E0DBCF68]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1E0DEEBB0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x1E0DEEC58]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC60]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x1E0DEED00]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1E0DEED10]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1E0DEED18]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1E0DEED28]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x1E0DEEEF8]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x1E0DEEF00]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x1E0DEEF08]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

