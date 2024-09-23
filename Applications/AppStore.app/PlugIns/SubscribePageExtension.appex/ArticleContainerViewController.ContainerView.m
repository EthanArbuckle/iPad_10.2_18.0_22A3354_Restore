@implementation ArticleContainerViewController.ContainerView

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ArticleContainerViewController.ContainerView();
  -[ArticleContainerViewController.ContainerView frame](&v6, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v8;
  _TtCC22SubscribePageExtension30ArticleContainerViewControllerP33_BACDBA853B9C19619833ED681F77E93313ContainerView *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void (*v22)(__n128);
  uint64_t v23;
  __n128 v24;
  objc_super v25;
  objc_super v26;
  CGRect v27;
  CGRect v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for ArticleContainerViewController.ContainerView();
  v26.receiver = self;
  v26.super_class = v8;
  v9 = self;
  -[ArticleContainerViewController.ContainerView frame](&v26, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v25.receiver = v9;
  v25.super_class = v8;
  -[ArticleContainerViewController.ContainerView setFrame:](&v25, "setFrame:", x, y, width, height);
  -[ArticleContainerViewController.ContainerView frame](v9, "frame");
  v28.origin.x = v18;
  v28.origin.y = v19;
  v28.size.width = v20;
  v28.size.height = v21;
  v27.origin.x = v11;
  v27.origin.y = v13;
  v27.size.width = v15;
  v27.size.height = v17;
  if (!CGRectEqualToRect(v27, v28))
  {
    v22 = *(void (**)(__n128))((char *)&v9->super.super.super.isa
                                        + OBJC_IVAR____TtCC22SubscribePageExtension30ArticleContainerViewControllerP33_BACDBA853B9C19619833ED681F77E93313ContainerView_frameUpdatedCallback);
    if (v22)
    {
      v23 = *(_QWORD *)&v9->frameUpdatedCallback[OBJC_IVAR____TtCC22SubscribePageExtension30ArticleContainerViewControllerP33_BACDBA853B9C19619833ED681F77E93313ContainerView_frameUpdatedCallback];
      v24 = swift_retain(v23);
      v22(v24);
      sub_100019310((uint64_t)v22, v23);
    }
  }

}

- (_TtCC22SubscribePageExtension30ArticleContainerViewControllerP33_BACDBA853B9C19619833ED681F77E93313ContainerView)initWithFrame:(CGRect)a3
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
               + OBJC_IVAR____TtCC22SubscribePageExtension30ArticleContainerViewControllerP33_BACDBA853B9C19619833ED681F77E93313ContainerView_frameUpdatedCallback);
  v9 = (objc_class *)type metadata accessor for ArticleContainerViewController.ContainerView();
  *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[ArticleContainerViewController.ContainerView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtCC22SubscribePageExtension30ArticleContainerViewControllerP33_BACDBA853B9C19619833ED681F77E93313ContainerView)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtCC22SubscribePageExtension30ArticleContainerViewControllerP33_BACDBA853B9C19619833ED681F77E93313ContainerView_frameUpdatedCallback);
  v6 = (objc_class *)type metadata accessor for ArticleContainerViewController.ContainerView();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[ArticleContainerViewController.ContainerView initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCC22SubscribePageExtension30ArticleContainerViewControllerP33_BACDBA853B9C19619833ED681F77E93313ContainerView_frameUpdatedCallback), *(_QWORD *)&self->frameUpdatedCallback[OBJC_IVAR____TtCC22SubscribePageExtension30ArticleContainerViewControllerP33_BACDBA853B9C19619833ED681F77E93313ContainerView_frameUpdatedCallback]);
}

@end
