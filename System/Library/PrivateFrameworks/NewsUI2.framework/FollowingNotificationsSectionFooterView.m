@implementation FollowingNotificationsSectionFooterView

- (_TtC7NewsUI239FollowingNotificationsSectionFooterView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  id v10;
  _TtC7NewsUI239FollowingNotificationsSectionFooterView *v11;
  _TtC7NewsUI239FollowingNotificationsSectionFooterView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = OBJC_IVAR____TtC7NewsUI239FollowingNotificationsSectionFooterView_textLabel;
  v10 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_init);

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = -[FollowingNotificationsSectionFooterView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  -[FollowingNotificationsSectionFooterView addSubview:](v12, sel_addSubview_, *(Class *)((char *)&v12->super.super.super.isa+ OBJC_IVAR____TtC7NewsUI239FollowingNotificationsSectionFooterView_textLabel));
  return v12;
}

- (_TtC7NewsUI239FollowingNotificationsSectionFooterView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC7NewsUI239FollowingNotificationsSectionFooterView *result;

  v5 = OBJC_IVAR____TtC7NewsUI239FollowingNotificationsSectionFooterView_textLabel;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC7NewsUI239FollowingNotificationsSectionFooterView *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI239FollowingNotificationsSectionFooterView_textLabel));
}

@end
