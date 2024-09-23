@implementation ViewServiceUIViewControllerExtendedHeight

- (void)viewDidLayoutSubviews
{
  _TtC21TDGSharingViewService41ViewServiceUIViewControllerExtendedHeight *v2;

  v2 = self;
  sub_1000245FC();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ViewServiceUIViewControllerExtendedHeight();
  v4 = (char *)v8.receiver;
  -[ViewServiceUIViewControllerExtendedHeight viewDidAppear:](&v8, "viewDidAppear:", v3);
  v5 = *(void (**)(uint64_t))&v4[OBJC_IVAR____TtC21TDGSharingViewService41ViewServiceUIViewControllerExtendedHeight_viewDidAppearCompletionHandler];
  if (v5)
  {
    v6 = *(_QWORD *)&v4[OBJC_IVAR____TtC21TDGSharingViewService41ViewServiceUIViewControllerExtendedHeight_viewDidAppearCompletionHandler
                      + 8];
    v7 = swift_retain(v6);
    v5(v7);
    sub_10000B5A0((uint64_t)v5, v6);
  }

}

- (_TtC21TDGSharingViewService41ViewServiceUIViewControllerExtendedHeight)initWithContentView:(id)a3
{
  unsigned __int8 *v5;
  objc_class *v6;
  objc_super v8;

  swift_weakInit(&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC21TDGSharingViewService41ViewServiceUIViewControllerExtendedHeight_layoutCache], 0);
  v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC21TDGSharingViewService41ViewServiceUIViewControllerExtendedHeight_viewDidAppearCompletionHandler];
  v6 = (objc_class *)type metadata accessor for ViewServiceUIViewControllerExtendedHeight();
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[ViewServiceUIViewControllerExtendedHeight initWithContentView:](&v8, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  swift_weakDestroy(&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC21TDGSharingViewService41ViewServiceUIViewControllerExtendedHeight_layoutCache]);
  sub_10000B5A0(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC21TDGSharingViewService41ViewServiceUIViewControllerExtendedHeight_viewDidAppearCompletionHandler], *(_QWORD *)&self->layoutCache[OBJC_IVAR____TtC21TDGSharingViewService41ViewServiceUIViewControllerExtendedHeight_viewDidAppearCompletionHandler]);
}

@end
