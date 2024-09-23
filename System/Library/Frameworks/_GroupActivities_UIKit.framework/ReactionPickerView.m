@implementation ReactionPickerView

- (_TtC22_GroupActivities_UIKit18ReactionPickerView)init
{
  return (_TtC22_GroupActivities_UIKit18ReactionPickerView *)ReactionPickerView.init()();
}

- (_TtC22_GroupActivities_UIKit18ReactionPickerView)initWithCoder:(id)a3
{
  return -[ReactionPickerView init](self, sel_init, a3);
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ReactionPickerView();
  -[ReactionPickerView willMoveToWindow:](&v4, sel_willMoveToWindow_, a3);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22_GroupActivities_UIKit18ReactionPickerView_emojiButton), sel_intrinsicContentSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22_GroupActivities_UIKit18ReactionPickerView_emojiButton), sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  _TtC22_GroupActivities_UIKit18ReactionPickerView *v7;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22_GroupActivities_UIKit18ReactionPickerView_emojiButton);
  v7 = self;
  -[ReactionPickerView bounds](v7, sel_bounds);
  objc_msgSend(v2, sel_sizeThatFits_, v3, v4);
  objc_msgSend(v2, sel_setFrame_, 0.0, 0.0, v5, v6);

}

- (void)presentReactionPicker
{
  _TtC22_GroupActivities_UIKit18ReactionPickerView *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[ReactionPickerView window](v2, sel_window);
  if (v3)
  {
    v4 = v3;
    (*(void (**)(_TtC22_GroupActivities_UIKit18ReactionPickerView *))((*MEMORY[0x24BEE4EA0] & (uint64_t)v2->super.super.super.isa)
                                                                               + 0x120))(v2);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC22_GroupActivities_UIKit18ReactionPickerView)initWithFrame:(CGRect)a3
{
  _TtC22_GroupActivities_UIKit18ReactionPickerView *result;

  result = (_TtC22_GroupActivities_UIKit18ReactionPickerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22_GroupActivities_UIKit18ReactionPickerView_emojiButton));
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC22_GroupActivities_UIKit18ReactionPickerView__selectedReaction;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<String?>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
}

@end
