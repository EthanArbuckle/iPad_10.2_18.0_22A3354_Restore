@implementation MOSecureWindow

- (_TtC16MomentsUIService14MOSecureWindow)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  objc_class *v10;
  id v11;
  id v12;
  _TtC16MomentsUIService14MOSecureWindow *result;
  uint64_t v14;
  id v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<MOAngelControllerWrapper>);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (char *)self + OBJC_IVAR____TtC16MomentsUIService14MOSecureWindow__controller;
  v10 = (objc_class *)type metadata accessor for MOAngelControllerWrapper(0);
  v11 = objc_allocWithZone(v10);
  v12 = a3;
  v15 = objc_msgSend(v11, "init");
  Published.init(initialValue:)(&v15, v10);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v8, v5);

  result = (_TtC16MomentsUIService14MOSecureWindow *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "MomentsUIService/MOSecureWindow.swift", 37, 2, 41, 0);
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService14MOSecureWindow)initWithWindowScene:(id)a3
{
  id v3;
  _TtC16MomentsUIService14MOSecureWindow *result;

  v3 = a3;
  result = (_TtC16MomentsUIService14MOSecureWindow *)_swift_stdlib_reportUnimplementedInitializer("MomentsUIService.MOSecureWindow", 31, "init(windowScene:)", 18, 0);
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService14MOSecureWindow)initWithFrame:(CGRect)a3
{
  @objc MOSecureWindow.init(frame:)((uint64_t)self, (uint64_t)a2, (uint64_t)"init(frame:)", 12);
}

- (_TtC16MomentsUIService14MOSecureWindow)initWithContentRect:(CGRect)a3
{
  @objc MOSecureWindow.init(frame:)((uint64_t)self, (uint64_t)a2, (uint64_t)"init(contentRect:)", 18);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC16MomentsUIService14MOSecureWindow__controller;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<MOAngelControllerWrapper>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  outlined destroy of UUID?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService14MOSecureWindow_clientConnectionId);
}

@end
