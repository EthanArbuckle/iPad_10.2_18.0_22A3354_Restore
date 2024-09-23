@implementation _SSSScreenshotPaperKitPDFView

- (_SSSScreenshotPaperKitPDFViewDelegate)delegate
{
  char *v2;
  _BYTE v4[24];

  v2 = (char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_delegate, v4, 0, 0);
  return (_SSSScreenshotPaperKitPDFViewDelegate *)(id)swift_unknownObjectWeakLoadStrong(v2);
}

- (void)setDelegate:(id)a3
{
  char *v4;
  _BYTE v5[24];

  v4 = (char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_delegate, v5, 1, 0);
  swift_unknownObjectWeakAssign(v4, a3);
}

- (double)leftRightMargin
{
  return 100.0;
}

- (CRContext)context
{
  return (CRContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                              + OBJC_IVAR____SSSScreenshotPaperKitPDFView_context));
}

- (BOOL)screenshotEditsSnapshotted
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_screenshotEditsSnapshotted;
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_screenshotEditsSnapshotted, v4, 0, 0);
  return *v2;
}

- (void)setScreenshotEditsSnapshotted:(BOOL)a3
{
  BOOL *v4;
  _BYTE v5[24];

  v4 = (BOOL *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_screenshotEditsSnapshotted;
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_screenshotEditsSnapshotted, v5, 1, 0);
  *v4 = a3;
}

- (_TtC8PaperKit17PaperDocumentView)paperDocumentView
{
  return (_TtC8PaperKit17PaperDocumentView *)sub_10004C6F4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView);
}

- (void)setPaperDocumentView:(id)a3
{
  sub_10004B7D4((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView);
}

- (PDFDocument)cachedRenderedPDFDocument
{
  return (PDFDocument *)sub_10004C6F4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SSSScreenshotPaperKitPDFView_cachedRenderedPDFDocument);
}

- (void)setCachedRenderedPDFDocument:(id)a3
{
  sub_10004B7D4((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____SSSScreenshotPaperKitPDFView_cachedRenderedPDFDocument);
}

- (PKToolPicker)toolPicker
{
  return (PKToolPicker *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_toolPicker));
}

- (NSData)pdfData
{
  uint64_t *v2;
  Class isa;
  unint64_t v4;
  uint64_t v5;
  _BYTE v7[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_pdfData);
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_pdfData, v7, 0, 0);
  isa = 0;
  v4 = v2[1];
  if (v4 >> 60 != 15)
  {
    v5 = *v2;
    sub_10004B8DC(v5, v4);
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10004B9B0(v5, v4);
  }
  return (NSData *)isa;
}

- (void)setPdfData:(id)a3
{
  id v3;
  _SSSScreenshotPaperKitPDFView *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  _SSSScreenshotPaperKitPDFView *v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  _BYTE v13[24];

  v3 = a3;
  if (a3)
  {
    v5 = self;
    v6 = v3;
    v3 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v8 = v7;

  }
  else
  {
    v9 = self;
    v8 = 0xF000000000000000;
  }
  v10 = (uint64_t *)((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_pdfData);
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_pdfData, v13, 1, 0);
  v11 = *v10;
  v12 = v10[1];
  *v10 = (uint64_t)v3;
  v10[1] = v8;
  sub_10004B9B0(v11, v12);

}

- (PDFView)pdfView
{
  void **v3;
  void *v4;
  _SSSScreenshotPaperKitPDFView *v5;
  id v6;
  void *v7;
  _BYTE v9[24];

  v3 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView);
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView, v9, 0, 0);
  v4 = *v3;
  if (!v4)
    return (PDFView *)0;
  v5 = self;
  v6 = v4;
  v7 = (void *)dispatch thunk of PaperDocumentView.pdfView.getter();

  return (PDFView *)v7;
}

- (double)vellumOpacity
{
  double *v2;
  _BYTE v4[24];

  v2 = (double *)((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_vellumOpacity);
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_vellumOpacity, v4, 0, 0);
  return *v2;
}

- (void)setVellumOpacity:(double)a3
{
  _SSSScreenshotPaperKitPDFView *v4;

  v4 = self;
  sub_10004BB10(a3);

}

- (SSSScreenshot)screenshot
{
  return (SSSScreenshot *)sub_10004C6F4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SSSScreenshotPaperKitPDFView_screenshot);
}

- (void)setScreenshot:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  _SSSScreenshotPaperKitPDFView *v8;
  _BYTE v9[24];

  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____SSSScreenshotPaperKitPDFView_screenshot);
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_screenshot, v9, 1, 0);
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  sub_10004BC50();
}

- (_SSSScreenshotPaperKitPDFView)viewWithScreenshotImage
{
  return (_SSSScreenshotPaperKitPDFView *)sub_10004C6F4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView);
}

- (_SSSScreenshotContentOverlayController)overlayController
{
  return (_SSSScreenshotContentOverlayController *)0;
}

- (BOOL)isCropping
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_isCropping;
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_isCropping, v4, 0, 0);
  return *v2;
}

- (void)setIsCropping:(BOOL)a3
{
  BOOL *v5;
  _SSSScreenshotPaperKitPDFView *v6;
  _BYTE v7[24];

  v5 = (BOOL *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_isCropping;
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_isCropping, v7, 1, 0);
  *v5 = a3;
  v6 = self;
  sub_10004C540();

}

- (UIView)rulerHostView
{
  return (UIView *)sub_10004C6F4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SSSScreenshotPaperKitPDFView_rulerHostView);
}

- (void)setRulerHostView:(id)a3
{
  _SSSScreenshotPaperKitPDFView *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_10005203C(a3);

}

- (void)updateCurrentPageCropRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _SSSScreenshotPaperKitPDFView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_10004C780(x, y, width, height);

}

- (CGRect)currentPageUnitCropRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_10004DFA8(self, (uint64_t)a2, sub_10004CF10);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setCurrentPageUnitCropRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _SSSScreenshotPaperKitPDFView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_10004C780(x, y, width, height);

}

- (CGRect)currentPageBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_10004DFA8(self, (uint64_t)a2, sub_10004D630);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _SSSScreenshotPaperKitPDFView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_10004E044();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)updatePDFViewZoomParameters
{
  _SSSScreenshotPaperKitPDFView *v2;

  v2 = self;
  sub_10004C540();

}

- (unint64_t)changeCounter
{
  unint64_t *v2;
  _BYTE v4[24];

  v2 = (unint64_t *)((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_changeCounter);
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_changeCounter, v4, 0, 0);
  return *v2;
}

- (void)setChangeCounter:(unint64_t)a3
{
  unint64_t *v4;
  _BYTE v5[24];

  v4 = (unint64_t *)((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_changeCounter);
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_changeCounter, v5, 1, 0);
  *v4 = a3;
}

- (void)updatePaletteVisibilityIfNecessary:(BOOL)a3
{
  _SSSScreenshotPaperKitPDFView *v4;

  v4 = self;
  sub_10004E2D4(a3);

}

- (BOOL)editable
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_editable;
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_editable, v4, 0, 0);
  return *v2;
}

- (void)setEditable:(BOOL)a3
{
  _SSSScreenshotPaperKitPDFView *v4;

  v4 = self;
  sub_10004E4B8(a3);

}

- (_SSSScreenshotPaperKitPDFView)initWithFrame:(CGRect)a3
{
  return (_SSSScreenshotPaperKitPDFView *)sub_10004E5F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_SSSScreenshotPaperKitPDFView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100052198();
}

- (void)deselectAllAnnotations
{
  void **v3;
  void *v4;
  _SSSScreenshotPaperKitPDFView *v5;
  id v6;
  _BYTE v7[24];

  v3 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView);
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView, v7, 0, 0);
  v4 = *v3;
  if (v4)
  {
    v5 = self;
    v6 = v4;
    dispatch thunk of PaperDocumentView.deselectAll()();

  }
}

- (void)setupDocumentViewController
{
  _SSSScreenshotPaperKitPDFView *v2;

  v2 = self;
  sub_10004BC50();

}

- (void)layoutSubviews
{
  char *v2;
  id *v3;
  char *v4;
  char v5[24];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self, a2);
  v2 = (char *)v6.receiver;
  -[_SSSScreenshotPaperKitPDFView layoutSubviews](&v6, "layoutSubviews");
  v3 = (id *)&v2[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView];
  swift_beginAccess(&v2[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView], v5, 0, 0);
  if (*v3)
  {
    v4 = (char *)*v3;
    objc_msgSend(v2, "bounds");
    objc_msgSend(v4, "setFrame:");

    v2 = v4;
  }

}

- (id)documentFromPDFData:(id)a3
{
  id v5;
  _SSSScreenshotPaperKitPDFView *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;

  v5 = a3;
  v6 = self;
  v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;

  v10 = sub_10004F6F0(v7, v9);
  sub_10004B9C4(v7, v9);

  return v10;
}

- (void).cxx_destruct
{
  sub_1000533E0((uint64_t)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_delegate);

  swift_release(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SSSScreenshotPaperKitPDFView_cancellable));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____SSSScreenshotPaperKitPDFView_cachedRenderedPDFDocument));

  sub_10004B9B0(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____SSSScreenshotPaperKitPDFView_pdfData), *(_QWORD *)&self->delegate[OBJC_IVAR____SSSScreenshotPaperKitPDFView_pdfData]);
}

- (void)_toolPicker:(id)a3 startEditingOpacityWithAccessoryView:(id)a4
{
  char *v7;
  uint64_t Strong;
  void *v9;
  id v10;
  id v11;
  _SSSScreenshotPaperKitPDFView *v12;
  _BYTE v13[24];

  v7 = (char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitPDFView_delegate, v13, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v7);
  if (Strong)
  {
    v9 = (void *)Strong;
    v10 = a3;
    v11 = a4;
    v12 = self;
    objc_msgSend(v9, "_paperKitPDFView:startEditingOpacityInAccessoryView:", v12, v11);

    swift_unknownObjectRelease(v9);
  }
}

@end
