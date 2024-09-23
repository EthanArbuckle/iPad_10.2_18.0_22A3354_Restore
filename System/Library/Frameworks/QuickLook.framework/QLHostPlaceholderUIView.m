@implementation QLHostPlaceholderUIView

- (_TtC9QuickLook23QLHostPlaceholderUIView)initWithFrame:(CGRect)a3
{
  return (_TtC9QuickLook23QLHostPlaceholderUIView *)sub_20D57B7CC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9QuickLook23QLHostPlaceholderUIView)initWithCoder:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  id v7;
  _TtC9QuickLook23QLHostPlaceholderUIView *result;

  v5 = OBJC_IVAR____TtC9QuickLook23QLHostPlaceholderUIView_hostingState;
  type metadata accessor for HostingState();
  v6 = (objc_class *)swift_allocObject();
  *((_BYTE *)v6 + 16) = 0;
  v7 = a3;
  sub_20D5A66A8();
  *(Class *)((char *)&self->super.super.super.isa + v5) = v6;

  result = (_TtC9QuickLook23QLHostPlaceholderUIView *)sub_20D5A6E94();
  __break(1u);
  return result;
}

- (void)hostViewControllerDidActivate:(id)a3
{
  id v5;
  _TtC9QuickLook23QLHostPlaceholderUIView *v6;

  swift_getKeyPath();
  sub_20D57C038();
  v5 = a3;
  v6 = self;
  swift_retain();
  sub_20D5A6678();

  swift_release();
  swift_release();
}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  id v6;
  _TtC9QuickLook23QLHostPlaceholderUIView *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_20D57BF30();

}

- (void).cxx_destruct
{
  swift_release();
}

@end
