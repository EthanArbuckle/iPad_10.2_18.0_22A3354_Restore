@implementation iOSLinkAcceleratorCollectionViewController

- (_TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  char *v8;
  uint64_t v9;
  _TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController *result;

  v5 = OBJC_IVAR____TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController_sizingCell;
  type metadata accessor for iOSLinkAcceleratorCollectionViewCell(0);
  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController_dataSource) = 0;
  v8 = (char *)self
     + OBJC_IVAR____TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController_currentSuggestionsContainer;
  v9 = sub_1DD9D1030();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);

  result = (_TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController *)sub_1DD9D2CEC();
  __break(1u);
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void (*v10)(char *);
  id v11;
  _TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController *v12;
  uint64_t v13;

  v6 = sub_1DD9D08BC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD9D0868();
  v10 = *(void (**)(char *))((*MEMORY[0x1E0DEEDD8] & **(_QWORD **)((char *)&self->super.super.super.super.isa
                                                                            + OBJC_IVAR____TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController_linkAcceleratorViewController))
                                      + 0x140);
  v11 = a3;
  v12 = self;
  v10(v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController *result;

  v3 = a3;
  result = (_TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController *result;

  v4 = a4;
  result = (_TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController_linkAcceleratorViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController_sizingCell));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController_dataSource));
  sub_1DD8FF244((uint64_t)self+ OBJC_IVAR____TtC11NotesEditor42iOSLinkAcceleratorCollectionViewController_currentSuggestionsContainer, &qword_1F03F78F0);
}

@end
