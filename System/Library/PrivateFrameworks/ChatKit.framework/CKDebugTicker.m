@implementation CKDebugTicker

- (_TtC7ChatKit13CKDebugTicker)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit13CKDebugTicker_window) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit13CKDebugTicker_parentWindow) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit13CKDebugTicker__tickCounter) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit13CKDebugTicker_displayLink) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKDebugTicker();
  return -[CKDebugTicker init](&v3, sel_init);
}

+ (_TtC7ChatKit13CKDebugTicker)sharedTicker
{
  if (qword_1EE0FBD68 != -1)
    swift_once();
  return (_TtC7ChatKit13CKDebugTicker *)(id)qword_1EE0FBD58;
}

- (unint64_t)tickCounter
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit13CKDebugTicker__tickCounter) >> 1;
}

- (void)tick
{
  _TtC7ChatKit13CKDebugTicker *v2;

  v2 = self;
  sub_18E754398();

}

- (void)installUIWithWindowScene:(id)a3 parentWindow:(id)a4
{
  id v6;
  id v7;
  _TtC7ChatKit13CKDebugTicker *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_18E75457C((uint64_t)v6, v7);

}

- (void).cxx_destruct
{

}

@end
