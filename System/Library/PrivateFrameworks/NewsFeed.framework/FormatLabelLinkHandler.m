@implementation FormatLabelLinkHandler

- (_TtC8NewsFeed22FormatLabelLinkHandler)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed22FormatLabelLinkHandler_tapGestureRecognizer) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed22FormatLabelLinkHandler_link) = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed22FormatLabelLinkHandler_linkBlock);
  *v4 = 0;
  v4[1] = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[FormatLabelLinkHandler init](&v6, sel_init);
}

- (void)didTap:(id)a3
{
  id v4;
  _TtC8NewsFeed22FormatLabelLinkHandler *v5;

  v4 = a3;
  v5 = self;
  sub_1BB4330FC(v4);

}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_release();
  sub_1BA49EBE0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed22FormatLabelLinkHandler_linkBlock));
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC8NewsFeed22FormatLabelLinkHandler *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1BB433354(v4);

  return self & 1;
}

@end
