@implementation MNNavigationServiceCallback_DidUpdateNavTrayGuidance

- (MNNavTrayGuidanceEvent)navTrayGuidanceEvent
{
  return (MNNavTrayGuidanceEvent *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                           + OBJC_IVAR____TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance_navTrayGuidanceEvent));
}

- (_TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance)initWithNavTrayGuidanceEvent:(id)a3
{
  id v4;
  objc_super v6;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance_navTrayGuidanceEvent) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MNNavigationServiceCallback_DidUpdateNavTrayGuidance();
  v4 = a3;
  return -[MNNavigationServiceCallback_DidUpdateNavTrayGuidance init](&v6, sel_init);
}

- (unint64_t)type
{
  return 8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance)initWithCoder:(id)a3
{
  id v5;
  _TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance *v6;
  _TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance *v7;
  objc_super v9;

  type metadata accessor for MNNavTrayGuidanceEvent(0);
  v5 = a3;
  v6 = self;
  *(Class *)((char *)&v6->super.super.isa
           + OBJC_IVAR____TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance_navTrayGuidanceEvent) = (Class)sub_1B0BCAA8C();

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for MNNavigationServiceCallback_DidUpdateNavTrayGuidance();
  v7 = -[MNNavigationServiceCallbackParameters initWithCoder:](&v9, sel_initWithCoder_, v5);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MNNavigationServiceCallback_DidUpdateNavTrayGuidance();
  v4 = a3;
  v5 = (char *)v8.receiver;
  -[MNNavigationServiceCallbackParameters encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  v6 = *(_QWORD *)&v5[OBJC_IVAR____TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance_navTrayGuidanceEvent];
  v7 = (void *)sub_1B0BCAA14();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7, v8.receiver, v8.super_class);

}

- (_TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance)init
{
  _TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance *result;

  result = (_TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance_navTrayGuidanceEvent));
}

@end
