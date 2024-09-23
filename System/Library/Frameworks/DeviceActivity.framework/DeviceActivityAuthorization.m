@implementation DeviceActivityAuthorization

+ (BOOL)isAuthorized:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = sub_1C0660FAC();
  v5 = _s14DeviceActivity0aB13AuthorizationC12isAuthorizedySbSSFZ_0(v3, v4);
  swift_bridgeObjectRelease();
  return v5 & 1;
}

+ (BOOL)isAuthorized
{
  return _s14DeviceActivity0aB13AuthorizationC12isAuthorizedSbvgZ_0();
}

+ (NSArray)authorizedClientIdentifiers
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;

  if (qword_1EDBEEDE0 != -1)
    swift_once();
  v2 = objc_msgSend((id)qword_1EDBEEDD8, sel_deviceActivity);
  v3 = objc_msgSend(v2, sel_allowedClients);

  if (v3)
  {
    sub_1C05F2664();
    sub_1C05F26A0();
    v4 = sub_1C06610CC();

    sub_1C05F1468(v4);
    swift_bridgeObjectRelease();
  }
  v5 = (void *)sub_1C0661030();
  swift_bridgeObjectRelease();
  return (NSArray *)v5;
}

+ (BOOL)sharingEnabled
{
  id v2;
  id v3;
  unsigned __int8 v4;

  if (qword_1EDBEEDE0 != -1)
    swift_once();
  v2 = objc_msgSend((id)qword_1EDBEEDD8, sel_deviceActivity);
  v3 = objc_msgSend(v2, sel_shareAcrossDevices);

  if (!v3)
    return 1;
  v4 = objc_msgSend(v3, sel_BOOLValue);

  return v4;
}

+ (BOOL)isOverridden
{
  int v2;
  id v3;
  void *v4;
  unsigned __int8 v5;

  v2 = os_variant_allows_internal_security_policies();
  if (v2)
  {
    v3 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
    v4 = (void *)sub_1C0660F88();
    v5 = objc_msgSend(v3, sel_BOOLForKey_, v4);

    LOBYTE(v2) = v5;
  }
  return v2;
}

+ (void)setIsOverridden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;

  v3 = a3;
  if (os_variant_allows_internal_security_policies())
  {
    v4 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
    v5 = (id)sub_1C0660F88();
    objc_msgSend(v4, sel_setBool_forKey_, v3, v5);

  }
}

- (_TtC14DeviceActivity27DeviceActivityAuthorization)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DeviceActivityAuthorization();
  return -[DeviceActivityAuthorization init](&v3, sel_init);
}

@end
