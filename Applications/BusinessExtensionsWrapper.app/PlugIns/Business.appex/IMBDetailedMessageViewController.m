@implementation IMBDetailedMessageViewController

- (_TtC8Business32IMBDetailedMessageViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC8Business32IMBDetailedMessageViewController *result;

  *(_QWORD *)&self->conversation[OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController__dismissalDelegate] = 0;
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC8Business32IMBDetailedMessageViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000B3DA0, "Business/IMBDetailedMessageViewController.swift", 47, 2, 41, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for IMBDetailedMessageViewController();
  v2 = v6.receiver;
  -[IMBDetailedMessageViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = objc_msgSend(v2, "view", v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(UIColor), "tertiarySystemBackgroundColor");
    objc_msgSend(v4, "setBackgroundColor:", v5);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC8Business32IMBDetailedMessageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Business32IMBDetailedMessageViewController *result;

  v4 = a4;
  result = (_TtC8Business32IMBDetailedMessageViewController *)_swift_stdlib_reportUnimplementedInitializer("Business.IMBDetailedMessageViewController", 41, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_conversation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_message));
  sub_100010C40((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_urlHelper));
  sub_100011A64((uint64_t)self + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController__dismissalDelegate);
}

@end
