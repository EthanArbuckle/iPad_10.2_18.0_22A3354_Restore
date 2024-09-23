@implementation FMPFView

- (void)renderer:(id)a3 updateAtTime:(double)a4
{
  char *v6;
  uint64_t v7;
  uint64_t ObjectType;

  v6 = (char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate;
  if (MEMORY[0x23B85DBF0]((char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate, a2))
  {
    v7 = *((_QWORD *)v6 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(id, uint64_t, uint64_t, double))(v7 + 56))(a3, ObjectType, v7, a4);
    swift_unknownObjectRelease();
  }
}

- (void)renderer:(id)a3 willRenderScene:(id)a4 atTime:(double)a5
{
  char *v8;
  uint64_t v9;
  uint64_t ObjectType;

  v8 = (char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate;
  if (MEMORY[0x23B85DBF0]((char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate, a2))
  {
    v9 = *((_QWORD *)v8 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(id, id, uint64_t, uint64_t, double))(v9 + 48))(a3, a4, ObjectType, v9, a5);
    swift_unknownObjectRelease();
  }
}

- (void)renderer:(id)a3 didRenderScene:(id)a4 atTime:(double)a5
{
  char *v8;
  uint64_t v9;
  uint64_t ObjectType;

  v8 = (char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate;
  if (MEMORY[0x23B85DBF0]((char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate, a2))
  {
    v9 = *((_QWORD *)v8 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(id, id, uint64_t, uint64_t, double))(v9 + 64))(a3, a4, ObjectType, v9, a5);
    swift_unknownObjectRelease();
  }
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6;
  id v7;
  _TtC11FMFindingUI8FMPFView *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A9B37F0((uint64_t)v6, v7);

}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  char *v7;
  uint64_t v8;
  uint64_t ObjectType;
  void (*v10)(id, id, uint64_t, uint64_t);
  id v11;
  id v12;
  _TtC11FMFindingUI8FMPFView *v13;

  v7 = (char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate;
  if (MEMORY[0x23B85DBF0]((char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate, a2))
  {
    v8 = *((_QWORD *)v7 + 1);
    ObjectType = swift_getObjectType();
    v10 = *(void (**)(id, id, uint64_t, uint64_t))(v8 + 16);
    v11 = a3;
    v12 = a4;
    v13 = self;
    v10(v11, v12, ObjectType, v8);

    swift_unknownObjectRelease();
  }
}

- (void)renderer:(id)a3 didAddNode:(id)a4 forAnchor:(id)a5
{
  char *v8;
  uint64_t v9;
  uint64_t ObjectType;

  v8 = (char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate;
  if (MEMORY[0x23B85DBF0]((char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate, a2))
  {
    v9 = *((_QWORD *)v8 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(id, id, id, uint64_t, uint64_t))(v9 + 24))(a3, a4, a5, ObjectType, v9);
    swift_unknownObjectRelease();
  }
}

- (void)renderer:(id)a3 didUpdateNode:(id)a4 forAnchor:(id)a5
{
  char *v8;
  uint64_t v9;
  uint64_t ObjectType;

  v8 = (char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate;
  if (MEMORY[0x23B85DBF0]((char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate, a2))
  {
    v9 = *((_QWORD *)v8 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(id, id, id, uint64_t, uint64_t))(v9 + 32))(a3, a4, a5, ObjectType, v9);
    swift_unknownObjectRelease();
  }
}

- (void)renderer:(id)a3 didRemoveNode:(id)a4 forAnchor:(id)a5
{
  char *v8;
  uint64_t v9;
  uint64_t ObjectType;

  v8 = (char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate;
  if (MEMORY[0x23B85DBF0]((char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate, a2))
  {
    v9 = *((_QWORD *)v8 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(id, id, id, uint64_t, uint64_t))(v9 + 40))(a3, a4, a5, ObjectType, v9);
    swift_unknownObjectRelease();
  }
}

- (_TtC11FMFindingUI8FMPFView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23A9FF454();
}

- (NSString)description
{
  _TtC11FMFindingUI8FMPFView *v2;
  void *v3;

  v2 = self;
  sub_23A9A19A0();

  v3 = (void *)sub_23AA32FB4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)dealloc
{
  _TtC11FMFindingUI8FMPFView *v2;

  v2 = self;
  sub_23A9FD258();
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  _BYTE v5[184];

  sub_23A96C1B8((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_config, (uint64_t)v5, &qword_2569D8080);
  sub_23A9FF888((uint64_t)v5, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_23A9FF8F4);

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI8FMPFView_backdropRGBAColorSprings);
  v4 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC11FMFindingUI8FMPFView_backdropRGBAColorSprings);
  objc_release(*(id *)((char *)&self->super.super.__layeringSceneIdentity
                     + OBJC_IVAR____TtC11FMFindingUI8FMPFView_backdropRGBAColorSprings));

  swift_release();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  sub_23A972074((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate);
}

- (void)thermalStateDidChangeWithNotification:(id)a3
{
  id v4;
  _TtC11FMFindingUI8FMPFView *v5;

  v4 = a3;
  v5 = self;
  sub_23A9FE794(v4);

}

- (_TtC11FMFindingUI8FMPFView)initWithFrame:(CGRect)a3
{
  _TtC11FMFindingUI8FMPFView *result;

  result = (_TtC11FMFindingUI8FMPFView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
