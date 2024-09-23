@implementation IconTextView

- (_TtC28HealthExposureNotificationUI12IconTextView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC28HealthExposureNotificationUI12IconTextView *result;

  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC28HealthExposureNotificationUI12IconTextView_delegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = OBJC_IVAR____TtC28HealthExposureNotificationUI12IconTextView_textStack;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD978]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = OBJC_IVAR____TtC28HealthExposureNotificationUI12IconTextView_iconView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_init);

  result = (_TtC28HealthExposureNotificationUI12IconTextView *)sub_21CD768EC();
  __break(1u);
  return result;
}

- (void)didTapText:(id)a3
{
  id v5;
  _TtC28HealthExposureNotificationUI12IconTextView *v6;

  if (MEMORY[0x22078BF0C]((char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI12IconTextView_delegate, a2))
  {
    v5 = a3;
    v6 = self;
    sub_21CD232B4();

    swift_unknownObjectRelease();
  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC28HealthExposureNotificationUI12IconTextView_textStack), sel_frame);
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (UIColor)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[IconTextView tintColor](&v3, sel_tintColor);
}

- (void)setTintColor:(id)a3
{
  objc_class *ObjectType;
  id v6;
  _TtC28HealthExposureNotificationUI12IconTextView *v7;
  void *v8;
  UIColor *v9;
  objc_super v10;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v11.receiver = self;
  v11.super_class = ObjectType;
  v6 = a3;
  v7 = self;
  -[IconTextView setTintColor:](&v11, sel_setTintColor_, v6);
  v8 = *(Class *)((char *)&v7->super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI12IconTextView_iconView);
  v10.receiver = v7;
  v10.super_class = ObjectType;
  v9 = -[IconTextView tintColor](&v10, sel_tintColor);
  objc_msgSend(v8, sel_setTintColor_, v9);

}

- (_TtC28HealthExposureNotificationUI12IconTextView)initWithFrame:(CGRect)a3
{
  sub_21CD2145C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI12IconTextView_icon));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21CD0CA24((uint64_t)self + OBJC_IVAR____TtC28HealthExposureNotificationUI12IconTextView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI12IconTextView_textStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI12IconTextView_iconView));
}

@end
