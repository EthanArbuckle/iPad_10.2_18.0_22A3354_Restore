@implementation DebugFormatEditorViewController

- (_TtC8NewsFeed31DebugFormatEditorViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB1AE728();
}

- (void)viewDidLoad
{
  _TtC8NewsFeed31DebugFormatEditorViewController *v2;

  v2 = self;
  sub_1BB19F15C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8NewsFeed31DebugFormatEditorViewController *v4;

  v4 = self;
  sub_1BB1A4200(a3);

}

- (void)viewWillLayoutSubviews
{
  _TtC8NewsFeed31DebugFormatEditorViewController *v2;

  v2 = self;
  sub_1BB1A4360();

}

- (void)viewDidLayoutSubviews
{
  _TtC8NewsFeed31DebugFormatEditorViewController *v2;

  v2 = self;
  sub_1BB1A4D60();

}

- (void)viewLayoutMarginsDidChange
{
  _TtC8NewsFeed31DebugFormatEditorViewController *v2;

  v2 = self;
  sub_1BB1A6410();

}

- (_TtC8NewsFeed31DebugFormatEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed31DebugFormatEditorViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed31DebugFormatEditorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _BYTE v3[336];

  sub_1BA8FD860((uint64_t)self + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController_delegate);
  swift_release();
  swift_release();
  memcpy(v3, (char *)self + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController_packages, sizeof(v3));
  sub_1BAF8FB4C((uint64_t)v3);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController_canvasViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController_rulerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController____lazy_storage___overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController_snapshotCanvasView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController_statusView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController____lazy_storage___zoomBarButtonItem));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController____lazy_storage___editorPathView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController____lazy_storage___debuggerRunBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController____lazy_storage___debuggerNextBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController____lazy_storage___debuggerStepInBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController____lazy_storage___debuggerStepOverBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController____lazy_storage___debuggerStepOutBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController____lazy_storage___snapshotBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController____lazy_storage___sourceMetricsBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController_sourceViewController));
}

- (void)doToggleSidebar
{
  _TtC8NewsFeed31DebugFormatEditorViewController *v2;

  v2 = self;
  sub_1BB1AAD78();

}

- (void)doLightDarkMode
{
  _TtC8NewsFeed31DebugFormatEditorViewController *v2;

  v2 = self;
  sub_1BB1AAF04();

}

- (void)doInterfaceLayoutDirection
{
  _TtC8NewsFeed31DebugFormatEditorViewController *v2;

  v2 = self;
  sub_1BB1AAFD0();

}

- (void)doDevicesWithSender:(id)a3
{
  id v4;
  _TtC8NewsFeed31DebugFormatEditorViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BB1AB09C((uint64_t)v4);

}

- (void)doAccessibilityWithSender:(id)a3
{
  id v4;
  _TtC8NewsFeed31DebugFormatEditorViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BB1AB284((uint64_t)v4);

}

- (void)doOptions
{
  _TtC8NewsFeed31DebugFormatEditorViewController *v2;

  v2 = self;
  sub_1BB1A87B0();

}

- (void)doResetZoom
{
  _TtC8NewsFeed31DebugFormatEditorViewController *v3;
  void *v4;

  swift_getObjectType();
  v3 = self;
  sub_1BB86EC14();
  sub_1BA49A224(0, (unint64_t *)&qword_1ED3B9850);
  v4 = (void *)sub_1BB87345C();
  sub_1BB86E98C();

  swift_release();
  swift_release();

}

- (void)doReload
{
  _TtC8NewsFeed31DebugFormatEditorViewController *v3;
  void *v4;

  swift_getObjectType();
  v3 = self;
  sub_1BB86EC14();
  sub_1BA49A224(0, (unint64_t *)&qword_1ED3B9850);
  v4 = (void *)sub_1BB87345C();
  sub_1BB86E98C();

  swift_release();
  swift_release();

}

- (void)doSnapshotWithSender:(id)a3
{
  id v4;
  _TtC8NewsFeed31DebugFormatEditorViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BB1AB6B8(v4);

}

- (void)doToggleConsoleDisplay
{
  _TtC8NewsFeed31DebugFormatEditorViewController *v2;

  v2 = self;
  sub_1BB1AB974();

}

- (void)doStartStopDebugger
{
  _TtC8NewsFeed31DebugFormatEditorViewController *v2;

  v2 = self;
  sub_1BB1ABA68();

}

- (void)doBreakpointNext
{
  _TtC8NewsFeed31DebugFormatEditorViewController *v2;

  v2 = self;
  sub_1BB1ABCE4(0);

}

- (void)doBreakpointStepOver
{
  _TtC8NewsFeed31DebugFormatEditorViewController *v2;

  v2 = self;
  sub_1BB1ABE8C((void (*)(uint64_t))sub_1BB47E590);

}

- (void)doBreakpointStepIn
{
  _TtC8NewsFeed31DebugFormatEditorViewController *v2;

  v2 = self;
  sub_1BB1ABCE4(1);

}

- (void)doBreakpointStepOut
{
  _TtC8NewsFeed31DebugFormatEditorViewController *v2;

  v2 = self;
  sub_1BB1ABE8C((void (*)(uint64_t))sub_1BB47E598);

}

- (id)viewForZoomingInScrollView:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC8NewsFeed31DebugFormatEditorViewController_contentView));
}

- (void)scrollViewDidZoom:(id)a3
{
  id v4;
  _TtC8NewsFeed31DebugFormatEditorViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BB1ADB9C(v4);

}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  id v8;
  id v9;
  _TtC8NewsFeed31DebugFormatEditorViewController *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_1BB1AFC88(v8, a5);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC8NewsFeed31DebugFormatEditorViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BB1AD1AC(v4);

}

@end
