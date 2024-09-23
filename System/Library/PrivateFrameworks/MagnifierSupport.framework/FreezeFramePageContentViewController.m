@implementation FreezeFramePageContentViewController

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (NSString)description
{
  _TtC16MagnifierSupport36FreezeFramePageContentViewController *v2;
  void *v3;

  v2 = self;
  sub_2274BE5A4();

  v3 = (void *)sub_22758E1B4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC16MagnifierSupport36FreezeFramePageContentViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2274C3D90();
}

- (void)viewDidLoad
{
  _TtC16MagnifierSupport36FreezeFramePageContentViewController *v2;

  v2 = self;
  sub_2274BE724();

}

- (void)labelTapped:(id)a3
{
  id v4;
  _TtC16MagnifierSupport36FreezeFramePageContentViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2274C411C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MagnifierSupport36FreezeFramePageContentViewController *v4;

  v4 = self;
  sub_2274BF470(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC16MagnifierSupport36FreezeFramePageContentViewController *v4;

  v4 = self;
  sub_2274C06B8(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC16MagnifierSupport36FreezeFramePageContentViewController *v2;

  v2 = self;
  sub_2274C0858();

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC16MagnifierSupport36FreezeFramePageContentViewController *v5;
  _TtC16MagnifierSupport36FreezeFramePageContentViewController *v6;
  char v7;
  _OWORD v9[2];

  if (a4)
  {
    v5 = self;
    swift_unknownObjectRetain();
    sub_22758EAB4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v6 = self;
  }
  v7 = sub_22758CAE0();

  sub_22731A1A4((uint64_t)v9, &qword_2540BA340);
  return v7 & 1;
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_imageView));
}

- (void)scrollViewDidZoom:(id)a3
{
  id v4;
  _TtC16MagnifierSupport36FreezeFramePageContentViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2274C1C80(v4);

}

- (void)singleTap:(id)a3
{
  id v4;
  _TtC16MagnifierSupport36FreezeFramePageContentViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2274C2564(v4);

}

- (void)doubleTap:(id)a3
{
  id v4;
  _TtC16MagnifierSupport36FreezeFramePageContentViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2274C27E0(v4);

}

- (void)longPress:(id)a3
{
  id v4;
  _TtC16MagnifierSupport36FreezeFramePageContentViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2274C2DF8(v4);

}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v7;
  id v8;
  _TtC16MagnifierSupport36FreezeFramePageContentViewController *v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = (void *)sub_2274C4310();

  return v10;
}

- (void)shareFreezeFrameMenuItemAction
{
  double v3;
  double v4;
  double v5;
  double v6;
  _TtC16MagnifierSupport36FreezeFramePageContentViewController *v7;

  if (MEMORY[0x2276B3E34]((char *)self + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_pageSelectionDelegate, a2))
  {
    v3 = *(double *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_shareMenuLocation);
    v4 = *(double *)((char *)&self->super.super._responderFlags
                   + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_shareMenuLocation);
    v5 = *(double *)((char *)&self->super.super.__layeringSceneIdentity
                   + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_shareMenuLocation);
    v6 = *(double *)((char *)&self->super._overrideTransitioningDelegate
                   + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_shareMenuLocation);
    v7 = self;
    sub_227316390(v3, v4, v5, v6);

    swift_unknownObjectRelease();
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport36FreezeFramePageContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MagnifierSupport36FreezeFramePageContentViewController *result;

  v4 = a4;
  result = (_TtC16MagnifierSupport36FreezeFramePageContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_pageSelectionDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_scrollView));
  sub_2274C3D54((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_asset);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_cachedReaderTextDocument));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController____lazy_storage___interaction));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_image));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_imageProcessingQueue));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController____lazy_storage___singleTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController____lazy_storage___longPressGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController____lazy_storage___doubleTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController____lazy_storage___editMenuInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_myLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport36FreezeFramePageContentViewController_readerModeViewController));
}

@end
