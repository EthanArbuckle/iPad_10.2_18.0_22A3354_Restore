@implementation LACGlobalDomain

+ (NSData)companionAuthentication
{
  id v2;
  Class isa;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  isa = (Class)objc_msgSend(v2, sel_valueForFlagOnenessSessionAuthentication);

  if (isa)
  {
    v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = v5;

    isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data._Representation(v4, v6);
  }
  return (NSData *)isa;
}

+ (void)setCompanionAuthentication:(id)a3
{
  uint64_t v3;
  id v4;
  unint64_t v5;
  unint64_t v6;

  v3 = (uint64_t)a3;
  if (a3)
  {
    v4 = a3;
    v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = v5;

  }
  else
  {
    v6 = 0xF000000000000000;
  }
  specialized static LACGlobalDomain.companionAuthentication.setter(v3, v6);
}

+ (NSNumber)isCompanionSessionActive
{
  return (NSNumber *)@objc static LACGlobalDomain.isCompanionSessionActive.getter((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_valueForFlagOnenessSessionActive);
}

+ (void)setIsCompanionSessionActive:(id)a3
{
  id v4;

  v4 = a3;
  specialized static LACGlobalDomain.isCompanionSessionActive.setter(a3, (SEL *)&selRef_flagOnenessSessionActiveKey);
}

+ (BOOL)isCompanionDeviceMocked
{
  id v2;
  id v3;
  unsigned __int8 v4;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v3 = objc_msgSend(v2, sel_valueForFlagCompanionMockDevices);

  if (!v3)
    return 0;
  v4 = objc_msgSend(v3, sel_BOOLValue);

  return v4;
}

+ (void)setIsCompanionDeviceMocked:(BOOL)a3
{
  @objc static LACGlobalDomain.isCompanionDeviceMocked.setter((uint64_t)a1, (uint64_t)a2, a3, (SEL *)&selRef_flagCompanionMockDevicesKey);
}

+ (NSNumber)preboardMode
{
  return (NSNumber *)@objc static LACGlobalDomain.isCompanionSessionActive.getter((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_valueForFlagPreboardMode);
}

+ (void)setPreboardMode:(id)a3
{
  id v4;

  v4 = a3;
  specialized static LACGlobalDomain.isCompanionSessionActive.setter(a3, (SEL *)&selRef_flagPreboardModeKey);
}

+ (BOOL)isDTOStrictModeEnabled
{
  id v2;
  unsigned __int8 v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v3 = objc_msgSend(v2, sel_valueForFlagDTOStrictModeEnabled);

  return v3;
}

+ (void)setIsDTOStrictModeEnabled:(BOOL)a3
{
  @objc static LACGlobalDomain.isCompanionDeviceMocked.setter((uint64_t)a1, (uint64_t)a2, a3, (SEL *)&selRef_flagDTOStrictModeEnabledKey);
}

+ (NSNumber)isSharedModeActive
{
  return (NSNumber *)@objc static LACGlobalDomain.isCompanionSessionActive.getter((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_valueForFlagSharedModeActive);
}

+ (void)setIsSharedModeActive:(id)a3
{
  id v4;

  v4 = a3;
  specialized static LACGlobalDomain.isCompanionSessionActive.setter(a3, (SEL *)&selRef_flagSharedModeActiveKey);
}

+ (NSNumber)sharedModeLatency
{
  return (NSNumber *)@objc static LACGlobalDomain.isCompanionSessionActive.getter((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_valueForFlagSharedModeLatency);
}

+ (void)setSharedModeLatency:(id)a3
{
  id v4;

  v4 = a3;
  specialized static LACGlobalDomain.isCompanionSessionActive.setter(a3, (SEL *)&selRef_flagSharedModeLatencyKey);
}

+ (BOOL)osVariantAllowsDomainOverrides
{
  return os_variant_allows_internal_security_policies();
}

- (LACGlobalDomain)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LACGlobalDomain;
  return -[LACGlobalDomain init](&v3, sel_init);
}

@end
