@implementation AppearanceModeProvider

- (_TtC5Setup22AppearanceModeProvider)initWithDisplayZoomExecutor:(id)a3
{
  uint64_t v5;
  id v6;
  objc_class *v7;
  _TtC5Setup22AppearanceModeProvider *v8;
  objc_class *v9;
  _TtC5Setup22AppearanceModeProvider *v10;
  objc_super v12;

  v5 = OBJC_IVAR____TtC5Setup22AppearanceModeProvider_homeScreenService;
  v6 = objc_allocWithZone((Class)SBSHomeScreenService);
  v7 = (objc_class *)a3;
  v8 = self;
  *(Class *)((char *)&self->super.isa + v5) = (Class)objc_msgSend(v6, "init");
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC5Setup22AppearanceModeProvider_displayZoomExecutor) = v7;
  v9 = v7;

  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for AppearanceModeProvider();
  v10 = -[AppearanceModeProvider init](&v12, "init");

  return v10;
}

- (_TtC5Setup22AppearanceModeProvider)init
{
  _TtC5Setup22AppearanceModeProvider *result;

  result = (_TtC5Setup22AppearanceModeProvider *)_swift_stdlib_reportUnimplementedInitializer("Setup.AppearanceModeProvider", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
