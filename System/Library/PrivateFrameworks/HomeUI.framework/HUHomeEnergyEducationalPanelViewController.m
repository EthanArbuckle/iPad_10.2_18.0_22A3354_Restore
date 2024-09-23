@implementation HUHomeEnergyEducationalPanelViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HomeEnergyEducationalPanelViewController();
  v2 = v3.receiver;
  -[HUHomeEnergyEducationalPanelViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_1B8F2B5D0();
  sub_1B8F2B194();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  objc_class *v8;
  HUHomeEnergyEducationalPanelViewController *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v3 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF209130);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for HomeEnergyEducationalPanelViewController();
  v13.receiver = self;
  v13.super_class = v8;
  v9 = self;
  -[HUHomeEnergyEducationalPanelViewController viewDidAppear:](&v13, sel_viewDidAppear_, v3);
  sub_1B93EB828();
  v10 = sub_1B93EB834();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 0, 1, v10);
  v11 = (uint64_t)v9 + OBJC_IVAR___HUHomeEnergyEducationalPanelViewController_modelInformationSheetStartTime;
  swift_beginAccess();
  sub_1B8F2B7A0((uint64_t)v7, v11);
  swift_endAccess();
  objc_msgSend((id)objc_opt_self(), sel_saveViewVisitEvent_, 49);

}

- (void)viewDidDisappear:(BOOL)a3
{
  HUHomeEnergyEducationalPanelViewController *v4;

  v4 = self;
  sub_1B8F2AE50(a3);

}

- (void)dismissDoneButton
{
  -[HUHomeEnergyEducationalPanelViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (HUHomeEnergyEducationalPanelViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  char *v6;
  uint64_t v7;
  id v8;
  void *v9;
  char *v10;
  uint64_t v11;
  id v12;
  HUHomeEnergyEducationalPanelViewController *v13;
  objc_super v15;

  if (a3)
  {
    sub_1B93EDDB4();
    v6 = (char *)self + OBJC_IVAR___HUHomeEnergyEducationalPanelViewController_modelInformationSheetStartTime;
    v7 = sub_1B93EB834();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
    v8 = a4;
    v9 = (void *)sub_1B93EDD84();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = (char *)self + OBJC_IVAR___HUHomeEnergyEducationalPanelViewController_modelInformationSheetStartTime;
    v11 = sub_1B93EB834();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
    v12 = a4;
    v9 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for HomeEnergyEducationalPanelViewController();
  v13 = -[HUHomeEnergyEducationalPanelViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, v9, a4);

  return v13;
}

- (HUHomeEnergyEducationalPanelViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  objc_super v8;

  v5 = (char *)self + OBJC_IVAR___HUHomeEnergyEducationalPanelViewController_modelInformationSheetStartTime;
  v6 = sub_1B93EB834();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for HomeEnergyEducationalPanelViewController();
  return -[HUHomeEnergyEducationalPanelViewController initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1B8F2B830((uint64_t)self + OBJC_IVAR___HUHomeEnergyEducationalPanelViewController_modelInformationSheetStartTime);
}

@end
