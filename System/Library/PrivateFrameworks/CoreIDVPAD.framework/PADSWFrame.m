@implementation PADSWFrame

- (void)dealloc
{
  void *v3;
  _TtC10CoreIDVPAD10PADSWFrame *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  if (qword_254D27968 != -1)
    swift_once();
  objc_msgSend(v5, sel_postNotificationName_object_, qword_254D286D8, 0);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for PADSWFrame();
  -[PADSWFrame dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

- (_TtC10CoreIDVPAD10PADSWFrame)init
{
  _TtC10CoreIDVPAD10PADSWFrame *result;

  result = (_TtC10CoreIDVPAD10PADSWFrame *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
