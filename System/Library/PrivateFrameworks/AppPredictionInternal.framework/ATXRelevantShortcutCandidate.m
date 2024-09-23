@implementation ATXRelevantShortcutCandidate

- (CHSWidgetDescriptor)widgetDescriptor
{
  return (CHSWidgetDescriptor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR___ATXRelevantShortcutCandidate_widgetDescriptor));
}

- (NSString)donationBundleIdentifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1C9E45CE8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (INIntent)intent
{
  return (INIntent *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___ATXRelevantShortcutCandidate_intent));
}

- (NSArray)relevantContexts
{
  void *v2;

  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED84EB98);
  v2 = (void *)sub_1C9E45D78();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (ATXRelevantShortcutCandidate)initWithWidgetDescriptor:(id)a3 donationBundleIdentifier:(id)a4 intent:(id)a5 relevantContexts:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  uint64_t *v13;
  id v14;
  id v15;
  objc_super v17;

  v9 = sub_1C9E45CF4();
  v11 = v10;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED84EB98);
  v12 = (objc_class *)sub_1C9E45D84();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ATXRelevantShortcutCandidate_widgetDescriptor) = (Class)a3;
  v13 = (uint64_t *)((char *)self + OBJC_IVAR___ATXRelevantShortcutCandidate_donationBundleIdentifier);
  *v13 = v9;
  v13[1] = v11;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ATXRelevantShortcutCandidate_intent) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ATXRelevantShortcutCandidate_relevantContexts) = v12;
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for RelevantShortcutCandidate();
  v14 = a3;
  v15 = a5;
  return -[ATXRelevantShortcutCandidate init](&v17, sel_init);
}

- (ATXRelevantShortcutCandidate)init
{
  ATXRelevantShortcutCandidate *result;

  result = (ATXRelevantShortcutCandidate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
