@implementation SVSLPCActivityIndicatorViewController

- (void)viewDidLoad
{
  _TtC14HDSViewService37SVSLPCActivityIndicatorViewController *v2;

  v2 = self;
  SVSLPCActivityIndicatorViewController.viewDidLoad()();

}

- (void)spin
{
  _TtC14HDSViewService37SVSLPCActivityIndicatorViewController *v2;

  v2 = self;
  sub_10007815C();

}

- (void)complete
{
  _TtC14HDSViewService37SVSLPCActivityIndicatorViewController *v2;

  v2 = self;
  sub_100078388();

}

- (void)reset
{
  _TtC14HDSViewService37SVSLPCActivityIndicatorViewController *v2;

  v2 = self;
  sub_10007805C();

}

- (_TtC14HDSViewService37SVSLPCActivityIndicatorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC14HDSViewService37SVSLPCActivityIndicatorViewController *v10;
  id v11;
  NSString v12;
  _TtC14HDSViewService37SVSLPCActivityIndicatorViewController *v13;
  objc_super v15;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = OBJC_IVAR____TtC14HDSViewService37SVSLPCActivityIndicatorViewController_v;
  v9 = objc_allocWithZone((Class)type metadata accessor for SVSLEDPasscodeActivityIndicatorView());
  v10 = self;
  v11 = a4;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(v9, "init");

  if (v7)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v12 = 0;
  }
  v15.receiver = v10;
  v15.super_class = (Class)type metadata accessor for SVSLPCActivityIndicatorViewController();
  v13 = -[SVSLPCActivityIndicatorViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", v12, v11);

  return v13;
}

- (_TtC14HDSViewService37SVSLPCActivityIndicatorViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC14HDSViewService37SVSLPCActivityIndicatorViewController *v8;
  _TtC14HDSViewService37SVSLPCActivityIndicatorViewController *v9;
  objc_super v11;

  v5 = OBJC_IVAR____TtC14HDSViewService37SVSLPCActivityIndicatorViewController_v;
  v6 = objc_allocWithZone((Class)type metadata accessor for SVSLEDPasscodeActivityIndicatorView());
  v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for SVSLPCActivityIndicatorViewController();
  v9 = -[SVSLPCActivityIndicatorViewController initWithCoder:](&v11, "initWithCoder:", v7);

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService37SVSLPCActivityIndicatorViewController_v));
}

@end
