@implementation PaletteBackgroundView

- (void)didMoveToWindow
{
  _TtC8AppStore21PaletteBackgroundView *v2;

  v2 = self;
  sub_100202738((SEL *)&selRef_didMoveToWindow);

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  _TtC8AppStore21PaletteBackgroundView *v2;

  v2 = self;
  sub_100202738((SEL *)&selRef__dynamicUserInterfaceTraitDidChange);

}

- (_TtC8AppStore21PaletteBackgroundView)initWithEffect:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore21PaletteBackgroundView_blurEffectOverride) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PaletteBackgroundView();
  return -[PaletteBackgroundView initWithEffect:](&v5, "initWithEffect:", a3);
}

- (_TtC8AppStore21PaletteBackgroundView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore21PaletteBackgroundView_blurEffectOverride) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PaletteBackgroundView();
  return -[PaletteBackgroundView initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21PaletteBackgroundView_blurEffectOverride));
}

@end
