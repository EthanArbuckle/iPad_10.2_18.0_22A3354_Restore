@implementation ActionButton

- (_TtC21_MarketplaceKit_UIKit12ActionButton)initWithCoder:(id)a3
{
  id v4;
  _TtC21_MarketplaceKit_UIKit12ActionButton *v5;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v4 = a3;
  v5 = (_TtC21_MarketplaceKit_UIKit12ActionButton *)sub_2355DE778();
  swift_release();
  return v5;
}

- (BOOL)isHighlighted
{
  return sub_2355D79AC(self, (uint64_t)a2, 62, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  sub_2355D7AE4(self, (uint64_t)a2, a3, 65, (SEL *)&selRef_setHighlighted_);
}

- (BOOL)isEnabled
{
  return sub_2355D79AC(self, (uint64_t)a2, 72, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  sub_2355D7AE4(self, (uint64_t)a2, a3, 75, (SEL *)&selRef_setEnabled_);
}

- (UIColor)backgroundColor
{
  _TtC21_MarketplaceKit_UIKit12ActionButton *v3;
  id v4;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v3 = self;
  v4 = sub_2355D7CBC();
  swift_release();

  return (UIColor *)v4;
}

- (void)setBackgroundColor:(id)a3
{
  id v5;
  _TtC21_MarketplaceKit_UIKit12ActionButton *v6;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = a3;
  v6 = self;
  sub_2355D7E74(a3);
  swift_release();

}

- (UIColor)tintColor
{
  _TtC21_MarketplaceKit_UIKit12ActionButton *v3;
  UIColor *v4;
  objc_super v6;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v3 = self;
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for ActionButton(0);
  v4 = -[ActionButton tintColor](&v6, sel_tintColor);
  swift_release();

  swift_release();
  return v4;
}

- (void)setTintColor:(id)a3
{
  id v5;
  _TtC21_MarketplaceKit_UIKit12ActionButton *v6;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = a3;
  v6 = self;
  sub_2355D8284(a3);

  swift_release();
}

- (void)defaultAction:(id)a3 event:(id)a4
{
  id v7;
  id v8;
  _TtC21_MarketplaceKit_UIKit12ActionButton *v9;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_2355DE924(v8);

  swift_release();
}

- (_TtC21_MarketplaceKit_UIKit12ActionButton)initWithFrame:(CGRect)a3
{
  _TtC21_MarketplaceKit_UIKit12ActionButton *result;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  result = (_TtC21_MarketplaceKit_UIKit12ActionButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2355DFAE4((uint64_t)self + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_action, type metadata accessor for ActionButton.Action);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__backgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_contentDelegate));
}

@end
