@implementation DebugFormatUploadHiddenContainerController

- (_TtC8NewsFeed42DebugFormatUploadHiddenContainerController)initWithCoder:(id)a3
{
  _TtC8NewsFeed42DebugFormatUploadHiddenContainerController *result;

  result = (_TtC8NewsFeed42DebugFormatUploadHiddenContainerController *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC8NewsFeed42DebugFormatUploadHiddenContainerController *v2;

  v2 = self;
  sub_1BB5E521C();

}

- (void)viewWillLayoutSubviews
{
  char *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  -[DebugFormatUploadHiddenContainerController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC8NewsFeed42DebugFormatUploadHiddenContainerController_rootViewController], sel_view, v15.receiver, v15.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, sel_view);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, sel_bounds);
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;

      objc_msgSend(v4, sel_setFrame_, v8, v10, v12, v14);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (void)doDismiss
{
  -[DebugFormatUploadHiddenContainerController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (_TtC8NewsFeed42DebugFormatUploadHiddenContainerController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed42DebugFormatUploadHiddenContainerController *result;

  v4 = a4;
  result = (_TtC8NewsFeed42DebugFormatUploadHiddenContainerController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed42DebugFormatUploadHiddenContainerController_rootViewController));
}

@end
