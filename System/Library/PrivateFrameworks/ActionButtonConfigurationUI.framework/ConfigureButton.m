@implementation ConfigureButton

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ConfigureButton();
  v2 = v3.receiver;
  -[ConfigureButton layoutSubviews](&v3, sel_layoutSubviews);
  sub_235E423F4();
  sub_235E42ACC();

}

- (_TtC27ActionButtonConfigurationUI15ConfigureButton)initWithFrame:(CGRect)a3
{
  return (_TtC27ActionButtonConfigurationUI15ConfigureButton *)sub_235E432B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC27ActionButtonConfigurationUI15ConfigureButton)initWithCoder:(id)a3
{
  return (_TtC27ActionButtonConfigurationUI15ConfigureButton *)sub_235E43458(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_chevronView));
  swift_bridgeObjectRelease();
}

@end
