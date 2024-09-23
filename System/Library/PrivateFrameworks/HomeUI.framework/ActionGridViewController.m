@implementation ActionGridViewController

- (BOOL)allowsEditing
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridConfig;
  swift_beginAccess();
  return v2[16];
}

- (void)setAllowsEditing:(BOOL)a3
{
  _TtC6HomeUI24ActionGridViewController *v4;

  v4 = self;
  sub_1B8FF16EC(a3);

}

- (NSArray)denylistedAccessories
{
  _QWORD *v2;
  void *v3;

  v2 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridConfig);
  swift_beginAccess();
  if (!*v2)
    return (NSArray *)0;
  sub_1B93ECF74();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF20F1C0);
  v3 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setDenylistedAccessories:(id)a3
{
  sub_1B8FF24B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B8FF1994);
}

- (NSArray)allowlistedAccessories
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridConfig;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSArray *)0;
  sub_1B93ECF74();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF20F1C0);
  v3 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setAllowlistedAccessories:(id)a3
{
  sub_1B8FF24B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B8FF1D08);
}

+ (unint64_t)updateMode
{
  return 1;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  _TtC6HomeUI24ActionGridViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1B8FF2998(v4);

  return v6;
}

- (id)tappableAreaForPoint:(CGPoint)a3 inItem:(id)a4 atIndexPath:(id)a5
{
  double y;
  double x;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC6HomeUI24ActionGridViewController *v14;
  __CFString *v15;
  uint64_t v17;

  y = a3.y;
  x = a3.x;
  v9 = sub_1B93EB900();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB8C4();
  v13 = a4;
  v14 = self;
  v15 = sub_1B8FF2AE4(v13, (uint64_t)v12, x, y);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v15;
}

- (void)accessoryControlViewControllerFor:(HFAccessoryRepresentableItem *)a3 tileItem:(HFItem *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  HFAccessoryRepresentableItem *v17;
  HFItem *v18;
  _TtC6HomeUI24ActionGridViewController *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57F900);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_1B93EE090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EF210568;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EF209370;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1B901BAB4((uint64_t)v11, (uint64_t)&unk_1EF20E5B0, (uint64_t)v16);
  swift_release();
}

- (void)configureWithAccessoryControlViewController:(id)a3
{
  id v4;
  _TtC6HomeUI24ActionGridViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1B8FF2FB4(v4);

}

- (BOOL)controlsWantSystemPresentationAnimations
{
  return objc_msgSend((id)objc_opt_self(), sel_isAMac) ^ 1;
}

- (void)willDismissWithViewController:(id)a3
{
  id v4;
  _TtC6HomeUI24ActionGridViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1B8FF4380();

}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginLongPressPresentationWithContext:(id)a4
{
  return 0;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5
{
  double y;
  double x;
  void *v10;
  id v11;
  id v12;
  _TtC6HomeUI24ActionGridViewController *v13;
  id v14;
  char v15;
  BOOL v16;
  id v17;
  id v18;
  _TtC6HomeUI24ActionGridViewController *v19;
  objc_super v21;

  y = a4.y;
  x = a4.x;
  v10 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                 + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModuleController);
  if (!v10)
  {
    v17 = a3;
    v18 = a5;
    v19 = self;
    goto LABEL_5;
  }
  v11 = a3;
  v12 = a5;
  v13 = self;
  v14 = v10;
  v15 = sub_1B8E7A0FC();

  if (v15 == 2)
  {
LABEL_5:
    v21.receiver = self;
    v21.super_class = (Class)type metadata accessor for ActionGridViewController();
    v16 = -[HUControllableItemCollectionViewController presentationCoordinator:shouldBeginInteractivePresentationWithTouchLocation:view:](&v21, sel_presentationCoordinator_shouldBeginInteractivePresentationWithTouchLocation_view_, a3, a5, x, y);

    goto LABEL_6;
  }

  v16 = v15 & 1;
LABEL_6:

  return v16;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginPresentationWithContext:(id)a4
{
  id v6;
  id v7;
  _TtC6HomeUI24ActionGridViewController *v8;
  unsigned __int8 v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1B8FF3450((uint64_t)v6, v7);

  return v9 & 1;
}

- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4
{
  void *v4;
  id v7;
  id v8;
  _TtC6HomeUI24ActionGridViewController *v9;
  id v10;
  char v11;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModuleController);
  if (v4)
  {
    v7 = a3;
    v8 = a4;
    v9 = self;
    v10 = v4;
    v11 = sub_1B8E75FCC(v8);

  }
  else
  {
    v11 = 0;
  }
  return v11 & 1;
}

- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4
{
  void *v4;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v4 = *(void **)((char *)self + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModuleController);
  if (v4)
  {
    v6 = self;
    v7 = a3;
    v8 = a4;
    v9 = v6;
    v10 = v4;
    v11 = (void *)sub_1B8E7634C(v8);

    return v11;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (_TtC6HomeUI24ActionGridViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5;
  id v6;
  _TtC6HomeUI24ActionGridViewController *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC6HomeUI24ActionGridViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)initUsingCompositionalLayoutWithItemManager:(id)a3
{
  id v3;
  id result;

  v3 = a3;
  result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModule));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6HomeUI24ActionGridViewController_actionGridModuleController));
  swift_release();
  swift_release();
}

@end
