@implementation QLRemoteUIHostViewController

- (BOOL)isAvailable
{
  uint64_t v3;
  _TtC9QuickLook28QLRemoteUIHostViewController *v4;
  char v5;

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel);
  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  v4 = self;
  sub_20D5A6684();
  swift_release();
  v5 = *(_BYTE *)(v3 + 17);

  return v5;
}

- (NSUUID)uuid
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC9QuickLook28QLRemoteUIHostViewController *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_20D5A6660();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_20D5934D0((uint64_t)v6);

  v8 = (void *)sub_20D5A663C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v8;
}

- (void)setUuid:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  _TtC9QuickLook28QLRemoteUIHostViewController *v12;
  uint64_t v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA328);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20D5A6660();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D5A6648();
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v6, v10, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  v11 = (char *)self + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___uuid;
  swift_beginAccess();
  v12 = self;
  sub_20D59367C((uint64_t)v6, (uint64_t)v11);
  swift_endAccess();

}

- (_TtC9QuickLook28QLRemoteUIHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_20D5A6AF8();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC9QuickLook28QLRemoteUIHostViewController *)sub_20D593BD4(v5, v7, a4);
}

- (_TtC9QuickLook28QLRemoteUIHostViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  char *v7;
  uint64_t v8;
  _TtC9QuickLook28QLRemoteUIHostViewController *result;

  v5 = OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel;
  type metadata accessor for QLHostRemoteViewModel();
  swift_allocObject();
  v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_20D59009C();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___accessoryViewController) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___uuid;
  v8 = sub_20D5A6660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);

  result = (_TtC9QuickLook28QLRemoteUIHostViewController *)sub_20D5A6E94();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for QLRemoteUIHostViewController();
  v2 = v3.receiver;
  -[QLRemoteUIHostViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_20D5A666C();

}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___accessoryViewController));
  sub_20D57C26C((uint64_t)self + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___uuid, &qword_2549BA328);
}

+ (void)remotePreviewCollectionWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = a1;
  v10 = sub_20D5A6C78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2549BA758;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2549BA760;
  v12[5] = v11;
  sub_20D59F40C((uint64_t)v7, (uint64_t)&unk_2549BA768, (uint64_t)v12);
  swift_release();
}

- (void)toggleDebugView
{
  _TtC9QuickLook28QLRemoteUIHostViewController *v2;

  v2 = self;
  QLRemoteUIHostViewController.toggleDebugView()();

}

- (BOOL)isRemote
{
  return 1;
}

- (void)setAllowInteractiveTransitions:(BOOL)a3
{
  sub_20D59DD5C(self, (uint64_t)a2, a3, (uint64_t)&unk_24C729B50, (uint64_t)&unk_2549BA748, (void (*)(char *, uint64_t, uint64_t))sub_20D592B84);
}

- (id)accessoryView
{
  _TtC9QuickLook28QLRemoteUIHostViewController *v2;
  id v3;
  id v4;
  id result;

  v2 = self;
  v3 = sub_20D5930FC();
  v4 = objc_msgSend(v3, sel_view);

  if (v4)
  {

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setHostApplicationBundleIdentifier:(id)a3
{
  sub_20D59A5EC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_24C729B28, (uint64_t)&unk_2549BA740, (void (*)(char *, uint64_t, _QWORD *))sub_20D5847D0);
}

- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6 fullScreen:(BOOL)a7
{
  _TtC9QuickLook28QLRemoteUIHostViewController *v13;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v13 = self;
  QLRemoteUIHostViewController.configure(withNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:fullScreen:)(a3, a4, (uint64_t)a5, (uint64_t)a6, a7);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6
{
  _TtC9QuickLook28QLRemoteUIHostViewController *v11;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v11 = self;
  QLRemoteUIHostViewController.configure(withNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:)(a3, a4, (uint64_t)a5, (uint64_t)a6);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

- (void)setCurrentPreviewItemIndex:(int64_t)a3 animated:(BOOL)a4
{
  sub_20D59B8A4(self, (uint64_t)a2, a3, a4, (uint64_t)&unk_24C729B00, (uint64_t)&unk_2549BA738);
}

- (void)hostApplicationDidEnterBackground:(BOOL)a3
{
  sub_20D59DD5C(self, (uint64_t)a2, a3, (uint64_t)&unk_24C729AD8, (uint64_t)&unk_2549BA730, (void (*)(char *, uint64_t, uint64_t))sub_20D5847D0);
}

- (void)hostApplicationDidBecomeActive
{
  sub_20D59CB9C(self, (uint64_t)a2, (uint64_t)&unk_24C729AB0, (uint64_t)&unk_2549BA728, (void (*)(char *, uint64_t, _QWORD *))sub_20D5847D0);
}

- (void)toolbarButtonsForTraitCollection:(UITraitCollection *)a3 withCompletionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  UITraitCollection *v15;
  _TtC9QuickLook28QLRemoteUIHostViewController *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_20D5A6C78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2549BA708;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2549BA710;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_20D59F40C((uint64_t)v9, (uint64_t)&unk_2549BA718, (uint64_t)v14);
  swift_release();
}

- (void)toolbarButtonPressedWithIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC9QuickLook28QLRemoteUIHostViewController *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_20D5A6C78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2549BA6E8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2549BA6F0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_20D59F40C((uint64_t)v9, (uint64_t)&unk_2549BA6F8, (uint64_t)v14);
  swift_release();
}

- (void)shouldDisplayLockActivityWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC9QuickLook28QLRemoteUIHostViewController *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_20D5A6C78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2549BA6C8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2549BA6D0;
  v12[5] = v11;
  v13 = self;
  sub_20D59F40C((uint64_t)v7, (uint64_t)&unk_2549BA6D8, (uint64_t)v12);
  swift_release();
}

- (void)requestLockForCurrentItem
{
  sub_20D59CB9C(self, (uint64_t)a2, (uint64_t)&unk_24C729920, (uint64_t)&unk_2549BA6B8, (void (*)(char *, uint64_t, _QWORD *))sub_20D5847D0);
}

- (void)keyCommandsWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC9QuickLook28QLRemoteUIHostViewController *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_20D5A6C78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2549BA698;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2549BA6A0;
  v12[5] = v11;
  v13 = self;
  sub_20D59F40C((uint64_t)v7, (uint64_t)&unk_2549BA6A8, (uint64_t)v12);
  swift_release();
}

- (void)keyCommandWasPerformed:(id)a3
{
  sub_20D59D088(self, (uint64_t)a2, a3, (uint64_t)&unk_24C729880, (uint64_t)&unk_2549BA688, (void (*)(char *, uint64_t, _QWORD *))sub_20D5847D0);
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC9QuickLook28QLRemoteUIHostViewController *v11;
  uint64_t v12;
  id v13;
  _TtC9QuickLook28QLRemoteUIHostViewController *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a3;
  v11 = self;
  sub_20D5A6C60();
  v12 = sub_20D5A6C78();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 0, 1, v12);
  sub_20D5A6C54();
  v13 = v10;
  v14 = v11;
  v15 = sub_20D5A6C48();
  v16 = swift_allocObject();
  v17 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v16 + 16) = v15;
  *(_QWORD *)(v16 + 24) = v17;
  *(_QWORD *)(v16 + 32) = v14;
  *(_QWORD *)(v16 + 40) = v13;
  *(_BYTE *)(v16 + 48) = a4;
  sub_20D5847D0((uint64_t)v9, (uint64_t)&unk_2549BA680, v16);

  swift_release();
}

- (void)notifyFirstTimeAppearanceWithActions:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC9QuickLook28QLRemoteUIHostViewController *v8;
  uint64_t v9;
  _TtC9QuickLook28QLRemoteUIHostViewController *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_20D5A6C60();
  v9 = sub_20D5A6C78();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 0, 1, v9);
  sub_20D5A6C54();
  v10 = v8;
  v11 = sub_20D5A6C48();
  v12 = (_QWORD *)swift_allocObject();
  v13 = MEMORY[0x24BEE6930];
  v12[2] = v11;
  v12[3] = v13;
  v12[4] = v10;
  v12[5] = a3;
  sub_20D5847D0((uint64_t)v7, (uint64_t)&unk_2549BA678, (uint64_t)v12);

  swift_release();
}

- (void)notifyStateRestorationUserInfo:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC9QuickLook28QLRemoteUIHostViewController *v8;
  uint64_t v9;
  _TtC9QuickLook28QLRemoteUIHostViewController *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
    a3 = (id)sub_20D5A6AA4();
  v8 = self;
  sub_20D5A6C60();
  v9 = sub_20D5A6C78();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 0, 1, v9);
  sub_20D5A6C54();
  swift_bridgeObjectRetain();
  v10 = v8;
  v11 = sub_20D5A6C48();
  v12 = (_QWORD *)swift_allocObject();
  v13 = MEMORY[0x24BEE6930];
  v12[2] = v11;
  v12[3] = v13;
  v12[4] = v10;
  v12[5] = a3;
  sub_20D5847D0((uint64_t)v7, (uint64_t)&unk_2549BA670, (uint64_t)v12);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)previewItemDisplayState:(id)a3 wasAppliedToItemAtIndex:(unint64_t)a4
{
  sub_20D59BD2C(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)&unk_24C7297E0, (uint64_t)&unk_2549BA668);
}

- (void)startTransitionWithSourceViewProvider:(QLTransitionContext *)a3 transitionController:(QLTransitionControllerProtocol *)a4 presenting:(BOOL)a5 useInteractiveTransition:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  QLTransitionContext *v21;
  _TtC9QuickLook28QLRemoteUIHostViewController *v22;
  uint64_t v23;

  v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a3;
  *(_QWORD *)(v17 + 24) = a4;
  *(_BYTE *)(v17 + 32) = a5;
  *(_BYTE *)(v17 + 33) = a6;
  *(_QWORD *)(v17 + 40) = v16;
  *(_QWORD *)(v17 + 48) = self;
  v18 = sub_20D5A6C78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_2549BA650;
  v19[5] = v17;
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_2549BA658;
  v20[5] = v19;
  v21 = a3;
  swift_unknownObjectRetain();
  v22 = self;
  sub_20D59F40C((uint64_t)v15, (uint64_t)&unk_2549BA660, (uint64_t)v20);
  swift_release();
}

- (void)tearDownTransition:(BOOL)a3
{
  sub_20D59DD5C(self, (uint64_t)a2, a3, (uint64_t)&unk_24C729740, (uint64_t)&unk_2549BA640, (void (*)(char *, uint64_t, uint64_t))sub_20D5847D0);
}

- (void)setLoadingString:(id)a3
{
  sub_20D59A5EC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_24C729718, (uint64_t)&unk_2549BA638, (void (*)(char *, uint64_t, _QWORD *))sub_20D5847D0);
}

- (void)overrideParentApplicationDisplayIdentifierWithIdentifier:(id)a3
{
  sub_20D59A5EC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_24C7296F0, (uint64_t)&unk_2549BA630, (void (*)(char *, uint64_t, _QWORD *))sub_20D592B84);
}

- (void)preparePreviewCollectionForInvalidationWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC9QuickLook28QLRemoteUIHostViewController *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_20D5A6C78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2549BA618;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2549BA620;
  v12[5] = v11;
  v13 = self;
  sub_20D59F40C((uint64_t)v7, (uint64_t)&unk_2549BA628, (uint64_t)v12);
  swift_release();
}

- (void)invalidateServiceWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC9QuickLook28QLRemoteUIHostViewController *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_20D5A6C78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2549BA5F8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2549BA600;
  v12[5] = v11;
  v13 = self;
  sub_20D59F40C((uint64_t)v7, (uint64_t)&unk_2549BA608, (uint64_t)v12);
  swift_release();
}

- (void)hostViewControlerTransitionToState:(unint64_t)a3 animated:(BOOL)a4
{
  sub_20D59B8A4(self, (uint64_t)a2, a3, a4, (uint64_t)&unk_24C7295D8, (uint64_t)&unk_2549BA5E8);
}

- (void)setPreviewItemDisplayState:(id)a3 onItemAtIndex:(unint64_t)a4
{
  sub_20D59BD2C(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)&unk_24C7295B0, (uint64_t)&unk_2549BA5E0);
}

- (void)prepareForActionSheetPresentationWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC9QuickLook28QLRemoteUIHostViewController *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_20D5A6C78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2549BA5C8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2549BA5D0;
  v12[5] = v11;
  v13 = self;
  sub_20D59F40C((uint64_t)v7, (uint64_t)&unk_2549BA5D8, (uint64_t)v12);
  swift_release();
}

- (void)actionSheetDidDismiss
{
  sub_20D59CB9C(self, (uint64_t)a2, (uint64_t)&unk_24C729510, (uint64_t)&unk_2549BA5B8, (void (*)(char *, uint64_t, _QWORD *))sub_20D5847D0);
}

- (void)documentMenuActionWillBegin
{
  sub_20D59CB9C(self, (uint64_t)a2, (uint64_t)&unk_24C7294E8, (uint64_t)&unk_2549BA5B0, (void (*)(char *, uint64_t, _QWORD *))sub_20D584904);
}

- (void)hostViewControllerBackgroundColorChanged:(id)a3
{
  sub_20D59D088(self, (uint64_t)a2, a3, (uint64_t)&unk_24C7294C0, (uint64_t)&unk_2549BA5A8, (void (*)(char *, uint64_t, _QWORD *))sub_20D584904);
}

- (void)saveIntoPhotoLibraryMediaWithURLWrapper:(id)a3 previewItemType:(unint64_t)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  _TtC9QuickLook28QLRemoteUIHostViewController *v11;

  v8 = _Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_20D57772C;
  }
  else
  {
    v9 = 0;
  }
  v10 = a3;
  v11 = self;
  QLRemoteUIHostViewController.saveIntoPhotoLibraryMedia(with:previewItemType:completionHandler:)(v10, a4, (uint64_t)v8, v9);
  sub_20D57771C((uint64_t)v8);

}

- (void)setIsContentManaged:(BOOL)a3
{
  sub_20D59DD5C(self, (uint64_t)a2, a3, (uint64_t)&unk_24C729470, (uint64_t)&unk_2549BA5A0, (void (*)(char *, uint64_t, uint64_t))sub_20D5847D0);
}

- (void)saveCurrentPreviewEditsSynchronously:(BOOL)a3 withCompletionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC9QuickLook28QLRemoteUIHostViewController *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_BYTE *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(v11 + 32) = self;
  v12 = sub_20D5A6C78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2549BA568;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = asc_2549B86F0;
  v14[5] = v13;
  v15 = self;
  sub_20D59F40C((uint64_t)v9, (uint64_t)&unk_2549B86F8, (uint64_t)v14);
  swift_release();
}

@end
