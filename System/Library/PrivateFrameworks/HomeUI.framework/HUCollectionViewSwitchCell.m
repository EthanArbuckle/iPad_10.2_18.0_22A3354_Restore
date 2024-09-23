@implementation HUCollectionViewSwitchCell

- (HFItem)item
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.super.super.isa
            + OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell_item);
  swift_beginAccess();
  return (HFItem *)*v2;
}

- (void)setItem:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell_item);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (BOOL)isDisabled
{
  return *((_BYTE *)&self->super.super.super.super.super.super.isa
         + OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell__disabled);
}

- (void)setDisabled:(BOOL)a3
{
  _TtC6HomeUI26HUCollectionViewSwitchCell *v3;

  if (*((_BYTE *)&self->super.super.super.super.super.super.isa
       + OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell__disabled) != a3)
  {
    *((_BYTE *)&self->super.super.super.super.super.super.isa
    + OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell__disabled) = a3;
    v3 = self;
    sub_1B8FBF128(0);

  }
}

- (_TtP6HomeUI34HUCollectionViewSwitchCellDelegate_)delegate
{
  swift_beginAccess();
  return (_TtP6HomeUI34HUCollectionViewSwitchCellDelegate_ *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.super.super.super.isa
            + OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (id)isSelected
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)type metadata accessor for HUCollectionViewSwitchCell();
  return objc_msgSendSuper2(&v2, sel_isSelected);
}

- (_TtC6HomeUI26HUCollectionViewSwitchCell)initWithFrame:(CGRect)a3
{
  return (_TtC6HomeUI26HUCollectionViewSwitchCell *)HUCollectionViewSwitchCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6HomeUI26HUCollectionViewSwitchCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC6HomeUI26HUCollectionViewSwitchCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell_item) = 0;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell__disabled) = 0;
  v5 = OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell_switchView;
  v6 = objc_allocWithZone(MEMORY[0x1E0CEAA38]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell_delegate) = 0;

  result = (_TtC6HomeUI26HUCollectionViewSwitchCell *)sub_1B93EE9CC();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  _BYTE *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HUCollectionViewSwitchCell();
  v2 = v3.receiver;
  -[HUCollectionViewSwitchCell prepareForReuse](&v3, sel_prepareForReuse);
  if (v2[OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell__disabled] == 1)
  {
    v2[OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell__disabled] = 0;
    sub_1B8FBF128(0);
  }

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  _BOOL4 v3;
  _TtC6HomeUI26HUCollectionViewSwitchCell *v4;

  v3 = a3;
  v4 = self;
  sub_1B8FBF128(v3);

}

- (void)_toggleOn
{
  _TtC6HomeUI26HUCollectionViewSwitchCell *v2;

  v2 = self;
  sub_1B8FBF594();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell_item));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6HomeUI26HUCollectionViewSwitchCell_switchView));
  swift_unknownObjectRelease();
}

@end
