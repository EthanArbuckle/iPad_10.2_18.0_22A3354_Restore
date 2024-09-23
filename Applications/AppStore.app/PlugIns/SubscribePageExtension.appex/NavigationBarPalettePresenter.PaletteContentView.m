@implementation NavigationBarPalettePresenter.PaletteContentView

- (void)layoutSubviews
{
  char *v2;
  void (*v3)(__n128);
  uint64_t v4;
  __n128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_s18PaletteContentViewCMa();
  v2 = (char *)v6.receiver;
  -[NavigationBarPalettePresenter.PaletteContentView layoutSubviews](&v6, "layoutSubviews");
  v3 = *(void (**)(__n128))&v2[OBJC_IVAR____TtCC22SubscribePageExtension29NavigationBarPalettePresenter18PaletteContentView_didLayoutSubviews];
  if (v3)
  {
    v4 = *(_QWORD *)&v2[OBJC_IVAR____TtCC22SubscribePageExtension29NavigationBarPalettePresenter18PaletteContentView_didLayoutSubviews
                      + 8];
    v5 = swift_retain(v4);
    v3(v5);
    sub_100019310((uint64_t)v3, v4);
  }

}

- (_TtCC22SubscribePageExtension29NavigationBarPalettePresenter18PaletteContentView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v8;
  objc_class *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtCC22SubscribePageExtension29NavigationBarPalettePresenter18PaletteContentView_didLayoutSubviews);
  v9 = (objc_class *)_s18PaletteContentViewCMa();
  *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[NavigationBarPalettePresenter.PaletteContentView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtCC22SubscribePageExtension29NavigationBarPalettePresenter18PaletteContentView)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtCC22SubscribePageExtension29NavigationBarPalettePresenter18PaletteContentView_didLayoutSubviews);
  v6 = (objc_class *)_s18PaletteContentViewCMa();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[NavigationBarPalettePresenter.PaletteContentView initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCC22SubscribePageExtension29NavigationBarPalettePresenter18PaletteContentView_didLayoutSubviews), *(_QWORD *)&self->didLayoutSubviews[OBJC_IVAR____TtCC22SubscribePageExtension29NavigationBarPalettePresenter18PaletteContentView_didLayoutSubviews]);
}

@end
