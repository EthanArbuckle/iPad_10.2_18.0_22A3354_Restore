@implementation HoverTextService

+ (_TtC17HoverTextServices16HoverTextService)sharedInstance
{
  if (qword_1ED52A950 != -1)
    swift_once();
  return (_TtC17HoverTextServices16HoverTextService *)(id)static HoverTextService.sharedInstance;
}

- (_TtC17HoverTextServices16HoverTextService)init
{
  objc_class *ObjectType;
  objc_class *v4;
  id v5;
  _TtC17HoverTextServices16HoverTextService *v6;
  id v7;
  _QWORD *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (objc_class *)type metadata accessor for HoverTextServiceAXUIService();
  v5 = objc_allocWithZone(v4);
  v6 = self;
  v7 = objc_msgSend(v5, sel_init);
  v8 = (Class *)((char *)&v6->super.isa + OBJC_IVAR____TtC17HoverTextServices16HoverTextService_serviceImpl);
  v8[3] = v4;
  v8[4] = &off_1E81F0A28;
  *v8 = v7;

  v10.receiver = v6;
  v10.super_class = ObjectType;
  return -[HoverTextService init](&v10, sel_init);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC17HoverTextServices16HoverTextService_serviceImpl);
}

- (BOOL)startHoverTextAndReturnError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  _TtC17HoverTextServices16HoverTextService *v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  sub_1C88FF830((uint64_t)self + OBJC_IVAR____TtC17HoverTextServices16HoverTextService_serviceImpl, (uint64_t)v9);
  v4 = v10;
  v5 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v7 = self;
  v6(v4, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return 1;
}

- (BOOL)stopHoverTextAndReturnError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  _TtC17HoverTextServices16HoverTextService *v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  sub_1C88FF830((uint64_t)self + OBJC_IVAR____TtC17HoverTextServices16HoverTextService_serviceImpl, (uint64_t)v9);
  v4 = v10;
  v5 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = self;
  v6(v4, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return 1;
}

- (void)showAlert:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);
  _TtC17HoverTextServices16HoverTextService *v10;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  v4 = sub_1C88FFEF4();
  v6 = v5;
  sub_1C88FF830((uint64_t)self + OBJC_IVAR____TtC17HoverTextServices16HoverTextService_serviceImpl, (uint64_t)v11);
  v7 = v12;
  v8 = v13;
  __swift_project_boxed_opaque_existential_1(v11, v12);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 24);
  v10 = self;
  v9(v4, v6, v7, v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);

  swift_bridgeObjectRelease();
}

- (BOOL)startHoverTextTypingAndReturnError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  _TtC17HoverTextServices16HoverTextService *v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  sub_1C88FF830((uint64_t)self + OBJC_IVAR____TtC17HoverTextServices16HoverTextService_serviceImpl, (uint64_t)v9);
  v4 = v10;
  v5 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 32);
  v7 = self;
  v6(v4, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return 1;
}

- (BOOL)stopHoverTextTypingAndReturnError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  _TtC17HoverTextServices16HoverTextService *v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  sub_1C88FF830((uint64_t)self + OBJC_IVAR____TtC17HoverTextServices16HoverTextService_serviceImpl, (uint64_t)v9);
  v4 = v10;
  v5 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 40);
  v7 = self;
  v6(v4, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return 1;
}

@end
