@implementation OverlayMenuSlider

- (_TtP8CameraUI25OverlayMenuSliderDelegate_)delegate
{
  return (_TtP8CameraUI25OverlayMenuSliderDelegate_ *)(id)MEMORY[0x1DF0B5C48]((char *)self+ OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (int64_t)selectedControlIndex
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider), sel_selectedIndex);
}

- (void)setSelectedControlIndex:(int64_t)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider), sel_setSelectedIndex_animatedDuration_animatedCurve_completion_, a3, 0, 0, 0.0);
}

- (void)setSelectedControlIndex:(int64_t)a3 animated:(BOOL)a4
{
  _TtC8CameraUI17OverlayMenuSlider *v6;

  v6 = self;
  sub_1DB953EE4(a3, a4);

}

- (NSArray)imageNames
{
  void *v2;

  sub_1DB9798D0();
  v2 = (void *)sub_1DB979FF0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setImageNames:(id)a3
{
  objc_class *v4;
  _QWORD *v5;
  _TtC8CameraUI17OverlayMenuSlider *v6;

  v4 = (objc_class *)sub_1DB979FFC();
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_imageNames);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_imageNames) = v4;
  v6 = self;
  sub_1DB9540D0(v5);

  swift_bridgeObjectRelease();
}

- (CEKContactRecognizer)contactRecognizer
{
  return (CEKContactRecognizer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                         + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider));
}

- (NSIndexSet)disabledMenuItemsIndices
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1DB979A80();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_disabledMenuItemsIndices;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_1DB979A50();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSIndexSet *)v8;
}

- (void)setDisabledMenuItemsIndices:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _TtC8CameraUI17OverlayMenuSlider *v7;
  uint64_t v8;

  v4 = sub_1DB979A80();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DB979A5C();
  v7 = self;
  sub_1DB9544F4(v6);

}

- (void)discreteSliderDidChangeValue:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  _TtC8CameraUI17OverlayMenuSlider *v8;

  v5 = MEMORY[0x1DF0B5C48]((char *)self + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_delegate, a2);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = a3;
    v8 = self;
    objc_msgSend(v6, sel_overlayMenuSlider_didSelectControlAt_, v8, objc_msgSend(v7, sel_selectedIndex));

    swift_unknownObjectRelease();
  }
}

- (int64_t)indexOfImageClosestToPoint:(CGPoint)a3 in:(id)a4
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider), sel_indexForTickMarkAtPoint_in_, a4, a3.x, a3.y);
}

- (BOOL)highlightCurrentSelectedIndex
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider), sel_highlightSelectedIndex);
}

- (void)setHighlightCurrentSelectedIndex:(BOOL)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider), sel_setHighlightSelectedIndex_animated_, a3, 0);
}

- (void)setHighlightCurrentSelectedIndex:(BOOL)a3 animated:(BOOL)a4
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_discreteSlider), sel_setHighlightSelectedIndex_animated_, a3, a4);
}

- (_TtC8CameraUI17OverlayMenuSlider)initWithFrame:(CGRect)a3
{
  return (_TtC8CameraUI17OverlayMenuSlider *)sub_1DB954778(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtC8CameraUI17OverlayMenuSlider *v2;

  v2 = self;
  sub_1DB954A74();

}

- (_TtC8CameraUI17OverlayMenuSlider)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DB955738();
}

- (id)imageForTickMarkAtIndex:(int64_t)a3
{
  _TtC8CameraUI17OverlayMenuSlider *v4;
  void *v5;

  v4 = self;
  v5 = (void *)sub_1DB954DDC(a3);

  return v5;
}

- (CGSize)sizeForImageAtIndex:(int64_t)a3
{
  _TtC8CameraUI17OverlayMenuSlider *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v4 = self;
  sub_1DB954210(a3);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)isDisabledAtIndex:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  _TtC8CameraUI17OverlayMenuSlider *v9;
  char v10;
  uint64_t v12;

  v4 = sub_1DB979A80();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (char *)self + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_disabledMenuItemsIndices;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = self;
  v10 = sub_1DB979A68();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v10 & 1;
}

- (void)sliderWillBeginScrolling:(id)a3
{
  sub_1DB95501C((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_overlayMenuSliderWillBeginScrolling_);
}

- (void)sliderDidEndScrolling:(id)a3
{
  sub_1DB95501C((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_overlayMenuSliderDidEndScrolling_);
}

- (int64_t)orientation
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider__orientation);
}

- (void)setOrientation:(int64_t)a3
{
  _TtC8CameraUI17OverlayMenuSlider *v4;

  v4 = self;
  sub_1DB9550EC((id)a3);

}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _TtC8CameraUI17OverlayMenuSlider *v6;

  v6 = self;
  sub_1DB955184((id)a3, a4);

}

- (CGAffineTransform)orientationTransform
{
  _TtC8CameraUI17OverlayMenuSlider *v4;
  CGAffineTransform *result;
  __int128 v6;
  __int128 v7;
  _OWORD v8[3];

  v4 = self;
  sub_1DB954C5C(v8);

  v6 = v8[1];
  v7 = v8[2];
  *(_OWORD *)&retstr->a = v8[0];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = v7;
  return result;
}

- (unint64_t)alignment
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_alignment);
}

- (void)setAlignment:(unint64_t)a3
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_alignment);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_alignment) = (Class)a3;
  if (v3 != a3)
    -[OverlayMenuSlider setNeedsLayout](self, sel_setNeedsLayout);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1DB955860((uint64_t)self + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_delegate);

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8CameraUI17OverlayMenuSlider_disabledMenuItemsIndices;
  v4 = sub_1DB979A80();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
