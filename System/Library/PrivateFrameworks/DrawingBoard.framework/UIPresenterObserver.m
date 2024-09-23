@implementation UIPresenterObserver

- (void)scenePresenter:(id)a3 hostingWillChange:(BOOL)a4
{
  _TtC12DrawingBoard19UIPresenterObserver *v6;
  _QWORD v7[3];
  BOOL v8;

  sub_23A70D510();
  v7[2] = self;
  v8 = a4;
  swift_unknownObjectRetain();
  v6 = self;
  sub_23A704CCC((void (*)(void))sub_23A6E43C4, (uint64_t)v7);
  swift_unknownObjectRelease();

}

- (_TtC12DrawingBoard19UIPresenterObserver)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__isHosting) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver__presenter) = 0;
  sub_23A70D030();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[UIPresenterObserver init](&v5, sel_init);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC12DrawingBoard19UIPresenterObserver___observationRegistrar;
  v4 = sub_23A70D03C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
