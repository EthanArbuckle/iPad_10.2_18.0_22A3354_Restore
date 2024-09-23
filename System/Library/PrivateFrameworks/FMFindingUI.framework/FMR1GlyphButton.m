@implementation FMR1GlyphButton

- (_TtC11FMFindingUI15FMR1GlyphButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23AA3097C();
}

- (void)dealloc
{
  _TtC11FMFindingUI15FMR1GlyphButton *v2;

  v2 = self;
  sub_23AA2E8F4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                     + OBJC_IVAR____TtC11FMFindingUI15FMR1GlyphButton_style));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI15FMR1GlyphButton_normalBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI15FMR1GlyphButton_ringDisplayLink));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI15FMR1GlyphButton_ringPerimiterAnimationSpring));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI15FMR1GlyphButton_ringFadeAnimationSpring));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_23AA2F390(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_23AA2F0C8);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_23AA2F390(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_23AA2F200);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_23AA2F390(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_23AA2F428);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_23AA2F390(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_23AA2F52C);
}

- (void)ringDisplayLinkUpdateWithDisplaylink:(id)a3
{
  id v4;
  _TtC11FMFindingUI15FMR1GlyphButton *v5;

  v4 = a3;
  v5 = self;
  sub_23AA2F700(v4);

}

- (void)drawRect:(CGRect)a3
{
  _TtC11FMFindingUI15FMR1GlyphButton *v3;

  v3 = self;
  sub_23AA30B14();

}

- (_TtC11FMFindingUI15FMR1GlyphButton)initWithFrame:(CGRect)a3
{
  _TtC11FMFindingUI15FMR1GlyphButton *result;

  result = (_TtC11FMFindingUI15FMR1GlyphButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
