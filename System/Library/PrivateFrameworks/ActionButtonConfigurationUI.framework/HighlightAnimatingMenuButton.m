@implementation HighlightAnimatingMenuButton

- (void)setNeedsLayout
{
  _TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton *v2;

  v2 = self;
  sub_235E38FC8();

}

- (_TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  uint64_t v9;
  _OWORD *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_isAnimating) = 0;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_hasPendingLayout) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousState) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousConfiguration;
  v9 = sub_235E613E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = (_OWORD *)((char *)self
                 + OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousBounds);
  *v10 = 0u;
  v10[1] = 0u;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_commitTracker) = 0;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for HighlightAnimatingMenuButton();
  return -[MenuButton initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
}

- (_TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton)initWithCoder:(id)a3
{
  return (_TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton *)sub_235E3995C(a3);
}

- (void).cxx_destruct
{
  sub_235E37A5C((uint64_t)self + OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousConfiguration);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_commitTracker));
}

@end
