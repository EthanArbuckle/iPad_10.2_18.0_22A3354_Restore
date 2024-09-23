@implementation EditControlsViewController

- (void)viewDidLoad
{
  _TtC16MagnifierSupport26EditControlsViewController *v2;

  v2 = self;
  sub_22740DA68();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MagnifierSupport26EditControlsViewController *v4;

  v4 = self;
  sub_22740DC84(a3);

}

- (void)handleDoneButtonTap:(id)a3
{
  sub_22740EAA8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_22740E5BC);
}

- (void)handleInfoButtonTap:(id)a3
{
  sub_22740EAA8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_22740E8C8);
}

- (_TtC16MagnifierSupport26EditControlsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_22758E1E4();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC16MagnifierSupport26EditControlsViewController *)sub_22740EB1C(v5, v7, a4);
}

- (_TtC16MagnifierSupport26EditControlsViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport26EditControlsViewController *)sub_22740ED40(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport26EditControlsViewController____lazy_storage___activitiesCustomizationViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport26EditControlsViewController____lazy_storage___captureSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport26EditControlsViewController____lazy_storage___detectionModeSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport26EditControlsViewController____lazy_storage___filterCustomizationViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport26EditControlsViewController____lazy_storage___internalDetectionOptionsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport26EditControlsViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport26EditControlsViewController____lazy_storage___dataSource));
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport26EditControlsViewController_delegate);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v5;
  _TtC16MagnifierSupport26EditControlsViewController *v6;

  if (MEMORY[0x2276B3E34]((char *)self + OBJC_IVAR____TtC16MagnifierSupport26EditControlsViewController_delegate, a2))
  {
    v5 = a3;
    v6 = self;
    sub_2275037B4();

    swift_unknownObjectRelease();
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  v4 = sub_22758CAD4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6, v7, v8, v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  return 1;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC16MagnifierSupport26EditControlsViewController *v15;
  int64_t v16;
  uint64_t v18;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  v16 = sub_227410E78(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;

  v4 = sub_22758CAD4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6, v7, v8, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  sub_2273F0454();
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  if (!v13)
    return 0;
  v14 = (void *)sub_22758E1B4();
  swift_bridgeObjectRelease();
  return v14;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  v4 = sub_22758CAD4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6, v7, v8, v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  return 0;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  id v29;
  _TtC16MagnifierSupport26EditControlsViewController *v30;
  void (*v31)(char *, uint64_t);
  void *v32;
  uint64_t v34;

  v7 = sub_22758CAD4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9, v10, v11, v12);
  v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15, v16, v17, v18, v19);
  v21 = (char *)&v34 - v20;
  MEMORY[0x24BDAC7A8](v22, v23, v24, v25, v26);
  v28 = (char *)&v34 - v27;
  sub_22758CA80();
  sub_22758CA80();
  v29 = a3;
  v30 = self;
  sub_22740F28C((uint64_t)v21, (uint64_t)v14, (uint64_t)v28);

  v31 = *(void (**)(char *, uint64_t))(v8 + 8);
  v31(v14, v7);
  v31(v21, v7);
  v32 = (void *)sub_22758CA74();
  v31(v28, v7);
  return v32;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC16MagnifierSupport26EditControlsViewController *v15;
  uint64_t v16;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  sub_22740F72C(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
