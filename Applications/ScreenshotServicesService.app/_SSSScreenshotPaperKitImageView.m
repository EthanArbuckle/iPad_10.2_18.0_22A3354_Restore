@implementation _SSSScreenshotPaperKitImageView

- (_SSSScreenshotPaperKitImageViewDelegate)delegate
{
  char *v2;
  _BYTE v4[24];

  v2 = (char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_delegate, v4, 0, 0);
  return (_SSSScreenshotPaperKitImageViewDelegate *)(id)swift_unknownObjectWeakLoadStrong(v2);
}

- (void)setDelegate:(id)a3
{
  char *v4;
  _BYTE v5[24];

  v4 = (char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_delegate, v5, 1, 0);
  swift_unknownObjectWeakAssign(v4, a3);
}

- (CRContext)context
{
  return (CRContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                              + OBJC_IVAR____SSSScreenshotPaperKitImageView_context));
}

- (double)vellumOpacity
{
  double *v2;
  _BYTE v4[24];

  v2 = (double *)((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_vellumOpacity);
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_vellumOpacity, v4, 0, 0);
  return *v2;
}

- (void)setVellumOpacity:(double)a3
{
  _SSSScreenshotPaperKitImageView *v4;

  v4 = self;
  sub_100053928(a3);

}

- (UIGestureRecognizer)drawingGestureRecognizer
{
  void **v3;
  void *v4;
  _SSSScreenshotPaperKitImageView *v5;
  id v6;
  void *v7;
  _BYTE v9[24];

  v3 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController);
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController, v9, 0, 0);
  v4 = *v3;
  if (!v4)
    return (UIGestureRecognizer *)0;
  v5 = self;
  v6 = v4;
  v7 = (void *)dispatch thunk of CanvasElementViewController.drawingGestureRecognizer.getter();

  return (UIGestureRecognizer *)v7;
}

- (unint64_t)changeCounter
{
  unint64_t *v2;
  _BYTE v4[24];

  v2 = (unint64_t *)((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_changeCounter);
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_changeCounter, v4, 0, 0);
  return *v2;
}

- (void)setChangeCounter:(unint64_t)a3
{
  unint64_t *v4;
  _BYTE v5[24];

  v4 = (unint64_t *)((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_changeCounter);
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_changeCounter, v5, 1, 0);
  *v4 = a3;
}

- (UIImage)image
{
  return (UIImage *)sub_10004C6F4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SSSScreenshotPaperKitImageView_image);
}

- (void)setImage:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  _SSSScreenshotPaperKitImageView *v8;
  _BYTE v9[24];

  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____SSSScreenshotPaperKitImageView_image);
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_image, v9, 1, 0);
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  sub_100053C0C();
  -[_SSSScreenshotPaperKitImageView setNeedsLayout](v8, "setNeedsLayout");
  -[_SSSScreenshotPaperKitImageView invalidateIntrinsicContentSize](v8, "invalidateIntrinsicContentSize");

}

- (SSSCropInfo)cropInfo
{
  char *v4;
  SSSCropInfo *result;
  CGPoint v6;
  _BYTE v7[24];

  v4 = (char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_cropInfo;
  result = (SSSCropInfo *)swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_cropInfo, v7, 0, 0);
  v6 = (CGPoint)*((_OWORD *)v4 + 1);
  retstr->totalSize = *(CGSize *)v4;
  retstr->currentRect.origin = v6;
  retstr->currentRect.size = (CGSize)*((_OWORD *)v4 + 2);
  return result;
}

- (void)setCropInfo:(SSSCropInfo *)a3
{
  CGFloat width;
  CGFloat height;
  CGPoint *v6;
  CGPoint origin;
  CGSize totalSize;
  _BYTE v9[24];

  origin = a3->currentRect.origin;
  totalSize = a3->totalSize;
  width = a3->currentRect.size.width;
  height = a3->currentRect.size.height;
  v6 = (CGPoint *)((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_cropInfo);
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_cropInfo, v9, 1, 0);
  *(CGSize *)v6 = totalSize;
  v6[1] = origin;
  v6[2].x = width;
  v6[2].y = height;
  -[_SSSScreenshotPaperKitImageView setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)sizeMultiplier
{
  double *v2;
  double v3;
  double v4;
  _BYTE v5[24];
  CGSize result;

  v2 = (double *)((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_sizeMultiplier);
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_sizeMultiplier, v5, 0, 0);
  v3 = *v2;
  v4 = v2[1];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setSizeMultiplier:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat *v6;
  _BYTE v7[24];

  height = a3.height;
  width = a3.width;
  v6 = (CGFloat *)((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_sizeMultiplier);
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_sizeMultiplier, v7, 1, 0);
  *v6 = width;
  v6[1] = height;
  -[_SSSScreenshotPaperKitImageView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)useTrilinearMinificationFilter
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_useTrilinearMinificationFilter;
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_useTrilinearMinificationFilter, v4, 0, 0);
  return *v2;
}

- (void)setUseTrilinearMinificationFilter:(BOOL)a3
{
  BOOL *v5;
  _BYTE v6[24];

  v5 = (BOOL *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_useTrilinearMinificationFilter;
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_useTrilinearMinificationFilter, v6, 1, 0);
  *v5 = a3;
  -[_SSSScreenshotPaperKitImageView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)editable
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_editable;
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_editable, v4, 0, 0);
  return *v2;
}

- (void)setEditable:(BOOL)a3
{
  BOOL *v5;
  _SSSScreenshotPaperKitImageView *v6;
  _BYTE v7[24];

  v5 = (BOOL *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_editable;
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_editable, v7, 1, 0);
  *v5 = a3;
  v6 = self;
  sub_100054770();

}

- (_SSSScreenshotPaperKitImageView)initWithFrame:(CGRect)a3
{
  return (_SSSScreenshotPaperKitImageView *)sub_10005487C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_SSSScreenshotPaperKitImageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100056C9C();
}

- (void)updatePaletteVisibilityIfNecessary:(BOOL)a3
{
  _SSSScreenshotPaperKitImageView *v4;

  v4 = self;
  sub_100054A64(a3);

}

- (UIView)rulerHostView
{
  return (UIView *)sub_10004C6F4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SSSScreenshotPaperKitImageView_rulerHostView);
}

- (void)setRulerHostView:(id)a3
{
  _SSSScreenshotPaperKitImageView *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_100056DF0(a3);

}

- (BOOL)annotationsEnabled
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_annotationsEnabled;
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_annotationsEnabled, v4, 0, 0);
  return *v2;
}

- (void)setAnnotationsEnabled:(BOOL)a3
{
  _SSSScreenshotPaperKitImageView *v4;

  v4 = self;
  sub_100054D6C(a3);

}

- (void)cropControllerDidZoomInScrollView:(id)a3
{
  id v4;
  _SSSScreenshotPaperKitImageView *v5;

  v4 = a3;
  v5 = self;
  sub_100054E18(v4);

}

- (void)cropControllerDidUpdateScrollView:(id)a3
{
  id v4;
  _SSSScreenshotPaperKitImageView *v5;

  v4 = a3;
  v5 = self;
  sub_100055038(v4);

}

- (NSString)imageDescription
{
  void **v3;
  void *v4;
  _SSSScreenshotPaperKitImageView *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;
  _BYTE v11[24];

  v3 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController);
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController, v11, 0, 0);
  v4 = *v3;
  if (v4)
  {
    v5 = self;
    v6 = v4;
    CanvasElementViewController<>.imageDescription.getter();
    v8 = v7;

    if (v8)
    {
      v9 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v8);
      return (NSString *)v9;
    }
    v4 = 0;
  }
  return (NSString *)v4;
}

- (void)deselectAllAnnotations
{
  void **v3;
  void *v4;
  _SSSScreenshotPaperKitImageView *v5;
  id v6;
  uint64_t v7;
  _BYTE v8[24];

  v3 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController);
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController, v8, 0, 0);
  v4 = *v3;
  if (v4)
  {
    v5 = self;
    v6 = v4;
    v7 = dispatch thunk of CanvasElementViewController.canvasView.getter();

    if (v7)
    {
      dispatch thunk of CanvasView.deselectAll()();

      v5 = (_SSSScreenshotPaperKitImageView *)v7;
    }

  }
}

- (void)updateCanvasViewAfterLoadingImage
{
  _SSSScreenshotPaperKitImageView *v2;

  v2 = self;
  sub_100055564();

}

- (void)layoutSubviews
{
  uint64_t v2;
  _SSSScreenshotPaperKitImageView *v3;

  v3 = self;
  sub_1000560E8((uint64_t)v3, v2);

}

- (id)generateImageForScreenshot:(id)a3
{
  id v4;
  _SSSScreenshotPaperKitImageView *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_10005623C(v4);
  v7 = v6;

  return v7;
}

- (void)toolPickerVisibilityDidChange:(id)a3
{
  id v4;
  _BYTE *v5;
  _SSSScreenshotPaperKitImageView *v6;
  _BYTE v7[24];

  v4 = a3;
  v6 = self;
  if (objc_msgSend(v4, "isVisible"))
  {
    v5 = (char *)v6 + OBJC_IVAR____SSSScreenshotPaperKitImageView_editable;
    swift_beginAccess((char *)v6 + OBJC_IVAR____SSSScreenshotPaperKitImageView_editable, v7, 1, 0);
    *v5 = 1;
    sub_100054770();

  }
  else
  {

  }
}

- (void).cxx_destruct
{
  sub_1000533E0((uint64_t)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_delegate);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageCancellable));

}

- (void)_toolPicker:(id)a3 startEditingOpacityWithAccessoryView:(id)a4
{
  char *v7;
  uint64_t Strong;
  void *v9;
  id v10;
  id v11;
  _SSSScreenshotPaperKitImageView *v12;
  _BYTE v13[24];

  v7 = (char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR____SSSScreenshotPaperKitImageView_delegate, v13, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v7);
  if (Strong)
  {
    v9 = (void *)Strong;
    v10 = a3;
    v11 = a4;
    v12 = self;
    objc_msgSend(v9, "_paperKitImageView:startEditingOpacityInAccessoryView:", v12, v11);

    swift_unknownObjectRelease(v9);
  }
}

@end
