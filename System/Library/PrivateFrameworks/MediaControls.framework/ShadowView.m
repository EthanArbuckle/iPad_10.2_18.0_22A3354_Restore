@implementation ShadowView

- (_TtC13MediaControls10ShadowView)initWithCoder:(id)a3
{
  _TtC13MediaControls10ShadowView *result;

  result = (_TtC13MediaControls10ShadowView *)sub_1AAABA7FC();
  __break(1u);
  return result;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC13MediaControls10ShadowView *v6;
  void *v7;
  _TtC13MediaControls10ShadowView *v8;
  unsigned int v9;
  BOOL result;
  char v11;
  objc_super v12;

  if (a3)
  {
    sub_1AAABA478();
    v5 = v4;
    v6 = self;
    v7 = (void *)sub_1AAABA460();
  }
  else
  {
    v8 = self;
    v7 = 0;
    v5 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for ShadowView();
  v9 = -[ShadowView _shouldAnimatePropertyWithKey:](&v12, sel__shouldAnimatePropertyWithKey_, v7);

  if (v9)
  {

    swift_bridgeObjectRelease();
    v11 = 1;
    return v11 & 1;
  }
  if (v5)
  {
    v11 = sub_1AAABA4E4();

    swift_bridgeObjectRelease();
    return v11 & 1;
  }
  __break(1u);
  return result;
}

- (_TtC13MediaControls10ShadowView)initWithFrame:(CGRect)a3
{
  _TtC13MediaControls10ShadowView *result;

  result = (_TtC13MediaControls10ShadowView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
