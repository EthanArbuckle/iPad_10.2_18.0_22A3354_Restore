@implementation CalendarViewLayout

+ (Class)layoutAttributesClass
{
  type metadata accessor for CalendarViewLayoutAttributes();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8HealthUI18CalendarViewLayout)initWithCoder:(id)a3
{
  _TtC8HealthUI18CalendarViewLayout *result;

  result = (_TtC8HealthUI18CalendarViewLayout *)sub_1D7B4A890();
  __break(1u);
  return result;
}

- (void)prepareLayout
{
  _TtC8HealthUI18CalendarViewLayout *v2;

  v2 = self;
  sub_1D7B31DA8();

}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC8HealthUI18CalendarViewLayout *v9;
  _BYTE *v10;
  id v11;
  void *v12;
  BOOL v13;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_allocWithZone((Class)type metadata accessor for CalendarLayoutInvalidationContext());
  v9 = self;
  v10 = objc_msgSend(v8, sel_init);
  v11 = -[CalendarViewLayout collectionView](v9, sel_collectionView);
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v11, sel_bounds);
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    v13 = CGRectEqualToRect(v15, v16);

    if (!v13)
      v10[OBJC_IVAR____TtC8HealthUI33CalendarLayoutInvalidationContext_shouldInvalidateAllDecorationViews] = 1;
  }

  return v10;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  _TtC8HealthUI18CalendarViewLayout *v5;

  v4 = a3;
  v5 = self;
  sub_1D7B323C4(v4);

}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC8HealthUI18CalendarViewLayout *v7;
  uint64_t v8;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_1D7B32568(x, y, width, height);

  if (v8)
  {
    sub_1D7B33298();
    v9 = (void *)sub_1D7B4A4A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC8HealthUI18CalendarViewLayout *v12;
  void *v13;
  uint64_t v15;

  v5 = sub_1D7B49474();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1D7B4A3BC();
  v11 = v10;
  sub_1D7B49438();
  v12 = self;
  v13 = (void *)sub_1D7B329C0(v9, v11, (uint64_t)v8);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v13;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

+ (Class)invalidationContextClass
{
  type metadata accessor for CalendarLayoutInvalidationContext();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8HealthUI18CalendarViewLayout)init
{
  _TtC8HealthUI18CalendarViewLayout *result;

  result = (_TtC8HealthUI18CalendarViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC8HealthUI18CalendarViewLayout_calendar;
  v3 = sub_1D7B49300();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end
