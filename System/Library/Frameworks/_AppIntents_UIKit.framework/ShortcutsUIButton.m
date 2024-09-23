@implementation ShortcutsUIButton

- (_TtC17_AppIntents_UIKit17ShortcutsUIButton)initWithCoder:(id)a3
{
  sub_2217B9850(a3);
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC17_AppIntents_UIKit17ShortcutsUIButton *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = ShortcutsUIButton.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  _TtC17_AppIntents_UIKit17ShortcutsUIButton *v8;
  _TtC17_AppIntents_UIKit17ShortcutsUIButton *v9;
  _OWORD v10[2];

  if (a3)
  {
    v8 = self;
    swift_unknownObjectRetain();
    sub_2217CB9FC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v9 = self;
  }
  ShortcutsUIButton.addTarget(_:action:for:)((uint64_t)v10, (uint64_t)a4, a5);

  sub_2217B9EB8((uint64_t)v10);
}

- (_TtC17_AppIntents_UIKit17ShortcutsUIButton)initWithFrame:(CGRect)a3
{
  ShortcutsUIButton.init(frame:)();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_style;
  v4 = OUTLINED_FUNCTION_1_1();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_hostingView));
  sub_2217B9BE0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_buttonTapHandler));
}

@end
