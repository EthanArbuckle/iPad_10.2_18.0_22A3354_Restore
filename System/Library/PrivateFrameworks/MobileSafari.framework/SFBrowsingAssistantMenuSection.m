@implementation SFBrowsingAssistantMenuSection

+ (SFBrowsingAssistantMenuSection)favoritesSection
{
  return (SFBrowsingAssistantMenuSection *)objc_msgSend(objc_allocWithZone((Class)SFBrowsingAssistantMenuSection), sel_initWithIdentifier_, CFSTR("PageMenuSectionFavorites"));
}

+ (NSArray)moreMenuSections
{
  void *v2;

  sub_18B8F7D68();
  type metadata accessor for SFBrowsingAssistantMenuSection();
  v2 = (void *)sub_18BAC0F1C();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

+ (id)websiteSettingsSectionForDomain:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = sub_18BAC0DFC();
  v5 = sub_18B8F7E80(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

- (SFBrowsingAssistantMenuSection)initWithIdentifier:(id)a3
{
  id v3;
  SFBrowsingAssistantMenuSection *v4;

  v3 = a3;
  v4 = (SFBrowsingAssistantMenuSection *)sub_18B8F800C(v3);

  return v4;
}

- (NSString)identifier
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___SFBrowsingAssistantMenuSection_identifier));
}

- (void)setIdentifier:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFBrowsingAssistantMenuSection_identifier);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFBrowsingAssistantMenuSection_identifier) = (Class)a3;
  v3 = a3;

}

- (NSString)title
{
  void *v2;

  swift_beginAccess();
  sub_18BABFD34();
  v2 = (void *)sub_18BAC0DCC();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_18BAC0DFC();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___SFBrowsingAssistantMenuSection_title);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSArray)items
{
  return (NSArray *)sub_18B8F7A30((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___SFBrowsingAssistantMenuSection_items, &qword_1EDFF2830);
}

- (void)setItems:(id)a3
{
  sub_18B8F7B04((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &qword_1EDFF2830, &OBJC_IVAR___SFBrowsingAssistantMenuSection_items);
}

- (NSArray)settings
{
  return (NSArray *)sub_18B8F7A30((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___SFBrowsingAssistantMenuSection_settings, (uint64_t *)&unk_1EDFEA690);
}

- (void)setSettings:(id)a3
{
  sub_18B8F7B04((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t *)&unk_1EDFEA690, &OBJC_IVAR___SFBrowsingAssistantMenuSection_settings);
}

- (SFBrowsingAssistantMenuSection)init
{
  SFBrowsingAssistantMenuSection *result;

  result = (SFBrowsingAssistantMenuSection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
