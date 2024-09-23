@implementation NudityDetectionPreferencesHelper

+ (void)initializeNudityDetection
{
  if (qword_2542CB858 != -1)
    swift_once();
  swift_beginAccess();
}

+ (id)classForNudityAppDetectionSettings
{
  return (id)sub_238386880();
}

+ (BOOL)nudityDetectionRowEnabled
{
  return sub_238385B48();
}

+ (id)nudityDetectionRowIconID
{
  return (id)sub_238386880();
}

+ (id)nudityDetectionRowLabel
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  if (qword_2542CBCE0 != -1)
    swift_once();
  swift_beginAccess();
  v2 = (id)qword_2542CB6A0;
  v3 = (void *)sub_238386880();
  v4 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, 0, 0);

  sub_2383868A4();
  v5 = (void *)sub_238386880();
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)nudityDetectionOnOffLabel
{
  return sub_2383857E0((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_238385C44);
}

+ (id)mainNudityDetectionFooterText
{
  return sub_2383857E0((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_238385E3C);
}

+ (BOOL)nudityDetectionAvailableForBundleID:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = sub_2383868A4();
  v5 = v4;
  if (qword_2542CB858 != -1)
    swift_once();
  swift_beginAccess();
  swift_retain();
  v6 = sub_23837DF1C(v3, v5);
  swift_bridgeObjectRelease();
  swift_release();
  return v6 & 1;
}

+ (id)nudityDetectionOnOffLabelForBundleID:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = sub_2383868A4();
  sub_238386158(v3, v4);
  swift_bridgeObjectRelease();
  v5 = (void *)sub_238386880();
  swift_bridgeObjectRelease();
  return v5;
}

+ (BOOL)nudityDetectionFeatureEnabled
{
  char v2;
  _BYTE v4[24];
  ValueMetadata *v5;
  unint64_t v6;

  v5 = &_s5FlagsON;
  v6 = sub_238385B04();
  v2 = sub_238386544();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return v2 & 1;
}

- (NudityDetectionPreferencesHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NudityDetectionPreferencesHelper;
  return -[NudityDetectionPreferencesHelper init](&v3, sel_init);
}

@end
