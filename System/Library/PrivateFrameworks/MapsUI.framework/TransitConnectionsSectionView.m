@implementation TransitConnectionsSectionView

- (_TtC6MapsUI29TransitConnectionsSectionView)initWithShowsSeparators:(BOOL)a3
{
  _BOOL8 v3;
  _TtC6MapsUI29TransitConnectionsSectionView *v5;
  objc_super v7;

  v3 = a3;
  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC6MapsUI29TransitConnectionsSectionView_connectionsDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI29TransitConnectionsSectionView_connectionViewModels) = (Class)MEMORY[0x1E0DEE9D8];
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TransitConnectionsSectionView();
  v5 = -[MUPlaceVerticalCardContainerView initWithShowsSeparators:](&v7, sel_initWithShowsSeparators_, v3);
  -[MUPlaceVerticalCardContainerView setDelegate:](v5, sel_setDelegate_, v5);
  return v5;
}

- (_TtC6MapsUI29TransitConnectionsSectionView)initWithConfiguration:(id)a3
{
  id v5;
  _TtC6MapsUI29TransitConnectionsSectionView *v6;
  objc_super v8;

  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC6MapsUI29TransitConnectionsSectionView_connectionsDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI29TransitConnectionsSectionView_connectionViewModels) = (Class)MEMORY[0x1E0DEE9D8];
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TransitConnectionsSectionView();
  v5 = a3;
  v6 = -[MUPlaceVerticalCardContainerView initWithConfiguration:](&v8, sel_initWithConfiguration_, v5);
  -[MUPlaceVerticalCardContainerView setDelegate:](v6, sel_setDelegate_, v6, v8.receiver, v8.super_class);

  return v6;
}

- (_TtC6MapsUI29TransitConnectionsSectionView)initWithCoder:(id)a3
{
  id v5;
  _TtC6MapsUI29TransitConnectionsSectionView *result;

  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC6MapsUI29TransitConnectionsSectionView_connectionsDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI29TransitConnectionsSectionView_connectionViewModels) = (Class)MEMORY[0x1E0DEE9D8];
  v5 = a3;

  result = (_TtC6MapsUI29TransitConnectionsSectionView *)sub_191EEB2C0();
  __break(1u);
  return result;
}

- (_TtC6MapsUI29TransitConnectionsSectionView)initWithFrame:(CGRect)a3
{
  _TtC6MapsUI29TransitConnectionsSectionView *result;

  result = (_TtC6MapsUI29TransitConnectionsSectionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_191DBE818((uint64_t)self + OBJC_IVAR____TtC6MapsUI29TransitConnectionsSectionView_connectionsDelegate);
  swift_bridgeObjectRelease();
}

- (void)verticalCardContainerView:(id)a3 didSelectRow:(id)a4 atIndex:(int64_t)a5
{
  id v7;
  id v8;
  _TtC6MapsUI29TransitConnectionsSectionView *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_191DCAADC(v8);

}

- (BOOL)verticalCardContainerView:(id)a3 shouldHighlightRowAtIndex:(int64_t)a4
{
  return 1;
}

@end
