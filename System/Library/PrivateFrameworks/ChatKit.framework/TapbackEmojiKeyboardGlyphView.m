@implementation TapbackEmojiKeyboardGlyphView

- (double)attributionScaleFactor
{
  return 1.0;
}

- (UIEdgeInsets)platterEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *(double *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_platterEdgeInsets);
  v3 = *(double *)((char *)&self->super.super.super._responderFlags
                 + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_platterEdgeInsets);
  v4 = *(double *)((char *)&self->super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_platterEdgeInsets);
  v5 = *(double *)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_platterEdgeInsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)isSelected
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_isSelected;
  swift_beginAccess();
  return *v2;
}

- (void)setIsSelected:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_isSelected;
  swift_beginAccess();
  *v4 = a3;
}

- (CKTapbackViewDelegate)delegate
{
  swift_beginAccess();
  return (CKTapbackViewDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (_TtC7ChatKit29TapbackEmojiKeyboardGlyphView)init
{
  _TtC7ChatKit29TapbackEmojiKeyboardGlyphView *result;

  TapbackEmojiKeyboardGlyphView.init()();
  return result;
}

- (_TtC7ChatKit29TapbackEmojiKeyboardGlyphView)initWithCoder:(id)a3
{
  _OWORD *v4;
  __int128 v5;
  id v6;
  _TtC7ChatKit29TapbackEmojiKeyboardGlyphView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_attributionScaleFactor) = (Class)0x3FF0000000000000;
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_platterEdgeInsets);
  v5 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
  *v4 = *MEMORY[0x1E0CEB4B0];
  v4[1] = v5;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_isSelected) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_delegate) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_horizontalOffset) = (Class)0x4010000000000000;
  v6 = a3;

  result = (_TtC7ChatKit29TapbackEmojiKeyboardGlyphView *)sub_18E769320();
  __break(1u);
  return result;
}

- (_TtC7ChatKit29TapbackEmojiKeyboardGlyphView)initWithFrame:(CGRect)a3
{
  _TtC7ChatKit29TapbackEmojiKeyboardGlyphView *result;

  result = (_TtC7ChatKit29TapbackEmojiKeyboardGlyphView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit29TapbackEmojiKeyboardGlyphView_contentView));
}

- (void)interfaceStyleChanged
{
  _TtC7ChatKit29TapbackEmojiKeyboardGlyphView *v2;

  v2 = self;
  sub_18E67B41C();

}

@end
