@implementation LensFreezeFrameScrubber

- (_TtC16MagnifierSupport23LensFreezeFrameScrubber)initWithFrame:(CGRect)a3
{
  return (_TtC16MagnifierSupport23LensFreezeFrameScrubber *)sub_22757710C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MagnifierSupport23LensFreezeFrameScrubber)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22757AE44();
}

- (void)layoutSubviews
{
  _TtC16MagnifierSupport23LensFreezeFrameScrubber *v2;

  v2 = self;
  sub_227579770();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_maskedView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_feedbackGenerator));
  v3 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_activeItemIndexPath;
  v4 = sub_22758CAD4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber____lazy_storage___overlayBox));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_overlayBoxLeadingAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber____lazy_storage___addButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber____lazy_storage___activeItemIndicator));
  swift_release();
}

- (void)didTapScrollView:(id)a3
{
  id v4;
  _TtC16MagnifierSupport23LensFreezeFrameScrubber *v5;

  v4 = a3;
  v5 = self;
  sub_227579ED8(v4);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC16MagnifierSupport23LensFreezeFrameScrubber *v5;

  v4 = a3;
  v5 = self;
  sub_22757A37C(v4);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  id v8;
  void *v9;
  char v10;
  _TtC16MagnifierSupport23LensFreezeFrameScrubber *v11;

  x = a5->x;
  v8 = a3;
  v11 = self;
  v9 = sub_22757A270(x);
  if ((v10 & 1) == 0)
    *(_QWORD *)&a5->x = v9;

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_feedbackGenerator), sel_prepare, a3);
}

- (void)didTapAddButton:(id)a3
{
  _TtC16MagnifierSupport23LensFreezeFrameScrubber *v4;
  _TtC16MagnifierSupport23LensFreezeFrameScrubber *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_22758EAB4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  if (qword_2540B87B8 != -1)
    swift_once();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_22758D1A0();

  sub_22731A1A4((uint64_t)v6, &qword_2540BA340);
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

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  uint64_t v2;
  void *v3;

  sub_22757B048();
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

- (void)accessibilityDecrement
{
  _TtC16MagnifierSupport23LensFreezeFrameScrubber *v2;

  v2 = self;
  sub_22757A6E4();

}

- (void)accessibilityIncrement
{
  _TtC16MagnifierSupport23LensFreezeFrameScrubber *v2;

  v2 = self;
  sub_22757A804();

}

- (id)_accessibilitySupplementaryFooterViews
{
  uint64_t v3;
  _TtC16MagnifierSupport23LensFreezeFrameScrubber *v4;
  id v5;
  void *v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2540BA330);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_227593AB0;
  v4 = self;
  v5 = sub_227576EBC();
  *(_QWORD *)(v3 + 56) = sub_22730BA80(0, &qword_2540BA080);
  *(_QWORD *)(v3 + 32) = v5;

  v6 = (void *)sub_22758E3C4();
  swift_bridgeObjectRelease();
  return v6;
}

@end
