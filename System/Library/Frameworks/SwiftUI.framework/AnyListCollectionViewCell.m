@implementation AnyListCollectionViewCell

- (_TtC7SwiftUI25AnyListCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(_QWORD *)((char *)&self->super.super.super.super.super._responderFlags
            + OBJC_IVAR____TtC7SwiftUI25AnyListCollectionViewCell_selectionDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)((char *)&self->super.super.super.super.super._responderFlags
            + OBJC_IVAR____TtC7SwiftUI25AnyListCollectionViewCell_insetsDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)((char *)&self->super.super.super.super.super._responderFlags
            + OBJC_IVAR____TtC7SwiftUI25AnyListCollectionViewCell_editMenuDelegate) = 0;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AnyListCollectionViewCell();
  return -[AnyListCollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7SwiftUI25AnyListCollectionViewCell)initWithCoder:(id)a3
{
  objc_super v6;

  *(_QWORD *)((char *)&self->super.super.super.super.super._responderFlags
            + OBJC_IVAR____TtC7SwiftUI25AnyListCollectionViewCell_selectionDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)((char *)&self->super.super.super.super.super._responderFlags
            + OBJC_IVAR____TtC7SwiftUI25AnyListCollectionViewCell_insetsDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)((char *)&self->super.super.super.super.super._responderFlags
            + OBJC_IVAR____TtC7SwiftUI25AnyListCollectionViewCell_editMenuDelegate) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AnyListCollectionViewCell();
  return -[AnyListCollectionViewCell initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI25AnyListCollectionViewCell_selectionDelegate);
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI25AnyListCollectionViewCell_insetsDelegate);
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI25AnyListCollectionViewCell_editMenuDelegate);
}

@end
