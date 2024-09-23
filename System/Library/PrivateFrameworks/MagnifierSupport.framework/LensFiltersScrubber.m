@implementation LensFiltersScrubber

- (_TtC16MagnifierSupport19LensFiltersScrubber)initWithFrame:(CGRect)a3
{
  return (_TtC16MagnifierSupport19LensFiltersScrubber *)sub_227344890(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MagnifierSupport19LensFiltersScrubber)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_227349538();
}

- (void)layoutSubviews
{
  _TtC16MagnifierSupport19LensFiltersScrubber *v2;

  v2 = self;
  sub_2273477F8();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19LensFiltersScrubber_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19LensFiltersScrubber_maskedView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19LensFiltersScrubber_feedbackGenerator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19LensFiltersScrubber____lazy_storage___overlayBox));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19LensFiltersScrubber_overlayBoxLeadingAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19LensFiltersScrubber____lazy_storage___activeItemIndicator));
}

- (void)didTapScrollView:(id)a3
{
  id v4;
  _TtC16MagnifierSupport19LensFiltersScrubber *v5;

  v4 = a3;
  v5 = self;
  sub_227348418(v4);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC16MagnifierSupport19LensFiltersScrubber *v5;

  v4 = a3;
  v5 = self;
  sub_2273488BC(v4);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  id v8;
  void *v9;
  char v10;
  _TtC16MagnifierSupport19LensFiltersScrubber *v11;

  x = a5->x;
  v8 = a3;
  v11 = self;
  v9 = sub_2273487B0(x);
  if ((v10 & 1) == 0)
    *(_QWORD *)&a5->x = v9;

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MagnifierSupport19LensFiltersScrubber_feedbackGenerator), sel_prepare, a3);
}

- (unint64_t)accessibilityTraits
{
  unint64_t result;
  uint64_t v3;

  result = *MEMORY[0x24BEBDEF0];
  v3 = *MEMORY[0x24BEBDF50];
  if (!*MEMORY[0x24BEBDEF0])
  {
    if (!v3)
      return 0;
LABEL_5:
    result |= v3;
    return result;
  }
  if ((v3 & ~result) != 0)
    goto LABEL_5;
  return result;
}

- (NSString)accessibilityLabel
{
  uint64_t v2;
  void *v3;

  sub_227349A58();
  if (v2)
  {
    v3 = (void *)sub_22758E1B4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)accessibilityHint
{
  _TtC16MagnifierSupport19LensFiltersScrubber *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_227348B98();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_22758E1B4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)accessibilityDecrement
{
  _TtC16MagnifierSupport19LensFiltersScrubber *v2;

  v2 = self;
  sub_227348F54();

}

- (void)accessibilityIncrement
{
  _TtC16MagnifierSupport19LensFiltersScrubber *v2;

  v2 = self;
  sub_2273491C8();

}

@end
