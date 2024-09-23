@implementation InternalDetectionOptionsViewController

- (void)viewDidLoad
{
  _TtC16MagnifierSupport38InternalDetectionOptionsViewController *v2;

  v2 = self;
  sub_227532BA0();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = v7.receiver;
  -[InternalDetectionOptionsViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
  v5 = objc_msgSend(v4, sel_navigationItem, v7.receiver, v7.super_class);
  v6 = (void *)sub_22758E1B4();
  objc_msgSend(v5, sel_setTitle_, v6);

}

- (_TtC16MagnifierSupport38InternalDetectionOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport38InternalDetectionOptionsViewController *)sub_227532DF0(v5, v7, a4);
}

- (_TtC16MagnifierSupport38InternalDetectionOptionsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_227536E70();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport38InternalDetectionOptionsViewController_tableView));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport38InternalDetectionOptionsViewController_availableInternalDetectionSections))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC16MagnifierSupport38InternalDetectionOptionsViewController *v7;
  int64_t v8;
  int64_t v9;

  v6 = a3;
  v7 = self;
  sub_22753700C(a4);
  v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
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
  _TtC16MagnifierSupport38InternalDetectionOptionsViewController *v15;
  id v16;
  uint64_t v18;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  v16 = sub_2275331AC(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (void)didToggleRecordingSwitch:(id)a3
{
  id v4;
  _TtC16MagnifierSupport38InternalDetectionOptionsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_227537148(v4);

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)((char *)self
                 + OBJC_IVAR____TtC16MagnifierSupport38InternalDetectionOptionsViewController_availableInternalDetectionSections);
  if (*(_QWORD *)(v4 + 16) <= a4)
  {
    v5 = 0;
    return v5;
  }
  if ((a4 & 0x8000000000000000) == 0)
  {
    sub_227532728(*(_BYTE *)(v4 + a4 + 32));
    v5 = (void *)sub_22758E1B4();
    swift_bridgeObjectRelease();
    return v5;
  }
  __break(1u);
  return self;
}

- (void)didToggleAutomationSwitch:(id)a3
{
  id v4;
  _TtC16MagnifierSupport38InternalDetectionOptionsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_227534EC0(v4, (uint64_t)&unk_24EFAA3B0, (uint64_t)sub_2275378C4, (uint64_t)&block_descriptor_26_0);

}

- (void)didTapPhotoSelector:(id)a3
{
  id v4;
  _TtC16MagnifierSupport38InternalDetectionOptionsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_227534B54(v4);

}

- (void)didToggleFreezeFrameSwitch:(id)a3
{
  id v4;
  _TtC16MagnifierSupport38InternalDetectionOptionsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_227534EC0(v4, (uint64_t)&unk_24EFAA360, (uint64_t)sub_22753787C, (uint64_t)&block_descriptor_20_1);

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
  _TtC16MagnifierSupport38InternalDetectionOptionsViewController *v15;
  uint64_t v16;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  sub_227535314(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

@end
