@implementation URLBagContract

- (id)guidRegexes
{
  return sub_19CFD8880((char *)self, (uint64_t)a2, 0x6C72752D64697567, 0xEF78656765722F73, (SEL *)&selRef_arrayForKey_);
}

- (id)guidSchemes
{
  return sub_19CFD8880((char *)self, (uint64_t)a2, 0xD000000000000011, 0x800000019D07AE50, (SEL *)&selRef_arrayForKey_);
}

- (id)storefrontSuffix
{
  return sub_19CFD8880((char *)self, (uint64_t)a2, 0xD000000000000018, 0x800000019D07AE70, (SEL *)&selRef_stringForKey_);
}

- (id)trustedDomains
{
  return sub_19CFD8880((char *)self, (uint64_t)a2, 0x4464657473757274, 0xEE00736E69616D6FLL, (SEL *)&selRef_arrayForKey_);
}

- (AMSMescalBagContract)mescalContract
{
  return (AMSMescalBagContract *)(id)swift_unknownObjectRetain();
}

- (id)TLSSamplingPercentage
{
  return sub_19CFD8880((char *)self, (uint64_t)a2, 0xD000000000000015, 0x800000019D07AE90, (SEL *)&selRef_doubleForKey_);
}

- (id)TLSSamplingSessionDuration
{
  return sub_19CFD8880((char *)self, (uint64_t)a2, 0xD00000000000001ALL, 0x800000019D07AEB0, (SEL *)&selRef_integerForKey_);
}

- (id)TFOSamplingPercentage
{
  return sub_19CFD8880((char *)self, (uint64_t)a2, 0xD000000000000015, 0x800000019D07AED0, (SEL *)&selRef_doubleForKey_);
}

- (id)TFOSamplingSessionDuration
{
  return sub_19CFD8880((char *)self, (uint64_t)a2, 0xD00000000000001ALL, 0x800000019D07AEF0, (SEL *)&selRef_integerForKey_);
}

- (id)apsEnabledPatterns
{
  return sub_19CFD8880((char *)self, (uint64_t)a2, 0xD000000000000014, 0x800000019D07AF10, (SEL *)&selRef_arrayForKey_);
}

- (id)apsSamplingPercent
{
  return sub_19CFD8880((char *)self, (uint64_t)a2, 0xD000000000000017, 0x800000019D07AF30, (SEL *)&selRef_integerForKey_);
}

- (id)metricsURL
{
  return sub_19CFD8880((char *)self, (uint64_t)a2, 0xD000000000000012, 0x800000019D07AF50, (SEL *)&selRef_URLForKey_);
}

- (id)metricsDictionary
{
  return sub_19CFD8880((char *)self, (uint64_t)a2, 0x7363697274656DLL, 0xE700000000000000, (SEL *)&selRef_dictionaryForKey_);
}

- (_TtC9JetEngine14URLBagContract)init
{
  _TtC9JetEngine14URLBagContract *result;

  result = (_TtC9JetEngine14URLBagContract *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
