@implementation UICollectionViewListCoordinatorBaseBase

- (_TtC7SwiftUI39UICollectionViewListCoordinatorBaseBase)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC7SwiftUI39UICollectionViewListCoordinatorBaseBase_backgroundColor) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UICollectionViewListCoordinatorBaseBase();
  return -[PlatformViewCoordinator init](&v3, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI39UICollectionViewListCoordinatorBaseBase_backgroundColor));
}

@end
