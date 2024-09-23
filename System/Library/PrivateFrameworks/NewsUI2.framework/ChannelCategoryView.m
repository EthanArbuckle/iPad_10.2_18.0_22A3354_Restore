@implementation ChannelCategoryView

- (_TtC7NewsUI219ChannelCategoryView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI219ChannelCategoryView *)sub_1D65248E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI219ChannelCategoryView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D6524D34();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI219ChannelCategoryView_backgroundView));

}

- (NSString)accessibilityLabel
{
  void *v2;
  _TtC7NewsUI219ChannelCategoryView *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI219ChannelCategoryView_nameLabel);
  v3 = self;
  v4 = objc_msgSend(v2, sel_text);
  if (v4)
  {
    v5 = v4;
    sub_1D6E26978();

    v6 = (void *)sub_1D6E26948();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return (NSString *)v6;
}

@end
