@implementation AppEventSearchResultCollectionViewCell

- (_TtC20ProductPageExtension38AppEventSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension38AppEventSearchResultCollectionViewCell *)sub_1001DDB6C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension38AppEventSearchResultCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001DE8A0();
}

- (void)dealloc
{
  void *v2;
  _TtC20ProductPageExtension38AppEventSearchResultCollectionViewCell *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension38AppEventSearchResultCollectionViewCell_appEventTapGestureRecognizer);
  v3 = self;
  objc_msgSend(v2, "removeTarget:action:", v3, 0);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for AppEventSearchResultCollectionViewCell();
  -[AppEventSearchResultCollectionViewCell dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38AppEventSearchResultCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38AppEventSearchResultCollectionViewCell_appEventView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38AppEventSearchResultCollectionViewCell_appEventTapGestureRecognizer));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension38AppEventSearchResultCollectionViewCell_appEventViewTappedAction), *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC20ProductPageExtension38AppEventSearchResultCollectionViewCell_appEventViewTappedAction]);
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension38AppEventSearchResultCollectionViewCell *v2;

  v2 = self;
  sub_1001DDEE8();

}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC20ProductPageExtension38AppEventSearchResultCollectionViewCell *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension38AppEventSearchResultCollectionViewCell_appEventViewTappedAction);
  if (v3)
  {
    v5 = *(_QWORD *)&self->lockupView[OBJC_IVAR____TtC20ProductPageExtension38AppEventSearchResultCollectionViewCell_appEventViewTappedAction];
    v6 = a3;
    v8 = self;
    v7 = sub_100018918((uint64_t)v3, v5);
    v3(v7);
    sub_100018908((uint64_t)v3, v5);

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC20ProductPageExtension38AppEventSearchResultCollectionViewCell *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1001DE99C(v7);

  return v9 & 1;
}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension38AppEventSearchResultCollectionViewCell *v2;

  v2 = self;
  sub_1001DE3EC();

}

- (_TtC20ProductPageExtension21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC20ProductPageExtension21SmallSearchLockupView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension38AppEventSearchResultCollectionViewCell_lockupView);
}

- (_TtC20ProductPageExtension12AppEventView)accessibilityAppEventView
{
  return (_TtC20ProductPageExtension12AppEventView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                             + OBJC_IVAR____TtC20ProductPageExtension38AppEventSearchResultCollectionViewCell_appEventView));
}

@end
