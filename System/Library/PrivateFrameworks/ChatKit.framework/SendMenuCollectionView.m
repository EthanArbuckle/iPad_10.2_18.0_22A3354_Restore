@implementation SendMenuCollectionView

- (void)safeAreaInsetsDidChange
{
  char *v2;
  char *v3;
  uint64_t v4;
  uint64_t ObjectType;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SendMenuCollectionView();
  v2 = (char *)v6.receiver;
  -[SendMenuCollectionView safeAreaInsetsDidChange](&v6, sel_safeAreaInsetsDidChange);
  v3 = &v2[OBJC_IVAR____TtC7ChatKit22SendMenuCollectionView_sendMenuCollectionViewDelegate];
  swift_beginAccess();
  if (MEMORY[0x193FF501C](v3))
  {
    v4 = *((_QWORD *)v3 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 8))(v2, ObjectType, v4);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (_TtC7ChatKit22SendMenuCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC7ChatKit22SendMenuCollectionView_sendMenuCollectionViewDelegate) = 0;
  swift_unknownObjectWeakInit();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SendMenuCollectionView();
  return -[SendMenuCollectionView initWithFrame:collectionViewLayout:](&v11, sel_initWithFrame_collectionViewLayout_, a4, x, y, width, height);
}

- (_TtC7ChatKit22SendMenuCollectionView)initWithCoder:(id)a3
{
  objc_super v6;

  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC7ChatKit22SendMenuCollectionView_sendMenuCollectionViewDelegate) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SendMenuCollectionView();
  return -[SendMenuCollectionView initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit22SendMenuCollectionView_sendMenuCollectionViewDelegate);
}

@end
