@implementation MNNavTrayGuidanceEvent

- (MNNavTrayGuidanceEvent)initWithGuidanceEvent:(id)a3
{
  id v3;
  objc_super v5;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MNNavTrayGuidanceEvent__guidanceEvent) = (Class)a3;
  v5.receiver = self;
  v5.super_class = (Class)MNNavTrayGuidanceEvent;
  v3 = a3;
  return -[MNNavTrayGuidanceEvent init](&v5, sel_init);
}

- (GEOComposedString)title
{
  return (GEOComposedString *)objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___MNNavTrayGuidanceEvent__guidanceEvent), sel_navTrayTitleString);
}

- (GEOComposedString)detail
{
  return (GEOComposedString *)objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___MNNavTrayGuidanceEvent__guidanceEvent), sel_navTrayDetailString);
}

- (NSString)description
{
  MNNavTrayGuidanceEvent *v2;
  void *v3;

  v2 = self;
  MNNavTrayGuidanceEvent.description.getter();

  v3 = (void *)sub_1B0BCAA14();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  MNNavTrayGuidanceEvent *v6;
  id v7;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___MNNavTrayGuidanceEvent__guidanceEvent);
  v5 = a3;
  v6 = self;
  v7 = (id)sub_1B0BCAA14();
  objc_msgSend(v5, sel_encodeObject_forKey_, v4, v7);

}

- (MNNavTrayGuidanceEvent)initWithCoder:(id)a3
{
  id v5;
  MNNavTrayGuidanceEvent *v6;
  MNNavTrayGuidanceEvent *v7;
  objc_super v9;

  sub_1B0ADE380(0, (unint64_t *)&unk_1EEEC8C38);
  v5 = a3;
  v6 = self;
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR___MNNavTrayGuidanceEvent__guidanceEvent) = (Class)sub_1B0BCAA8C();

  v9.receiver = v6;
  v9.super_class = (Class)MNNavTrayGuidanceEvent;
  v7 = -[MNNavTrayGuidanceEvent init](&v9, sel_init);

  return v7;
}

- (MNNavTrayGuidanceEvent)init
{
  MNNavTrayGuidanceEvent *result;

  result = (MNNavTrayGuidanceEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
