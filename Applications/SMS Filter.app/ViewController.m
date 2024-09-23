@implementation ViewController

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for ViewController();
  -[ViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ViewController();
  v4 = v7.receiver;
  -[ViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
  v6 = swift_allocObject(v5, 64, 7);
  *(_OWORD *)(v6 + 16) = xmmword_100005DB0;
  *(_QWORD *)(v6 + 56) = &type metadata for String;
  strcpy((char *)(v6 + 32), "VIEW APPEARED");
  *(_WORD *)(v6 + 46) = -4864;
  print(_:separator:terminator:)(v6, 32);

  swift_bridgeObjectRelease(v6);
}

- (void)goToSettings:(id)a3
{
  _TtC10SMS_Filter14ViewController *v5;
  _QWORD v6[4];

  swift_unknownObjectRetain(a3, a2);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v6, a3);
  swift_unknownObjectRelease(a3);
  specialized ViewController.goToSettings(_:)();

  __swift_destroy_boxed_opaque_existential_0(v6);
}

- (_TtC10SMS_Filter14ViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC10SMS_Filter14ViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for ViewController();
  v11 = -[ViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC10SMS_Filter14ViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ViewController();
  return -[ViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
