@implementation PeopleViewHandler

- (void)dismissSearchViewWithReason:(unint64_t)a3
{
  _TtC17PeopleViewService17PeopleViewHandler *v4;

  v4 = self;
  sub_100011810((void *)a3);

}

- (_TtC17PeopleViewService17PeopleViewHandler)init
{
  _TtC17PeopleViewService17PeopleViewHandler *result;

  result = (_TtC17PeopleViewService17PeopleViewHandler *)_swift_stdlib_reportUnimplementedInitializer("PeopleViewService.PeopleViewHandler", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->hostWindow[OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_contactIdentifier]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_displayPriorities));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_contactFetcher));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_spotlightContactViewController));
}

@end
