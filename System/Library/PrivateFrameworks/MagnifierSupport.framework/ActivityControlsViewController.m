@implementation ActivityControlsViewController

- (_TtC16MagnifierSupport30ActivityControlsViewController)init
{
  return -[ActivityControlsViewController initWithNibName:bundle:](self, sel_initWithNibName_bundle_, 0, 0);
}

- (_TtC16MagnifierSupport30ActivityControlsViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport30ActivityControlsViewController *)sub_2273E112C(v5, v7, a4);
}

- (_TtC16MagnifierSupport30ActivityControlsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2273F0110();
}

- (void)viewDidLoad
{
  _TtC16MagnifierSupport30ActivityControlsViewController *v2;

  v2 = self;
  sub_2273E4A40();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _TtC16MagnifierSupport30ActivityControlsViewController *v14;
  char *v15;
  objc_super v16;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558D8E00);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16.receiver = self;
  v16.super_class = ObjectType;
  v14 = self;
  -[ActivityControlsViewController viewWillAppear:](&v16, sel_viewWillAppear_, v3);
  objc_msgSend(*(id *)((char *)&v14->super.super.super.isa+ OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController_tableView), sel_setEditing_, 1);
  sub_2273E5254();
  sub_2273E4CAC();
  v15 = sub_2273E1564();
  sub_22758D080();

  sub_2273E3CC8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);

}

- (void)handleDoneButtonTap:(id)a3
{
  _TtC16MagnifierSupport30ActivityControlsViewController *v3;
  _TtC16MagnifierSupport30ActivityControlsViewController *v4;
  _TtC16MagnifierSupport30ActivityControlsViewController *v5;
  _TtC16MagnifierSupport30ActivityControlsViewController *v6;
  _TtC16MagnifierSupport30ActivityControlsViewController *v7;
  id v8;
  __int128 v9;
  __int128 v10;

  v3 = self;
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_22758EAB4();
    swift_unknownObjectRelease();
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v5 = self;
  }
  v6 = (_TtC16MagnifierSupport30ActivityControlsViewController *)-[ActivityControlsViewController navigationController](v3, sel_navigationController, v9, v10);
  if (v6)
  {
    v7 = v6;
    v8 = -[ActivityControlsViewController popViewControllerAnimated:](v6, sel_popViewControllerAnimated_, 1);

    v3 = v7;
  }

  sub_22731A1A4((uint64_t)&v9, &qword_2540BA340);
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, sel_resignFirstResponder);
  return 0;
}

- (void).cxx_destruct
{
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController_activityCreatedDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController____lazy_storage___filtersCollectionCustomizationViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController____lazy_storage___peopleDetectionSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController____lazy_storage___doorDetectionSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController____lazy_storage___objectUnderstandingSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController____lazy_storage___imageCaptionsSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController_languageTranslator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController____lazy_storage___pointSpeakSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController____lazy_storage___textDetectionSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController____lazy_storage___detectionModeUniversalSettingsViewController));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport30ActivityControlsViewController____lazy_storage___dataSource));
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
  _TtC16MagnifierSupport30ActivityControlsViewController *v15;
  int64_t v16;
  uint64_t v18;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  v16 = sub_2273F03F8(v14);

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
  _TtC16MagnifierSupport30ActivityControlsViewController *v30;
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
  sub_2273E63A4((uint64_t)v21, (uint64_t)v14, (uint64_t)v28);

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
  _TtC16MagnifierSupport30ActivityControlsViewController *v15;
  uint64_t v16;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  sub_2273E682C(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
