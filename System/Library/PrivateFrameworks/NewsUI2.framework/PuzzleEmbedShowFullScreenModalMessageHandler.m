@implementation PuzzleEmbedShowFullScreenModalMessageHandler

- (_TtC7NewsUI244PuzzleEmbedShowFullScreenModalMessageHandler)init
{
  objc_super v4;

  *(_QWORD *)&self->delegate[OBJC_IVAR____TtC7NewsUI244PuzzleEmbedShowFullScreenModalMessageHandler_delegate] = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PuzzleEmbedShowFullScreenModalMessageHandler();
  return -[PuzzleEmbedShowFullScreenModalMessageHandler init](&v4, sel_init);
}

- (void).cxx_destruct
{
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI244PuzzleEmbedShowFullScreenModalMessageHandler_delegate);
}

- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4
{
  _TtC7NewsUI244PuzzleEmbedShowFullScreenModalMessageHandler *v6;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = self;
  sub_1D6C9BE3C(a3);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

@end
