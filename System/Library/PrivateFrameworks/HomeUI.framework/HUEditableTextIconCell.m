@implementation HUEditableTextIconCell

- (HFItem)item
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.super.super.super.isa + OBJC_IVAR___HUEditableTextIconCell_item);
  swift_beginAccess();
  return (HFItem *)*v2;
}

- (void)setItem:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.super.super.super.super.isa + OBJC_IVAR___HUEditableTextIconCell_item);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)prepareForReuse
{
  char *v2;
  char *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EditableTextIconCell();
  v2 = (char *)v5.receiver;
  -[HUEditableTextCollectionListCell prepareForReuse](&v5, sel_prepareForReuse);
  v3 = &v2[OBJC_IVAR___HUEditableTextIconCell_displayStyle];
  swift_beginAccess();
  *(_QWORD *)v3 = 1;
  v4 = sub_1B8F6A75C();
  objc_msgSend(v4, sel_updateWithIconDescriptor_displayStyle_animated_, 0, *(_QWORD *)v3, 0);

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  HUEditableTextIconCell *v4;

  v4 = self;
  sub_1B8F6AC48(a3);

}

- (void)updateConstraints
{
  HUEditableTextIconCell *v2;

  v2 = self;
  sub_1B8F6B048();

}

- (HUEditableTextIconCell)initWithFrame:(CGRect)a3
{
  return (HUEditableTextIconCell *)EditableTextIconCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (HUEditableTextIconCell)initWithCoder:(id)a3
{
  return (HUEditableTextIconCell *)EditableTextIconCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUEditableTextIconCell_item));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUEditableTextIconCell____lazy_storage___iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUEditableTextIconCell____lazy_storage___iconContainerView));
  sub_1B8E26870((uint64_t)self + OBJC_IVAR___HUEditableTextIconCell____lazy_storage___iconAccessory, (uint64_t *)&unk_1EF20DFB8);
}

@end
