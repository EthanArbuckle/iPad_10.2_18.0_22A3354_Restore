@implementation ICTableActionMenu

- (ICTableAttachmentViewController)tableAttachmentViewController
{
  return (ICTableAttachmentViewController *)sub_1DD9366A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICTableActionMenu_tableAttachmentViewController);
}

- (void)setTableAttachmentViewController:(id)a3
{
  sub_1DD936740();
}

- (ICTableActionMenu)initWithTableAttachmentViewController:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 completion:(id)a6
{
  uint64_t (*v9)();
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  ICTableActionMenu *v14;

  v9 = (uint64_t (*)())_Block_copy(a6);
  if (v9)
  {
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v9;
    v9 = sub_1DD95D7AC;
  }
  else
  {
    v10 = 0;
  }
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (ICTableActionMenu *)sub_1DD95D2F8((uint64_t)a3, (uint64_t)v12, a5, (uint64_t)v9, v10);
  sub_1DD8FE450((uint64_t)v9);

  return v14;
}

+ (ICTableActionMenu)menuWithTableAttachmentViewController:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 deferredChildren:(BOOL)a6 completion:(id)a7
{
  uint64_t (*v10)();
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v10 = (uint64_t (*)())_Block_copy(a7);
  if (v10)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v10;
    v10 = sub_1DD95D7AC;
  }
  else
  {
    v11 = 0;
  }
  v12 = objc_allocWithZone((Class)type metadata accessor for TableActionMenu());
  v13 = a3;
  v14 = a4;
  v15 = a5;
  sub_1DD907DC8((uint64_t)v10);
  v16 = sub_1DD95D2F8((uint64_t)a3, (uint64_t)v14, a5, (uint64_t)v10, v11);
  sub_1DD8FE450((uint64_t)v10);
  sub_1DD95D478();
  v17 = (void *)sub_1DD9D0E08();

  sub_1DD8FE450((uint64_t)v10);
  return (ICTableActionMenu *)v17;
}

+ (ICTableActionMenu)menuWithTableAttachmentViewController:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 completion:(id)a6
{
  uint64_t (*v9)();
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v9 = (uint64_t (*)())_Block_copy(a6);
  if (v9)
  {
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v9;
    v9 = sub_1DD95D7AC;
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_allocWithZone((Class)type metadata accessor for TableActionMenu());
  v12 = a3;
  v13 = a4;
  v14 = a5;
  sub_1DD907DC8((uint64_t)v9);
  v15 = sub_1DD95D2F8((uint64_t)a3, (uint64_t)v13, a5, (uint64_t)v9, v10);
  sub_1DD8FE450((uint64_t)v9);
  sub_1DD95D478();
  v16 = (void *)sub_1DD9D0E08();

  sub_1DD8FE450((uint64_t)v9);
  return (ICTableActionMenu *)v16;
}

- (id)completion
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ICTableActionMenu_completion);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1DD93A314;
  aBlock[3] = &block_descriptor_27_0;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setCompletion:(id)a3
{
  uint64_t (*v4)();
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = (uint64_t (*)())_Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1DD95D7AC;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___ICTableActionMenu_completion);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1DD8FE450(v7);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)sub_1DD9366A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICTableActionMenu_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  sub_1DD936740();
}

- (UIBarButtonItem)presentingBarButtonItem
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___ICTableActionMenu_presentingBarButtonItem);
  swift_beginAccess();
  return (UIBarButtonItem *)*v2;
}

- (void)setPresentingBarButtonItem:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___ICTableActionMenu_presentingBarButtonItem);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (id)menuSections
{
  uint64_t v3;
  ICTableActionMenu *v4;
  void *v5;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDBFA2F0);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1DD9E8B80;
  v4 = self;
  *(_QWORD *)(v3 + 32) = sub_1DD95C514();
  sub_1DD9D22C0();

  sub_1DD95D74C();
  v5 = (void *)sub_1DD9D229C();
  swift_bridgeObjectRelease();
  return v5;
}

- (id)makeMenu
{
  ICTableActionMenu *v3;
  void *v4;

  type metadata accessor for TableActionMenu();
  sub_1DD95D478();
  v3 = self;
  v4 = (void *)sub_1DD9D0E08();

  return v4;
}

- (ICTableActionMenu)init
{
  ICTableActionMenu *result;

  result = (ICTableActionMenu *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_1DD8FE450(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICTableActionMenu_completion));
  swift_unknownObjectWeakDestroy();

}

@end
