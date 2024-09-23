@implementation SRCarPlaySnippetPlatterView

- (_TtC4Siri27SRCarPlaySnippetPlatterView)initWithCoder:(id)a3
{
  id v4;
  _TtC4Siri27SRCarPlaySnippetPlatterView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_coloredPlatterView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_materialPlatterView) = 0;
  v4 = a3;

  result = (_TtC4Siri27SRCarPlaySnippetPlatterView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000E1170, "Siri/SRCarPlaySnippetPlatterView.swift", 38, 2, 23, 0);
  __break(1u);
  return result;
}

- (_TtC4Siri27SRCarPlaySnippetPlatterView)initWithFrame:(CGRect)a3
{
  return (_TtC4Siri27SRCarPlaySnippetPlatterView *)sub_1000939E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_coloredPlatterView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_materialPlatterView));
}

@end
