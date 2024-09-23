@implementation DebugFormatTestCasePreviewController

- (_TtC8NewsFeedP33_A4063904B1B6BB2D1C943382B1EBBFCF36DebugFormatTestCasePreviewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8NewsFeedP33_A4063904B1B6BB2D1C943382B1EBBFCF36DebugFormatTestCasePreviewController *result;

  v5 = OBJC_IVAR____TtC8NewsFeedP33_A4063904B1B6BB2D1C943382B1EBBFCF36DebugFormatTestCasePreviewController_scrollView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3C28]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeedP33_A4063904B1B6BB2D1C943382B1EBBFCF36DebugFormatTestCasePreviewController *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC8NewsFeedP33_A4063904B1B6BB2D1C943382B1EBBFCF36DebugFormatTestCasePreviewController *v2;

  v2 = self;
  sub_1BB820C54();

}

- (void)viewWillLayoutSubviews
{
  _TtC8NewsFeedP33_A4063904B1B6BB2D1C943382B1EBBFCF36DebugFormatTestCasePreviewController *v2;

  v2 = self;
  sub_1BB820D9C();

}

- (_TtC8NewsFeedP33_A4063904B1B6BB2D1C943382B1EBBFCF36DebugFormatTestCasePreviewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_1BAFB30C0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeedP33_A4063904B1B6BB2D1C943382B1EBBFCF36DebugFormatTestCasePreviewController_debugView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeedP33_A4063904B1B6BB2D1C943382B1EBBFCF36DebugFormatTestCasePreviewController_scrollView));
}

@end
