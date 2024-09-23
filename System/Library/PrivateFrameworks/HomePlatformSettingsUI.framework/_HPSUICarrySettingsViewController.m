@implementation _HPSUICarrySettingsViewController

- (_HPSUICarrySettingsViewController)initWithHomeID:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v3 = sub_224DA3F8C();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_224DA3F80();
  return (_HPSUICarrySettingsViewController *)CarrySettingsViewController.init(withHomeID:)((uint64_t)v5);
}

- (_HPSUICarrySettingsViewController)initWithHomeID:(id)a3 homeKitIdentifiers:(id)a4
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = sub_224DA3F8C();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58];
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_224DA3F80();
  sub_224D9B66C((unint64_t *)&qword_2557DD6B8, v5, MEMORY[0x24BDCEA88]);
  v8 = sub_224DA41F0();
  return (_HPSUICarrySettingsViewController *)CarrySettingsViewController.init(withHomeID:homeKitIdentifiers:)((uint64_t)v7, v8);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = v9.receiver;
  -[_HPSUICarrySettingsViewController viewWillAppear:](&v9, sel_viewWillAppear_, v3);
  v5 = objc_msgSend(v4, sel_navigationController, v9.receiver, v9.super_class);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, sel_navigationBar);

    v8 = objc_msgSend(v7, sel_standardAppearance);
    objc_msgSend(v7, sel_setScrollEdgeAppearance_, v8);

    v4 = v8;
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = v8.receiver;
  -[_HPSUICarrySettingsViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);
  v5 = objc_msgSend(v4, sel_navigationController, v8.receiver, v8.super_class);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, sel_navigationBar);

    objc_msgSend(v7, sel_setScrollEdgeAppearance_, 0);
    v4 = v7;
  }

}

- (_HPSUICarrySettingsViewController)init
{
  _HPSUICarrySettingsViewController *result;

  result = (_HPSUICarrySettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____HPSUICarrySettingsViewController_homeID;
  v3 = sub_224DA3F8C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

+ (void)shouldShowCarrySettingsButtonForHomeID:(id)a3 withCompletion:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = sub_224DA3F8C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  sub_224DA3F80();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  swift_getObjCClassMetadata();
  _s22HomePlatformSettingsUI05CarryC14ViewControllerC010shouldShoweC6Button03forA2ID14withCompletiony10Foundation4UUIDV_ySb_So7NSErrorCSgtYbctFZ_0((uint64_t)v8, (uint64_t)sub_224D9B768, v10);
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

+ (void)shouldShowCarrySettingsButtonForHomeID:(id)a3 homeKitIdentifiers:(id)a4 withCompletion:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_224DA3F8C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a5);
  sub_224DA3F80();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  swift_getObjCClassMetadata();
  _s22HomePlatformSettingsUI05CarryC14ViewControllerC010shouldShoweC6Button03forA2ID14withCompletiony10Foundation4UUIDV_ySb_So7NSErrorCSgtYbctFZ_0((uint64_t)v9, (uint64_t)sub_224D9B52C, v11);
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end
