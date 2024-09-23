@implementation CHSWidgetExtensionProviderOptions

- (CHSControlDescriptorsPredicate)controlsPredicate
{
  return (CHSControlDescriptorsPredicate *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                   + OBJC_IVAR___CHSWidgetExtensionProviderOptions_controlsPredicate));
}

- (CHSWidgetDescriptorsPredicate)widgetsPredicate
{
  return (CHSWidgetDescriptorsPredicate *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                  + OBJC_IVAR___CHSWidgetExtensionProviderOptions_widgetsPredicate));
}

- (BOOL)includeIntents
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___CHSWidgetExtensionProviderOptions_includeIntents);
}

+ (CHSWidgetExtensionProviderOptions)widgets
{
  id v2;
  id v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_visible);
  v3 = objc_msgSend(objc_allocWithZone((Class)CHSWidgetExtensionProviderOptions), sel_initWithWidgetsPredicate_controlsPredicate_, v2, 0);

  return (CHSWidgetExtensionProviderOptions *)v3;
}

+ (CHSWidgetExtensionProviderOptions)visibleControls
{
  return (CHSWidgetExtensionProviderOptions *)sub_18FB91740((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_visible);
}

+ (CHSWidgetExtensionProviderOptions)allControls
{
  return (CHSWidgetExtensionProviderOptions *)sub_18FB91740((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_all);
}

- (CHSWidgetExtensionProviderOptions)initWithWidgetsPredicate:(id)a3 controlsPredicate:(id)a4
{
  return -[CHSWidgetExtensionProviderOptions initWithWidgetsPredicate:controlsPredicate:includeIntents:](self, sel_initWithWidgetsPredicate_controlsPredicate_includeIntents_, a3, a4, 1);
}

- (CHSWidgetExtensionProviderOptions)initWithWidgetsPredicate:(id)a3 controlsPredicate:(id)a4 includeIntents:(BOOL)a5
{
  id v6;
  id v7;
  objc_super v9;

  *((_BYTE *)&self->super.isa + OBJC_IVAR___CHSWidgetExtensionProviderOptions_includeIntents) = a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSWidgetExtensionProviderOptions_widgetsPredicate) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSWidgetExtensionProviderOptions_controlsPredicate) = (Class)a4;
  v9.receiver = self;
  v9.super_class = (Class)CHSWidgetExtensionProviderOptions;
  v6 = a3;
  v7 = a4;
  return -[CHSWidgetExtensionProviderOptions init](&v9, sel_init);
}

- (int64_t)hash
{
  CHSWidgetExtensionProviderOptions *v2;
  int64_t v3;

  v2 = self;
  v3 = CHSWidgetExtensionProviderOptions.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CHSWidgetExtensionProviderOptions *v4;
  CHSWidgetExtensionProviderOptions *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_18FBCD478();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = CHSWidgetExtensionProviderOptions.isEqual(_:)((uint64_t)v8);

  sub_18FB1F7C4((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  CHSWidgetExtensionProviderOptions *v2;
  void *v3;

  v2 = self;
  CHSWidgetExtensionProviderOptions.description.getter();

  v3 = (void *)sub_18FBCD0B8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (CHSWidgetExtensionProviderOptions)controls
{
  return (CHSWidgetExtensionProviderOptions *)sub_18FB91740((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_visible);
}

- (CHSWidgetExtensionProviderOptions)init
{
  CHSWidgetExtensionProviderOptions *result;

  result = (CHSWidgetExtensionProviderOptions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

- (BOOL)matchesEverything
{
  uint64_t v2;
  CHSWidgetExtensionProviderOptions *v3;
  id v4;
  unsigned __int8 v5;

  v2 = qword_1EE189358;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = (id)qword_1EE189350;
  v5 = sub_18FB926E4(v3, v4);

  return v5 & 1;
}

- (id)mergedWith:(id)a3
{
  CHSWidgetExtensionProviderOptions *v4;
  CHSWidgetExtensionProviderOptions *v5;
  CHSWidgetExtensionProviderOptions *v6;
  void *v7;
  void *v8;

  v4 = (CHSWidgetExtensionProviderOptions *)a3;
  v5 = self;
  CHSWidgetExtensionProviderOptions.merged(with:)(v6, v4);
  v8 = v7;

  return v8;
}

- (BOOL)matchesExtension:(id)a3
{
  CHSWidgetExtension *v4;
  CHSWidgetExtensionProviderOptions *v5;

  v4 = (CHSWidgetExtension *)a3;
  v5 = self;
  LOBYTE(self) = CHSWidgetExtensionProviderOptions.matches(extension:)(v4);

  return self & 1;
}

- (BOOL)matchesWidgetDescriptor:(id)a3
{
  id v4;
  CHSWidgetExtensionProviderOptions *v5;
  CHSWidgetDescriptorsPredicate *v6;

  v4 = a3;
  v5 = self;
  v6 = -[CHSWidgetExtensionProviderOptions widgetsPredicate](v5, sel_widgetsPredicate);

  if (v6)
  return v6 != 0;
}

- (BOOL)matchesControlDescriptor:(id)a3
{
  CHSControlDescriptor *v4;
  CHSWidgetExtensionProviderOptions *v5;

  v4 = (CHSControlDescriptor *)a3;
  v5 = self;
  LOBYTE(self) = CHSWidgetExtensionProviderOptions.matches(controlDescriptor:)(v4);

  return self & 1;
}

- (BOOL)isSubsetOf:(id)a3
{
  CHSWidgetExtensionProviderOptions *v4;
  CHSWidgetExtensionProviderOptions *v5;

  v4 = (CHSWidgetExtensionProviderOptions *)a3;
  v5 = self;
  LOBYTE(self) = CHSWidgetExtensionProviderOptions.isSubset(of:)(v4);

  return self & 1;
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EE18B718;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EE18B718 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CHSWidgetExtensionProviderOptions *v5;

  v4 = a3;
  v5 = self;
  CHSWidgetExtensionProviderOptions.encode(with:)((NSCoder)v4);

}

- (CHSWidgetExtensionProviderOptions)initWithCoder:(id)a3
{
  return (CHSWidgetExtensionProviderOptions *)CHSWidgetExtensionProviderOptions.init(coder:)(a3);
}

@end
